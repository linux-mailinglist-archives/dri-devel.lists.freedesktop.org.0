Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4417E3DB7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10B810E5B9;
	Tue,  7 Nov 2023 12:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08B510E5B7;
 Tue,  7 Nov 2023 12:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EB5961181;
 Tue,  7 Nov 2023 12:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F77C433D9;
 Tue,  7 Nov 2023 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360223;
 bh=bDGQYFArKPvTWstkMjeVmNma192FojHGBFgTuORE/n4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E6r0d8KC4ZIliDrp6GjH6Dp7oo/kpvFVuqA1DoZ2LopwlTfFY8J1Ft0Zm1EyhbqQx
 rWrEJmzlElrs8bJQrvJ1mg6kpho/134WhC05lFo6uvAk9BtvumS65Rt72KeLzka7a+
 ffPQ1Hh9CHX2kDc7Zdbz4RQyJWUnVa21V4AL96KfYpQrHgWdF4+OhgpTQZqBbqQYjT
 FbM+Sj3s7uAoxkpWs86cUb5bSjvQ4F6Gzs7KDK7WDMJRcIcwB70WugBbRyqJqCXzPU
 xpAeXzLda2QmDalz7YxtCPLFDurpwvQ8p8Q5a+PUyogl7wth7daoc2KMfq+Z5ulIR+
 IZ9YBoPP/93Gw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/20] drm/amdgpu: Fix potential null pointer
 derefernce
Date: Tue,  7 Nov 2023 07:29:06 -0500
Message-ID: <20231107122940.3762228-12-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122940.3762228-1-sashal@kernel.org>
References: <20231107122940.3762228-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
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
Cc: Sasha Levin <sashal@kernel.org>, Tao Zhou <tao.zhou1@amd.com>,
 andrealmeid@igalia.com, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com, le.ma@amd.com,
 "Stanley.Yang" <Stanley.Yang@amd.com>, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, srinivasan.shanmugam@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit 80285ae1ec8717b597b20de38866c29d84d321a1 ]

The amdgpu_ras_get_context may return NULL if device
not support ras feature, so add check before using.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2cf49a32ac6c3..e60130653c54e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5097,7 +5097,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * Flush RAM to disk so that after reboot
 	 * the user can read log and see why the system rebooted.
 	 */
-	if (need_emergency_restart && amdgpu_ras_get_context(adev)->reboot) {
+	if (need_emergency_restart && amdgpu_ras_get_context(adev) &&
+		amdgpu_ras_get_context(adev)->reboot) {
 		DRM_WARN("Emergency reboot.");
 
 		ksys_sync_helper();
-- 
2.42.0

