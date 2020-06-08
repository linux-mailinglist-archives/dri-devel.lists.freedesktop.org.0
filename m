Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A81F23B5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77186E9B6;
	Mon,  8 Jun 2020 23:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA56E9B5;
 Mon,  8 Jun 2020 23:17:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6198B2083E;
 Mon,  8 Jun 2020 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658266;
 bh=HTQXwy4hfn0GnYPnVOAVpxQx4T3zMeWsNO3v/JrvKpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yhD85PM4p4FEZeBnT/dwKEabSKDXNejyIlI9s5Dxyaz0jNLpYfkx3o2o3PBk4Br2M
 1eeNNLJl1FuZy9be6AEllw0UBL2550DJjdFmorrkauvpryobvMYsljeAsQqTBczSJT
 s+/8x3EbRlwK6nOfXOMllCcRo9P/bG42VW/r0XS8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 273/606] drm/amd/amdgpu: Update update_config()
 logic
Date: Mon,  8 Jun 2020 19:06:38 -0400
Message-Id: <20200608231211.3363633-273-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

[ Upstream commit 650e723cecf2738dee828564396f3239829aba83 ]

[Why]
For MST case: when update_config is called to disable a stream,
this clears the settings for all the streams on that link.
We should only clear the settings for the stream that was disabled.

[How]
Clear the settings after the call to remove display is called.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 3abeff7722e3..e80371542622 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -316,15 +316,15 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
 	struct mod_hdcp_display *display = &hdcp_work[link_index].display;
 	struct mod_hdcp_link *link = &hdcp_work[link_index].link;
 
-	memset(display, 0, sizeof(*display));
-	memset(link, 0, sizeof(*link));
-
-	display->index = aconnector->base.index;
-
 	if (config->dpms_off) {
 		hdcp_remove_display(hdcp_work, link_index, aconnector);
 		return;
 	}
+
+	memset(display, 0, sizeof(*display));
+	memset(link, 0, sizeof(*link));
+
+	display->index = aconnector->base.index;
 	display->state = MOD_HDCP_DISPLAY_ACTIVE;
 
 	if (aconnector->dc_sink != NULL)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
