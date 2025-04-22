Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0077A96892
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32E810E57D;
	Tue, 22 Apr 2025 12:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Clt69X4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62BB10E57B;
 Tue, 22 Apr 2025 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pO73h8a5yU3MHoxFnTvNM2Bll/ZgvIWUqEybNksKBk8=; b=Clt69X4sCJt/zHfMRFj2L2x1wI
 h4PscwIgVDKvh4VN35EaABe14A1yP6lENsgnP48xzHB69dg5wmjoI7Ccf+MP12aD9o3t5NXubEQCP
 OVVfqWlIBByQm3i75xOrnMJ0EiG+WjocbFvRzTlG7B16Mgk4F9o6guAijFZwOcNTrhXr8zZdUIo4Y
 /EpvuOkN23qxPuya27EhfkyKErJ8UCgsmjhUJA2z7u5nPzpIuwcxM7RkmO3e+LCORdUsO6QEka2kW
 nPTbB2y32486hE8uaP7Y+B1puXZrE1j4D1m6nn+29e8Ejb80HGIi6tRnZ8Ck2oUgyUYe5n/iwlpaA
 tf6BmOeA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7CPk-006QcG-98; Tue, 22 Apr 2025 14:07:48 +0200
Message-ID: <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
Date: Tue, 22 Apr 2025 13:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aAd54jUwBwgc-_g2@cassiopeiae>
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


On 22/04/2025 12:13, Danilo Krummrich wrote:
> On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
>> Question I raised is if there are other drivers which manage to clean up
>> everything correctly (like the mock scheduler does), but trigger that
>> warning. Maybe there are not and maybe mock scheduler is the only false
>> positive.
> 
> So far the scheduler simply does not give any guideline on how to address the
> problem, hence every driver simply does something (or nothing, effectively
> ignoring the problem). This is what we want to fix.
> 
> The mock scheduler keeps it's own list of pending jobs and on tear down stops
> the scheduler's workqueues, traverses it's own list and eventually frees the
> pending jobs without updating the scheduler's internal pending list.
> 
> So yes, it does avoid memory leaks, but it also leaves the schedulers internal
> structures with an invalid state, i.e. the pending list of the scheduler has
> pointers to already freed memory.
> 
> What if the drm_sched_fini() starts touching the pending list? Then you'd end up
> with UAF bugs with this implementation. We cannot invalidate the schedulers
> internal structures and yet call scheduler functions - e.g. drm_sched_fini() -
> subsequently.
> 
> Hence, the current implementation of the mock scheduler is fundamentally flawed.
> And so would be *every* driver that still has entries within the scheduler's
> pending list.
> 
> This is not a false positive, it already caught a real bug -- in the mock
> scheduler.

To avoid furher splitting hairs on whether real bugs need to be able to 
manifest or not, lets move past this with a conclusion that there are 
two potential things to do here:

First one is to either send separately or include in this series 
something like:

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c 
b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..7c4df0e890ac 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -300,6 +300,8 @@ void drm_mock_sched_fini(struct drm_mock_scheduler 
*sched)
                 drm_mock_sched_job_complete(job);
         spin_unlock_irqrestore(&sched->lock, flags);

+       drm_sched_fini(&sched->base);
+
         /*
          * Free completed jobs and jobs not yet processed by the DRM 
scheduler
          * free worker.
@@ -311,8 +313,6 @@ void drm_mock_sched_fini(struct drm_mock_scheduler 
*sched)

         list_for_each_entry_safe(job, next, &list, link)
                 mock_sched_free_job(&job->base);
-
-       drm_sched_fini(&sched->base);
  }

  /**

That should satisfy the requirement to "clear" memory about to be freed 
and be 100% compliant with drm_sched_fini() kerneldoc (guideline b).

But the new warning from 3/5 here will still be there AFAICT and would 
you then agree it is a false positive?

Secondly, the series should modify all drivers (including the unit 
tests) which are known to trigger this false positive.

Regards,

Tvrtko

