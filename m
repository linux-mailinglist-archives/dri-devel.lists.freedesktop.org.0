Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7397A2DB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1888D10E368;
	Mon, 16 Sep 2024 13:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="psnQIEix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE1710E368
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1726492911;
 bh=PtaU0PjHbdO0sNN5fkkU0y+2eRLBqNws1vmyaaveI8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=psnQIEixxGf2tCi1GG70W2MZrh2YralcgBdSvUZN6DnbfHr1rq1BivNKsB9CX9vsx
 3h+nX6pg4Fmt0qWh5NW2BOFnXiJtF8QvbsRGvAo1g3YMFQPSSup2cQsK6u5nGNtDab
 pssRWJFrqPuz3arFqQ7PRk54ZLoNy9//vjCLo5bmds6/yPGPZPx8aZK/tyOBtZ8qJJ
 D7q3FhxbMaiSJVT3Sx7BS7QEv6DQ5R8uvrSAASRR9x0j0AQCkvCm3IXiWXOc7agQnW
 +HXcUOOniUjOaLuuTbdMPvu73I42AvQsH/E/UxG5HTy2R0pRpP8QtmuAPuLt8yyY6J
 9vWKT8EZgsy5Q==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 118262066F;
 Mon, 16 Sep 2024 15:21:51 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 Founder edition
Date: Mon, 16 Sep 2024 15:18:53 +0200
Message-ID: <f71889a0b39f13f4b78481bd030377ca15035680.1726492131.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joaquín Ignacio Aramendía <samsagax@gmail.com>

Add quirk orientation for AYA NEO Founder. The name appears with spaces in
DMI strings as other devices of the brand. The panel is the same as the
NEXT and 2021 models. Those could not be reused as the former has VENDOR
name as "AYANEO" without spaces and the latter has "AYADEVICE".

Tested by the JELOS team that has been patching their own kernel for a
while now and confirmed by users in the AYA NEO and ChimeraOS discord
servers.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3044927c0c5c..d1302123071e 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -202,6 +202,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* AYA NEO Founder */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYA NEO Founder"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* AYA NEO NEXT */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-- 
2.44.2

