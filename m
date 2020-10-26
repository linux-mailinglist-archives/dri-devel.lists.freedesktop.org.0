Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31029972E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 20:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449AF6E038;
	Mon, 26 Oct 2020 19:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731406E038
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 19:40:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D57220760;
 Mon, 26 Oct 2020 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603741222;
 bh=nGR/itPh0jz6AbVxRkpFGc/DrAZq4nbxrqWJE5Gzyb0=;
 h=From:To:Cc:Subject:Date:From;
 b=0IfrEwAww116p9n62jgFdrxDrcJfSr3FN0QwP3khTPqJkzGE3ME/FMtgQOPBQBS2T
 spYjXpTIVLHz1Em0QaHed7uYCzl8seSsArlUP18ei/XuCj1thrBV+1bKq+vodby961
 TMzcY/KXq/xW7pUD3f0WY5q6Mzb7D4NaoFK+T354=
From: Arnd Bergmann <arnd@kernel.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] matroxfb: avoid -Warray-bounds warning
Date: Mon, 26 Oct 2020 20:39:55 +0100
Message-Id: <20201026194010.3817166-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The open-coded list_for_each_entry() causes a harmless warning:

drivers/video/fbdev/matrox/matroxfb_base.c: In function 'matroxfb_register_driver':
include/linux/kernel.h:856:3: warning: array subscript -98 is outside array bounds of 'struct list_head[1]' [-Warray-bounds]

Use the normal list_for_each_entry instead.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/matrox/matroxfb_base.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 570439b32655..a3853421b263 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -1970,9 +1970,7 @@ int matroxfb_register_driver(struct matroxfb_driver* drv) {
 	struct matrox_fb_info* minfo;
 
 	list_add(&drv->node, &matroxfb_driver_list);
-	for (minfo = matroxfb_l(matroxfb_list.next);
-	     minfo != matroxfb_l(&matroxfb_list);
-	     minfo = matroxfb_l(minfo->next_fb.next)) {
+	list_for_each_entry(minfo, &matroxfb_list, next_fb) {
 		void* p;
 
 		if (minfo->drivers_count == MATROXFB_MAX_FB_DRIVERS)
@@ -1990,9 +1988,7 @@ void matroxfb_unregister_driver(struct matroxfb_driver* drv) {
 	struct matrox_fb_info* minfo;
 
 	list_del(&drv->node);
-	for (minfo = matroxfb_l(matroxfb_list.next);
-	     minfo != matroxfb_l(&matroxfb_list);
-	     minfo = matroxfb_l(minfo->next_fb.next)) {
+	list_for_each_entry(minfo, &matroxfb_list, next_fb) {
 		int i;
 
 		for (i = 0; i < minfo->drivers_count; ) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
