Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E01C8E55
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 16:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10426E114;
	Thu,  7 May 2020 14:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1089807;
 Thu,  7 May 2020 14:27:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE18120A8B;
 Thu,  7 May 2020 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588861672;
 bh=n1mz1mu8yVWyo3xoJFTGzVFj2+WDzOfgdPH4m6e8cBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EHpFiZkFcID4GLw7zPYtAHdAttiPSEs4St2oh7N3TtWXYgokJ9t3HN1tZXuvfG2+e
 RHPMlwF2q6x1voyZZcIldPXjmls8c/4ySjtdXaCkGRiV9D8rtHaF9rQaFN1YBTcifq
 Jq4xwu8r9L4oY635f5kcna54l+5zVBSaFuCByORA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 21/50] drm/amd/display: blank dp stream before
 re-train the link
Date: Thu,  7 May 2020 10:26:57 -0400
Message-Id: <20200507142726.25751-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507142726.25751-1-sashal@kernel.org>
References: <20200507142726.25751-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Xiaodong Yan <Xiaodong.Yan@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaodong Yan <Xiaodong.Yan@amd.com>

[ Upstream commit 718a5569b6fa6e1f49f1ae76a3c18acb4ddb74f1 ]

[Why]
When link loss happened, monitor can not light up if only re-train the
link.

[How]
Blank all the DP streams on this link before re-train the link, and then
unblank the stream

Signed-off-by: Xiaodong Yan <Xiaodong.Yan@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index fd9e69634c50a..1b6c75a4dd60a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2885,6 +2885,12 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 					sizeof(hpd_irq_dpcd_data),
 					"Status: ");
 
+		for (i = 0; i < MAX_PIPES; i++) {
+			pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+			if (pipe_ctx && pipe_ctx->stream && pipe_ctx->stream->link == link)
+				link->dc->hwss.blank_stream(pipe_ctx);
+		}
+
 		for (i = 0; i < MAX_PIPES; i++) {
 			pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
 			if (pipe_ctx && pipe_ctx->stream && pipe_ctx->stream->link == link)
@@ -2904,6 +2910,12 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
 			dc_link_reallocate_mst_payload(link);
 
+		for (i = 0; i < MAX_PIPES; i++) {
+			pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+			if (pipe_ctx && pipe_ctx->stream && pipe_ctx->stream->link == link)
+				link->dc->hwss.unblank_stream(pipe_ctx, &previous_link_settings);
+		}
+
 		status = false;
 		if (out_link_loss)
 			*out_link_loss = true;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
