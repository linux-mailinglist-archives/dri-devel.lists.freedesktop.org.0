Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85359B88515
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D0A10E957;
	Fri, 19 Sep 2025 08:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RHqZYXr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BCA10E955
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RI/tF/nnmVT4+CMD/6uuqdkRR2yrNPYTVdoQAR9Gnx4=;
 b=RHqZYXr+e5Mz2bScYcOvYg1P8rJhKPg8m2+mFYKfjqmjvcIlGTriea/enY7MylWPIeamLs
 8fdNhwwSabTyxPQjdeHaOTh0WA8uCFN7z5qzJpt6FO7gjYRS0Sla3Vbmn1YrXxgxSyIawh
 zbasVETWMC7cVnM8tsfvE4xcWNb4zeM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-7T478qTyMDqVRqdPwKgMnw-1; Fri, 19 Sep 2025 04:01:48 -0400
X-MC-Unique: 7T478qTyMDqVRqdPwKgMnw-1
X-Mimecast-MFC-AGG-ID: 7T478qTyMDqVRqdPwKgMnw_1758268908
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45de18e7eccso9594685e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268907; x=1758873707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RI/tF/nnmVT4+CMD/6uuqdkRR2yrNPYTVdoQAR9Gnx4=;
 b=BDAIZdGlBBvhBZtYQzZ2r1Z+adF87uf8D+XrkAQFP7g6WiSFoT0OHC68b1jPodzyD+
 0cCL87bOLaAEIrKRNGZL0LmMaMg+t0watthaWPS2wuQUh7YqlFvELYPlAkNhmtSRr2oq
 aB6SHnD2cJo50Cm8yzYe84lHePLCaoqYubtVLFoo7yyYsBHC4BJP3iaLVVAnPylbbdrJ
 iG392QEHyrl9eqHSe1hu+7WdBuUV/DpcviMf8XzxF7LETQi8iyG5kLxdhc9td+FmU16u
 4dhe8YpZ5Ze2wtFBIl4MB02VR8EOqmu5q7UJmNV7VXIlErMXkUKNaHnOPmWranvug0M5
 5DJQ==
X-Gm-Message-State: AOJu0YxuhaBQtj0kfewTdyIHzBPdsLGnH4Hi09weaBnp6fkbboa1VqLw
 QYBFukv+zD/6x9hXos5ukvWwKOkSRYh0NGrBL1DFD5+F/hI7WrSAESPEv4gx1V4DocCDz31yYmG
 J5WL5tXTvTDuRLlpTl9t7VB0QSY8BfL2+mNC8Bk2ivmeQXpyGBE8Yrtd/XyWdI5J2K0Utlw==
X-Gm-Gg: ASbGncs/OHS1hFZsIFdgUSp8szbqVtvOophAybDasZ7xZi7a5YDszyHW05+bdB+z6uN
 QY/2cFNApfxGZPM2g3gO30suexD+FQuVGuSvQNuatERKuDMod9JCo/xaXUz4XnF9YM7GyL55Pb4
 JFm5ieb69nmPzO1q/xeMuOxNg+Addg82f/9CE72awXNoIN6YtHeJSwP1B46/F9HpCqdRp1WmDJa
 46DQAjt/fokFcEFMGkFxgtTkosNKswgj5R7ld4j97Ncf/FD9VSmXUt+2Jniq8mkqZCtJmD+4Exb
 2vuxZZj4wRWXxj+k4E4jTwD9fZj/yjnOrcsJ5J9AgMPYISiQ2uilq54J+nHkpWuiU/Qt2GvrMbM
 gATlp
X-Received: by 2002:a05:600c:8b33:b0:468:11af:77f8 with SMTP id
 5b1f17b1804b1-46840cdbdd7mr12913395e9.11.1758268907341; 
 Fri, 19 Sep 2025 01:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk5Vn0OMmJLK9hgEm46K0JI5FBlr7uueXIiGvXj2QylVhwOnQIjcepPkXURWIGPxyGxbijhQ==
X-Received: by 2002:a05:600c:8b33:b0:468:11af:77f8 with SMTP id
 5b1f17b1804b1-46840cdbdd7mr12912915e9.11.1758268906827; 
 Fri, 19 Sep 2025 01:01:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf1d35sm7394413f8f.55.2025.09.19.01.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:01:46 -0700 (PDT)
Message-ID: <aea464ff-4166-421e-b3fe-7d2a8632a49d@redhat.com>
Date: Fri, 19 Sep 2025 10:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/ast: Move Gen2 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5B69OtwowfB_Rv9pIcDkw5Ftr-iXQE2ZD-uT8H5NvsY_1758268908
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
> Split off device initialization for Gen2 hardware into the helpers
> ast_2100_device_create() and ast_2100_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen2 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.

I've a few cosmetic suggestions below:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2100.c | 55 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 +++
>   drivers/gpu/drm/ast/ast_drv.h  |  7 +++++
>   3 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 16a279ec8351..5da58667c4c2 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -27,6 +27,9 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
>   
>   #include "ast_drv.h"
>   #include "ast_post.h"
> @@ -417,3 +420,55 @@ bool __ast_2100_detect_wuxga(struct ast_device *ast)
>   
>   	return false;
>   }
> +
> +static void ast_2100_detect_widescreen(struct ast_device *ast)
> +{
> +	if (__ast_2100_detect_wsxga_p(ast))
> +		ast->support_wsxga_p = true;
> +	if (ast->support_wsxga_p) {
> +		if (ast->chip == AST2100)
> +			ast->support_fullhd = true;
> +	}

That looks a bit awkward

I would prefer either:

if (__ast_2100_detect_wsxga_p(ast)) {
	ast->support_wsxga_p = true;
	if (ast->chip == AST2100)
		ast->support_fullhd = true;
}

or

ast->support_wsxga_p = __ast_2100_detect_wsxga_p(ast)
ast->support_fullhd = ast->support_wsxga_p && (ast->chip == AST2100);

> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;

This can also be simplified as:

ast->support_wuxga = __ast_2100_detect_wuxga(ast);

> +}
> +
> +struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
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
> +	ast_2000_detect_tx_chip(ast, need_post);
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
> +	ast_2100_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 3fecdc0fc7f7..bcf0b318b495 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -386,6 +386,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2000_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 2:
> +		drm = ast_2100_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 369abdd81bbf..8f52ac3b0f45 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -439,6 +439,13 @@ struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
>   int ast_2100_post(struct ast_device *ast);
>   bool __ast_2100_detect_wsxga_p(struct ast_device *ast);
>   bool __ast_2100_detect_wuxga(struct ast_device *ast);
> +struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
>   
>   /* ast_2300.c */
>   int ast_2300_post(struct ast_device *ast);

