Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C257F1353
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85310E3B4;
	Mon, 20 Nov 2023 12:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF4510E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:30:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8E375CCAA5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:30:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACC3CFF811;
 Mon, 20 Nov 2023 12:30:10 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Yao <markyao0591@gmail.com>
Subject: [PATCH v2 2/2] drm/rockchip: lvds: do not print scary message when
 probing defer
Date: Mon, 20 Nov 2023 13:29:49 +0100
Message-ID: <20231120-rk-lvds-defer-msg-v2-2-9c59a5779cf9@theobroma-systems.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120-rk-lvds-defer-msg-v2-0-9c59a5779cf9@theobroma-systems.com>
References: <20231120-rk-lvds-defer-msg-v2-0-9c59a5779cf9@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: foss@0leil.net
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
This scary message can misled the user into thinking something bad has=0D
happened and needs to be fixed, however it could simply be part of a=0D
normal boot process where EPROBE_DEFER is taken into account. Therefore,=0D
let's use dev_err_probe so that this message doesn't get shown (by=0D
default) when the return code is EPROBE_DEFER.=0D
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
index 17d8fc797151..f2831d304e7b 100644=0D
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c=0D
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c=0D
@@ -577,7 +577,7 @@ static int rockchip_lvds_bind(struct device *dev, struc=
t device *master,=0D
 		ret =3D -EINVAL;=0D
 		goto err_put_port;=0D
 	} else if (ret) {=0D
-		DRM_DEV_ERROR(dev, "failed to find panel and bridge node\n");=0D
+		dev_err_probe(dev, ret, "failed to find panel and bridge node\n");=0D
 		goto err_put_port;=0D
 	}=0D
 	if (lvds->panel)=0D
=0D
-- =0D
2.42.0=0D
=0D
