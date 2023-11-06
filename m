Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B67E2585
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD53A10E0D6;
	Mon,  6 Nov 2023 13:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63E10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:32:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A77F60E17;
 Mon,  6 Nov 2023 13:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F93C433C8;
 Mon,  6 Nov 2023 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699277577;
 bh=eY2ohnsARVYZplJWZoO8cQQDbf0Wbx1qZEOrowctVtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yZWLDJiVfQAkBopJJb7j5nOfMTNYo8a5fCB8uS+B1nSmDto5fdy8rwErFMrLhw34J
 60L4T4NXvNCGwZ+IbUlHC+IPUOOn3D9C6jAu5eelELezqwzj8qh6gR18q92r6ikXoV
 8SPwQmKZgap/ZfpkVekHzSuixHjaJPepkO8htUrA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.10 66/95] fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
Date: Mon,  6 Nov 2023 14:04:34 +0100
Message-ID: <20231106130307.131544559@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106130304.678610325@linuxfoundation.org>
References: <20231106130304.678610325@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 patches@lists.linux.dev, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit c1a8d1d0edb71dec15c9649cb56866c71c1ecd9e ]

ioremap_uc() is only meaningful on old x86-32 systems with the PAT
extension, and on ia64 with its slightly unconventional ioremap()
behavior, everywhere else this is the same as ioremap() anyway.

Change the only driver that still references ioremap_uc() to only do so
on x86-32/ia64 in order to allow removing that interface at some
point in the future for the other architectures.

On some architectures, ioremap_uc() just returns NULL, changing
the driver to call ioremap() means that they now have a chance
of working correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index c8feff0ee8da9..eb32ff0910d3e 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3440,11 +3440,15 @@ static int atyfb_setup_generic(struct pci_dev *pdev, struct fb_info *info,
 	}
 
 	info->fix.mmio_start = raddr;
+#if defined(__i386__) || defined(__ia64__)
 	/*
 	 * By using strong UC we force the MTRR to never have an
 	 * effect on the MMIO region on both non-PAT and PAT systems.
 	 */
 	par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
+#else
+	par->ati_regbase = ioremap(info->fix.mmio_start, 0x1000);
+#endif
 	if (par->ati_regbase == NULL)
 		return -ENOMEM;
 
-- 
2.42.0



