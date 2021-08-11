Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC73E9658
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 18:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0E6E17F;
	Wed, 11 Aug 2021 16:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1E7F6E17E;
 Wed, 11 Aug 2021 16:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1A5A320201A;
 Wed, 11 Aug 2021 18:52:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JdErpEBxcgcx; Wed, 11 Aug 2021 18:52:12 +0200 (CEST)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id A652D20201B;
 Wed, 11 Aug 2021 18:52:12 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mDrSd-0001mj-Hc; Wed, 11 Aug 2021 18:52:11 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Date: Wed, 11 Aug 2021 18:52:11 +0200
Message-Id: <20210811165211.6811-2-michel@daenzer.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811165211.6811-1-michel@daenzer.net>
References: <20210811165211.6811-1-michel@daenzer.net>
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

From: Michel Dänzer <mdaenzer@redhat.com>

In contrast to schedule_delayed_work, this pushes back the work if it
was already scheduled before. Specific behaviour change:

Before:

The scheduled work ran ~1 second after the first time ring_end_use was
called, even if the ring was used again during that second.

After:

The scheduled work runs ~1 second after the last time ring_end_use is
called.

Inspired by the corresponding change in amdgpu_gfx_off_ctrl. While I
haven't run into specific issues in this case, the new behaviour makes
more sense to me.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 8996cb4ed57a..2c0040153f6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -110,7 +110,7 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring *ring)
 void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)
 {
 	atomic_dec(&ring->adev->jpeg.total_submission_cnt);
-	schedule_delayed_work(&ring->adev->jpeg.idle_work, JPEG_IDLE_TIMEOUT);
+	mod_delayed_work(system_wq, &ring->adev->jpeg.idle_work, JPEG_IDLE_TIMEOUT);
 }
 
 int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 0f576f294d8a..b6b1d7eeb8e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1283,7 +1283,7 @@ void amdgpu_uvd_ring_begin_use(struct amdgpu_ring *ring)
 void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)
 {
 	if (!amdgpu_sriov_vf(ring->adev))
-		schedule_delayed_work(&ring->adev->uvd.idle_work, UVD_IDLE_TIMEOUT);
+		mod_delayed_work(system_wq, &ring->adev->uvd.idle_work, UVD_IDLE_TIMEOUT);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 1ae7f824adc7..2253c18a6688 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -401,7 +401,7 @@ void amdgpu_vce_ring_begin_use(struct amdgpu_ring *ring)
 void amdgpu_vce_ring_end_use(struct amdgpu_ring *ring)
 {
 	if (!amdgpu_sriov_vf(ring->adev))
-		schedule_delayed_work(&ring->adev->vce.idle_work, VCE_IDLE_TIMEOUT);
+		mod_delayed_work(system_wq, &ring->adev->vce.idle_work, VCE_IDLE_TIMEOUT);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 284bb42d6c86..d5937ab5ac80 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1874,7 +1874,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring *ring, bool set_clocks)
 
 void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
 {
-	schedule_delayed_work(&ring->adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
+	mod_delayed_work(system_wq, &ring->adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
 	mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
 }
 
-- 
2.32.0

