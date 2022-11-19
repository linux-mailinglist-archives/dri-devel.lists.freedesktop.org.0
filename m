Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7E630947
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818B910E255;
	Sat, 19 Nov 2022 02:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D0210E255;
 Sat, 19 Nov 2022 02:12:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0A162837;
 Sat, 19 Nov 2022 02:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB0EC433C1;
 Sat, 19 Nov 2022 02:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823959;
 bh=DGpi5bOY4QODa+uCmcve2tFg2aWUelF3/ruWIkrknEM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OacmNl3E/L37sdI4hhgEOJ6jivQOSceUSVgK8s6q/PxwepfluU8cDnPgJKpXTGoku
 Jy9Z2MRXYZj0USuZdkcxgYZ+qhSvXJsmb7DfQiU1PaGqbY3/wGgMicQvSMnyYXFUvM
 DSB50N/j73/r/Oql7g4fHv1ju4ue1kG+McwPRBn5DKage3VKmHZGPAb4Hktc6ZmL9q
 hLcMBjb10JMsXp74+FUdjdXc2pVyF2j9HDCMMmAmxZXxZk7DwZp/h8XlF5u5ke5vPv
 Ihf4tGUyK83cPWZRbgYgaK6G/qTkAgpnzRnfj09rPXL4FxHN5JGe3ahZgKtuFj6Ino
 mZD42PcOMnh9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 34/44] drm/amd/display: Zeromem mypipe heap struct
 before using it
Date: Fri, 18 Nov 2022 21:11:14 -0500
Message-Id: <20221119021124.1773699-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Sasha Levin <sashal@kernel.org>,
 george.shen@amd.com, sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nathan@kernel.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin.Lee2@amd.com,
 Martin Leung <Martin.Leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit ab4b35008db9b7ae747679250e5c26d7c3a90cea ]

[Why&How]
Bug was caused when moving variable from stack to heap because it was reusable
and garbage was left over, so we need to zero mem.

Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Martin Leung <Martin.Leung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 52525833a99b..96714dc6b695 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -3194,6 +3194,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							mode_lib->vba.FCLKChangeLatency, mode_lib->vba.UrgLatency[i],
 							mode_lib->vba.SREnterPlusExitTime);
 
+					memset(&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull, 0, sizeof(DmlPipe));
 					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
 					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
 					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
-- 
2.35.1

