Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EF7CB3A9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB8810E033;
	Mon, 16 Oct 2023 20:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3F10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:05:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D7F66114A;
 Mon, 16 Oct 2023 20:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C629CC433C7;
 Mon, 16 Oct 2023 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697486696;
 bh=+CKoakIKRn8tAacvsCSRM0rsr0ykK+jJR6uwcT1H03s=;
 h=From:To:Cc:Subject:Date:From;
 b=D1h/PEOWkFFhGEqvx5NqiK82gHeTCGUuSJfwks5MkWbwbnVN/mKglBBjVG/UHIvoS
 bqRgcaOcPoHaX36lDPsDBYKWGUHx+BLHKth43SR+8/HZBK536qNAVWUNRnMFfmBeR0
 G4pQ6zdHgkwse4tO9ZiGSJAq3eubliFJE+nD3eEMfS2wj1Q4sdKlYsVkCpBqG7nze5
 Ga8OAYDOjmzwh/8k01bTNCEWpoSTqACdKKWMmrejxvQhebsnz5NGebFKwR5QEojhgl
 9xZHX5iPtj+dHURWf7GWlGDOUz/BjgQvHadd81mhkY313PyS/ym0fs+tAg3pbd6FUZ
 XHyCLk+toyTAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: sa1100fb: mark sa1100fb_init() static
Date: Mon, 16 Oct 2023 22:04:40 +0200
Message-Id: <20231016200450.826502-1-arnd@kernel.org>
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
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This is a global function that is only referenced as an initcall. This causes
a warning:

drivers/video/fbdev/sa1100fb.c:1218:12: error: no previous prototype for 'sa1100fb_init' [-Werror=missing-prototypes]

Make it static instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/sa1100fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 63e12a7c1100e..e14eb634cb944 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -1215,7 +1215,7 @@ static struct platform_driver sa1100fb_driver = {
 	},
 };
 
-int __init sa1100fb_init(void)
+static int __init sa1100fb_init(void)
 {
 	if (fb_get_options("sa1100fb", NULL))
 		return -ENODEV;
-- 
2.39.2

