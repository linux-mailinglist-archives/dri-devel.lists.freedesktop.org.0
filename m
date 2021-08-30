Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ABB3FB4DD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 13:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1307689C88;
	Mon, 30 Aug 2021 11:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3F689C88
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 11:59:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25AD76112F;
 Mon, 30 Aug 2021 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630324784;
 bh=9kJQP3kDazEVJswsuuU6kyZ7aIsHLDddyN3en8ooMZA=;
 h=From:To:Cc:Subject:Date:From;
 b=rmGMSlgvbA+Q1BPAEGtA2vwm3iumlBSrPmC4GaprZybv0fWKKcJ4oXYq7NlnKkAD+
 QdM2E5AS+OSvVA7IF0DDjUrnNTRhVARj4nj3eEjVGN1hKpMz32Ab/EXWLaNa2pXGBp
 RHeaNMcVspeB+0e5olx22AJVSvPkW4i7Zl1vlEvKuiFLhwiSXg2qLv8Xj6Vr0D3wEe
 bi1q+pVNVojWDG/huxx4RkxhHOKeJ2Ufe2bdKJ1+EvtUXy8PK0Ee+0emuFaNZrcpbJ
 F+SVeK+XtMnCqERcGnsjQ7Scq20MeGXAPhbn0RpXELMbCXPyM2oVD14Sj09D2R7pyO
 KHas/R+f3fUOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.13 01/14] gpu: ipu-v3: Fix i.MX IPU-v3 offset
 calculations for (semi)planar U/V formats
Date: Mon, 30 Aug 2021 07:59:29 -0400
Message-Id: <20210830115942.1017300-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krzysztof Hałasa <khalasa@piap.pl>

[ Upstream commit 7cca7c8096e2c8a4149405438329b5035d0744f0 ]

Video captured in 1400x1050 resolution (bytesperline aka stride = 1408
bytes) is invalid. Fix it.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
Link: https://lore.kernel.org/r/m3y2bmq7a4.fsf@t19.piap.pl
[p.zabel@pengutronix.de: added "gpu: ipu-v3:" prefix to commit description]
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/ipu-v3/ipu-cpmem.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-cpmem.c b/drivers/gpu/ipu-v3/ipu-cpmem.c
index a1c85d1521f5..82b244cb313e 100644
--- a/drivers/gpu/ipu-v3/ipu-cpmem.c
+++ b/drivers/gpu/ipu-v3/ipu-cpmem.c
@@ -585,21 +585,21 @@ static const struct ipu_rgb def_bgra_16 = {
 	.bits_per_pixel = 16,
 };
 
-#define Y_OFFSET(pix, x, y)	((x) + pix->width * (y))
-#define U_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * ((y) / 2) / 2) + (x) / 2)
-#define V_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * pix->height / 4) +	\
-				 (pix->width * ((y) / 2) / 2) + (x) / 2)
-#define U2_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * (y) / 2) + (x) / 2)
-#define V2_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * pix->height / 2) +	\
-				 (pix->width * (y) / 2) + (x) / 2)
-#define UV_OFFSET(pix, x, y)	((pix->width * pix->height) +	\
-				 (pix->width * ((y) / 2)) + (x))
-#define UV2_OFFSET(pix, x, y)	((pix->width * pix->height) +	\
-				 (pix->width * y) + (x))
+#define Y_OFFSET(pix, x, y)	((x) + pix->bytesperline * (y))
+#define U_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * ((y) / 2) / 2) + (x) / 2)
+#define V_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * pix->height / 4) + \
+				 (pix->bytesperline * ((y) / 2) / 2) + (x) / 2)
+#define U2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * (y) / 2) + (x) / 2)
+#define V2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * pix->height / 2) + \
+				 (pix->bytesperline * (y) / 2) + (x) / 2)
+#define UV_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * ((y) / 2)) + (x))
+#define UV2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * y) + (x))
 
 #define NUM_ALPHA_CHANNELS	7
 
-- 
2.30.2

