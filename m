Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670906A3F2B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CB510E3A2;
	Mon, 27 Feb 2023 10:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1D10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:07:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e37so3095781wri.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jnMX1QvB2TAT+d6bBwXqIXUvE0HfNg38gx5xp0MvMKA=;
 b=j0kwkt5SgEJKfHAWbmCBG9RFTkd8CIloKWFZ4XXSWwHXEI2DFmWxCxaTnTfnWpCyeb
 QV62H/ZNEjBmn8ccxPqO8XxzTyOzCXtOg4qo6m8827dsQA43jTlLHyDCuEUMuqg2XihF
 zPBdt+MsXPcvJVjJwPCE+bk6oe2fP5BHGbQtE7Q4N/fFozfPtKPcc0whXMvfEvPlD1LK
 JD0pLzr+/vQpDHFeggj6kSc1tjk/Z8dRg+u7BTzXYI/ldpOOyrM4RM1EuwrEbSFinJRP
 HvP6R0ux1DPVxzt91otFq8I5V3ajJbnGgUyB5p6F6Hs+jCVQUOo/JkaDHDD3/r3QZNSE
 Y4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnMX1QvB2TAT+d6bBwXqIXUvE0HfNg38gx5xp0MvMKA=;
 b=Vd1OH3XXjnuNyhR50kC4dKx6T1ITy5T9DRcVwWJYbplgKMK+8nd0m3FSxPmjT47ral
 NBxnyz7pK63eYoUBEIUb6EktWYln9IIpzKjaJYiuARoU9i8TBaEILRVRCF4LvAWEcsvD
 4yNm9WEp66+vbhAAaY3aa4R9U2hA6scoHoIiIm6Ty89INtO4YMKOXwLNBtwuuf7vRqXt
 v/50tJzw+LvZG5P0z0vkXwfSiUBqqRtNeDWSQbH54cvvFBtWaiHnb1In8tdhrqHemqNo
 TN0UIdoZRynAsBwbxJdhOEeLLkhOJurEkDnwStPCwFIMTLQklMySiVSt8L/s71MFLogb
 R2Lw==
X-Gm-Message-State: AO0yUKUUj3qq/gEfzTkqwyZtq4ZGFP3z/TD81AwvlD12n0/UsMG8dhp8
 rkgN2ixwlWoBQbnwuzCfmzY=
X-Google-Smtp-Source: AK7set8A/RFwFh8podMXMM5ARoUOWSbyyo9zeJjupddomMttuY/UuYtHi7GPcniDxq6DCLSlWZxXAQ==
X-Received: by 2002:a05:6000:5c1:b0:2c5:4ca3:d56c with SMTP id
 bh1-20020a05600005c100b002c54ca3d56cmr5407214wrb.0.1677492459988; 
 Mon, 27 Feb 2023 02:07:39 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003eb395a8280sm7175794wmb.37.2023.02.27.02.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:07:39 -0800 (PST)
Date: Mon, 27 Feb 2023 13:07:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
Message-ID: <Y/yA53V/rW8g1Zlm@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The error codes are not set on these error paths.

Fixes: 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/video/fbdev/chipsfb.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index cc37ec3f8fc1..98398789528a 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -358,16 +358,21 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 	if (rc)
 		return rc;
 
-	if (pci_enable_device(dp) < 0) {
+	rc = pci_enable_device(dp);
+	if (rc < 0) {
 		dev_err(&dp->dev, "Cannot enable PCI device\n");
 		goto err_out;
 	}
 
-	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0)
+	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0) {
+		rc = -EINVAL;
 		goto err_disable;
+	}
 	addr = pci_resource_start(dp, 0);
-	if (addr == 0)
+	if (addr == 0) {
+		rc = -EINVAL;
 		goto err_disable;
+	}
 
 	p = framebuffer_alloc(0, &dp->dev);
 	if (p == NULL) {
@@ -417,7 +422,8 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 
 	init_chips(p, addr);
 
-	if (register_framebuffer(p) < 0) {
+	rc = register_framebuffer(p);
+	if (rc < 0) {
 		dev_err(&dp->dev,"C&T 65550 framebuffer failed to register\n");
 		goto err_unmap;
 	}
-- 
2.39.1

