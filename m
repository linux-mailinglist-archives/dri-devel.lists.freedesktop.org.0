Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91BC7B4CAD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DE910E217;
	Mon,  2 Oct 2023 07:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0F10E061
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:29:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id 6181F18651E1;
 Mon,  2 Oct 2023 10:29:57 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id MhpPlMfsexIS; Mon,  2 Oct 2023 10:29:56 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id CEFB51862F42;
 Mon,  2 Oct 2023 10:29:56 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id AGFD1h-Y19PO; Mon,  2 Oct 2023 10:29:56 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.254])
 by mail.astralinux.ru (Postfix) with ESMTPSA id CF8D41863156;
 Mon,  2 Oct 2023 10:29:54 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] drm: rcar-du: turn rcar_du_group_get() into void and
 remove its return value check
Date: Mon,  2 Oct 2023 10:29:17 +0300
Message-Id: <20231002072917.22194-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230930145032.GD31829@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Oct 2023 07:39:30 +0000
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rcar_du_group_get() never returns a negative
error code (always returns 0), so change the comment
about returned value, turn function into void (return
code of rcar_du_group_get has been redundant for a
long time, so perhaps it's just not required) and
remove redundant error path handling in rcar_du_crtc_get()

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 0bb63534fdf3 ("drm: rcar-du: Perform the initial CRTC setup from r=
car_du_crtc_get()")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
v3: fix build errors
v2: rcar_du_group_get() is turned into void and its return=20
value check is removed in rcar_du_crtc_get()
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c  | 6 +-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 5 +----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu=
/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..2be7c6e64d72 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -565,17 +565,13 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rc=
rtc)
 	if (ret < 0)
 		goto error_clock;
=20
-	ret =3D rcar_du_group_get(rcrtc->group);
-	if (ret < 0)
-		goto error_group;
+	rcar_du_group_get(rcrtc->group);
=20
 	rcar_du_crtc_setup(rcrtc);
 	rcrtc->initialized =3D true;
=20
 	return 0;
=20
-error_group:
-	clk_disable_unprepare(rcrtc->extclock);
 error_clock:
 	clk_disable_unprepare(rcrtc->clock);
 	return ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..7113025dabff 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -199,10 +199,8 @@ static void rcar_du_group_setup(struct rcar_du_group=
 *rgrp)
  * before accessing any hardware registers.
  *
  * This function must be called with the DRM mode_config lock held.
- *
- * Return 0 in case of success or a negative error code otherwise.
  */
-int rcar_du_group_get(struct rcar_du_group *rgrp)
+void rcar_du_group_get(struct rcar_du_group *rgrp)
 {
 	if (rgrp->use_count)
 		goto done;
@@ -211,7 +209,6 @@ int rcar_du_group_get(struct rcar_du_group *rgrp)
=20
 done:
 	rgrp->use_count++;
-	return 0;
 }
=20
 /*
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.h
index 55649ad86a10..5330dc4ce64a 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.h
@@ -54,7 +54,7 @@ struct rcar_du_group {
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
=20
-int rcar_du_group_get(struct rcar_du_group *rgrp);
+void rcar_du_group_get(struct rcar_du_group *rgrp);
 void rcar_du_group_put(struct rcar_du_group *rgrp);
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
 void rcar_du_group_restart(struct rcar_du_group *rgrp);
--=20
2.30.2

