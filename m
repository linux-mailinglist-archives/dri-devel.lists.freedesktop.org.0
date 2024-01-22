Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D670383676B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2365C10F3D5;
	Mon, 22 Jan 2024 15:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A610F3D7;
 Mon, 22 Jan 2024 15:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88CCB611C5;
 Mon, 22 Jan 2024 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99618C43394;
 Mon, 22 Jan 2024 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936480;
 bh=Jd0GnDBeFTQubdqt0c3PXvhofZjUNnmhhtUNGmhdwJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZfkfn11ZxVE1uHUwMOqamgRPLNmTarp84B5brikkBZbdImDrYUqrRRuYvasq7lSZ
 DDPXNnkEmRERm+jzFQcdUtJWJb6br4bRX9DPV2RGODtKD//TJhDsPcaH1kOafGwPCg
 PgrltDDbvPQSNEDptpgqcTq2hLRHXehfsNOKeu9MbS1U3Mbthd8H55UmKpb7GuKAxi
 UUA8hwUQgIZhukyhXak1b+i44MnRKoFKvo40S6E1YnD8B1ns+IMkFTIppJHZJ7gLk+
 mPwkPZ1P2OJwJo62Bz9aKjDbmRU/ow5KBeHrBOaDJpfJQ6vKgw+wkUXq9Q25Vht6EA
 Q/5bOpKQa5dDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 30/35] drm/amd/display: make flip_timestamp_in_us
 a 64-bit variable
Date: Mon, 22 Jan 2024 10:12:27 -0500
Message-ID: <20240122151302.995456-30-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151302.995456-1-sashal@kernel.org>
References: <20240122151302.995456-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.147
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 hamza.mahfooz@amd.com, daniel@ffwll.ch, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 Josip Pavic <josip.pavic@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Josip Pavic <josip.pavic@amd.com>

[ Upstream commit 6fb12518ca58412dc51054e2a7400afb41328d85 ]

[Why]
This variable currently overflows after about 71 minutes. This doesn't
cause any known functional issues but it does make debugging more
difficult.

[How]
Make it a 64-bit variable.

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Josip Pavic <josip.pavic@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 52355fe6994c..51df38a210e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -417,7 +417,7 @@ struct dc_cursor_position {
 };
 
 struct dc_cursor_mi_param {
-	unsigned int pixel_clk_khz;
+	unsigned long long pixel_clk_khz;
 	unsigned int ref_clk_khz;
 	struct rect viewport;
 	struct fixed31_32 h_scale_ratio;
-- 
2.43.0

