Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E91A549F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E586E32B;
	Sat, 11 Apr 2020 23:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764C56E32B;
 Sat, 11 Apr 2020 23:07:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 628C921D79;
 Sat, 11 Apr 2020 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646462;
 bh=BKf3iIX73R4r0oBGdSc7QByrmK7Ju23hXMr5gIH46tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HtmntEDh1qZLf/CSAXn9wWY95wnQtuUXp39kq67wpLuXT0vBAjEahhfKzfs/RVbXC
 iYOvpMami/mMfFcOzLPLKx6oBMErDODCo/DRvn3BJQIV937wBN8verKPCrndSyZULT
 R3mQRPUWGVrXgek/Ty6xrPirgPtc+eHtMVA3SiI8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 030/121] drm/amd/display: writing stereo polarity
 register if swapped
Date: Sat, 11 Apr 2020 19:05:35 -0400
Message-Id: <20200411230706.23855-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
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
 dri-devel@lists.freedesktop.org, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Leung <martin.leung@amd.com>

[ Upstream commit e592e85f3378246dd66b861fa60ef803d8cece6b ]

[why]
on some displays that prefer swapped polarity we were seeing L/R images
swapped because OTG_STEREO_SYNC_OUTPUT_POLARITY would always be mapped
to 0

[how]
fix initial dal3 implementation to properly update the polarity field
according to the crtc_stereo_flags (same as
OTG_STEREO_EYE_FLAG_POLARITY)

Signed-off-by: Martin Leung <martin.leung@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index dabccbd49ad4a..1d6956cc3a011 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -1185,7 +1185,7 @@ static void optc1_enable_stereo(struct timing_generator *optc,
 			REG_UPDATE_3(OTG_STEREO_CONTROL,
 				OTG_STEREO_EN, stereo_en,
 				OTG_STEREO_SYNC_OUTPUT_LINE_NUM, 0,
-				OTG_STEREO_SYNC_OUTPUT_POLARITY, 0);
+				OTG_STEREO_SYNC_OUTPUT_POLARITY, flags->RIGHT_EYE_POLARITY == 0 ? 0 : 1);
 
 		if (flags->PROGRAM_POLARITY)
 			REG_UPDATE(OTG_STEREO_CONTROL,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
