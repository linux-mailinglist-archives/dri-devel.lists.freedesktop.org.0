Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2E97E497
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 03:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1110E35C;
	Mon, 23 Sep 2024 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="qkgRhM5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97110E35B;
 Mon, 23 Sep 2024 01:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Rz0QSDeykvTiESrk8g5g5XNM5hvpuDENvkUjExEkk/Q=; b=qkgRhM5dLdt/tp3U
 X23UPp0rehugemRAc/OZ29/NXSmwNO4rgMZ4P9AgJ/0HeUka/fDv+hK2e6XGIPQOH1UY9uAD5pjwz
 ASCMH6+zsUCEYxSdJ93f7Jb5VNmtCPU8PdK6p5OfwdhqKN2qXJwTByCtBq9hmHO7GsLtH+nC74yGu
 TQ2sZdMYn+vnEXkMc/aNV5HzHX7Iz4L1RmUkGyy4JQp+lZW/od1G8VZLJPl+fxDrJ22N4JdJd62H3
 P+IyaoZy7Otf4TaONUsot1WWluKMGCzVs9+cDIlhz8wmSmC8QrAIdQXx2WGSCU7YEeX65LeWaS1Ld
 pVYufPdpxGAXEuvu5Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1ssXoy-006k2k-2f;
 Mon, 23 Sep 2024 01:25:00 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/5] drm/amdgpu: Remove unused amdgpu_gfx_bit_to_me_queue
Date: Mon, 23 Sep 2024 02:24:45 +0100
Message-ID: <20240923012446.4965-5-linux@treblig.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923012446.4965-1-linux@treblig.org>
References: <20240923012446.4965-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

amdgpu_gfx_bit_to_me_queue has been unused since it was added in
commit 7470bfcf2014 ("drm/amdgpu: add helper function for gfx queue/bitmap
transition")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 10 ----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 83e54697f0ee..0fbb7c7b736d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -87,16 +87,6 @@ int amdgpu_gfx_me_queue_to_bit(struct amdgpu_device *adev,
 	return bit;
 }
 
-void amdgpu_gfx_bit_to_me_queue(struct amdgpu_device *adev, int bit,
-				int *me, int *pipe, int *queue)
-{
-	*queue = bit % adev->gfx.me.num_queue_per_pipe;
-	*pipe = (bit / adev->gfx.me.num_queue_per_pipe)
-		% adev->gfx.me.num_pipe_per_me;
-	*me = (bit / adev->gfx.me.num_queue_per_pipe)
-		/ adev->gfx.me.num_pipe_per_me;
-}
-
 bool amdgpu_gfx_is_me_queue_enabled(struct amdgpu_device *adev,
 				    int me, int pipe, int queue)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index 5644e10a86a9..f710178a21bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -540,8 +540,6 @@ bool amdgpu_gfx_is_high_priority_graphics_queue(struct amdgpu_device *adev,
 						struct amdgpu_ring *ring);
 int amdgpu_gfx_me_queue_to_bit(struct amdgpu_device *adev, int me,
 			       int pipe, int queue);
-void amdgpu_gfx_bit_to_me_queue(struct amdgpu_device *adev, int bit,
-				int *me, int *pipe, int *queue);
 bool amdgpu_gfx_is_me_queue_enabled(struct amdgpu_device *adev, int me,
 				    int pipe, int queue);
 void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable);
-- 
2.46.1

