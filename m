Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC517CD98
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621746E1B5;
	Sat,  7 Mar 2020 10:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DD16E4C7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hSdov4oi/jmTS3gMc77LB7lCDvmj8soE+O2v7sGdzgU=; b=WZbyVHEZAa5iQcFPRnUw+O7SCN
 1j62sYTJ/mr1vD7eotrt15t3kxZ7rMwE5J4vCxl8EQhpy0da+qVLFSWyerUlnN7wp+e9a/vzSIR0W
 ETEa6GQn0qy0mU7AOm5f+vio18C0pbnahsrLMcozaSks49HyM+M+KO9Z7Xnd+AMnbc0E8CagFiUA2
 mU9kfJbTl7r3rnZZsgmDvdDmxy9h/IjfYWonUPc04sIVUr2lzxjNmuPYZYUo0efxYWcY82bbnPaAs
 0d3uCiIjtXbwVpHC0d++rKIeThZNSHR96ytJ5vjaZ4ztsAoiVFx5vV4xmzrsgIj9kxgo3uwcVW1qP
 1VVtpp2Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAGYw-0006fe-Ko; Fri, 06 Mar 2020 17:15:02 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU
Message-ID: <d5ecfccc-c7c8-4157-4d59-22b726fc0084@infradead.org>
Date: Fri, 6 Mar 2020 09:15:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
symbols do not depend on DRM_RCAR_DU, the menu presentation is
broken for these and following non-R-Car Kconfig symbols.

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

 drivers/gpu/drm/rcar-du/Kconfig |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
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
 
@@ -40,7 +41,6 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
@@ -48,3 +48,5 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+
+endif # DRM_RCAR_DU

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
