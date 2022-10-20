Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC96070EB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF3A10E5CA;
	Fri, 21 Oct 2022 07:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7820210E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288637; x=1697824637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v1QWsl+gHrnYkxj6qgW+hV3xKOILPo82/g6zaj1On/I=;
 b=Hr8H6bFcNwMYpcQNCKE7q+Gi9L5jERJ/sCKNneVaRBxdJiIlXrr/+nMb
 5Iq/7eYLLE7hC3cV4A6aDFKRp6QO3V1TWJGlk14jU95mdDeG0n76tsC35
 nndRiOsw9TNMY4MldJ2TQmejYy/1gW6snkhPCnLlZOeqUjG58+WHNb13z
 zKhSme1S8KXEHuRykFmEj7W0c0XuPAgfPBY6j/4XAPqeOsB0Sl6rsh+ul
 zURmV3ptGCKkpyMCOGeBvC2y2I/dGg5lWpZQF/kJCrAEuj+8oQyXEpDaY
 UjOPVAqUjUIwEkIeq8oPjUKtxyJKh4MzFIJ0ifFoiHoCPTvZRMfQFeaJj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528548"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516861"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772516861"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:11 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 03/10] gna: read hardware info
Date: Thu, 20 Oct 2022 19:53:27 +0200
Message-Id: <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Get the hardware information from register MMIO_IBUFFS

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c | 4 ++++
 drivers/gpu/drm/gna/gna_device.h | 9 +++++++++
 drivers/gpu/drm/gna/gna_hw.h     | 7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index b8620b7da205..1f357221a603 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -42,6 +42,7 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 {
 	struct gna_device *gna_priv;
 	struct drm_device *drm_dev;
+	u32 bld_reg;
 	int err;
 
 	gna_priv = devm_drm_dev_alloc(parent, &gna_drm_driver, struct gna_device, drm);
@@ -59,6 +60,9 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 			return err;
 	}
 
+	bld_reg = gna_reg_read(gna_priv, GNA_MMIO_IBUFFS);
+	gna_priv->hw_info.in_buf_s = bld_reg & GENMASK(7, 0);
+
 	dev_set_drvdata(parent, drm_dev);
 
 	err = gna_drm_dev_init(drm_dev);
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index d269f7da5c5e..e42f167b62a0 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -6,6 +6,9 @@
 
 #include <drm/drm_device.h>
 
+#include <linux/io.h>
+#include <linux/types.h>
+
 #include "gna_hw.h"
 
 #define DRIVER_NAME		"gna"
@@ -24,7 +27,13 @@ struct gna_device {
 	/* device related resources */
 	void __iomem *iobase;
 	struct gna_dev_info info;
+	struct gna_hw_info hw_info;
 };
 
 int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
+static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
+{
+	return readl(gna_priv->iobase + reg);
+}
+
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
index 3ca801096fd1..e858b76606fc 100644
--- a/drivers/gpu/drm/gna/gna_hw.h
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -6,6 +6,13 @@
 
 #include <linux/mm_types.h>
 
+/* GNA MMIO registers */
+#define GNA_MMIO_IBUFFS		0xB4
+
+struct gna_hw_info {
+	u8 in_buf_s;
+};
+
 struct gna_dev_info {
 	u32 hwid;
 	u32 num_pagetables;
-- 
2.25.1

