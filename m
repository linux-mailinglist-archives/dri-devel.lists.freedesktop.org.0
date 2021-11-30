Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C4463867
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2826EA45;
	Tue, 30 Nov 2021 14:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 14:57:14 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA026EA39;
 Tue, 30 Nov 2021 14:57:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 311A7CE1A5A;
 Tue, 30 Nov 2021 14:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC81C53FC7;
 Tue, 30 Nov 2021 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283797;
 bh=YM1V19lHIjsuquMjNtvdmuRYuuAAXAGQ1W3TUWuVDCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B3Z625oHMEtv/wH7+l/zW3vl5DuG/c1Jk8t3Aq0TTZ4zgch8tpUFpN9neulAYPb0u
 ge3SWwM49YwF477IjCyKxsc5YQR2UnzFumfuTEA/7SOutDMRjygymlgAmaPAADF0Xv
 u4fQD8ExYhyl5PWFCTN8ipkxswCzg8/SLDLNgH2GGGtj/0GISaFfzVzNbrZwOBpsYg
 Zh9rJ71caYy2ulvFYGiOfKVoxRbEv/Y6a6p7QfpTT/rjS+XSW/b2ijn//cQ/V8NOq0
 21r7d61mztGc6lSnyrHFGtScxd/s3kYlW+csjFrHilHEESL+951gFKW3Ubibsi6Xco
 Ogbda8o++MvTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 59/68] drm/amdgpu: fix byteorder error in amdgpu
 discovery
Date: Tue, 30 Nov 2021 09:46:55 -0500
Message-Id: <20211130144707.944580-59-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Yang Wang <KevinYang.Wang@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 airlied@linux.ie, Bokun.Zhang@amd.com, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com, James.Zhu@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Wang <KevinYang.Wang@amd.com>

[ Upstream commit fd08953b2de911f32c06aedbc8ad111c2fd0168b ]

fix some byteorder issues about amdgpu discovery.
This will result in running errors on the big end system. (e.g:MIPS)

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index ada7bc19118ac..a12272a0c8844 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -190,8 +190,8 @@ static int amdgpu_discovery_init(struct amdgpu_device *adev)
 
 	offset = offsetof(struct binary_header, binary_checksum) +
 		sizeof(bhdr->binary_checksum);
-	size = bhdr->binary_size - offset;
-	checksum = bhdr->binary_checksum;
+	size = le16_to_cpu(bhdr->binary_size) - offset;
+	checksum = le16_to_cpu(bhdr->binary_checksum);
 
 	if (!amdgpu_discovery_verify_checksum(adev->mman.discovery_bin + offset,
 					      size, checksum)) {
@@ -212,7 +212,7 @@ static int amdgpu_discovery_init(struct amdgpu_device *adev)
 	}
 
 	if (!amdgpu_discovery_verify_checksum(adev->mman.discovery_bin + offset,
-					      ihdr->size, checksum)) {
+					      le16_to_cpu(ihdr->size), checksum)) {
 		DRM_ERROR("invalid ip discovery data table checksum\n");
 		r = -EINVAL;
 		goto out;
@@ -224,7 +224,7 @@ static int amdgpu_discovery_init(struct amdgpu_device *adev)
 	ghdr = (struct gpu_info_header *)(adev->mman.discovery_bin + offset);
 
 	if (!amdgpu_discovery_verify_checksum(adev->mman.discovery_bin + offset,
-				              ghdr->size, checksum)) {
+				              le32_to_cpu(ghdr->size), checksum)) {
 		DRM_ERROR("invalid gc data table checksum\n");
 		r = -EINVAL;
 		goto out;
@@ -395,10 +395,10 @@ void amdgpu_discovery_harvest_ip(struct amdgpu_device *adev)
 			le16_to_cpu(bhdr->table_list[HARVEST_INFO].offset));
 
 	for (i = 0; i < 32; i++) {
-		if (le32_to_cpu(harvest_info->list[i].hw_id) == 0)
+		if (le16_to_cpu(harvest_info->list[i].hw_id) == 0)
 			break;
 
-		switch (le32_to_cpu(harvest_info->list[i].hw_id)) {
+		switch (le16_to_cpu(harvest_info->list[i].hw_id)) {
 		case VCN_HWID:
 			vcn_harvest_count++;
 			break;
-- 
2.33.0

