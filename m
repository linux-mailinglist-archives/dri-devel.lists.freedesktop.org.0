Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135746A96B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 22:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916D6E5D1;
	Mon,  6 Dec 2021 21:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328336E5D1;
 Mon,  6 Dec 2021 21:14:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5AAE9CE13C6;
 Mon,  6 Dec 2021 21:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8105C341CA;
 Mon,  6 Dec 2021 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825277;
 bh=fxnpeYtn5lzA1D9cDoDh9K8sHKNQ4nQR9xKxEguVNx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJUkYMjmWo4SacPeDUVZymBIi46RU3orRDqhOWzvDjZugFOMYovfsMZHjq4XCtGzD
 41MnERetNpdlMRE9Vkw/JE/0Nn/kNrCkU/BXfjNip3sgOz03fx90e7FLs0G2H+dBJE
 CLW5tduuf4A8DChx4VSSyzJTkeQvw5w3xAplSWnqRzyzx/AaWcnKnUfoLJ7q2j4JA/
 8mL450utGvasMUfa4xsrX+3GnWJbBNDFYTb6K0CfD05ju2YfXL3XMlXj4l11DGLQNr
 7JNp670AaXiIZZGwMwD9vujfVTxB9KusOdNRhuXb+mx3GDIV9yGh/LnWMiZV8Jfc6P
 inpjGa+D27d1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/24] drm/amdgpu: cancel the correct hrtimer on
 exit
Date: Mon,  6 Dec 2021 16:12:22 -0500
Message-Id: <20211206211230.1660072-17-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 Ryan.Taylor@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Flora Cui <flora.cui@amd.com>, christian.koenig@amd.com,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Flora Cui <flora.cui@amd.com>

[ Upstream commit 3e467e478ed3a9701bb588d648d6e0ccb82ced09 ]

Signed-off-by: Flora Cui <flora.cui@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index ce982afeff913..ac9a8cd21c4b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -504,8 +504,8 @@ static int amdgpu_vkms_sw_fini(void *handle)
 	int i = 0;
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++)
-		if (adev->mode_info.crtcs[i])
-			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
+		if (adev->amdgpu_vkms_output[i].vblank_hrtimer.function)
+			hrtimer_cancel(&adev->amdgpu_vkms_output[i].vblank_hrtimer);
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 	kfree(adev->amdgpu_vkms_output);
-- 
2.33.0

