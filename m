Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C023D783
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE46E883;
	Thu,  6 Aug 2020 07:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325D8899BC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 08:37:01 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by lucky1.263xmail.com (Postfix) with ESMTP id E6688B0743;
 Wed,  5 Aug 2020 16:36:50 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12030T139956846577408S1596616609190052_; 
 Wed, 05 Aug 2020 16:36:50 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8e8bd938e45a208ef8604a951d9c156f>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Sandy Huang <hjc@rock-chips.com>
To: heiko@sntech.de, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: sysfs: Add to get current mode
Date: Wed,  5 Aug 2020 16:36:46 +0800
Message-Id: <20200805083646.4123-1-hjc@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: huangtao@rock-chips.com, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add this node to get the current true mode.

Signed-off-by: Sandy Huang <hjc@rock-chips.com>
---
 drivers/gpu/drm/drm_sysfs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 939f0032aab1..f39bcd34853b 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modes.h>
@@ -236,16 +237,45 @@ static ssize_t modes_show(struct device *device,
 	return written;
 }
 
+static ssize_t current_mode_show(struct device *device,
+		      struct device_attribute *attr,
+		      char *buf)
+{
+	struct drm_connector *connector = to_drm_connector(device);
+	struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	bool interlaced;
+	int written = 0;
+
+	if (!connector->state || !connector->state->crtc)
+		return written;
+
+	crtc_state = connector->state->crtc->state;
+	if (!crtc_state)
+		return written;
+
+	mode = &crtc_state->mode;
+
+	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+	written += snprintf(buf + written, PAGE_SIZE - written, "%dx%d%s%d\n",
+			    mode->hdisplay, mode->vdisplay,
+			    interlaced ? "i" : "p", drm_mode_vrefresh(mode));
+
+	return written;
+}
+
 static DEVICE_ATTR_RW(status);
 static DEVICE_ATTR_RO(enabled);
 static DEVICE_ATTR_RO(dpms);
 static DEVICE_ATTR_RO(modes);
+static DEVICE_ATTR_RO(current_mode);
 
 static struct attribute *connector_dev_attrs[] = {
 	&dev_attr_status.attr,
 	&dev_attr_enabled.attr,
 	&dev_attr_dpms.attr,
 	&dev_attr_modes.attr,
+	&dev_attr_current_mode.attr,
 	NULL
 };
 
-- 
2.17.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
