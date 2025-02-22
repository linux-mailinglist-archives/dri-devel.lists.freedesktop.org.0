Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D1A40A50
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 17:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1610E1B4;
	Sat, 22 Feb 2025 16:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="D9K1xzht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BB210E1B4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 16:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 79B622E08ECE;
 Sat, 22 Feb 2025 18:43:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1740242618;
 bh=WI2irC0CseSMJ+gfYCxAX18NR/C/vY0O/CRbSPOtZME=; h=From:To:Subject;
 b=D9K1xzhtfyi9pbu9JZ0PFm24nwbnxC+122vFQO27ktJFEPtxooM9yQPyY/gqeLH7J
 WTyTbFGsk3t3zFiMpgLcEyMAGoFzMkWZ4DMsWLwr7Q0ahj3c8g8m8eeMYWUoUiUre8
 6vq5voobkP63ayVqT2LQv304oTPuOY5wMybYXBcU=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 3/5] drm: panel-orientation-quirks: Add OneXPlayer F1Pro quirk
Date: Sat, 22 Feb 2025 17:43:19 +0100
Message-ID: <20250222164321.181340-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
References: <20250222164321.181340-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174024261866.17381.12679085039175342558@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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

The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
Add a quirk to correct the panel portrait orientation. In addition,
it comes with a red limited edition variant in the Chinese market,
so add that as well.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 1378690b7287..f08cdc81dd9a 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -467,6 +467,18 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.48.1

