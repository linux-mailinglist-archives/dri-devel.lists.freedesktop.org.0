Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59657DCDC8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845D10E4C5;
	Tue, 31 Oct 2023 13:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E685C10E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:27:15 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1569F5AA;
 Tue, 31 Oct 2023 14:26:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698758818;
 bh=I/CtWgvz0BJifB1qTHPuDWeeFWh42GIeJ7wx1VtfgUE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vmZZh7wYPTXo5fLBTB1h+AraB7Gbk13wHg5d+3Ph7aveao9K9jlrjKMnEYB1cyN7Q
 26ocM3/kwMDCEaU48NDJbcqK56Qt+S1MdT/IKmDqz8H0zIDV8tHXydV6n1Sf/me4Cb
 Aaoq9D8idueOswN73o0RdyKGqDfXemsi1DUyedqw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 31 Oct 2023 15:26:56 +0200
Subject: [PATCH 2/2] drm/bridge: tc358767: Fix link properties discovery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-tc358767-v1-2-392081ad9f4b@ideasonboard.com>
References: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
In-Reply-To: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=I/CtWgvz0BJifB1qTHPuDWeeFWh42GIeJ7wx1VtfgUE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQQCvB7wrB7TMKnDKR6rRauEEUAKRUabrIZ4OB
 BOeFOvaEY6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUEArwAKCRD6PaqMvJYe
 9UfAD/0c/gKIkRmx+ScHQe3PosmKMmN/Bvt6Y+Rq4GX/xx+IS1+eDx/L5pTPvYRCdOSno5JCJ6a
 5w41PEgl9vSFftu75TYs0A5KwOo4JctKBQbHvpvaG55VGtodZtb2CfuGdp9sjUdT+DAUWI41Nhg
 4aaIe4aYlTcsTsQwgZ+jF2wBfj73+JBENg8k2aKWUO3o/U/Z0N94JGIBnc+qAhTB/UDWqVQLOsg
 hJC3tnmulrPwGSVQUeSSmj+gyAuZsk3Dg8+NbdX3Jb1Ge/ds0E2daFHjjoHKkXFBqEaChR45eR+
 wG0G195/F4Bqd+/hW8FQDl0K3WT8oulo8EFeYPouQ26w+LtfZdZhIUNSTktPCCjy+rWGREx0s3R
 uuPWD2totclIyiOy+RWFT1x2KLrF7ivYd7b8KdjxUc5f78BB36QzttdGTl1oFWGRhDChxty6+Vc
 K+VsKGd8qKminlqdrIAnkXGB/NIflfP6ARpBc5FZOG5wjhQ6NzybMW44fRxr8buxYijp9+6Cc+/
 NjDrbZpInP+KHANRuS9k6MOD/fr2oLTuk6vvIZprjg6AJ9haU4or3ej5uyCZcRuk7Dpck4STLuv
 2xx/wglVjRxpOu1UlEmMaKKarfdymQsgcMFtrkBSZ/rIHb5WV7Z0S3tYUvjVtgIi7pl6e7hD1P1
 QFE34g+AHAuTEew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a display controller driver uses DRM_BRIDGE_ATTACH_NO_CONNECTOR,
tc358767 will behave properly and skip the creation of the connector.

However, tc_get_display_props(), which is used to find out about the DP
monitor and link, is only called from two places: .atomic_enable() and
tc_connector_get_modes(). The latter is only used when tc358767 creates
its own connector, i.e. when DRM_BRIDGE_ATTACH_NO_CONNECTOR is _not_
set.

Thus, the driver never finds out the link properties before get_edid()
is called. With num_lanes of 0 and link_rate of 0 there are not many
valid modes...

Fix this by adding tc_connector_get_modes() call at the beginning of
get_edid(), so that we have up to date information before looking at the
modes.

Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Closes: https://lore.kernel.org/all/24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com/
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 0affcefdeb1c..137a9f5e3cad 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1579,6 +1579,13 @@ static struct edid *tc_get_edid(struct drm_bridge *bridge,
 				struct drm_connector *connector)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
+	int ret;
+
+	ret = tc_get_display_props(tc);
+	if (ret < 0) {
+		dev_err(tc->dev, "failed to read display props: %d\n", ret);
+		return 0;
+	}
 
 	return drm_get_edid(connector, &tc->aux.ddc);
 }

-- 
2.34.1

