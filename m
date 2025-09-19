Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2AB8852A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0952810E95C;
	Fri, 19 Sep 2025 08:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SnubESmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEEB10E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758269006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGj4ck6PEq6VeizPfrHp9F2C6NEKUathClcGlM+qTnA=;
 b=SnubESmjfrpxZp22W1cj13uIKg/65j1inmdLN7kMXDY3bZTjqgWYYUfTIusVeONgPij3+8
 buLo7RBUplr6uZA6qU1dgSXKXMBINpK4uKJftCD58Amq/sH7W3G9xCMsaf7K3Vb8/x0Hsr
 HNfj1XOX0LDQDEuu9MzyPISzz5lmKks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-hk74oe4gPH2-ugqBPRq2Vg-1; Fri, 19 Sep 2025 04:03:25 -0400
X-MC-Unique: hk74oe4gPH2-ugqBPRq2Vg-1
X-Mimecast-MFC-AGG-ID: hk74oe4gPH2-ugqBPRq2Vg_1758269004
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45f2c1556aeso6227445e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758269004; x=1758873804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGj4ck6PEq6VeizPfrHp9F2C6NEKUathClcGlM+qTnA=;
 b=ilP6Rdgj8xpf1JqiVMrjWxgybs3eOjXZHh8Hzy7tHgiCg08e1bqdaZX7UqDKSsdl26
 tWoQIi7CPr54T1Kf79tm/4MTmCkGpawwID5rfT8JeL7wPcyCL4sVAFD7yOIcniP7+ttw
 4M3Yz/740204Px3rFN63OKf6inKRYABXe1+xswFwPdOHjcpab9kQWqh1DE2Ij2B3K7im
 nMggbqmrnc6Xj8EiGBSHlrNcHZhLSm9eL0TzVK77YJOM63plzcodUgKRUwUyGoyOEh7E
 zlM4yrWQgee9wTDCrINmVA8Gb1IxZ2xBT5/lCjKMotpXfy+oIiByexOwrEQJGJ9hkJw6
 GZ7A==
X-Gm-Message-State: AOJu0YzgK96IeuTj7+PAA5TSXGF5e/s/cype19G29FyacNPyhLrdp8nz
 mIhj3wQRYJk99VK3zD+rUO29BlY+G68XMZ7EYpeJMIb1/P/3OKQrtoK4BX8wCtpn+iNkUnpMF8H
 T1TTC6XtCtjru9ncVfJYvktf76UsFDrEXIk8/xZyNZTgdWj0uUKugQuLTZy/DB7ACXfgi0w==
X-Gm-Gg: ASbGncvSjvNGCyaTlqWOLxo6oswu/Zs1UjCYWCN6mk/Bm5BmgUlU8QzVRzvcu3jQG0V
 RoXp+Jphpr4fna/kCvCMSVB1Blcy2ilVR0O99SNoScLS0WGX2X1hQzIDpd2JR0ry8jEKxMFlc0h
 olo3oxvUXQz5iKKbYKTOOEEe9u5n7ek+RxINIPJl8zCVwfJtXBb3+KbPDAiy4SJERx7a1hEURrp
 FeiwAHNw5haKbslh3VGC2zJXrmnTirjtpRG0DsDjmfKS5aPltlL42AFKMAypJVk4NxsPNjT2h3Q
 GIMiEUptyaV/lseXe5rm+pWdzNJP65DbPP0KQJaI1pUxq28NIIUmE/0HGmyS2nlyap8l33qtUA+
 ZeHHQ
X-Received: by 2002:a05:600c:3b09:b0:45b:9afe:ad48 with SMTP id
 5b1f17b1804b1-467e82608c5mr22181695e9.16.1758269003808; 
 Fri, 19 Sep 2025 01:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1kbGdhU5XNKkGuo3r7CzqzB5INAxs49BmbmD8QUTSZRboAGAwMYAkdSe0C5/q+Q3Ww2/ABg==
X-Received: by 2002:a05:600c:3b09:b0:45b:9afe:ad48 with SMTP id
 5b1f17b1804b1-467e82608c5mr22181265e9.16.1758269003292; 
 Fri, 19 Sep 2025 01:03:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f5a2850csm73201535e9.19.2025.09.19.01.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:03:22 -0700 (PDT)
