Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F53089FA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B106EB74;
	Fri, 29 Jan 2021 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606036EB72;
 Fri, 29 Jan 2021 15:38:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 390FF64E05;
 Fri, 29 Jan 2021 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934707;
 bh=uwFvfc6L4wpnKmbVy14n1pGZETZp9bDsqif3aF84e58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WoAPSb46CTOKpFpPpNDcRzCIv6/pQAmSGIIm+U8fvZ2rn4AamLUftESHG2den2iXF
 /PnqLg4HQFz3l2rGO8RxwHT60/dp9LyOd65Uthmt6xhH5VYLvULVoYNmxFEBpBTe/s
 wzTpMAyhLui27mnmtRKxUD3H2SQMpYgdMwDw6AuL4rl5mr+hBaHI0EdmytXlhmedZ6
 WhSZugZqz6efM9oioRjvC1k4sa2OiqHqt5+NCC/Lo/YvAndeVkjjQZXmj+QHskPS9K
 fq45sxOIgv6/5xK0gJIISQzDfawFumbm7QwPcBt+5aLjSYck1786GQmbF4D/LBHR7+
 kpHhmbEIo0+Tg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 16/19] drm/amd/display: Change function
 decide_dp_link_settings to avoid infinite looping
Date: Fri, 29 Jan 2021 10:38:03 -0500
Message-Id: <20210129153806.1592565-16-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153806.1592565-1-sashal@kernel.org>
References: <20210129153806.1592565-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <anson.jacob@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Bing Guo <bing.guo@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bing Guo <bing.guo@amd.com>

[ Upstream commit 4716a7c50c5c66d6ddc42401e1e0ba13b492e105 ]

Why:
Function decide_dp_link_settings() loops infinitely when required bandwidth
can't be supported.

How:
Check the required bandwidth against verified_link_cap before trying to
find a link setting for it.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Bing Guo <bing.guo@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Anson Jacob <anson.jacob@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 959eb075d11ed..c18f39271b034 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1914,6 +1914,9 @@ static bool decide_dp_link_settings(struct dc_link *link, struct dc_link_setting
 			initial_link_setting;
 	uint32_t link_bw;
 
+	if (req_bw > dc_link_bandwidth_kbps(link, &link->verified_link_cap))
+		return false;
+
 	/* search for the minimum link setting that:
 	 * 1. is supported according to the link training result
 	 * 2. could support the b/w requested by the timing
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
