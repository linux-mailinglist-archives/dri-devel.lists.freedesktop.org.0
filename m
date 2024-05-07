Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C426E8BF0CE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F02C112FF2;
	Tue,  7 May 2024 23:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EyCT3krR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45CE112FF2;
 Tue,  7 May 2024 23:11:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3583C61A11;
 Tue,  7 May 2024 23:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181BCC4AF67;
 Tue,  7 May 2024 23:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123500;
 bh=qsBXv4eT55IdMwxy9x8mbzOnTPPBcW0txYfRfwsRTOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EyCT3krRBcjEArWrZezMU/H2izaznw9fMViBMbqa4Hsa1h82NiFNhSYiwvbcxr987
 USBQn2fFaiis2hisxgZBXHhy4PZ1Ilw6UNgNq7QUEM3mtxrMirpD37mfx1BHzxImPw
 zWWgqUah38uit4kB1gDRLZKjBYkrO8mdZnPFA9vhLI0yGGJxncElMVG/EkKTO6dehK
 nEFrN2SkVWUK/dw9gdQEWD3fjiD61RVFV6mwCKyDxOb5aLP/lRrZsxwB0OLttRmETk
 J6JmS1cDaMzcB3DlscZdJ6V0wN6XcsuWBdfZXCVeoEKANBA7nUpNlay3y8+wRdSl0Y
 U7Ox2RustXWHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 PeiChen Huang <peichen.huang@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, srinivasan.shanmugam@amd.com, nathan@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 31/43] drm/amd/display: Allocate zero bw after bw
 alloc enable
Date: Tue,  7 May 2024 19:09:52 -0400
Message-ID: <20240507231033.393285-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[ Upstream commit 46fe9cb1a9e62f4e6229f48ae303ef8e6c1fdc64 ]

[Why]
During DP tunnel creation, CM preallocates BW and reduces
estimated BW of other DPIA. CM release preallocation only
when allocation is complete. Display mode validation logic
validates timings based on bw available per host router.
In multi display setup, this causes bw allocation failure
when allocation greater than estimated bw.

[How]
Do zero alloc to make the CM to release preallocation and
update estimated BW correctly for all DPIAs per host router.

Reviewed-by: PeiChen Huang <peichen.huang@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/link/protocols/link_dp_dpia_bw.c    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
index 5491b707cec88..5a965c26bf209 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
@@ -270,7 +270,7 @@ static void set_usb4_req_bw_req(struct dc_link *link, int req_bw)
 
 	/* Error check whether requested and allocated are equal */
 	req_bw = requested_bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
-	if (req_bw == link->dpia_bw_alloc_config.allocated_bw) {
+	if (req_bw && (req_bw == link->dpia_bw_alloc_config.allocated_bw)) {
 		DC_LOG_ERROR("%s: Request bw equals to allocated bw for link(%d)\n",
 			__func__, link->link_index);
 	}
@@ -341,6 +341,14 @@ bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(struct dc_link *link)
 			ret = true;
 			init_usb4_bw_struct(link);
 			link->dpia_bw_alloc_config.bw_alloc_enabled = true;
+
+			/*
+			 * During DP tunnel creation, CM preallocates BW and reduces estimated BW of other
+			 * DPIA. CM release preallocation only when allocation is complete. Do zero alloc
+			 * to make the CM to release preallocation and update estimated BW correctly for
+			 * all DPIAs per host router
+			 */
+			link_dp_dpia_allocate_usb4_bandwidth_for_stream(link, 0);
 		}
 	}
 
-- 
2.43.0

