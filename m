Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869B2E11BA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F646E8A2;
	Wed, 23 Dec 2020 02:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AB26E897;
 Wed, 23 Dec 2020 02:16:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B500223139;
 Wed, 23 Dec 2020 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689818;
 bh=nA1IdGe3B+/2p3KYi1kkF0FwnQzejUL02uJ+uHEq1uE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BwZXr/2zBRZQLixaFMzoSAf/LULe5lvCzLHSMkdMH6dk2Wtand3K+OpSoCQL+8T4b
 cVNM/yaJeZo+J6tvZJbZltC7Bda38Ra0BC6YCsm9K/Hi9h6BTPJ82c/0px2XzjnOC0
 dzs+eTAkPm3psI8hnBbA7FCCq5QZ4ahYiFlzPf1o9I9+7P8oo/y4syEgq9Pz/WtFa3
 16WQYVxPQMQ3sQgdFopKmsJ1RGbqqldEzdceZT5iuC78MGiOR+71NdSfMFMYr7oInA
 d4hiNH6L+tq7EGT8589D1zP5J0e3YT4VbO8rLDI6ZN2P3ELyGoY9gLWrMVV0rz9FIe
 I9vyL7nwkqWew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 024/217] drm/amd/display: fix recout calculation
 for left side clip
Date: Tue, 22 Dec 2020 21:13:13 -0500
Message-Id: <20201223021626.2790791-24-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 84aef2ab0977199784671295a07043191233d7c7 ]

Recout calculation does not corrrectly handle plane
clip rect that extends beyond the left most border
of stream source rect. This change adds handling by
truncating the invisible clip rect.

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 59d48cf819ea8..6d606cc32b09e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -796,6 +796,8 @@ static void calculate_recout(struct pipe_ctx *pipe_ctx)
 	} else
 		data->recout.x = 0;
 
+	if (stream->src.x > surf_clip.x)
+		surf_clip.width -= stream->src.x - surf_clip.x;
 	data->recout.width = surf_clip.width * stream->dst.width / stream->src.width;
 	if (data->recout.width + data->recout.x > stream->dst.x + stream->dst.width)
 		data->recout.width = stream->dst.x + stream->dst.width - data->recout.x;
@@ -804,6 +806,8 @@ static void calculate_recout(struct pipe_ctx *pipe_ctx)
 	if (stream->src.y < surf_clip.y)
 		data->recout.y += (surf_clip.y - stream->src.y) * stream->dst.height
 						/ stream->src.height;
+	else if (stream->src.y > surf_clip.y)
+		surf_clip.height -= stream->src.y - surf_clip.y;
 
 	data->recout.height = surf_clip.height * stream->dst.height / stream->src.height;
 	if (data->recout.height + data->recout.y > stream->dst.y + stream->dst.height)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
