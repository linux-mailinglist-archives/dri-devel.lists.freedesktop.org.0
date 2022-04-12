Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF344FCA2B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8A10FAF1;
	Tue, 12 Apr 2022 00:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41B10FAF1;
 Tue, 12 Apr 2022 00:49:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E2C161842;
 Tue, 12 Apr 2022 00:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85054C385A3;
 Tue, 12 Apr 2022 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724564;
 bh=w7aXpuwOrzhppGfZ0NAyhIFazOsTIW/sc7x6w0mpvO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sbZi6wSO054UbIYStQaMjEtv6pSpjTUTPhc5BtI+PU+53KA5R73RGr38z1Y+4Fqnk
 zHWyWqHB8JaweYbOrSlwK3yHVclF8Fj7wLf8UDDuwVxoi74zsD+UHnxQrKzzgcwdhp
 EGicGQ2XZTkBSeKEx3TDjGw3ugcyD+6V3DdXPbvSCiLZXfVrMPWmLtyNoh7/5qmKCJ
 rHg+BTHXF3r9Fnlw20Wya4Rut/f/9plkk8baAsKtwt+DmCkEok63372fxPHLenuLW8
 vCq0pzw9i5RHipgrw6jjVGGkazM51+1wp3KVP+12C22qo3H+AEzomreitObCLxbtAR
 sYEly7bDVdC4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/30] drm/amd/display: FEC check in timing
 validation
Date: Mon, 11 Apr 2022 20:48:39 -0400
Message-Id: <20220412004906.350678-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004906.350678-1-sashal@kernel.org>
References: <20220412004906.350678-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, Jun.Lei@amd.com, lee.jones@linaro.org,
 Jimmy.Kizito@amd.com, Sasha Levin <sashal@kernel.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, michael.strauss@amd.com,
 Alex Hung <alex.hung@amd.com>, Chiawen Huang <chiawen.huang@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Martin.Leung@amd.com,
 Eric.Yang2@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>, roy.chan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chiawen Huang <chiawen.huang@amd.com>

[ Upstream commit 7d56a154e22ffb3613fdebf83ec34d5225a22993 ]

[Why]
disable/enable leads FEC mismatch between hw/sw FEC state.

[How]
check FEC status to fastboot on/off.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chiawen Huang <chiawen.huang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 93f5229c303e..ac5323596c65 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1173,6 +1173,10 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
 	if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
 		return false;
 
+	/* Check for FEC status*/
+	if (link->link_enc->funcs->fec_is_active(link->link_enc))
+		return false;
+
 	enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 
 	if (enc_inst == ENGINE_ID_UNKNOWN)
-- 
2.35.1

