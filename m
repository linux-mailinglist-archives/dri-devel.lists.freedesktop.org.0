Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4473D15C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 16:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8833710E16E;
	Sun, 25 Jun 2023 14:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8B10E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 14:17:45 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 99EA76607134;
 Sun, 25 Jun 2023 15:17:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687702662;
 bh=hy/yPAn2uSB4ki0Kb6pM9nocxr+HExnkKdS5jKFuPcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FGZrClUaLXMLHLNUlXTRCZS7MdYYm5CKkv4TIIOa/WeEtz8nwbRNvxDJwQcnkpmUr
 1yQ+gEvrHl6IkZLAgAII0u3MVIzTnE6HWQmD+QV5hmcw/Lw/VR08ihjAhwl1dL4Cvj
 MeEXNDx6D+hyur1/ehh+B5tgHkX/0dXYZFZo3h0I92dMKAc905CZCS8EOJFdRbgtza
 ZqpsYyuXUzEjP/gRABmGT7LsmpI0oQSfdfHqRDLi1P8vl27z6Yc49SBerwgiEj96ys
 48FhO6kzXj7ng2eGYDTifOg+y92+lW5JM/vKZe4VKXpn5VIJfU5ybsp334N28DbBzp
 i1/K2EGTjvyNA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/3] drm/bridge: dw-hdmi: truly enforce 420-only formats
 when drm mode demands it
Date: Sun, 25 Jun 2023 15:17:16 +0100
Message-Id: <6e6a217c180584a67ed7992c785764ba54af9151.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current output bus format selection logic is enforcing YUV420 even
when the drm mode allows for other bus formats as well.
Fix it by adding check for 420-only drm modes.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e6a456b72610..3a788316e2e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2710,9 +2710,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		/* Default 8bit fallback */
 		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
 
-		*num_output_fmts = i;
-
-		return output_fmts;
+		if (drm_mode_is_420_only(info, mode)) {
+			*num_output_fmts = i;
+			return output_fmts;
+		}
 	}
 
 	/*
-- 
2.40.0

