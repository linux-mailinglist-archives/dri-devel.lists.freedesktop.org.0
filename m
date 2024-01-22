Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1F83663F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D7510F2C1;
	Mon, 22 Jan 2024 15:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E2910F2CD;
 Mon, 22 Jan 2024 15:00:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 966BCCE2B10;
 Mon, 22 Jan 2024 15:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CF3C433F1;
 Mon, 22 Jan 2024 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935640;
 bh=TUaHewwRDkOKCmO6wFsLmMkfHc9ooD1imeaxcYUU8qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BUFrCnGnpX4f9l6PiLAM5OheuDqT1sEBLqO68oqaq3nJgdIvqVS8iGzzMIcs0IWXO
 ff+fkFnzy8Exbc8R1uWb7liWT+wDCfaGvHgEOVQzuKD+jHV9FL2OExo+g4OAw8WOY3
 b8YUP3AsSJ7lkNUUcXh4FoPalPq/iSTpIjlXiTmjvcCCwj43yARMft9f4vucrlvELC
 jpwk1N3XyzPvO1CdQ2rfQc4TWs8wt9XFKxAqDq6Chh7D/0hW2krY4dNH05D3H1U4TR
 77/ZV5Ed4x1tYB2CtsDAWRhjdBOlIWBl0YeSspuwo2imyrF4dm3jOvd6rf6PaUQ4J6
 zMC2XHnFh8CFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 68/88] drm/amd/display: Fix lightup regression
 with DP2 single display configs
Date: Mon, 22 Jan 2024 09:51:41 -0500
Message-ID: <20240122145608.990137-68-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <charlene.liu@amd.com>,
 dillon.varone@amd.com, sunpeng.li@amd.com, airlied@gmail.com,
 Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 syed.hassan@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, gabe.teeger@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungkim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[ Upstream commit 5a82b8d6c05f9b30828ede1b103b9ee5cb5c912e ]

[WHY]
Previous fix for multiple displays downstream of DP2 MST hub caused regression

[HOW]
Match sink IDs instead of sink struct addresses

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
index 2498b8341199..d6a68484153c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
@@ -157,6 +157,14 @@ bool is_dp2p0_output_encoder(const struct pipe_ctx *pipe_ctx)
 {
 	/* If this assert is hit then we have a link encoder dynamic management issue */
 	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
+	/* Count MST hubs once by treating only 1st remote sink in topology as an encoder */
+	if (pipe_ctx->stream->link && pipe_ctx->stream->link->remote_sinks[0]) {
+		return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
+			pipe_ctx->link_res.hpo_dp_link_enc &&
+			dc_is_dp_signal(pipe_ctx->stream->signal) &&
+			(pipe_ctx->stream->link->remote_sinks[0]->sink_id == pipe_ctx->stream->sink->sink_id));
+	}
+
 	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
 		pipe_ctx->link_res.hpo_dp_link_enc &&
 		dc_is_dp_signal(pipe_ctx->stream->signal));
-- 
2.43.0

