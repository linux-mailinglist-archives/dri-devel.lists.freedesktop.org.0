Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEA87F976
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADAD10F638;
	Tue, 19 Mar 2024 08:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="ptUnbVjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 04:03:16 UTC
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com
 [139.138.61.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345410E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 04:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1710820995; x=1742356995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iyb8H4Jp8rxsdGteD+xvj4n9KobPYhd4mb8G65zKrMM=;
 b=ptUnbVjF2XPwQ27mzs0IRMkndkx7yeIvmOXOe4WYYSQ/3l3pGrMmR7+S
 NrmPEZ8PdvT9sP87UlXRLKf4Gp5AFjNuEH2BkpQIaNHsLST1P5llIsuuM
 gj7rRb/087yohLgxdQfHk0wding14vvzRE6NbvPAwYWGnPodfj8vxbDyQ
 bbc+MPckFVDPF7zT3LamLl/Eb58sDwZcfefyuXdSmCj+p6nX2gc1yFbf3
 LCg2ECThcrAU+FOpK7bJhrteeR+nuGEAPEo6uoho9NQAXt2qCGrKBsfoU
 WrIguAOv0jRQiO8mv0RtB5QpEXgwrRscgQYSxbqntvEmWSczdcXboD1mp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140667449"
X-IronPort-AV: E=Sophos;i="6.07,135,1708354800"; d="scan'208";a="140667449"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 12:56:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 24FB6FBD8D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 12:56:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A4D5D7B7F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 12:56:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0E7D228817
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 12:55:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 074881A006B;
 Tue, 19 Mar 2024 11:55:58 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Cc: Li Zhijian <lizhijian@fujitsu.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm,
 fbdev: td043mtea1: Convert sprintf() family to sysfs_emit() family
Date: Tue, 19 Mar 2024 11:55:55 +0800
Message-Id: <20240319035555.1577734-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.004
X-TMASE-Result: 10--6.993400-10.000000
X-TMASE-MatchedRID: vWLMKRYJCzcbO59FK9BdmJiHtCNYjckMjkDrBOJwwnQ8JmmJxjOaQXVX
 Q3/qdw5yDiqGKKMcNgRhoUIS5GGeEs1HQN/TlJ3ZOIQ9GP2P2u9hCyUKzFE4pMOmbgJn0O1cd5G
 gTXcmX3z/gi5MRR1gmq+lAgAwPD5q0OVyXblM7jP+xRIVoKNMvNiPDVCot+tGBET8F2y8zKEYdS
 DeLvQ19lun5ICGwWKCEriUbUlPOKO1UOlz1sLXchF4zyLyne+AUrr7Qc5WhKhzvn1t6wuaa+zst
 h4cn4jroa8IWqgpLBOAMuqetGVetksDkkP3zIjq3QfwsVk0UbtuRXh7bFKB7qOOXt5BU5y6WbW/
 lbxeI8DFks+BRjeYgccgXIv3OTHQPpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Mailman-Approved-At: Tue, 19 Mar 2024 08:23:06 +0000
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

Per filesystems/sysfs.rst, show() should only use sysfs_emit()
or sysfs_emit_at() when formatting the value to be returned to user space.

coccinelle complains that there are still a couple of functions that use
snprintf(). Convert them to sysfs_emit().

sprintf() and scnprintf() will be converted as well if they have.

Generally, this patch is generated by
make coccicheck M=<path/to/file> MODE=patch \
COCCI=scripts/coccinelle/api/device_attr_show.cocci

No functional change intended

CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Helge Deller <deller@gmx.de>
CC: linux-omap@vger.kernel.org
CC: linux-fbdev@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
V2:
   Fix missing '+' before '=' in drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c

This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
Split them per subsystem so that the maintainer can review it easily
[1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c        | 13 ++++---------
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c    | 12 ++++--------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index cf4609bb9b1d..0983fe47eb5a 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -242,16 +242,11 @@ static ssize_t gamma_show(struct device *dev, struct device_attribute *attr,
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 	ssize_t len = 0;
 	unsigned int i;
-	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len, "%u ",
-			       lcd->gamma[i]);
-		if (ret < 0)
-			return ret;
-		len += ret;
-	}
-	buf[len - 1] = '\n';
+	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++)
+		len += sysfs_emit_at(buf, len, "%u ", lcd->gamma[i]);
+	if (len)
+		buf[len - 1] = '\n';
 
 	return len;
 }
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index 477789cff8e0..3624452e1dd0 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -228,14 +228,10 @@ static ssize_t tpo_td043_gamma_show(struct device *dev,
 	int ret;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(ddata->gamma); i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len, "%u ",
-				ddata->gamma[i]);
-		if (ret < 0)
-			return ret;
-		len += ret;
-	}
-	buf[len - 1] = '\n';
+	for (i = 0; i < ARRAY_SIZE(ddata->gamma); i++)
+		len += sysfs_emit_at(buf, len, "%u ", ddata->gamma[i]);
+	if (len)
+		buf[len - 1] = '\n';
 
 	return len;
 }
-- 
2.29.2

