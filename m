Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA76B33C29
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53E810E365;
	Mon, 25 Aug 2025 10:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QMnJmqmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0D610E365
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756116525;
 bh=3G3s3b+bMWx+gvtGHMFmONy0Xwu3Z1ERqLscvT9IJDw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QMnJmqmLdr7CPbVMdRebH+5H61vFfZ1n77eFAUSO5k6ajbS9gVtFnB8Ppos7nYfK0
 2/0vAvfASgAnZdDTn21A61RloKYe+5cRZrD4XimhBB/4dvFYQdtys3MXMhYBFqnwd2
 0i+F3ww+rfdblgizOVwyOxGkEG0waxPCUiCq0xLQG5UiNz+oua9nE2NnQ2dXvR8Slf
 ZdRAK8bWI6OW4+se+D+7axGBZlC38WBNrxFLfGuLZFue67jKDfKJqk9Mmsn4MI4evg
 s3/VTW1YZNJydzh3EtGVEyk9yHL2Hmx2yBwww58VxNpbH+eBDpyrB3MoC/R5M1ULz3
 wZ+So90KMqtjw==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C3DAE17E0957;
 Mon, 25 Aug 2025 12:08:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 13:08:35 +0300
Subject: [PATCH v2 4/5] drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576
 regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-10bpc-v2-4-955622d16985@collabora.com>
References: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
In-Reply-To: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

For consistency and improved readability, redefine a few RK3576 specific
register configurations by relying on GENMASK() and unshifted values for
color depth and output format.  Those are not used at the moment, but
will be needed soon to support the related features.

While at it, drop a few other defines which are unlikely to be ever
required.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 6f2006e7999b540f29841ec4ef679a3ab1e8f497..0f2b421134af9f935758266af45c5779407b4144 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -38,21 +38,16 @@
 #define RK3576_HDMI_HDCP14_MEM_EN	BIT(15)
 
 #define RK3576_VO0_GRF_SOC_CON8		0x0020
-#define RK3576_COLOR_FORMAT_MASK	(0xf << 4)
-#define RK3576_COLOR_DEPTH_MASK		(0xf << 8)
-#define RK3576_RGB			(0 << 4)
-#define RK3576_YUV422			(0x1 << 4)
-#define RK3576_YUV444			(0x2 << 4)
-#define RK3576_YUV420			(0x3 << 4)
-#define RK3576_8BPC			(0x0 << 8)
-#define RK3576_10BPC			(0x6 << 8)
+#define RK3576_COLOR_DEPTH_MASK		GENMASK(11, 8)
+#define RK3576_8BPC			0x0
+#define RK3576_10BPC			0x6
+#define RK3576_COLOR_FORMAT_MASK	GENMASK(7, 4)
+#define RK3576_RGB			0x9
+#define RK3576_YUV422			0x1
+#define RK3576_YUV444			0x2
+#define RK3576_YUV420			0x3
 #define RK3576_CECIN_MASK		BIT(3)
 
-#define RK3576_VO0_GRF_SOC_CON12	0x0030
-#define RK3576_GRF_OSDA_DLYN		(0xf << 12)
-#define RK3576_GRF_OSDA_DIV		(0x7f << 1)
-#define RK3576_GRF_OSDA_DLY_EN		BIT(0)
-
 #define RK3576_VO0_GRF_SOC_CON14	0x0038
 #define RK3576_I2S_SEL_MASK		BIT(0)
 #define RK3576_SPDIF_SEL_MASK		BIT(1)

-- 
2.50.1

