Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF3711934A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3746E93A;
	Tue, 10 Dec 2019 21:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88AD6E93A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:09:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D915824699;
 Tue, 10 Dec 2019 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012164;
 bh=yS2KDEXb1mtqkGjsdBPg69ZkH+a+Qekok3ngQXZ45Jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BBOMGUX+vuZ2Ifb1HTSH9xfKyc6fTsWNsWvTyOrj4GnZ3RIZX+4Hvspq7kgmVsPVR
 CKjV2dudYXM4AXWEJDJ4zp5GgrK450tnk315R3MTXv7yGiBnFKjaXfZ1ZTRdSWaTIo
 Rr/QfXkWxNaaHS3H51cD6WkWPH21B9eVY4dv4CkE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 125/350] drm/amd/display: enable hostvm based on
 roimmu active for dcn2.1
Date: Tue, 10 Dec 2019 16:03:50 -0500
Message-Id: <20191210210735.9077-86-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 48d92e8eda3d9b61978377e7539bfc5958e850cf ]

Enabling hostvm when ROIMMU is not active seems to break GPUVM.
This fixes the issue by not enabling hostvm if ROIMMU is not
activated.

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn21/dcn21_hubbub.c   | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
index d1266741763b9..f5f6b4a0f0aa4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
@@ -22,6 +22,7 @@
  * Authors: AMD
  *
  */
+#include <linux/delay.h>
 #include "dm_services.h"
 #include "dcn20/dcn20_hubbub.h"
 #include "dcn21_hubbub.h"
@@ -71,30 +72,39 @@ static uint32_t convert_and_clamp(
 void dcn21_dchvm_init(struct hubbub *hubbub)
 {
 	struct dcn20_hubbub *hubbub1 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t riommu_active;
+	int i;
 
 	//Init DCHVM block
 	REG_UPDATE(DCHVM_CTRL0, HOSTVM_INIT_REQ, 1);
 
 	//Poll until RIOMMU_ACTIVE = 1
-	//TODO: Figure out interval us and retry count
-	REG_WAIT(DCHVM_RIOMMU_STAT0, RIOMMU_ACTIVE, 1, 5, 100);
+	for (i = 0; i < 100; i++) {
+		REG_GET(DCHVM_RIOMMU_STAT0, RIOMMU_ACTIVE, &riommu_active);
 
-	//Reflect the power status of DCHUBBUB
-	REG_UPDATE(DCHVM_RIOMMU_CTRL0, HOSTVM_POWERSTATUS, 1);
+		if (riommu_active)
+			break;
+		else
+			udelay(5);
+	}
+
+	if (riommu_active) {
+		//Reflect the power status of DCHUBBUB
+		REG_UPDATE(DCHVM_RIOMMU_CTRL0, HOSTVM_POWERSTATUS, 1);
 
-	//Start rIOMMU prefetching
-	REG_UPDATE(DCHVM_RIOMMU_CTRL0, HOSTVM_PREFETCH_REQ, 1);
+		//Start rIOMMU prefetching
+		REG_UPDATE(DCHVM_RIOMMU_CTRL0, HOSTVM_PREFETCH_REQ, 1);
 
-	// Enable dynamic clock gating
-	REG_UPDATE_4(DCHVM_CLK_CTRL,
-					HVM_DISPCLK_R_GATE_DIS, 0,
-					HVM_DISPCLK_G_GATE_DIS, 0,
-					HVM_DCFCLK_R_GATE_DIS, 0,
-					HVM_DCFCLK_G_GATE_DIS, 0);
+		// Enable dynamic clock gating
+		REG_UPDATE_4(DCHVM_CLK_CTRL,
+						HVM_DISPCLK_R_GATE_DIS, 0,
+						HVM_DISPCLK_G_GATE_DIS, 0,
+						HVM_DCFCLK_R_GATE_DIS, 0,
+						HVM_DCFCLK_G_GATE_DIS, 0);
 
-	//Poll until HOSTVM_PREFETCH_DONE = 1
-	//TODO: Figure out interval us and retry count
-	REG_WAIT(DCHVM_RIOMMU_STAT0, HOSTVM_PREFETCH_DONE, 1, 5, 100);
+		//Poll until HOSTVM_PREFETCH_DONE = 1
+		REG_WAIT(DCHVM_RIOMMU_STAT0, HOSTVM_PREFETCH_DONE, 1, 5, 100);
+	}
 }
 
 static int hubbub21_init_dchub(struct hubbub *hubbub,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
