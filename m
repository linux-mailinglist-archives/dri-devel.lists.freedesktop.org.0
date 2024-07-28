Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDEC93E5FA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2AC10E1DB;
	Sun, 28 Jul 2024 15:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KbcBhcob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9C10E1DA;
 Sun, 28 Jul 2024 15:42:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4345ECE094B;
 Sun, 28 Jul 2024 15:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A86C116B1;
 Sun, 28 Jul 2024 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181359;
 bh=FR6ZHIVNzRpIwImRqh2JQDTV5HWYxLHkbIVgP0YcBxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KbcBhcobBL+yztXhVtG0tss5xwZ853gsqnvnC/vC+cko9B84nmf811Mli4r4KZB8H
 ZuQBhP58fMIz+sFkVwxxMaHYINbmKgrqDtmqSQRIJyXBjWJf1LHqlog/uIY4ZwRWE0
 f/OV8aUS2QkirM2WkNeP+VR+Xe2w9K6m4a7GvalagpL4HeSNO3Ex3E6QPVzfLecSXZ
 Aue5WyF+fyc+PTb9bQRc0aDit5JzmcSwcnN5Sj2toHEMh4tCr+hD5uhyQvxRw4k0qi
 SZYywSJfTUQT/odU2cDXB/fdmD/gU+jW1LecIdfNE2mfYlKYRAyjSdYA3c6uCdmXD9
 Nb1NAPpiAMXsQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sung-huai Wang <danny.wang@amd.com>, Robin Chen <robin.chen@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, hersenxs.wu@amd.com, dennis.chan@amd.com,
 alex.hung@amd.com, hamza.mahfooz@amd.com, chuntao.tso@amd.com,
 george.shen@amd.com, Bhawanpreet.Lakha@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 02/34] drm/amd/display: Handle HPD_IRQ for
 internal link
Date: Sun, 28 Jul 2024 11:40:26 -0400
Message-ID: <20240728154230.2046786-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
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

From: Sung-huai Wang <danny.wang@amd.com>

[ Upstream commit 239b31bd5c3fef3698440bf6436b2068c6bb08a3 ]

[Why]
TCON data is corrupted after electro static discharge test.
Once the TCON data get corrupted, they will get themselves
reset and send HPD_IRQ to source side.

[How]
Support HPD_IRQ for internal link, and restore the PSR/Replay setup.

Reviewed-by: Robin Chen <robin.chen@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Sung-huai Wang <danny.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_irq_handler.c   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index 0fcf0b8530acf..659b8064d3618 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -373,6 +373,7 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 	union device_service_irq device_service_clear = {0};
 	enum dc_status result;
 	bool status = false;
+	bool allow_active = false;
 
 	if (out_link_loss)
 		*out_link_loss = false;
@@ -427,12 +428,6 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 		return false;
 	}
 
-	if (handle_hpd_irq_psr_sink(link))
-		/* PSR-related error was detected and handled */
-		return true;
-
-	handle_hpd_irq_replay_sink(link);
-
 	/* If PSR-related error handled, Main link may be off,
 	 * so do not handle as a normal sink status change interrupt.
 	 */
@@ -454,9 +449,8 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 	 * If we got sink count changed it means
 	 * Downstream port status changed,
 	 * then DM should call DC to do the detection.
-	 * NOTE: Do not handle link loss on eDP since it is internal link*/
-	if ((link->connector_signal != SIGNAL_TYPE_EDP) &&
-			dp_parse_link_loss_status(
+	 */
+	if (dp_parse_link_loss_status(
 					link,
 					&hpd_irq_dpcd_data)) {
 		/* Connectivity log: link loss */
@@ -465,6 +459,11 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 					sizeof(hpd_irq_dpcd_data),
 					"Status: ");
 
+		if (link->psr_settings.psr_feature_enabled)
+			edp_set_psr_allow_active(link, &allow_active, true, false, NULL);
+		else if (link->replay_settings.replay_allow_active)
+			edp_set_replay_allow_active(link, &allow_active, true, false, NULL);
+
 		if (defer_handling && has_left_work)
 			*has_left_work = true;
 		else
@@ -477,6 +476,14 @@ bool dp_handle_hpd_rx_irq(struct dc_link *link,
 		dp_trace_link_loss_increment(link);
 	}
 
+	if (*out_link_loss == false) {
+		if (handle_hpd_irq_psr_sink(link))
+			/* PSR-related error was detected and handled */
+			return true;
+
+		handle_hpd_irq_replay_sink(link);
+	}
+
 	if (link->type == dc_connection_sst_branch &&
 		hpd_irq_dpcd_data.bytes.sink_cnt.bits.SINK_COUNT
 			!= link->dpcd_sink_count)
-- 
2.43.0

