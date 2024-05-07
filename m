Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8B8BF0D5
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143D112FFB;
	Tue,  7 May 2024 23:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRDy9+kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A750112FFB;
 Tue,  7 May 2024 23:11:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB69661A24;
 Tue,  7 May 2024 23:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC90C4AF67;
 Tue,  7 May 2024 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123514;
 bh=mPcqWpgLLmQeWUDSJ4hNN9EzC8IWpkeYOeDyImY9/zI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KRDy9+kn2xhSxRz+hJW2AaYQarIqR1aFl4isVZP9CrcDqM6yA0OFed3YBWnAKU1/3
 Mm2iMwFuQRRqB6sDigTMq4BL8qu0M1Qb302/j2zuUrY442VTWBiA3fsPcOk8T7jw+G
 1zeM9vIzToi0+T6Qy+rpoHLVNtAd4bBE551XBQlpg26AIgzuwfVCT/vq5OXJBbLJeW
 yYumM6xUL66EjMNEDUQHgvrzL75HCdvMAAqk1Q0s90j8ynrwn2HT5vPNnIxWomr7k6
 MVYqdBmrAE5UjceJiAx7yWD/GH2jQS41jiRws8doMvVSkjk8FFDUrA+0HtRKt90uRY
 nQPzLMCRfy15g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sung Joon Kim <sungjoon.kim@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, jun.lei@amd.com, wenjing.liu@amd.com,
 aric.cyr@amd.com, dillon.varone@amd.com, chiawen.huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 34/43] drm/amd/display: Disable seamless boot on
 128b/132b encoding
Date: Tue,  7 May 2024 19:09:55 -0400
Message-ID: <20240507231033.393285-34-sashal@kernel.org>
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

From: Sung Joon Kim <sungjoon.kim@amd.com>

[ Upstream commit 6f0c228ed9184287031a66b46a79e5a3d2e73a86 ]

[why]
preOS will not support display mode programming and link training
for UHBR rates.

[how]
If we detect a sink that's UHBR capable, disable seamless boot

Reviewed-by: Anthony Koo <anthony.koo@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Sung Joon Kim <sungjoon.kim@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 46b10ff8f6d41..72db370e2f21f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1710,6 +1710,9 @@ bool dc_validate_boot_timing(const struct dc *dc,
 		return false;
 	}
 
+	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)
+		return false;
+
 	if (dc->link_srv->edp_is_ilr_optimization_required(link, crtc_timing)) {
 		DC_LOG_EVENT_LINK_TRAINING("Seamless boot disabled to optimize eDP link rate\n");
 		return false;
-- 
2.43.0

