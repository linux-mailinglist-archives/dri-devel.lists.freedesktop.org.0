Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6523635D24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9001010E2ED;
	Wed, 23 Nov 2022 12:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5D210E2E3;
 Wed, 23 Nov 2022 12:42:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB7C0B81EA3;
 Wed, 23 Nov 2022 12:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FE4C433D7;
 Wed, 23 Nov 2022 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207328;
 bh=qdKp5XCJuoQImGYYrBxGmZLNSZioVbVGS5td/wHGWO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pr/N8ABi4ts/O3MMD2e5b2edVZfGOfXl9588SXcS0xyxWiV5VpZ1jSgNHjCpEYyBD
 WBGtLm16MnHoQ1pcbhU3FrwJJ5WnN+WaD1TvWu/cUNQWjdZigcYF5HR6i0b80S5/XL
 +zDSjkT6nR0gENrb1q9wcR92YCd8mPzuSILDEoTNi8t9ZT8ZFj2otb6IIuLBZXlQry
 i7CEFJC/c4hwQX0zyHxyLd6eYOBlgEXVCsIF8dDzbZK3Xrh6q4USrzNKAA0dJiwgRe
 0V4nyh83VNPokMOQGNP5/7v/cqgYsS3TrZiBHz3g7SW2GYett3QRJvP30sUHBI/j/3
 P0gLKBIjSk//w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 27/44] drm/amdgpu: disable BACO support on more
 cards
Date: Wed, 23 Nov 2022 07:40:36 -0500
Message-Id: <20221123124057.264822-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 lijo.lazar@amd.com, Guchun Chen <guchun.chen@amd.com>, danijel.slivka@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 Mohammadzafar.ziya@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 192039f12233c9063d040266e7c98188c7c89dec ]

Otherwise, some unexpected PCIE AER errors will be observed
in runtime suspend/resume cycle.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 8292839bc42a..9ce0dcc5bb90 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -378,6 +378,10 @@ static void sienna_cichlid_check_bxco_support(struct smu_context *smu)
 		    ((adev->pdev->device == 0x73BF) &&
 		    (adev->pdev->revision == 0xCF)) ||
 		    ((adev->pdev->device == 0x7422) &&
+		    (adev->pdev->revision == 0x00)) ||
+		    ((adev->pdev->device == 0x73A3) &&
+		    (adev->pdev->revision == 0x00)) ||
+		    ((adev->pdev->device == 0x73E3) &&
 		    (adev->pdev->revision == 0x00)))
 			smu_baco->platform_support = false;
 
-- 
2.35.1

