Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5480E51A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6449B10E568;
	Tue, 12 Dec 2023 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C1410E585
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367582; x=1733903582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4/V0L4OR8s4KucQSwrS0nMwS8bLNl7GlMM7+7PGYfg=;
 b=C6UhwXxMhuagpF42I211Y+UF67fgCxt9rizl3bxwEcMVO4kU7yVxUOdr
 QpGSihbo/OLKW0Bd2JvCM9OKKYYPqBjSaDZvSY77rl6bhQldp9A/uqbCQ
 byFBj9n5abry/61YzeVknKRNhTZBXtT+6ofw/pZbevov1d3hZ9WlGAFg8
 QHbEJFHPT6+6r2E9ISMeTa8l/E9LCLPMm2fW9SsaL9Xp8hJ3HJactLoFA
 p4aBHIXiX8I7Vjljo6lmvDN7cDDCaaP40j/b5q/0flHu3Zb5M+cSJld80
 Ckt5mmhzu5t4ZRXgWI9gAoAmqsGGrmJ0JtMi2wW90MGoKjMADTlr/NESq Q==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448092"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:52:59 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AE7D9280075;
 Tue, 12 Dec 2023 08:52:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/7] drm/bridge: tc358767: Fix order of register defines
Date: Tue, 12 Dec 2023 08:52:52 +0100
Message-Id: <20231212075257.75084-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0x0510 is bigger than 0x50c, order them accordingly.
No functional change intended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 258eacb4125a4..ab0710a35d3d1 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -116,13 +116,6 @@
 /* System */
 #define TC_IDREG		0x0500
 #define SYSSTAT			0x0508
-#define SYSCTRL			0x0510
-#define DP0_AUDSRC_NO_INPUT		(0 << 3)
-#define DP0_AUDSRC_I2S_RX		(1 << 3)
-#define DP0_VIDSRC_NO_INPUT		(0 << 0)
-#define DP0_VIDSRC_DSI_RX		(1 << 0)
-#define DP0_VIDSRC_DPI_RX		(2 << 0)
-#define DP0_VIDSRC_COLOR_BAR		(3 << 0)
 #define SYSRSTENB		0x050c
 #define ENBI2C				(1 << 0)
 #define ENBLCD0				(1 << 2)
@@ -130,6 +123,13 @@
 #define ENBDSIRX			(1 << 4)
 #define ENBREG				(1 << 5)
 #define ENBHDCP				(1 << 8)
+#define SYSCTRL			0x0510	/* System Control Register */
+#define DP0_AUDSRC_NO_INPUT		(0 << 3)
+#define DP0_AUDSRC_I2S_RX		(1 << 3)
+#define DP0_VIDSRC_NO_INPUT		(0 << 0)
+#define DP0_VIDSRC_DSI_RX		(1 << 0)
+#define DP0_VIDSRC_DPI_RX		(2 << 0)
+#define DP0_VIDSRC_COLOR_BAR		(3 << 0)
 #define GPIOM			0x0540
 #define GPIOC			0x0544
 #define GPIOO			0x0548
-- 
2.34.1

