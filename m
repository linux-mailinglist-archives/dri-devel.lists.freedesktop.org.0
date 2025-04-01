Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EEA7815F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01DB10E63B;
	Tue,  1 Apr 2025 17:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=chir.rs header.i=lotte@chir.rs header.b="lHTViPUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1A410E514
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743495566; cv=none; d=zohomail.eu; s=zohoarc; 
 b=XtaKPhUQtTwLDVpUSo8dsL2Beh7oqdbJ2TJ2gyCgpfT3qsz+sivmBGYma+IyqLICuGnQb64oy6ls0CYazbKhLpRnQ8YU7/GgXVJHE04W7m4425VGAAVC2DSwd48OhNJd3c67lUdkph6Xj6FJiB7R5btPoh9bgDI9WsPuuGZPkqE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1743495566;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4G4q5PPDuHxsYayqZRtqQV33u9pG2D0fN2i5JuYeBHg=; 
 b=CzH4Kc0RbxaH5Eja9VkRHyJywHT77YCbCyRvKsnRkzdGPVpNQ9RCcZwIwU/6wMqo14D9aBZ2UQS3dWWM2xsRVIoQKPMHFJU109F+d3fr1lQ9rpnX8h+G8OhrET451rhAxp3YiiMJcRIICVxSA3ZncTgCTT//roKRypAVTSYnseg=
ARC-Authentication-Results: i=1; mx.zohomail.eu; dkim=pass  header.i=chir.rs;
 spf=pass  smtp.mailfrom=lotte@chir.rs;
 dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743495566; 
 s=zmail; d=chir.rs; i=lotte@chir.rs;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4G4q5PPDuHxsYayqZRtqQV33u9pG2D0fN2i5JuYeBHg=;
 b=lHTViPUXa197dLfXEloBaD2zZkTADqppm0F7xn8aIOG3J8jA6BVkSpXhSbbqGHKL
 wmrZpqbLfgzQ22eS0i8dWpmcnMnt+vTubOEfFLe18pnjS9OEf6RBxwJErkuZUc8o79G
 VXDUwnvE/552o5IWaZ70Mc+ZVJGnE0IoMxhMV54A=
Received: by mx.zoho.eu with SMTPS id 1743495563988807.3819207227426;
 Tue, 1 Apr 2025 10:19:23 +0200 (CEST)
From: =?UTF-8?q?Charlotte=20=Dele=C5=84kec?= <lotte@chir.rs>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] drm/panel: clockworkpi-cwd686: Implement
 .get_orientation callback
Date: Tue,  1 Apr 2025 09:18:33 +0100
Message-ID: <20250401081852.283532-4-lotte@chir.rs>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401081852.283532-1-lotte@chir.rs>
References: <20250401081852.283532-1-lotte@chir.rs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 01 Apr 2025 17:22:19 +0000
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

From: Max Fierke <max@maxfierke.com>

Returns the panel's configured orientation

Signed-off-by: Max Fierke <max@maxfierke.com>
---
 drivers/gpu/drm/panel/panel-clockwork-cwd686.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-clockwork-cwd686.c b/drivers/gpu/drm/panel/panel-clockwork-cwd686.c
index 53d65e6df1b0..49db20de06c1 100644
--- a/drivers/gpu/drm/panel/panel-clockwork-cwd686.c
+++ b/drivers/gpu/drm/panel/panel-clockwork-cwd686.c
@@ -340,7 +340,10 @@ static int cwd686_get_modes(struct drm_panel *panel, struct drm_connector *conne
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-	/* Set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	drm_mode_probed_add(connector, mode);
@@ -348,10 +351,19 @@ static int cwd686_get_modes(struct drm_panel *panel, struct drm_connector *conne
 	return 1; /* Number of modes */
 }
 
+ 
+static enum drm_panel_orientation cwd686_get_orientation(struct drm_panel *panel)
+{
+	struct cwd686 *ctx = panel_to_cwd686(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs cwd686_drm_funcs = {
 	.unprepare = cwd686_unprepare,
 	.prepare = cwd686_prepare,
 	.get_modes = cwd686_get_modes,
+	.get_orientation = cwd686_get_orientation,
 };
 
 static int cwd686_probe(struct mipi_dsi_device *dsi)
-- 
2.48.1

