Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100C943A70
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795610E73C;
	Thu,  1 Aug 2024 00:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lMfGTqlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1756F10E73C;
 Thu,  1 Aug 2024 00:15:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7954461345;
 Thu,  1 Aug 2024 00:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFE2C32786;
 Thu,  1 Aug 2024 00:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471306;
 bh=XtOBmbJSSX8k8FaJ6jexWUTSzNVx8y3Ygud8egqr274=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lMfGTqlBGQV3JD7jXGFGClRCZrXQY8Hy48po3toNlxl0T1UlOfXdsGZHU22KK2su9
 Kq1sLhYxtkUOUQr1sSpL3I5KnBLeaokEJpgaGA/p9WEsYtAUXgAOAONKkltdOyHANX
 KJzSA16UvEsCD7rrvpAL6BHYUltMdAwdJFGyhpY1vXt68IS+zkmA3Rzy/tMftoI2/r
 RM2s0mS1JwyTyrQrshwrJwCzICtS06R5/Me/ezTL2OiH94/zDJCxINz9F+EFoOaRfP
 arTgc/ndSYExobFQez5QvPisILFGEUWPOmqRMbc5qk+sIq4YJageWyoi4XcNn9eOdm
 czPevMpXvGlQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, yifan1.zhang@amd.com, Likun.Gao@amd.com,
 le.ma@amd.com, Prike.Liang@amd.com, Lang.Yu@amd.com, lijo.lazar@amd.com,
 victorchengchi.lu@amd.com, Jun.Ma2@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 064/121] drm/amdgu: fix Unintentional integer
 overflow for mall size
Date: Wed, 31 Jul 2024 20:00:02 -0400
Message-ID: <20240801000834.3930818-64-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit c09d2eff81a997c169e0cacacd6b60c5e3aa33f2 ]

Potentially overflowing expression mall_size_per_umc * adev->gmc.num_umc with type unsigned int (32 bits, unsigned)
is evaluated using 32-bit arithmetic,and then used in a context that expects an expression of type u64 (64 bits, unsigned).

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 0e31bdb4b7cb6..71db111e20f80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1595,7 +1595,7 @@ static int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
 		break;
 	case 2:
 		mall_size_per_umc = le32_to_cpu(mall_info->v2.mall_size_per_umc);
-		adev->gmc.mall_size = mall_size_per_umc * adev->gmc.num_umc;
+		adev->gmc.mall_size = (uint64_t)mall_size_per_umc * adev->gmc.num_umc;
 		break;
 	default:
 		dev_err(adev->dev,
-- 
2.43.0

