Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D591AFB724
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284310E4CE;
	Mon,  7 Jul 2025 15:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hhtprq5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEE410E326;
 Mon,  7 Jul 2025 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zq2+ThBa+lAaOI5QZ1x0KzDEfrFEgq2eWz6RBj1v4QA=; b=Hhtprq5EbhIkcc473r6XI9FsIt
 HPcAgrYA2Xhl9aRlTYSrPcW5cn0+koJvrV7aIWpDBxzSEUcavfOdvUiMIsOYZZh+qlq4e5qEUM14A
 19h6waJK7mSkuNbH8PaPbQB9LpHZrqXpAkIEwxW+YSs37lR6LPWQqJ9I1ffA+Qkky56dsxFVago2S
 P8iceOHi56MH9KiHUSX9rMxsvgtMnScTyclY1DwxeeEOu7M9lZT2dhkZyC6BQQqWmuJovlZuyasfv
 AV2lESv+GF/JqcRn+LGiojiVinT0Bace7NC4JIG5xBtgi++YgmEyGS293I2JkTXVStHBERw64ZDDc
 sziUIqWQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uYndu-00DbQm-Id; Mon, 07 Jul 2025 17:20:30 +0200
Message-ID: <d4323b23-e977-4ea9-892a-78e11a2e98a9@igalia.com>
Date: Mon, 7 Jul 2025 16:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/sched/tests: Add unit test for cancel_job()
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250707134221.34291-5-phasta@kernel.org>
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


On 07/07/2025 14:42, Philipp Stanner wrote:
> The scheduler unit tests now provide a new callback, cancel_job(). This
> callback gets used by drm_sched_fini() for all still pending jobs to
> cancel them.
> 
> Implement a new unit test to test this.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594..fa3da2db4893 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -204,6 +204,48 @@ static struct kunit_suite drm_sched_basic = {
>   	.test_cases = drm_sched_basic_tests,
>   };
>   
> +static void drm_sched_basic_cancel(struct kunit *test)
> +{
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_scheduler *sched;
> +	struct drm_mock_sched_job *job;
> +	bool done;
> +
> +	/*
> +	 * Check that the configured credit limit is respected.
> +	 */

Copy & paste mishap.

> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit = 1;

Ditto.

> +
> +	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +
> +	job = drm_mock_sched_job_new(test, entity);
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	drm_mock_sched_entity_free(entity);
> +	drm_mock_sched_fini(sched);
> +
> +	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
> +}
> +
> +static struct kunit_case drm_sched_cancel_tests[] = {
> +	KUNIT_CASE(drm_sched_basic_cancel),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_cancel = {
> +	.name = "drm_sched_basic_cancel_tests",
> +	.init = drm_sched_basic_init,
> +	.exit = drm_sched_basic_exit,
> +	.test_cases = drm_sched_cancel_tests,
> +};
> +
>   static void drm_sched_basic_timeout(struct kunit *test)
>   {
>   	struct drm_mock_scheduler *sched = test->priv;
> @@ -471,6 +513,7 @@ static struct kunit_suite drm_sched_credits = {
>   
>   kunit_test_suites(&drm_sched_basic,
>   		  &drm_sched_timeout,
> +		  &drm_sched_cancel,
>   		  &drm_sched_priority,
>   		  &drm_sched_modify_sched,
>   		  &drm_sched_credits);

The rest looks good. With the comment fixed and credit limit setting 
removed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

