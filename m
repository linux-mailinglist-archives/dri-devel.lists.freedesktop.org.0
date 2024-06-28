Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889291BBFE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79310EC01;
	Fri, 28 Jun 2024 09:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e/BzDW51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAB510EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719568643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZviqTqdTjxdCR1970K77L1FgyrbywP1qfa4gUY05wbA=;
 b=e/BzDW51j72wvvMEmfN/pi79w2j7shZZ58IcGGxKJeydc1U7TbGm8i08GFYplzEdypaHO5
 +cFHPJjNnWbyWjMLQctiOje4JCoaF0GPtoPyT7n6nTEX6ux0bdy8a0fiXcKGiSYsz7Y4kJ
 V+K/wyN438xXFIow468zFmbM70vOZbU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-BCPhuNHbOweN7gCJDW0Ifg-1; Fri, 28 Jun 2024 05:57:20 -0400
X-MC-Unique: BCPhuNHbOweN7gCJDW0Ifg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ec584f36bfso3966351fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568639; x=1720173439;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZviqTqdTjxdCR1970K77L1FgyrbywP1qfa4gUY05wbA=;
 b=h2cURsb5yos2tayWkXwENVeaw99SvGCrz6+UAUlBCT+h1R1+ePu2GaTC38dQHAIyfR
 sc9z/zjzvNY3fzVMGyemhuugPGxdgVOSVuVWPhDLPyL/ijrIE8fti/LYcTpBssM9rIyi
 VQYbxvqyP+etWvP0PZnsp09idKYm+LOb8T7dm71+8s8LuUsh/GQHzIeUwMfBfSEg7R1I
 Hfv0NxQyvl6nHmGyQx+R1vJgxnosxFvsV6fDxJXK1NcT3uSIrMCqQSN1CBHGRZ9r9wlW
 N+fr43lt1QCiy5CmA512u57705bmQZcM9wOjJwPzNg9RXtS4DkeszOq0sbuhTf9fPe1N
 jmQw==
X-Gm-Message-State: AOJu0YxFYuINqNzqRfVyqL4tIAf9r/k1ZYDmigcq8h9K9BNLQcq2P0W9
 kEYwFKaKaS00CuBTkYLfw2xcpKoV1xA7Hgd7h+IaCwGftimI8ouArVigz9m3Fibw/JZEeGy1v4C
 +mG44OEPLTDl7hPAGTbmZ7JacZ9A1UZfa0zrwCZVHkzMBkYwvS8pAvFgnnTRXoQIaRg==
X-Received: by 2002:a05:651c:1581:b0:2ee:493f:d5be with SMTP id
 38308e7fff4ca-2ee493fd616mr38899961fa.3.1719568639541; 
 Fri, 28 Jun 2024 02:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXCYMRPuRdwrytBxGH4BSnuI5mztro2MsU4clJXe8OjW0vax4xUejeCe22YG/nsAtdjqGBlw==
X-Received: by 2002:a05:651c:1581:b0:2ee:493f:d5be with SMTP id
 38308e7fff4ca-2ee493fd616mr38899861fa.3.1719568639139; 
 Fri, 28 Jun 2024 02:57:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3cf90sm27305675e9.5.2024.06.28.02.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:57:18 -0700 (PDT)
Message-ID: <07f40143-9eb4-47eb-b74c-72a137baf649@redhat.com>
Date: Fri, 28 Jun 2024 11:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/ast: Inline ast_crtc_dpms() into callers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> The function ast_crtc_dpms() is left over from when the ast driver
> did not implement atomic modesetting. But DPMS is not supported by
> atomic modesetting and the helper is only called to enable or
> disable the CRTC sync pulses. Inline the function into its callers.
> 
> To disable the CRTC, ast sets (AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF)
> in VGACRB6. Replace the constants with the correct register constants
> for VGACRB6.

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 36 +++++++++++-----------------------
>   drivers/gpu/drm/ast/ast_reg.h  |  9 ++-------
>   2 files changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 77358b587098..d130c96edf35 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1019,29 +1019,6 @@ static int ast_cursor_plane_init(struct ast_device *ast)
>    * CRTC
>    */
>   
> -static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
> -{
> -	struct ast_device *ast = to_ast_device(crtc->dev);
> -	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
> -
> -	/* TODO: Maybe control display signal generation with
> -	 *       Sync Enable (bit CR17.7).
> -	 */
> -	switch (mode) {
> -	case DRM_MODE_DPMS_ON:
> -		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
> -		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0);
> -		break;
> -	case DRM_MODE_DPMS_STANDBY:
> -	case DRM_MODE_DPMS_SUSPEND:
> -	case DRM_MODE_DPMS_OFF:
> -		ch = mode;
> -		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
> -		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
> -		break;
> -	}
> -}
> -
>   static enum drm_mode_status
>   ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
>   {
> @@ -1217,14 +1194,23 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   
>   static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
> -	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
> +	struct ast_device *ast = to_ast_device(crtc->dev);
> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
> +	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
>   }
>   
>   static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
>   	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> +	struct ast_device *ast = to_ast_device(crtc->dev);
> +	u8 vgacrb6;
> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
>   
> -	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> +	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
> +		  AST_IO_VGACRB6_HSYNC_OFF;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>   
>   	/*
>   	 * HW cursors require the underlying primary plane and CRTC to
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 6326cbdadc82..75671d345057 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -32,6 +32,8 @@
>   #define AST_IO_VGACR80_PASSWORD		(0xa8)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
> +#define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
> +#define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
> @@ -76,13 +78,6 @@
>   #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
>   
> -/*
> - * CRB8[b1]: Enable VSYNC off
> - * CRB8[b0]: Enable HSYNC off
> - */
> -#define AST_DPMS_VSYNC_OFF		BIT(1)
> -#define AST_DPMS_HSYNC_OFF		BIT(0)
> -
>   /*
>    * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
>    * Precondition:	A. ~AST_DP_PHY_SLEEP  &&

