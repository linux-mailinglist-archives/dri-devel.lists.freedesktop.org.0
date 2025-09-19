Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC5B8847E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6710E950;
	Fri, 19 Sep 2025 07:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hEvfMUcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5CF10E950
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aw3ZFEAY8yw8Wr5JlYuuSuueS+pXJol6VedSKb6fsSw=;
 b=hEvfMUcI08irwlr6/Ng+RqiRXzuspmZEkUIV3MXfSYCRF/kQn1iVHtN0kvPGh0QxFRtLjM
 LtDeZ/lHkvydxNVkzTNxEsPaKF1bp3DG/9t0Jga8ai+BOmJrIPCivjBSm33pRy6WskFHXV
 Ydyb5rQR0PfPPR3ysWBiVOU9aSmEsCw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-X2zFga0TMKK9SGu7AIcbIg-1; Fri, 19 Sep 2025 03:53:31 -0400
X-MC-Unique: X2zFga0TMKK9SGu7AIcbIg-1
X-Mimecast-MFC-AGG-ID: X2zFga0TMKK9SGu7AIcbIg_1758268411
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b9a856d58so14130545e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268411; x=1758873211;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aw3ZFEAY8yw8Wr5JlYuuSuueS+pXJol6VedSKb6fsSw=;
 b=lxnj7v4M12ZMxFx7mUFlLuOA8wfA2EyL8nUQw+tfeHcX6l4nZLpnp5SE1IF0cZ2ink
 znAM8DOQQnS3VCBTPc0MCgLyeWoK7JVfie6v5IDpue40MOVtb5WkxaOlB+kbc0gpDA5I
 YZEz9LUi0WXw851pAlKShG2aTO277fFMWG9iLvqxW1UbEK27J9mFKqSbaRBGMXupup4E
 O7pOLr0sb8M2qvCf3fbVCmynZNq0S5M5lAOHGnAmWV3xJTGz5fG/Ia9szNjh3sLx+AuC
 IbWIUQzkGdSYvjA+dmGbuHbTkBUcQB3U2Gqc82iNsxGeKTSSzlO+p0VKLfs7JUGcDwQ7
 LpjQ==
X-Gm-Message-State: AOJu0Yy6WCpmO/33IpDM3l6iV6hovuGOjvB3XOkJXkiYr6MiDOenh4Yt
 k6bfPETPiBBc3r6bSu+75VF8i+IZsG0AdmA/0r8Kr3TMTw82JNykym3UrXOyyLGkO33oPaAzpe4
 JQlPEkWOkvc9OJECN0ZfMo9trmot/niajtXPI3AxdbuZWf48mYgMk1reSbwVKpSfVeenjEg==
X-Gm-Gg: ASbGncsbk4W9Yy33LHxyoKRG8edvpNUtr2S6oDF9bOlGGu3XipW9XGiMhZ3zhU+5b+W
 8R6gCWCDEG7uA/zgqAsMsZm4NDkf+Oi1sAabGFg3eqfk7TvCmJjQj0yAdSH8JwDeiT6HfO14+AU
 ToZ0F8r2kla1CFq2iak2AXnrQsmnGc1fRNKIMLAInbRZRul9TlilhcwJypYOR2Z1HNc5/aH8QgF
 zufzuAMVXIpIs7ovwCOYW5LG2V/JLp0exTssDmf+Uzbrlwgwe9+ZQyQ6UtrLiciQ41I1BDPbnIm
 UjHfjO4z9XgeO71ww0ielsHmYb87umQwK8Tg5A2Bd46rnrQN29PCaVoscXtFAh63DcRXPyM2KW/
 0/qQd
X-Received: by 2002:a05:600c:4f11:b0:45f:27fb:8017 with SMTP id
 5b1f17b1804b1-468a10cd520mr12902925e9.5.1758268410633; 
 Fri, 19 Sep 2025 00:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOb2R/B2xpWWeZdGIokFO1+DZHqOPxRyiY7ejbe4Le6DNDfgTLPdzhsRdhpROgbKacjA+f2w==
X-Received: by 2002:a05:600c:4f11:b0:45f:27fb:8017 with SMTP id
 5b1f17b1804b1-468a10cd520mr12902595e9.5.1758268410121; 
 Fri, 19 Sep 2025 00:53:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm117685595e9.23.2025.09.19.00.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 00:53:29 -0700 (PDT)
Message-ID: <10ac6b6a-8186-4388-8ad2-40687ad9db3c@redhat.com>
Date: Fri, 19 Sep 2025 09:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/ast: Move Gen1 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7cz9DhYXaVEQphtmIEeqm_ydqKsmvzZjrVnJBDEv1ts_1758268411
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
> Split off device initialization for Gen1 hardware into the helpers
> ast_2000_device_create() and ast_2000_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen1 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 50 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 +++
>   drivers/gpu/drm/ast/ast_drv.h  |  7 +++++
>   3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 63fad9fbf519..369ecd98e039 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
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
> @@ -207,3 +210,50 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
>   
>   	__ast_device_set_tx_chip(ast, tx_chip);
>   }
> +
> +static void ast_2000_detect_widescreen(struct ast_device *ast)
> +{
> +	ast->support_wsxga_p = false;
> +	ast->support_fullhd = false;
> +	ast->support_wuxga = false;
> +}
> +
> +struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
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
> +	ast_2000_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index a1b3c25ded20..3fecdc0fc7f7 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -382,6 +382,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	chip_gen = ret;
>   
>   	switch (chip_gen) {
> +	case 1:
> +		drm = ast_2000_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 8868cbdd99d0..369abdd81bbf 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -427,6 +427,13 @@ void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
>   int ast_2000_post(struct ast_device *ast);
>   extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
>   void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post);
> +struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
>   
>   /* ast_2100.c */
>   int ast_2100_post(struct ast_device *ast);

