Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269325A6A1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568C110E2A2;
	Tue, 30 Aug 2022 17:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7916D10E299;
 Tue, 30 Aug 2022 17:25:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07BEF617C0;
 Tue, 30 Aug 2022 17:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375D2C433D7;
 Tue, 30 Aug 2022 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880351;
 bh=57IC6E6AX7usppRwB0rZ/Wdn5wt79iBpTKmZzSEOBwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CmWRB3vFCBmQO89hzhadFWV1lPX+6cW7W+FSjsq7v1HaXFx6dlFRcEeXlDRjvE1fH
 zr/XrxsRSeivxRhqiiMU1EOVbo6hAY3rZqarHfbbZBf8eO5waL+bMnezDuqbq+An6g
 kDl8S9zdA67fbe8IY7hQHMD8vgwHnc9R0ffiP4B2PWg/B2zssssNPo4OJaPsbygInu
 RLbc/vNpw5YNiyO3rkEeE937PQFEkKREvCl758txt2qJeV11kJeNwqOAdONO6pzDQ2
 ovcS6nsH/xlgd+6L2MmLx97e9i0ESaKLaY+lXxCeHhHGKIKNe7+n/V3MiI/YMz6VYI
 zD09r/JVV7G/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/10] drm/amdgpu: Check num_gfx_rings for gfx
 v9_0 rb setup.
Date: Tue, 30 Aug 2022 13:25:33 -0400
Message-Id: <20220830172541.581820-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172541.581820-1-sashal@kernel.org>
References: <20220830172541.581820-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, ricetons@gmail.com, amd-gfx@lists.freedesktop.org,
 victor.skvortsov@amd.com, le.ma@amd.com, YiPeng.Chai@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <candice.li@amd.com>, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Candice Li <candice.li@amd.com>

[ Upstream commit c351938350ab9b5e978dede2c321da43de7eb70c ]

No need to set up rb when no gfx rings.

Signed-off-by: Candice Li <candice.li@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index d8ae6a23e6133..d36bea68a67e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1771,7 +1771,8 @@ static void gfx_v9_0_gpu_init(struct amdgpu_device *adev)
 
 	gfx_v9_0_tiling_mode_table_init(adev);
 
-	gfx_v9_0_setup_rb(adev);
+	if (adev->gfx.num_gfx_rings)
+		gfx_v9_0_setup_rb(adev);
 	gfx_v9_0_get_cu_info(adev, &adev->gfx.cu_info);
 	adev->gfx.config.db_debug2 = RREG32_SOC15(GC, 0, mmDB_DEBUG2);
 
-- 
2.35.1

