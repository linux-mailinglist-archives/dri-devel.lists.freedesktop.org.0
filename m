Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EF31B088
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 14:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ED86E02B;
	Sun, 14 Feb 2021 13:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Sun, 14 Feb 2021 13:25:31 UTC
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1176E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 13:25:31 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id BHGzlGzOglChfBHH2lSOc0; Sun, 14 Feb 2021 14:17:18 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2014;
 t=1613308638; bh=E6mT1eLy2BbvLR20EYpVVGUzTe4X8rj8sSx2cY7U1BQ=;
 h=From;
 b=ZpAmYi+IKCWgHyj28z6lIn5HVGK9sxHytuyDiudYb43ITPihegRI1MRIRM6maa9Bh
 G6HjbgVTEtUX72n0XTVEBXRZ/igelUyzADGaKGFzKaylFr0ODvv6A0krtp4Rgacwnq
 uByYETt7a33t3e7vMhI7xZw0hIrlHOdK4iFh9pvzrdw4GXJIsKGxxydJ0DAVOnOQAZ
 +/NxqqeprMWMoGHI1Z07AySxQ6bhRbbzqik2lClJYBbaaI3pVjWjG6SxzquyfydkPV
 QI63zqXI/JhAAAF2ZJQFmwRup+B+WSEQizn7CO92CkDsF1H5GOQb9Uy//62GqQJbjM
 rFODGn0aQ3T+w==
X-CNFS-Analysis: v=2.4 cv=S6McfKgP c=1 sm=1 tr=0 ts=602922de cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=toUk0IfjeMrTqMqL6ioA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tilcdc: fix raster control register setting
Date: Sun, 14 Feb 2021 14:16:33 +0100
Message-Id: <20210214131633.8742-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfMWdaqhQ+nSGvZCap5fuCPf8jL9YHqt+DWi5pPLGDMgmPnom2IIJHhAhuxJSRQZJmBSK2X3uzoM7Qmktkqz0w7y1AmIsrLflB2ipm2vuEsbsNyYTJ/vp
 5tV6EgywFwK0mibn6E+Ey77YTfpCyNr0s1hzC15RekyHEBqHm/kOZzgfvUhHjMJMRHF1XLM0vMIqGDPrn2A4RswurykyjdR4PvictSH6FoKyZu3bcp+ejMsS
 0OZCGPQ9pwEi0ulA3BoZI5qKse7C1QS9F29QWzQOz8SMw1QvZ53VcCE8ZImPdbmXdKdThVhMomCecDKXPNCzs6UgiAiWcGbIzezeMEqP3xm8UbyxGUFnX1Kf
 RxxejY4AKuoY78Id2sL7gJRlc/Ah2TLOlMPZotJyN/LLPJDY50gNSRg/tM6deA0PwIU/s9bi
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
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
