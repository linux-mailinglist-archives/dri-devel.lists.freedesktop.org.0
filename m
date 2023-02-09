Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695C690698
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F210E9BB;
	Thu,  9 Feb 2023 11:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEC10E9BB;
 Thu,  9 Feb 2023 11:18:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87E2A619C2;
 Thu,  9 Feb 2023 11:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57137C433EF;
 Thu,  9 Feb 2023 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941510;
 bh=zAo9TsQC68xc/QJJVVGTWGZL66ew9q/aKXOvgD9g8hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m4pcIqao5Dx+2Fm9YF/woLrodtrmyS8ImqXSn9P3GorLlUuCj52nZAsWhtnW4anQb
 CbBaTI4i2AqAurrWnHi/hSttaPsPyBlQwd73ox6r4Nq+J1+C/rcp2YapQxgIF3OTKz
 96qPTmMlPEdBTO9pM/W9Dn9i1Lbz3Zn62O/DDQbrQSlMRAlOfGa52BocD/P7zWQCas
 usktHiDpg2aCJEDm1RvBhTj5qD+KKckw5xpm5buelRz2OWDGMEiDxAjRbsHnINTXrZ
 N6mxYFG4X26clQFdHV9T90moCzTfLHrbWC3j+T1eVMWqttbih4+W/j2HirQ/37D8uK
 tJWsSszaiZfkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 16/17] drm/amd/display: Properly handle
 additional cases where DCN is not supported
Date: Thu,  9 Feb 2023 06:17:28 -0500
Message-Id: <20230209111731.1892569-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111731.1892569-1-sashal@kernel.org>
References: <20230209111731.1892569-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 6fc547a5a2ef5ce05b16924106663ab92f8f87a7 ]

There could be boards with DCN listed in IP discovery, but no
display hardware actually wired up.  In this case the vbios
display table will not be populated.  Detect this case and
skip loading DM when we detect it.

v2: Mark DCN as harvested as well so other display checks
elsewhere in the driver are handled properly.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a2d9e0af06544..1f7f424331e40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4428,6 +4428,17 @@ DEVICE_ATTR_WO(s3_debug);
 static int dm_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_mode_info *mode_info = &adev->mode_info;
+	struct atom_context *ctx = mode_info->atom_context;
+	int index = GetIndexIntoMasterTable(DATA, Object_Header);
+	u16 data_offset;
+
+	/* if there is no object header, skip DM */
+	if (!amdgpu_atom_parse_data_header(ctx, index, NULL, NULL, NULL, &data_offset)) {
+		adev->harvest_ip_mask |= AMD_HARVEST_IP_DMU_MASK;
+		dev_info(adev->dev, "No object header, skipping DM\n");
+		return -ENOENT;
+	}
 
 	switch (adev->asic_type) {
 #if defined(CONFIG_DRM_AMD_DC_SI)
-- 
2.39.0

