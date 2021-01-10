Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108062F0DC3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C789B61;
	Mon, 11 Jan 2021 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs23.siol.net [185.57.226.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818CD897E7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 025435217B9;
 Sun, 10 Jan 2021 21:19:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id EZhK8rYayemS; Sun, 10 Jan 2021 21:19:57 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id B9256521749;
 Sun, 10 Jan 2021 21:19:57 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 4D9BF5212A4;
 Sun, 10 Jan 2021 21:19:55 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 1/3] drm/sun4i: csc: Rework DE3 CSC macros
Date: Sun, 10 Jan 2021 21:19:45 +0100
Message-Id: <20210110201947.3611649-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210110201947.3611649-1-jernej.skrabec@siol.net>
References: <20210110201947.3611649-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: jernej.skrabec@siol.net, irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework DE3 CSC macros to take just one coordinate instead of two. This
will make its usage easier in subsequent commit.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c   | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 781955dd4995..5c6ad643dae2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -194,7 +194,7 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 		return;
 	}
 
-	base_reg = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0, 0);
+	base_reg = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 	regmap_bulk_write(map, base_reg, table, 12);
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7576b523fdbb..145833a9d82d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -50,10 +50,8 @@
 #define SUN8I_MIXER_BLEND_CK_MIN(base, x)	((base) + 0xe0 + 0x04 * (x))
 #define SUN8I_MIXER_BLEND_OUTCTL(base)		((base) + 0xfc)
 #define SUN50I_MIXER_BLEND_CSC_CTL(base)	((base) + 0x100)
-#define SUN50I_MIXER_BLEND_CSC_COEFF(base, layer, x, y) \
-	((base) + 0x110 + (layer) * 0x30 +  (x) * 0x10 + 4 * (y))
-#define SUN50I_MIXER_BLEND_CSC_CONST(base, layer, i) \
-	((base) + 0x110 + (layer) * 0x30 +  (i) * 0x10 + 0x0c)
+#define SUN50I_MIXER_BLEND_CSC_COEFF(base, layer, x) \
+	((base) + 0x110 + (layer) * 0x30 +  (x) * 4)
 
 #define SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK	GENMASK(12, 8)
 #define SUN8I_MIXER_BLEND_PIPE_CTL_EN(pipe)	BIT(8 + pipe)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
