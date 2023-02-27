Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D1E6A3676
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E110E1A4;
	Mon, 27 Feb 2023 02:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB86210E1A2;
 Mon, 27 Feb 2023 02:01:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53F3D60CA3;
 Mon, 27 Feb 2023 02:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39B9C433D2;
 Mon, 27 Feb 2023 02:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463317;
 bh=AH+yBWaJqdyN/OLzLxrlP9N38NfLiZqRHtUyimwrrK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T5XlRyNW1MtPlhkrNmoTBgCweyImLsD9VS2TAVsL5tF+QRhJLFjR6FqJi+ZgYjXgX
 V47y3/8DZKCgBMP97w9hCJStSSG1vyHknDkqkR0sBbxLgZsyZQg/B3yL7lk5HJukCA
 Y6PTJrlp0Qa98CTaWw/mkVHDiXyICPpiZgIx6Hy+KEdJUWbvmPInRp9H3sVlopAdhe
 wAcmqaXGyEyY7PflhOlTBI6JolP7yC/FOVgyIqEITT4kLFuOjaCiLMAgnMjsb081Ux
 wu8m+72Eu4t06WjKV43pXZzzANmryQ2edyO71S4pxRKjqs268bfVqsam86WZdOxDwd
 uJ/tqNiX3TyBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 16/60] drm: amd: display: Fix memory leakage
Date: Sun, 26 Feb 2023 21:00:01 -0500
Message-Id: <20230227020045.1045105-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, HaoPing.Liu@amd.com, Dillon.Varone@amd.com,
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, samson.tam@amd.com, aurabindo.pillai@amd.com,
 Alvin.Lee2@amd.com, Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>

[ Upstream commit 6b8701be1f66064ca72733c5f6e13748cdbf8397 ]

This commit fixes memory leakage in dc_construct_ctx() function.

Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 0cb8d1f934d12..c03e86e49fea3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -862,6 +862,7 @@ static bool dc_construct_ctx(struct dc *dc,
 
 	dc_ctx->perf_trace = dc_perf_trace_create();
 	if (!dc_ctx->perf_trace) {
+		kfree(dc_ctx);
 		ASSERT_CRITICAL(false);
 		return false;
 	}
-- 
2.39.0

