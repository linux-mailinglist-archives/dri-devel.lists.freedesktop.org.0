Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9CA6D082
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 19:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98B510E0BA;
	Sun, 23 Mar 2025 18:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kmnVozqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624D110E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D77nPsmMV0/TxqLnhHvNQ9fX2PYMvK9BF/KPlrJlvuM=; b=kmnVozqfsnzzzJnDGNN7L7dXUw
 tOkdCO7OjaTQsYv35ngVffKY6u08v/vfqhSoVBci/QuGs2X5A0z/yxElqHhtVvc9XtuWWRXihM82f
 +T9GoJscUeQJhZzi7ctoxfI28+/KSuRcOS+1QY+YV+0SgLv+xR4p5ygWA1ayIUXSH1t6kV8NreBft
 qpt/SM4aaLK9La/xo9mEGDUDHmtOAb/nfx7Rtg/Gb17fBW2nFJaRrM2q33FcQaB+YLnmHI4p0J2O3
 EntZigfC+cnKOIlG615hRLbAR1CSsmUkG4sIce5kmPmzeloFGAaADJCYj7JRKf2Crzh53fkjLS12p
 13OoREkA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twPjx-005MlC-V0; Sun, 23 Mar 2025 19:08:06 +0100
Message-ID: <e3517bd6-a9c2-4193-92d8-b6510b967d0a@igalia.com>
Date: Sun, 23 Mar 2025 15:07:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/vc4: tests: Retry pv-muxing tests when EDEADLK
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-4-779864d9ab37@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318-drm-vc4-kunit-failures-v1-4-779864d9ab37@kernel.org>
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
> Some functions used by the HVS->PV muxing tests can return with EDEADLK,
> meaning the entire sequence should be restarted. It's not a fatal error
> and we should treat it as a recoverable error, and recover, instead of
> failing the test like we currently do.
> 
> Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 44 ++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> index 52c04ef33206bf4f9e21e3c8b7cea932824a67fa..94e05bddb630a79aab189d9bc16f09a9d84ce396 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -685,20 +685,26 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	vc4 = priv->vc4;
>   	drm = &vc4->base;
> +
> +retry:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
> +		if (ret == -EDEADLK)
> +			goto retry;
>   		KUNIT_ASSERT_EQ(test, ret, 0);
>   	}
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK)
> +		goto retry;

Shouldn't we call `drm_modeset_backoff()` before retrying (maybe
`drm_atomic_state_clear()` as well)?

Best Regards,
- Maíra

>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   
>   	KUNIT_EXPECT_TRUE(test,
>   			  check_fifo_conflict(test, state));
>   
