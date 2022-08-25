Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464925A0603
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D6BD0B32;
	Thu, 25 Aug 2022 01:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10E5D08FB;
 Thu, 25 Aug 2022 01:36:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FE5A61AF5;
 Thu, 25 Aug 2022 01:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6048FC433C1;
 Thu, 25 Aug 2022 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391407;
 bh=6y2CEd1u9Su1zaXFQgHgKgA4r6KSVGRWB5cN6xNdCrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KgL+3avRMD+252eyhwzvEfcT1/J0wKtHdX4NVVumSyZXzgRVTfpIpUsm2MI4z2OvV
 p9NzNyhWA/PZdNULNf04pv8F+5Pn6M/bLZ6d2SjnVWmc2Z2io78sftmtLORWFTVrlJ
 0rrkklS9kmTO0zKe2U3lXHEwA5ojrHzrr0daUYQE2aVlHJYTDTPe4h7ImHlrrR9GoA
 FAKHmoJnYF0Wds0xBeMcS6T/HbXc+eC33JhqVrCab6ZoMvPSrG8nWK7gyly7doiqa4
 I63HYfGrUdqnm/fWFXMUfUx2davw82ysd+oeIxRsUhFl8S1RDWW1q1LEPOIR+CwuqA
 tHxcMQe0JtF7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 29/38] drm/amdgpu: Add secure display TA load for
 Renoir
Date: Wed, 24 Aug 2022 21:33:52 -0400
Message-Id: <20220825013401.22096-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 Shane Xiao <shane.xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 Aaron Liu <aaron.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 john.clements@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shane Xiao <shane.xiao@amd.com>

[ Upstream commit e42dfa66d59240afbdd8d4b47b87486db39504aa ]

Add secure display TA load for Renoir

Signed-off-by: Shane Xiao <shane.xiao@amd.com>
Reviewed-by: Aaron Liu <aaron.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index a2588200ea58..0b2ac418e4ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -101,6 +101,16 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 		adev->psp.dtm_context.context.bin_desc.start_addr =
 			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
 			le32_to_cpu(ta_hdr->dtm.offset_bytes);
+
+		if (adev->apu_flags & AMD_APU_IS_RENOIR) {
+			adev->psp.securedisplay_context.context.bin_desc.fw_version =
+				le32_to_cpu(ta_hdr->securedisplay.fw_version);
+			adev->psp.securedisplay_context.context.bin_desc.size_bytes =
+				le32_to_cpu(ta_hdr->securedisplay.size_bytes);
+			adev->psp.securedisplay_context.context.bin_desc.start_addr =
+				(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+				le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
+		}
 	}
 
 	return 0;
-- 
2.35.1

