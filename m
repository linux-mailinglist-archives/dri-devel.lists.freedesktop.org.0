Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E7BF6BDE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A248010E600;
	Tue, 21 Oct 2025 13:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z3mUP3tD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B10010E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:23:33 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5956EB4;
 Tue, 21 Oct 2025 15:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761052908;
 bh=dH31mK/qVs+VbRMYQArF1ov23OSFhjFl1Q1EyISUIjA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Z3mUP3tDnZx1pupv/dYu/vk2kXUaOUhfEw+KBKy4ziVLfoFZKKcoWk57ob9bHKwuX
 ZeNqRL7J/m7scPlgMzFM2md3vKXLq4Uo6v8PnGRsynog01Ym/bWcIC21o+YPKFOP7k
 z9DQQAWNXXoZ/yYV6+WmK1aboagVKR5AWdewP5Bc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:22:58 +0300
Subject: [PATCH 2/7] drm/bridge: tc358768: Set pre_enable_prev_first for
 reverse order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tc358768-v1-2-d590dc6a1a0c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YI2oijIIP4ouwkoac6p0pQhIHGUCzzoTDUxDlmkbo2s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo94lODIGnhRLTlTuypYkw/zH3hu+BUbY9jqJC5
 DdszNGnDKmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaPeJTgAKCRD6PaqMvJYe
 9XJNEACQMzTGlnP3IF6HZ9Jah3Jq6ZsUPKpchRhiIjk7jf3YHiYTcqwtv5QZu4lSbzUKKlBYOTd
 4fsqnxu9Ii0BMkqVcBQ9GcoYjlGlpvn+Gxcft2qdJ5RbPcuAkjcfOzCLdQO6cwwHlM3XSEOHt8X
 BackGMbxgZ9ol1vYXTgLMER0BoxyWRl6fTGgkRruhZH/mKJHhPpbALpNwpqozqWIdfepeZnnosh
 aYSMNldJL4qTZpQG8LGrCCwvXLm2e7XNjO8nuAyN0q9orTvABkYg6dmrcwg4ZuBTy/znV55KKkl
 nIy4bEaukXI9DsPOguc+LU3Loe+zaf67PP6My/SzPE96iWg+JR8rvAiMY0A1UQsWfyk1Pjoxv+Y
 DshWnhcKKgQHl3p9OH4AIBRI02HWx8c5t33Bd2WuGOWfqIwPQRZTKaG2dJf2vFEt3YmfH2NBLFp
 fNA/UQvc8lvBQBi/Go71zddyxd/RoHw7pzMA6mbE/8NfYgNiDFXwjPVuZ6+Zbh1Zblm6k5RfVRe
 ICQ57caBC/KsmZOirZeDdfEN8riwvOD+RGdUOcGG4uJcOznffgjZb5K8OspVJqgvyyEL2aWCT45
 qIoirtOiCQ/oo0chuS1BsTEnNOR291sjtTG5HsGTH4eq1CAVsycTt8srihHuFAEHou3S5uokx2E
 uY02xXXWUh0XjJg==
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

From: Parth Pancholi <parth.pancholi@toradex.com>

Enable the pre_enable_prev_first flag on the tc358768 bridge to reverse
the pre-enable order, calling bridge pre_enable before panel prepare.
This ensures the bridge is ready before sending panel init commands in
the case of panels sending init commands in panel prepare function.

Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index c95d164bd3a0..dab9cdf5cb98 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -448,6 +448,8 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 						    DRM_MODE_CONNECTOR_DSI);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
+
+		bridge->pre_enable_prev_first = true;
 	}
 
 	priv->output.dev = dev;

-- 
2.43.0

