Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE23CCC4B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 04:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E8389E26;
	Mon, 19 Jul 2021 02:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A5B89E26
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 02:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ZtCcOaKTvtS9l/xs1TVQk4erPEkBsRk/M21z8hXpb7s=; b=S4EqwdsuFc7IC9+1JGs+SrY2zi
 EjbfjXj2cAEEYRiIGHYQTFmZMpSv+GbtNUqwhDYD7iybZav/yV8nxlGVFSB90+UvjVFCYOtoT6wqU
 DS/ezlTh1yvMAaK8v8ZCEofZeFxYztidg5aaIU2EnPIVPqKDm5GUmKJzNfUF8pYG89mqObvbs79FG
 ni0N0IPdS3oWU7pWwpTQpDF7Q4JPrxwy4e04a0+6N4rYHA3VQoWG3vw5tX6OxDpjQP1QE8U63J8xv
 DA7gcNTHrLAtWDIekebeEJ4sm3pVOAMrHkd5fG+31S4/snKZmWIMlJ0Mjq1CqlgDpYWGF8Qz7V5Tr
 BGdrMk0w==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5J5z-008HfG-RW; Mon, 19 Jul 2021 02:33:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: simplefb: limit its use to DRM_SIMPLEDRM=n
Date: Sun, 18 Jul 2021 19:33:27 -0700
Message-Id: <20210719023327.17039-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DRM_SIMPLEDRM=m, all of FB_CFB_{FILLRECT,COPYAREA,IMAGEBLIT} are =m,
causing undefined references in fbdev/simplefb.o.

By restricting FB_SIMPLEFB to be set only when DRM_SIMPLEDRM is not set,
the FB_CFB_* symbols are =y and the build completes without these
undefined references.

IOW, really "disable simplefb if simpledrm has been selected".

or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210716.orig/drivers/video/fbdev/Kconfig
+++ linux-next-20210716/drivers/video/fbdev/Kconfig
@@ -2192,7 +2192,7 @@ config FB_HYPERV
 
 config FB_SIMPLE
 	bool "Simple framebuffer support"
-	depends on (FB = y) && !DRM_SIMPLEDRM
+	depends on (FB = y) && DRM_SIMPLEDRM=n
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
