Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA9ACAB2D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035110E4D7;
	Mon,  2 Jun 2025 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K4Y/D8Xz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3FA10E4D6;
 Mon,  2 Jun 2025 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5iby8XYqaEcAItEkbRF2LO0ixU/PQmrd5oCRUkNHpM=; b=K4Y/D8XzP37ZUD3jB7LriyjGLq
 Ewsi3HETC+fFSVb4gfPWkrK+vblY/c9MZlasqoDgEunpkujgJFNBLzafQMPolvJGB5r7L5NA3V/44
 tMwf+vTk6VuyCIqLUuNGoXWlAQLV882dnrhKKyFyYoQr0zC+XP+13xIwN6KWJEFbAPsx8oHl/Ucqg
 hb8DaXc/rao/vWgyzXDc1SIMrr3lIb7DAu6Efu7WjJ8DuH5snfh7zH1+cqhyaKgI40nldJPs/ZkE5
 qJPS/YUi3qnu9u2QgOLnOBakUaiGYSPIACC21TWwAaJ5kLppkEwkkoLcj4IB3eZUlMuM+n9G3zDVr
 gzaOOBNQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM17K-00GDbV-Fi; Mon, 02 Jun 2025 11:06:02 +0200
Message-ID: <8a621f9e-0fc7-431d-925d-f6e1d0928516@igalia.com>
Date: Mon, 2 Jun 2025 10:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/sched: Reduce scheduler's timeout for timeout
 tests
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-3-c40a8d2d8daa@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-3-c40a8d2d8daa@igalia.com>
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


On 30/05/2025 15:01, Maíra Canal wrote:
> As more KUnit tests are introduced to evaluate the basic capabilities of
> the `timedout_job()` hook, the test suite will continue to increase in
> duration. To reduce the overall running time of the test suite, decrease
> the scheduler's timeout for the timeout tests.
> 
> Before this commit:
> 
> [15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s building, 5.229s running
> 
> After this commit:
> 
> [15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s building, 4.037s running
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594c6246f02608f07fcb1f8d738ac75..41c648782f4548e202bd8711b45d28eead9bd0b2 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -5,6 +5,8 @@
>   
>   #include "sched_tests.h"
>   
> +#define MOCK_TIMEOUT (HZ / 5)
> +
>   /*
>    * DRM scheduler basic tests should check the basic functional correctness of
>    * the scheduler, including some very light smoke testing. More targeted tests,
> @@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit *test)
>   
>   static int drm_sched_timeout_init(struct kunit *test)
>   {
> -	test->priv = drm_mock_sched_new(test, HZ);
> +	test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
>   
>   	return 0;
>   }
> @@ -227,14 +229,14 @@ static void drm_sched_basic_timeout(struct kunit *test)
>   	done = drm_mock_sched_job_wait_scheduled(job, HZ);
>   	KUNIT_ASSERT_TRUE(test, done);
>   
> -	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT / 2);
>   	KUNIT_ASSERT_FALSE(test, done);
>   
>   	KUNIT_ASSERT_EQ(test,
>   			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>   			0);
>   
> -	done = drm_mock_sched_job_wait_finished(job, HZ);
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
>   	KUNIT_ASSERT_FALSE(test, done);

Thinking about the potential for false negatives - scheduler timeout is 
set to 200ms and total wait is 300ms before checking if the timeout hook 
was executed by the scheduler core. So false negative only if scheduler 
core would be lax with the timed out work handling. Or the lax delayed 
work mechanism. Probably fine until we learn otherwise.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   
>   	KUNIT_ASSERT_EQ(test,
> 

