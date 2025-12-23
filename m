Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB7CDA34E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F5110E094;
	Tue, 23 Dec 2025 18:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="dJ/dS8I0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8310E181
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512942; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D4dpXf/kOefOTHn0G+if7MWNoBnc6pazo1tBs6sTAV/f9l9K8j39LQnk+9f6NSGNG2ygyYemKumsfw3wZnhWb/F4QU3A25tAEiu1XzmbfdC7uZeoUHWlO2I2F8CxiFoP0Ayst2EXHz4VADIq4yFFutxgC2w8TC8BZPXDVMhJNsk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512942;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pJn/mw27ASMYH1eslTWNk2pj9StSgOu234qU94wNcU0=; 
 b=k3ORl5QY+zvbSztiY1n7UxmxmFLtAM7kq9RsDhPIJ2J/Xass0S9U2rT1LPbFLqa0YJnfsw7X2Buob+TTleIhcEdIiEjQMfe2YK+Y6peWOxhQ3zRQg3bZ/VJwLmo6STsdjweQ6FNJ+RG1CxCDHNAQoEFz3HKt6h3Dw40vrQMtgJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512942; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=pJn/mw27ASMYH1eslTWNk2pj9StSgOu234qU94wNcU0=;
 b=dJ/dS8I0eQlFOUwAkvN1nKoRhjQafI8Xzu7DKN2ztJkWoxkv10zs/Yj3SbjDPjX8
 JS28h6R+MfvtXiGwrcIkzGnVF5JXha371VzFMXbkdEUZpsfDv/KxY1rF6Ut7oUcqkAa
 h1cw9J5l/DC9Le2TsNGZ5j/H5DZScARx0/SM8/yM=
Received: by mx.zohomail.com with SMTPS id 1766512939951945.0171277774921;
 Tue, 23 Dec 2025 10:02:19 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:25 -0300
Subject: [PATCH v3 05/21] drm: Introduce DRM_CAP_CRTC_COLOR_PIPELINE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-5-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=2165;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=kfVUfKjodbekXsvWhvhNMULrCNfhQeoK3m2Un8nNelw=;
 b=KKNosxZ7qfITbVbVW3jxo97MtIlcJAKzhlYoFy4Pl72ZDhs4YOX+LGKl09J8lRNZjvc3hq7L+
 /T9Wydrr3WtCreATzKI826YpBhXQjJ2al0jgTNDP36t+pWl6JZ5tWCy
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Add a new cap that drivers can set to signal they support CRTC (a.k.a.
post-blend) color pipelines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_ioctl.c | 3 +++
 include/drm/drm_drv.h       | 6 ++++++
 include/uapi/drm/drm.h      | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ff193155129e7..2884075660ddd 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_CRTC_COLOR_PIPELINE:
+		req->value = drm_core_check_feature(dev, DRIVER_CRTC_COLOR_PIPELINE);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986de..2a57c50b4223e 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -122,6 +122,12 @@ enum drm_driver_feature {
 	 * the cursor planes to work correctly).
 	 */
 	DRIVER_CURSOR_HOTSPOT           = BIT(9),
+	/**
+	 * @DRIVER_CRTC_COLOR_PIPELINE:
+	 *
+	 * Driver supports CRTC (post-blend) color pipeline.
+	 */
+	DRIVER_CRTC_COLOR_PIPELINE	= BIT(10),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d275..d726828bdf408 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -812,6 +812,12 @@ struct drm_gem_change_handle {
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+/**
+ * DRM_CAP_CRTC_COLOR_PIPELINE
+ *
+ * If set to 1, the driver supports CRTC (post-blend) color pipelines.
+ */
+#define DRM_CAP_CRTC_COLOR_PIPELINE	0x16
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {

-- 
2.51.0

