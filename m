Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4F5A0671
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49218D10BE;
	Thu, 25 Aug 2022 01:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7762D0E4E;
 Thu, 25 Aug 2022 01:39:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F90F61AF0;
 Thu, 25 Aug 2022 01:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194D2C433C1;
 Thu, 25 Aug 2022 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391581;
 bh=ah5x5jgephnNd5chcwZN7FZrAqXh64ZcpPIpiGDYmXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G8EJcn2tR3nMUi/x1gqmSa/jeml5cH5j5yec6I0a+7j1dPp8GhAMEcWW1pNMNCfpD
 Pt/124aSsCgF/KPQBjO693qO2L13O96KM2Ni6CmL5qQfNcooEi6U7ycUPsJFgYP/de
 GJ2XNbSOqr7zaFpLourqeYXtbxu90hcApTdvQ4bgubkINEYTB49C2Ec+ag1UMOVhYR
 qkOu2ev2LYXO/jFtRX1MsinpiTHStPxD5p9VHLJfS7ASsGEj8EDHtD16Pycyri9mj1
 ZB+icQ1Mbrez+ium7nYFtNIZ/t6QFe6HxRVEWLVDYCjfamNxBWD3gEF+ZWHMdek3hH
 19OxqbTRsdyLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/8] drm/amd/display: clear optc underflow before
 turn off odm clock
Date: Wed, 24 Aug 2022 21:39:21 -0400
Message-Id: <20220825013932.23467-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013932.23467-1-sashal@kernel.org>
References: <20220825013932.23467-1-sashal@kernel.org>
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
Cc: Fudong Wang <Fudong.Wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Anson.Jacob@amd.com, Tom Chung <chiahsuan.chung@amd.com>, Charlene.Liu@amd.com,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, isabbasso@riseup.net,
 christian.koenig@amd.com, oliver.logush@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fudong Wang <Fudong.Wang@amd.com>

[ Upstream commit b2a93490201300a749ad261b5c5d05cb50179c44 ]

[Why]
After ODM clock off, optc underflow bit will be kept there always and clear not work.
We need to clear that before clock off.

[How]
Clear that if have when clock off.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Fudong Wang <Fudong.Wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index e74a07d03fde..4b0200e96eb7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -425,6 +425,11 @@ void optc1_enable_optc_clock(struct timing_generator *optc, bool enable)
 				OTG_CLOCK_ON, 1,
 				1, 1000);
 	} else  {
+
+		//last chance to clear underflow, otherwise, it will always there due to clock is off.
+		if (optc->funcs->is_optc_underflow_occurred(optc) == true)
+			optc->funcs->clear_optc_underflow(optc);
+
 		REG_UPDATE_2(OTG_CLOCK_CONTROL,
 				OTG_CLOCK_GATE_DIS, 0,
 				OTG_CLOCK_EN, 0);
-- 
2.35.1

