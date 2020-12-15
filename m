Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60C2DB524
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 21:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F9C89C8F;
	Tue, 15 Dec 2020 20:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BAE89C8F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 20:31:40 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6AAB13C7;
 Tue, 15 Dec 2020 21:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608064298;
 bh=zQoI0CCyjClaii7cuYKjg+BvltdcQobuaAC8Ar015PM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/cwAfvblMv8tCq1Tf3eqOR3SeuDP5AnFOlhyWHpo+HgbMQlkeCj4n+Bwc88CWaGI
 FUBU2s4QJCsC/wpUKSF63u2S2BtEKf+81/mRDAdfzeHN1rS91r7h/z9rgCAnDThwIe
 c9ez8qgS1DM3BcjrrTGlxJXmghbTbqB7fJf0dKiE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm: Constify drm_driver in drivers that don't modify
 it
Date: Tue, 15 Dec 2020 22:31:26 +0200
Message-Id: <20201215203126.10175-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Edmund Dea <edmund.j.dea@intel.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A non-const structure containing function pointers is a possible attack
vector. The drm_driver structure is already const in most drivers, but
there are a few exceptions. Constify the structure in the drivers that
don't need to modify at, as a low-hanging fruit. The rest of the drivers
will need a more complex fix.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 2 +-
 drivers/gpu/drm/kmb/kmb_drv.c    | 2 +-
 drivers/gpu/drm/tdfx/tdfx_drv.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index f164818ec477..077d006b1fbf 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -145,7 +145,7 @@ static void arcpgu_debugfs_init(struct drm_minor *minor)
 }
 #endif
 
-static struct drm_driver arcpgu_drm_driver = {
+static const struct drm_driver arcpgu_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name = "arcpgu",
 	.desc = "ARC PGU Controller",
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index a31a840ce634..3c49668ec946 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -400,7 +400,7 @@ static void kmb_irq_reset(struct drm_device *drm)
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
-static struct drm_driver kmb_driver = {
+static const struct drm_driver kmb_driver = {
 	.driver_features = DRIVER_GEM |
 	    DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler = kmb_isr,
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index ab699bf0ac5c..58c185c299f4 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -56,7 +56,7 @@ static const struct file_operations tdfx_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-static struct drm_driver driver = {
+static const struct drm_driver driver = {
 	.driver_features = DRIVER_LEGACY,
 	.fops = &tdfx_driver_fops,
 	.name = DRIVER_NAME,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
