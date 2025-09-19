Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB2B88521
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0D010E95A;
	Fri, 19 Sep 2025 08:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ae1w8RRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4D610E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dhj5ji9ukQAojxj61KUBd8nTZjcVVk+cbk/1GmkIACY=;
 b=ae1w8RRAw3Q12vSb2nlLUsM6iBkULw4hFfoXueTWZJcqnMal4dyYBh4VhRrKFUtkiOOqj7
 QCuhmsCYqhphv/r18rf+qplHbrqbUyjnwXopaLaoWETx4bKb9zYPvtJo4fagAwZIxTkFKH
 i0+aAChi81s4E4P+cTT0M7yZjodO0AY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-iKKeQ_uyPyyeEPeb8W2ryg-1; Fri, 19 Sep 2025 04:02:31 -0400
X-MC-Unique: iKKeQ_uyPyyeEPeb8W2ryg-1
X-Mimecast-MFC-AGG-ID: iKKeQ_uyPyyeEPeb8W2ryg_1758268950
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ee1365964cso1224356f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268950; x=1758873750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dhj5ji9ukQAojxj61KUBd8nTZjcVVk+cbk/1GmkIACY=;
 b=CeWoncRx3ett2bxHoJctzzkOIKJG9zOzxEwYULsiI/13viDyUdac/88fw/qqgodKWl
 zZ0oIfOc30vL5MIcwYmuFh6zolF5iOTDYBKKO/6CNHw1D2nsTSWYCQ1hrT8jfGpaw01u
 w56NKJaQywzMMy7oxnY1o/e6HUX4jpnhHqLM0Jpa7njfDei6lQSy2lpLYcixOsmF7emK
 VKHP+pAJSfu8E4aYWN7yvfEkJ06QCd6lJoVlRXn4t4vspI2yvkTbUDpqbs2i1V3b3z8J
 aMqveCnXsmOyYwj1H1mJZJNO5vYZtOhLB+TZMrbDie60blmlVPu1cgQaaUCpDMda3cxx
 ofWA==
X-Gm-Message-State: AOJu0YwlZ/j9qgQ096OOWDj81aYCyeBPxXfGYs4K8dVlrB9UwNnrd+3J
 YqxubB0LQ8aFAvHqW/QsrgBVH3JrKg9vs+sENtRCVh+hwHiikktky/5VDUdjMoRJcjTdNzqpnVU
 jdRKDCvcWTn9724/wHuxUQHO3b4TGYrJbpOOuOoBUP2mjM9tjVYzLD3o10aKo1tvS6N0G8A==
X-Gm-Gg: ASbGnctOrI88YdGIZpuuhG2HsKnImJ5ePsYC2DbhsTT+DS3tD6a7xrdobuRUlC7kAwW
 XSf/tJwyb9fQTTq2qEoEEavnTa9V/N0UcnNZHrtC0NEqMVMHV+YhSg1v4KLJuNKWicB3ZYE6N+o
 r6tgtzBrjmbkJMs7c6j282LFvNzPLygy4ZV738T4qF1iWSx3pWKWF0ROyCZJWSCbEtxl37IMGAz
 mFyYs/RtEIa9OCo4EtSq8kwFxyCU8qNgtGFL2ruZ5BBBO8Ja0kAlKsiAFfnUQ6qFedH8QqUZpQg
 9ceJDDc3FINn2PsF8+wYehw9j8BF2C6Vd8NBU9uPMrsB7leRHcEIK2e58wo2nUzi68yp0M1MTJR
 ehk82
X-Received: by 2002:a05:6000:1885:b0:3ec:3cac:7dfd with SMTP id
 ffacd0b85a97d-3ee8054cd3bmr1807614f8f.26.1758268950339; 
 Fri, 19 Sep 2025 01:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiCAdt9fzX49G3B2GW6jDplygGv2dOyBJsKJtL4Y1twk5obj0pQwVM+mWc1EWq5sQbo8WjvA==
X-Received: by 2002:a05:6000:1885:b0:3ec:3cac:7dfd with SMTP id
 ffacd0b85a97d-3ee8054cd3bmr1807591f8f.26.1758268949886; 
 Fri, 19 Sep 2025 01:02:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f5a285efsm83797975e9.18.2025.09.19.01.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:02:29 -0700 (PDT)
Message-ID: <269564d9-b07b-43db-bb36-8d7694a91472@redhat.com>
Date: Fri, 19 Sep 2025 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/ast: Move Gen5 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i3VCO3mev9Gr9LGWgM2AnuPaflrM-CnnOMXR_Bw8ens_1758268950
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
> Split off device initialization for Gen5 hardware into the helpers
> ast_2400_device_create() and ast_2400_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen5 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile   |  1 +
>   drivers/gpu/drm/ast/ast_2400.c | 95 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 ++
>   drivers/gpu/drm/ast/ast_drv.h  |  9 ++++
>   4 files changed, 109 insertions(+)
>   create mode 100644 drivers/gpu/drm/ast/ast_2400.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index a7a13b6d526e..0a60c9341a9f 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -8,6 +8,7 @@ ast-y := \
>   	ast_2100.o \
>   	ast_2200.o \
>   	ast_2300.o \
> +	ast_2400.o \
>   	ast_2500.o \
>   	ast_2600.o \
>   	ast_cursor.o \
> diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
> new file mode 100644
> index 000000000000..fbba8b11af42
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_2400.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2012 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + *
> + */
> +/*
> + * Authors: Dave Airlie <airlied@redhat.com>
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_print.h>
> +
> +#include "ast_drv.h"
> +
> +static void ast_2400_detect_widescreen(struct ast_device *ast)
> +{
> +	if (__ast_2100_detect_wsxga_p(ast))
> +		ast->support_wsxga_p = true;
> +	else if (ast->chip == AST1400)
> +		ast->support_wsxga_p = true;
> +	if (ast->support_wsxga_p)
> +		ast->support_fullhd = true;
> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;
> +}
> +
> +struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post)
> +{
> +	struct drm_device *dev;
> +	struct ast_device *ast;
> +	int ret;
> +
> +	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
> +	if (IS_ERR(ast))
> +		return ERR_CAST(ast);
> +	dev = &ast->base;
> +
> +	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +
> +	ast_2300_detect_tx_chip(ast);
> +
> +	if (need_post) {
> +		ret = ast_post_gpu(ast);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	ret = ast_mm_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/* map reserved buffer */
> +	ast->dp501_fw_buf = NULL;
> +	if (ast->vram_size < pci_resource_len(pdev, 0)) {
> +		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
> +		if (!ast->dp501_fw_buf)
> +			drm_info(dev, "failed to map reserved buffer!\n");
> +	}
> +
> +	ast_2400_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 8d50abbd1c3c..475a8d5f58cd 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -398,6 +398,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2300_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 5:
> +		drm = ast_2400_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 6924f8a87e2c..c9744b3efda0 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -467,6 +467,15 @@ struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
>   					  void __iomem *ioregs,
>   					  bool need_post);
>   
> +/* ast_2400.c */
> +struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
> +
>   /* ast_2500.c */
>   void ast_2500_patch_ahb(void __iomem *regs);
>   int ast_2500_post(struct ast_device *ast);

