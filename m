Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE9686C09
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 17:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CAA10E181;
	Wed,  1 Feb 2023 16:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B580610E181;
 Wed,  1 Feb 2023 16:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zi8EsWtKNKNpDwGPJ8TEJ+gAgZj0idQ4gMzEDL664kM=; b=qNfANPVUkP2fitBuN5AzCOEM6K
 h3I4a5bKlX2coz/eEn5y0YN6DiJiHw6AuvxsWJwPJI1K9CjkR77tf/uK6OnuwaWpnKWFxACmXeEhf
 8mJU4T6JdSBzhkSmnPgcETTSE/LsiWE0559cSzqt4Ks53WwsIq4nK6FIdzG2kGjQP6SjqKkrxRnyG
 bUa/FSne60XE2yHS3pyqgj+Rmh/vK3Z54Wi/fRNvqch62iDbleyAW2/WBR16X9Vk0QVRQqVu29R/7
 dxOjQv7lLKQW59F+5YpySXrgPDECllQSMjiZTsTKDUB/+DGKBIxdzgk59oUUG3zyIMyPRM8FLG3BA
 AAmx7qoQ==;
Received: from [187.10.60.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pNGHb-006Vbw-Vt; Wed, 01 Feb 2023 17:48:29 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Date: Wed,  1 Feb 2023 13:48:14 -0300
Message-Id: <20230201164814.1353383-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
routine - such function is expected to be called only after the
respective init function - drm_sched_init() - was executed successfully.

Happens that we faced a driver probe failure in the Steam Deck
recently, and the function drm_sched_fini() was called even without
its counter-part had been previously called, causing the following oops:

amdgpu: probe of 0000:04:00.0 failed with error -110
BUG: kernel NULL pointer dereference, address: 0000000000000090
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP NOPTI
CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
[...]
Call Trace:
 <TASK>
 amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
 amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
 amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
 devm_drm_dev_init_release+0x49/0x70
 [...]

To prevent that, check if the drm_sched was properly initialized for a
given ring before calling its fini counter-part.

Notice ideally we'd use sched.ready for that; such field is set as the latest
thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
field - in the above oops for example, it was a GFX ring causing the crash, and
the sched.ready field was set to true in the ring init routine, regardless of
the state of the DRM scheduler. Hence, we ended-up using sched.ops as per
Christian's suggestion [0].

[0] https://lore.kernel.org/amd-gfx/984ee981-2906-0eaf-ccec-9f80975cb136@amd.com/

Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Guchun Chen <guchun.chen@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 00444203220d..3b962cb680a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
-		if (!ring->no_scheduler)
+		/*
+		 * Notice we check for sched.ops since there's some
+		 * override on the meaning of sched.ready by amdgpu.
+		 * The natural check would be sched.ready, which is
+		 * set as drm_sched_init() finishes...
+		 */
+		if (!ring->no_scheduler && ring->sched.ops)
 			drm_sched_fini(&ring->sched);
 
 		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
-- 
2.39.0

