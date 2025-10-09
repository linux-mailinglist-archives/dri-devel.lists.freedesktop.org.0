Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92ACBC914E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC0310E163;
	Thu,  9 Oct 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VRYbGlRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9210E163
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFfgIRX9aW8GqfaLijhDuL2GON1mJcxeVZDNk9t4If0=;
 b=VRYbGlRvIN4KSbP7KpF3fInGOoOvxM4g/ZPOkVatM/sTbRSSl0KDdMSpF2bPIwJ3wCa6mE
 H5EMxBem5YVp0TD5+qwGrvTtkPGjLx7wTNRJWQnjLmX875l23+mMzzT97gIOZgouoPWc4B
 DCgjQPjQOXLBHO7HXFsZ8NBTZmJOn3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-th4Dk8r5PRGmYSBWo3S30A-1; Thu, 09 Oct 2025 08:41:28 -0400
X-MC-Unique: th4Dk8r5PRGmYSBWo3S30A-1
X-Mimecast-MFC-AGG-ID: th4Dk8r5PRGmYSBWo3S30A_1760013687
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ee1317b132so578175f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760013687; x=1760618487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFfgIRX9aW8GqfaLijhDuL2GON1mJcxeVZDNk9t4If0=;
 b=kCtMTKEE9mnfEgkEMm9kGp0PHMfm3B0boP9GdJ8WHWwZC6jjp6WXzRSV28zyiBwk0z
 xyGTYF1AJuZuelB1MX+VR8x9Tz9+/9TAIhEGbCS0kCS2WBnpmID3nQhuGIV2ny7ZS1DP
 UxrgPXzPIZJsEop2ol0lCqXZfAEe9eChBqKgG2+8N9GqKEuu4+76A/d6gpar4SUaDxG6
 QI2yUhL0feo0Z4XXDN6OGfeiPi2SrBL6wJUKX6eroF7cz9k4KifKqHnjEp63AlkWlr+O
 kVu0Lc3N7d3pvL8/J8IeO3FQlaagmUo83eJwyTWXRthiAqkaGnhxz3M+vc16yql9LRpg
 3Y6Q==
X-Gm-Message-State: AOJu0Yw9OPOS7kgz+JRi+xNAeq54B2AqNNw387W+c+/BZ1mT2AbWRVV0
 e/3LMB8GZeX/MUL1tVmT1deihCNWqoL8V7yhcEg0wY0XUqiT9IU91kL2wEy09IvtG5l7/wDkZ/3
 D1xU81502vl59Om+LC4XAJxa+h3+UvY6FUzt2reD1tTFgX0lJYAzUB0NKiRJWFhupuwlKcQ==
X-Gm-Gg: ASbGnctHWuYvHMHh/oeksylUzQBTj9HES6tNff3Bj3eZqPK5MS01WEr9sqe0vbug7W2
 QeuOPOitg0NK7Rkhtjq0nIneMP0I0T1165T+OBZ7w301dFstlLo8NjD5JmdjCB738dvyHAy9XK2
 nt130AG114Lm4hPpnDEPfJR+I6a4T0nlUIiQPDZ0bPkXrlGLhQh3bGhinzObu7Ogpz9HEoTVxQs
 u4BEwiEBPl60o07ntn1PqhNWgyrN5AOokw+HNFIWGCPFHeY2XPbufzy+VaSLKz86lPEkqJXHwip
 OytqNAwaP+LKNxQEpNFevAdXGzzAKhpEZRb+eJcom0spQ+pY8H70lZwhmO5Kj6ghaAnMo8GjMYf
 U+XsSW5wGfA==
X-Received: by 2002:a05:6000:2409:b0:3ec:a76e:95d6 with SMTP id
 ffacd0b85a97d-4266e8e0939mr4376070f8f.55.1760013686693; 
 Thu, 09 Oct 2025 05:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEV6Gnd6oq5ICo145qCWshcwmuMFX6imaHselr1uwYPAtIeXndoWTbKT3TiKkx/SqD7XlwGg==
X-Received: by 2002:a05:6000:2409:b0:3ec:a76e:95d6 with SMTP id
 ffacd0b85a97d-4266e8e0939mr4376051f8f.55.1760013686272; 
 Thu, 09 Oct 2025 05:41:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97fbsm34377447f8f.34.2025.10.09.05.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:41:25 -0700 (PDT)
