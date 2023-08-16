Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B251277E03C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 13:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD9B10E34D;
	Wed, 16 Aug 2023 11:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D5310E347
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 11:25:48 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E72ECC85;
 Wed, 16 Aug 2023 13:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692185073;
 bh=ZXPuvKRX9sprHbo4Gpv06P7fu4Zcz2YshqV8Y8PC7RA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pwUcqjDnjxDTPJOB5LLs42TFguNy6jxlko33YjqoNsEeFgPRLO+sMpQe+MjneSCmS
 jXOX5nOCp+qAG0A34L8Dws5VSN7LOQCu4vAYW+OHJ3KYfynaGT7+4cnLY41xKyggXn
 NTpeemrgY8dg5Lxm/4NTzmg/CC/7TufY0OM5Tso8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 16 Aug 2023 14:25:04 +0300
Subject: [PATCH v2 01/12] drm/tegra: rgb: Parameterize V- and H-sync polarities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230816-tc358768-v2-1-242b9d5f703a@ideasonboard.com>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
In-Reply-To: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GghajFVwAuY/jQ2Sbjd3Hk+E+RHO699TYVsqwsh7V5U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk3LIzXTggTDUU/b8Y6cxIrzc6YDU8xIreubHaS
 CQ3so3qymqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNyyMwAKCRD6PaqMvJYe
 9VcdD/4jtfA+Exg74OnSyr8FP5u4K+47fKDod2jyMhDssy7Kef6F1jPQT03bTGO17A+ZP5HHVAo
 lY7Tx5scXojq/ofDRswxIIOb2T+f4aLt4dXXzr/GT2d082MpktW828ql2CHrFPuJF5kTvlh3lSJ
 RFF++8d/0nSGoouc9rj/U8suKN82Y1b9cCxslavCtdDEn35TcBcfkczuCEQZqlNB8D/GP1udZnD
 hQZzGI5n/unYbWUKWc6xlHUAOdCUwixdwhliD8Canu0f6HuwUJ+8iVf2tXxQzrQqkxB6NDmCYMB
 OypfGci0wzVR6f9H9wKjuFYFNyb+Sz8SL3iiiZBlJcYOIMIhHr3klqezZ97MjucrkkZ4x8vzsWo
 wCk/WRt89ygZs8rnucd971ov0RhfCILDBYBASTRdfwt7It/yjdxS7liUqCwUit3eSyj/sN46MHx
 678datOimyls8RsUcCKPGEyUsVWFcCqbX2PmFQaJR15sgHMk3yOVIHb97XxkwW/lZfu5Gc0cEKU
 lFuxWj9sSh5JxDOqEszaySboqTZj6uJKuzobn5VvnAiR9yKlDOr4G6VB2tZpNdLTvB4D+iMYe/F
 O4qAonbYqFMTvkbaIGP53lv22bAIhtNde+UoTInM6Dd9RSyk//fQHKousjHBlQaTj6U9yYFRRHN
 5RLBpLtAFSJHM7Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The polarities of the V- and H-sync signals are encoded as flags in the
display mode, so use the existing information to setup the signals for
the RGB interface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
[tomi.valkeinen@ideasonboard.com: default to positive sync]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tegra/rgb.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 79566c9ea8ff..fc66bbd913b2 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -99,6 +99,7 @@ static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 
 static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 {
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	u32 value;
@@ -108,10 +109,19 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* XXX: parameterize? */
+	/* configure H- and V-sync signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
-	value &= ~LVS_OUTPUT_POLARITY_LOW;
-	value &= ~LHS_OUTPUT_POLARITY_LOW;
+
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		value |= LHS_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LHS_OUTPUT_POLARITY_LOW;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		value |= LVS_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LVS_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	/* XXX: parameterize? */

-- 
2.34.1

