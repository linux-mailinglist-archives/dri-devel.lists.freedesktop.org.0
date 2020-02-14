Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C715DC86
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142136F9CE;
	Fri, 14 Feb 2020 15:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AAB6F9B5;
 Fri, 14 Feb 2020 15:53:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D47A824673;
 Fri, 14 Feb 2020 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695638;
 bh=3AKeUqw3th+3raqm8R0IJ/3uw095xNgT79Nx5tFCf0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KTdN8frgYtV0VLg4WctAXP0k2SS/UQO8XWjDJtGdxLD9fSyrgKvVRMCBWhPiTBKDZ
 yTiHLQEfb2/nicYWtd3lSl4oqLnBHEOSP5mHdar0DA2S5NgVt9RenOJnNo/2MWvCX5
 4ydRXlu3q/4BN1cRueq9vXnA7rgmnKW91SXawsCU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 234/542] drm/amdgpu: fix double gpu_recovery for
 NV of SRIOV
Date: Fri, 14 Feb 2020 10:43:46 -0500
Message-Id: <20200214154854.6746-234-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Monk Liu <Monk.Liu@amd.com>

[ Upstream commit 1512d064f55bace6a8e32d65009c7ea112e76a31 ]

issues:
gpu_recover() is re-entered by the mailbox interrupt
handler mxgpu_nv.c

fix:
we need to bypass the gpu_recover() invoke in mailbox
interrupt as long as the timeout is not infinite (thus the TDR
will be triggered automatically after time out, no need to invoke
gpu_recover() through mailbox interrupt.

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
Reviewed-by: Emily Deng <Emily.Deng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 0d8767eb7a709..1c3a7d4bb65d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -269,7 +269,11 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	}
 
 	/* Trigger recovery for world switch failure if no TDR */
-	if (amdgpu_device_should_recover_gpu(adev))
+	if (amdgpu_device_should_recover_gpu(adev)
+		&& (adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT ||
+		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
+		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
+		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
 		amdgpu_device_gpu_recover(adev, NULL);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
