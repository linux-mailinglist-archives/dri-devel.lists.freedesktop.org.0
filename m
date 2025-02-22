Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74674A40A4E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 17:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F4B10E0CE;
	Sat, 22 Feb 2025 16:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="AjWrAo7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E91A10E0CE
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 16:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id ADEE82E08EC8;
 Sat, 22 Feb 2025 18:43:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1740242621;
 bh=JY7i/CHpn3DuO8TtJvACKM8sX47bE38l/OGmAdi73O0=; h=From:To:Subject;
 b=AjWrAo7OKNxUkbB4r17HnP10t6OEw28sXfJ2UI0odPquioWl9V7gO1rNQJKcw53TH
 X5od51B5bh+4bKGKg+hnI9bUhyQxp22sK/64bj1gB7PFGYltPKdoXtHbfNg9Y+2YHg
 bmqO1INKOK3s+GyRUJgKoKnSSE5LZklyO4BF7VTE=
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
Subject: [PATCH 5/5] drm: panel-orientation-quirks: Add Zotac Gaming Zone quirk
Date: Sat, 22 Feb 2025 17:43:21 +0100
Message-ID: <20250222164321.181340-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
References: <20250222164321.181340-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174024262176.17489.912637765842968378@linux1587.grserver.gr>
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

The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
Add the rotation to the panel orientation quirks.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f08cdc81dd9a..bbbe707f541d 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* Zotac Gaming Zone (OLED) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.48.1

