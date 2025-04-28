Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64CA9EF50
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B091E10E430;
	Mon, 28 Apr 2025 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ut1RM4OY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04B10E420
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 11:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED9E75C6667;
 Mon, 28 Apr 2025 11:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE8BC4CEEF;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745840246;
 bh=/2Bzh5lhcnvg/ARciMdmCSEVawv11h2WJiL6HlFN56k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ut1RM4OYJwAb0lOE4fsR6dXNvOkD0gyRqzMa9QkMuSbu8vfVQ4DtEBICLU+FMhnI3
 uWUaEWt+5+QVrpq25WGMnZHMncTKRVZLJ/gA0QNTRL9hhrIKvTiUPT22TTHZdMYRl7
 i6ty5lBg2ednIZgdVIhY7JTIGRTrYzwDVY7LFLaobi5eAI8WReZK31Iy3N9S81JXs0
 Ielv4E60WM1A8+tkus3Wc5z7Q1YLLTigInhklsFWSmo+lOKnFkYHfHTU2P8Stsfi1p
 lNKOWdUc8wFdBjoFfMx91vVgTe47gicTl2+JhPCRqPD+wkpRWjinRdslC+0/dYIYH9
 Du1i4Vzkw8M+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AFB4AC3ABA3;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Mon, 28 Apr 2025 13:37:15 +0200
Subject: [PATCH v2 3/4] drm: adp: Enable vblank interrupts in crtc's
 .atomic_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-drm_adp_fixes-v2-3-912e081e55d8@jannau.net>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
In-Reply-To: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=5JgvZ4gbao9P8lotrmf2Fkpjg9Gx/quiG4P1r9wf9J0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgz+jFK9wyy+9auiUv/bSb+7MD//jurKe06vuaTmbfYJb
 JQofNnfUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCI3YxgZrmrPTfVPjhEydLJV
 s3l15pq81CWrL1o/5n1b67D7/PRnrIwMp16fcPYt4eU00/i/iX8ty6cFCydumbHYzuW5yS3WXCU
 dTgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janne Grunau <j@jannau.net>

Calling drm_crtc_vblank_on() drm_crtc_helper_funcs' atomic_enable is
expected to enable vblank interrupts. It may have been avoided here to
due to drm_crtc_vblank_get()'s error behavior after
drm_crtc_vblank_reset(). With that fixed in the preceding change the
driver can call drm_crtc_vblank_on() from adp_crtc_atomic_enable().

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index bdf27ee742ea01759b5d571a21b527687ffcada7..50d26c73301c02e4a2f22b776ad8d8e9407565c9 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -288,6 +288,7 @@ static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
 	writel(BIT(0), adp->be + ADBE_BLEND_EN3);
 	writel(BIT(0), adp->be + ADBE_BLEND_BYPASS);
 	writel(BIT(0), adp->be + ADBE_BLEND_EN4);
+	drm_crtc_vblank_on(crtc);
 }
 
 static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -519,8 +520,7 @@ static int adp_drm_bind(struct device *dev)
 	struct adp_drv_private *adp = to_adp(drm);
 	int err;
 
-	adp_disable_vblank(adp);
-	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
+	writel(ADP_CTRL_FIFO_ON, adp->fe + ADP_CTRL);
 
 	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
 	if (IS_ERR(adp->next_bridge)) {

-- 
2.49.0


