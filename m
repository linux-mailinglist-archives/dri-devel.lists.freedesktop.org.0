Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28F3B8844E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1310E949;
	Fri, 19 Sep 2025 07:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FJRyA66l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA7610E949
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LMWCEJ5gYdWz32cYaY0j2E5hwZM0y1jni4b+fMz33I=;
 b=FJRyA66lNz/X959j+uhNjucK4Gcr5x8l8TLJq2Fyg48rmbFY2DYJygt6IkvTv9TOa29RHR
 1qw/JVDxUvIRsIPH3BlP8CcedZVnYHNkW2J4wyZnFq/+rAstRo1llo7fDg23G7OouueZHx
 2pgwnEke8qRntyekLNQ2fCl9Aa4D3O4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-NMD_OxxUObmphe-z2xoshA-1; Fri, 19 Sep 2025 03:52:02 -0400
X-MC-Unique: NMD_OxxUObmphe-z2xoshA-1
X-Mimecast-MFC-AGG-ID: NMD_OxxUObmphe-z2xoshA_1758268322
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ee13baf21dso2313529f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268322; x=1758873122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LMWCEJ5gYdWz32cYaY0j2E5hwZM0y1jni4b+fMz33I=;
 b=j4+T69SOaN0YKztb+ENHrQhMZROpJVm6SnecswsjC+y/03ib94SlcHfTc6CoBfwfuc
 +3OqRa/aeg8KlbvuHGLGztX2XpACOH1A6EZ/zsY7tPgmsEeOlBal5JoIq3AT7i1Xxw8A
 ykN/w03KdcBSawSylHcTZ9UIanuepgqz2HhwiCfsAfGNm/GX4ORneIJG2+azS2ut4p+r
 cGla5UQV1JfAPKyWuNcVF/fPBo5I8nJtTBnbuQLMpVCN3jnhz2ssLgD0rPzdPSjPTUcT
 T+cas/wDmHCw/ZeqswPWoaPTWN6L9P9s2ZTbvQ/4aZPM3y7zzwkyAfGuf1OEes3NfflK
 ovqw==
X-Gm-Message-State: AOJu0YxEGwilHlfMMNbZ+omAQLaDrWaYW20eF81VV67HyzfFAUgj9aAv
 DxxHuKty0UaLSd/qus6eTbCgf3sz2/EKXlmAliZt1LZYiIZXwpOnj2zzFuxI1BJioUjK1UIs5Ox
 lOOyi39Or6tSgkI1YhQ8qyTtm1SCLbltyPiOUy3yGI7W9WjR3GXmOXS61JhDUzMqxpxWHSg==
X-Gm-Gg: ASbGncutCfVIf2l7I1gqaHHYZ2GY066WkogDuUFhGFJZnLLvzLmB9+S51SJ1Zu9QmBJ
 CJ8EA0mQCXc6j8pn2EK9qxJ23WJhu8WqZTnLHLFc5+zpadW/OMr62sKjZ+tSLtsWKtNZfyzzQvO
 5AQuItDSBb8vTCBO0vxxd38RgIrzVce5xtX02ym7g3oiu5m8cl4K0h1qaXBxU1yLcpahOIKmPBD
 cj0XBs5BS99GE6v4UeuNb8HsF0HiexaXkQYrBYy/1goVwTHFm/jG+llqU/E9sPAoPbO8FN3cC7z
 gtQtgfMLePk+qtqqv61RUXktWZdQ5Tp+vI2zEK1jcs/7aCvuihp9wdHvwRxY0TaMNG1/O6ZlXFl
 M2BuW
X-Received: by 2002:a5d:584f:0:b0:3d1:61f0:d26c with SMTP id
 ffacd0b85a97d-3ee862edc77mr1540143f8f.54.1758268321695; 
 Fri, 19 Sep 2025 00:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/8CHyTPVsiGWZuh1Ep8nbo9Dbz58kAWEyiyQkbgmgyVKZyHvSamaFeJVtlfn8N+S+IqVvUA==
X-Received: by 2002:a5d:584f:0:b0:3d1:61f0:d26c with SMTP id
 ffacd0b85a97d-3ee862edc77mr1540122f8f.54.1758268321271; 
 Fri, 19 Sep 2025 00:52:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07412111sm6646318f8f.28.2025.09.19.00.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 00:52:00 -0700 (PDT)
Message-ID: <386cb1af-879c-4200-b028-228f97eb8a6e@redhat.com>
Date: Fri, 19 Sep 2025 09:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/ast: Move mode-detection helpers to Gen2 source
 files
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: njldtVzCczDlUvB_gxo-qSW-EE0QwB2mUge-158gIqU_1758268322
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

On 16/09/2025 17:26, Thomas Zimmermann wrote:
> Wide-screen modes are only available on Gen2 and later. Move the
> detection helpers to the appropriate source file.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2100.c | 31 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.h  |  2 ++
>   drivers/gpu/drm/ast/ast_main.c | 27 ---------------------------
>   3 files changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 829e3b8b0d19..16a279ec8351 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -386,3 +386,34 @@ int ast_2100_post(struct ast_device *ast)
>   
>   	return 0;
>   }
> +
> +/*
> + * Widescreen detection
> + */
> +
> +/* Try to detect WSXGA+ on Gen2+ */
> +bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
> +{
> +	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +
> +	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +		return true;
> +	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +		return true;
> +
> +	return false;
> +}
> +
> +/* Try to detect WUXGA on Gen2+ */
> +bool __ast_2100_detect_wuxga(struct ast_device *ast)
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
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 482d1eb79d64..c75600981251 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -421,6 +421,8 @@ extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
>   
>   /* ast_2100.c */
>   int ast_2100_post(struct ast_device *ast);
> +bool __ast_2100_detect_wsxga_p(struct ast_device *ast);
> +bool __ast_2100_detect_wuxga(struct ast_device *ast);
>   
>   /* ast_2300.c */
>   int ast_2300_post(struct ast_device *ast);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 3eea6a6cdacd..1678845274c7 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -36,33 +36,6 @@
>   
>   #include "ast_drv.h"
>   
> -/* Try to detect WSXGA+ on Gen2+ */
> -static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
> -{
> -	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> -
> -	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> -		return true;
> -	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> -		return true;
> -
> -	return false;
> -}
> -
> -/* Try to detect WUXGA on Gen2+ */
> -static bool __ast_2100_detect_wuxga(struct ast_device *ast)
> -{
> -	u8 vgacrd1;
> -
> -	if (ast->support_fullhd) {
> -		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> -		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
>   static void ast_detect_widescreen(struct ast_device *ast)
>   {
>   	ast->support_wsxga_p = false;

