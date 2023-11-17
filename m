Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F1F7EF77B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 19:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4903410E0DA;
	Fri, 17 Nov 2023 18:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42710E143
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:39:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C046EC7CB3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:19:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68975FF811;
 Fri, 17 Nov 2023 14:19:45 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Yao <markyao0591@gmail.com>
Subject: [PATCH] drm/rockchip: lvds: do not print error message when
 deferring probe
Date: Fri, 17 Nov 2023 15:19:32 +0100
Message-ID: <20231117-rk-lvds-defer-msg-v1-1-1e6894cf9a74@theobroma-systems.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: foss@0leil.net
X-Mailman-Approved-At: Fri, 17 Nov 2023 18:31:42 +0000
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
Cc: linux-rockchip@lists.infradead.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <foss+kernel@0leil.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
This scary message may happen if the panel or bridge is not probed=0D
before the LVDS controller is, resulting in some head scratching because=0D
the LVDS panel is actually working, since a later try will eventually=0D
find the panel or bridge.=0D
=0D
Therefore let's demote this error message into a debug message to not=0D
scare users unnecessarily.=0D
=0D
Fixes: 34cc0aa25456 ("drm/rockchip: Add support for Rockchip Soc LVDS")=0D
Cc: Quentin Schulz <foss+kernel@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/roc=
kchip/rockchip_lvds.c=0D
index f0f47e9abf5a..52e2ce2a61a8 100644=0D
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c=0D
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c=0D
@@ -577,7 +577,7 @@ static int rockchip_lvds_bind(struct device *dev, struc=
t device *master,=0D
 		ret =3D -EINVAL;=0D
 		goto err_put_port;=0D
 	} else if (ret) {=0D
-		DRM_DEV_ERROR(dev, "failed to find panel and bridge node\n");=0D
+		DRM_DEV_DEBUG(dev, "failed to find panel and bridge node\n");=0D
 		ret =3D -EPROBE_DEFER;=0D
 		goto err_put_port;=0D
 	}=0D
=0D
---=0D
base-commit: 7475e51b87969e01a6812eac713a1c8310372e8a=0D
change-id: 20231117-rk-lvds-defer-msg-b2944b73d791=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
