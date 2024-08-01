Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7C943B44
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AEF10E7C9;
	Thu,  1 Aug 2024 00:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ujDWoIHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA6210E7C7;
 Thu,  1 Aug 2024 00:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7D3E6125E;
 Thu,  1 Aug 2024 00:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8085C4AF11;
 Thu,  1 Aug 2024 00:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471894;
 bh=JYUibu9T9JrFP6ao9bNLHOKxT2m4lvus2ioT4oQS0ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ujDWoIHvXaiavT0jTKod6CCHsY93oqFhuP8igjMqnow3el+YmlH0HFB5cnpL4rIn4
 Uk42vAzWoD6ra1yrxzJ9rjuhC7O0wRzzd+b0yhVgE5aAPe/IyZBli/8FxfBep6BC7D
 5AJv6I2bDxLC33hTya/cwi0gPsW5528WGARL0DFWuNd6apaVpdRrJ3GSrdh12oAfWY
 1rLVraphgxZ4hrBPRdT4g5qrMiEkBtvvvZFdoTS7LRbexMml56KSIhlRFPMBniqNOW
 o1W96f+XDGrodoIVDWrQbXTECqrUscaIDMs6TvgJ3jMSK9ivA/ap8LCDSOIJLAtcfJ
 Zwe8uZgdmT6/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wenjing Liu <wenjing.liu@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, george.shen@amd.com,
 michael.strauss@amd.com, Bhawanpreet.Lakha@amd.com, hersenxs.wu@amd.com,
 daniel.sa@amd.com, yao.wang1@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 53/83] drm/amd/display: use preferred link
 settings for dp signal only
Date: Wed, 31 Jul 2024 20:18:08 -0400
Message-ID: <20240801002107.3934037-53-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit abf34ca465f5cd182b07701d3f3d369c0fc04723 ]

[why]
We set preferred link settings for virtual signal. However we don't support
virtual signal for UHBR link rate. If preferred is set to UHBR link rate, we
will allow virtual signal with UHBR link rate which causes system crashes.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_capability.c    | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 16f4865e4246d..3d589072fe307 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -908,21 +908,17 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 
 	memset(link_setting, 0, sizeof(*link_setting));
 
-	/* if preferred is specified through AMDDP, use it, if it's enough
-	 * to drive the mode
-	 */
-	if (link->preferred_link_setting.lane_count !=
-			LANE_COUNT_UNKNOWN &&
-			link->preferred_link_setting.link_rate !=
-					LINK_RATE_UNKNOWN) {
+	if (dc_is_dp_signal(stream->signal)  &&
+			link->preferred_link_setting.lane_count != LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate != LINK_RATE_UNKNOWN) {
+		/* if preferred is specified through AMDDP, use it, if it's enough
+		 * to drive the mode
+		 */
 		*link_setting = link->preferred_link_setting;
-		return true;
-	}
-
-	/* MST doesn't perform link training for now
-	 * TODO: add MST specific link training routine
-	 */
-	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+	} else if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		/* MST doesn't perform link training for now
+		 * TODO: add MST specific link training routine
+		 */
 		decide_mst_link_settings(link, link_setting);
 	} else if (link->connector_signal == SIGNAL_TYPE_EDP) {
 		/* enable edp link optimization for DSC eDP case */
-- 
2.43.0

