Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB9BF6BEA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7875510E602;
	Tue, 21 Oct 2025 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FUQkomKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D5E10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:23:35 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1E31134C;
 Tue, 21 Oct 2025 15:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761052911;
 bh=XaG+d9fyiObtuju/o63OkE/MbTOIX8VL9vbdw30zwBg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FUQkomKkkzInbOxkR6auwFwdH3RDJjEGfkKgDTbh2CgAhJZVXgvfgBb5RFo4NAp+v
 zqRgxzXFQlgMhfvlm4kb44rE3LFc72vwTn2i74EBB5l0Dv023/kitvXxOap/TDqNMM
 FSKjoUI68dIN5bLnkWN1GRR8XeL0DNNGTgoVpfqI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:23:01 +0300
Subject: [PATCH 5/7] drm/bridge: tc358768: Add LP mode command support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tc358768-v1-5-d590dc6a1a0c@ideasonboard.com>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
In-Reply-To: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XaG+d9fyiObtuju/o63OkE/MbTOIX8VL9vbdw30zwBg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo94lPpZjx7puBa7b/dTW+Lp6esax/BZQXma3ol
 dKK2bsJAnKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaPeJTwAKCRD6PaqMvJYe
 9V5vD/4ugHbVnRj7DUD1toPiJp2291oLERPBL55aAUV+Vb9TG2lFog+92wvQdscY2CBTOM+j0lr
 5usGlAkhjvja3HxcVa3FKh1knl2WEi1t8TvoNjPzAqVvcYuT+Hpqpewr6dOqO5VcgdQHUXB0rDB
 Mo0X8bGeGpLcSE412cw3resvs1pusq/TkJ9LxRTuO2bAcP3rcgXQNZLDbGprblAwazNu7j/Nshd
 dtHHfEU6m5YoIXZWEeW+0M49ZgRj9mwIfkVqeseHGtntp2ksoHsFlQsalBqyXkKSYDDFc+n7KY7
 XlfJzCHl5uLApEyat48ajlNfZYXNKZV1jWU8nUbSby+NtrBaTV/gpA8wdKRzj8Re9bx3W3bgfE8
 s+vVMBMzmqM91n5/KLBnPE866vTCaMzFoyRUAd76ccFie0JFZfUXbxwFpSZra7mOoWTYuGXCmnB
 /lscnrMmbwD1sAZJoLR2YXiQ8NKheD/Gdaq+Mx8pQWGp3T3LrjO2uNcJY5f8UfYdqO/J9KGlrWf
 uFxzBZO6MNqCauvF3BeeXjbrcxb2R8/PljtGG8iEusnWxpU/uMMf+xw40ONlCZq/mIBXxWxvr6O
 Uddkr1Sm2NFJXTF/WNCtSkJVVVzXi4FjKpAqGqcnRvskDcfKckrRrz5aPQKzxqd0+pgIUbidiKX
 fPbmARBuGR0W8Pw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the driver ignores MIPI_DSI_MODE_LPM and always uses HS mode.
Add code to enable HS mode in pre_enable() only if MIPI_DSI_MODE_LPM is
not set, and always enable HS mode in enable() for video transmission.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index a276fbc75dde..a7a14c125ac4 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1091,7 +1091,8 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Configure DSI_Control register */
 	val = (dsi_dev->lanes - 1) << 1;
 
-	val |= TC358768_DSI_CONTROL_TXMD;
+	if (!(dsi_dev->mode_flags & MIPI_DSI_MODE_LPM))
+		val |= TC358768_DSI_CONTROL_TXMD;
 
 	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= TC358768_DSI_CONTROL_HSCKMD;
@@ -1123,6 +1124,11 @@ static void tc358768_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	/* Enable HS mode for video TX */
+	tc358768_confw_update_bits(priv, TC358768_DSI_CONTROL,
+				   TC358768_DSI_CONTROL_TXMD,
+				   TC358768_DSI_CONTROL_TXMD);
+
 	/* clear FrmStop and RstPtr */
 	tc358768_update_bits(priv, TC358768_PP_MISC, 0x3 << 14, 0);
 

-- 
2.43.0

