Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F73E5D03
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 16:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712AF6E03E;
	Tue, 10 Aug 2021 14:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38089E05;
 Tue, 10 Aug 2021 14:16:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73394610A0;
 Tue, 10 Aug 2021 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628604983;
 bh=8bwAjELKBHfEtCgO7fakYsnNJbvNAarkcSTfOot+Cqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bu8mEwjZ+YB5IONaVHmzayYhruIUohZivSxkpTcRtu+jAfB1qRFbw6HEifBeIdhex
 9PhIoUls8mQwBOBv8oNR54yFXfDvNz8Xy/dPkbJ9RojSzuMVtHva+XwYm31blOsDkD
 J1b/rNpk+3X+GJia5yCSRfEWos9CTQTPtmzJUIqRH4lODD8KjdMlx08QDIl/nE5wLn
 RRN4SrjcyZcGJYSsoF5zOPMydb+/J8kavXSqNuTCVZxwo9LtpPCBhw+tJm2pVEGnIX
 s+sMo7EwWizeDZfF51Ehpb0Kfb7KwCslrw8JGIoqi4LUCaaq2RWbavMRFI71wvPg84
 Mnk7cAHq34+cA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bing Guo <bing.guo@amd.com>, Martin Leung <martin.leung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 13/13] drm/amd/display: Fix Dynamic bpp issue with
 8K30 with Navi 1X
Date: Tue, 10 Aug 2021 10:16:05 -0400
Message-Id: <20210810141606.3117932-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141606.3117932-1-sashal@kernel.org>
References: <20210810141606.3117932-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bing Guo <bing.guo@amd.com>

[ Upstream commit 06050a0f01dbac2ca33145ef19a72041206ea983 ]

Why:
In DCN2x, HW doesn't automatically divide MASTER_UPDATE_LOCK_DB_X
by the number of pipes ODM Combined.

How:
Set MASTER_UPDATE_LOCK_DB_X to the value that is adjusted by the
number of pipes ODM Combined.

Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Bing Guo <bing.guo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
index 8d5cfd5357c7..03e207333953 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
@@ -362,7 +362,7 @@ void optc2_lock_doublebuffer_enable(struct timing_generator *optc)
 
 	REG_UPDATE_2(OTG_GLOBAL_CONTROL1,
 			MASTER_UPDATE_LOCK_DB_X,
-			h_blank_start - 200 - 1,
+			(h_blank_start - 200 - 1) / optc1->opp_count,
 			MASTER_UPDATE_LOCK_DB_Y,
 			v_blank_start - 1);
 }
-- 
2.30.2

