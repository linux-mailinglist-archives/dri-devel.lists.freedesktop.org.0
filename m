Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F882E11D4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78E06E8A9;
	Wed, 23 Dec 2020 02:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76E6E8A8;
 Wed, 23 Dec 2020 02:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 890C1225AC;
 Wed, 23 Dec 2020 02:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689878;
 bh=jll1vxtF5wKsAh85mJDmndmn1U6lQTvJYrFxXfTWAEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fl/KOfVdkT52ZaW3PqHjdlib8nj5x6VpwxgJMtQ0f3LlZr0WkHTS2aYE6w7SLwfFt
 dSS35/QKAjowKNoIOL/8zX+9l2wk/6P3Y7fL2AqRTzHv1htXqiMijeLLDC76nIz26n
 eC1VZqopDGcUyYZf+eNcclev4FHvYWnNTLjA44Z0NIa3xWHNsJajpZdvEUdSgB7cXY
 QxfFkohuEyLahI4iqPWhUItwvyytBQTn+8ufyWe4WLfKnFPy8eCoQ0+DFwnA86d5bZ
 zHS3ZAzC3v3wYkYRDPjcwTLmJENf6rxkp3q+Uo4Wcmtio3qeqy77Z5odEXP7jcuToc
 XSNeMvrk4DVrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 069/217] drm/amd/amdgpu: Add rev_id workaround
 logic for SRIOV setup
Date: Tue, 22 Dec 2020 21:13:58 -0500
Message-Id: <20201223021626.2790791-69-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Bokun Zhang <Bokun.Zhang@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Monk Liu <monk.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bokun Zhang <Bokun.Zhang@amd.com>

[ Upstream commit de21e4aeb2b26128dcc5be1bcb2fafa73d041e51 ]

- When we are under SRIOV setup, the rev_id cannot be read
  properly. Therefore, we will return default value for it

Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
Reviewed-by: Monk Liu <monk.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index 7429f30398b9d..cd822ea78ffbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -51,8 +51,17 @@ static void nbio_v2_3_remap_hdp_registers(struct amdgpu_device *adev)
 
 static u32 nbio_v2_3_get_rev_id(struct amdgpu_device *adev)
 {
-	u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
+	u32 tmp;
 
+	/*
+	 * guest vm gets 0xffffffff when reading RCC_DEV0_EPF0_STRAP0,
+	 * therefore we force rev_id to 0 (which is the default value)
+	 */
+	if (amdgpu_sriov_vf(adev)) {
+		return 0;
+	}
+
+	tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
 	tmp &= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
 	tmp >>= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
