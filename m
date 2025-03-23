Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F280A6D09D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 19:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7A310E1A9;
	Sun, 23 Mar 2025 18:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RX69JT7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112910E1A9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8C+htjrl2FpMlmBDov/maIFRAisrLpuFY7SkKfSnDk=; b=RX69JT7q4lhTk1p59ddrzKMthz
 5N526zkr2Zvbu84Fn3+Wsgh1EwmBjDBs9VB9HO5GzYpxrjfmHCXQJH46V3NezD83tBseR17e36aCe
 zkqbBo2bo7tJJjA7x2/f2YCFKuD04F9NuA+EoSLplUyqTWwZYdUvd2kUo8kepMX3Fgs8xKPEeiGok
 x5ffDTiDGaFbz6Vueh2NuWWIA4kV8LS2L0plTxcoriRIetnc2FB/eHH+nFJU/2GA5/8PEv6ulNJ17
 RehuqpBxPtnZ1ngL40G6nxqg3mMVnaOgR6VQ82bJfwhp2bhaE3/b1+y0A3lIZmUx+aO50WSC/4yy5
 wRIxbt8g==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twQMw-005NHj-Ll; Sun, 23 Mar 2025 19:48:22 +0100
Message-ID: <ad77e39d-4862-4e04-87a0-2a6a2682d5c9@igalia.com>
Date: Sun, 23 Mar 2025 15:48:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/vc4: tests: Stop allocating the state in test init
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-3-779864d9ab37@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318-drm-vc4-kunit-failures-v1-3-779864d9ab37@kernel.org>
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

Hi Maxime,

On 18/03/25 11:17, Maxime Ripard wrote:
> The vc4-pv-muxing-combinations and vc5-pv-muxing-combinations test
> suites use a common test init function which, in part, allocates the
> drm atomic state the test will use.
> 
> That allocation relies on  drm_kunit_helper_atomic_state_alloc(), and
> thus requires a struct drm_modeset_acquire_ctx. This context will then
> be stored in the allocated state->acquire_ctx field.
> 
> However, the context is local to the test init function, and is cleared
> as soon as drm_kunit_helper_atomic_state_alloc() is done. We thus end up
> with an dangling pointer to a cleared context in state->acquire_ctx for
> our test to consumes.
> 
> We should really allocate the context and the state in the test
> functions, so we can also control when we're done with it.
> 
> Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 41 +++++++++++++++++---------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..52c04ef33206bf4f9e21e3c8b7cea932824a67fa 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -18,11 +18,10 @@
>   
>   #include "vc4_mock.h"
>   
>   struct pv_muxing_priv {
>   	struct vc4_dev *vc4;
> -	struct drm_atomic_state *state;

Can't we add `struct drm_modeset_acquire_ctx` here? Then, we can be sure
that the context exists during the entire test case.

Also, we can add `drm_modeset_drop_locks()` and
`drm_modeset_acquire_fini()` to a exit function in the kunit suite.

Best Regards,
- Maíra

>   };
>   
>   static bool check_fifo_conflict(struct kunit *test,
>   				const struct drm_atomic_state *state)
>   {
> @@ -675,14 +674,23 @@ KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
>   
>   static void drm_vc4_test_pv_muxing(struct kunit *test)
>   {
>   	const struct pv_muxing_param *params = test->param_value;
>   	const struct pv_muxing_priv *priv = test->priv;
> -	struct drm_atomic_state *state = priv->state;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_device *drm;
> +	struct vc4_dev *vc4;
>   	unsigned int i;
>   	int ret;
>   
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	vc4 = priv->vc4;
> +	drm = &vc4->base;
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
>   		KUNIT_ASSERT_EQ(test, ret, 0);
> @@ -698,56 +706,61 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
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
> +	struct vc4_dev *vc4;
>   	unsigned int i;
>   	int ret;
>   
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	vc4 = priv->vc4;
> +	drm = &vc4->base;
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

