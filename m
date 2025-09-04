Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C186B444BF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31910EAA0;
	Thu,  4 Sep 2025 17:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="hGSykUIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2AB10EAA0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:50:34 +0000 (UTC)
Received: from relay11 (localhost.localdomain [127.0.0.1])
 by relay11.grserver.gr (Proxmox) with ESMTP id 20BBAC83D6;
 Thu,  4 Sep 2025 20:50:33 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay11.grserver.gr (Proxmox) with ESMTPS id 31873C83DF;
 Thu,  4 Sep 2025 20:50:32 +0300 (EEST)
Received: from antheas-z13 (unknown [37.96.55.21])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id BDCC61FD16C;
 Thu,  4 Sep 2025 20:50:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1757008231;
 bh=FAwQlwPQUFjjBDmWFYI8RWhKWg0GgiJpejj4F2AcJk4=; h=From:To:Subject;
 b=hGSykUIcCZZacyZuJJkY0+40/wYGVHcaqyeSQl62p5iEM8/wDBBxO/kNbA5JNxPLa
 ZTtmiZmdk1caOSNknqVPpTVqyeWA/0IRn1r5EeeYcC2OeXgrueB+cUuYreUexSC+sK
 uIlwj5fZS/AMjNZ5InYlMW4Soibq+gKX5qUWc0+G3uWJJL120rVXNhyxjxQfjFStEc
 W0nnmgbJ3NeEEczTZxSSLPNN2KuEJljfbGzrjMhXtCYZ54YlBN/rcNQ5BRYCFQBA/G
 3kObjzJ7e0d1Xuyolf7OWb2F4TBaJSym7VEhJyiibhSb2eoYh4XceOy/uwM5LR73TO
 D0QBFSSLi644w==
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
Subject: [PATCH v1 01/10] drm: panel-orientation-quirks: Add AOKZOE A1 Pro
Date: Thu,  4 Sep 2025 19:50:16 +0200
Message-ID: <20250904175025.3249650-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904175025.3249650-1-lkml@antheas.dev>
References: <20250904175025.3249650-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175700823183.2009087.916605427090942928@linux3247.grserver.gr>
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

The AOKZOE A1 Pro has a portrait 16:10 panel, add a quirk for it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3a218fb592ce..f5c7275cf026 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -179,6 +179,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* AOKZOE A1 Pro */
+		.matches = {
+		 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AOKZOE"),
+		 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AOKZOE A1 Pro"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
 	}, {	/* Asus T100HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.51.0


