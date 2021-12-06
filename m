Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE504697E2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 15:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4030C6FDE8;
	Mon,  6 Dec 2021 14:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344C6FDE8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 14:06:33 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83B03EE;
 Mon,  6 Dec 2021 15:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638799592;
 bh=cZT2SBcfWH0H0gI7gi7bgjX7Ar0Y5zrYq0N68SgLME8=;
 h=From:To:Cc:Subject:Date:From;
 b=pIhN4x65j62Y3DCzuHNzJXySpKufkTv/xX5q1xyQ391uJ/j8CVc1bymWXkunKbSKm
 LuCD6kOQaL+WySyem5Yc1ETQbhh4BAL/fXTx6u0kwrEr+xN4paaXhwOKL7aDxs9Lqy
 PbGIaXhfJBDX5NtTcz1/JylM2qWWoZeult/+I1RY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: dsi: Fix hsfreq range matching
Date: Mon,  6 Dec 2021 16:06:01 +0200
Message-Id: <20211206140601.18912-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When iterating over hsfreqrange_table, rcar_mipi_dsi_parameters_calc()
may dereference the sentinel table entry. Fix the loop condition to
break as soon as a suitable entry is found, defined by the lower bound
of the frequency range stored in the table being equal to or higher than
the target frequency.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
I will squash this with "drm: rcar-du: Add R-Car DSI driver", but I'm
posting it separately to ease review.
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index faf993eae564..891bb956fd61 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -219,9 +219,8 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	/* Find hsfreqrange */
 	hsfreq = fout_target * 2;
 	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
-		if (hsfreq > hsfreqrange_table[i][0] &&
-			hsfreq <= hsfreqrange_table[i+1][0]) {
-			setup_info->hsfreqrange = hsfreqrange_table[i+1][1];
+		if (hsfreqrange_table[i][0] >= hsfreq) {
+			setup_info->hsfreqrange = hsfreqrange_table[i][1];
 			break;
 		}
 	}

base-commit: c18c8891111bb5e014e144716044991112f16833
prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87
prerequisite-patch-id: 6754b2ec4caec03e235550004003fe63c1cc793b
prerequisite-patch-id: d69c605df34d40934fa5d4e00f23d5785105099d
prerequisite-patch-id: 7d9edfb4758cafe8aec92d32709c0ad25a50942c
prerequisite-patch-id: 86c526fb41f9f9cbe95c50ba8a140e20484f187f
prerequisite-patch-id: a9649b53b55858f023b8d3d29afb9be7ad39ea3b
-- 
Regards,

Laurent Pinchart

