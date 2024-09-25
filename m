Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E49858F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2B10E94D;
	Wed, 25 Sep 2024 11:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4jndXn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59D910E94D;
 Wed, 25 Sep 2024 11:48:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7626A43FAF;
 Wed, 25 Sep 2024 11:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F76C4CEC7;
 Wed, 25 Sep 2024 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264924;
 bh=AFwXJOkgoMGCltayCnMYAJh12Xq5EMKdHXXNNaJxk8w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X4jndXn5jtJ0sskEmkQfiKHZMLlcLsaIiWFnmLBDLXXdFmsRvKvq18olm7NhNmUma
 cNzbc3eeqbld0D+Tz0OFY/CgR8+M0u02f1a0fZ6CVadhEVXPMxCkEFz/R0OwQDj+R4
 7f/kgcBRcMSYAj5/8HP2o7lqmn3ZKpuSkINq1XkAGjGQCOf4rMRpTaYutKMf1GkQ63
 55WvAWsgUDRKaFoqBDwV3zo+d64CfZ3G0Yi9xCLs9GewD10OEWcBWs95bFLYjt+mdm
 mrXRE3RtlsozsM8/Pct0+bxEePfWZeQ1hLYHD+8ylUnRUzezwjZ1ISvMAQxdVBxKM8
 ZW83/QQz6akVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, wenjing.liu@amd.com,
 chaitanya.dhere@amd.com, dillon.varone@amd.com, joshua.aberback@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 181/244] drm/amd/display: Check phantom_stream
 before it is used
Date: Wed, 25 Sep 2024 07:26:42 -0400
Message-ID: <20240925113641.1297102-181-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 3718a619a8c0a53152e76bb6769b6c414e1e83f4 ]

dcn32_enable_phantom_stream can return null, so returned value
must be checked before used.

This fixes 1 NULL_RETURNS issue reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 6e2a08a9572b8..8bacff23c3563 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1720,6 +1720,9 @@ void dcn32_add_phantom_pipes(struct dc *dc, struct dc_state *context,
 	// be a valid candidate for SubVP (i.e. has a plane, stream, doesn't
 	// already have phantom pipe assigned, etc.) by previous checks.
 	phantom_stream = dcn32_enable_phantom_stream(dc, context, pipes, pipe_cnt, index);
+	if (!phantom_stream)
+		return;
+
 	dcn32_enable_phantom_plane(dc, context, phantom_stream, index);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-- 
2.43.0

