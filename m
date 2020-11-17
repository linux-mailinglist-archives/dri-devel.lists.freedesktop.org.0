Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E42B6933
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 16:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B63289CB3;
	Tue, 17 Nov 2020 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Tue, 17 Nov 2020 15:59:37 UTC
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
 [139.15.180.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1DF89CB3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 15:59:37 +0000 (UTC)
Received: from de-out1.bosch-org.com
 (snat-lb41g3-dmz-psi-sl1-maildeferred.fe.ssn.bosch.com [139.15.180.215])
 by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 4Cb9T537wXz8r3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 16:53:13 +0100 (CET)
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 4Cb9T31LNMz1XLV7L;
 Tue, 17 Nov 2020 16:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key2-intmail; t=1605628391;
 bh=zDqtHDV+ivhKpQnY1nJip3xTSwLuqCaHQ5GfXtNk3nw=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=OUzJh/8ZjVucfFJIcjJwdqquvm+xLmiiUeU0lkt99H2/DHrQZL6MXa/XSW8IhjfQE
 1Y8igW0vV3G/LJobMbXljEj63YNPc1ve80AUTGC1j/mcvKU88tOp/fcE4VUln2FYeB
 n8WYq0Is/ko7nLHtE6udiOkjd5kLqtKMFkznj3uA=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4Cb9T30hzQz9wl;
 Tue, 17 Nov 2020 16:53:11 +0100 (CET)
X-AuditID: 0a3aad12-24bff700000028b1-5e-5fb3f1e74ea7
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id 8E.D0.10417.7E1F3BF5;
 Tue, 17 Nov 2020 16:53:11 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 4Cb9T26w5pzvlD;
 Tue, 17 Nov 2020 16:53:10 +0100 (CET)
Received: from ninja.grb-fir.grb.de.bosch.com (10.19.187.97) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.2106.2; Tue, 17 Nov 2020 16:53:10 +0100
From: Mark Jonas <mark.jonas@de.bosch.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] drm: imx: Move fbdev setup to before output polling
Date: Tue, 17 Nov 2020 16:52:29 +0100
Message-ID: <20201117155229.9837-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsXCZbVWVvf5x83xBucuMln0njvJZPF/20Rm
 iytf37NZPLzqb7Fq6k4Wi02Pr7FadP1ayWxxedccNou7906wWPzdvonF4sUWcQduj73fFrB4
 7Jx1l91j06pONo/t3x6wetzvPs7ksXlJvcfGdzuYPPr/Gnh83iQXwBnFZZOSmpNZllqkb5fA
 lTHn7Ru2gt+8FeuuTWdvYDzE3cXIySEhYCKxp3sXWxcjF4eQwHQmiZXnn7FDOLsZJW6f6mKF
 cLYySpw8cZIZpIVNQEvi5okdzCAJEYE7jBJvPu0Hq2IWmMok0bPwGliVsICLxKH2B2A2i4Cq
 xJodn9lAbF4Ba4mny14xQSyXl1i94QAzRFxQ4uTMJywgNrOAhMTBFy+YJzDyzkKSmoUktYCR
 aRWjaHGmQVmuiZmJkV5RUmpxlYGhXnJ+7iZGSFAL7WD81fFB7xAjEwfjIUYJDmYlEV4Xk43x
 QrwpiZVVqUX58UWlOanFhxilOViUxHlVeDbGCQmkJ5akZqemFqQWwWSZODilGpgi/jqnvBR8
 8frrUl7m1RPXL/V7w+pxWTn17letF2q8qrm/HyW9X56e6Mhdt97vntT0mW9VdEvvnjzTnXbe
 LvxYwMLvrlv01dT6b1kpyLBJ6O/LjZ59P4+pQClZf40gg79rX2yPdvH8S22y549P3iWs7dS2
 PCTUsPwKO39Y5r2rThks7J+btn6qWya+Za7CwqApoW7zK+RfrUt7Np1lWnXoxs96tou4C189
 uHfXYsnPlgnre/4G7jvN83/31atW0zeukLp+kY1hx7Sf9fNOKiXdOFbyKIRda9ndSy9+1934
 sHnly8erF6zJ6qzy06gTCOHi1Y/5eG7joUtHxY9cDUk4ObFfe/mNecclH+sYGJ0IVWIpzkg0
 1GIuKk4EAEMZO23ZAgAA
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
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mark Jonas <mark.jonas@de.bosch.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Ruan <tingquan.ruan@cn.bosch.com>

The generic fbdev has to be setup before enabling output polling.
Otherwise the fbdev client is not ready to handle delayed events.

Since f53705fd, the generic fbdev is setup after the output polling
init. During fbdev setup, when fbdev probes attached outputs and a
status changes from unknown to connected, the delayed event is
marked and the output_poll_work thread is scheduled without delay.
If output_poll_execute() is runs immediately, the delayed event
is handled without actually polling the output because the fbdev is not
registered yet. So the delayed event is lost. This leads to a dark
screen until a KMS application (or fbcon) sets the screen mode.

This patch fixes the issue by moving the setup of generic fbdev before
initializing and enabling output polling.

Signed-off-by: Leo Ruan <tingquan.ruan@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 9bf5ad6d18a2..2665040e11c7 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -240,14 +240,18 @@ static int imx_drm_bind(struct device *dev)
 		legacyfb_depth = 16;
 	}
 
+	/*
+	 * The generic fbdev has to be setup before enabling output polling.
+	 * Otherwise the fbdev client is not ready to handle delayed events.
+	 */
+	drm_fbdev_generic_setup(drm, legacyfb_depth);
+
 	drm_kms_helper_poll_init(drm);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_poll_fini;
 
-	drm_fbdev_generic_setup(drm, legacyfb_depth);
-
 	return 0;
 
 err_poll_fini:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
