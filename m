Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423B4FB016
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 22:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D988F10E8F6;
	Sun, 10 Apr 2022 20:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2834910E8F6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 20:29:00 +0000 (UTC)
Received: from gsql.ggedos.sk (off-20.infotel.telecom.sk [212.5.213.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 1FE647A0189;
 Sun, 10 Apr 2022 22:28:59 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: i740fb: use memset_io() to clear screen
Date: Sun, 10 Apr 2022 22:28:33 +0200
Message-Id: <20220410202833.26608-1-linux@zary.sk>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse complains that using memset() on __iomem pointer is wrong:
incorrect type in argument 1 (different address spaces)

Use memset_io() to clear screen instead.

Tested on real i740 cards.

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
 drivers/video/fbdev/i740fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 52cce0db8bd3..dd45ea8203be 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -740,7 +740,7 @@ static int i740fb_set_par(struct fb_info *info)
 	if (i)
 		return i;
 
-	memset(info->screen_base, 0, info->screen_size);
+	memset_io(info->screen_base, 0, info->screen_size);
 
 	vga_protect(par);
 
-- 
Ondrej Zary

