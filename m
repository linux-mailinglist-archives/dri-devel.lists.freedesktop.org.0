Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DA58FF62
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2D2B4320;
	Thu, 11 Aug 2022 15:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E81EB4320;
 Thu, 11 Aug 2022 15:29:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77D57B82154;
 Thu, 11 Aug 2022 15:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E47C433D6;
 Thu, 11 Aug 2022 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231754;
 bh=S+9wRYp0p0oEdN+PIYmEdODlGUmWCcf3Hu8qY0WNB1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=beFc+aUBnZ4HQEc63LsqLGmIRz+tIOngEcXobVpyUsP9KFRtXaXrOVkU08b2atpr5
 oW2mwoAnMGpK12iFnPt81dOTCNjsDSWGAfDCrJfU89+NFC0Tr+O0VX3Ves1/XR9Hok
 a/HfDHxz00B+9+r5VPQjHylDUq6a3tPNSFl3He7UiS0KKJXe8dbfCE8gWJoImBLp9L
 N/a1wpoNNVUKHN/sNXZAhtbImp8Tlkr1ox06tp6di0mSO/gdYI2HyoywEMzmr8IyvX
 0aPXyu6vNF2lg7nqnKLjbf14IA3r8SGgZCVDQzfrLKUL/ugnY871YILS6ZaIBzKy5p
 VtmaJJXtyly9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 005/105] drm/nouveau: clear output poll workers
 before nouveau_fbcon_destroy()
Date: Thu, 11 Aug 2022 11:26:49 -0400
Message-Id: <20220811152851.1520029-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Mark Menzynski <mmenzyns@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Menzynski <mmenzyns@redhat.com>

[ Upstream commit 6b03816f869529393b37d03e5d75b68f7365a7a4 ]

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini()
and display_fini(), where if output poll happens, it crashes.

This patch introduces another output poll clearing before fbcon
resources are destroyed.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220523113541.10562-1-mmenzyns@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4f9b3aa5deda..5226323e55d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -39,6 +39,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_atomic.h>
@@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
 	if (!drm->fbcon)
 		return;
 
+	drm_kms_helper_poll_fini(dev);
 	nouveau_fbcon_accel_fini(dev);
 	nouveau_fbcon_destroy(dev, drm->fbcon);
 	kfree(drm->fbcon);
-- 
2.35.1

