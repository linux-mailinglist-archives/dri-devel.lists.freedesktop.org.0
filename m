Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AC22DFEA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCA589F47;
	Sun, 26 Jul 2020 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jul 2020 20:45:07 UTC
Received: from mail.siol.net (mailoutvs26.siol.net [185.57.226.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B96E891
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 8E85452329B;
 Fri, 24 Jul 2020 22:36:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 1PUt-FPrhzhs; Fri, 24 Jul 2020 22:36:00 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 30B61523864;
 Fri, 24 Jul 2020 22:36:00 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 614D7523591;
 Fri, 24 Jul 2020 22:35:57 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH] drm/sun4i: mixer: Enable register value caching
Date: Fri, 24 Jul 2020 22:35:49 +0200
Message-Id: <20200724203549.35893-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was discovered in the past by Ondrej Jirman that mixer register read
may occasionally return wrong value, most likely zero. It turns out
that all mixer units are affected by this issue. This becomes especially
obvious with applications like video player. After a few minutes of a
playback visual glitches appeared but not always in the same way. After
register inspection it was clear that some bits are not set even when
they should be.

Best solution would be to shuffle the code a bit to avoid
read-modify-write operations and use only register writes. However,
quicker solution is to enable caching support in regmap which is also
used here. Such fix is also easier to backport in stable kernels.

Fixes: 9d75b8c0b999 ("drm/sun4i: add support for Allwinner DE2 mixers")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cc4fb916318f..f8f17c51c96d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -303,11 +303,23 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.layers_init	= sun8i_layers_init,
 };
 
+static bool sun8i_mixer_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SUN8I_MIXER_GLOBAL_STATUS:
+	case SUN8I_MIXER_GLOBAL_DBUFF:
+		return true;
+	}
+	return false;
+}
+
 static struct regmap_config sun8i_mixer_regmap_config = {
+	.cache_type	= REGCACHE_FLAT,
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xbfffc, /* guessed */
+	.volatile_reg	= sun8i_mixer_volatile_reg,
 };
 
 static int sun8i_mixer_of_get_id(struct device_node *node)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
