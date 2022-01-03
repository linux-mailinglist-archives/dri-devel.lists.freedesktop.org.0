Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D861F4835B1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD289E39;
	Mon,  3 Jan 2022 17:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB46089E3B;
 Mon,  3 Jan 2022 17:29:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6ACE961178;
 Mon,  3 Jan 2022 17:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2737C36AED;
 Mon,  3 Jan 2022 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230977;
 bh=ercU/zPjE+qgGYkcruaixbCOilrPd7eJ6OYUzgN8e5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oz2fjc4+QDu/RmzMblChCOCA3TqJ5IThYUnYAXmEAIfAD+tz1/VNzZ8goHi0YILgU
 O5YnWNg9ouzp8nXb+z0nAe8UBcEo/uEHdQjnKmhPBPSUAuZfBzCXgRdHXyFyAnSopF
 HQDLbaZ4QTbqqY/82AHwuvQRVwwL+wX5J7zGptvIehPMaf53QvaYGLQUT1vThNU6QV
 /4GvdojqqGsYPcTh3mID1ESUQiVaxQlKYMF9svvInaszCgGprnsCwZ9Ogvt5Mg9bwD
 jIinw3kbNiwM2VdKWbNxE34FthIInByR9DIF+IC4y/DbC88hT+w8N1NwfD3xoXRu2x
 6fHKDYHjdhJfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 11/16] drm/amdgpu: put SMU into proper state on
 runpm suspending for BOCO capable platform
Date: Mon,  3 Jan 2022 12:28:44 -0500
Message-Id: <20220103172849.1612731-11-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, tzimmermann@suse.de,
 Guchun Chen <guchun.chen@amd.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, shaoyun.liu@amd.com, ray.huang@amd.com,
 aurabindo.pillai@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 7be3be2b027c12e84833b3dc9597d3bb7e4c5464 ]

By setting mp1_state as PP_MP1_STATE_UNLOAD, MP1 will do some proper cleanups and
put itself into a state ready for PNP. That can workaround some random resuming
failure observed on BOCO capable platforms.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ada083fbc052b..6e682bf8c2d6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1578,12 +1578,27 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	if (amdgpu_device_supports_px(drm_dev))
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 
+	/*
+	 * By setting mp1_state as PP_MP1_STATE_UNLOAD, MP1 will do some
+	 * proper cleanups and put itself into a state ready for PNP. That
+	 * can address some random resuming failure observed on BOCO capable
+	 * platforms.
+	 * TODO: this may be also needed for PX capable platform.
+	 */
+	if (amdgpu_device_supports_boco(drm_dev))
+		adev->mp1_state = PP_MP1_STATE_UNLOAD;
+
 	ret = amdgpu_device_suspend(drm_dev, false);
 	if (ret) {
 		adev->in_runpm = false;
+		if (amdgpu_device_supports_boco(drm_dev))
+			adev->mp1_state = PP_MP1_STATE_NONE;
 		return ret;
 	}
 
+	if (amdgpu_device_supports_boco(drm_dev))
+		adev->mp1_state = PP_MP1_STATE_NONE;
+
 	if (amdgpu_device_supports_px(drm_dev)) {
 		/* Only need to handle PCI state in the driver for ATPX
 		 * PCI core handles it for _PR3.
-- 
2.34.1

