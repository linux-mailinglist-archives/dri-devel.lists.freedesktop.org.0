Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D37FD2EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92B10E3CA;
	Wed, 29 Nov 2023 09:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 920 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 09:38:08 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0410E3CA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=RYl3c6WXzDrRpbjIfV
 dIreOF56KOfXk0Od7xbr0Mo5Y=; b=pLbcSYTqLdumG+FJD/65/z0maKYMqRzJSY
 /FpnmpMZlTxnZzDQLOKDusWc6Gtt4KQcKj3V6rmC+x7V/sl8mMjRuIihX8kGEA5q
 HgTtrw82wtg/OG6NvIg/zZo4SnSZxwSTp3z1I6BrFRuQFJsaJYy+3n0jSjrq1WPH
 kb6lGdgRg=
Received: from localhost.localdomain (unknown [39.144.190.126])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wA3X+CMAmdlXBT+CQ--.41354S2;
 Wed, 29 Nov 2023 17:21:17 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] [drm/meson] meson_plane: Add error handling
Date: Wed, 29 Nov 2023 01:21:13 -0800
Message-Id: <20231129092113.32630-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wA3X+CMAmdlXBT+CQ--.41354S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWfWryftry3Gr48Kr4DJwb_yoW8Wr1xpF
 4UCF1Y9r17Aa15t347AF4YyFZxWw4fGFyUuFy8twnYkwnxKFy7CFy3KFZrCF4UXFW5u3Z3
 Kr13Cr4DCF17AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5EfUUUUUU=
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBchI3gletj5ACogAAsQ
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
Cc: neil.armstrong@linaro.org, Haoran Liu <liuhaoran14@163.com>,
 tzimmermann@suse.de, martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds robust error handling to the meson_plane_create
function in drivers/gpu/drm/meson/meson_plane.c. The function
previously lacked proper handling for potential failure scenarios
of the drm_universal_plane_init call.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 815dfe30492b..67b36398f146 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
 	struct meson_plane *meson_plane;
 	struct drm_plane *plane;
 	const uint64_t *format_modifiers = format_modifiers_default;
+	int ret;
 
 	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
@@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
 	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		format_modifiers = format_modifiers_afbc_g12a;
 
-	drm_universal_plane_init(priv->drm, plane, 0xFF,
+	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
 				 &meson_plane_funcs,
 				 supported_drm_formats,
 				 ARRAY_SIZE(supported_drm_formats),
 				 format_modifiers,
 				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
+	if (ret) {
+		devm_kfree(priv->drm->dev, meson_plane);
+		return ret;
+	}
 
 	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
 
-- 
2.17.1

