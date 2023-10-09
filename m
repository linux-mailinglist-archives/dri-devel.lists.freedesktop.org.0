Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A77BD8D0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 12:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7212210E262;
	Mon,  9 Oct 2023 10:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C060310E262
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 10:37:57 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qpne7-0002vw-5l; Mon, 09 Oct 2023 12:37:55 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: hjc@rock-chips.com,
	heiko@sntech.de
Subject: [PATCH] drm/rockchip: vop2: Demote message in mod_supported to
 drm_dbg_kms
Date: Mon,  9 Oct 2023 12:37:53 +0200
Message-Id: <20231009103753.830458-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking if a modifier is supported by a plane is normal behavior. It is
normal that a plane may not support certain modifiers. Failing the check
doesn't justify an error message in the kernel log and may mislead
users.

Demote the error message to drm_dbg_kms to only print the message if the
respective debug messages are enabled. This is similar to the behavior
in rockchip_drm_vop.c.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 583df4d22f7e..003c7c189132 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -469,8 +469,8 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 		return true;
 
 	if (!rockchip_afbc(plane, modifier)) {
-		drm_err(vop2->drm, "Unsupported format modifier 0x%llx\n",
-			modifier);
+		drm_dbg_kms(vop2->drm, "Unsupported format modifier 0x%llx\n",
+			    modifier);
 
 		return false;
 	}
-- 
2.39.2

