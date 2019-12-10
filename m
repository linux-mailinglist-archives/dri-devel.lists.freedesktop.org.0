Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB911937F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9426E950;
	Tue, 10 Dec 2019 21:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334D16E94E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D39C2465A;
 Tue, 10 Dec 2019 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011856;
 bh=7EI7P3PGp+T2fMFBwQoRHd94hkoswcoKdHg5xbodqNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MgFM7ApjZSyNoUtxI1/CyhWeYj1yPW1+/7yjegTvI+wdbbzN4WmvAld7oxasmwLrO
 fJxna9i6u2JhF38H6vBCpUwKzJBOKeWWlrARuloWy2qIShbWJWJ32Vd65ssZ/8oSVK
 c4czsSQDKNMmGEU7592cTj1MHT0EtCeRUrJU5qGw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 010/350] drm/amd/display: OTC underflow fix
Date: Tue, 10 Dec 2019 15:58:22 -0500
Message-Id: <20191210210402.8367-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210402.8367-1-sashal@kernel.org>
References: <20191210210402.8367-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Jaehyun Chung <jaehyun.chung@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jaehyun Chung <jaehyun.chung@amd.com>

[ Upstream commit 785908cf19c9eb4803f6bf9c0a7447dc3661d5c3 ]

[Why] Underflow occurs on some display setups(repro'd on 3x4K HDR) on boot,
mode set, and hot-plugs with. Underflow occurs because mem clk
is not set high after disabling pstate switching. This behaviour occurs
because some calculations assumed displays were synchronized.

[How] Add a condition to check if timing sync is disabled so that
synchronized vblank can be set to false.

Signed-off-by: Jaehyun Chung <jaehyun.chung@amd.com>
Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 6b2f2f1a1c9ce..3980c7b782599 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -1765,7 +1765,7 @@ int dcn20_populate_dml_pipes_from_context(
 			pipe_cnt = i;
 			continue;
 		}
-		if (!resource_are_streams_timing_synchronizable(
+		if (dc->debug.disable_timing_sync || !resource_are_streams_timing_synchronizable(
 				res_ctx->pipe_ctx[pipe_cnt].stream,
 				res_ctx->pipe_ctx[i].stream)) {
 			synchronized_vblank = false;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
