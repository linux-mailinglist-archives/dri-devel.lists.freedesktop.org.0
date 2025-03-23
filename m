Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E4A6D086
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 19:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F9C10E14C;
	Sun, 23 Mar 2025 18:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k+SEWSlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBB210E14C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5dWpBRiiy2cN5TLwk/Q7X9BCv5bX375PIi/0UnIvWt0=; b=k+SEWSlcTqJ+WjOLuZXmxmo7gU
 uirJ6NPy3ezCZow33DOhQqS2cj3W5gb14BoVb7GiYpf2SIFZcPx7lGr8Cmb4SqLyhsmnLqvPppytq
 nBFNTMJUZ0VHKLr/ibMJwcAvBgKbCPlaymBLo3x29kWm3in0WGTrsZyNX2Q1b5Qz4UGZhWT01rqb4
 aKoiw7aUoU7yst+oO24lGgXZjIORWF5DmcR/SUFmYVnj005TziOAmljL5uOBGCxkOGbyKmmd7HarN
 T0UR6ARGbGaJxWWnMossvJLCkOZm1LTNzd6sDEyOlcGnqM5xJB6mO2V5BoUe0Pz6wR6Z+mm8wMglw
 mDKMkvFg==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twPom-005MpP-S3; Sun, 23 Mar 2025 19:13:05 +0100
Message-ID: <d9e7d2a0-d074-4c21-b1a5-70ad93a98ea1@igalia.com>
Date: Sun, 23 Mar 2025 15:12:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/vc4: tests: Use return instead of assert
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-1-779864d9ab37@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318-drm-vc4-kunit-failures-v1-1-779864d9ab37@kernel.org>
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
> The vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() assert
> that the functions they are calling didn't fail. Since some of them can
> return EDEADLK, we can't properly deal with it.
> 
> Since both functions are expected to return an int, and all caller check
> the return value, let's just properly propagate the errors when they
> occur.
> 
> Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
> Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 36 +++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index e70d7c3076acf168782c48301f3b3dfb9be21f22..f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -73,28 +73,34 @@ int vc4_mock_atomic_add_output(struct kunit *test,
>   	struct drm_encoder *encoder;
>   	struct drm_crtc *crtc;
>   	int ret;
>   
>   	encoder = vc4_find_encoder_by_type(drm, type);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
> +	if (!encoder)
> +		return -ENODEV;
>   
>   	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
> +	if (!crtc)
> +		return -ENODEV;
>   
>   	output = encoder_to_vc4_dummy_output(encoder);
>   	conn = &output->connector;
>   	conn_state = drm_atomic_get_connector_state(state, conn);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +	if (IS_ERR(conn_state))
> +		return PTR_ERR(conn_state);
>   
>   	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> -	KUNIT_EXPECT_EQ(test, ret, 0);
> +	if (ret)
> +		return ret;
>   
>   	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
>   
>   	ret = drm_atomic_set_mode_for_crtc(crtc_state, &default_mode);
> -	KUNIT_EXPECT_EQ(test, ret, 0);
> +	if (ret)
> +		return ret;
>   
>   	crtc_state->active = true;
>   
>   	return 0;
>   }
> @@ -111,28 +117,34 @@ int vc4_mock_atomic_del_output(struct kunit *test,
>   	struct drm_encoder *encoder;
>   	struct drm_crtc *crtc;
>   	int ret;
>   
>   	encoder = vc4_find_encoder_by_type(drm, type);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
> +	if (!encoder)
> +		return -ENODEV;
>   
>   	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
> +	if (!crtc)
> +		return -ENODEV;
>   
>   	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
>   
>   	crtc_state->active = false;
>   
>   	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
> -	KUNIT_ASSERT_EQ(test, ret, 0);
> +	if (ret)
> +		return ret;
>   
>   	output = encoder_to_vc4_dummy_output(encoder);
>   	conn = &output->connector;
>   	conn_state = drm_atomic_get_connector_state(state, conn);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +	if (IS_ERR(conn_state))
> +		return PTR_ERR(conn_state);
>   
>   	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
> -	KUNIT_ASSERT_EQ(test, ret, 0);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
> 

