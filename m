Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5AAA9F8C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CBC10E475;
	Mon,  5 May 2025 22:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o/ffQbya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B294D10E475;
 Mon,  5 May 2025 22:24:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5556AA4CCF3;
 Mon,  5 May 2025 22:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AF6C4CEE4;
 Mon,  5 May 2025 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483864;
 bh=xF8SmHu4JDO2uxxWJ+km3PqAGMefMdeEyhaIJCZaJu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/ffQbyaFlOSywDkmPigan83H+IfUfk1jL+xE0uhCdviw5MVWsPS+yotIPcCdJiT7
 ZUopYKKbmcC7PsO0arGsFALDfIf2/iyj7kWnu1yuvjo1uKXyO3qCFwrTdbRDZMWo8t
 F6nHOaUFtjJln+6GdCm2BvyF+YvxdYUzUsPHCgluT6ON+p5lWn4/Mm8/8CJ+YkhS/J
 IekuslfyBi1V1vGZu9kyfxKG28otqFiHF/edxqgrkeBe1QIXxqwUwzWbeZ4rGX0QBx
 zIi0guKl5uHThRG8I7KovfQXP34IzQkT+7I4F491N6Yvt0+N7ecx6cOEdL/W/YPGBz
 51Doju6S0hmeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dillon Varone <Dillon.Varone@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, chiahsuan.chung@amd.com,
 Alvin.Lee2@amd.com, alex.hung@amd.com, Leo.Zeng@amd.com,
 Ilya.Bakoulin@amd.com, Iswara.Nagulendran@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 252/642] drm/amd/display: Fix p-state type when
 p-state is unsupported
Date: Mon,  5 May 2025 18:07:48 -0400
Message-Id: <20250505221419.2672473-252-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Dillon Varone <Dillon.Varone@amd.com>

[ Upstream commit a025f424af0407b7561bd5e6217295dde3abbc2e ]

[WHY&HOW]
P-state type would remain on previously used when unsupported which
causes confusion in logging and visual confirm, so set back to zero
when unsupported.

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Dillon Varone <Dillon.Varone@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index a49604b7701f7..1406ee4bff801 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -563,6 +563,7 @@ void set_p_state_switch_method(
 	if (!dc->ctx || !dc->ctx->dmub_srv || !pipe_ctx || !vba)
 		return;
 
+	pipe_ctx->p_state_type = P_STATE_UNKNOWN;
 	if (vba->DRAMClockChangeSupport[vba->VoltageLevel][vba->maxMpcComb] !=
 			dm_dram_clock_change_unsupported) {
 		/* MCLK switching is supported */
-- 
2.39.5

