Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156C798F9F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF0710E928;
	Fri,  8 Sep 2023 19:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDEE10E929;
 Fri,  8 Sep 2023 19:33:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C8D9B821D4;
 Fri,  8 Sep 2023 19:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E06C433C8;
 Fri,  8 Sep 2023 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201614;
 bh=JMKvFF/mO4Fy7zywmrn6rJrOXMgKA2FB+Jkhi/pphAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ma7/2v9Iu1+C9RRNzEp45QQwrlJ5Q3YWkELpmvTr3YejE4Dh2rW2i19eF06IzYy1k
 5V/Lq5t9p29h40n1Z1Z+HNKtRyOVAkOKxTEfM1WNPXn7gbN4WSvKWcI/MgoEHZYOcq
 SnW1Gn7cHmCvNJHNOoDrNAukkNV2hDPEe03AaiHSsRex+brtpYIh0rwIZvDobVSEu+
 c2fcZLXy+tvbl0EuplzzHpao2IGoZfFPjx+X+UXWG7zhV4/GXYFwuyMydYr+8zyfZL
 m2j4trJw7UNtKj3/yhy8ywbhS2xw1GCHl5nSPWvBnLAnYce3+5ZcAaO+l6o1+lDlbe
 kitSuWMFiREMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 20/31] drm/amd/display: Blocking invalid 420 modes
 on HDMI TMDS for DCN314
Date: Fri,  8 Sep 2023 15:31:49 -0400
Message-Id: <20230908193201.3462957-20-sashal@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Jun.Lei@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Leo Chen <sancchen@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, jerry.zuo@amd.com, sunpeng.li@amd.com,
 nathan@kernel.org, Daniel Wheeler <daniel.wheeler@amd.com>, Paul.Hsieh@amd.com,
 Daniel.Miess@amd.com, Tom Chung <chiahsuan.chung@amd.com>, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Dmytro.Laktyushkin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Chen <sancchen@amd.com>

[ Upstream commit 4c6107a653ccf361cb1b6ba35d558a1a5e6e57ac ]

[Why & How]
HDMI TMDS does not have ODM support. Filtering 420 modes that
exceed the 4096 FMT limitation on DCN314 will resolve
intermittent corruptions issues.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Leo Chen <sancchen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 7eb2173b7691e..168dca6e8fcd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -4227,7 +4227,9 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 				}
 				if (v->OutputFormat[k] == dm_420 && v->HActive[k] > DCN314_MAX_FMT_420_BUFFER_WIDTH
 						&& v->ODMCombineEnablePerState[i][k] != dm_odm_combine_mode_4to1) {
-					if (v->HActive[k] / 2 > DCN314_MAX_FMT_420_BUFFER_WIDTH) {
+					if (v->Output[k] == dm_hdmi) {
+						FMTBufferExceeded = true;
+					} else if (v->HActive[k] / 2 > DCN314_MAX_FMT_420_BUFFER_WIDTH) {
 						v->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_4to1;
 						v->PlaneRequiredDISPCLK = v->PlaneRequiredDISPCLKWithODMCombine4To1;
 
-- 
2.40.1

