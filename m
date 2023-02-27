Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC26A365F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB910E17E;
	Mon, 27 Feb 2023 02:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3C10E17E;
 Mon, 27 Feb 2023 02:01:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19109B80CAA;
 Mon, 27 Feb 2023 02:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC50C433EF;
 Mon, 27 Feb 2023 02:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463292;
 bh=3oJe9ZFHRxrJlsZBgZlKAG3xSb8P8ndY3G4IeDVQAkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gEgca/eZE41hzzpxjsg6BBysvsseD58JvMxKAeV7lFBpOAQz8Uh8ISLAwBKeJvpUI
 gxHzazX6tiQetRl6hfC3aTAj3k6Wnu8mrezrj7ZeZ9NAekNDcQudjO0WoI+nkF6+8V
 NXR5/yf7BlD4aNJ+tKlw2S0piy7MPsFu6hIpNcC492zO5CrftL+SmoFBBAHjx+Nr+F
 1KmBmjs8rKQGMxZ5La4d9Hl+ZRUoPzzASw26r9X4aDlplFLSoulegrOe8b3E7+0PSp
 jehogaWnSDfucob+LpLHIuwxYacktQF7LRzHwjbgzXRQM4uY3fBZuDt1e42OhFFQN7
 IRpGk4BIzcz/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 09/60] drm/amd/display: Defer DIG FIFO disable
 after VID stream enable
Date: Sun, 26 Feb 2023 20:59:54 -0500
Message-Id: <20230227020045.1045105-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, HaoPing.Liu@amd.com, Charlene.Liu@amd.com,
 sunpeng.li@amd.com, sancchen@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Syed Hassan <Syed.Hassan@amd.com>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 2d90a1c054831338d57b39aec4d273cf3e867590 ]

[Why]
On some monitors we see a brief flash of corruption during the
monitor disable sequence caused by FIFO being disabled in the middle
of an active DP stream.

[How]
Wait until DP vid stream is disabled before turning off the FIFO.

The FIFO reset on DP unblank should take care of clearing any FIFO
error, if any.

Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Syed Hassan <Syed.Hassan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
index 38842f938bed0..0926db0183383 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
@@ -278,10 +278,10 @@ static void enc314_stream_encoder_dp_blank(
 	struct dc_link *link,
 	struct stream_encoder *enc)
 {
-	/* New to DCN314 - disable the FIFO before VID stream disable. */
-	enc314_disable_fifo(enc);
-
 	enc1_stream_encoder_dp_blank(link, enc);
+
+	/* Disable FIFO after the DP vid stream is disabled to avoid corruption. */
+	enc314_disable_fifo(enc);
 }
 
 static void enc314_stream_encoder_dp_unblank(
-- 
2.39.0

