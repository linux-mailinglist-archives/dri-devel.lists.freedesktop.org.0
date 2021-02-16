Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108531D17D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 21:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317B58923C;
	Tue, 16 Feb 2021 20:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E28923C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 20:23:02 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id C6s3lYbQ2lChfC6s8ldxSs; Tue, 16 Feb 2021 21:23:01 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2014;
 t=1613506981; bh=E6mT1eLy2BbvLR20EYpVVGUzTe4X8rj8sSx2cY7U1BQ=;
 h=From;
 b=R0p+YkvSKiJb69sWwvh/538Jj5YMnNJeEzMGYhyTKSk9qkGza9NS83I0aVxcSDvc4
 vgpyOqM54OkbC685W6L/z7X3no5dx9LTzvPHutuCnbR9aGAaVwwEL5FrBYBbAR1AZx
 9HdeErD3VcyOP79FzADRW17gW7FxzA0hfPXdsWBkfSM9E5wdhbXaLKXo+zL+hHwpu2
 TL8ossOCOVPii3CeRCJHAxkapQZEPmFupYDhE+dyhCcPsbOuX6f/IJuRe3KOOtCpjE
 Y8/sYDG5nIw/wwyFLsbI7sm/0BG5MhL8mPfUpY6rObP2IeFmm/59aAejggecV527wg
 LK/MoIleWQGvQ==
X-CNFS-Analysis: v=2.4 cv=S6McfKgP c=1 sm=1 tr=0 ts=602c29a5 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=toUk0IfjeMrTqMqL6ioA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/tilcdc: fix raster control register setting
Date: Tue, 16 Feb 2021 21:22:25 +0100
Message-Id: <20210216202225.12861-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfN2H0V+jFPpOEwOIINj7kCHNlbmpcTscidCmgWRHfxmf1Mt6v6HmETHBNVuGkDrV9m31GyCnUS2ee3To+J/nJjhwX+yOFKzbNE/Wp69NtBgl0/u43DD/
 STXeLVds16KSqdvw34IRGbcRlVfeRirszrDSKDAcNIiVPuoZcUUQy4HKthJq8X4MHzogCFAmEZsa2nyjOYBKow3InfWVyktXeebVc8H4/2w7ak+THVw28Qjv
 rIBnYAGuSM95lHZBI9wA78ymzpdCW8mZPWmQVkbXdZDfz9Vtm6k7Wf9mgtIMQJRA9atrhDzWJLmfPpd/mNpgmIBWrmRxrOChXS8uzEIRqwF3ab0fzqyxLzhp
 9wxQXF7YCz5xFlwbnS20EqLh+EfBrB3m1m/K4VJaOXP6c3VAd/UmPdRvvrQLihFSfxFc6xWqG8KtucW77CN0qelHTij28A==
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
Cc: David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fdd property of the tilcdc_panel_info structure must set the reqdly
bit field  (bit 12 to 19) of the raster control register. The previous
statement set the least significant bit instead.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 30213708fc99..238068e28729 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -393,7 +393,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 			return;
 		}
 	}
-	reg |= info->fdd < 12;
+	reg |= info->fdd << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
 	if (info->invert_pxl_clk)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
