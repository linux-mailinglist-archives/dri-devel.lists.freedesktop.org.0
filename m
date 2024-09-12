Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF209976ACE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6423B10EB88;
	Thu, 12 Sep 2024 13:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MgcRFCna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF3310EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S111kYYNRhD6R8AAogEK5BeiG6QMGbh6sUJuiBGFy8M=;
 b=MgcRFCnaFQFzYqYHUR7pI+7KgKm1wi12PHdYHAvcFKE645Y+jNegxFUNtSeCYJKwsKdEhs
 +0v64gZ3N6hD86Qo9v8yVcwzoDhApsYr0iMRwi+lBGAWv81uYIegF04QRnVaGCQcZwfHk6
 wp9GwgPAA8fKtbk6gBCkOkcplUqY67U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-faFfXtP0Os6DARovmRJFjw-1; Thu, 12 Sep 2024 09:38:31 -0400
X-MC-Unique: faFfXtP0Os6DARovmRJFjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb6f3c476so7142225e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148310; x=1726753110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S111kYYNRhD6R8AAogEK5BeiG6QMGbh6sUJuiBGFy8M=;
 b=ak0Bs8KKTd/MLfEoMUtRhHh67ZajfG1CIQKw/GTF/bIKICim3iDNQcQmsp5P8ZKqme
 3em0xYs1H4/Ib8JoCdtiBcCffwu/69zkdngSKedp6RG+pcCVlN89OnJwWfkTn9hVj1oF
 gKKTbmw3e+G+0cobGMK8Ve1C3Yiu82PwFwf80OTdQQTJRiJwlZmUp3vadTE4eUhmUR9m
 Pct6Vl+jthwCou7+FHQsPtSL+FDwhmIIleTnOwbkcP/ilijeMoAcOcLlQvXCYvUeL+mr
 hYDVQcJIe6NTViqit0ARo/o0gJYTqUEmPCui3HC06PF9Q6lYSg0lh1552e9XbVWhH4pz
 m9iw==
X-Gm-Message-State: AOJu0YzceoeiF1tMkE/BlCPjVlUXqyyjHFSitOGbJcSfYRsFrl9n0eO4
 +Bq79mchuQilrX3Tj7EsqxV7tBsvIFPjaA2lG5clN3NZY+szEV6yYJynRufo6gRSUIgb1OZkwJ+
 5/pY3IV11c7xY5Lyh3F6GbV29R3fa0PWBF2uq8cNx+/0+/U/EQpQPPZcxyg4G7xLGKe9pWaHBDg
 ==
X-Received: by 2002:a05:600c:1d84:b0:42c:bae0:f066 with SMTP id
 5b1f17b1804b1-42cdb539e84mr24373225e9.13.1726148310152; 
 Thu, 12 Sep 2024 06:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRfPJv8JNdY8/p9/JCbb66fWy09jKoNc43H1GKXn6qSOAFG95xl2su0YUtxwPFzMVRwR+Pdw==
X-Received: by 2002:a05:600c:1d84:b0:42c:bae0:f066 with SMTP id
 5b1f17b1804b1-42cdb539e84mr24373015e9.13.1726148309623; 
 Thu, 12 Sep 2024 06:38:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm209844005e9.32.2024.09.12.06.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:38:29 -0700 (PDT)
Message-ID: <e13ddbdc-ccd9-4236-b83e-86f2f7d9fecc@redhat.com>
Date: Thu, 12 Sep 2024 15:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/ast: astdp: Replace ast_dp_set_on_off()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-5-tzimmermann@suse.de>
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

On 11/09/2024 13:51, Thomas Zimmermann wrote:
> Replace ast_dp_set_on_off() with ast_dp_set_enable(). The helper's
> new name reflects the performed operation. If enabling fails, the
> new helper prints a warning. The code that waits for the programmed
> effect to take place is now located in __ast_dp_wait_enable().
> 
> Also align the register constants with the rest of the code.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c  | 49 +++++++++++++++++++++++------------
>   drivers/gpu/drm/ast/ast_reg.h | 13 ++--------
>   2 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index d4362807d777..0e282b7b167c 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -186,22 +186,39 @@ static void ast_dp_link_training(struct ast_device *ast)
>   	drm_err(dev, "Link training failed\n");
>   }
>   
> -static void ast_dp_set_on_off(struct ast_device *ast, bool on)
> +static bool __ast_dp_wait_enable(struct ast_device *ast, bool enabled)
>   {
> -	u8 video_on_off = on;
> -	u32 i = 0;
> -
> -	// Video On/Off
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
> -
> -	video_on_off <<= 4;
> -	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
> -						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
> -		// wait 1 ms
> -		mdelay(1);
> -		if (++i > 200)
> -			break;
> +	u8 vgacrdf_test = 0x00;
> +	u8 vgacrdf;
> +	unsigned int i;
> +
> +	if (enabled)
> +		vgacrdf_test |= AST_IO_VGACRDF_DP_VIDEO_ENABLE;
> +
> +	for (i = 0; i < 200; ++i) {
> +		if (i)
> +			mdelay(1);
> +		vgacrdf = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xdf,
> +						 AST_IO_VGACRDF_DP_VIDEO_ENABLE);
> +		if (vgacrdf == vgacrdf_test)
> +			return true;
>   	}
> +
> +	return false;
> +}
> +
> +static void ast_dp_set_enable(struct ast_device *ast, bool enabled)
> +{
> +	struct drm_device *dev = &ast->base;
> +	u8 vgacre3 = 0x00;
> +
> +	if (enabled)
> +		vgacre3 |= AST_IO_VGACRE3_DP_VIDEO_ENABLE;
> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe3, (u8)~AST_IO_VGACRE3_DP_VIDEO_ENABLE,
> +			       vgacre3);
> +
> +	drm_WARN_ON(dev, !__ast_dp_wait_enable(ast, enabled));
>   }
>   
>   static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
> @@ -318,7 +335,7 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   		ast_dp_link_training(ast);
>   
>   		ast_wait_for_vretrace(ast);
> -		ast_dp_set_on_off(ast, 1);
> +		ast_dp_set_enable(ast, true);
>   	}
>   }
>   
> @@ -327,7 +344,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   {
>   	struct ast_device *ast = to_ast_device(encoder->dev);
>   
> -	ast_dp_set_on_off(ast, 0);
> +	ast_dp_set_enable(ast, false);
>   	ast_dp_set_phy_sleep(ast, true);
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index d7a22cea8271..6a1f756650ab 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -41,6 +41,8 @@
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
> +#define AST_IO_VGACRDF_DP_VIDEO_ENABLE	BIT(4) /* mirrors AST_IO_VGACRE3_DP_VIDEO_ENABLE */
> +#define AST_IO_VGACRE3_DP_VIDEO_ENABLE	BIT(0)
>   #define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
>   #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
>   
> @@ -69,17 +71,6 @@
>    * AST DisplayPort
>    */
>   
> -/* Define for Soc scratched reg used on ASTDP */
> -#define AST_DP_VIDEO_ENABLE		BIT(0)
> -
> -/*
> - * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
> - * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
> - *			B. DP_HPD &&
> - *			C. DP_LINK_SUCCESS
> - */
> -#define ASTDP_MIRROR_VIDEO_ENABLE	BIT(4)
> -
>   /*
>    * ASTDP setmode registers:
>    * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)

