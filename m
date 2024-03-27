Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E081A88DF62
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0D10FC42;
	Wed, 27 Mar 2024 12:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OUY5K+/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253A10FC3B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:23:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EB3FACE25AF;
 Wed, 27 Mar 2024 12:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B8AC433C7;
 Wed, 27 Mar 2024 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542218;
 bh=WaqDM0k5E+6TqZ7VAo4xPDJa0mQQFOoAW/voY48wwiU=;
 h=From:To:Cc:Subject:Date:From;
 b=OUY5K+/vB7dFXq78FUGH3QFHh8PSNffmCsFWt8wxPIT6z57zajNfh74GCRtDL/Dhh
 kdIEbSgH6BqoCRQCHBvpNIbppmPE+ixuWSECDeBbyzeNFsBk4qNq7eOmj1ARuP2V8+
 mfsfocKGGXlvsntrHC0StBOOoUQwCz5HLCmcXxS7xXPp1JTFmpJ/XY5WDLz0x/l7/2
 83EMlLCc1+qhrNybctpvHLXkqUQja5K6wr7Zz5LhPPsHFKX3mdD8yp8wgMD0XvVDOR
 Y9vdv6liHV+Prg+LCjfjLKizJMAJLgVZE+PPW6wQt0MHbdyHG0GXNQ1MA2RmF6aOn8
 f2+dRRiJ9gTfg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jani.nikula@intel.com
Cc: Adrien Grassein <adrien.grassein@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/bridge: lt8912b: do not return negative values
 from .get_modes()" failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:23:36 -0400
Message-ID: <20240327122336.2838688-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 171b711b26cce208bb628526b1b368aeec7b6fa4 Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Fri, 8 Mar 2024 18:03:42 +0200
Subject: [PATCH] drm/bridge: lt8912b: do not return negative values from
 .get_modes()

The .get_modes() hooks aren't supposed to return negative error
codes. Return 0 for no modes, whatever the reason.

Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: stable@vger.kernel.org
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/dcdddcbcb64b6f6cdc55022ee50c10dee8ddbc3d.1709913674.git.jani.nikula@intel.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e7c4bef74aa46..4b2ae27f0a57f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -441,23 +441,21 @@ lt8912_connector_mode_valid(struct drm_connector *connector,
 static int lt8912_connector_get_modes(struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	int ret = -1;
-	int num = 0;
 	struct lt8912 *lt = connector_to_lt8912(connector);
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	int ret, num;
 
 	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
 	drm_edid_connector_update(connector, drm_edid);
-	if (drm_edid) {
-		num = drm_edid_connector_add_modes(connector);
-	} else {
-		return ret;
-	}
+	if (!drm_edid)
+		return 0;
+
+	num = drm_edid_connector_add_modes(connector);
 
 	ret = drm_display_info_set_bus_formats(&connector->display_info,
 					       &bus_format, 1);
-	if (ret)
-		num = ret;
+	if (ret < 0)
+		num = 0;
 
 	drm_edid_free(drm_edid);
 	return num;
-- 
2.43.0




