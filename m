Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6EB91D4E8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 02:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C337810E1BE;
	Mon,  1 Jul 2024 00:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NbfkHRYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C278110E18B;
 Mon,  1 Jul 2024 00:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DEFCDCE0F15;
 Mon,  1 Jul 2024 00:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE28C2BD10;
 Mon,  1 Jul 2024 00:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719792794;
 bh=E5GrF2ronOtTbsCTJVsg1I4cEk9nl6VbP7m1qIPs0r4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NbfkHRYJPomM39maQPYW8LM5wgMQUc9T+LjU0HkB0k/7eWuXk1x7wR9DA2NYkRJRp
 RheoTqoEq9RDNjGQPOtdBehzUhReoqchpx3HNIoR0QCfBwJNYQtZdkqZ6q7V7+4Q4w
 HeNBEstOuONlBiw5CEXrVcQVlCaiybD48KGhIOyBTC7C1egrB47GClLkc12E1+R75Z
 kkzZjlRzRS36VeKXVZIVzvTLeN1wjOIqyDjPL5vqJslYamSiXfWGKboR9wdym6iABd
 H/0EoMFsGyU2G6jc1Hjy4mW7fxs8Lq/FM1wHeyXhJy6XwJ+mk/WfKk1kpDGu7uTg6Z
 uxQ+g9YNLIzwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Paul Hsieh <paul.hsieh@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, charlene.liu@amd.com, hamza.mahfooz@amd.com,
 chiahsuan.chung@amd.com, nicholas.susanto@amd.com,
 natanel.roizenman@amd.com, ahmed.ahmed@amd.com, Qingqing.Zhuo@amd.com,
 yang.lee@linux.alibaba.com, syed.hassan@amd.com, jerry.zuo@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 16/20] drm/amd/display: change dram_clock_latency
 to 34us for dcn35
Date: Sun, 30 Jun 2024 20:11:21 -0400
Message-ID: <20240701001209.2920293-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001209.2920293-1-sashal@kernel.org>
References: <20240701001209.2920293-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.7
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

From: Paul Hsieh <paul.hsieh@amd.com>

[ Upstream commit 6071607bfefefc50a3907c0ba88878846960d29a ]

[Why & How]
Current DRAM setting would cause underflow on customer platform.
Modify dram_clock_change_latency_us from 11.72 to 34.0 us as per recommendation from HW team

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Paul Hsieh <paul.hsieh@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 53e40d3c48d4b..6716696df7719 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -177,7 +177,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_5_soc = {
 	.urgent_latency_pixel_data_only_us = 4.0,
 	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
 	.urgent_latency_vm_data_only_us = 4.0,
-	.dram_clock_change_latency_us = 11.72,
+	.dram_clock_change_latency_us = 34.0,
 	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
 	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
 	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
-- 
2.43.0

