Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5DA5C1CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5329E10E59A;
	Tue, 11 Mar 2025 13:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LrDKG/5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DCC10E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zwNyXlZetrzGDU8lusB5eC4UnX/a2yY+JF310qh4Ns=;
 b=LrDKG/5MCjDznSOgRQNguNsxi7nlsZUYC297PibAImzJ/1sdPKTXWJpue0k8kbIW33ZLzx
 e1i6hHlzdsGNpu6pWa1uU4EY7GiHmOItebwVdtelV/QTYEU1jk2YE7+QNTIpDd+PYevl9g
 Hs/PbyfvDWXwtlcGOdA7XNKLbpJbOjg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-rH9QiQkmNAGzFwI8zNFUZA-1; Tue, 11 Mar 2025 09:01:54 -0400
X-MC-Unique: rH9QiQkmNAGzFwI8zNFUZA-1
X-Mimecast-MFC-AGG-ID: rH9QiQkmNAGzFwI8zNFUZA_1741698113
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so13555615e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698113; x=1742302913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zwNyXlZetrzGDU8lusB5eC4UnX/a2yY+JF310qh4Ns=;
 b=xJCVqcz+3eXfSXUrAg8PL/43LGeKYdH067y86P7SOyIFTpnhl1G5GH66sol/b//7Q8
 FRdj4cnfkVP0mDy0wNe7BsWH60zazTPBK33Pa+HlGKDWCCJF/uJg/I5hMNwWsN9JKOLE
 9aLwQcE2fgQwZI2orDlOazyygIWZd4AzdMvS3WYjNuuYERshsk9ynv5Ixo0LBizE/bca
 QVK+j4GCE7VXtQZ3ByhIxOPOmDhkxZ8/ITXvnytnbEvzBMi6KBsSBgdiqL3NXjH8TvdN
 1BD//XgKPPZzdyxhDbPQZgjPdAteSjeH7XiUuU5NBktIoMQPuhVGcEcroe2HNWFrd0Pp
 Sm3Q==
X-Gm-Message-State: AOJu0YwsnTgYunrjE2jvbAhbqeUv3CNvSrpPTmV2qFvU6usdSLEcv0Pm
 HJyDnOrRnzHCm46n78XgXZk1sq//eX49kqvlcJv7nd5czaCJigMZrJR6OFMPPLT8ZkTZCgIwpQd
 MpMvmK8bOYFsgx1UOVCcCxPTZ8uVs9WDuMt0w8jjmDqhBEukv+fgXyEsqi8TixrPKCg==
X-Gm-Gg: ASbGncu/gSudrzdESS85beiuuhB3MQ5R/hhFqnkjsVYcAVRuP7RMqWFu+HYmWE1pQ/+
 KHgf0mR0fgb9pwoVw/wv1uzq2rZ+kWfTpLkGKE5Q6Q3lTMRNeEaO/ACtAMOIhGcEBOpqa3fnk2x
 jOyhFgdOVuM3NeH2sPIunzKVpb7tVCn8UbcZ4/BglzK05oqiw0lpow/fRsTMGg+k2a6PIW7BFNb
 828KK4u/G7ZumzXgP4Yu6Kl+fat4qKwPsVKjtv52SUN0anDqO074/k2rwOA1O8EFoq+XOzxEk5I
 DvGuDqL9zvDPmvayxF8/hGW+8NHVVmP3lmzRgGVXr9kAt4mz5n/1lf8=
X-Received: by 2002:a05:600c:3143:b0:43c:fe90:1282 with SMTP id
 5b1f17b1804b1-43d01bdbac8mr47594175e9.7.1741698113097; 
 Tue, 11 Mar 2025 06:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuC3mtxq668vN80Rq4ajgUSOAQlW5fZr3m4BoTSE+dzQs1/JfOlyrfpALCijR9Gjvz0/Rlqg==
X-Received: by 2002:a05:600c:3143:b0:43c:fe90:1282 with SMTP id
 5b1f17b1804b1-43d01bdbac8mr47593315e9.7.1741698112282; 
 Tue, 11 Mar 2025 06:01:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf515c580sm82669245e9.15.2025.03.11.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:01:51 -0700 (PDT)
Message-ID: <a4bed725-0312-4b56-ba8c-e57ca9c0fd8a@redhat.com>
Date: Tue, 11 Mar 2025 14:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/ast: Add VGACRAA register constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305134401.60609-1-tzimmermann@suse.de>
 <20250305134401.60609-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305134401.60609-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JTblscWAp37V4l5SrTKaLYEk8gaUT_VD5yozxPdAnZk_1741698113
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

On 05/03/2025 14:35, Thomas Zimmermann wrote:
> Add register constants for VGACRAA and use them when detecting the
> size of the VGA memory. Aligns the code with the programming manual.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mm.c  | 5 +++--
>   drivers/gpu/drm/ast/ast_reg.h | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 20d833632a01..8d8aac8c0814 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -37,9 +37,10 @@ static u32 ast_get_vram_size(struct ast_device *ast)
>   {
>   	u8 jreg;
>   	u32 vram_size;
> +	u8 vgacraa;
>   
> -	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xaa, 0xff);
> -	switch (jreg & 3) {
> +	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
> +	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
>   	case 0:
>   		vram_size = SZ_8M;
>   		break;
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index bb2cc1d8b84e..039b93bed19e 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -33,6 +33,7 @@
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
> +#define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
>   #define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */

