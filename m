Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FE25A612
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1CC6E903;
	Wed,  2 Sep 2020 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs5.siol.net [185.57.226.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185266E0BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id F0B71526784;
 Tue,  1 Sep 2020 23:58:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id vxLCUTGcJHyJ; Tue,  1 Sep 2020 23:58:34 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id A06835267B9;
 Tue,  1 Sep 2020 23:58:34 +0200 (CEST)
Received: from kista.localdomain (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id C97F0526784;
 Tue,  1 Sep 2020 23:58:33 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH] drm/sun4i: Fix DE2 YVU handling
Date: Wed,  2 Sep 2020 00:03:05 +0200
Message-Id: <20200901220305.6809-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function sun8i_vi_layer_get_csc_mode() is supposed to return CSC mode
but due to inproper return type (bool instead of u32) it returns just 0
or 1. Colors are wrong for YVU formats because of that.

Fixes: daab3d0e8e2b ("drm/sun4i: de2: csc_mode in de2 format struct is mostly redundant")
Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 22c8c5375d0d..c0147af6a840 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -211,7 +211,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
-static bool sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
+static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
 {
 	if (!format->is_yuv)
 		return SUN8I_CSC_MODE_OFF;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
