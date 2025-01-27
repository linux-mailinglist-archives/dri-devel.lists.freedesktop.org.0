Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED94A1D8E3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E22910E55F;
	Mon, 27 Jan 2025 14:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YSi/8SA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8B110E55F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdwovyvccT3HDsQ77VRqbigxA3O31jTQTH9Ia6EasO4=;
 b=YSi/8SA8AicZeUlv46pH6M0gUdH0F52hAnd5EN6IXF0UDgKfKbKbcKO3idWWP8JC67HvKN
 dAI1/95HGjf4J6KoefYy8sAHZwYpqHvFPVrNeYAlEPL0Rhb02+o6jNrEspV929zvhAlVWh
 ZzSutWN898K0fiwj2XRVbphPX9+wKrw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-Pf2Y0yIVOoCrzS4uWfs7_w-1; Mon, 27 Jan 2025 09:57:24 -0500
X-MC-Unique: Pf2Y0yIVOoCrzS4uWfs7_w-1
X-Mimecast-MFC-AGG-ID: Pf2Y0yIVOoCrzS4uWfs7_w
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38634103b0dso2340990f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989843; x=1738594643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdwovyvccT3HDsQ77VRqbigxA3O31jTQTH9Ia6EasO4=;
 b=B9gzPv+2jaiQbyCldph/DGEq18TRNuWUj6TvwUmJyWLCPF2vr9JaShojyFYlGSG6oO
 Gt69jZiOv/EhzF7yaxhjyWPkOEOoeRTr0yYDEq53W5xjkQszYh4uRmHzLIk4dC045t6U
 IXZgJ6F1/304wP00ZLjgxK58hPXP5AMQSJWfkgFRAf5s7JxnIPKwWPguAR2wmeLP1vR6
 SOc2CUBbovLO+F6dU4r5gJuJ/PSdOm2Iaxx3Z2on3hk0Jg7JKV3fW8peKqk0Y0Xf1Ia8
 5cHufhy2R/k1LuIhQYSm+2WS8EAp4JL75oZx/Nh44NIOA3ZXYa9VjFWa8v6fbnNtPKVp
 84OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN3FPh0l1En6qi4ub4AI5J4iRWvy8U/sO0gb/7vDHLy4fPn9oHPUCJCAfmB+uYeeF8c4Va8nRa9XQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7/+MaUPMsgi06qxwzDqy1I3pYAABpLjdXu+QAeVGKED69p5Fu
 KmLzwmXI5RK3kFRifzY7X6QJmvLdKw7tMVmvgINloecfzDK/2bKJh+vvMvQ8dh4bAbDbhn9vU2k
 6NDiA+tNInjlCJkJE8c6p9s9+1nbZC6/gypZHp5zWig6/T7bZUKApmlBzAdJ5lIAe1w==
X-Gm-Gg: ASbGncsE069TAtTgzlxVrCgxxTUcQZzCQgBCxxeFxxrrZf22CKPkQ51+dGy5PqbFS44
 8cyx/P0Vyqxtk25yX0+8FMyG8PfoWbxmvMP55MeVOFOenc6qfjwOU1JouRgaVLowrasaYwITrxK
 wi46pq4ADt+VgOU8eeawtQE9CaDctDrNtDQu+CJrOinYXkKhr4vhdimXPzL+Gf70OJT0hBdVAVw
 BeUxyGsa8mXecxthHJ2PbLy1IwXfS+53h+NxN5gyO4FRXQNk2cUaZm0eWQqX/LXmkUojM/sszlv
 zlX6tn/TtvuxpPcCKQE9fZtm20X7S+L/cu6I9hVdioYv
X-Received: by 2002:a5d:47c9:0:b0:386:416b:9c69 with SMTP id
 ffacd0b85a97d-38bf5662912mr42606268f8f.16.1737989842592; 
 Mon, 27 Jan 2025 06:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXYFV7RrImuxMMCysWCqp5HQNiDafEqA/7v8uguCi5ysmMMR68BnCyCYVHkvHdW1xdunf1DA==
X-Received: by 2002:a5d:47c9:0:b0:386:416b:9c69 with SMTP id
 ffacd0b85a97d-38bf5662912mr42606233f8f.16.1737989842060; 
 Mon, 27 Jan 2025 06:57:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4006sm11408787f8f.94.2025.01.27.06.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:57:21 -0800 (PST)
