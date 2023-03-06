Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C6A6ABCFB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8A10E1EB;
	Mon,  6 Mar 2023 10:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B291C10E1EB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:35:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 506FAB80D76;
 Mon,  6 Mar 2023 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E768C433EF;
 Mon,  6 Mar 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678098921;
 bh=SRUfSdNrezRb0O3IdTK2gQ4I8eUwRNj/lM/SpHhJyzk=;
 h=From:To:Cc:Subject:Date:From;
 b=cFKax5qc9bZgyqF07BqIBQn1IixKmGK6qqgwzTH2dgSKFoMBja6hBio5dlINqRBsc
 BzKJukhpkk2eKTOaYCa+b4YrEPhGrWl9RRGjUQIb9ehBC6gnleZrd+9S07FwBz8j4T
 c/nqt3e2MElvmEHSm+tyrh+ztgc+pAzpVK6W3r6g/SK0Hh5cpFSZCh4X5UovUbSQpk
 pziKnOrP//m34QXp9pJNcPZ81LGA2b6hbOeVxMGqIK3tD7vJzeF75sNzkaVKrwfVel
 Ps93IE6prRpA2EhMtPg3oXtfK51lg1NAgXKJqhCML1IbLuU4W+/zzyFT+5G1anR4va
 N6p+c6niGaz+g==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ8CH-0001Hm-Ce; Mon, 06 Mar 2023 11:36:01 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] drm/meson: fix missing component unbind on bind errors
Date: Mon,  6 Mar 2023 11:35:33 +0100
Message-Id: <20230306103533.4915-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to unbind all subcomponents when binding the aggregate device
fails.

Fixes: a41e82e6c457 ("drm/meson: Add support for components")
Cc: stable@vger.kernel.org      # 4.12
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Note that this one has only been compile tested.

Johan


 drivers/gpu/drm/meson/meson_drv.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 79bfe3938d3c..7caf937c3c90 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -325,23 +325,23 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_all;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_all;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_all;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_all;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_all;
 
 	drm_mode_config_reset(drm);
 
@@ -359,6 +359,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+unbind_all:
+	if (has_components)
+		component_unbind_all(drm->dev, drm);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
-- 
2.39.2

