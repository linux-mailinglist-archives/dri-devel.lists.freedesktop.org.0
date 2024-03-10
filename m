Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C558778AD
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 23:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499B210E097;
	Sun, 10 Mar 2024 22:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="IEoPgsYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECA910E097
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 22:04:24 +0000 (UTC)
Received: from localhost (dslb-094-217-220-071.094.217.pools.vodafone-ip.de
 [94.217.220.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id C86F560425;
 Sun, 10 Mar 2024 23:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1710108261;
 bh=xIEzLT2GAIp6whP8aTz63TNnh63lFskfTBq5DGV4TlU=;
 h=From:To:Cc:Subject:Date:From;
 b=IEoPgsYCdTs3KlfbG1RIwa4eVjjC/7DQiAcuQcZtd0PD1g1iXceb9KwMEmxYIy2GG
 8eZAbmqzZnhkVmDiXwanGccaB1dvJKyR4we8KRK31X8Fp3TdQ271s7KGIoaHrxUACT
 c8kD4WzxOsGQ5B2FsnamruylAbcaa9AWQlQrdknRZOqiavHzDX5bsmHi6Nwo/3KKH0
 FwG9FBkOdnMbH6G5STdAIXmrt/mlFaCEqRHOBmiiPkBY2JJymhEe+hf0UtLaGTxLuX
 48/WE9dBNv6nxL7yGC1LSZVmcrOxsi8LxYPLtugVe4JGLyuuauhGEEclqRVyEKqNrB
 Nfuebz1wqcWXQ==
From: tjakobi@math.uni-bielefeld.de
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm: panel-orientation-quirks: Add quirk for Aya Neo
 KUN
Date: Sun, 10 Mar 2024 23:04:00 +0100
Message-ID: <20240310220401.895591-1-tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Similar to the other Aya Neo devices this one features
again a portrait screen, here with a native resolution
of 1600x2560.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d92f66e550c..5d3fb11fd45f 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO KUN */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)&lcd1600x2560_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.43.0

