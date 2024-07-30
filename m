Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D5942282
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10CA10E17D;
	Tue, 30 Jul 2024 22:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EeWIbRhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D880A10E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 22:01:39 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-26109c97728so3132526fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722376899; x=1722981699; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VJchNg0TJvb8kDFnbSu3vHK8VtYpaRB4d1jVFVvhOYc=;
 b=EeWIbRhBNHS5o26pyfdVQwYedjljjb2mC5u3hYARxJu82Hgb5I4IdiM2mFKMACsyFM
 44XBqbuY/PuVCJrSZjxNICVwv2evfAPx53/KYNyvT1LlozC9OufckvnDVZzzhUh7bqKl
 1K0o6y8ae8Id8/gq+96i3y2PYUV5Wrntj8/Aliou20t41+7KxPlRL55oBcxFznDHSbsn
 JbMt683C2a7a8jOalq8r07LxnLbPS1uZXu4qBpfFu5rjl4sx7/zPhA/gn64F6GUFBdp7
 yX8YNKN7N36X5vu57ORrHqcn8WPkfQcEi3Nn7LaiayUU/Wg4DK7Jo/x63AOqE/QYOoz9
 wpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722376899; x=1722981699;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VJchNg0TJvb8kDFnbSu3vHK8VtYpaRB4d1jVFVvhOYc=;
 b=a+HrLagJOVWXp7dILws9fsy2lkThJ/A8PEoHtGr2VO7Nz7zcpBuUmuao/myTHI53Ng
 oLhqW/kzjutch/KZGigSix2eC+iyoAiprxjQB2anNr/41UT1cMtRlXRus1sOB4ZwSIML
 Scq/AcqBC72d30KZbSr63XVkZTZRRx5SsODUP7L+KKAEymLG41i5K4mLK5jPzMMdHpik
 FjCNrf//qUfDHVZroMRwY7pCpU0+zLyfC+kOHT/oyk3/ntOO1Z4YiFlvb5HhJrVpJBU3
 ToUDgB4MQeevLfEO8LC7aaOGnjsSaEfdK2qdHzTm9gFeG6jqrpB/7nqMqR6Ay6pNkCEi
 Ftsw==
X-Gm-Message-State: AOJu0Yw5Y12URywkW32lDh9/rW5tLOTsgVDGr5i4oNDeJXC7lQ8zkMT8
 PitQL2hbFEZz7WjFMZ6AAq+viE/7dwsmn9ZgIjdcbImJTZg58OHy7nE1F28/OrE=
X-Google-Smtp-Source: AGHT+IG+8ViDdfLWPjahAnODTC5TsGzRmnfQgH39TeuSvoUX6yFvzYBMb//JM/0E+k1FgaK7eAqKYQ==
X-Received: by 2002:a05:6870:a2ca:b0:260:fc49:3e96 with SMTP id
 586e51a60fabf-267d4ef9430mr13583377fac.46.1722376898903; 
 Tue, 30 Jul 2024 15:01:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-26577239eccsm2413635fac.53.2024.07.30.15.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 15:01:38 -0700 (PDT)
Date: Tue, 30 Jul 2024 17:01:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/omap: gem: Replace struct_mutex usage with omap_obj
 private lock
Message-ID: <511b99d7-aade-4f92-bd3e-63163a13d617@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent Pinchart,

Commit 3cbd0c587b12 ("drm/omap: gem: Replace struct_mutex usage with
omap_obj private lock") from May 26, 2018 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/omapdrm/omap_gem.c:1435 omap_gem_new_dmabuf()
	warn: 'omap_obj' was already freed. (line 1434)

drivers/gpu/drm/omapdrm/omap_gem.c
    1386 struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
    1387                                            struct sg_table *sgt)
    1388 {
    1389         struct omap_drm_private *priv = dev->dev_private;
    1390         struct omap_gem_object *omap_obj;
    1391         struct drm_gem_object *obj;
    1392         union omap_gem_size gsize;
    1393 
    1394         /* Without a DMM only physically contiguous buffers can be supported. */
    1395         if (!omap_gem_sgt_is_contiguous(sgt, size) && !priv->has_dmm)
    1396                 return ERR_PTR(-EINVAL);
    1397 
    1398         gsize.bytes = PAGE_ALIGN(size);
    1399         obj = omap_gem_new(dev, gsize, OMAP_BO_MEM_DMABUF | OMAP_BO_WC);
    1400         if (!obj)
    1401                 return ERR_PTR(-ENOMEM);
    1402 
    1403         omap_obj = to_omap_bo(obj);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
This is omap_obj

    1404 
    1405         mutex_lock(&omap_obj->lock);
    1406 
    1407         omap_obj->sgt = sgt;
    1408 
    1409         if (omap_gem_sgt_is_contiguous(sgt, size)) {
    1410                 omap_obj->dma_addr = sg_dma_address(sgt->sgl);
    1411         } else {
    1412                 /* Create pages list from sgt */
    1413                 struct page **pages;
    1414                 unsigned int npages;
    1415                 unsigned int ret;
    1416 
    1417                 npages = DIV_ROUND_UP(size, PAGE_SIZE);
    1418                 pages = kcalloc(npages, sizeof(*pages), GFP_KERNEL);
    1419                 if (!pages) {
    1420                         omap_gem_free_object(obj);
                                                      ^^^
It gets free inside this function

    1421                         obj = ERR_PTR(-ENOMEM);
    1422                         goto done;
    1423                 }
    1424 
    1425                 omap_obj->pages = pages;
    1426                 ret = drm_prime_sg_to_page_array(sgt, pages, npages);
    1427                 if (ret) {
    1428                         omap_gem_free_object(obj);
                                                      ^^^
Same

    1429                         obj = ERR_PTR(-ENOMEM);
    1430                         goto done;

So I think we can just return directly instead of unlocking.

    1431                 }
    1432         }
    1433 
    1434 done:
--> 1435         mutex_unlock(&omap_obj->lock);
    1436         return obj;
    1437 }

regards,
dan carpenter
