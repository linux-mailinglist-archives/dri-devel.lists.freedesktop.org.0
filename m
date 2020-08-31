Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BA257C86
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6C6E38A;
	Mon, 31 Aug 2020 15:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A326E38A;
 Mon, 31 Aug 2020 15:31:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 957C9207EA;
 Mon, 31 Aug 2020 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887868;
 bh=5cTymgNOd6yMe07rM04lmyuuYPSuueVZ4FEQI/Htjg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=smdiVUxvy2D2OsQb1dejShNpoqJ56v6XUj16HrEt+0RIcS2P3wq5xmYEXLefp3DOO
 uI7KUcRwGBpGlYdHQgmkIRNn8Jt1MsQ5J5N7rhwNilg6yLEUzaNIIx+1G2EB4t8ump
 goc0xwhQdN+ZtTyJg2LyaG5Ns4qKwmn2oeXt0e94=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 18/23] drm/amd/display: Reject overlay plane
 configurations in multi-display scenarios
Date: Mon, 31 Aug 2020 11:30:34 -0400
Message-Id: <20200831153039.1024302-18-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831153039.1024302-1-sashal@kernel.org>
References: <20200831153039.1024302-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 168f09cdadbd547c2b202246ef9a8183da725f13 ]

[Why]
These aren't stable on some platform configurations when driving
multiple displays, especially on higher resolution.

In particular the delay in asserting p-state and validating from
x86 outweights any power or performance benefit from the hardware
composition.

Under some configurations this will manifest itself as extreme stutter
or unresponsiveness especially when combined with cursor movement.

[How]
Disable these for now. Exposing overlays to userspace doesn't guarantee
that they'll be able to use them in any and all configurations and it's
part of the DRM contract to have userspace gracefully handle validation
failures when they occur.

Valdiation occurs as part of DC and this in particular affects RV, so
disable this in dcn10_global_validation.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 1599bb9711111..e860ae05feda1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -1151,6 +1151,7 @@ static enum dc_status dcn10_validate_global(struct dc *dc, struct dc_state *cont
 	bool video_large = false;
 	bool desktop_large = false;
 	bool dcc_disabled = false;
+	bool mpo_enabled = false;
 
 	for (i = 0; i < context->stream_count; i++) {
 		if (context->stream_status[i].plane_count == 0)
@@ -1159,6 +1160,9 @@ static enum dc_status dcn10_validate_global(struct dc *dc, struct dc_state *cont
 		if (context->stream_status[i].plane_count > 2)
 			return DC_FAIL_UNSUPPORTED_1;
 
+		if (context->stream_status[i].plane_count > 1)
+			mpo_enabled = true;
+
 		for (j = 0; j < context->stream_status[i].plane_count; j++) {
 			struct dc_plane_state *plane =
 				context->stream_status[i].plane_states[j];
@@ -1182,6 +1186,10 @@ static enum dc_status dcn10_validate_global(struct dc *dc, struct dc_state *cont
 		}
 	}
 
+	/* Disable MPO in multi-display configurations. */
+	if (context->stream_count > 1 && mpo_enabled)
+		return DC_FAIL_UNSUPPORTED_1;
+
 	/*
 	 * Workaround: On DCN10 there is UMC issue that causes underflow when
 	 * playing 4k video on 4k desktop with video downscaled and single channel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
