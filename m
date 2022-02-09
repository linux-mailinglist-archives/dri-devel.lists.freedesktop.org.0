Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E740F4AECBC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6110E2E3;
	Wed,  9 Feb 2022 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05A10E637
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 00:42:18 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id n32so1334854pfv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 16:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qWguoElz75KmwYY4xZ5q3MPGCTv+dwpJ1eiIIAf+DYI=;
 b=B/tjM26rF/X7BGRaXepy7IC+bec6E3rQaGugiZQ65QSzg8Wpus3jdf7Y8WIOmezWlf
 CG8Nns0vXM1MBB8xaPbM9xbRmkaTpfM/NrZoxbwAmIWlcNyx5TCjp1LsMIbW5NbLp6T3
 WRBTZ/dqrvX+zvB1/PKYobcJ4kF8KjXU0sH6gF6r/zLLeKpgD3P9sTUvaV9Np15D48pt
 TjfQxZpJyFs3sI0y77DvIiWLtu6IUgS/2k3alc3DG8GJE3mBdp5zTHK/B8Gwt7GRPtfw
 2H+ymXSNqch23+gFm5HijX2cjqv7YYuSE45Db9Y7Cp2Is5TJqEh7wK2dkAs+UhHRKYlx
 Yfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qWguoElz75KmwYY4xZ5q3MPGCTv+dwpJ1eiIIAf+DYI=;
 b=s2gMWd1LuZHlupqcE3hDBzUBG0h5OCLl02IA92w/rGbmzwFdRXDgcJIXGrGE+06uzk
 teW/HZ1TVmhtXpaaQUge6gcryGUEdIvBnej05zSXAKeJP/y3X7qbbnJLxIQ1VFKQJNf9
 t7aD64A6sAYxd5Yk69W6ebOGy0/pWkLM/Ffw99Our2r+UMbT3XfLxhIO7bCCxDl1Vj6j
 YchW9Rifkb5EJirQZpb2e9/AimAfARgOqzbcVUOfMKhNCAhOCpWySVcmFbosQ3/dbR7g
 hZI8dd+JR1RBYPWvvNgv0IAGPYbYnWapPLkfxsmjhaRhDM/Hzyy9l2tQuryPRV5FlMjm
 P0UQ==
X-Gm-Message-State: AOAM532pDAAP9EweYjXLi5u1/6BXyTFQunOGrFwQ1tpgmOCjSx8EvKcM
 dvOspbKjOV2ZHCyYNw1a988=
X-Google-Smtp-Source: ABdhPJyLflq8sRPyuisFQhnyUpzNtYM2Kz4jF5+2tNwEnkLgsiYU3zyYU9fh/KJvI6QjDkSbFQTrZg==
X-Received: by 2002:a63:88c7:: with SMTP id l190mr1125962pgd.360.1644367338548; 
 Tue, 08 Feb 2022 16:42:18 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id o8sm17404788pfu.52.2022.02.08.16.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 16:42:18 -0800 (PST)
From: davidcomponentone@gmail.com
To: deller@gmx.de
Subject: [PATCH] video: fbdev: replace snprintf with sysfs_emit
Date: Wed,  9 Feb 2022 08:42:05 +0800
Message-Id: <39e3389c6f734f69a01e0d38ef1605a4411d8f55.1644287273.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Feb 2022 08:39:54 +0000
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 davidcomponentone@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yang.guang5@zte.com.cn, caihuoqing@baidu.com,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:
202:8-16: WARNING: use scnprintf or sprintf
./drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:
172:8-16: WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
---
 .../video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index 3db0232c31ab..155b3f8ad158 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -169,7 +169,7 @@ static ssize_t tpo_td043_vmirror_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->vmirror);
+	return sysfs_emit(buf, "%d\n", ddata->vmirror);
 }
 
 static ssize_t tpo_td043_vmirror_store(struct device *dev,
@@ -199,7 +199,7 @@ static ssize_t tpo_td043_mode_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->mode);
+	return sysfs_emit(buf, "%d\n", ddata->mode);
 }
 
 static ssize_t tpo_td043_mode_store(struct device *dev,
-- 
2.30.2

