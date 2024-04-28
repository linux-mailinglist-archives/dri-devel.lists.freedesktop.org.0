Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0D8B4BCE
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4A710FC43;
	Sun, 28 Apr 2024 12:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IF/tZZan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590210FC43
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mRwUUcEWjNGQbM5yIHWrm2kzVzw6VyZR7stXw+y5Y70=; b=IF/tZZan5hTMKs269lsBlSMzzG
 UpFTFS5+wogV3LITCMjIUcNhQYzXj+lzmac80x1cxw9Jg6uhyzhw24qMUSOAkr8bhlCg5RTt29WlC
 RqhFc204ZEQLdio+IVLfNPr/rHVEwmIEV0Rby7NtkdWB7J2TAL6ICTUS6V0vugJvaN2gYCA+CB+Y9
 4ri1fvRhB4AJFFfvORxXNF30UE8c592DoAgcdvTHROZJE0PUHliE4PKbElqxSCEB82pG+DEFhPkgu
 YGM8aWIO15YcEmH7PjvQ4jyinnIswIcQuJ3Wt6RrnJUFZxpU9JXCQ1Ta66t9xNzyV9RCaEvl9R7Xz
 ErQYJK9w==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s13tl-000rbP-EI; Sun, 28 Apr 2024 14:44:53 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 1/8] drm/v3d: Fix return if scheduler initialization fails
Date: Sun, 28 Apr 2024 09:40:06 -0300
Message-ID: <20240428124426.309096-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428124426.309096-1-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
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
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index da8faf3b9011..b3b76332f2c5 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -291,8 +291,9 @@ v3d_gem_init(struct drm_device *dev)
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
2.44.0

