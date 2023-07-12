Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9476750398
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33CB10E3FB;
	Wed, 12 Jul 2023 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1910E3F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001Ka-BG; Wed, 12 Jul 2023 11:47:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4N-GG; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRA-004GSx-GE; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 17/52] drm/ingenic: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:27 +0200
Message-Id: <20230712094702.1770121-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fVTUqgHAcmzcuVCz5bRw0uX+k7eq5eY2YzfjG+/gqSM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZqjRNtKS71pbJN2uPA6SuCLgEMkV3Y4BtpH
 VyIYYY8r4mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52agAKCRCPgPtYfRL+
 Tkq1B/4mWs7VHAhD51eMIoa6yEn9RRGf4gFlT6PcH+eZ+nmR0X08LKYYG1advrod9AQLbPFfeaF
 l5JdWtNckrKhQjBhCiIOrYFDiB8ajbyFYE65B5hrbeet03YDNkKZq+VFYUIp+hRxEfiuZGMkZpn
 wogDOmHrU6JlnfnBr5fwZBApQnJ1Rm/I3lUMLPJN7r8JuKqvGzX0nUMJtuOEDikmNzzXUysBMBW
 vAnSddcE1TsUIlFtiEADBQ6gOWppa+a4bIJSftsbTtPydS+o+qgqQPV/dRoN3wH0p+kT3AIqUgq
 AwYWRCFhuwrSRplMaC+qguXJKT6Cr5zCBSVZBfbtYLvrJXMP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: kernel@pengutronix.de, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5ec75e9ba499..68b20991f60c 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -442,12 +442,12 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc_state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm_dev->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm_dev->event_lock);
 	}
 }
 
-- 
2.39.2

