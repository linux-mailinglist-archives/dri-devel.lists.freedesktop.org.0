Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9C119349
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CF26E937;
	Tue, 10 Dec 2019 21:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 21:09:12 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDF6E937
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:09:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED99F246A5;
 Tue, 10 Dec 2019 21:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012152;
 bh=tuAaTuL8euIcbGtYBkcietDdMq711xgJAVedFgWRTR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2pEo0erx/FZPIVgCRRxr+b5XY38Qh+/f9bcyZBgkKfasVuvtUJwJYZQA3Hol7uj5d
 ziS24lXub72Lbadix4sYcGNmt/pHPgvsghGWYfwoysAVAG2Hxf838klw+jMyoxTvlm
 ltAJT8o750VCwaTj7+9dKzlErapqizuxLoodV6SQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 115/350] drm/amd/powerplay: avoid disabling ECC if
 RAS is enabled for VEGA20
Date: Tue, 10 Dec 2019 16:03:40 -0500
Message-Id: <20191210210735.9077-76-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
 Le Ma <le.ma@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Le Ma <le.ma@amd.com>

[ Upstream commit df9331e561dab0a451cbd6a679ee88a95f306fd6 ]

Program THM_BACO_CNTL.SOC_DOMAIN_IDLE=1 will tell VBIOS to disable ECC when
BACO exit. This can save BACO exit time by PSP on none-ECC SKU. Drop the setting
for ECC supported SKU.

Signed-off-by: Le Ma <le.ma@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
index df6ff92524011..b068d1c7b44d2 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_baco.c
@@ -29,7 +29,7 @@
 #include "vega20_baco.h"
 #include "vega20_smumgr.h"
 
-
+#include "amdgpu_ras.h"
 
 static const struct soc15_baco_cmd_entry clean_baco_tbl[] =
 {
@@ -74,6 +74,7 @@ int vega20_baco_get_state(struct pp_hwmgr *hwmgr, enum BACO_STATE *state)
 int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 	enum BACO_STATE cur_state;
 	uint32_t data;
 
@@ -84,10 +85,11 @@ int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 		return 0;
 
 	if (state == BACO_STATE_IN) {
-		data = RREG32_SOC15(THM, 0, mmTHM_BACO_CNTL);
-		data |= 0x80000000;
-		WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL, data);
-
+		if (!ras || !ras->supported) {
+			data = RREG32_SOC15(THM, 0, mmTHM_BACO_CNTL);
+			data |= 0x80000000;
+			WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL, data);
+		}
 
 		if(smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_EnterBaco, 0))
 			return -EINVAL;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
