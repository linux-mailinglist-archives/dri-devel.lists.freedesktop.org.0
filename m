Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C71378ED
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 23:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E76E0DD;
	Fri, 10 Jan 2020 22:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6846E0DB;
 Fri, 10 Jan 2020 22:05:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96BBE20721;
 Fri, 10 Jan 2020 22:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578693938;
 bh=NFxnKCjBfr6dkSPF25OUS484+i8f0PDBqaTCmWfvZms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l4QuiagtMJttk9Qs6gQcAAmgjDsOvoIuELMOtfXKbKbt2toPBTPFZ7SmvYg5ku7Oj
 6EPegODyv53pgOp+68hShFtQ+YCxa/V7lf8WFZTk0ABdA9St8IwunguX6KABPSaGVT
 9/SFwHlQpWsWGM1mEk2IQ/OqMKWTCQEzNkDgpFpE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 20/26] drm/amdgpu: enable gfxoff for raven1 refresh
Date: Fri, 10 Jan 2020 17:05:13 -0500
Message-Id: <20200110220519.28250-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110220519.28250-1-sashal@kernel.org>
References: <20200110220519.28250-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 changzhu <Changfeng.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: changzhu <Changfeng.Zhu@amd.com>

[ Upstream commit e0c63812352298efbce2a71483c1dab627d0c288 ]

When smu version is larger than 0x41e2b, it will load
raven_kicker_rlc.bin.To enable gfxoff for raven_kicker_rlc.bin,it
needs to avoid adev->pm.pp_feature &= ~PP_GFXOFF_MASK when it loads
raven_kicker_rlc.bin.

Signed-off-by: changzhu <Changfeng.Zhu@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index c9ba2ec6d038..ab4a0d8545dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1038,17 +1038,10 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 	case CHIP_VEGA20:
 		break;
 	case CHIP_RAVEN:
-		/* Disable GFXOFF on original raven.  There are combinations
-		 * of sbios and platforms that are not stable.
-		 */
-		if (!(adev->rev_id >= 0x8 || adev->pdev->device == 0x15d8))
-			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
-		else if (!(adev->rev_id >= 0x8 || adev->pdev->device == 0x15d8)
-			 &&((adev->gfx.rlc_fw_version != 106 &&
-			     adev->gfx.rlc_fw_version < 531) ||
-			    (adev->gfx.rlc_fw_version == 53815) ||
-			    (adev->gfx.rlc_feature_version < 1) ||
-			    !adev->gfx.rlc.is_rlc_v2_1))
+		if (!(adev->rev_id >= 0x8 ||
+		      adev->pdev->device == 0x15d8) &&
+		    (adev->pm.fw_version < 0x41e2b || /* not raven1 fresh */
+		     !adev->gfx.rlc.is_rlc_v2_1)) /* without rlc save restore ucodes */
 			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 
 		if (adev->pm.pp_feature & PP_GFXOFF_MASK)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
