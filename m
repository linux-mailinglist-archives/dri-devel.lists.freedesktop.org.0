Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793626EB48
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E810C89824;
	Fri, 18 Sep 2020 02:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71426E44A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:05:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F06122388B;
 Fri, 18 Sep 2020 02:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394754;
 bh=9P09pX9CSmsoGNHoVEW3b11httRKm6P+siZpoeibr/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Re3jG2nGHOTwgjJ690a6isM6VaYZuoTHURWoj2KY4AXByI2RJyDI82gC7tG5SH4mh
 97dbEAcBINRH+XN0d+1/LNtnz5N6vbqBBeQmklL4UTYTuAsXIGX3qCqoCitrJwSMIn
 lO3SPlfKcdxrU/11TZ/D2w2ncUhdMiRpNIdI6fN0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 232/330] drm/amdgpu/sriov add
 amdgpu_amdkfd_pre_reset in gpu reset
Date: Thu, 17 Sep 2020 21:59:32 -0400
Message-Id: <20200918020110.2063155-232-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
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
 Jack Zhang <Jack.Zhang1@amd.com>, dri-devel@lists.freedesktop.org,
 Monk Liu <monk.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jack Zhang <Jack.Zhang1@amd.com>

[ Upstream commit 04bef61e5da18c2b301c629a209ccdba4d4c6fbb ]

kfd_pre_reset will free mem_objs allocated by kfd_gtt_sa_allocate

Without this change, sriov tdr code path will never free those allocated
memories and get memory leak.

v2:add a bugfix for kiq ring test fail

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
Reviewed-by: Monk Liu <monk.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index d10f483f5e273..ce30d4e8bf25f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -644,6 +644,9 @@ static int kgd_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	uint32_t temp;
 	struct v10_compute_mqd *m = get_mqd(mqd);
 
+	if (amdgpu_sriov_vf(adev) && adev->in_gpu_reset)
+		return 0;
+
 #if 0
 	unsigned long flags;
 	int retry;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e262f2ac07a35..92754cfb98086 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -540,6 +540,9 @@ int kgd_gfx_v9_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	uint32_t temp;
 	struct v9_mqd *m = get_mqd(mqd);
 
+	if (amdgpu_sriov_vf(adev) && adev->in_gpu_reset)
+		return 0;
+
 	if (adev->in_gpu_reset)
 		return -EIO;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5e1dce4241547..4105fbf571674 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3466,6 +3466,8 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	if (r)
 		return r;
 
+	amdgpu_amdkfd_pre_reset(adev);
+
 	/* Resume IP prior to SMC */
 	r = amdgpu_device_ip_reinit_early_sriov(adev);
 	if (r)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
