Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F59BC7181A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACD310E6B2;
	Thu, 20 Nov 2025 00:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="kPUdvagP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BAC10E584
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:56:31 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 78947240101
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1763535079; bh=XbG/R1XMWVciVZahpZXNfQTh65qidHtdP102/Tnoh0c=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=kPUdvagPL2lzmScVG0/nhsvUFEQ7rK9+CU3pCPaWcc4HlCaD0zAuOaIN6lLybR425
 bo9y73LmM4jynlU7ygHw0yVvzKq4DA0jcb0eT3GILBbGry/XgV626R4OBQKkDmsc/P
 zPFs8AQ8X6MblAZEmGA/zveJ00dOLUEruGwIX1ys88VSuxX69ddEO458nuo0SGM2y1
 ho59Hn9n24ENckv+lSfA4GAK4aSC6BW8LYGVo6v/f5LmagpDH3Z6H5L2FwDWAfhRbm
 LgZvqA54TPfMEUyNDkvC5YlgYtDIADMqvaeDFGYhrI5/wDPULCi3SlFzibQ3FWU+bU
 ORGJYED6CwH0Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4dBBw563m7z6v17;
 Wed, 19 Nov 2025 07:51:17 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [RFC 1/4] hack: drm: panel: mantix: Allow to query enabled state
Date: Wed, 19 Nov 2025 06:51:18 +0000
Message-ID: <20251119065109.910251-2-martink@posteo.de>
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

From: Guido Günther <agx@sigxcpu.org>

This will be used by the touch controller.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 55664f5d5aa5d..16c0e5c6b7da7 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -40,6 +40,14 @@ struct mantix {
 	const struct drm_display_mode *default_mode;
 };
 
+static bool panel_prepared;
+
+bool mantix_panel_prepared(void)
+{
+  return panel_prepared;
+}
+EXPORT_SYMBOL_GPL(mantix_panel_prepared);
+
 static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
 {
 	return container_of(panel, struct mantix, panel);
@@ -114,6 +122,8 @@ static int mantix_unprepare(struct drm_panel *panel)
 	/* T14 */
 	msleep(50);
 
+	panel_prepared = false;
+
 	return 0;
 }
 
@@ -155,6 +165,8 @@ static int mantix_prepare(struct drm_panel *panel)
 	/* T6 */
 	msleep(50);
 
+	panel_prepared = true;
+
 	return 0;
 }
 
-- 
2.47.3

