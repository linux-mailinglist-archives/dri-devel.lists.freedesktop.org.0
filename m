Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFD943AD5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179C310E345;
	Thu,  1 Aug 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B6JhSkWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64810E76A;
 Thu,  1 Aug 2024 00:21:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24248CE17D8;
 Thu,  1 Aug 2024 00:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87B8C116B1;
 Thu,  1 Aug 2024 00:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471672;
 bh=89FfziLV5sHr6MLxIivB2F/+Pw47DQ+9bnql9lzbtZ0=;
 h=From:To:Cc:Subject:Date:From;
 b=B6JhSkWVPdifm9vT2T2WtjN/82ei9XF+MgAkYOvYzfXaSEBFOETekcgBKeYybn3SL
 ae9LFE04fnTcJnlWOXVZ3+5H77I9ZdEtspiTQhP3Hx1uC0reB5OGvu6KiTkfIEpHEd
 WDyd2GLuOpj4iABqnPMyjWfUXwEB1NIPdrf1SokjVmKyGhtN60pNnR3hult6KquxYo
 YaeVQSRTWc2jchsN9462GnGMKIReGt/dFNOp1kdp5ACkC+OZcovenP6rq0mVCCbw//
 +xwnfBFD9x1ZWEZx5vCPVL2ND6pN8OD4FCDLyiMKVlWbWt2hclD2aBWvSt2pu8fSDd
 Juwg+lzmqiM8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alvin Lee <alvin.lee2@amd.com>, Sohaib Nadeem <sohaib.nadeem@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wenjing.liu@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 01/83] drm/amd/display: Assign
 linear_pitch_alignment even for VM
Date: Wed, 31 Jul 2024 20:17:16 -0400
Message-ID: <20240801002107.3934037-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit 984debc133efa05e62f5aa1a7a1dd8ca0ef041f4 ]

[Description]
Assign linear_pitch_alignment so we don't cause a divide by 0
error in VM environments

Reviewed-by: Sohaib Nadeem <sohaib.nadeem@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 72db370e2f21f..50e643bfdfbad 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1298,6 +1298,7 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 		return NULL;
 
 	if (init_params->dce_environment == DCE_ENV_VIRTUAL_HW) {
+		dc->caps.linear_pitch_alignment = 64;
 		if (!dc_construct_ctx(dc, init_params))
 			goto destruct_dc;
 	} else {
-- 
2.43.0

