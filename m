Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945C4693B4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B19D7AB61;
	Mon,  6 Dec 2021 10:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF546FFE6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 13:16:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BB8260F72;
 Sun,  5 Dec 2021 13:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E888C341C8;
 Sun,  5 Dec 2021 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638710178;
 bh=WR2sGLUiGo/sjqIoR4o4HHQDLL57dPG1ww55q35uaZw=;
 h=From:To:Cc:Subject:Date:From;
 b=FHmz6iJ2Z/8x1FTzXdNP+j6dJXw5fPtytQUk5E59vOQ9san9B3HAEs7Jt4/32JVHF
 VA1auWCQupfib7OKIbTFD7MN2lkoXC+vZFRWq5tuBxqwsBxzB0J0YE2Q067dAaCiQ7
 yU1i+H/QZG7iqaYHb74WOdLqqpUS6dm6530zpgg4e820KYKAiMCcAW3ANgR2QlhGet
 sOYok/ru/awRMnAsntpyu4yUXX8zuoebdXJtPb1EzoePjIiulUewAfRQGxrgnPBBCG
 0Pk22JwiBIWmHO29x98yUnjURCIr9m0x05U8bfUFYJdp2myduc03F2y8kAxmdNDuTE
 84tdoMCwIRYUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] omapdrm: dss: mark runtime PM functions __maybe_unused
Date: Sun,  5 Dec 2021 14:15:56 +0100
Message-Id: <20211205131612.3192652-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Using the SET_RUNTIME_PM_OPS() macro causes a warning about the
referenced functions when they are marked static but not __maybe_unused:

drivers/gpu/drm/omapdrm/dss/dss.c:1572:12: error: unused function 'dss_runtime_suspend' [-Werror,-Wunused-function]
drivers/gpu/drm/omapdrm/dss/dss.c:1584:12: error: unused function 'dss_runtime_resume' [-Werror,-Wunused-function]
drivers/gpu/drm/omapdrm/dss/dispc.c:4845:12: error: unused function 'dispc_runtime_suspend' [-Werror,-Wunused-function]
drivers/gpu/drm/omapdrm/dss/dispc.c:4860:12: error: unused function 'dispc_runtime_resume' [-Werror,-Wunused-function]

Fixes: b92f7ea556f8 ("drm/omap: dss: Make use of the helper macro SET_RUNTIME_PM_OPS()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 4 ++--
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 ++--
 drivers/gpu/drm/omapdrm/dss/dss.c   | 4 ++--
 drivers/gpu/drm/omapdrm/dss/venc.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index b440147ae28b..ab259efe132b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4842,7 +4842,7 @@ static int dispc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int dispc_runtime_suspend(struct device *dev)
+static __maybe_unused int dispc_runtime_suspend(struct device *dev)
 {
 	struct dispc_device *dispc = dev_get_drvdata(dev);
 
@@ -4857,7 +4857,7 @@ static int dispc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int dispc_runtime_resume(struct device *dev)
+static __maybe_unused int dispc_runtime_resume(struct device *dev)
 {
 	struct dispc_device *dispc = dev_get_drvdata(dev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index d730bf67fed9..a6845856cbce 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5058,7 +5058,7 @@ static int dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int dsi_runtime_suspend(struct device *dev)
+static __maybe_unused int dsi_runtime_suspend(struct device *dev)
 {
 	struct dsi_data *dsi = dev_get_drvdata(dev);
 
@@ -5071,7 +5071,7 @@ static int dsi_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int dsi_runtime_resume(struct device *dev)
+static __maybe_unused int dsi_runtime_resume(struct device *dev)
 {
 	struct dsi_data *dsi = dev_get_drvdata(dev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 66db28bfe824..69b3e15b9356 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1569,7 +1569,7 @@ static void dss_shutdown(struct platform_device *pdev)
 	DSSDBG("shutdown\n");
 }
 
-static int dss_runtime_suspend(struct device *dev)
+static __maybe_unused int dss_runtime_suspend(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 
@@ -1581,7 +1581,7 @@ static int dss_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int dss_runtime_resume(struct device *dev)
+static __maybe_unused int dss_runtime_resume(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 	int r;
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 508fddd376cf..4480b69ab5a7 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -879,7 +879,7 @@ static int venc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int venc_runtime_suspend(struct device *dev)
+static __maybe_unused int venc_runtime_suspend(struct device *dev)
 {
 	struct venc_device *venc = dev_get_drvdata(dev);
 
@@ -889,7 +889,7 @@ static int venc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int venc_runtime_resume(struct device *dev)
+static __maybe_unused int venc_runtime_resume(struct device *dev)
 {
 	struct venc_device *venc = dev_get_drvdata(dev);
 
-- 
2.29.2

