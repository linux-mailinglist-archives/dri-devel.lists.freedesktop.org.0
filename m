Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7677B0D8E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0974F10E5A9;
	Wed, 27 Sep 2023 20:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528F10E4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 10:45:06 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id 6DD891867E3A;
 Wed, 27 Sep 2023 13:45:03 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id nNZF-6neTcXu; Wed, 27 Sep 2023 13:45:03 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.astralinux.ru (Postfix) with ESMTP id DB4EF1867DA8;
 Wed, 27 Sep 2023 13:45:02 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
 by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id K11eK_b7uODQ; Wed, 27 Sep 2023 13:45:02 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.236.148])
 by mail.astralinux.ru (Postfix) with ESMTPSA id 3AC741867E3A;
 Wed, 27 Sep 2023 13:45:01 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] drm: rcar-du: turn rcar_du_group_get() into void and
 remove its return value check
Date: Wed, 27 Sep 2023 13:44:38 +0300
Message-Id: <20230927104438.30628-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <169383224922.277971.15400887308406098634@ping.linuxembedded.co.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Sep 2023 20:45:53 +0000
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
v2: rcar_du_group_get() is turned into void and its return=20
value check is removed in rcar_du_crtc_get()
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c  | 6 +-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 5 +----
 2 files changed, 2 insertions(+), 9 deletions(-)

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
--=20
2.30.2

