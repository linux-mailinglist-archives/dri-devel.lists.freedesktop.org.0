Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02257C69EC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FF910E47D;
	Thu, 12 Oct 2023 09:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD3810E47D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405524e6768so8080375e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697103889; x=1697708689; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k+QKwp7nbl5f01p02Qg76ygu3plfUspesE0c3bZjqAw=;
 b=VSHJ1VLQOQV8OmOtfKSe1dZQNGAmdHDL78FCFvJyaP/SgcD5OvHg+xllyi4NpHhC4D
 2vxQlrOdA6cY96sOXu1xNul+ainB9JUsb6JSURFS8qnsuSZWq6qmtuXS5sNMCVFkbAF4
 R3uex0F84mSRTLvGOEIU3p7msyggZLy4Danf0TZzuhmWCjSJk2Dzgfye57xsE67UKsbQ
 UwkeSCdMfagImEv7AP5yjAVPOt2Fy/ZgWNAkjBdBJN0Ym+MqExwWTi1WG5wrN4k79tCi
 Ug6CzetVaBL+5M+RITHoSRs7DcG9UEj2pGmG5k/sc8++ykJSdrEtCKPhizlaQvGYa+6k
 ARMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697103889; x=1697708689;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+QKwp7nbl5f01p02Qg76ygu3plfUspesE0c3bZjqAw=;
 b=LzpLF0QExxsisuUvSC1RR3m3Bt2X0Cz6dBF/yp0HQDgozLaxgzfYGKN06gQ5kTGOpD
 YeZkvpjwHs3ZxVEk+2jfbslD7Oj1fgGCKpiNTBs/UbMydRG5RVuRaIMSVb7uRE9SwVRu
 TPiakKcVl/oKMQ6H501oHrn8GYSD/PKu1xdQm4BJ4KpJHMt/uHVUdLypsWREKJvnjK5Z
 DNPZHnfLd7WnsgNJmsSAkERmDucUcKyFNoghhpyJO4p3P+UQmpJPeKGKh8wF1B8y/Jrj
 UOsZmIWEtCbEaezKE1nWV4+kMY5rThY4SzTkJyaMYbQbtEySfWOJiS0vDq30D+RDbTeI
 9jXg==
X-Gm-Message-State: AOJu0YxNVk/FldYwmZXEYnGiJEaWtC1KMyGTG5n1KuKgcQQpjO0GgHoi
 clJPWbIdBWtIFNnEL0u5SEfppg==
X-Google-Smtp-Source: AGHT+IG7sLNYr0zpChWt8fMpTJKOcqZ3lRnegx7zppgFF1S6sXIq/A7SPemRfc4R3uX5KM5QEnagzw==
X-Received: by 2002:a5d:474c:0:b0:32d:93aa:3d63 with SMTP id
 o12-20020a5d474c000000b0032d93aa3d63mr634911wrs.69.1697103889452; 
 Thu, 12 Oct 2023 02:44:49 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e11-20020adfe7cb000000b003176c6e87b1sm17890924wrn.81.2023.10.12.02.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:44:49 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:44:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: andrzej.hajda@intel.com
Subject: [bug report] drm/exynos/iommu: merge IOMMU and DMA code
Message-ID: <33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andrzej Hajda,

The patch 67fbf3a3ef84: "drm/exynos/iommu: merge IOMMU and DMA code"
from Oct 12, 2018 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/exynos/exynos_drm_dma.c:120 exynos_drm_register_dma()
	warn: 'mapping' isn't an ERR_PTR

drivers/gpu/drm/exynos/exynos_drm_dma.c
    95 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
    96                             void **dma_priv)
    97 {
    98         struct exynos_drm_private *priv = drm->dev_private;
    99 
    100         if (!priv->dma_dev) {
    101                 priv->dma_dev = dev;
    102                 DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
    103                          dev_name(dev));
    104         }
    105 
    106         if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
    107                 return 0;
    108 
    109         if (!priv->mapping) {
    110                 void *mapping;
    111 
    112                 if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
    113                         mapping = arm_iommu_create_mapping(&platform_bus_type,
    114                                 EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
    115                 else if (IS_ENABLED(CONFIG_IOMMU_DMA))
    116                         mapping = iommu_get_domain_for_dev(priv->dma_dev);

arm_iommu_create_mapping() and iommu_get_domain_for_dev() seem to return
NULL on error.

    117                 else
    118                         mapping = ERR_PTR(-ENODEV);
    119 
--> 120                 if (IS_ERR(mapping))
    121                         return PTR_ERR(mapping);

Smatch uses the pre-compiled code so it says that mapping is always NULL
on this config...

    122                 priv->mapping = mapping;
    123         }
    124 
    125         return drm_iommu_attach_device(drm, dev, dma_priv);
    126 }

regards,
dan carpenter
