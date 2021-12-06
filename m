Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B588A46A96D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 22:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340446E8E7;
	Mon,  6 Dec 2021 21:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447DB6E8E5;
 Mon,  6 Dec 2021 21:14:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4C227CE1846;
 Mon,  6 Dec 2021 21:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45CBC341C6;
 Mon,  6 Dec 2021 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825286;
 bh=Zc58ANuGV3Msy+hzdE+4mS7KhdoGskyBSFCTOULUVgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h0sw9sjnKN/y0h/UzwTQLMDLPKZaizrC4skwEijffgI0IUaqSn8ReXvtsvyHJ8idf
 CgbPdrMYfQ/r28f8n760XPFG+IwBICjjl7+qUgMNds+TwHX1Es1Q6dnstyxQm6sWAH
 7mggZp02gKz6FUV61xSKf3sY1R4TRSWmNpqtQkFCtpE/vHs8G3+Fj+RNLFFBT8saoF
 Cc0zKPE4df46nYA05Ax7I7Y4YJ5VXPKKApmLnzOsUFQPbVbc4Togx5x8ltYcFtFjVH
 wuOJx1qZ9byCTvnefY3jL2wr5yU03dmMva21U9TFpvCwffDhy8fcv6DrQ1iJlMJAKN
 sw7h54R4a/LzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/24] drm/amdgpu: check atomic flag to
 differeniate with legacy path
Date: Mon,  6 Dec 2021 16:12:23 -0500
Message-Id: <20211206211230.1660072-18-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206211230.1660072-1-sashal@kernel.org>
References: <20211206211230.1660072-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jack.Zhang1@amd.com, evan.quan@amd.com,
 Guchun Chen <guchun.chen@amd.com>, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com,
 Alex Deucher <aleander.deucher@amd.com>, shaoyun.liu@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Flora Cui <flora.cui@amd.com>, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Flora Cui <flora.cui@amd.com>

[ Upstream commit 1053b9c948e614473819a1a5bcaff6d44e680dcf ]

since vkms support atomic KMS interface

Signed-off-by: Flora Cui <flora.cui@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Acked-by: Alex Deucher <aleander.deucher@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96ca42bcfdbf9..1545884dc703e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3854,7 +3854,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	/* disable all interrupts */
 	amdgpu_irq_disable_all(adev);
 	if (adev->mode_info.mode_config_initialized){
-		if (!amdgpu_device_has_dc_support(adev))
+		if (!drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
 			drm_helper_force_disable_all(adev_to_drm(adev));
 		else
 			drm_atomic_helper_shutdown(adev_to_drm(adev));
@@ -5130,7 +5130,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			drm_sched_start(&ring->sched, !tmp_adev->asic_reset_res);
 		}
 
-		if (!amdgpu_device_has_dc_support(tmp_adev) && !job_signaled) {
+		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled) {
 			drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
 		}
 
-- 
2.33.0

