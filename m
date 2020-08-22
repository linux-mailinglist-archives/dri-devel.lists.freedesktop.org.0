Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10F24E68A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E136E44C;
	Sat, 22 Aug 2020 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 890F36E41B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 06:58:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.192.85.18])
 by mail-app4 (Coremail) with SMTP id cS_KCgB3v__vwUBfK74zAQ--.24265S4;
 Sat, 22 Aug 2020 14:57:55 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] [v2] drm/omap: Fix runtime PM imbalance on error
Date: Sat, 22 Aug 2020 14:57:33 +0800
Message-Id: <20200822065743.13671-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgB3v__vwUBfK74zAQ--.24265S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXr15ArW7ZF1xZr17WF1kAFb_yoWrAF1Dpr
 Wkta4jvryxAa13tr1DA3ZxXas8Wa1xZFyfGryUC3s3ua1rAa4Utr95AFWYvFyvkrWkAF17
 tFsrJrWavF1rKr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28I
 cxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoSBlZdtPnBhAAwsv
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Wambui Karuga <wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() increments the runtime PM usage counter
even when it returns an error code. However, users of its
direct wrappers in omapdrm assume that PM usage counter will
not change on error. Thus a pairing decrement is needed on
the error handling path for these wrappers to keep the counter
balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Fix 5 additional similar cases in omapdrm.
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/dss.c   | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 6 +++---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 6 +++---
 drivers/gpu/drm/omapdrm/dss/venc.c  | 7 +++++--
 6 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 48593932bddf..599183879caf 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -653,8 +653,11 @@ int dispc_runtime_get(struct dispc_device *dispc)
 	DSSDBG("dispc_runtime_get\n");
 
 	r = pm_runtime_get_sync(&dispc->pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&dispc->pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 void dispc_runtime_put(struct dispc_device *dispc)
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index eeccf40bae41..973bfa14a104 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -1112,8 +1112,11 @@ static int dsi_runtime_get(struct dsi_data *dsi)
 	DSSDBG("dsi_runtime_get\n");
 
 	r = pm_runtime_get_sync(dsi->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(dsi->dev);
+		return r;
+	}
+	return 0;
 }
 
 static void dsi_runtime_put(struct dsi_data *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 6ccbc29c4ce4..d7b2f5bcac16 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -858,8 +858,11 @@ int dss_runtime_get(struct dss_device *dss)
 	DSSDBG("dss_runtime_get\n");
 
 	r = pm_runtime_get_sync(&dss->pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&dss->pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 void dss_runtime_put(struct dss_device *dss)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 2578c95570f6..2cc804bdc2e4 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -44,10 +44,10 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
 	DSSDBG("hdmi_runtime_get\n");
 
 	r = pm_runtime_get_sync(&hdmi->pdev->dev);
-	WARN_ON(r < 0);
-	if (r < 0)
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&hdmi->pdev->dev);
 		return r;
-
+	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 4d4c1fabd0a1..92fe05d3da5a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -45,10 +45,10 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
 	DSSDBG("hdmi_runtime_get\n");
 
 	r = pm_runtime_get_sync(&hdmi->pdev->dev);
-	WARN_ON(r < 0);
-	if (r < 0)
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&hdmi->pdev->dev);
 		return r;
-
+	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e0817934ee16..4844743fd507 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -361,8 +361,11 @@ static int venc_runtime_get(struct venc_device *venc)
 	DSSDBG("venc_runtime_get\n");
 
 	r = pm_runtime_get_sync(&venc->pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&venc->pdev->dev);
+		return r;
+	}
+	return 0;
 }
 
 static void venc_runtime_put(struct venc_device *venc)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
