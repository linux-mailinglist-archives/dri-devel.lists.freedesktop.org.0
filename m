Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7AB444C0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4426910EAA3;
	Thu,  4 Sep 2025 17:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="o/+lgSpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BACF10EAA1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:38 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id C1705BDC12;
 Thu,  4 Sep 2025 20:50:36 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 54736BDC0C;
 Thu,  4 Sep 2025 20:50:35 +0300 (EEST)
Received: from antheas-z13 (unknown [37.96.55.21])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id F37C81FD14D;
 Thu,  4 Sep 2025 20:50:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1757008235;
 bh=Zoi/F8a/F7smWEaCVkpYRIZrTHmWkc+ckFYGHGP1M30=; h=From:To:Subject;
 b=o/+lgSpJMPTJTxqFThHOA35W+KwAvWpedhv94sehJO4Jnk99aJzYV/ABUJXyn/KT8
 1IRLIyFgkOiQUjN66uaaTMmDix6ri+TV2Y56Q0k7OtpK0xWE6O0V7ASxH0lLvIPlba
 O96CqFrQMYwyvSEdi1F4TPXBu8fgor2dbiw1Zjm+AUex92j+clDplfW6Hk433QYi4B
 P79s+W0CWlenQ4WyVUrv3LXVGBATHByo1rPndOb9W3IxRwJuEsglt61+ugokfhzwoR
 f7QFQJ2zPvA/FBoywZd3DjIWOkvoSNrZyzeGc11ADN17q2fboi/sd6P1Y/Dvw53UcB
 +WIk5Na3aAb+Q==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 37.96.55.21) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 03/10] drm: panel-orientation-quirks: Add Ayaneo 3
Date: Thu,  4 Sep 2025 19:50:18 +0200
Message-ID: <20250904175025.3249650-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904175025.3249650-1-lkml@antheas.dev>
References: <20250904175025.3249650-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175700823496.2009223.10935760764510186067@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
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

The Ayaneo 3 comes with two panels, an OLED right side up 1080p panel
and an IPS landscape 1080p panel. However, both have the same DMI data.
This quirk adds support for the portrait OLED panel.

As the landscape panel is 1920x1080 and the right side up panel is
1080x1920, the width and height arguments are used to differentiate
the panels.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d724253407af..0ea06f928f79 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -209,6 +209,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* AYANEO 3 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 3"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* AYA NEO 2021 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
-- 
2.51.0


