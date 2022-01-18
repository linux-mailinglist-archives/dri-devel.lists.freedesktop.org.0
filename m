Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1CE491539
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196E61128D3;
	Tue, 18 Jan 2022 02:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B51128D4;
 Tue, 18 Jan 2022 02:27:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59F2E6119A;
 Tue, 18 Jan 2022 02:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7423AC36AE3;
 Tue, 18 Jan 2022 02:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472819;
 bh=I1V/IFg+vIvu92mF4fyATCy5Y+5SKhi/PFtWjx0XmD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iSFN+b1lLjiwOHxCBjHLqLNui1ULIlNsizdPhN1fEmX9zl2Y1Vy7QyJs2VZAyjOfC
 6D259GlBhQmvBGDJoqq5luWK4l8JDTzhjOr61jSD+OldXvmHCLjsKAiaKVyjepFyDw
 h0V1tzFX0LPPfuq0orfNzVD5KRSnm2RvLpDFHk/w45RaumYVvHzqxC3Izbv4UnzfrC
 onUen+AE/ptKjXJA1t30oF7fUYMyKN16IxV9CBz13ZDNl8UOcgWnRB9azJUA945nAf
 FTgmcIS77Fg/06tcvevFL63b4WOLNmnlVouXE2t7jMbFW3SLeHIijY8aWDZqCjhcsh
 exzi74DObR2Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 141/217] drm/amd/amdgpu: fix gmc bo pin count
 leak in SRIOV
Date: Mon, 17 Jan 2022 21:18:24 -0500
Message-Id: <20220118021940.1942199-141-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
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
Cc: alex.sierra@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Xiaomeng.Hou@amd.com, PengJu.Zhou@amd.com, victor.skvortsov@amd.com,
 Sasha Levin <sashal@kernel.org>, Horace Chen <horace.chen@amd.com>,
 Oak.Zeng@amd.com, aaron.liu@amd.com, amd-gfx@lists.freedesktop.org,
 Yuliang.Shi@amd.com, Philip.Yang@amd.com, Felix.Kuehling@amd.com,
 John.Clements@amd.com, Jack.Gui@amd.com, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Xinhui.Pan@amd.com, ray.huang@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jingwen Chen <Jingwen.Chen2@amd.com>

[ Upstream commit 948e7ce01413b71395723aaf846015062aea3a43 ]

[Why]
gmc bo will be pinned during loading amdgpu and reset in SRIOV while
only unpinned in unload amdgpu

[How]
add amdgpu_in_reset and sriov judgement to skip pin bo

v2: fix wrong judgement

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Reviewed-by: Horace Chen <horace.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 3ec5ff5a6dbe6..61ec6145bbb16 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -992,10 +992,14 @@ static int gmc_v10_0_gart_enable(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev))
+		goto skip_pin_bo;
+
 	r = amdgpu_gart_table_vram_pin(adev);
 	if (r)
 		return r;
 
+skip_pin_bo:
 	r = adev->gfxhub.funcs->gart_enable(adev);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index d84523cf5f759..4420c264c554c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1714,10 +1714,14 @@ static int gmc_v9_0_gart_enable(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev))
+		goto skip_pin_bo;
+
 	r = amdgpu_gart_table_vram_pin(adev);
 	if (r)
 		return r;
 
+skip_pin_bo:
 	r = adev->gfxhub.funcs->gart_enable(adev);
 	if (r)
 		return r;
-- 
2.34.1

