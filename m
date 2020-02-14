Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3F15DC35
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213A06F9BE;
	Fri, 14 Feb 2020 15:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A026F9BE;
 Fri, 14 Feb 2020 15:52:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EBAA222C4;
 Fri, 14 Feb 2020 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695567;
 bh=vMAIxQCEcBteBvTjRTi8zaQHQRbcimfsWflvIWcKtRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDL04vJppJ0l+GABfBMUIv6b6NtLE2FsRO9U0wMUGo9gTfxkZId1yqNmCYbYSt1SA
 VIicDTk8+PyuIvvX7uVIohyZIK4hneJaJBgaHMVlZ2g5XhvY4pjj4Caq2+W/L5H8wy
 GLBvvxFABO79+xCE/Aw0g/zxdwG+PWAZDME+Xoho=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 179/542] Revert "drm/amdgpu: enable VCN DPG on
 Raven and Raven2"
Date: Fri, 14 Feb 2020 10:42:51 -0500
Message-Id: <20200214154854.6746-179-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thong Thai <thong.thai@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thong Thai <thong.thai@amd.com>

[ Upstream commit d515959125f24767d02e82587a11e444eeba0e7b ]

This reverts commit a4840d91c984f93b2acdcd44441d624bbc1af0d2.

Reverting due to power efficiency issues seen on Raven 1 and 2
when DPG mode is enabled.

Signed-off-by: Thong Thai <thong.thai@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 8e1640bc07aff..04ea7cd692955 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1145,9 +1145,7 @@ static int soc15_common_early_init(void *handle)
 				AMD_CG_SUPPORT_SDMA_LS |
 				AMD_CG_SUPPORT_VCN_MGCG;
 
-			adev->pg_flags = AMD_PG_SUPPORT_SDMA |
-				AMD_PG_SUPPORT_VCN |
-				AMD_PG_SUPPORT_VCN_DPG;
+			adev->pg_flags = AMD_PG_SUPPORT_SDMA | AMD_PG_SUPPORT_VCN;
 		} else if (adev->pdev->device == 0x15d8) {
 			adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 				AMD_CG_SUPPORT_GFX_MGLS |
@@ -1190,9 +1188,7 @@ static int soc15_common_early_init(void *handle)
 				AMD_CG_SUPPORT_SDMA_LS |
 				AMD_CG_SUPPORT_VCN_MGCG;
 
-			adev->pg_flags = AMD_PG_SUPPORT_SDMA |
-				AMD_PG_SUPPORT_VCN |
-				AMD_PG_SUPPORT_VCN_DPG;
+			adev->pg_flags = AMD_PG_SUPPORT_SDMA | AMD_PG_SUPPORT_VCN;
 		}
 		break;
 	case CHIP_ARCTURUS:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