Message-ID: <1febad0b-b935-4ee7-8030-3e9011e603b8@redhat.com>
Date: Mon, 27 Jan 2025 15:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] drm/ast: astdp: Rework display-mode setting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-14-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-14-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JORpFe1aR4ICy-gqb8cI9s893u1UgzRb4yQcKWgvpQQ_1737989843
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> ASTDP requires a mode index, depending on the resolution. Move the
> look-up code from ast_dp_set_mode() into a separate helper. Inline
> the rest of the function into its only caller. Rename the variable
> names and register constants to match the programming manual.
> 
> As before, the mode-index lookup still happens during the update's
> atomic commit. Right now, there's no way of doing it during the atomic
> check. The lookup requires the VBIOS mode, which is not available at
> the atomic check's invocation. At least warn now if the mode index
> could not be found.

It looks good to me, I have one small comment below.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c  | 172 +++++++++++++++++++---------------
>   drivers/gpu/drm/ast/ast_reg.h |  18 +---
>   2 files changed, 100 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 08c811f3ce342..fe122828665fb 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -14,6 +14,82 @@
>   #include "ast_drv.h"
>   #include "ast_vbios.h"
>   
> +static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable *vmode)
> +{
> +	u8 refresh_rate_index;
> +
> +	if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255)
> +		return -EINVAL;
> +
> +	refresh_rate_index = vmode->refresh_rate_index - 1;
> +
> +	switch (vmode->hde) {
> +	case 320:
> +		if (vmode->vde == 240)
> +			return ASTDP_320x240_60;
> +		break;

I find the switch() code introduces a lot of useless verbosity.
I would prefer something like this:

if (vmode->hde == 240 && vmode->vde == 240)
	return ASTDP_320x240_60;
else if (vmode->hde == 400 && vmode->vde == 300)
	return ASTDP_400x300_60;


> +	case 400:
> +		if (vmode->vde == 300)
> +			return ASTDP_400x300_60;
> +		break;
> +	case 512:
> +		if (vmode->vde == 384)
> +			return ASTDP_512x384_60;
> +		break;
> +	case 640:
> +		if (vmode->vde == 480)
> +			return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
> +		break;
> +	case 800:
> +		if (vmode->vde == 600)
> +			return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
> +		break;
> +	case 1024:
> +		if (vmode->vde == 768)
> +			return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
> +		break;
> +	case 1152:
> +		if (vmode->vde == 864)
> +			return ASTDP_1152x864_75;
> +		break;
> +	case 1280:
> +		if (vmode->vde == 800)
> +			return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
> +		if (vmode->vde == 1024)
> +			return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
> +		break;
> +	case 1360:
> +	case 1366:
> +		if (vmode->vde == 768)
> +			return ASTDP_1366x768_60;
> +		break;
> +	case 1440:
> +		if (vmode->vde == 900)
> +			return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
> +		break;
> +	case 1600:
> +		if (vmode->vde == 900)
> +			return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
> +		if (vmode->vde == 1200)
> +			return ASTDP_1600x1200_60;
> +		break;
> +	case 1680:
> +		if (vmode->vde == 1050)
> +			return (u8)(ASTDP_1680x1050_60_RB - (u8)refresh_rate_index);
> +		break;
> +	case 1920:
> +		if (vmode->vde == 1080)
> +			return ASTDP_1920x1080_60;
> +		if (vmode->vde == 1200)
> +			return ASTDP_1920x1200_60;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static bool ast_astdp_is_connected(struct ast_device *ast)
>   {
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
> @@ -222,80 +298,6 @@ static void ast_dp_set_enable(struct ast_device *ast, bool enabled)
>   	drm_WARN_ON(dev, !__ast_dp_wait_enable(ast, enabled));
>   }
>   
> -static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
> -{
> -	struct ast_device *ast = to_ast_device(crtc->dev);
> -
> -	u32 ulRefreshRateIndex;
> -	u8 ModeIdx;
> -
> -	ulRefreshRateIndex = vbios_mode->enh_table->refresh_rate_index - 1;
> -
> -	switch (crtc->mode.crtc_hdisplay) {
> -	case 320:
> -		ModeIdx = ASTDP_320x240_60;
> -		break;
> -	case 400:
> -		ModeIdx = ASTDP_400x300_60;
> -		break;
> -	case 512:
> -		ModeIdx = ASTDP_512x384_60;
> -		break;
> -	case 640:
> -		ModeIdx = (ASTDP_640x480_60 + (u8) ulRefreshRateIndex);
> -		break;
> -	case 800:
> -		ModeIdx = (ASTDP_800x600_56 + (u8) ulRefreshRateIndex);
> -		break;
> -	case 1024:
> -		ModeIdx = (ASTDP_1024x768_60 + (u8) ulRefreshRateIndex);
> -		break;
> -	case 1152:
> -		ModeIdx = ASTDP_1152x864_75;
> -		break;
> -	case 1280:
> -		if (crtc->mode.crtc_vdisplay == 800)
> -			ModeIdx = (ASTDP_1280x800_60_RB - (u8) ulRefreshRateIndex);
> -		else		// 1024
> -			ModeIdx = (ASTDP_1280x1024_60 + (u8) ulRefreshRateIndex);
> -		break;
> -	case 1360:
> -	case 1366:
> -		ModeIdx = ASTDP_1366x768_60;
> -		break;
> -	case 1440:
> -		ModeIdx = (ASTDP_1440x900_60_RB - (u8) ulRefreshRateIndex);
> -		break;
> -	case 1600:
> -		if (crtc->mode.crtc_vdisplay == 900)
> -			ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
> -		else		//1200
> -			ModeIdx = ASTDP_1600x1200_60;
> -		break;
> -	case 1680:
> -		ModeIdx = (ASTDP_1680x1050_60_RB - (u8) ulRefreshRateIndex);
> -		break;
> -	case 1920:
> -		if (crtc->mode.crtc_vdisplay == 1080)
> -			ModeIdx = ASTDP_1920x1080_60;
> -		else		//1200
> -			ModeIdx = ASTDP_1920x1200_60;
> -		break;
> -	default:
> -		return;
> -	}
> -
> -	/*
> -	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
> -	 * CRE1[7:0]: MISC1 (default: 0x00)
> -	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
> -	 */
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE0, ASTDP_AND_CLEAR_MASK,
> -			       ASTDP_MISC0_24bpp);
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE1, ASTDP_AND_CLEAR_MASK, ASTDP_MISC1);
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE2, ASTDP_AND_CLEAR_MASK, ModeIdx);
> -}
> -
>   static void ast_wait_for_vretrace(struct ast_device *ast)
>   {
>   	unsigned long timeout = jiffies + HZ;
> @@ -318,11 +320,29 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
>   						     struct drm_crtc_state *crtc_state,
>   						     struct drm_connector_state *conn_state)
>   {
> -	struct drm_crtc *crtc = crtc_state->crtc;
> +	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(dev);
>   	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
>   	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
> +	int mode_index;
> +	u8 vgacre0, vgacre1, vgacre2;
> +
> +	mode_index = ast_astdp_get_mode_index(vbios_mode_info->enh_table);
> +	if (drm_WARN_ON(dev, mode_index < 0))
> +		return;
> +
> +	/*
> +	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
> +	 * CRE1[7:0]: MISC1 (default: 0x00)
> +	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
> +	 */
> +	vgacre0 = AST_IO_VGACRE0_24BPP;
> +	vgacre1 = 0x00;
> +	vgacre2 = mode_index & 0xff;
>   
> -	ast_dp_set_mode(crtc, vbios_mode_info);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe0, vgacre0);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe1, vgacre1);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe2, vgacre2);
>   }
>   
>   static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 9db0d584652a4..bb2cc1d8b84ea 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -57,10 +57,14 @@
>   #define AST_IO_VGACRD1_TX_ASTDP			0x0e
>   #define AST_IO_VGACRD1_SUPPORTS_WUXGA		BIT(0)
>   
> +/*
> + * AST DisplayPort
> + */
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
>   #define AST_IO_VGACRDF_DP_VIDEO_ENABLE	BIT(4) /* mirrors AST_IO_VGACRE3_DP_VIDEO_ENABLE */
> +#define AST_IO_VGACRE0_24BPP		BIT(5) /* 18 bpp, if unset  */
>   #define AST_IO_VGACRE3_DP_VIDEO_ENABLE	BIT(0)
>   #define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
>   #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
> @@ -68,18 +72,4 @@
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> -/*
> - * AST DisplayPort
> - */
> -
> -/*
> - * ASTDP setmode registers:
> - * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
> - * CRE1[7:0]: MISC1 (default: 0x00)
> - * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
> - */
> -#define ASTDP_MISC0_24bpp		BIT(5)
> -#define ASTDP_MISC1			0
> -#define ASTDP_AND_CLEAR_MASK		0x00
> -
>   #endif

