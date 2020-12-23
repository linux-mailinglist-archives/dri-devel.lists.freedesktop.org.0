Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269B2E11E8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744926E8B2;
	Wed, 23 Dec 2020 02:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47C06E8B6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 02:18:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24F2023381;
 Wed, 23 Dec 2020 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689932;
 bh=meK32/YyFfNWQD6sqkHF3xM9gn6SguVzcEkYXIDA9Qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rwwR1CT8JMvnDI/A2zXyMyOipb07y2dkUZFi/7M/Q8MQgk4KTKaLu2AI+2c3RzYXv
 pZMuDQUrJbO12aODQaqvqi5pT/ggX+gYgIo/kUvxkaFqZ186ogxJrAHfsGvvQAlqaH
 FPTGI8ql5DLEMO1XoXc+iO5CDe/j/SwC80pg5Z+vUpUa2iNWWaNayATh+RWuD1btOq
 B43wQPS1oO6mR5xl8DWb73/uTtKNZCkX4F8NFrmp7jmVU5xPh/GhJXFH348GsGYT2u
 cuEOhbwBKes6S7Teel4SncnMMbB6YaZb32SBflYs0ocu/tKTUOj1F8Xiam0idEIASW
 kUFlZho7/+zmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 030/130] drm/omap: Fix runtime PM imbalance on
 error
Date: Tue, 22 Dec 2020 21:16:33 -0500
Message-Id: <20201223021813.2791612-30-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Dinghao Liu <dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit a5d704d33245b0799947a3008f9f376dba4d5c91 ]

pm_runtime_get_sync() increments the runtime PM usage counter
even when it returns an error code. However, users of its
direct wrappers in omapdrm assume that PM usage counter will
not change on error. Thus a pairing decrement is needed on
the error handling path for these wrappers to keep the counter
balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200822065743.13671-1-dinghao.liu@zju.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/dss.c   | 7 +++++--
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 6 +++---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 6 +++---
 drivers/gpu/drm/omapdrm/dss/venc.c  | 7 +++++--
 6 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index ed0ccbeed70f2..d31ce81f03e7c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -664,8 +664,11 @@ int dispc_runtime_get(struct dispc_device *dispc)
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
index b30fcaa2d0f55..a821359879922 100644
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
index ac93dae2a9c84..f4fedaa7b6b33 100644
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
index 0f557fad4513f..6564285a4a2f7 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -41,10 +41,10 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
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
index d9463b3325543..0d7267e25681e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -42,10 +42,10 @@ static int hdmi_runtime_get(struct omap_hdmi *hdmi)
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
index 596a297d58139..301c7c4b2ed2e 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -403,8 +403,11 @@ static int venc_runtime_get(struct venc_device *venc)
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
