Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFA1BFA32
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAFD6E8AF;
	Thu, 30 Apr 2020 13:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD26E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:52:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D1BF208D5;
 Thu, 30 Apr 2020 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254767;
 bh=Cqr8eghnHCwYfy32Xoq0YNy2OmKR9+KhkhznVTmFUrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tsvJIYm5bqW5nBUC6B2TbrwZxYvx5l8kTaPjSajNkwPRN6I1tSApNhtZ9gxs3j/Bj
 Tt+o4vG4u++/zUzIRn0OuXxJPf7EiQdlETC99uWRLInyLw1qqB5yTZsBqa9ypLfBkK
 nk5BnR3E5BDvcibu3G+JriJ2i5jVJs6mNyzqMj7k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 25/57] drm/amdgpu: Correctly initialize thermal
 controller for GPUs with Powerplay table v0 (e.g Hawaii)
Date: Thu, 30 Apr 2020 09:51:46 -0400
Message-Id: <20200430135218.20372-25-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135218.20372-1-sashal@kernel.org>
References: <20200430135218.20372-1-sashal@kernel.org>
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
 Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandeep Raghuraman <sandy.8925@gmail.com>

[ Upstream commit bbc25dadc7ed19f9d6b2e30980f0eb4c741bb8bf ]

Initialize thermal controller fields in the PowerPlay table for Hawaii
GPUs, so that fan speeds are reported.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/powerplay/hwmgr/processpptables.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
index 77c14671866c0..719597c5d27d9 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
@@ -984,6 +984,32 @@ static int init_thermal_controller(
 			struct pp_hwmgr *hwmgr,
 			const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
 {
+	hwmgr->thermal_controller.ucType =
+			powerplay_table->sThermalController.ucType;
+	hwmgr->thermal_controller.ucI2cLine =
+			powerplay_table->sThermalController.ucI2cLine;
+	hwmgr->thermal_controller.ucI2cAddress =
+			powerplay_table->sThermalController.ucI2cAddress;
+
+	hwmgr->thermal_controller.fanInfo.bNoFan =
+		(0 != (powerplay_table->sThermalController.ucFanParameters &
+			ATOM_PP_FANPARAMETERS_NOFAN));
+
+	hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
+		powerplay_table->sThermalController.ucFanParameters &
+		ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
+
+	hwmgr->thermal_controller.fanInfo.ulMinRPM
+		= powerplay_table->sThermalController.ucFanMinRPM * 100UL;
+	hwmgr->thermal_controller.fanInfo.ulMaxRPM
+		= powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
+
+	set_hw_cap(hwmgr,
+		   ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
+		   PHM_PlatformCaps_ThermalController);
+
+	hwmgr->thermal_controller.use_hw_fan_control = 1;
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
