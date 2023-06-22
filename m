Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF873A658
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 18:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51A410E58B;
	Thu, 22 Jun 2023 16:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727710E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 16:45:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2CC8618BB;
 Thu, 22 Jun 2023 16:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C70C433C0;
 Thu, 22 Jun 2023 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687452338;
 bh=mPXln+DmOt1KklaFQd3MJkA1//mD28lDoq4prtu8Qoo=;
 h=Date:From:To:Cc:Subject:From;
 b=RVvLNYYIvAmGiq4BaiJ+/c8othvgt+IMGlJMhdFQy9LZVYJ2Xh3k64zYSQloMZJxq
 rQUpRTSch8lojQ25h/Zkqy36qoY2/cYl0Fe5skuKVC8TNUW4Bzdhv3qgCosnUssb4L
 AmrPOEMU57ueZ/pSZr8IBXKKv+rYNEx55PnTrKLtV+eihP/7kntUs/EF9RzRL5/Mv3
 Srf/2XvnQa8LObzVYlGc1ZQYan5qonEfQc7KNytrYp5PiFRZy0Z6LMmI1PbguFJpXm
 HpaTe9Kwwuo757fSU8ESd7Xlu+L93xv+Bh1KEmOc/7eCSt3RgcemqSqPGx0ppW+/J5
 expgtpPfn9WuQ==
Date: Thu, 22 Jun 2023 10:46:33 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH][next] fbdev: sh7760fb: Fix -Wimplicit-fallthrough warnings
Message-ID: <ZJR66f3UY0UFZJ01@work>
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
Cc: linux-fbdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following fallthrough warnings seen after building sh
architecture with sh7763rdp_defconfig configuration:

drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  138 |                 lgray = 1;
      |                 ~~~~~~^~~
drivers/video/fbdev/sh7760fb.c:139:9: note: here
  139 |         case LDDFR_4BPP:
      |         ^~~~
drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  143 |                 lgray = 1;
      |                 ~~~~~~^~~
drivers/video/fbdev/sh7760fb.c:144:9: note: here
  144 |         case LDDFR_8BPP:
      |         ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/video/fbdev/sh7760fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index 768011bdb430..98c5227098a8 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -136,11 +136,13 @@ static int sh7760fb_get_color_info(struct device *dev,
 		break;
 	case LDDFR_4BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_4BPP:
 		lbpp = 4;
 		break;
 	case LDDFR_6BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_8BPP:
 		lbpp = 8;
 		break;
-- 
2.34.1

