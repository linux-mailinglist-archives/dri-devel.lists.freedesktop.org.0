Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB193119383
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ABB6E955;
	Tue, 10 Dec 2019 21:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA656E948
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 424F7214AF;
 Tue, 10 Dec 2019 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011863;
 bh=S3vpO74YFSeyelz9fJZYMGlkUWvZr3I0b5tGoSAXwAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vmGTRgb541ZIFb869zNJtlcYNS+AC/iFFTcbHjS/QuX/9kAe8vZ7h4pE/1PtZFDuB
 yzrkE6S/OIKM38SDrTK8NY4UzuO/QejYUhBScKcX39Jz/H2B6l52Qkv3++qMNm1Gi4
 xq4sLy/O0+1u8M1pZD9g5Mc26URm8Rw957kCwU9U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 016/350] drm/amd/display: Rebuild mapped resources
 after pipe split
Date: Tue, 10 Dec 2019 15:58:28 -0500
Message-Id: <20191210210402.8367-16-sashal@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[ Upstream commit 387596ef2859c37d564ce15abddbc9063a132e2c ]

[why]
The issue is specific for linux, as on timings such as 8K@60
or 4K@144 DSC should be working in combination with ODM Combine
in order to ensure that we can run those timings. The validation
for those timings was passing, but when pipe split was happening
second pipe wasn't being programmed.

[how]
Rebuild mapped resources if we split stream for ODM.

Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 3980c7b782599..ebe67c34dabf6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2474,6 +2474,7 @@ bool dcn20_fast_validate_bw(
 							&context->res_ctx, dc->res_pool,
 							pipe, hsplit_pipe))
 						goto validate_fail;
+					dcn20_build_mapped_resource(dc, context, pipe->stream);
 				} else
 					dcn20_split_stream_for_mpc(
 						&context->res_ctx, dc->res_pool,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
