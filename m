Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896455A69FE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A842A10E28F;
	Tue, 30 Aug 2022 17:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560FB10E289;
 Tue, 30 Aug 2022 17:25:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDB8F617B4;
 Tue, 30 Aug 2022 17:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F60C433D7;
 Tue, 30 Aug 2022 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880300;
 bh=J6bY75iJ1h9Z6yJ8vIVGtMGTgX8TS40R6GyThvgxfUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KeQXygwVoOcxj6CJAog5pvXYX2H568UcRHied7auerHgxXeaYV7cWk1/+qRBBl9iy
 FR+hQX7jdUBweknX52Nks3tNu7rFu7EtAiznnUgPRamz3/bMo7UJdGAj5c4DzV8Gop
 DCdRAclop6c6WW5LNXcA3VgVBVFajvs6LaDLZ0hm4m0sy4bbsYJi8qBiuBt61UVP0h
 0H6K5FGywApgyqdOqBbfc5M1+CjQGRJb51UACVDDUEW0XYBXysCN4g1PTFrf/A8mob
 aubjRK3MbkrVqbzDG1ofpKLzmX1Z1NqnMpWb4lZdmanD7vZEOD+0L49JcsQB/3K9gv
 nfKMBg5rMAKGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/12] drm/amdgpu: Check num_gfx_rings for gfx
 v9_0 rb setup.
Date: Tue, 30 Aug 2022 13:24:35 -0400
Message-Id: <20220830172444.581654-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172444.581654-1-sashal@kernel.org>
References: <20220830172444.581654-1-sashal@kernel.org>
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
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, evan.quan@amd.com,
 desowin@gmail.com, victor.skvortsov@amd.com, YiPeng.Chai@amd.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
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
index 5906a8951a6c6..685a2df01d096 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2472,7 +2472,8 @@ static void gfx_v9_0_constants_init(struct amdgpu_device *adev)
 
 	gfx_v9_0_tiling_mode_table_init(adev);
 
-	gfx_v9_0_setup_rb(adev);
+	if (adev->gfx.num_gfx_rings)
+		gfx_v9_0_setup_rb(adev);
 	gfx_v9_0_get_cu_info(adev, &adev->gfx.cu_info);
 	adev->gfx.config.db_debug2 = RREG32_SOC15(GC, 0, mmDB_DEBUG2);
 
-- 
2.35.1

