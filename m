Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DDBB88448
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EEE10E229;
	Fri, 19 Sep 2025 07:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5r7OWFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA59410E229
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FvrDe8P4sA1KbPVOR/0iOXvF+eI33HR34AuYopc1j8=;
 b=E5r7OWFE/Qv7cW1d6Y8SEYpYvjbHDOksW1xTsrONtrxLnPTPVBKvMtgBdOrpm3916rElwU
 F9vg95pC6kXEBw0yTMZTyNUQPxy2iKSnqygWO426R9Ksyxanqc16zuHu9R52XVd8r273V4
 853fL9d7ifroaip32AutENH7nZBhJKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-8uzqjj8XOpmE-MsNMSFdww-1; Fri, 19 Sep 2025 03:51:46 -0400
X-MC-Unique: 8uzqjj8XOpmE-MsNMSFdww-1
X-Mimecast-MFC-AGG-ID: 8uzqjj8XOpmE-MsNMSFdww_1758268305
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45f2f1a650dso11622125e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268305; x=1758873105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9FvrDe8P4sA1KbPVOR/0iOXvF+eI33HR34AuYopc1j8=;
 b=Jaz4HZReeVVphrtsgDIRUvmsCTF0Wszm7fAXXnpQ0OzF2IbXe4bHbItRqgRwvj0kGD
 v/J3DNGZwj2p+OumkPOl8AojPMxgkTG74WX1phExCmlaNvyEC013w4jD9cn3cUTjRek2
 K6x5YGAYIGzJuyQWM12TDY3YygeOKnT1HRYdcZVtfYKMJWtHE4a4P0xFFe0n9Ie0aiuQ
 kzPhP0TF/mNI7DzVm5osI1Pr7Bv/Z9YfB4XvHS5mC5yQXVzakMG06ayQ4oHU+ckGO+L6
 G6ojXz257vG2msnlJmSqsF32nfHuva+bMZ/hwx+Vj78kJ/3uObHINooTFoG/YSmoqoR9
 d7iQ==
X-Gm-Message-State: AOJu0YxGoVlA8T0JQ4kFFAOssm14cGZkk1PblUnTp9f8EKakVM2PmJCc
 x6Hw9HeXSt4yDXGzK4kfeTjiVpwik3umxDpuMvaBNyhX1PKVZBN7x09IuAB+c9OkSWg87QKWMjZ
 4Z+dGEunYTuX8Isktei7euL5qWBm2lLmKj0NAadhaZ8bBJY+oAoKWurVNPo9KDeXaVck5nQ==
X-Gm-Gg: ASbGncuUGkqpHvN3Df/vO5iFiP7/M9P7zs8eBQjUR10H9OIicFn0cQ+DSZKgdw2pliM
 IBIeABcfhajHw+meCCCBnIsBGDPk3iLH4gXki9f10rNOyVfjpfQjh4GDsGgUfSwvc5Gtr87oiTk
 opUwekQtGcPzzDNCfa6LTsRMrduCJozriGhCnSyOdgY9I1oR4Bcbp4uhN4boCy6CsH8dGYLQVZC
 6mhIcTkuiB075vQ9m7gOf5feYHgPWnohksKCwNWKmunnMCsfQ/I2YasT8Mu3qfndO8ZXhxHDaoU
 zmsfuny+DITKRbFY9peVA4AloP2foRC+ufHrQ7jr1kXbq1LizwSYbeWm8R9Q0tBsl3bIlT9dJhX
 sefN9
X-Received: by 2002:a05:600c:3114:b0:456:13b6:4b18 with SMTP id
 5b1f17b1804b1-467ebbc0427mr19447065e9.31.1758268305045; 
 Fri, 19 Sep 2025 00:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF44aza0J7t+G9wWdnDRvjLKumuLClnx54pthvoj5RS4ro+hKyfP1dhkDGZAeMaimUysz5+Rw==
X-Received: by 2002:a05:600c:3114:b0:456:13b6:4b18 with SMTP id
 5b1f17b1804b1-467ebbc0427mr19446775e9.31.1758268304521; 
 Fri, 19 Sep 2025 00:51:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46139122cb5sm111628005e9.8.2025.09.19.00.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 00:51:43 -0700 (PDT)
