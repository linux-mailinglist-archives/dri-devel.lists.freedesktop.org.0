Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABD9BAAED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B05010E353;
	Mon,  4 Nov 2024 02:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="VjAoKVAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733A310E353;
 Mon,  4 Nov 2024 02:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=kouaRfpsvazCBSZp/X3VOpgJoYZZCVaGqrCQ+5fUK4Y=; b=VjAoKVAFngA3UIxV
 ZZoW/ehZpWKyYaYRBvE0uhp+HcXIKYn5ORIqffd0mKMHd7oucjwkq2oie/39p6yRLQHSAEQlWIOT4
 QZ07D9ctZq2kkJmKgKafQwPUgBuVleWze+PzmKJTdWH4bxX6H2zNLkfHoOOWRWttlP6nz4fsXaRzq
 x6FfK9jwO1c3iQO4tPsEeizc5xzXaucyjNLSRlPbAwYM3gTjihW2wZNdYlWFJzH4pXtcECyvOVfXP
 hYMnfFkDwgxDKRU2xolqrtdS8/5sWrHSv+zs+foaeaAs1hFNVxbcKku74I9fuGbNwUQu8KXQa4lbR
 +IMLJ0SPSasKaF9Rhw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7mzu-00FECw-08;
 Mon, 04 Nov 2024 02:39:18 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/5] drm/amd/display: Remove unused dc_stream_warmup_writeback
Date: Mon,  4 Nov 2024 02:38:50 +0000
Message-ID: <20241104023852.492497-4-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
References: <20241104023852.492497-1-linux@treblig.org>
MIME-Version: 1.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

dc_stream_warmup_writeback() is unused since it was added in 2019 by
commit 6a652f6d127d ("drm/amd/display: Add warmup escape call support")

Remove it.

Note there is a dcn30 version that's called directly which is kept.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 11 -----------
 drivers/gpu/drm/amd/display/dc/dc_stream.h      |  4 ----
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 9a406d74c0dd..a05f8d7c4367 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -612,17 +612,6 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	return true;
 }
 
-bool dc_stream_warmup_writeback(struct dc *dc,
-		int num_dwb,
-		struct dc_writeback_info *wb_info)
-{
-	dc_exit_ips_for_hw_access(dc);
-
-	if (dc->hwss.mmhubbub_warmup)
-		return dc->hwss.mmhubbub_warmup(dc, num_dwb, wb_info);
-	else
-		return false;
-}
 uint32_t dc_stream_get_vblank_counter(const struct dc_stream_state *stream)
 {
 	uint8_t i;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 14ea47eda0c8..602e77560373 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -444,10 +444,6 @@ enum dc_status dc_stream_add_dsc_to_resource(struct dc *dc,
 		struct dc_state *state,
 		struct dc_stream_state *stream);
 
-bool dc_stream_warmup_writeback(struct dc *dc,
-		int num_dwb,
-		struct dc_writeback_info *wb_info);
-
 bool dc_stream_dmdata_status_done(struct dc *dc, struct dc_stream_state *stream);
 
 bool dc_stream_set_dynamic_metadata(struct dc *dc,
-- 
2.47.0

