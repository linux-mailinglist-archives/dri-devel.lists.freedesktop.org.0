Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03EAAE751
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734810E86B;
	Wed,  7 May 2025 17:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="BWrXuOuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD910E869;
 Wed,  7 May 2025 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=mdvcmG+pr6izOQ7iKhUgbPE6Eufkwe+TQMBeVd0mk4o=; b=BWrXuOufb/Y9cgZi
 +OfTXNNxxg93bzC2uLEpWea9qvrYjUiZnoPMyMolIBNXSFs40EshAI59Rcs3T109JfPXYB+lJVvwt
 ELBY2IcHnEorneocHCreEe/Y3lnmwJ70AMJ+eKQY7/Y0Kn4wmH9xUbCayAYEndP4iUVSV1Vkmko4b
 2eRgNk4oxggzP7wxFS1BAjqJLuyZQJQMVW6/9wNyT7P4C4r/a62JhuMAU9T0rzn2GtBK01vnOim+0
 ySS4gVUYmmDhJ8uDZrD1LVqDUlxm0ObqlDIVAtkjhXeNJ6ifYA0mvj78x6rOYJu4n2GFBmZHLvykV
 8AyT+DVBeS/KNaCXLA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uCi9T-002EIU-1I;
 Wed, 07 May 2025 17:01:47 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] drm/amd/pm: Remove unused smu_mode2_reset_is_support
Date: Wed,  7 May 2025 18:01:44 +0100
Message-ID: <20250507170145.102508-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507170145.102508-1-linux@treblig.org>
References: <20250507170145.102508-1-linux@treblig.org>
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

smu_mode2_reset_is_support() was added in 2020 by
commit 5c03e5843e6b ("drm/amdgpu:add smu mode1/2 support for aldebaran")
but has remained unused.

See discussion at:
https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 13 -------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 46cce1d2aaf3..04bbeeac98a3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -3432,19 +3432,6 @@ bool smu_mode1_reset_is_support(struct smu_context *smu)
 	return ret;
 }
 
-bool smu_mode2_reset_is_support(struct smu_context *smu)
-{
-	bool ret = false;
-
-	if (!smu->pm_enabled)
-		return false;
-
-	if (smu->ppt_funcs && smu->ppt_funcs->mode2_reset_is_support)
-		ret = smu->ppt_funcs->mode2_reset_is_support(smu);
-
-	return ret;
-}
-
 int smu_mode1_reset(struct smu_context *smu)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index dd6d0e7aa242..a5ba37f57650 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1601,7 +1601,6 @@ int smu_get_power_limit(void *handle,
 			enum pp_power_type pp_power_type);
 
 bool smu_mode1_reset_is_support(struct smu_context *smu);
-bool smu_mode2_reset_is_support(struct smu_context *smu);
 int smu_mode1_reset(struct smu_context *smu);
 
 extern const struct amd_ip_funcs smu_ip_funcs;
-- 
2.49.0

