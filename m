Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7FFCE9DA8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0210E8F1;
	Tue, 30 Dec 2025 14:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lmbQoavr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30910E8F1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103433;
 bh=8znKm4tlbIYhdYcckfvwcGyuwybXFTON9zwc8N6bIic=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lmbQoavrlIm15+Amp4DI3XQat3GPgt6YXkrYSHkQKm+CyNzEugh0rRDS4oWxdNxpP
 Sx2fcCdxEgIU2mucChAYAy5281KY87zwVPfdVHH0AdwkDHTMHJnM+n2U8NpPJfrpOU
 JcHIM2iMDEpuFwkj+xTWDZV80vGfgagZbaE8+Ys+4TmrSr7SLwEe1WnoWCmRJ3oeAO
 q16LGzwjqaAZR9J2pHoE2FmuDLN7uBSSe1certtjonRZiJDunZlAb5jaKF00MeFban
 9adqFE8nbhZyjz5KRSmP/TdHZDN/BLrFmqTRcoN8cZmWB01zEr/fqGBIGLK8ro8TpY
 Qsy9jCcBX2cpw==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 783B817E127C;
 Tue, 30 Dec 2025 15:03:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:04 -0300
Subject: [PATCH RFC 4/6] drm/mediatek: ovl: Disallow AFBC buffers with
 width over 1920
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-4-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

AFBC buffers with width over 1920 are not supported by OVL. If
attempted, the image displayed contains many artifacts.

Add this restriction to the layer check callback so such configurations
are not allowed.

NOTE: This doesn't seem to be a good way to handle this restriction, as
when tested with Weston, it simply fails to render, rather than fallback
to not using the modifier:

[19:09:03.857] atomic: couldn't commit new state: Invalid argument
[19:09:03.857] repaint-flush failed: Invalid argument

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index c6a00c2256dd..196b874057ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -368,6 +368,13 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0))
 		return -EINVAL;
 
+	/*
+	 * AFBC buffers with width > 1920 are not supported and produce
+	 * artifacts, so should be disabled.
+	 */
+	if (state->fb->modifier != DRM_FORMAT_MOD_LINEAR && state->fb->width > 1920)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.51.0

