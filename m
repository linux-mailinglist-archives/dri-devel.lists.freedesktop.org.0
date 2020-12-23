Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E82E11D2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DEA6E8A7;
	Wed, 23 Dec 2020 02:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7AD6E8A6;
 Wed, 23 Dec 2020 02:17:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45DC222257;
 Wed, 23 Dec 2020 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689877;
 bh=nN9Ek+XfS7t86dlUxeOWMAuYnxTfcRem9IKOOOBXP6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b16gscDBFh4+Z1vIiE9g2I3Z5kV02iSbHzCMh08lz9F+PT3R2bjMEJbS/mMP9S4Un
 e2gJ0gUOffcKWW5IVhYjo2iZLQzTCCqZjWfH/reKUKsOL8qFl7zHIaIRguQ5q3Ndm4
 9E1K9P/m7gEyAE7g6X0U808xsx/i7oTMGJF8a0iPVSWPDZn2poHWFkL4UNTjCxN0k3
 eciSA/OfTKJghDttYBTyvyMLWYW4vwtt8QhdhfMl6/BlWmrD0ONBjxWWfMpp1RCJU8
 MPom+0VVH6yza4vnwxPkTJodaafuWKCihnNcMUySEiYisWfLC5d22RiNlVXSd6jMmS
 8FCM3nVMNt8/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 068/217] drm/amd/amdgpu: Fix incorrect logic to
 increment VCN doorbell index
Date: Tue, 22 Dec 2020 21:13:57 -0500
Message-Id: <20201223021626.2790791-68-sashal@kernel.org>
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

[ Upstream commit 25a35065c066496935217748b1662a7fcf26ed58 ]

- The original logic uses a counter based index assignment,
  which is incorrect if we only assign VCN1 to this VF but no VCN0

  The doorbell index is absolute, so we can calculate it by
  using index variable i and j

Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
Reviewed-by: Monk Liu <monk.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index b5f8f3d731cb0..8ecdddf33e18e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -155,6 +155,13 @@ static int vcn_v3_0_sw_init(void *handle)
 	if (r)
 		return r;
 
+	/*
+	 * Note: doorbell assignment is fixed for SRIOV multiple VCN engines
+	 * Formula:
+	 *   vcn_db_base  = adev->doorbell_index.vcn.vcn_ring0_1 << 1;
+	 *   dec_ring_i   = vcn_db_base + i * (adev->vcn.num_enc_rings + 1)
+	 *   enc_ring_i,j = vcn_db_base + i * (adev->vcn.num_enc_rings + 1) + 1 + j
+	 */
 	if (amdgpu_sriov_vf(adev)) {
 		vcn_doorbell_index = adev->doorbell_index.vcn.vcn_ring0_1;
 		/* get DWORD offset */
@@ -192,9 +199,7 @@ static int vcn_v3_0_sw_init(void *handle)
 		ring = &adev->vcn.inst[i].ring_dec;
 		ring->use_doorbell = true;
 		if (amdgpu_sriov_vf(adev)) {
-			ring->doorbell_index = vcn_doorbell_index;
-			/* NOTE: increment so next VCN engine use next DOORBELL DWORD */
-			vcn_doorbell_index++;
+			ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.num_enc_rings + 1);
 		} else {
 			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i;
 		}
@@ -216,9 +221,7 @@ static int vcn_v3_0_sw_init(void *handle)
 			ring = &adev->vcn.inst[i].ring_enc[j];
 			ring->use_doorbell = true;
 			if (amdgpu_sriov_vf(adev)) {
-				ring->doorbell_index = vcn_doorbell_index;
-				/* NOTE: increment so next VCN engine use next DOORBELL DWORD */
-				vcn_doorbell_index++;
+				ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.num_enc_rings + 1) + 1 + j;
 			} else {
 				ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + j + 8 * i;
 			}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
