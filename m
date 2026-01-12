Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB26D11ED5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFE410E353;
	Mon, 12 Jan 2026 10:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="imPTsm1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987A510E353;
 Mon, 12 Jan 2026 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/dhTYA4EhZ3u5upG1mWmBqfUN7+6rWCY9Sa/F85Alas=; b=imPTsm1GUThOAbRq22yfTEGXIH
 uRXwCiNJN8rxFAO/c8lm7Tctim78EfSxV4mQ/wu07Mt6dWu5Cd3IDCzsc/SYtErgFRSARQhwxxa3K
 A7lL/3DLr12dTfPYkxEUj98aQfO4WL8NQeUju+iegkIbj4CYALWsYglk0pM2+wzhZh+gHhegVVP4X
 sQBWmv/OwC1434sNYGZlPtX6buHk+T3QwQtmVd9UKcje90egXJIJa0PaEJ04EvI0yiGONM6IINi3C
 M0JEANKgqz5tdGSdx3dQUfVSybOu+Y0l0o+3hLwySBAw7M2MevUWTphrv4PZkrcxnd1lSkLbMNMIE
 j43m44VA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vfFGn-004M7p-J4; Mon, 12 Jan 2026 11:35:33 +0100
Message-ID: <dfb07120-5abb-431e-9906-5630609954dd@igalia.com>
Date: Mon, 12 Jan 2026 10:35:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
 <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
 <a51103108eaa84134591c8321c6a70a484daed2b.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <a51103108eaa84134591c8321c6a70a484daed2b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 09/01/2026 14:48, Philipp Stanner wrote:
> On Fri, 2026-01-09 at 14:06 +0000, Tvrtko Ursulin wrote:

8><

>> Back to the point - this patch can wait, no problem. To explain the
>> context though.
>>
>> I wanted to get rid of looking at the list_empty here because I have a
>> branch which improves the flow for the 1:1 sched:entity drivers.
>>
>> Why are the two related? If you remember in the fair scheduler series
>> all the run-queue stuff is nicely grouped in sched_rq.c and encapsulated
>> in the rq API, which made it possible to follow up with virtualizing the
>> rq operations.
>>
>> The yet another relevant thing is the patch I sent this week which
>> removes the special case where entity can be initialized with no schedulers.
>>
>> If we combined all these three pre-requisites, my branch allows the
>> fully invariant sched:entity and 1:1:1 sched:rq:entity. Run-queue vfuncs
> 
> Hm, wouldn't the CFS series annihilate multiple RQs anyways? This
> sounds as if there are several series' floating around, cleaning up
> similar things.

Yes and no. Yes, the CFS series makes sched:rq 1:1. No, the other series 
is not overlapping but is adding on top of CFS.

It establishes runtime invariant sched:entity relationship for 1:1 
users. And by making run-queue operation vfuncs dependant on M:N vs 1:1 
scheduler usage, the latter removes the need for 1:1 to manage the 
rbtree, the entity list, and probably some other simplifications which I 
forget from the top of my head. It kind of tries to start working in the 
direction of splitting the frontend and "backend" of the scheduler 
better for those two different use cases.

Regards,

Tvrtko

