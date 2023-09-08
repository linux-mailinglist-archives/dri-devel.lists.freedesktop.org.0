Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288BD798FB2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBAF10E921;
	Fri,  8 Sep 2023 19:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Fri, 08 Sep 2023 19:34:13 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2C10E921
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:34:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DB86B8219E;
 Fri,  8 Sep 2023 19:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942E8C433BF;
 Fri,  8 Sep 2023 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201650;
 bh=PtZ/AsvRSq1hESdjpEPmsZnWD+6hYlR81sNVLe0CSRc=;
 h=From:To:Cc:Subject:Date:From;
 b=YskQ/KZ7/wpymbPV7gMvSkU3IAf6B6ubmNL9cAaEExJm0sNCyE8UQikj+bjIxlZPe
 PMA/6cTYA0eI5+FLl3oHXTNiZk9VMaW1p/qC4/1MZklsU+9HG5WP7MVIkdWl5vXlSF
 Entgw0Po+73GUDa4mwxr0mzK/6/O3go4jj1XZ8Ti5QDJzhM5oysuxCLE0UVVAYTjJF
 9xFZHVtdZBCGlgN9OE+CIG7p9LrTbKpQrm/sfD+Kf6PRQTPWiaPkho89YGpLsg5DEM
 lW7HMIfUKYILLvdlMt4tmNfbcIo2Ls9rJdK5V7C+oaNe5237n7kgZiFTE3YtNKxaSh
 YpRiTx7qI1BZw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/22] drm/bridge: tc358762: Instruct DSI host to
 generate HSE packets
Date: Fri,  8 Sep 2023 15:33:45 -0400
Message-Id: <20230908193407.3463368-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
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
Cc: Marek Vasut <marex@denx.de>, neil.armstrong@linaro.org,
 Robert Foss <rfoss@kernel.org>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

[ Upstream commit 362fa8f6e6a05089872809f4465bab9d011d05b3 ]

This bridge seems to need the HSE packet, otherwise the image is
shifted up and corrupted at the bottom. This makes the bridge
work with Samsung DSIM on i.MX8MM and i.MX8MP.

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Robert Foss <rfoss@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230615201902.566182-3-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7f4fce1aa9988..8db981e7759b9 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -216,7 +216,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_LPM;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO_HSE;
 
 	ret = tc358762_parse_dt(ctx);
 	if (ret < 0)
-- 
2.40.1

