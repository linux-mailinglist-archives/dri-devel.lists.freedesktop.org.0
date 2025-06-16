Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E50ADB093
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC9E10E0A1;
	Mon, 16 Jun 2025 12:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EiFM4CND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2D10E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIkFfeMbzZxfXsdFYX5mejSvBGxyoEn4a8get3UI44E=; b=EiFM4CND85ctD5Q49w0JEdueIH
 rSSCv+SgAO6+hr/wNTzZIxpcg82zzmqaHJ6kpIVhFQuXiafDzCnXDCjISvhcZtWd0zcN243Udeku3
 KBhBhsfJpCBw9MPKR/r497GPjhfxhcWDUFQ9q9wEq1UfpTV5Gt308wNWTPBbTnzONT6ZPsYby3EG5
 y/C2PUJSRnp+QL9nvjVyacXpluIm16surIfpvUeIAB7k5ccVbPBzwi+o5o2P18mPiW2zfa8o2jwmF
 fzg7ZjBSJ+nuuf9o/r59qvnBqQesfPC842g8wrhzPi8fcr1pFRtJBq82SJ+99zULXtuWPRQYMDsI/
 IzYXpy/w==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uR9Hd-0047Wr-O1; Mon, 16 Jun 2025 14:49:54 +0200
Message-ID: <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
Date: Mon, 16 Jun 2025 09:49:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better role
 model
To: Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com> <aE_8lDuMFFhJBeUY@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <aE_8lDuMFFhJBeUY@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Danilo,

On 16/06/25 08:14, Danilo Krummrich wrote:
> On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
>> Code looks fine, but currently nothing is broken and I disagree with the
>> goal that the _mock_^1 components should be role models. The idea is to
>> implement as little in the mock components as it is required to exercise the
>> tested functionality.
> 
> No, please consider the following.
> 
>    1) When we write tests for common infrastructure we should be testing things
>       as close as possible to how we intend real code to use this infrastructure.
>       Relying on internals in creative ways is likely to underrun this testing.

Regarding unit testing (and KUnit is a unit testing framework), the core
principle is that individual components of the code should be tested in
isolation to validate that they perform as expected.

The "units" should be tested independently and we use those mocks to
simulate dependencies, ensuring that the test focuses solely on the unit
under scrutiny.

If we introduce more things into the mock, we end up losing the
isolation. The mock scheduler, from what I understand, is not suppose to
be a reference design or even something close to a driver.  It should
remain just a mock, a minimal interface to test the scheduler's
internals.

Best Regards,
- Maíra

> 
>    2) Being close to a reference design is a good thing, why wouldn't we want
>       that? The reality is that people *will* look at this code for reference.
> 
>> Also, there are various ways drivers use the scheduler API. Trying to make
>> the mock scheduler a reference driver implementation would only be able to
>> make it a reference for one possible use.
> 
> Why? Nothing prevents us from covering all of them eventually.
> 
> If for now, we just implement one of them, that's better than none, so why not?

