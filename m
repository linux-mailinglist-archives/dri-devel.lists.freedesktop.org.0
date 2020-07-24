Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D922BE14
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 08:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875586E4A2;
	Fri, 24 Jul 2020 06:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DC36E4A2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:27:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54606AC20;
 Fri, 24 Jul 2020 06:27:44 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH] newport_con: vc_color is now in state
Date: Fri, 24 Jul 2020 08:27:35 +0200
Message-Id: <20200724062735.18229-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202007241318.wXYkumEO%lkp@intel.com>
References: <202007241318.wXYkumEO%lkp@intel.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as
vc->state.color. Somehow both me and 0-day bot missed this driver during
the conversion.

So fix the driver now.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/video/console/newport_con.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index df3c52d72159..72f146d047d9 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -362,12 +362,12 @@ static void newport_clear(struct vc_data *vc, int sy, int sx, int height,
 
 	if (ystart < yend) {
 		newport_clear_screen(sx << 3, ystart, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	} else {
 		newport_clear_screen(sx << 3, ystart, xend, 1023,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 		newport_clear_screen(sx << 3, 0, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	}
 }
 
@@ -591,11 +591,11 @@ static bool newport_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 			topscan = (topscan + (lines << 4)) & 0x3ff;
 			newport_clear_lines(vc->vc_rows - lines,
 					    vc->vc_rows - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		} else {
 			topscan = (topscan + (-lines << 4)) & 0x3ff;
 			newport_clear_lines(0, lines - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		}
 		npregs->cset.topscan = (topscan - 1) & 0x3ff;
 		return false;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
