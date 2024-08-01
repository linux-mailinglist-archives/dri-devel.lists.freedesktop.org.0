Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90430943A82
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E2410E745;
	Thu,  1 Aug 2024 00:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CbCfuJ0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91110E745;
 Thu,  1 Aug 2024 00:15:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD1356143D;
 Thu,  1 Aug 2024 00:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AB2C32786;
 Thu,  1 Aug 2024 00:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471348;
 bh=dA7l3d8Pd4mirZyG70hAEWoWogxof8a8eZPJp9Xt6PY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CbCfuJ0u5uxEpcD71hLSzZuaSBT6TPaI/rR3MOippjRgcNZXxI/2EJFvCcsBg/XI/
 Fqwf/Iiw1fmFibMTw/E/9iiUardMIIjYNrH1U2HJJNlrXscYIpUkiJF/0OepEwG2Oe
 AlAXA3fgq6XVZ4cwGBliLJYsuGhUmEagHLM5f/IOifnEocYrY6NSqAks31xhzP6PkJ
 6dCg6N3I8BxpJnnTL7J35mQopHf0eZnozL38tqTbQbLkIWaQnYP1hFGsa2TmYBkL7p
 n4bHsNLpwUUMy1OfwT2ebltFn4zj7ZC7kgUE+hMR3EhxRvd5v/IUhfMZPFzM9fQC8o
 kB9Nr78OUPdyQ==
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
 michael.strauss@amd.com, ran.shi@amd.com, sungjoon.kim@amd.com,
 daniel.sa@amd.com, yao.wang1@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 077/121] drm/amd/display: use preferred link
 settings for dp signal only
Date: Wed, 31 Jul 2024 20:00:15 -0400
Message-ID: <20240801000834.3930818-77-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
index b26faed3bb206..a3df1b55e48b7 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -914,21 +914,17 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 
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

