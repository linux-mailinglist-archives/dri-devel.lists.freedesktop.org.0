Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE077E046
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 13:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711D110E35D;
	Wed, 16 Aug 2023 11:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CDF10E357
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 11:26:00 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA1DF02;
 Wed, 16 Aug 2023 13:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692185086;
 bh=lJbs+u3Qj3Q0zC4Wo5t/O8IezT1rm6E1W3iejTWvFus=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ze7KdHL3OAdq7ax0zkkKIHQ/HlllSOfnky93i4Xp34qVfrUJC9p2Ax0U6ZbStay4M
 eh7D0WjAH8J+MowPxRlG9va8kjuiueCx6rQXOdIbuL6ymOiNaD2nJ/8dfz6uO09Hak
 2ezuRdzgSd9HGLK22D2500LcsCCAW5CdBVItDP4A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 16 Aug 2023 14:25:15 +0300
Subject: [PATCH v2 12/12] drm/bridge: tc358768: Default to positive h/v syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230816-tc358768-v2-12-242b9d5f703a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lJbs+u3Qj3Q0zC4Wo5t/O8IezT1rm6E1W3iejTWvFus=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk3LI3X79NX4TNGdgFOlXsh77AMKmBQn51e/e1l
 8Djg/M+A/WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNyyNwAKCRD6PaqMvJYe
 9SKlD/9WJ72o8W4x/nTq2DdYvThqd3Yi0xdA6Fs2VtWFglzyIy80utupxMrnHJ8188TWLM+IRUg
 k3vjjUENpUD+mMUB2qTJoOyLPf/cwZdOlkq1You1A7MGGsVXHfU4BUKNDnWDFB1lE4kESuHSPMy
 qC1p1N4nMgJCJqkcNq1HGHrG67u+bfQgWb7OMBnLOcb+8x88doP8RAi8outnRQ5DtAwpPZ2MnFR
 PQSJ23GC8/E6afT9QrwMuAxsCXb5OcgndOs+zzNdPV4dje1Y2kRC3xayoVfj7Xk50vnlVCDfgvA
 +/jA2L24ZIL5iCSCo8yr028Ck7rjGYX588IHLMUxiBulQ3fx1VAHWEH67w/EcjbAyA2mvwynfeP
 Jm5vfbkM02c20/0NqX/rhVyCImb+rRI5N42rtY3CbGvjVLliYZer8Uw4FHzJbtgEJf/LWnaIoMd
 ag/AIBwotOKEk7/VdszmuH8BEUe+CJJ72/ruorEm0FbflxD1nifUPjXMWCH2VaxZI9pBdbL+ddE
 0d6j4EoL7w66cFHRyKA77UhkPQ37kp40bQsY3nz5CaMU++M1a6t/3TlMI6bVcVWLEh7M+aj0kC5
 ydRbg5BTgT/LLNCLcraNeHvs32awVRT+qFEEBYWcS7Kv8k8HFWD0cXqVQjRvBZuTIlRthlXY2jq
 gFkxiqI8+XhlJ/A==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the TC358768 is a DPI to DSI bridge, the DSI side does not need to
define h/v sync polarities. This means that sometimes we have a mode
without defined sync polarities, which does not work on the DPI side.

Add a mode_fixup hook to default to positive sync polarities.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index ea19de5509ed..b465e0a31d09 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1124,9 +1124,27 @@ tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static bool tc358768_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	/* Default to positive sync */
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PHSYNC;
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	return true;
+}
+
 static const struct drm_bridge_funcs tc358768_bridge_funcs = {
 	.attach = tc358768_bridge_attach,
 	.mode_valid = tc358768_bridge_mode_valid,
+	.mode_fixup = tc358768_mode_fixup,
 	.pre_enable = tc358768_bridge_pre_enable,
 	.enable = tc358768_bridge_enable,
 	.disable = tc358768_bridge_disable,

-- 
2.34.1

