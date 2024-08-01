Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52F943BC6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDD910E78A;
	Thu,  1 Aug 2024 00:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fiFg6IWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF8810E78A;
 Thu,  1 Aug 2024 00:30:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D624BCE17AC;
 Thu,  1 Aug 2024 00:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27C2C32786;
 Thu,  1 Aug 2024 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472234;
 bh=SQkQmydCD1MKuQ5o8AkQ1Z69JZ27Zuhdu2bvkrd+gqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fiFg6IWBowEredYkFK2dZb/iKmO7TaI0VHd5NlcIARu0qIHctYbRYSWyuiaZQncgS
 QwGPcAhuD1eOHBVKZOJhMp7t0qJxo7lwxHVib498Y+IMoItQZ7CWbBR4JUmG6Lf7lw
 9ZUPjukd2sMpf1cGQMvik537STlLxnmmqECAcm7FgoMUD4skK5hOZkZTUyZwoqS/+/
 TFwvL5RJTclzFXf6oVosTL7zG2XUec0MMBr3vw3qudDqn7wIzB0HkhivEkExgX+P0p
 oLBiGWWpSc1MFyb7HJVCP1MyetdffxktdnAF3ekSHwmMF2v0bdWNhAPUHtJiA8bz7d
 CEY26JeoMMhcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: winstang <winstang@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wenjing.liu@amd.com, jun.lei@amd.com, alex.hung@amd.com,
 hamza.mahfooz@amd.com, george.shen@amd.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 39/61] drm/amd/display: added NULL check at start
 of dc_validate_stream
Date: Wed, 31 Jul 2024 20:25:57 -0400
Message-ID: <20240801002803.3935985-39-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

From: winstang <winstang@amd.com>

[ Upstream commit 26c56049cc4f1705b498df013949427692a4b0d5 ]

[Why]
prevent invalid memory access

[How]
check if dc and stream are NULL

Co-authored-by: winstang <winstang@amd.com>
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: winstang <winstang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 83898e46bcadf..29400db42bb2d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3629,6 +3629,9 @@ void resource_build_bit_depth_reduction_params(struct dc_stream_state *stream,
 
 enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
 {
+	if (dc == NULL || stream == NULL)
+		return DC_ERROR_UNEXPECTED;
+
 	struct dc_link *link = stream->link;
 	struct timing_generator *tg = dc->res_pool->timing_generators[0];
 	enum dc_status res = DC_OK;
-- 
2.43.0

