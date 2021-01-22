Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8030065A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 16:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845ED89F8E;
	Fri, 22 Jan 2021 15:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2F89F8E;
 Fri, 22 Jan 2021 15:00:25 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l2xvC-0007un-JU; Fri, 22 Jan 2021 15:00:22 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: Fix masking binary not operator on two mask
 operations
Date: Fri, 22 Jan 2021 15:00:22 +0000
Message-Id: <20210122150022.209454-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently the ! operator is incorrectly being used to flip bits on
mask values. Fix this by using the bit-wise ~ operator instead.

Addresses-Coverity: ("Logical vs. bitwise operator")
Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 1961745e89c7..ab9be5ad5a5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
 
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
 		data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
-		data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
-		data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
