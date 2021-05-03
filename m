Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696B37196A
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFFE6E91B;
	Mon,  3 May 2021 16:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC76E90A;
 Mon,  3 May 2021 16:35:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F067560D07;
 Mon,  3 May 2021 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059728;
 bh=XJhRDno84dxoR28e7Bc0BSzpSZh3YNnxBxVu+ZIK1BE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c+wC9B8hFB6zdyBTH0XVKSEpA5Q4LBi2CsFz0ku0XdVT8QIr7yZFKBfDseiChbMJV
 xFagaCoIRb4giapHhJOOT4H4meXVaHmQTGk5gTmEaPUhgkymDeZo/dsTQP7Sx6fLKs
 oT2fNccWKaOu31l24x3PJ3nEexv81LWgI/gsagodvh7Y5w16AIevBoilUqpYBB+YJE
 5fwnML7L/UyVJZRG4JerPxBFXUEEl13MajUJOhbM9NGOFCwKogGG2goTq5NVoz1Ohz
 LDIou5qLlpVr5ktSdE9uXFW2oSjZaO+MjGu/Bv/INelDsVsO2c+R2McBdy1dIR0oNb
 Q0NGWwk8LaHNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 009/134] drm/amd/display: Check for DSC support
 instead of ASIC revision
Date: Mon,  3 May 2021 12:33:08 -0400
Message-Id: <20210503163513.2851510-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eryk Brol <eryk.brol@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bindu Ramamurthy <bindu.r@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eryk Brol <eryk.brol@amd.com>

[ Upstream commit 349a19b2f1b01e713268c7de9944ad669ccdf369 ]

[why]
This check for ASIC revision is no longer useful and causes
lightup issues after a topology change in MST DSC scenario.
In this case, DSC configs should be recalculated for the new
topology. This check prevented that from happening on certain
ASICs that do, in fact, support DSC.

[how]
Change the ASIC revision to instead check if DSC is supported.

Signed-off-by: Eryk Brol <eryk.brol@amd.com>
Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d699a5cf6c11..8ad83ccfcc6a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9383,7 +9383,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	}
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (adev->asic_type >= CHIP_NAVI10) {
+	if (dc_resource_is_dsc_encoding_supported(dc)) {
 		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
 				ret = add_affected_mst_dsc_crtcs(state, crtc);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
