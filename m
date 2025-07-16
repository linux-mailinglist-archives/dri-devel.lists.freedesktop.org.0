Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE6B07617
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C468010E287;
	Wed, 16 Jul 2025 12:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rVrwrhB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148D110E287
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4lPG/2CMIAo1npkEyEOnjn7iNkpSk9O9WeKvXaQipak=; b=rVrwrhB7lI7DDum22Lh2Wqgcpb
 eIDllJA0vxG6ornMlP1xMNlnllRPTBtmY+oqkbbJk6yN7bkH0J6DivZCfysQX19zOKIB9Sq+xTj+j
 9SOHk2oEdy0d/ZAg4nctxMU9cruRj/zAj71DGA7qEAxG9NdGdV7RobeG53v7aftF9qrQHnIOspqAh
 gxMgiZfohn8HERh4TY95eDQMP7kfnzpY10sbdL9afpJ7urn3OL53tqPrrfvYNcmU86Zc1dLx9jMlT
 C3cHaPoDpGEJe261EblhIzWs5ogqOaTjn4TRAd0Kv7Jq6JQMBwtF+Xk1fpZVAFuus3WgOkm7Vgrpr
 uArd4itA==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uc1Xn-00HJhF-2y; Wed, 16 Jul 2025 14:47:31 +0200
Message-ID: <629ab61a-ee69-43cd-a05e-b8d262cc0a51@igalia.com>
Date: Wed, 16 Jul 2025 09:47:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>
References: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

On 16/07/25 05:48, Tvrtko Ursulin wrote:
> The "skip reset" test waits for the timeout handler to run for the
> duration of 2 * MOCK_TIMEOUT, and because the mock scheduler opted to

Would it make any sense to wait for 1.5 * MOCK_TIMEOUT? This way we
would guarantee that only one timeout happened. I'm fine with the
current solution as well.

> remove the "skip reset" flag once it fires, this gives opportunity for the
> timeout handler to run twice. Second time the job will be removed from the
> mock scheduler job list and the drm_mock_sched_advance() call in the test
> will fail.
> 
> Fix it by making the "don't reset" flag persist for the lifetime of the
> job and add a new flag to verify that the code path had executed as
> expected.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 1472e7549f84 ("drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG")
 > Cc: Maíra Canal <mcanal@igalia.com>> Cc: Philipp Stanner 
<phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
>   drivers/gpu/drm/scheduler/tests/sched_tests.h    | 7 ++++---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c    | 4 ++--
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 65acffc3fea8..8e9ae7d980eb 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -219,7 +219,7 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   	unsigned long flags;
>   
>   	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
> -		job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;
> +		job->flags |= DRM_MOCK_SCHED_JOB_RESET_SKIPPED;
>   		return DRM_GPU_SCHED_STAT_NO_HANG;
>   	}
>   
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 63d4f2ac7074..5b262126b776 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -95,9 +95,10 @@ struct drm_mock_sched_job {
>   
>   	struct completion	done;
>   
> -#define DRM_MOCK_SCHED_JOB_DONE		0x1
> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> -#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
> +#define DRM_MOCK_SCHED_JOB_DONE			0x1
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT		0x2
> +#define DRM_MOCK_SCHED_JOB_DONT_RESET		0x4
> +#define DRM_MOCK_SCHED_JOB_RESET_SKIPPED	0x8
>   	unsigned long		flags;
>   
>   	struct list_head	link;
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 55eb142bd7c5..82a41a456b0a 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -317,8 +317,8 @@ static void drm_sched_skip_reset(struct kunit *test)
>   	KUNIT_ASSERT_FALSE(test, done);
>   
>   	KUNIT_ASSERT_EQ(test,
> -			job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
> -			0);
> +			job->flags & DRM_MOCK_SCHED_JOB_RESET_SKIPPED,
> +			DRM_MOCK_SCHED_JOB_RESET_SKIPPED);

Maybe we could assert that job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT == 0

Anyway, thanks for the fix!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>   
>   	i = drm_mock_sched_advance(sched, 1);
>   	KUNIT_ASSERT_EQ(test, i, 1);

