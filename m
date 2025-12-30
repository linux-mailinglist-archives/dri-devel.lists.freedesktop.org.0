Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A94CE9DB4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0884D10E8EE;
	Tue, 30 Dec 2025 14:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iYFVD69P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D2210E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103445;
 bh=2zwHE6VS64y4Vju4EqV2SaPOMxtYDh5dxEHGfmBSgxo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iYFVD69PDeKLH+y/WbmkmAQ3srpkFolh002OMQj1ttIfP4JwfqCB031iSvR6qPp0Y
 uZ2+8W9VywIL5fo53xJLuJ2eo8bowdfn6Mkje9J9Gaa55X1D2JnnkgkPgbKz91nvyl
 sNGrF26v6w+Kiy2/jhVeVoynlg3xVrF42n1mHLXrCoIcGduuYhq//pJzSdhSOC4s0w
 dlna8aSn1dDRZjAKPvxNaV7KWY48JnoXQgIJ9hGFbjbl1fGS+Pbdy9NUyPaQs5iCpO
 cvX9T9IQzayeQvdUyJVNNcADzyXhtsdkZvfeSykfmVawDRzQGSkCTeb0DQtUl8g6N2
 IDbnu8DomLL1Q==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2968317E127C;
 Tue, 30 Dec 2025 15:03:59 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:06 -0300
Subject: [PATCH RFC 6/6] drm/mediatek: Re-enable AFBC support on MediaTek
 DRM driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-6-6c0247b66e32@collabora.com>
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

Commit 9882a4064003 ("drm/mediatek: Disable AFBC support on Mediatek DRM
driver") disabled AFBC support on the MediaTek DRM driver since it was
broken.

With the bugs in the AFBC support now fixed, re-enable the support.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 8fb08768e8ce..38dd94cdd665 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -22,6 +22,9 @@
 
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE),
 	DRM_FORMAT_MOD_INVALID,
 };
 
@@ -69,7 +72,26 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
 					   uint32_t format,
 					   uint64_t modifier)
 {
-	return modifier == DRM_FORMAT_MOD_LINEAR;
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	if (modifier != DRM_FORMAT_MOD_ARM_AFBC(
+				AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT |
+				AFBC_FORMAT_MOD_SPARSE))
+		return false;
+
+	if (format != DRM_FORMAT_XRGB8888 &&
+	    format != DRM_FORMAT_ARGB8888 &&
+	    format != DRM_FORMAT_BGRX8888 &&
+	    format != DRM_FORMAT_BGRA8888 &&
+	    format != DRM_FORMAT_ABGR8888 &&
+	    format != DRM_FORMAT_XBGR8888 &&
+	    format != DRM_FORMAT_RGB888 &&
+	    format != DRM_FORMAT_BGR888)
+		return false;
+
+	return true;
 }
 
 static void mtk_plane_destroy_state(struct drm_plane *plane,

-- 
2.51.0

