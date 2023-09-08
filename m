Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B77798FED
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0010E939;
	Fri,  8 Sep 2023 19:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F01910E935
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:35:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A386661540;
 Fri,  8 Sep 2023 19:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E58C433B8;
 Fri,  8 Sep 2023 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201733;
 bh=7DNKxML1OovOuL0wtQlSR0eXrNBQN/Adr0v9MwgCV4c=;
 h=From:To:Cc:Subject:Date:From;
 b=fWzQ4G7KX0rVaJqT/28GhuexP1iMGKPT/QnAX2B9o//R/VjpVAnG7fsIG+dOwLF4/
 quXtiCOQdU7tVsBlMkkD4mFArD9m5Qhd7nYC7cl4Di+FlyHyPJ8mbpUWniQ0dxqH3D
 P83JHRD79+hTJhulpEHF4P/3xfCgCqZnWYIfZJuz2+OLOPJ+cCXDe4QKNuc0hes8+G
 HbKz30zRGSLyB6P5xW5TxvAF2EvTePdpkjFLTkLoTnt8SI4/VeEnP78OLfWXTfixec
 34vrNDe++B2Ui2YQHONFGX5luVlH/o7Ph7qrkUUX5t/1GUTmxp626toDLpSbkHX96H
 Qc8xWw4MBFxcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 01/13] drm/bridge: tc358762: Instruct DSI host to
 generate HSE packets
Date: Fri,  8 Sep 2023 15:35:17 -0400
Message-Id: <20230908193530.3463647-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.131
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
index 1bfdfc6affafe..21c57d3435687 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -224,7 +224,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_LPM;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO_HSE;
 
 	ret = tc358762_parse_dt(ctx);
 	if (ret < 0)
-- 
2.40.1

