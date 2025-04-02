Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ACA78CBA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50E710E705;
	Wed,  2 Apr 2025 10:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="CB7a691N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBB710E6FF;
 Wed,  2 Apr 2025 10:58:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZSMKh2bqrz9tMd;
 Wed,  2 Apr 2025 12:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1743591496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KT/ddkRLVi3HtipsZuPObhEqKwFzkqykktUm7wM9pdk=;
 b=CB7a691N01/Qg48bnDIO4M/rLGryOrF8G4W99dZct/5iE+5aXhInyVo48rtPhvIO9Y88pZ
 JTdrduOq1IvxZy99Liv8qKVgY3QXkGTiWAJQ4s+O0nz23QFVyOAWV253R3xOY6fk2MS9mb
 nHusxqQSIohgZ4CgQol3f7yh6VZ3g9aDc9TIyZRkmCUFPrSVqKyxdOM8Pd+00G9UCToojd
 2bMqT4xBPXLKr+NvvsIuAW52TPVDuxFP6byjyTPqm64g+ymCAMUYifmO+gT1J4cxJeD8Cm
 C8eDJRFcmTKoSC806oKONAR3KLc+vQrEIZO6olkL6nvaVvSnNioLW+vutp8Qdw==
Message-ID: <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
Date: Wed, 2 Apr 2025 12:58:13 +0200
MIME-Version: 1.0
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7b7c5b81013a6b91c09
X-MBO-RS-META: ec4j8j1sj9fiozkeomj9tx7srp4ep4t1
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-04-02 12:46, Philipp Stanner wrote:
> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>> Round-robin being the non-default policy and unclear how much it is
>> used,
>> we can notice that it can be implemented using the FIFO data
>> structures if
>> we only invent a fake submit timestamp which is monotonically
>> increasing
>> inside drm_sched_rq instances.
>>
>> So instead of remembering which was the last entity the scheduler
>> worker
>> picked, we can bump the picked one to the bottom of the tree,
>> achieving
>> the same round-robin behaviour.
>>
>> Advantage is that we can consolidate to a single code path and remove
>> a
>> bunch of code. Downside is round-robin mode now needs to lock on the
>> job
>> pop path but that should not be visible.
> 
> Why did you decide to do it that way and then later remove RR & FIFO
> alltogether in patch 10, basically?
> 
> I think the far cleaner way for our development-process would be a
> separate patch(-series) that *removes* RR completely. Advantages are:
> 
>    1. It should be relatively easy to do
>    2. It would simplify the existing code base independently of what
>       happens with your RFC series here
>    3. Before changing everyone's scheduling policy to a completely new,
>       deadline-based one, we could first be sure for a few release
>       cycles that everyone is now on FIFO, establishing common ground.
>    4. We could CC every- and anyone who might use RR or might know
>       someone who does
>    5. If it turns out we screwed up and someone really relies on RR, it
>       would be easy to revert.
> 
> I am not aware of any RR users and have, in past discussions, never
> heard of any. So removing it is more tempting for the above reasons.

https://gitlab.freedesktop.org/drm/amd/-/issues/2516 has a bunch of RR users...


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
