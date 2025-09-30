Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDABAC9BB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700D10E584;
	Tue, 30 Sep 2025 11:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uo6f/5/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8210E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AE8F4191E;
 Tue, 30 Sep 2025 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2053CC113D0;
 Tue, 30 Sep 2025 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230071;
 bh=vXfBAGE/lI0vV3TugkNTL0+vLwxCPE62ixr6JwxDT1Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Uo6f/5/15NYnswrnrP0w+nTi/qabXQ2K1ZBx6dFDkMPcyWgCwASp4EvuKl3O93aNs
 8EhhrJnbvaBR8CXOgcMRFMO7iZo01RsOza/v93uBrFpiG3w14aCy/VIWGBO7Ds6T9Y
 6XDLOpKTLi6r8O4IZjfour7JquHoxKQgHBo564S3/aWvuVa25TYr6CJLiL3qd9JcBj
 cTjJOod55V6gaio/f85ETmq1Lejg1VM8fZ6mJK0ElAEc/htrpCfKKriyuSPPItn/4K
 1Z377VBf1WiKM/ouVhPg0kQfdEEnr89Ijlg+j1UtHks/vgob2BX/LgyYdE/wnstPQc
 Dkfjr/2sSD1hw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:38 +0200
Subject: [PATCH v5 23/39] drm/loongson: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-23-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Sui Jingfeng <suijingfeng@loongson.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vXfBAGE/lI0vV3TugkNTL0+vLwxCPE62ixr6JwxDT1Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2ie3r2Kc12Wj0BU+oOgEgkZlQ3eB3fPKXOYeiXjx
 xrxzEklHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiU2IYG3aGfb31qvlEOlfX
 lcgj03KbApXuyc/1fvvuUOu5lDe35+ya3byylTlH6xnvDY33j8NMFjDW16Yz3iybm6fxuFxFaN/
 x/d3HdrOte7qjJCqOMdnZJn917ub7zqEFXqy1uw7IeK3l3H8UAA==
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

The loongson atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index aa9a97f9c4dc28eea3098507ce52e6aa6caa46eb..2967a5cca06936d5d2480fac258b01e11f8d28e1 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -194,11 +194,11 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (!crtc_state->active)
 		return -EINVAL;
 
 	if (plane->state->crtc != new_state->crtc ||
 	    plane->state->src_w != new_state->src_w ||

-- 
2.51.0

