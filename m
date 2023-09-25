Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14027ADC8E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358F610E283;
	Mon, 25 Sep 2023 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14E10E283;
 Mon, 25 Sep 2023 15:59:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0631AB80E3B;
 Mon, 25 Sep 2023 15:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBFDC433C7;
 Mon, 25 Sep 2023 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695657575;
 bh=pFhRBn5GwxIYPM5GA2ar9CKtCGC8fLy/cMk2rpqwfMs=;
 h=From:To:Cc:Subject:Date:From;
 b=nKpHcquP8+qpdZLt67K5VWTRQ8F8VHGeW/s/Uz3bRUjhSCUGIAO+M62heq3Ln1oUn
 BqVhK74g1ZwO18Z5q6UibGNz7cIKYIR3WW9ClQMzEHD5hkJrjK/wxKssL+o3fJ6/OL
 jw/8SYU144MTXKzTsTSrGnvZVkp2lXbJX2Fa+4khSVpxapdA7DL2SFYKPdQMgQITk8
 Np9XMbUqHAvK4U5R4bItqWB48mk+z7SiLTVMBVYEMvFJwexE9Ro1sD1OpxkYjPilNw
 8rp3eC13Yq4SqzPQqk0oaD6QYJnBWKiar39Rl52y26Eu+GcHAxtMMZ/YHNUXqQsNlt
 k1TxET8DZlTOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <me@dakr.org>, Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/kms/nv50: hide unused variables
Date: Mon, 25 Sep 2023 17:59:24 +0200
Message-Id: <20230925155930.677620-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

After a recent change, two variables are only used in an #ifdef:

drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
drivers/gpu/drm/nouveau/dispnv50/disp.c:1569:13: error: unused variable 'ret' [-Werror=unused-variable]
 1569 |         int ret;
      |             ^~~
drivers/gpu/drm/nouveau/dispnv50/disp.c:1568:28: error: unused variable 'aux' [-Werror=unused-variable]
 1568 |         struct drm_dp_aux *aux = &nv_connector->aux;
      |                            ^~~

Move them into the same conditional block, along with the nv_connector variable
that becomes unused during that fix.

Fixes: 757033808c95b ("drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 52f1569ee37c1..a0ac8c258d9ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1560,15 +1560,13 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nv50_head *head = nv50_head(nv_encoder->crtc);
-	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_backlight *backlight = nv_connector->backlight;
-#endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
 
-#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
 		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
 		if (ret < 0)
-- 
2.39.2