Message-ID: <5efdc95a-e1a1-4282-81ef-d9e4bef3ec8b@redhat.com>
Date: Thu, 9 Oct 2025 14:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/ast: Store precatch settings in struct
 ast_device_quirks
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251007150343.273718-1-tzimmermann@suse.de>
 <20251007150343.273718-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251007150343.273718-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7KNF9l-AROpD6lCJGe8uO3JqMly_tAdfXrWrL4xxiHI_1760013687
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

On 10/7/25 16:54, Thomas Zimmermann wrote:
> Add a precatch flag in struct ast_device_info and set it on AST2500
> and AST2600. Remove calls to IS_AST_GENn() from ast_set_crtc_reg().
> 
> Also fix the coding style in several places.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2500.c |  1 +
>   drivers/gpu/drm/ast/ast_2600.c |  1 +
>   drivers/gpu/drm/ast/ast_drv.h  |  6 ++++++
>   drivers/gpu/drm/ast/ast_mode.c | 17 ++++++++---------
>   4 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index 416bce9ea757..2a52af0ded56 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -621,6 +621,7 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
>   static const struct ast_device_quirks ast_2500_device_quirks = {
>   	.crtc_mem_req_threshold_low = 96,
>   	.crtc_mem_req_threshold_high = 120,
> +	.crtc_hsync_precatch_needed = true,
>   };
>   
>   struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index bb0a50b25766..7cde5ce9c41f 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -62,6 +62,7 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
>   static const struct ast_device_quirks ast_2600_device_quirks = {
>   	.crtc_mem_req_threshold_low = 160,
>   	.crtc_mem_req_threshold_high = 224,
> +	.crtc_hsync_precatch_needed = true,
>   };
>   
>   struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 926e1c7de6f8..76969244d36f 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -170,6 +170,12 @@ struct ast_device_quirks {
>   	 */
>   	unsigned char crtc_mem_req_threshold_low;
>   	unsigned char crtc_mem_req_threshold_high;
> +
> +	/*
> +	 * Adjust hsync values to load next scanline early. Signalled
> +	 * by AST2500PreCatchCRT in VBIOS mode flags.
> +	 */
> +	bool crtc_hsync_precatch_needed;
>   };
>   
>   struct ast_device {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index da374af9596d..ebb1ec82d904 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -241,16 +241,15 @@ static void ast_set_std_reg(struct ast_device *ast,
>   		ast_set_index_reg(ast, AST_IO_VGAGRI, i, stdtable->gr[i]);
>   }
>   
> -static void ast_set_crtc_reg(struct ast_device *ast,
> -			     struct drm_display_mode *mode,
> +static void ast_set_crtc_reg(struct ast_device *ast, struct drm_display_mode *mode,
>   			     const struct ast_vbios_enhtable *vmode)
>   {
>   	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
> -	u16 temp, precache = 0;
> +	u16 temp;
> +	unsigned char crtc_hsync_precatch = 0;
>   
> -	if ((IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) &&
> -	    (vmode->flags & AST2500PreCatchCRT))
> -		precache = 40;
> +	if (ast->quirks->crtc_hsync_precatch_needed && (vmode->flags & AST2500PreCatchCRT))
> +		crtc_hsync_precatch = 40;
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x11, 0x7f, 0x00);
>   
> @@ -276,12 +275,12 @@ static void ast_set_crtc_reg(struct ast_device *ast,
>   		jregAD |= 0x01;  /* HBE D[5] */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x03, 0xE0, (temp & 0x1f));
>   
> -	temp = ((mode->crtc_hsync_start-precache) >> 3) - 1;
> +	temp = ((mode->crtc_hsync_start - crtc_hsync_precatch) >> 3) - 1;
>   	if (temp & 0x100)
>   		jregAC |= 0x40; /* HRS D[5] */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x04, 0x00, temp);
>   
> -	temp = (((mode->crtc_hsync_end-precache) >> 3) - 1) & 0x3f;
> +	temp = (((mode->crtc_hsync_end - crtc_hsync_precatch) >> 3) - 1) & 0x3f;
>   	if (temp & 0x20)
>   		jregAD |= 0x04; /* HRE D[5] */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x05, 0x60, (u8)((temp & 0x1f) | jreg05));
> @@ -348,7 +347,7 @@ static void ast_set_crtc_reg(struct ast_device *ast,
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x09, 0xdf, jreg09);
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAE, 0x00, (jregAE | 0x80));
>   
> -	if (precache)
> +	if (crtc_hsync_precatch)
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0x3f, 0x80);
>   	else
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0x3f, 0x00);

