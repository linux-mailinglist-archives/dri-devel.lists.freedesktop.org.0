Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C68A1D857
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A908710E23C;
	Mon, 27 Jan 2025 14:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VrjYjR3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D23D10E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737988104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FyoycoPQ2wAtTGSVTBpbfp7AYU678/DAZS+aZd1KT5k=;
 b=VrjYjR3buI6kwdV7yUzTjTM6OEx6qB5SYivv2t0qxcIYeu3F1tvUe456OPzLT1S4P/eLWO
 kwCPGwgWeklkqQSk4nNF5wwXHQwkTFDRwznARtL8Io81PpotQ7E0+GQ+25QewynV+yvpak
 dwEsamLCLZqU2Q/H84h5VoCCfzcuT3U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-fanafUQHPa6gAOv0pcRwfw-1; Mon, 27 Jan 2025 09:28:23 -0500
X-MC-Unique: fanafUQHPa6gAOv0pcRwfw-1
X-Mimecast-MFC-AGG-ID: fanafUQHPa6gAOv0pcRwfw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385d52591d6so1912568f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988102; x=1738592902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FyoycoPQ2wAtTGSVTBpbfp7AYU678/DAZS+aZd1KT5k=;
 b=E5giI9ESoiBwudHBhKlrupTLrZd58NuWqwvKLt3TzJuQq2kQwKI8y6Q9A8YfuVvSqj
 HkAgLfrwcm6JQ3cgrG5QYplE3xmcXy7Fw1lX2tRaHgf14BG26cWMo2UQVtydgGzARKuM
 UDJpjwA/bQdUzasZGFjLfTMzlq+Vm0VKnOaFJXC2rPgDwenao/YuMLQHc9pPYM4MdelV
 Dh6qcPdu7GeenaiH2vB1N5RGLwJxcBO7VL0MIYc0S9ZiJ9gBmvcNbuCe/6MuxLsgsTXw
 rrJn06eAhfZD7QBCOyj2WZNemEdYvRsg0c4KqJZjgF/2vehjcVogKmicfWoiHQWkOpwc
 Pgmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdXu4hvGFJlu5YxFSBhOZB8VYpYVh4xvaA0cHLgRGgxlvK6fMpZQ2qq66eD5Ylo9oBh8+TWF6IeOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws7u+5c/UC32xCsSbmR+klPENIj8UvUrrgqZ+Hbc2dMGUZl93F
 TeKuXc4fo42quaolXhSo5/XErnNTTqFCvgQAxNqP1NG7tuBqMo5JDwUq2oQKr8DrhykM04zAhvO
 mqP6L5sq3b8znQ03xUKdA7l7+4Fk3Ewm5k9ToSAoovypWTE7ko9GGkZZLA7md11KJgg==
X-Gm-Gg: ASbGnctEENPo6Rundbq1JYYnyoU1N5s1hz4qalplziOZkIoZpyu8XHNpxfXwOa7Fwh3
 zkeR34ASX6GCVhC0vnyxlXsptfomP1R9YBTvGRPZPUAHC4K1l63Wmwfsks031QmYa7Ub54mglFB
 WHy8nqhhT9B7aV8QRIP9BpTRF1fh1Hkoh5M9e4MdPRCO8kFEiRQjaaTSDFE6QhuehJMRu3h1fL7
 80EbRJNuvtW5BVvNrhesOThAfqcHcLyJu4vxw1KoNyk/kZobU2iWe39jiYwB0QRLnU1IsPm+7T+
 W3LTmAdej3psUJVrU32S5l+O3tjNzdCJUeiw0QHHjjxZ
X-Received: by 2002:a5d:47a4:0:b0:386:37f8:451c with SMTP id
 ffacd0b85a97d-38c2b65eccbmr11702026f8f.1.1737988101905; 
 Mon, 27 Jan 2025 06:28:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwJu0izBCWV6JfI3LAhVc2Agt+yXqGY+uVdrtb7RtttFhNEsrg4euN+eQcBNCnA6YVncGzMA==
X-Received: by 2002:a5d:47a4:0:b0:386:37f8:451c with SMTP id
 ffacd0b85a97d-38c2b65eccbmr11701991f8f.1.1737988101450; 
 Mon, 27 Jan 2025 06:28:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188fd0sm11499238f8f.58.2025.01.27.06.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:28:21 -0800 (PST)
Message-ID: <e2b583b3-bfbd-4b90-ad76-355325aec069@redhat.com>
Date: Mon, 27 Jan 2025 15:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] drm/ast: Add support_fullhd flag to struct
 ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vUfjAa1aCX9l7xRk-mevY4u_CFKZ80OLjgbsdqY2BRc_1737988102
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
> Detect support for 1920x1080 (FullHD) in ast_detect_widescreen(). The
> flag is cleared by default. The test logic has been taken from existing
> code in ast_crtc_helper_mode_valid(). The code in that function is being
> replaced by the new flag.
> 
> For Gen3, a new branch duplicates the Gen2 logic and adds a test for
> AST2200. Gen2 adds a test for AST2100.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_mode.c |  5 +----
>   3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ec5b204be1dae..01ef0c0d5db7d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -206,6 +206,7 @@ struct ast_device {
>   	} output;
>   
>   	bool support_wsxga_p; /* 1680x1050 */
> +	bool support_fullhd; /* 1920x1080 */
>   
>   	u8 *dp501_fw_addr;
>   	const struct firmware *dp501_fw;	/* dp501 fw */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index e1cfb2a1a5448..e6237ba92cce3 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -41,9 +41,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   	u8 vgacrd0;
>   
>   	ast->support_wsxga_p = false;
> +	ast->support_fullhd = false;
>   
>   	if (AST_GEN(ast) >= 7) {
>   		ast->support_wsxga_p = true;
> +		ast->support_fullhd = true;
>   	} else if (AST_GEN(ast) >= 6) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -52,6 +54,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST2510)
>   			ast->support_wsxga_p = true;
> +		if (ast->support_wsxga_p)
> +			ast->support_fullhd = true;
>   	} else if (AST_GEN(ast) >= 5) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -60,6 +64,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST1400)
>   			ast->support_wsxga_p = true;
> +		if (ast->support_wsxga_p)
> +			ast->support_fullhd = true;
>   	} else if (AST_GEN(ast) >= 4) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -68,12 +74,28 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST1300)
>   			ast->support_wsxga_p = true;
> +		if (ast->support_wsxga_p)
> +			ast->support_fullhd = true;
> +	} else if (AST_GEN(ast) >= 3) {
> +		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +			ast->support_wsxga_p = true;
> +		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +			ast->support_wsxga_p = true;
> +		if (ast->support_wsxga_p) {
> +			if (ast->chip == AST2200)
> +				ast->support_fullhd = true;
> +		}
>   	} else if (AST_GEN(ast) >= 2) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
>   			ast->support_wsxga_p = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
>   			ast->support_wsxga_p = true;
> +		if (ast->support_wsxga_p) {
> +			if (ast->chip == AST2100)
> +				ast->support_fullhd = true;
> +		}
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d1b3136b37693..594a58401cf66 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1036,10 +1036,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
>   			return MODE_OK;
>   
> -		if ((ast->chip == AST2100) || // GEN2, but not AST1100 (?)
> -		    (ast->chip == AST2200) || // GEN3, but not AST2150 (?)
> -		    IS_AST_GEN4(ast) || IS_AST_GEN5(ast) ||
> -		    IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) {
> +		if (ast->support_fullhd) {
>   			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
>   				return MODE_OK;
>   

