Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5C82A984
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98210E831;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F7D610E028;
 Thu, 11 Jan 2024 02:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=UYqqg+YYMRYSG+zlZs
 tZepXQitDokxntn9vsV7Aev34=; b=efQQGJpBRsNabI6WsVYUR2dV1yJgJhMsz9
 JMNBg7km+gx17zENtgP4sGRGC335MaIMbyc64tQmmz3Jb1TWIDdVQGox7dXKUU7A
 HqJbU3CZvbX7r9rfpl6Bd89f+PQvfL85/miMCYCuGm6UGsRT6PD6dY4YNrsyfYBW
 WTcrJUphw=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3X4X7UJ9lfpacAA--.59335S2;
 Thu, 11 Jan 2024 10:22:52 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, daniel@ffwll.ch, airlied@gmail.com,
 Xinhui.Pan@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_ib.c
Date: Thu, 11 Jan 2024 02:22:49 +0000
Message-Id: <20240111022249.6151-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X4X7UJ9lfpacAA--.59335S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryUWFWDAw1rtrWkKFy7GFg_yoWDCFb_CF
 WUJrn5Jr13urnFvr12vr45Z34vvF15uF4kWr12qF9ayry7Z3yUKryDKryrXw1ruas7CFnr
 X3s09rZ8Aa9xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhhixWVEuXnykAABsH
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: do not use assignment in if condition

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 6aa3b1d845ab..440e7aa45c66 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -191,9 +191,9 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned int num_ibs,
 	}
 
 	need_ctx_switch = ring->current_ctx != fence_ctx;
+	tmp = amdgpu_sync_get_fence(&job->explicit_sync);
 	if (ring->funcs->emit_pipeline_sync && job &&
-	    ((tmp = amdgpu_sync_get_fence(&job->explicit_sync)) ||
-	     (amdgpu_sriov_vf(adev) && need_ctx_switch) ||
+	    (tmp || (amdgpu_sriov_vf(adev) && need_ctx_switch) ||
 	     amdgpu_vm_need_pipeline_sync(ring, job))) {
 		need_pipe_sync = true;
 
-- 
2.17.1

