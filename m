Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934745F9444
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0AC10E5A6;
	Sun,  9 Oct 2022 23:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95210E5A6;
 Sun,  9 Oct 2022 23:54:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 674A8B80DEA;
 Sun,  9 Oct 2022 23:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE03C433C1;
 Sun,  9 Oct 2022 23:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359659;
 bh=Ol+2Xj2+b+tySJ+C/RyQP4TaRR4MLjLtzXy+zmFgurg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PptOsbV+up+4KrlAwuGM1Yx7JPSCY2IB+oI4JPWDwwyHDRZ7ifJIo6GTrp/N0exZX
 vWnb8TDTv25BNbOgtNZHqCmCCqkaBmARJHbdRWuX3jl+t8XuNH5ubHUIB7kh2cKBNY
 GLIIO5PY6BSIgaht1HGZpCUWvixlfFSdiLKUmElKZ6AeZ3tnJmhBD35FO9dzObW7ft
 0tHG7yyp9FG9vk0HSPAhCZlvRGdcj/wb04lNeuCdGwtsOC3xAGlNtQqOciF0LXZ645
 U9SruJT09GAsUgFAtk2kgvjnTmbWQtgmDd44vSJ2hYmt2xCY/2bqAgc0YMhLFv7bY2
 ChetGnwWEkgeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 34/36] drm/amd/display: polling vid stream status
 in hpo dp blank
Date: Sun,  9 Oct 2022 19:52:20 -0400
Message-Id: <20221009235222.1230786-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com,
 Wenjing Liu <wenjing.liu@amd.com>, Jerry.Zuo@amd.com,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Ariel Bernstein <Eric.Bernstein@amd.com>, dri-devel@lists.freedesktop.org,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit e32df0c7ecead95d70ca89f39b1b2b02a59ff691 ]

[why]
vid stream control is double bufferred, if we don't wait for video
stream enable set to 0, we may get temporary image corruption
showing on the stream when setting PIXEL_TO_SYMBOL_FIFO_ENABLE to 0.

Reviewed-by: Ariel Bernstein <Eric.Bernstein@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
index 23621ff08c90..52fb2bf3d578 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -150,9 +150,9 @@ static void dcn31_hpo_dp_stream_enc_dp_blank(
 	 * 10us*5000=50ms. This covers 41.7ms of minimum 24 Hz mode +
 	 * a little more because we may not trust delay accuracy.
 	 */
-	//REG_WAIT(DP_SYM32_ENC_VID_STREAM_CONTROL,
-	//		VID_STREAM_STATUS, 0,
-	//		10, 5000);
+	REG_WAIT(DP_SYM32_ENC_VID_STREAM_CONTROL,
+			VID_STREAM_STATUS, 0,
+			10, 5000);
 
 	/* Disable SDP tranmission */
 	REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
-- 
2.35.1

