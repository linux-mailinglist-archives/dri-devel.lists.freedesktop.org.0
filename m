Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2F371970
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1146E915;
	Mon,  3 May 2021 16:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C66E8FB;
 Mon,  3 May 2021 16:35:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C19D61369;
 Mon,  3 May 2021 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059729;
 bh=GLF+Mmf4mebHhJ9MRfUR9ZlsJn/hyLMa4/lFbtGaexg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KalugXVa/5hvnuxmMjmV9X1xjqxlP3FcMCL16RYiP0SEGDopZ60pOmU+OTGuE/l5n
 /zNbMn8TQpZLfsFgbu+Pzh/McVLF4V6jKVVQ8JSoOSWeCLiJgikfJrgiSqgo1p/WUj
 UxJatNh1JHYoS61k0rqbHznJtPn34WpqYolQ4Hkpgspwhw0nMRl0QjRCdjiQMWUZlV
 acsYrKdebj1nlldFmwFlbZIC8lecdh/QfihoHv08CRdTI/561XBNjiC9zIUTbnVUG1
 XiMEP21uc98O7rU9dsLvKX2vef5eW4qy0FyS2sdbwkCLctOIZcioJTbhGhiiPFm+Kx
 f/Ab4wSPoZ1cQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 010/134] drm/amd/display: Don't optimize
 bandwidth before disabling planes
Date: Mon,  3 May 2021 12:33:09 -0400
Message-Id: <20210503163513.2851510-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
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
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Bindu Ramamurthy <bindu.r@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[ Upstream commit 6ad98e8aeb0106f453bb154933e8355849244990 ]

[Why]
There is a window of time where we optimize bandwidth due to no streams
enabled will enable PSTATE changing but HUBPs are not disabled yet.
This results in underflow counter increasing in some hotplug scenarios.

[How]
Set the optimize-bandwidth flag for later processing once all the HUBPs
are properly disabled.

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8f8a13c7cf73..c0b827d16268 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2398,7 +2398,8 @@ static void commit_planes_do_stream_update(struct dc *dc,
 					if (pipe_ctx->stream_res.audio && !dc->debug.az_endpoint_mute_only)
 						pipe_ctx->stream_res.audio->funcs->az_disable(pipe_ctx->stream_res.audio);
 
-					dc->hwss.optimize_bandwidth(dc, dc->current_state);
+					dc->optimized_required = true;
+
 				} else {
 					if (dc->optimize_seamless_boot_streams == 0)
 						dc->hwss.prepare_bandwidth(dc, dc->current_state);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
