Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038AAA9F6E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42FD10E464;
	Mon,  5 May 2025 22:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RN9+Bjy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8810E461;
 Mon,  5 May 2025 22:23:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AA3061F1F;
 Mon,  5 May 2025 22:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E936C4CEED;
 Mon,  5 May 2025 22:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483795;
 bh=BkhcAlPlBh84hHlB+fG4PpMxy+yV46nOJg864LsmRAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RN9+Bjy0FByy9WrrjnidYQWVDKExvJzqEiKNMamje+KWCaEKkxIBWbH11YkbDatdu
 gmvLQbeWe44pbHW01dPGq7JUm54lBt5G0uC+YDX8CEoOp3I6kEIliCkqQDBU4UjYtn
 lN/bPnNsq/uTpQVR7T/NjdQ7r4QtRpPv+LI493oyEmgBF66tx4rQpK+UcHQ+UGQo5m
 7cFf3/C/GOaLBlA2M1bGhIFVJbHMAz0/kKPxG9kKrs8t6K14PzilqtxaDwfw6A4cFm
 mDmDb2gn1LfPqU6a3wRoc0WAirHD5EQ2iJkhng/gmLRMIKntnrpqE3fiRCSWZkBIrX
 PyYyZBlwFeFXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 ganglxie@amd.com, Stanley.Yang@amd.com, lijo.lazar@amd.com,
 candice.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 221/642] drm/amdgpu: increase RAS bad page
 threshold
Date: Mon,  5 May 2025 18:07:17 -0400
Message-Id: <20250505221419.2672473-221-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Tao Zhou <tao.zhou1@amd.com>

[ Upstream commit 334dc5fcc3f177823115ec4e075259997c16d4a7 ]

For default policy, driver will issue an RMA event when the number of
bad pages is greater than 8 physical rows, rather than reaches 8
physical rows, don't rely on threshold configurable parameters in
default mode.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 52c16bfeccaad..12ffe4a963d31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -748,7 +748,7 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
 	/* Modify the header if it exceeds.
 	 */
 	if (amdgpu_bad_page_threshold != 0 &&
-	    control->ras_num_bad_pages >= ras->bad_page_cnt_threshold) {
+	    control->ras_num_bad_pages > ras->bad_page_cnt_threshold) {
 		dev_warn(adev->dev,
 			"Saved bad pages %d reaches threshold value %d\n",
 			control->ras_num_bad_pages, ras->bad_page_cnt_threshold);
@@ -806,7 +806,7 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
 	 */
 	if (amdgpu_bad_page_threshold != 0 &&
 	    control->tbl_hdr.version == RAS_TABLE_VER_V2_1 &&
-	    control->ras_num_bad_pages < ras->bad_page_cnt_threshold)
+	    control->ras_num_bad_pages <= ras->bad_page_cnt_threshold)
 		control->tbl_rai.health_percent = ((ras->bad_page_cnt_threshold -
 						   control->ras_num_bad_pages) * 100) /
 						   ras->bad_page_cnt_threshold;
@@ -1451,7 +1451,7 @@ int amdgpu_ras_eeprom_check(struct amdgpu_ras_eeprom_control *control)
 				  res);
 			return -EINVAL;
 		}
-		if (ras->bad_page_cnt_threshold > control->ras_num_bad_pages) {
+		if (ras->bad_page_cnt_threshold >= control->ras_num_bad_pages) {
 			/* This means that, the threshold was increased since
 			 * the last time the system was booted, and now,
 			 * ras->bad_page_cnt_threshold - control->num_recs > 0,
-- 
2.39.5

