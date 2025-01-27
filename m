Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF8A1DA1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 17:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5699D10E577;
	Mon, 27 Jan 2025 16:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC7710E576
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 16:03:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tcRZi-00014q-Ei; Mon, 27 Jan 2025 17:02:58 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1tcRZi-0029IM-0N;
 Mon, 27 Jan 2025 17:02:58 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: restore wait-free fastpath for GEM_WAIT_IDLE
Date: Mon, 27 Jan 2025 17:02:58 +0100
Message-Id: <20250127160258.289035-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

This effectively reverts 0fea2ed61e7f ("drm/amdgpu: Remove call to
reservation_object_test_signaled_rcu before wait"), as the premise of
that commit is wrong. dma_resv_wait_timeout() without a timeout will
not turn into a wait-free dma_resv_test_signaled, but will wait a
jiffy for unsignaled fences, which is not at all what userspace expects
when it calls GEM_WAIT_IDLE with a timeout of 0.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
This is most likely the correct kernel-side solution for the unexpected
slowdown worked around with in userspace with this Mesa series:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32877
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1a5df8b94661..75b5d5149911 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -567,8 +567,13 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	robj = gem_to_amdgpu_bo(gobj);
-	ret = dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_READ,
-				    true, timeout);
+	if (timeout == 0)
+		ret = dma_resv_test_signaled(robj->tbo.base.resv,
+					     DMA_RESV_USAGE_READ);
+	else
+		ret = dma_resv_wait_timeout(robj->tbo.base.resv,
+					    DMA_RESV_USAGE_READ,
+					    true, timeout);
 
 	/* ret == 0 means not signaled,
 	 * ret > 0 means signaled
-- 
2.48.1

