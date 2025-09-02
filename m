Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B9B3FAAE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A8810E635;
	Tue,  2 Sep 2025 09:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ptut55Q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6A310E635
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6503160206;
 Tue,  2 Sep 2025 09:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF964C4CEF7;
 Tue,  2 Sep 2025 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805787;
 bh=dJ5/w3DQC09hYzOBeDzO8vdUGntb8FaUU2kiZKDKCVM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ptut55Q6FQRD0KiWtAAulpB+iqoj+euwo/uyCtSCn32ZlIzl68uIcFXioqP9EoI0w
 xYiQN3TWmXpSfrYd0nXqA/O1V7Kw6YU5eCs5lOKsuDsnFhZI1LAGnWjUfhxpcpe8Wp
 tR0CPcT2g2imKiYTrQkd+splpYq93PcXDRMwAYBKZV3avpDFBAuZf7u+WxQBMw5RV3
 HleuMEBTbLVvDDnSga3t4I2/ANt/U/sQ8EXvAYxk4MOPjzDdY/pTxNfKsEplPjr9N0
 Oxx4W8LskKB75Jm23ESZ/27Q5b04rsPOA3vVnucoxWFqCESS2hol56II8JSW3vWd+O
 GkaI2qg3OUBHg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:22 +0200
Subject: [PATCH v2 23/37] drm/mediatek: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-23-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dJ5/w3DQC09hYzOBeDzO8vdUGntb8FaUU2kiZKDKCVM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoVKv38Uv7fq7gnjdS9u6BcnNFUU9sifbJroPH3mZ
 guR3aUnOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE1r5hrJVzv5f2Ojh2nkud
 ppLS/c+un+VW32rYHHnp50PWVzov5UpD7jBM+f8heX7N+u4pZq9iVzLW10XXrzxvX/g+bcFzpzk
 OQo9c1CdV1F8QvJN0Q+TEpNl+v2yDDixcrRr1T9PBpeDFhKxTAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The mediatek atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index cbc4f37da8ba81ff9c8b3b58f66363837ffc21ec..d4486a63a6e01f02b6777522440dee8e39d51bf1 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -120,11 +120,12 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 	ret = mtk_crtc_plane_check(new_plane_state->crtc, plane,
 				   to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
 						   true, true);

-- 
2.50.1

