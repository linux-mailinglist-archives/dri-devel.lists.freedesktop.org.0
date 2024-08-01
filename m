Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EF943C49
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3710E830;
	Thu,  1 Aug 2024 00:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dIbX0M0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2A110E82F;
 Thu,  1 Aug 2024 00:36:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFBD461DBF;
 Thu,  1 Aug 2024 00:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB33C116B1;
 Thu,  1 Aug 2024 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472611;
 bh=NiqrHfgRjNUyUmugbUTlAatN3DcyQdZGpSanQx3Masw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIbX0M0ZbALzW3XTDOtJSdHBFUWtE1LCPBLryP1pve9Tu8zy/XRxpTomnGwtmdf3/
 oGezHrz7ZOfxxZk/isuegTQ6+31M4vCoOCOkuPJn30xOgKmZWlvRAhtszMBA5I7//v
 fcOPKgyxQ7Vs3UPngUu0HSjmhvgnufVe+ITQ8fLd4bLfg/LbSROaxqzqYEoItDzH7I
 iAMDMKu5GGEO29CQYI0gMMWfGUowAsSiYzsjFAWHuOKmT/58vKwBNNAsQwWnTce9eB
 t33+kjHubjEIYqdNRILQ9yUbIdtyw6XtAE5SZVthrMTzNjgqNJDG/y6TGv2khIonHU
 k/roi6TVfXihA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, kenneth.feng@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Jun.Ma2@amd.com, kevinyang.wang@amd.com,
 ruanjinjie@huawei.com, mario.limonciello@amd.com, bob.zhou@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 02/38] drm/amd/pm: fix warning using
 uninitialized value of max_vid_step
Date: Wed, 31 Jul 2024 20:35:08 -0400
Message-ID: <20240801003643.3938534-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003643.3938534-1-sashal@kernel.org>
References: <20240801003643.3938534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit 17e3bea65cdc453695b2fe4ff26d25d17f5339e9 ]

Check the return of pp_atomfwctrl_get_Voltage_table_v4
as it may fail to initialize max_vid_step
V2: change the check condition (Tim Huang)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 4dc27ec4d012d..04daba8a0fe8e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -2572,8 +2572,11 @@ static int vega10_init_smc_table(struct pp_hwmgr *hwmgr)
 		}
 	}
 
-	pp_atomfwctrl_get_voltage_table_v4(hwmgr, VOLTAGE_TYPE_VDDC,
+	result = pp_atomfwctrl_get_voltage_table_v4(hwmgr, VOLTAGE_TYPE_VDDC,
 			VOLTAGE_OBJ_SVID2,  &voltage_table);
+	PP_ASSERT_WITH_CODE(!result,
+			"Failed to get voltage table!",
+			return result);
 	pp_table->MaxVidStep = voltage_table.max_vid_step;
 
 	pp_table->GfxDpmVoltageMode =
-- 
2.43.0

