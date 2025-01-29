Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437CA21BDA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A20B10E7AE;
	Wed, 29 Jan 2025 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AfWN1nPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1F10E7AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738149002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNlpljra3sd4enJIP/2DP/cS7Q18Nga8nPobI7sWq7U=;
 b=AfWN1nPaw8Zdh0b2eYT+NmerafPhgLbTRv0ZDUnxactVW/wGYXisb2qgaa6ws9sXfJpv2W
 mtUD7PtMn+tJ8lMibfV+03mePCQ/5MrQ1WO6Mx2d1cQriSL7yg2Du/1jg3PbS9g4nc4/cp
 /6VVHL1iRceYSAIIGN43QqTZ0ljyOFA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Ts9Q8NCWNzK47HBeL_xF6Q-1; Wed, 29 Jan 2025 06:10:01 -0500
X-MC-Unique: Ts9Q8NCWNzK47HBeL_xF6Q-1
X-Mimecast-MFC-AGG-ID: Ts9Q8NCWNzK47HBeL_xF6Q
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38bf4913669so3309917f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738149000; x=1738753800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNlpljra3sd4enJIP/2DP/cS7Q18Nga8nPobI7sWq7U=;
 b=XiyaDGRDWgRTD/YKgmnaR3AoaSSM6OCqAe/PRF0O4bnAC2z3W4GGcpWuSqZYBIQL3O
 3dwh/vDx1mzKIqNLdSsvdQTa8qkInGAAXe0hv8LHR+v3zcc8pYoHZr5dVXhqg4bokp93
 3JJVMeReW1imIZFTBck/yn0BmfXZ5IkzW05VhBnxnfN1HHzMTD/HlPs/AyhQvmPoIwR2
 P9MA/aZV1whBBtXxERtz60MHMYVO5ursKAmSCyhTHrW4s7rw72AUO8J0WrjQd7jGiF1+
 /TOxYxa4J5UrpBdv8/OcEhYJC9igrtL4/hEJRv46VVDq2ul5qqGQyeJdy5mI9D/gcNr4
 q5+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhLJn2/Nh13/X87g/1CEZe5C+a2Yxb3LSgfxkZh/34MOmHAPCdwUVqondJ7g4Bzp3lvZ9x8nBoDFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7ylgJ903anROKcxIcazG5J+J1jOH5RPO5q1nRnpA9Jpp4JROb
 KfiSFlJ+hjProIP0kTMf9SZ1cMb5/n4OrY270A8oYpoBHFPdKLTeM8mWS3/rRpfPZv+AAyRXqed
 CQSOt/Ur4YPAmVNq5wzi3ceMPISTVI45c4S2sHzLRjK8n1sJZ4uXQk36pGi3o+vbjkQ==
X-Gm-Gg: ASbGncs4HtmJfv6XR3SoPKvGyKbbo7yEu6R7QuW5cIOu+6qXcoDw99v/qG0k3NFf4gq
 YuEA7spPZi8aXhmkaBhSxleaWlgrg57tOWWUR0/PPoHOHTg00czrx4V1CKowugkA3feSjvFLcJa
 MAO136jlNT0D8mBZqJe9KKx+cRm5NPvd+AxfwiGVdKN4/aiaTPUoXL13laXOZxaQtvZxDpKeuui
 TYpFCcBbnhlbixYgHnqGTzTTv0W/xkyA3zW1bgmd/mq6MUAuc2evAq7oAacRjJc7jonZfKLnm1d
 SKfcZR2fKuS0yRIW9lsQQYCgffjYAsxA9vj68HqKoLYE
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-38c5194a53dmr2175077f8f.14.1738148999696; 
 Wed, 29 Jan 2025 03:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOUb2qscjrJZ1USmqwrKVvLwRqB3LstBKnfePRGO2fd2MknKPUVKJwVyyCE5EOqS1tTfK3bQ==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-38c5194a53dmr2175043f8f.14.1738148999233; 
 Wed, 29 Jan 2025 03:09:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a313383sm17203789f8f.36.2025.01.29.03.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:09:58 -0800 (PST)
Message-ID: <1789d9d5-76ed-4a0f-9185-4c5b0d719a1b@redhat.com>
Date: Wed, 29 Jan 2025 12:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] drm/ast: Add support_wuxga flag to struct
 ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250129095840.20629-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZyXhslVYLUpbx0LLHqPYf9QWQ-foNEDTtw6wTgoqNvU_1738149000
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

On 29/01/2025 10:54, Thomas Zimmermann wrote:
> Detect support for 1920x1200 (WUXGA) in ast_detect_widescreen(). The
> flag is cleared by default. The test logic has been taken from existing
> code in ast_crtc_helper_mode_valid(). The code in that function is being
> replaced by the new flag.
> 
> v2:
> - move shared detection code into helper (Jocelyn)


Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c | 27 +++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_mode.c |  8 +++-----
>   drivers/gpu/drm/ast/ast_reg.h  |  1 +
>   4 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 01ef0c0d5db7d..4e3a88f8a85ca 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -207,6 +207,7 @@ struct ast_device {
>   
>   	bool support_wsxga_p; /* 1680x1050 */
>   	bool support_fullhd; /* 1920x1080 */
> +	bool support_wuxga; /* 1920x1200 */
>   
>   	u8 *dp501_fw_addr;
>   	const struct firmware *dp501_fw;	/* dp501 fw */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 6e964a0714b4b..44b9b5f659fc8 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -49,14 +49,31 @@ static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
>   	return false;
>   }
>   
> +/* Try to detect WUXGA on Gen2+ */
> +static bool __ast_2100_detect_wuxga(struct ast_device *ast)
> +{
> +	u8 vgacrd1;
> +
> +	if (ast->support_fullhd) {
> +		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static void ast_detect_widescreen(struct ast_device *ast)
>   {
>   	ast->support_wsxga_p = false;
>   	ast->support_fullhd = false;
> +	ast->support_wuxga = false;
>   
>   	if (AST_GEN(ast) >= 7) {
>   		ast->support_wsxga_p = true;
>   		ast->support_fullhd = true;
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 6) {
>   		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> @@ -64,6 +81,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 5) {
>   		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> @@ -71,6 +90,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 4) {
>   		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> @@ -78,6 +99,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 3) {
>   		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> @@ -85,6 +108,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			if (ast->chip == AST2200)
>   				ast->support_fullhd = true;
>   		}
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 2) {
>   		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> @@ -92,6 +117,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			if (ast->chip == AST2100)
>   				ast->support_fullhd = true;
>   		}
> +		if (__ast_2100_detect_wuxga(ast))
> +			ast->support_wuxga = true;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index dda2c4fb0a48b..bc0c7db5ad46e 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1022,7 +1022,6 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
>   	enum drm_mode_status status;
> -	uint32_t jtemp;
>   
>   	if (ast->support_wsxga_p) {
>   		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
> @@ -1041,11 +1040,10 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   				return MODE_OK;
>   
>   			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
> -				jtemp = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
> -				if (jtemp & 0x01)
> -					return MODE_NOMODE;
> -				else
> +				if (ast->support_wuxga)
>   					return MODE_OK;
> +				else
> +					return MODE_NOMODE;
>   			}
>   		}
>   	}
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index b4ff38949a565..9db0d584652a4 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -55,6 +55,7 @@
>   #define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
>   #define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c /* special case of DP501 */
>   #define AST_IO_VGACRD1_TX_ASTDP			0x0e
> +#define AST_IO_VGACRD1_SUPPORTS_WUXGA		BIT(0)
>   
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)

