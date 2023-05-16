Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACA7058B1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 22:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0071C10E36F;
	Tue, 16 May 2023 20:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817E10E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 20:23:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0452363E3E;
 Tue, 16 May 2023 20:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3A0C433D2;
 Tue, 16 May 2023 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684268582;
 bh=vu4a3gAHkMYhle534u5kDDmaO/1lqkSTmEK0D8hdHso=;
 h=From:To:Cc:Subject:Date:From;
 b=cwo1OJz8+bzgn+B6EVYFTVNxTDuaILqVkdK9VNMKQ17oBUNtzfNuoF93fXEVjbTwr
 QFzPXlDI47QPkfuAq6iyHfttrXJNKNpiLS5/HGlWjyRwiukjA6amzfFR/ZirO0Ng8m
 VNtCp9Bn6fT3O/vWjJFjCJxrQOwUPctzljgO785qtizvUqhJ7i4lpMj19Dbmfm/kXD
 xhr/LHlfeXcYprpMVuZhhhV4dM598ttOzZbKUzpXBbCWaFbJHOeCaqph0bNe5DlLae
 yduGJoReJzn8PAr1suyOBnle5RhsIXjgXuC87fGWWegVG+9cQwC9ehU9szw0eZcsQ2
 hXW6SPdUPHN1A==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
Date: Tue, 16 May 2023 22:22:48 +0200
Message-Id: <20230516202257.559952-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There is a global function with this name on sparc, but no
global declaration:

drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype for 'get_fb_unmapped_area'

Make the generic definition static to avoid this warning. On
sparc, this is never seen.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index e808dc86001c..28739f1cb5e7 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1468,7 +1468,7 @@ __releases(&info->lock)
 }
 
 #if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFIG_MMU)
-unsigned long get_fb_unmapped_area(struct file *filp,
+static unsigned long get_fb_unmapped_area(struct file *filp,
 				   unsigned long addr, unsigned long len,
 				   unsigned long pgoff, unsigned long flags)
 {
-- 
2.39.2

