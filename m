Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165C240DCC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 21:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37D56E19B;
	Mon, 10 Aug 2020 19:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AAC6E19A;
 Mon, 10 Aug 2020 19:11:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CC9E2078D;
 Mon, 10 Aug 2020 19:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086675;
 bh=HM15DRQruEOLK3MMp93V+owjUYiahA5zhe7I8I3MwYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UXrfmxFKNhmsuc4dMNeGbxUm+ekcmDgVh6NHHmGL1bscDyGD2yQMw52BcZFWumLoj
 HUarsb8bvCLBlR/IsTjeN6pSv8A+l4iyzZY8aqtvU/lRCdCdRwP+5hbFhUfUGEizjN
 YqdsuzRue4bVv81NnOTR2RlAxUt8x0uEh0+tZZMI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 34/60] drm/amdgpu/display: properly guard the
 calls to swSMU functions
Date: Mon, 10 Aug 2020 15:10:02 -0400
Message-Id: <20200810191028.3793884-34-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191028.3793884-1-sashal@kernel.org>
References: <20200810191028.3793884-1-sashal@kernel.org>
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
 Evan Quan <evan.quan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 4072327a2622af8688b88f5cd0a472136d3bf33d ]

It's only applicable on newer asics.  We could end up here when
using DC on older asics like SI or KV.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1170
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
index 7cee8070cb113..5c6a6ae48d396 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
@@ -106,7 +106,7 @@ bool dm_pp_apply_display_requirements(
 			adev->powerplay.pp_funcs->display_configuration_change(
 				adev->powerplay.pp_handle,
 				&adev->pm.pm_display_cfg);
-		else
+		else if (adev->smu.ppt_funcs)
 			smu_display_configuration_change(smu,
 							 &adev->pm.pm_display_cfg);
 
@@ -592,7 +592,7 @@ void pp_rv_set_wm_ranges(struct pp_smu *pp,
 	if (pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges)
 		pp_funcs->set_watermarks_for_clocks_ranges(pp_handle,
 							   &wm_with_clock_ranges);
-	else
+	else if (adev->smu.ppt_funcs)
 		smu_set_watermarks_for_clock_ranges(&adev->smu,
 				&wm_with_clock_ranges);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
