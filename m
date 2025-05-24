Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D1FAC2F4B
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 13:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49B10E013;
	Sat, 24 May 2025 11:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BVwyCjNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCA810E013
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sR776M/6brt/2VOO3DWDAEjQNmTyZBx8N+FX7qYPO/E=; b=BVwyCjNg7VgMsEJxcvLU3ubGjJ
 EbfWxFjDkEpSOsw3TVhK4XtvlAvsaQRnZqDK/lj7NmGSmqnKwpaZnsgV5feY/KVqnFkJ9SWKXIHrR
 IU1UBkMMOFCZhyoT8AhOv+N0zN2q141A1kiZG+czU8yKhu2YuMi2w3CK+OGRK6AxfO8GBOznSEqmp
 SF/rdeC40ljWvJa76Ga0VmozIZbHz3DapuiUhd8gGY1cqgVepISfRPBBnQLdvB3V/sZkVHuZfVkDQ
 sjMVckUw0llScL3+o48oFxO3XP1WlFvrqke1K2L3FCsw7jEQBufnMezl6yoarLIP5FwOtGmgiR+LV
 1yPNFe0Q==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uIml5-00CX95-Tt; Sat, 24 May 2025 13:09:44 +0200
Message-ID: <0a55c763-c1c1-48dc-bad0-d993b4fc4f87@igalia.com>
Date: Sat, 24 May 2025 08:09:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
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

On 20/05/25 09:08, Maxime Ripard wrote:
> Commit 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> removed a kunit-managed function to get a drm_modeset_acquire_ctx.
> 
> It converted the vc4_pv_muxing_test_init() function, used by
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid(). However,
> during that conversion, it went from being kzalloc'd to being allocated
> on the stack.
> 
> vc4_pv_muxing_test_init() then uses that context to allocate a
> drm_atomic_state using drm_kunit_helper_atomic_state_alloc(), which
> stores a pointer to the locking context in the allocated state.
> 
> However, since vc4_pv_muxing_test_init() is a test init function, the
> context is then cleared when we leave the function, and before executing
> the test. We're then running the test with a dangling pointer, which
> then leads to various crashes.
> 
> Rework the context initialization and state allocation to move them to
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid().
> 
> Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/r/Z_95jWM2YMTGy3pi@arm.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 38 ++++++++++++++++----------
>   1 file changed, 24 insertions(+), 14 deletions(-)

Hi Maxime,

Didn't you fix this issue in commit 7e0351ae91ed ("drm/vc4: tests: Stop
allocating the state in test init") [1]?

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7e0351ae91ed2b6178abbfae96c3c6aaa1652567

Best Regards,
- Maíra

> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..a79b152f8b97add449cffc9674abec0df95239e3 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -18,11 +18,10 @@
>   
>   #include "vc4_mock.h"
>   
>   struct pv_muxing_priv {
>   	struct vc4_dev *vc4;
> -	struct drm_atomic_state *state;
>   };
>   
>   static bool check_fifo_conflict(struct kunit *test,
>   				const struct drm_atomic_state *state)
>   {
> @@ -675,14 +674,22 @@ KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
>   
>   static void drm_vc4_test_pv_muxing(struct kunit *test)
>   {
>   	const struct pv_muxing_param *params = test->param_value;
>   	const struct pv_muxing_priv *priv = test->priv;
> -	struct drm_atomic_state *state = priv->state;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_device *drm;
>   	unsigned int i;
>   	int ret;
>   
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	drm = &priv->vc4->base;
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
>   		KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -698,56 +705,59 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		KUNIT_EXPECT_TRUE(test, check_channel_for_encoder(test, state, enc_type,
>   								  params->check_fn));
>   	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
>   }
>   
>   static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
>   {
>   	const struct pv_muxing_param *params = test->param_value;
>   	const struct pv_muxing_priv *priv = test->priv;
> -	struct drm_atomic_state *state = priv->state;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_device *drm;
>   	unsigned int i;
>   	int ret;
>   
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	drm = &priv->vc4->base;
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
>   		KUNIT_ASSERT_EQ(test, ret, 0);
>   	}
>   
>   	ret = drm_atomic_check_only(state);
>   	KUNIT_EXPECT_LT(test, ret, 0);
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
>   }
>   
>   static int vc4_pv_muxing_test_init(struct kunit *test)
>   {
>   	const struct pv_muxing_param *params = test->param_value;
> -	struct drm_modeset_acquire_ctx ctx;
>   	struct pv_muxing_priv *priv;
> -	struct drm_device *drm;
>   	struct vc4_dev *vc4;
>   
>   	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test, priv);
>   	test->priv = priv;
>   
>   	vc4 = params->mock_fn(test);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   	priv->vc4 = vc4;
>   
> -	drm_modeset_acquire_init(&ctx, 0);
> -
> -	drm = &vc4->base;
> -	priv->state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->state);
> -
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
> -
>   	return 0;
>   }
>   
>   static struct kunit_case vc4_pv_muxing_tests[] = {
>   	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,
> 
> ---
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
> change-id: 20250520-drm-vc4-kunit-fixes-a681715c4409
> 
> Best regards,

