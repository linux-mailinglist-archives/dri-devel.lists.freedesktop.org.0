Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B156F798F9D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9968910E927;
	Fri,  8 Sep 2023 19:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DBC10E921;
 Fri,  8 Sep 2023 19:33:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50781B821E3;
 Fri,  8 Sep 2023 19:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80BBC433AD;
 Fri,  8 Sep 2023 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201607;
 bh=FXSE4CpZ/0Ds2ld/DVqB9buDtP+6BhxVHcVMek9vcv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VyFwlmlpa9IvDvXyBZeiezJ3+Lqjitfq6okjmwBkWB3Y2kYC4Bg43pQ/jFjQJ5wla
 XlB2Tf6tcxOrgHjR7ec1BUd2KsnoZQISC5/V/CenfTXrx6yAhSQ3J+a0kCWyLntp65
 1yb1lfJRKTQi4cRrF0u64IgSiKDScHzm/KkTXUqWILHVXPVSdEiZAngrg+jBLUcFBa
 N0pALa9BptHtBF/NLT+2dZrCmtytu3AO/TugZT54rYbuFydtfiv5N8cwJ85kgoQXww
 zQDb7BqIC9hpChDaUbd8CXY2vBm9s4Q7e6skUjTYJ1Mmy8CQJyLFQUVeNhq+JyOkHd
 ITPZFDOvwl9MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 19/31] drm/amd/display: Blocking invalid 420 modes
 on HDMI TMDS for DCN31
Date: Fri,  8 Sep 2023 15:31:48 -0400
Message-Id: <20230908193201.3462957-19-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Tom Chung <chiahsuan.chung@amd.com>, sunpeng.li@amd.com,
 Leo Chen <sancchen@amd.com>, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, nathan@kernel.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, Dmytro.Laktyushkin@amd.com,
 yang.lee@linux.alibaba.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul.Hsieh@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Chen <sancchen@amd.com>

[ Upstream commit 026a71babf48efb6b9884a3a66fa31aec9e1ea54 ]

[Why & How]
HDMI TMDS does not have ODM support. Filtering 420 modes that
exceed the 4096 FMT limitation on DCN31 will resolve
intermittent corruptions issues.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Leo Chen <sancchen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index a0f44eef7763f..316335be71d0d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -4135,7 +4135,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				}
 				if (v->OutputFormat[k] == dm_420 && v->HActive[k] > DCN31_MAX_FMT_420_BUFFER_WIDTH
 						&& v->ODMCombineEnablePerState[i][k] != dm_odm_combine_mode_4to1) {
-					if (v->HActive[k] / 2 > DCN31_MAX_FMT_420_BUFFER_WIDTH) {
+					if (v->Output[k] == dm_hdmi) {
+						FMTBufferExceeded = true;
+					} else if (v->HActive[k] / 2 > DCN31_MAX_FMT_420_BUFFER_WIDTH) {
 						v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_4to1;
 						v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithODMCombine4To1;
 
-- 
2.40.1

