Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B71861C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 03:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8106C6E30C;
	Mon, 16 Mar 2020 02:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113C76E316;
 Mon, 16 Mar 2020 02:34:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08AFC206EB;
 Mon, 16 Mar 2020 02:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326087;
 bh=9dMFvrNqxpUvePmXG+6FIyrL9b0WiSp7fU/JGA6+lSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WnEFh2QU3fOxOXPu11g86q6G4GA0iZY+OF5bmrfZx3QWQL410B13q1uHE31nhwmEF
 bcc23ACwkom0PiNfRA11emRzQP4/BGXBNOTV8UnMjYW9wqMNMmTAoc6fX3XlIYeM5i
 NB+bv4j5WB4Ly4wQ3GIT36rhM8uh24ZHwUoqscF8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 31/35] drm/amd/display: fix dcc swath size
 calculations on dcn1
Date: Sun, 15 Mar 2020 22:34:07 -0400
Message-Id: <20200316023411.1263-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023411.1263-1-sashal@kernel.org>
References: <20200316023411.1263-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Josip Pavic <Josip.Pavic@amd.com>

[ Upstream commit a0275dfc82c9034eefbeffd556cca6dd239d7925 ]

[Why]
Swath sizes are being calculated incorrectly. The horizontal swath size
should be the product of block height, viewport width, and bytes per
element, but the calculation uses viewport height instead of width. The
vertical swath size is similarly incorrectly calculated. The effect of
this is that we report the wrong DCC caps.

[How]
Use viewport width in the horizontal swath size calculation and viewport
height in the vertical swath size calculation.

Signed-off-by: Josip Pavic <Josip.Pavic@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
index a02c10e23e0d6..d163388c99a06 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
@@ -840,8 +840,8 @@ static void hubbub1_det_request_size(
 
 	hubbub1_get_blk256_size(&blk256_width, &blk256_height, bpe);
 
-	swath_bytes_horz_wc = height * blk256_height * bpe;
-	swath_bytes_vert_wc = width * blk256_width * bpe;
+	swath_bytes_horz_wc = width * blk256_height * bpe;
+	swath_bytes_vert_wc = height * blk256_width * bpe;
 
 	*req128_horz_wc = (2 * swath_bytes_horz_wc <= detile_buf_size) ?
 			false : /* full 256B request */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