Message-ID: <38b17ff4-cf2e-48d1-983c-c0ffded844bc@redhat.com>
Date: Fri, 19 Sep 2025 10:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/ast: Remove generic device initialization
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-13-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gbwEb8hI3xsPJzZbwo0Ev7-uJ0e4LaUoyq1ar2ZvL5U_1758269004
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
> The code in ast_main.c has been split into several helpers in
> other source files. Delete the source file. With the generic
> device init gone, fail probing on unknown hardware generations.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile   |   1 -
>   drivers/gpu/drm/ast/ast_drv.c  |   5 +-
>   drivers/gpu/drm/ast/ast_drv.h  |   8 --
>   drivers/gpu/drm/ast/ast_main.c | 154 ---------------------------------
>   4 files changed, 2 insertions(+), 166 deletions(-)
>   delete mode 100644 drivers/gpu/drm/ast/ast_main.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index 0a60c9341a9f..cdbcba3b43ad 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -16,7 +16,6 @@ ast-y := \
>   	ast_dp501.o \
>   	ast_dp.o \
>   	ast_drv.o \
> -	ast_main.o \
>   	ast_mm.o \
>   	ast_mode.o \
>   	ast_post.o \
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 5ac1d32cfe69..a89735c6a462 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -411,9 +411,8 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   					     regs, ioregs, need_post);
>   		break;
>   	default:
> -		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
> -					need_post);
> -		break;
> +		dev_err(&pdev->dev, "Gen%d not supported\n", chip_gen);
> +		return -ENODEV;
>   	}
>   	if (IS_ERR(drm))
>   		return PTR_ERR(drm);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index a64eadc3b50f..35c476c85b9a 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -217,14 +217,6 @@ static inline struct ast_device *to_ast_device(struct drm_device *dev)
>   	return container_of(dev, struct ast_device, base);
>   }
>   
> -struct drm_device *ast_device_create(struct pci_dev *pdev,
> -				     const struct drm_driver *drv,
> -				     enum ast_chip chip,
> -				     enum ast_config_mode config_mode,
> -				     void __iomem *regs,
> -				     void __iomem *ioregs,
> -				     bool need_post);
> -
>   static inline unsigned long __ast_gen(struct ast_device *ast)
>   {
>   	return __AST_CHIP_GEN(ast->chip);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> deleted file mode 100644
> index d1c54700686b..000000000000
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -/*
> - * Copyright 2012 Red Hat Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the
> - * "Software"), to deal in the Software without restriction, including
> - * without limitation the rights to use, copy, modify, merge, publish,
> - * distribute, sub license, and/or sell copies of the Software, and to
> - * permit persons to whom the Software is furnished to do so, subject to
> - * the following conditions:
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> - * USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - * The above copyright notice and this permission notice (including the
> - * next paragraph) shall be included in all copies or substantial portions
> - * of the Software.
> - *
> - */
> -/*
> - * Authors: Dave Airlie <airlied@redhat.com>
> - */
> -
> -#include <linux/of.h>
> -#include <linux/pci.h>
> -
> -#include <drm/drm_atomic_helper.h>
> -#include <drm/drm_drv.h>
> -#include <drm/drm_gem.h>
> -#include <drm/drm_managed.h>
> -
> -#include "ast_drv.h"
> -
> -static void ast_detect_widescreen(struct ast_device *ast)
> -{
> -	ast->support_wsxga_p = false;
> -	ast->support_fullhd = false;
> -	ast->support_wuxga = false;
> -
> -	if (AST_GEN(ast) >= 7) {
> -		ast->support_wsxga_p = true;
> -		ast->support_fullhd = true;
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	} else if (AST_GEN(ast) >= 6) {
> -		if (__ast_2100_detect_wsxga_p(ast))
> -			ast->support_wsxga_p = true;
> -		else if (ast->chip == AST2510)
> -			ast->support_wsxga_p = true;
> -		if (ast->support_wsxga_p)
> -			ast->support_fullhd = true;
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	} else if (AST_GEN(ast) >= 5) {
> -		if (__ast_2100_detect_wsxga_p(ast))
> -			ast->support_wsxga_p = true;
> -		else if (ast->chip == AST1400)
> -			ast->support_wsxga_p = true;
> -		if (ast->support_wsxga_p)
> -			ast->support_fullhd = true;
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	} else if (AST_GEN(ast) >= 4) {
> -		if (__ast_2100_detect_wsxga_p(ast))
> -			ast->support_wsxga_p = true;
> -		else if (ast->chip == AST1300)
> -			ast->support_wsxga_p = true;
> -		if (ast->support_wsxga_p)
> -			ast->support_fullhd = true;
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	} else if (AST_GEN(ast) >= 3) {
> -		if (__ast_2100_detect_wsxga_p(ast))
> -			ast->support_wsxga_p = true;
> -		if (ast->support_wsxga_p) {
> -			if (ast->chip == AST2200)
> -				ast->support_fullhd = true;
> -		}
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	} else if (AST_GEN(ast) >= 2) {
> -		if (__ast_2100_detect_wsxga_p(ast))
> -			ast->support_wsxga_p = true;
> -		if (ast->support_wsxga_p) {
> -			if (ast->chip == AST2100)
> -				ast->support_fullhd = true;
> -		}
> -		if (__ast_2100_detect_wuxga(ast))
> -			ast->support_wuxga = true;
> -	}
> -}
> -
> -struct drm_device *ast_device_create(struct pci_dev *pdev,
> -				     const struct drm_driver *drv,
> -				     enum ast_chip chip,
> -				     enum ast_config_mode config_mode,
> -				     void __iomem *regs,
> -				     void __iomem *ioregs,
> -				     bool need_post)
> -{
> -	struct drm_device *dev;
> -	struct ast_device *ast;
> -	int ret;
> -
> -	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
> -	if (IS_ERR(ast))
> -		return ERR_CAST(ast);
> -	dev = &ast->base;
> -
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> -
> -	if (AST_GEN(ast) >= 4)
> -		ast_2300_detect_tx_chip(ast);
> -	else
> -		ast_2000_detect_tx_chip(ast, need_post);
> -
> -	switch (ast->tx_chip) {
> -	case AST_TX_ASTDP:
> -		ret = ast_post_gpu(ast);
> -		break;
> -	default:
> -		ret = 0;
> -		if (need_post)
> -			ret = ast_post_gpu(ast);
> -		break;
> -	}
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	ret = ast_mm_init(ast);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	/* map reserved buffer */
> -	ast->dp501_fw_buf = NULL;
> -	if (ast->vram_size < pci_resource_len(pdev, 0)) {
> -		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
> -		if (!ast->dp501_fw_buf)
> -			drm_info(dev, "failed to map reserved buffer!\n");
> -	}
> -
> -	ast_detect_widescreen(ast);
> -
> -	ret = ast_mode_config_init(ast);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return dev;
> -}

