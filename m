Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA3877DA9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 11:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2B10EC0D;
	Mon, 11 Mar 2024 10:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ORTXCwet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7610EC15
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hF7MKBWT2Tvtl6lljTSPRnLSiLr78K06aPXr+UOQg1Q=; b=ORTXCwetXJvREPggCl9BgJKktg
 se325fLlDm9Fozvomp7hjFosBdAzXAxwlGAcKhFeHw6tfRev2jHRE89DviICQvNmNFiuLwAz0iMO0
 oGJwTm0MH8tjtksAE/p98CU+63BRwZPUCPWKSCIzusqpHU9gY9+dJn5wlpMF7BXQCuh05yHhk0AR8
 YAEKhp8ghMKg15857ohov+NRBgZR4H76dYBySgIayY3LHsD3MYJAGKV1/EAHjgOD8f3RM06Dqm6Go
 l2hs0apHqG4i+GZ5muNlAvvGDYhG9/1Z2e6j3VM6kMHCVmMS/t2xJuKCa1kkzAqtxmO+zRolIC7l3
 2lieHTpA==;
Received: from [186.230.26.74] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjcbt-008ou6-0I; Mon, 11 Mar 2024 11:10:21 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/5] drm/v3d: Fix return if scheduler initialization fails
Date: Mon, 11 Mar 2024 07:05:58 -0300
Message-ID: <20240311100959.205545-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311100959.205545-1-mcanal@igalia.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the scheduler initialization fails, GEM initialization must fail as
well. Therefore, if `v3d_sched_init()` fails, free the DMA memory
allocated and return the error value in `v3d_gem_init()`.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index afc565078c78..66f4b78a6b2e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -290,8 +290,9 @@ v3d_gem_init(struct drm_device *dev)
 	ret = v3d_sched_init(v3d);
 	if (ret) {
 		drm_mm_takedown(&v3d->mm);
-		dma_free_coherent(v3d->drm.dev, 4096 * 1024, (void *)v3d->pt,
+		dma_free_coherent(v3d->drm.dev, pt_size, (void *)v3d->pt,
 				  v3d->pt_paddr);
+		return ret;
 	}

 	return 0;
--
2.43.0

