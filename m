Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849442DF8F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 18:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA9C6E18E;
	Thu, 14 Oct 2021 16:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549D36E18E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 16:48:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BDD6109E;
 Thu, 14 Oct 2021 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634230136;
 bh=/Hf0VjXN6iyYy6YK32OUC6tMBg1hQi/SYJ14SKE5H/4=;
 h=Date:From:To:Subject:From;
 b=ooCImsbvs+VtpH8EU0ZNPxgl6dfPCRirRShNowMC4TH6HA74C7k0jmazO2lO0D4FB
 riKUsg+P3Tw825Db06ypvOYMi00tW/xFnJFc1Obfqp53qI/qhjkBm0iH1StR785T00
 oaQBtBpMgElQP7UP/dEG34IdcqgEH2An1K1HBjaKzzEHlSOldL0drDzqeQbGIb0JFT
 C4AR2wXM5KPbcEDc2IIG89gllO6wPZ9p81Ij4MOL+dzXfL2IzEJSTZYkT2hj+5hiff
 mNAy8+H+ftORN/K2uJcBivQsPuJWRzOK2Fe/JpABAoSmBWQP27zTM4XHmO6m5pK03I
 G79ZH9vfz96dg==
Date: Thu, 14 Oct 2021 11:53:20 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Cc:  linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org;
Subject: [PATCH] video: omapfb: Fix fall-through warning for Clang
Message-ID: <20211014165320.GA1145571@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following fallthrough warnings:

drivers/video/fbdev/omap/omapfb_main.c:1558:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case 0:
           ^
   drivers/video/fbdev/omap/omapfb_main.c:1558:2: note: insert 'break;' to avoid fall-through
           case 0:
           ^
           break;
   1 warning generated.

This helps with the ongoing efforts to globally enable
-Wimplicit-fallthrough for Clang.

Link: https://github.com/KSPP/linux/issues/115
Link: https://lore.kernel.org/lkml/202110141005.hUjaYMEi-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 3d090d2d9ed9..b495c09e6102 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
 	case 1:
 		dev_set_drvdata(fbdev->dev, NULL);
 		kfree(fbdev);
+		break;
 	case 0:
 		/* nothing to free */
 		break;
-- 
2.27.0

