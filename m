Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D82A9195
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCA76EE43;
	Fri,  6 Nov 2020 08:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80A56E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:07:25 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t18so1250441plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=BgiHrklnpeZTNfHUUb4/9/03koRegsKFGWvFTDnluCI=;
 b=BQ/GK9ILSECdU6RkFDXdQ8h/kV97zEXhRiqF43KL4JQ02EvmZYyDQX8iljTDwvsxlk
 2KURmI63vEDuwxwkyxfBvt1+5rUT00ML/HZRRAOj/6W/BXz7xEI945mma7f77t9bggTG
 xryBjaLokvtkPgT31UTriTMo2C6mSt6kA3t18NvNgr7mgq34KurD2FXD2SHZ6qw2S0iy
 VyuXyphZz8aPTHnJ7eEzWgrfslyWZnwQRi8TpbRnqHaFluD9nLHNmRVAI9q2shklV1hp
 JexCegf6zGvyB/pj/ag/agnLS5lHCEijBHwSGmhv7PyANiL2gjbczwL2qis/nzppeaSR
 aDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=BgiHrklnpeZTNfHUUb4/9/03koRegsKFGWvFTDnluCI=;
 b=oI/rFx+L2oi9A/L21JlUuDjnpKiJDVHrKqGkApwL9GArnS4oU5pX/WOp+26KB1nv1o
 10u98cbcLgEq0LyN7OOIZP6RtTwUrCtC6Kd3j5YFlzZhFZIpa4GTcnvHUJLhqweOxtjs
 8SeHtaEf1uVbzsVHo5ZVUmEe1PLy/jNqk7IdnOgqXJYwdhg+M5FpAnA2WauSBZRHnfEy
 qTIbhqfbqsijA/zb56kVfjvcRPImKqzcrzj1S+MEJw1hedOLNAp2OTJqmh1n+gqlgwZt
 B9VhX35uP7A7HIfBzi29mTvIH3oJawVGa92eHzq2m2nT0qkUArHWWHbQbmBDK9zOdBYK
 X2+w==
X-Gm-Message-State: AOAM530yil39MD0LSEkd/utjwesXEO9U5J+p7IQyZ24BUlti2Alp6UO0
 YLbzT7i7/zIznzdo/g7FdQ+CkZW2tA8=
X-Google-Smtp-Source: ABdhPJzw1QtrJdsbGtpN9Hgsb+fZFPtDupUe6LGfnX647S6DMfeeXsi+H9L4NS+pKucT9+mvxKLi2A==
X-Received: by 2002:a17:902:ed04:b029:d6:e878:1013 with SMTP id
 b4-20020a170902ed04b02900d6e8781013mr3461916pld.56.1604603245478; 
 Thu, 05 Nov 2020 11:07:25 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id j2sm3190842pgi.48.2020.11.05.11.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:07:25 -0800 (PST)
Date: Fri, 6 Nov 2020 00:37:18 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: replace idr_init() by idr_init_base()
Message-ID: <20201105190718.GA89863@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier for this driver.
The idr_alloc for this driver uses 1 as start value for ID range. The
new function idr_init_base allows IDR to set the ID lookup from base 1.
This avoids all lookups that otherwise starts from 0 since 0 is always
unused / available.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 16077785ad47..cbedcb043803 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -540,7 +540,7 @@ ttm_object_device_init(struct ttm_mem_global *mem_glob,
 	if (ret != 0)
 		goto out_no_object_hash;
 
-	idr_init(&tdev->idr);
+	idr_init_base(&tdev->idr, 1);
 	tdev->ops = *ops;
 	tdev->dmabuf_release = tdev->ops.release;
 	tdev->ops.release = ttm_prime_dmabuf_release;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 31e3e5c9f362..a24d9363a17e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -675,7 +675,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	spin_lock_init(&dev_priv->cursor_lock);
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
-		idr_init(&dev_priv->res_idr[i]);
+		idr_init_base(&dev_priv->res_idr[i], 1);
 		INIT_LIST_HEAD(&dev_priv->res_lru[i]);
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
