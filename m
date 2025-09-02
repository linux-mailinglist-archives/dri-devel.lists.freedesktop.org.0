Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F4B3FAA1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4D10E62F;
	Tue,  2 Sep 2025 09:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AqKMvDBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC8F10E62E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2293D40515;
 Tue,  2 Sep 2025 09:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C2AC4CEED;
 Tue,  2 Sep 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805774;
 bh=fYZnq5UDrHuM5t0Pta5bSVbcw6d9tlXpfEh/84xjz0w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AqKMvDBfa6efHN6CYxQCRZk6KNrxLp/pmSxnX511Hsn40u83q2v72Z0TY9JDdR/Wi
 I0Yol2k9Pz0N4w9xqL7Kqiwu0ffcwdKyKJAgDZRkJ4HrFL/i/shztZLm69EtVR3nXP
 PMbcJWo/zGUnVBSHWazT/fVyKKOR2//2kP+SRwkvnLes1qAWoZCqoXW3wBSDgsJ3qk
 5qZm6YXaQkkvtq28qyn/MbVu5Ra6SJe/YEzejxN+bv1OZUxKMW9jclU1lnSGj32VBu
 jXb+QT9vdd4ngBkY5tcQ4VDCH2Lb3ac0kCJA5r3bTzNDdinxFayka/LeoRntnB/5O7
 aH41c0Da9xhRg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:17 +0200
Subject: [PATCH v2 18/37] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-18-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fYZnq5UDrHuM5t0Pta5bSVbcw6d9tlXpfEh/84xjz0w=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgXLyEnY5zuLCq/eUrrjvfb0IGt+TrGp1q6iUvJHT
 k28uWZnx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIlCBjncLu2eKXjJxm7j1x
 SuvydIE1FS+ST27rWRmowJXIor5e+Y3B4tVBx75WGG3f32z6li/pPGPDQ+HpV7/cYTZUMLPg87/
 E/+6Jr9QjpdKW6kMvGR8HrWXyKijfeHTvbn8dScklu5zKeTcCAA==
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

The imx-ipuv3 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f950c3f0ce5d6c6f637d9d7b53fb69..df19560e41b4f5b0dce97ae03947abeaf99e0883 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -384,12 +384,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1

