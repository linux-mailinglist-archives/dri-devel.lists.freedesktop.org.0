Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100231C126
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059EB6E0DA;
	Mon, 15 Feb 2021 18:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1176 seconds by postgrey-1.36 at gabe;
 Mon, 15 Feb 2021 17:28:39 UTC
Received: from 8.mo68.mail-out.ovh.net (8.mo68.mail-out.ovh.net
 [46.105.74.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB8589FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:28:39 +0000 (UTC)
Received: from player798.ha.ovh.net (unknown [10.109.138.180])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 9764718998C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 18:09:00 +0100 (CET)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id F06BF1B2BA2CF;
 Mon, 15 Feb 2021 17:08:54 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0039a594b61-676e-43c5-8ca7-d80a602cbb63,
 C16AD3286F4283AA50684BE431D994343DAE27DC) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] vgacon: drop unused vga_init_done
Date: Mon, 15 Feb 2021 18:08:37 +0100
Message-Id: <20210215170837.1599706-1-steve@sk2.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12297923209508638069
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrieekgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucfuphgrmhfkphfpvghtfihorhhkpeekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-Mailman-Approved-At: Mon, 15 Feb 2021 18:08:42 +0000
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
Cc: Stephen Kitt <steve@sk2.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 973c096f6a85 ("vgacon: remove software scrollback support")
removed all uses of vga_init_done, so let's get rid of it entirely.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/video/console/vgacon.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 17876f0179b5..36bded9c9876 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -79,7 +79,6 @@ static struct uni_pagedir *vgacon_uni_pagedir;
 static int vgacon_refcount;
 
 /* Description of the hardware situation */
-static bool		vga_init_done;
 static unsigned long	vga_vram_base		__read_mostly;	/* Base of video memory */
 static unsigned long	vga_vram_end		__read_mostly;	/* End of video memory */
 static unsigned int	vga_vram_size		__read_mostly;	/* Size of video memory */
@@ -360,8 +359,6 @@ static const char *vgacon_startup(void)
 	vgacon_xres = screen_info.orig_video_cols * VGA_FONTWIDTH;
 	vgacon_yres = vga_scan_lines;
 
-	vga_init_done = true;
-
 	return display_desc;
 }
 

base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
