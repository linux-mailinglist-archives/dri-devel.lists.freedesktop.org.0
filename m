Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B25B3CC19
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 17:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA110E045;
	Sat, 30 Aug 2025 15:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="gu2KRnOe";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="fYjsBjj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Sat, 30 Aug 2025 15:40:19 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27310E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756567845; bh=iFu8Q2if9Qqq+73Po+C+y3AM8ycDyWQMWtUM/L9qSe8=;
 h=From:To:Subject:Date:From;
 b=gu2KRnOea5xiROynE1gcOSEuaNpGOvvpIdaC1zXhMf4Fu+jE9qhnjasKVYwduLpMq
 xerDILh+09LLUnOq4Gr3ZXOEOKs4LJA34GuGPpiHeboGQ73y1RcTP76U3Aag5v3BZ8
 CphIslukYgdmUqR2c1+DdpWpVng/hrrd+6xPchoaGBhrExGb1yMdmV1NLxXpksr5rL
 Iz/C6FK2VXnUzOrcOS20dXXT4pAWqN86CyEomBe9F+BmGQwGaz6ROLprCZff1tjoSn
 JS5wDw6E03Noy65sOimh/lHL1PlE9HO9BRd6LXXRepQB3decMb8WMZCIvMyULbztBI
 35nZtykdiZiTw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 146FFFB05;
 Sat, 30 Aug 2025 17:30:45 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JDz5b2oaxtr; Sat, 30 Aug 2025 17:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756567843; bh=iFu8Q2if9Qqq+73Po+C+y3AM8ycDyWQMWtUM/L9qSe8=;
 h=From:To:Subject:Date:From;
 b=fYjsBjj+VZqKvHRzOGf3u/HT+2Zp0NogvO3sevb3T8r3b7gPTJpbjBkQnBftBwWAP
 Mjg/1cAWPuEtZvj9mN9k7q+LxesRRXG63yEkX5QiIx4Hdh8VdSe3YTITeJ48muiw/9
 k0Lf5ZUI9tC1dHy2Zbf3T/DQFP38gcsRycM/7a3tUrgW54Bb3M8lolrDL0eqEy0vsI
 DFsS0lgCrrE+41xRRXUWkN8qC4MtZxHdbm4jkHBkr0RuFKcEWuufmhRMVopCFpWDXO
 /kkyK3uW5EwiK5LuTkDBKP6ClTSQKKi1f6LBXk9Q+Rcw0zXTSVafBsNoDqb35Ms34c
 7ufhT7RA1B31g==
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>,
 phone-devel@vger.kernel.org
Subject: [PATCH] drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
Date: Sat, 30 Aug 2025 17:29:25 +0200
Message-ID: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Make the clock frequency match what the sdm845 downstream kernel
uses. Otherwise we're seeing timeouts like

```
msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110
```

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 909c280eab1fb..e65697ce6f51c 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
 };
 
 static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
-	.clock = 158695,
+	.clock = 149360,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 26,
 	.hsync_end = 1080 + 26 + 2,
-- 
2.51.0

