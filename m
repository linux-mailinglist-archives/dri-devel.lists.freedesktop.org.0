Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF99040B5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B710E6A5;
	Tue, 11 Jun 2024 16:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="QuwtYk2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACA510E6AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718121749; bh=nlK/Kivspo5uHUE2bxjdk8Lq1XFHOztjsLHLbVDbKeE=;
 b=QuwtYk2dz/yFy+JRnap5RX/dK4JPLzySux+bl16f8o50T2EteWNVdlZ8AH7MbCcWxWHUe+PgS
 GTMexP95ZkB7mkTBxqWDr2QOe0700nms79Tj5mFdELs0kCtr+kgp+IFQjOfZpnzwEn4xO4lRbhW
 YGupfo6Iq0E5yi7Wr8+uatbu0lHy3ZEfTdkbdQkyzyrlHSCeUS4OiULi0a4aQp/V5YR7RvZuyaG
 NRNDHU8ProU4KHS6NBywhXhJtStLvOiukVuoHfWNX4SNp9NKM1vORTnUVhJ5q3uCLG13LJJ7H5X
 vYM6mVymPbQUilLY84Oc3M07fB1AcPx3wpGBVMn/nIRA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] drm: bridge: dw_hdmi: Update EDID during hotplug
 processing
Date: Tue, 11 Jun 2024 15:50:59 +0000
Message-ID: <20240611155108.1436502-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611155108.1436502-1-jonas@kwiboo.se>
References: <20240611155108.1436502-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66687294b913b04293b6dca0
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

Update successfully read EDID during hotplug processing to ensure the
connector diplay_info is always up-to-date.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 256e00a97a9a..a9c39584d31b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2458,6 +2458,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	status = dw_hdmi_detect(hdmi);
 
+	/* Update EDID during hotplug processing (force=false) */
+	if (status == connector_status_connected && !force) {
+		const struct drm_edid *drm_edid;
+
+		drm_edid = dw_hdmi_edid_read(hdmi, connector);
+		if (drm_edid)
+			drm_edid_connector_update(connector, drm_edid);
+		cec_notifier_set_phys_addr(hdmi->cec_notifier,
+			connector->display_info.source_physical_address);
+		drm_edid_free(drm_edid);
+	}
+
 	if (status == connector_status_disconnected)
 		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
 
-- 
2.45.2

