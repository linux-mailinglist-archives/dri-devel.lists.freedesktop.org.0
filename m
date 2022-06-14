Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8F54A3FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045810FAB1;
	Tue, 14 Jun 2022 02:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066310FF5A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:04:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2BFFB80AC1;
 Tue, 14 Jun 2022 02:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5985FC341C0;
 Tue, 14 Jun 2022 02:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172292;
 bh=Oe8B+tchnVatPgmf1JiGtjFdAcKA9NcNW0/WlQM8Gcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OeQqYRgsvk+3iLA9dS7J7D7ooxRZakatdI4/61IimsQ9LbUY2zNxCKA88CgDW58dL
 ye6b5ISWOdTbQLM/guQRiE8HN6G0K3lctxWwNgFG4jlKIX5c/jfQGwQ239pPOApUYf
 4+gjUEa8n0qyPB0RjYGq5OF1+rutNAvc5je8VNvH278MVx50a32HmTN1zAMOThp1iM
 fnFlvwb3kDEwFwryFZ2YymctTLrglvWoYRvOibh0MldyWI9o+1kF9ypxmprGFQ6/lG
 FtsfzHLRmqIlKEIvF8HyL+gdk6e3FjrQ3GNajgKo8FVkLN5X+vCjlxzJunqUVNPqF3
 Ke9f6fOublZYw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 05/47] drm/amdgpu: Resolve RAS GFX error count
 issue after cold boot on Arcturus
Date: Mon, 13 Jun 2022 22:03:58 -0400
Message-Id: <20220614020441.1098348-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020441.1098348-1-sashal@kernel.org>
References: <20220614020441.1098348-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <candice.li@amd.com>, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Candice Li <candice.li@amd.com>

[ Upstream commit 2a460963350ec6b1534d28d7f943b5f84815aff2 ]

Adjust the sequence for ras late init and separate ras reset error status
from query status.

v2: squash in fix from Candice

Signed-off-by: Candice Li <candice.li@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  9 ++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 27 ++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 28a736c507bb..bd3b32e5ba9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -625,17 +625,20 @@ int amdgpu_get_gfx_off_status(struct amdgpu_device *adev, uint32_t *value)
 int amdgpu_gfx_ras_late_init(struct amdgpu_device *adev, struct ras_common_if *ras_block)
 {
 	int r;
-	r = amdgpu_ras_block_late_init(adev, ras_block);
-	if (r)
-		return r;
 
 	if (amdgpu_ras_is_supported(adev, ras_block->block)) {
 		if (!amdgpu_persistent_edc_harvesting_supported(adev))
 			amdgpu_ras_reset_error_status(adev, AMDGPU_RAS_BLOCK__GFX);
 
+		r = amdgpu_ras_block_late_init(adev, ras_block);
+		if (r)
+			return r;
+
 		r = amdgpu_irq_get(adev, &adev->gfx.cp_ecc_error_irq, 0);
 		if (r)
 			goto late_fini;
+	} else {
+		amdgpu_ras_feature_enable_on_boot(adev, ras_block, 0);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 424c22a841f4..3f96dadf2698 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -195,6 +195,13 @@ static ssize_t amdgpu_ras_debugfs_read(struct file *f, char __user *buf,
 	if (amdgpu_ras_query_error_status(obj->adev, &info))
 		return -EINVAL;
 
+	/* Hardware counter will be reset automatically after the query on Vega20 and Arcturus */
+	if (obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
+	    obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+		if (amdgpu_ras_reset_error_status(obj->adev, info.head.block))
+			dev_warn(obj->adev->dev, "Failed to reset error counter and error status");
+	}
+
 	s = snprintf(val, sizeof(val), "%s: %lu\n%s: %lu\n",
 			"ue", info.ue_count,
 			"ce", info.ce_count);
@@ -548,9 +555,10 @@ static ssize_t amdgpu_ras_sysfs_read(struct device *dev,
 	if (amdgpu_ras_query_error_status(obj->adev, &info))
 		return -EINVAL;
 
-	if (obj->adev->asic_type == CHIP_ALDEBARAN) {
+	if (obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
+	    obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
 		if (amdgpu_ras_reset_error_status(obj->adev, info.head.block))
-			DRM_WARN("Failed to reset error counter and error status");
+			dev_warn(obj->adev->dev, "Failed to reset error counter and error status");
 	}
 
 	return sysfs_emit(buf, "%s: %lu\n%s: %lu\n", "ue", info.ue_count,
@@ -1023,9 +1031,6 @@ int amdgpu_ras_query_error_status(struct amdgpu_device *adev,
 		}
 	}
 
-	if (!amdgpu_persistent_edc_harvesting_supported(adev))
-		amdgpu_ras_reset_error_status(adev, info->head.block);
-
 	return 0;
 }
 
@@ -1145,6 +1150,12 @@ int amdgpu_ras_query_error_count(struct amdgpu_device *adev,
 		if (res)
 			return res;
 
+		if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
+		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+			if (amdgpu_ras_reset_error_status(adev, info.head.block))
+				dev_warn(adev->dev, "Failed to reset error counter and error status");
+		}
+
 		ce += info.ce_count;
 		ue += info.ue_count;
 	}
@@ -1705,6 +1716,12 @@ static void amdgpu_ras_log_on_err_counter(struct amdgpu_device *adev)
 			continue;
 
 		amdgpu_ras_query_error_status(adev, &info);
+
+		if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
+		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+			if (amdgpu_ras_reset_error_status(adev, info.head.block))
+				dev_warn(adev->dev, "Failed to reset error counter and error status");
+		}
 	}
 }
 
-- 
2.35.1

