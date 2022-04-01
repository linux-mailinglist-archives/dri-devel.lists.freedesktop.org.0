Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA194EF048
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2B510EE81;
	Fri,  1 Apr 2022 14:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBA810EE91;
 Fri,  1 Apr 2022 14:33:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF07061C1A;
 Fri,  1 Apr 2022 14:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5440CC2BBE4;
 Fri,  1 Apr 2022 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823608;
 bh=siWcXEmCyoxlVrp6lZ9e/3Moi05txa9GnghdY7gCS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHV1uDAH1Vsckrn9OsbEEe/Q5yTrM0CKnaFT6WW5ZQ6WrTkM1FjjRNbj8cgxVxZgl
 z+i0ef6myMTBJAU+Zvz9p0YgarXTXRRyXGzuU2+4z5KHY0zMG+CLbxtwySwUDfU8zh
 e2LEEAB55DbgFO1vtQApQUn3hsQi8PDMRqic4NUpjLl8X5NwRDjgj688ug/+ToFAxd
 VaiL+//zAAEEVPYde3gaS4oQuWc6I13afOz8z1zIcjRRHtf1J+yJbHkQh9RbvMVy8W
 bmhwbXcWqvAH8wvE7oY+ZmPsnncGZntxtXb1PRSUQt6e/uycPPND6cbwmRre8FkdSk
 sTfENoRnH0DYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 009/109] drm/amd/display: Use PSR version
 selected during set_psr_caps
Date: Fri,  1 Apr 2022 10:31:16 -0400
Message-Id: <20220401143256.1950537-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, po-tchen@amd.com, pulehui@huawei.com,
 sunpeng.li@amd.com, mikita.lipski@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, robin.chen@amd.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit b80ddeb29d9df449f875f0b6f5de08d7537c02b8 ]

[Why]
If the DPCD caps specifies a PSR version newer than PSR_VERSION_1 then
we fallback to using PSR_VERSION_1 in amdgpu_dm_set_psr_caps.

This gets overriden with the raw DPCD value in amdgpu_dm_link_setup_psr,
which can result in DMCUB hanging if we pass in an unsupported PSR
version number.

[How]
Fix the hang by using link->psr_settings.psr_version directly during
amdgpu_dm_link_setup_psr.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
index c022e56f9459..90962fb91916 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
@@ -74,10 +74,8 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
 
 	link = stream->link;
 
-	psr_config.psr_version = link->dpcd_caps.psr_caps.psr_version;
-
-	if (psr_config.psr_version > 0) {
-		psr_config.psr_exit_link_training_required = 0x1;
+	if (link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED) {
+		psr_config.psr_version = link->psr_settings.psr_version;
 		psr_config.psr_frame_capture_indication_req = 0;
 		psr_config.psr_rfb_setup_time = 0x37;
 		psr_config.psr_sdp_transmit_line_num_deadline = 0x20;
-- 
2.34.1

