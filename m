Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3B369EA8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 05:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9B66E1A4;
	Sat, 24 Apr 2021 03:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1976E1A4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FxgtYpB8VTPXivQMswCaKcl2h1MJ9Tet6FGK833n5NE=; b=Kx/fI5NZ5bIK1dVhyPo+mBGltr
 oQMQY1mUnbLjxT7C00AYIxQFDEKd/Esxh0ppFj+DfF+fhl2cqT3aIt2Z2aLr4+QVy5EeonuptP7/P
 KQeyWyspBwzTB4Jm3jbI9FicQ6zP317djEflR9BXa9Cwg9PzLRrBUQRyPUejKdNVWoyg64YKPusmn
 BfY/O4i4PMP2sOe9vmhntVLdsrWCb8MKPsGk8l70c/mTDmZmQi7WWIH7EimrDjEpJ7ix1lsjWykIf
 IVATJ9ogrBFa4RNm9yo0gV3V+89DOhShRElsAeDxsbXmV09ebrKIle2BSqe/SUAcEX3HDgcMq2pU3
 0R28pf+g==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1la9Fe-002gjB-Ac; Sat, 24 Apr 2021 03:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm: rcar: unbreak the R-Car menu items
Date: Fri, 23 Apr 2021 20:46:32 -0700
Message-Id: <20210424034632.5531-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
symbols do not depend on DRM_RCAR_DU, the menu presentation is
broken for the following R-Car Kconfig symbols.

Use an if/endif block to make all of these symbols depend on
DRM_RCAR_DU (and remove the separate "depends on DRM_RCAR_DU").
This makes the kconfig menu presentation much cleaner.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2: use an if/endif block for the dependencies (thanks, Geert)
v3: still applicable -- update/rebase

Applies after today's earlier patch to fix undefined reference
build errors for R-Car (probably won't matter).

I did this patch one year ago and then forgot about it somehow.
Rediscovered & updated it today.

 drivers/gpu/drm/rcar-du/Kconfig |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20210423.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20210423/drivers/gpu/drm/rcar-du/Kconfig
@@ -14,10 +14,11 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+if DRM_RCAR_DU
+
 config DRM_RCAR_CMM
 	tristate "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM && OF
-	depends on DRM_RCAR_DU
 	help
 	  Enable support for R-Car Color Management Module (CMM).
 
@@ -41,7 +42,6 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
@@ -49,4 +49,5 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
-	depends on DRM_RCAR_DU
+
+endif # DRM_RCAR_DU
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
