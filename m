Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98250C716A1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 00:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7610E269;
	Wed, 19 Nov 2025 23:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.b="mDlHjQLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1438 seconds by postgrey-1.36 at gabe;
 Wed, 19 Nov 2025 23:06:35 UTC
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [185.226.149.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17E10E269
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 23:06:35 +0000 (UTC)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david.laight.linux_spam@runbox.com>)
 id 1vLqsl-006ksI-Lg; Wed, 19 Nov 2025 23:42:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com; 
 s=selector1;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
 :Message-Id:Date:Subject:Cc:To:From;
 bh=KZaeZLqE5bpE2oI7JueUUAQfCDTGIs3rJJZPcaqXWlw=; b=mDlHjQLr3ylsbhaToLWMaW21yW
 3UVy21XkacH0+aMXmbQJGgcaEEUcpaPdkWRfbeLgpnQWeuE5UazmtfWFCAxw4PAywzYxbWcWRE5wi
 yydZf/9QgusRj2ZIM70TwSLTYD0H8U34DcCttEXjGzQbWV1vIw2D5mA1dbb/AfJUSZxy0gC0UxGzm
 3mhsqOossZ8FbtNoL7e/1hiK5mJJTtkE/SebrhXQF2cSm2NHVTf/4d9Tp7280RfRfVkSEXjg0swpr
 Gkjt72YT776jjIc8yqIXhdAFDxwNP31J3hEXpaDULau580GcJrDs4cTQLlPfzOIXGaBPL2mH0NWnz
 RW6tI2CQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <david.laight.linux_spam@runbox.com>)
 id 1vLqsk-00005F-RE; Wed, 19 Nov 2025 23:42:35 +0100
Received: by submission03.runbox with esmtpsa [Authenticated ID (1493616)]
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) id 1vLqsd-00Fos6-R9; Wed, 19 Nov 2025 23:42:27 +0100
From: david.laight.linux@gmail.com
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 David Laight <david.laight.linux@gmail.com>
Subject: [PATCH 19/44] drivers/gpu/drm/amd: use min() instead of min_t()
Date: Wed, 19 Nov 2025 22:41:15 +0000
Message-Id: <20251119224140.8616-20-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119224140.8616-1-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
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

From: David Laight <david.laight.linux@gmail.com>

min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
and so cannot discard significant bits.

min_t(u8, a, b) is particularly likely to be problematic

In this case I think the values are small enough that the result is ok.

Detected by an extra check added to min_t().

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index 3040437d99c2..1eb88327a18b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -211,8 +211,8 @@ int amdgpu_doorbell_init(struct amdgpu_device *adev)
 	adev->doorbell.size = pci_resource_len(adev->pdev, 2);
 
 	adev->doorbell.num_kernel_doorbells =
-		min_t(u32, adev->doorbell.size / sizeof(u32),
-		      adev->doorbell_index.max_assignment + 1);
+		min(adev->doorbell.size / sizeof(u32),
+		    adev->doorbell_index.max_assignment + 1);
 	if (adev->doorbell.num_kernel_doorbells == 0)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c1a801203949..124ce3e7310e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2388,7 +2388,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
 	if (amdgpu_vm_block_size != -1)
 		tmp >>= amdgpu_vm_block_size - 9;
 	tmp = DIV_ROUND_UP(fls64(tmp) - 1, 9) - 1;
-	adev->vm_manager.num_level = min_t(unsigned int, max_level, tmp);
+	adev->vm_manager.num_level = min(max_level, tmp);
 	switch (adev->vm_manager.num_level) {
 	case 3:
 		adev->vm_manager.root_level = AMDGPU_VM_PDB2;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 91c0188a29b2..0180675e76a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6257,7 +6257,7 @@ convert_color_depth_from_display_info(const struct drm_connector *connector,
 		 * or if this was called outside of atomic check, so it
 		 * can't be used directly.
 		 */
-		bpc = min_t(u8, bpc, requested_bpc);
+		bpc = umin(bpc, requested_bpc);
 
 		/* Round down to the nearest even number. */
 		bpc = bpc - (bpc & 1);
-- 
2.39.5

