Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCF9D706A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1820110E4CB;
	Sun, 24 Nov 2024 13:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E3sifbi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785A10E4CB;
 Sun, 24 Nov 2024 13:33:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8EA7FA40AC3;
 Sun, 24 Nov 2024 13:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DB4C4CECC;
 Sun, 24 Nov 2024 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455231;
 bh=X/174+9QZj5SHgLJYYgYDwPo+NQCes8A7vKNxrCJwXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3sifbi6MgqYXmxBqJKgPFFqwhRn0/9CySSzERWUlrXE4McS0tRI572vuLdyAsrrE
 DTCIJB4ix+fmcIpTbqIUzx/x8IgGc5mnTf1vwZcNCKXxMqZDRWRuK88fh8EhAgOvhg
 vn2DzJjkX3rTYJkB2pGk+cggFdpaJ774v/48j77PcVcu+QJYtl5AcfDaNYzRXM7bqP
 dfgvjRUkqJ8jJ/TZs9vh5W3gKb1o7BC4mFEnd9WCU1kGcmmcjZThxO4PCGAgWT41Li
 gB9POzeolV7nZdEW/IShTh6Wn01LzsjN4XRoT2nzwTlJ7zQzYeXCM8BCbH4wOTJwUI
 CWlg8o7iMkJ3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fudongwang <Fudong.Wang@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wenjing.liu@amd.com, wayne.lin@amd.com, yi-lchen@amd.com,
 alvin.lee2@amd.com, george.shen@amd.com, Zhongwei.Zhang@amd.com,
 dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 021/107] drm/amd/display: skip disable CRTC in
 seemless bootup case
Date: Sun, 24 Nov 2024 08:28:41 -0500
Message-ID: <20241124133301.3341829-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Fudongwang <Fudong.Wang@amd.com>

[ Upstream commit 0e37e4b9afbd08df1f00a70bbb4d1ec273d18c9e ]

Resync FIFO is a workaround to write the same value to
DENTIST_DISPCLK_CNTL register after programming OTG_PIXEL_RATE_DIV
register, in case seemless boot, there is no OTG_PIXEL_RATE_DIV register
update, so skip CRTC disable when resync FIFO to avoid random FIFO error
and garbage.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Fudongwang <Fudong.Wang@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index 4e93eeedfc1bb..a8e04a39a19e5 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -371,7 +371,9 @@ void dcn314_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc
 		if (pipe->top_pipe || pipe->prev_odm_pipe)
 			continue;
 
-		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal)) &&
+			!pipe->stream->apply_seamless_boot_optimization &&
+			!pipe->stream->apply_edp_fast_boot_optimization) {
 			pipe->stream_res.tg->funcs->disable_crtc(pipe->stream_res.tg);
 			reset_sync_context_for_pipe(dc, context, i);
 			otg_disabled[i] = true;
-- 
2.43.0

