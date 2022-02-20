Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A841A4BCC1E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 05:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A7810E11C;
	Sun, 20 Feb 2022 04:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEE910E11C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 04:07:33 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D3F083C81;
 Sun, 20 Feb 2022 05:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645330051;
 bh=j4256JpsxU5PXbYQOo0EDd5g38upc6lSVHpRPmbG110=;
 h=From:To:Cc:Subject:Date:From;
 b=CNihUDOwupOhTuHpHPcSGpGSI7gUakEliVqvKhA9+6q9OiYmcasVTk3TK9sMimg89
 z13+27LtAJi/6V3iUPR1bU7VmcD4ZxQgZGDnYMy3EFtbHwkoCujrew2ZqeSKRA5u/h
 OI0SK2bC7W6WrsKge1ahyi5oeUFUqExbmoGc+QgXsoMGPINz4TFSufH1usrQwS5J/M
 xiW/8rpo6HVkOObatsPjWAoJW4TcAtZvEqJRRw/j4/Iw8LHHDfUncXVGzM2IoZj9w2
 sJ17VEee2oNQU8zB3/1HCZti8ZfF4trzDw9pOfPh+EqRIx/iBKQoricltCBu4G3oS9
 DrHCSjCfwcicw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
Date: Sun, 20 Feb 2022 05:07:18 +0100
Message-Id: <20220220040718.532866-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Christoph Fritz <chf.fritz@googlemail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Innolux G070Y2-L01 supports two modes of operation:
1) FRC=Low/NC ... MEDIA_BUS_FMT_RGB666_1X7X3_SPWG ... BPP=6
2) FRC=High ..... MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ... BPP=8

Currently the panel description mixes both, BPP from 1) and bus
format from 2), which triggers a warning at panel-simple.c:615.

Pick the later, set bpp=8, fix the warning.

Fixes: a5d2ade627dca ("drm/panel: simple: Add support for Innolux G070Y2-L01")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 49e56adff6226..4405a9dc7574f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2137,7 +2137,7 @@ static const struct display_timing innolux_g070y2_l01_timing = {
 static const struct panel_desc innolux_g070y2_l01 = {
 	.timings = &innolux_g070y2_l01_timing,
 	.num_timings = 1,
-	.bpc = 6,
+	.bpc = 8,
 	.size = {
 		.width = 152,
 		.height = 91,
-- 
2.34.1

