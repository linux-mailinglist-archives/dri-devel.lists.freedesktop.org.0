Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A8452DD7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092A6EE9D;
	Tue, 16 Nov 2021 09:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4996EE9D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:22:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A291561B27;
 Tue, 16 Nov 2021 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637054529;
 bh=yXXJ7ZYZdmMULFDotLIAJ3kbIk7CEz04rAyjIO+l1eY=;
 h=From:To:Cc:Subject:Date:From;
 b=pB4niVDsLcz4ei4hW3J6NtH9dck6Dhntvx0NEuxxkODTCGHU4dG70CdFCGvgqTXsc
 JFOEjbBHQyfGnm4xyEyUbmRDs9WTk2t+HTUwhQJB6BGlhBHc2w9027TnDZmQaYc0dp
 9Nh+Uj331Lbon78tvc5h8PIC4O7uOz15lNvuEj3Vp5gseHULZ3xgSqwQtgQPTQROc8
 /B9Sd4SzJBVLEQIyECXT99yh+d4f4BbJVnL8mVOZsTzKKHYxD9qni1btURec/culEi
 jrtyTibNsdvsE0nhScm42AEgGOearp4h/Wd+bWHx3E+BlR3kHYOhRJ+a5U/ZuQI/kB
 XImwcNDHy0vwA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org
Subject: [PATCH] omapfb: add one more "fallthrough" statement
Date: Tue, 16 Nov 2021 10:21:54 +0100
Message-Id: <20211116092204.4116587-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang warns about one missing fallthrough that gcc ignores:

drivers/video/fbdev/omap/omapfb_main.c:1558:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]

Add it here as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/omapfb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 3d090d2d9ed9..a6a8404d1462 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
 	case 1:
 		dev_set_drvdata(fbdev->dev, NULL);
 		kfree(fbdev);
+		fallthrough;
 	case 0:
 		/* nothing to free */
 		break;
-- 
2.29.2