Message-ID: <8c8c5bf2-1374-45cd-a0ce-ecaf346062a7@redhat.com>
Date: Fri, 19 Sep 2025 09:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/ast: Move display-clock tables to per-Gen
 source files
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0_Ih7hjLKVqorscsLB4321HyDIQVDa3ueqsI3O40VHQ_1758268305
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
> Move display-clock tables to the appropriate per-Gen source files.
> The tables are almost identical, except for mode entries 0x17 and
> 0x1a. Rename to tables to match common style.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c   | 34 ++++++++++++++++++
>   drivers/gpu/drm/ast/ast_2500.c   | 34 ++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.h    |  2 ++
>   drivers/gpu/drm/ast/ast_mode.c   |  4 +--
>   drivers/gpu/drm/ast/ast_tables.h | 60 --------------------------------
>   5 files changed, 72 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 41c2aa1e425a..a31daf7c2ceb 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -147,3 +147,37 @@ int ast_2000_post(struct ast_device *ast)
>   
>   	return 0;
>   }
> +
> +/*
> + * Mode setting
> + */
> +
> +const struct ast_vbios_dclk_info ast_2000_dclk_table[] = {
> +	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
> +	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
> +	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
> +	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
> +	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
> +	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
> +	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
> +	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
> +	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
> +	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
> +	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
> +	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
> +	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
> +	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
> +	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
> +	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
> +	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
> +	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
> +	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
> +	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
> +	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
> +	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
> +	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
> +	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
> +	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
> +	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
> +	{0x3b, 0x2c, 0x81},			/* 1a: VCLK118_25	*/
> +};
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index 1e541498ea67..b12fec161f2b 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -567,3 +567,37 @@ int ast_2500_post(struct ast_device *ast)
>   
>   	return 0;
>   }
> +
> +/*
> + * Mode setting
> + */
> +
> +const struct ast_vbios_dclk_info ast_2500_dclk_table[] = {
> +	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
> +	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
> +	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
> +	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
> +	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
> +	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
> +	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
> +	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
> +	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
> +	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
> +	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
> +	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
> +	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
> +	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
> +	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
> +	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
> +	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
> +	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
> +	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
> +	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
> +	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
> +	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
> +	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
> +	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
> +	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
> +	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
> +	{0x44, 0x20, 0x43},			/* 1a: VCLK118_25	*/
> +};
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c15aef014f69..482d1eb79d64 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -417,6 +417,7 @@ int ast_mm_init(struct ast_device *ast);
>   
>   /* ast_2000.c */
>   int ast_2000_post(struct ast_device *ast);
> +extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
>   
>   /* ast_2100.c */
>   int ast_2100_post(struct ast_device *ast);
> @@ -427,6 +428,7 @@ int ast_2300_post(struct ast_device *ast);
>   /* ast_2500.c */
>   void ast_2500_patch_ahb(void __iomem *regs);
>   int ast_2500_post(struct ast_device *ast);
> +extern const struct ast_vbios_dclk_info ast_2500_dclk_table[];
>   
>   /* ast_2600.c */
>   int ast_2600_post(struct ast_device *ast);
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index b4e8edc7c767..6b9d510c509d 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -373,9 +373,9 @@ static void ast_set_dclk_reg(struct ast_device *ast,
>   	const struct ast_vbios_dclk_info *clk_info;
>   
>   	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
> -		clk_info = &dclk_table_ast2500[vmode->dclk_index];
> +		clk_info = &ast_2500_dclk_table[vmode->dclk_index];
>   	else
> -		clk_info = &dclk_table[vmode->dclk_index];
> +		clk_info = &ast_2000_dclk_table[vmode->dclk_index];
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
> diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
> index f1c9f7e1f1fc..7da5b5c60f41 100644
> --- a/drivers/gpu/drm/ast/ast_tables.h
> +++ b/drivers/gpu/drm/ast/ast_tables.h
> @@ -33,66 +33,6 @@
>   #define HiCModeIndex		3
>   #define TrueCModeIndex		4
>   
> -static const struct ast_vbios_dclk_info dclk_table[] = {
> -	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
> -	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
> -	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
> -	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
> -	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
> -	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
> -	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
> -	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
> -	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
> -	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
> -	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
> -	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
> -	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
> -	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
> -	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
> -	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
> -	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
> -	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
> -	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
> -	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
> -	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
> -	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
> -	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
> -	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
> -	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
> -	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
> -	{0x3b, 0x2c, 0x81},			/* 1A: VCLK118_25	*/
> -};
> -
> -static const struct ast_vbios_dclk_info dclk_table_ast2500[] = {
> -	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
> -	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
> -	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
> -	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
> -	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
> -	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
> -	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
> -	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
> -	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
> -	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
> -	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
> -	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
> -	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
> -	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
> -	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
> -	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
> -	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
> -	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
> -	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
> -	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
> -	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
> -	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
> -	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
> -	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
> -	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
> -	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
> -	{0x44, 0x20, 0x43},			/* 1A: VCLK118_25	*/
> -};
> -
>   static const struct ast_vbios_stdtable vbios_stdtable[] = {
>   	/* MD_2_3_400 */
>   	{

