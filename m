Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216725FF95
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 18:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A526E506;
	Mon,  7 Sep 2020 16:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D919D6E4F9;
 Mon,  7 Sep 2020 16:34:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E48D821D94;
 Mon,  7 Sep 2020 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496497;
 bh=Hw1X4RE33CTzK4sAiopuEovNVhAN4Phqjl630csa/VU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VOCaDx7YvtHVo/Qat1mSREoT75qw2zWQPCIdwiDBgbhKUipIFKtDTWUt1OrrxF1QR
 7RwswzW6a4WDVlqnTsDTU3e2bZIgP6OMu+nbq7+B9sxjDlUqMtnJbqN/IkE6NTr2Yn
 yua1y8A958DAqCDt+rw+b9Tm/mCc7qeyQodSbLvw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 24/26] drm/amdgpu: Fix bug in reporting voltage
 for CIK
Date: Mon,  7 Sep 2020 12:34:24 -0400
Message-Id: <20200907163426.1281284-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163426.1281284-1-sashal@kernel.org>
References: <20200907163426.1281284-1-sashal@kernel.org>
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
 Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandeep Raghuraman <sandy.8925@gmail.com>

[ Upstream commit d98299885c9ea140c1108545186593deba36c4ac ]

On my R9 390, the voltage was reported as a constant 1000 mV.
This was due to a bug in smu7_hwmgr.c, in the smu7_read_sensor()
function, where some magic constants were used in a condition,
to determine whether the voltage should be read from PLANE2_VID
or PLANE1_VID. The VDDC mask was incorrectly used, instead of
the VDDGFX mask.

This patch changes the code to use the correct defined constants
(and apply the correct bitshift), thus resulting in correct voltage reporting.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 219440bebd052..72c0a2ae2dd4f 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -3566,7 +3566,8 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 	case AMDGPU_PP_SENSOR_GPU_POWER:
 		return smu7_get_gpu_power(hwmgr, (uint32_t *)value);
 	case AMDGPU_PP_SENSOR_VDDGFX:
-		if ((data->vr_config & 0xff) == 0x2)
+		if ((data->vr_config & VRCONF_VDDGFX_MASK) ==
+		    (VR_SVI2_PLANE_2 << VRCONF_VDDGFX_SHIFT))
 			val_vid = PHM_READ_INDIRECT_FIELD(hwmgr->device,
 					CGS_IND_REG__SMC, PWR_SVI2_STATUS, PLANE2_VID);
 		else
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
