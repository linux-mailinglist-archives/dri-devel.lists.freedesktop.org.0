Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7E299D29
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 01:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FF06EA9D;
	Tue, 27 Oct 2020 00:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574946EA9C;
 Tue, 27 Oct 2020 00:05:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 532162087C;
 Tue, 27 Oct 2020 00:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757104;
 bh=zW4vx8Z/ihWOBWx+tUKY5/hL3tuVa2QCgqmlbsp/0bI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BIqTwFaBT9k6KIgq1gA/HUKrr9Z1yb8GkqpI0LaAHB0Q4IGwPIKsyQ1o7ZWR4VGed
 4pNN/aXnso91067K9YZnrnO/7yReFuC45CmeUiVNkg0JyYvqUGm6SmCy2SZeDgq6Dd
 INNG7hq+a2aNkbW2cDZVQ8fE27jk9NGl+0fHwzFY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 41/60] drm/amd/display: HDMI remote sink need
 mode validation for Linux
Date: Mon, 26 Oct 2020 20:03:56 -0400
Message-Id: <20201027000415.1026364-41-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000415.1026364-1-sashal@kernel.org>
References: <20201027000415.1026364-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eryk Brol <eryk.brol@amd.com>,
 amd-gfx@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit 95d620adb48f7728e67d82f56f756e8d451cf8d2 ]

[Why]
Currently mode validation is bypassed if remote sink exists. That
leads to mode set issue when a BW bottle neck exists in the link path,
e.g., a DP-to-HDMI converter that only supports HDMI 1.4.

Any invalid mode passed to Linux user space will cause the modeset
failure due to limitation of Linux user space implementation.

[How]
Mode validation is skipped only if in edid override. For real remote
sink, clock limit check should be done for HDMI remote sink.

Have HDMI related remote sink going through mode validation to
elimiate modes which pixel clock exceeds BW limitation.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 2fb2c683ad54b..fa0e6c8e2447c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2009,7 +2009,7 @@ enum dc_status dc_link_validate_mode_timing(
 	/* A hack to avoid failing any modes for EDID override feature on
 	 * topology change such as lower quality cable for DP or different dongle
 	 */
-	if (link->remote_sinks[0])
+	if (link->remote_sinks[0] && link->remote_sinks[0]->sink_signal == SIGNAL_TYPE_VIRTUAL)
 		return DC_OK;
 
 	/* Passive Dongle */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
