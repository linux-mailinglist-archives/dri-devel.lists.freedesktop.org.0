Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDEB39CFE6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 17:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4E6E0B8;
	Sun,  6 Jun 2021 15:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0D656E0B8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 15:54:01 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d04 with ME
 id DrmV2500P21Fzsu03rmVAo; Sun, 06 Jun 2021 17:46:30 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Jun 2021 17:46:30 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: spock@gentoo.org,
	adaplas@gmail.com,
	akpm@linux-foundation.org
Subject: [PATCH] video: fbdev: uvesafb: Fixes an error handling path in
 'uvesafb_probe()'
Date: Sun,  6 Jun 2021 17:46:28 +0200
Message-Id: <dd2a4806d3a570ab84947806f38a494454fd0245.1622994310.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an error occurs after a successful 'uvesafb_init_mtrr()' call, it must
be undone by a corresponding 'arch_phys_wc_del()' call, as already done in
the remove function.

This has been added in the remove function in commit 63e28a7a5ffc
("uvesafb: Clean up MTRR code")

Fixes: 8bdb3a2d7df4 ("uvesafb: the driver core")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Unsure about the Fixes tag, maybe it is 63e28a7a5ffc
---
 drivers/video/fbdev/uvesafb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 4df6772802d7..a7e606520dfc 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1757,6 +1757,7 @@ static int uvesafb_probe(struct platform_device *dev)
 
 out_unmap:
 	iounmap(info->screen_base);
+	arch_phys_wc_del(par->mtrr_handle);
 out_mem:
 	release_mem_region(info->fix.smem_start, info->fix.smem_len);
 out_reg:
-- 
2.30.2

