Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B958F248101
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 10:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785FC89B29;
	Tue, 18 Aug 2020 08:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4082892D7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:56:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28929AC48;
 Tue, 18 Aug 2020 08:57:22 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH 2/8] newport_con: fix no return statement in newport_show_logo
Date: Tue, 18 Aug 2020 10:56:49 +0200
Message-Id: <20200818085655.12071-2-jslaby@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818085655.12071-1-jslaby@suse.cz>
References: <20200818085655.12071-1-jslaby@suse.cz>
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

When CONFIG_LOGO_SGI_CLUT224 is unset, newport_show_logo contains no
return, despite it should return a pointer. Add one returning NULL to
fix a compiler warning:
   drivers/video/console/newport_con.c: In function 'newport_show_logo':
   drivers/video/console/newport_con.c:132:1: warning: no return statement in function returning non-void

Note that the caller expects NULL from the function already.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/video/console/newport_con.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 72f146d047d9..4d9110393479 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -131,6 +131,8 @@ static const struct linux_logo *newport_show_logo(void)
 		npregs->go.hostrw0 = *data++ << 24;
 
 	return logo;
+#else
+	return NULL;
 #endif /* CONFIG_LOGO_SGI_CLUT224 */
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
