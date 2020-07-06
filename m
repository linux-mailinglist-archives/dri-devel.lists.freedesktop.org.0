Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582B216768
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA76E5C1;
	Tue,  7 Jul 2020 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDDC489FEA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 15:53:39 +0000 (UTC)
Received: from home.intra.ispras.ru (unknown [10.10.165.12])
 by smtp.ispras.ru (Postfix) with ESMTP id 90086203BF;
 Mon,  6 Jul 2020 18:53:36 +0300 (MSK)
From: Evgeny Novikov <novikov@ispras.ru>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] fbdev: sm712fb: set error code in probe
Date: Mon,  6 Jul 2020 18:53:28 +0300
Message-Id: <20200706155328.8396-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: ldv-project@linuxtesting.org, linux-fbdev@vger.kernel.org,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Evgeny Novikov <novikov@ispras.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If smtcfb_pci_probe() does not detect a valid chip it cleans up
everything and returns 0. This can result in various bad things later.
The patch sets the error code on the corresponding path.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/video/fbdev/sm712fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 6a1b4a853d9e..fbe97340b8e0 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1614,7 +1614,7 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
 	default:
 		dev_err(&pdev->dev,
 			"No valid Silicon Motion display chip was detected!\n");
-
+		err = -ENODEV;
 		goto failed_fb;
 	}
 
-- 
2.16.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
