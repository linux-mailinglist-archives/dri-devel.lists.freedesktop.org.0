Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E943719B1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2D6E92C;
	Mon,  3 May 2021 16:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B86E932;
 Mon,  3 May 2021 16:36:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE5A7613D0;
 Mon,  3 May 2021 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059793;
 bh=cm2ZjP+nxhlFxgOpMS2UzryGqdVadZ3ecCcGZd1vV4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iw1385ctlDbwpXNo1VSdR6MHk5jxLr3nOrw6cq33kH2O7LSCXiuFTLj9qYQ0PURLv
 zUj3djmtZW3wu7AxVmpPWIKbpMvIIV/E81dGPk5Nn5/3wvn+aiR+mg+G6vveR/CyWG
 QkmDhuwwLe5rqE8EzQvTW9UuLBYOB7HbOeVatUQ8eIW92v311FDtzTO+JbTwbgaOow
 +nOIyVEmqvHmV2kwmd3i9/IsymWYIg8zPPIyJPfftoU7zahq6R+NFqLhEzTdlihGe0
 SbeIpZynAzdLBL0lJ1OVW8+KDVXDudXI5gBW5xOmlpQnp+Biie7iutfSplwXzCLQmB
 Gv5PN8Bfrzj/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 051/134] drm/amd/display: Align cursor cache
 address to 2KB
Date: Mon,  3 May 2021 12:33:50 -0400
Message-Id: <20210503163513.2851510-51-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Joshua Aberback <joshua.aberback@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Aberback <joshua.aberback@amd.com>

[ Upstream commit 554ba183b135ef09250b61a202d88512b5bbd03a ]

[Why]
The registers for the address of the cursor are aligned to 2KB, so all
cursor surfaces also need to be aligned to 2KB. Currently, the
provided cursor cache surface is not aligned, so we need a workaround
until alignment is enforced by the surface provider.

[How]
 - round up surface address to nearest multiple of 2048
 - current policy is to provide a much bigger cache size than
   necessary,so this operation is safe

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Joshua Aberback <joshua.aberback@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 06dc1e2e8383..07c8d2e2c09c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -848,7 +848,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 
 					cmd.mall.cursor_copy_src.quad_part = cursor_attr.address.quad_part;
 					cmd.mall.cursor_copy_dst.quad_part =
-							plane->address.grph.cursor_cache_addr.quad_part;
+							(plane->address.grph.cursor_cache_addr.quad_part + 2047) & ~2047;
 					cmd.mall.cursor_width = cursor_attr.width;
 					cmd.mall.cursor_height = cursor_attr.height;
 					cmd.mall.cursor_pitch = cursor_attr.pitch;
@@ -858,8 +858,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 					dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
 
 					/* Use copied cursor, and it's okay to not switch back */
-					cursor_attr.address.quad_part =
-							plane->address.grph.cursor_cache_addr.quad_part;
+					cursor_attr.address.quad_part = cmd.mall.cursor_copy_dst.quad_part;
 					dc_stream_set_cursor_attributes(stream, &cursor_attr);
 				}
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
