Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67857119609
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26246E975;
	Tue, 10 Dec 2019 21:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6816E96F;
 Tue, 10 Dec 2019 21:25:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE74F206D5;
 Tue, 10 Dec 2019 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013119;
 bh=SNku1A80aBY1NpeoUIxNgyT9QiMOSAAxcUYbnDY+Zp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJ5qewbLBX5n0akdskl9TScv/rKJeYL4iX40J0jI/zlaZGHI3CB1+OR9TIJyiarmF
 oPxRSBkRgHDoGJX8tv+tmiyfM4ltAgaoyMmC/L3+viUHlYgeLNqVqbnwEh+jVzuWym
 hRwMBToM1xGQBw4+cyX2d5OOHUNcR4Oag/xUpBaE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 006/292] drm/amd/display: verify stream link
 before link test
Date: Tue, 10 Dec 2019 16:20:25 -0500
Message-Id: <20191210212511.11392-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210212511.11392-1-sashal@kernel.org>
References: <20191210212511.11392-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jing Zhou <Jing.Zhou@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jing Zhou <Jing.Zhou@amd.com>

[ Upstream commit b131932215c993ea5adf8192d1de2e8d6b23048d ]

[Why]
DP1.2 LL CTS test failure.

[How]
The failure is caused by not verify stream link is equal
to link, only check stream and link is not null.

Signed-off-by: Jing Zhou <Jing.Zhou@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index a9135764e5806..767de9d6b07a7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -312,7 +312,8 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 		if (pipes[i].stream != NULL &&
 			!pipes[i].top_pipe &&
 			pipes[i].stream->link != NULL &&
-			pipes[i].stream_res.stream_enc != NULL) {
+			pipes[i].stream_res.stream_enc != NULL &&
+			pipes[i].stream->link == link) {
 			udelay(100);
 
 			pipes[i].stream_res.stream_enc->funcs->dp_blank(
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
