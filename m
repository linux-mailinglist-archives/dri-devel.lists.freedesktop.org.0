Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2197ABA9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 08:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B3610E1F4;
	Tue, 17 Sep 2024 06:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="gbV6jSE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Mon, 16 Sep 2024 10:50:34 UTC
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFA110E27E;
 Mon, 16 Sep 2024 10:50:34 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id 0CE481E0004;
 Mon, 16 Sep 2024 13:44:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru 0CE481E0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1726483444; bh=ThbJ6N0R8e00LokNP2VgWULnWOsZlMXMwlpzar1AU8c=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=gbV6jSE2Ssz1pyhMQKepO3iiL6sbXccEtWhqWaybBv62a4g5UyV/wrB5Nk+9Tdn4g
 KdEi5+Pr6fiCD5v1DtC4vXjDIqYeUFHvnYrJSqW0BLPCuSqVxEi6d441IHuy66AHxX
 n0RL8gEqmniCAW6OjaydzYguaYXeFXOjqz8DrMVcm3xpxhDyI6De3ne2+98UGo3zbG
 4Sj1251IHUb1ZP7uVAoKsGh23odgIrDL4wOpqy8ujwuckm/hxcRniZxDi0WWdRhcqj
 KHJ5S5p7kWH33JYtXnS4yDo18m+/+sH5Cbz9fp8DkTNrEhl2EqTjHdkhjdoqZRnQem
 D9/y0JR9ACMNw==
Received: from ksmg02.maxima.ru (unknown [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Mon, 16 Sep 2024 13:44:03 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.247.10) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 16 Sep
 2024 13:44:00 +0300
From: Murad Masimov <m.masimov@maxima.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Murad Masimov <m.masimov@maxima.ru>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alvin Lee <alvin.lee2@amd.com>, Sasha Levin
 <sashal@kernel.org>, Chaitanya Dhere <chaitanya.dhere@amd.com>, Tom Chung
 <chiahsuan.chung@amd.com>, Sohaib Nadeem <sohaib.nadeem@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Daniel
 Wheeler <daniel.wheeler@amd.com>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>, Samson Tam <samson.tam@amd.com>
Subject: [PATCH 6.1] drm/amd/display: Fix subvp+drr logic errors
Date: Mon, 16 Sep 2024 13:43:23 +0300
Message-ID: <20240916104325.1532-1-m.masimov@maxima.ru>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.247.10]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187760 [Sep 16 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: m.masimov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=maxima.ru; dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, maxima.ru:7.1.1; 81.200.124.62:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; ksmg02.maxima.ru:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62, {DNS
 response errors}
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/09/16 05:22:00 #26594998
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Tue, 17 Sep 2024 06:50:48 +0000
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

From: Alvin Lee <alvin.lee2@amd.com>

commit 8a0f02b7beed7b2b768dbdf3b79960de68f460c5 upstream.

[Why]
There is some logic error where the wrong variable was used to check for
OTG_MASTER and DPP_PIPE.

[How]
Add booleans to confirm that the expected pipes were found before
validating schedulability.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Reviewed-by: Samson Tam <samson.tam@amd.com>
Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[m.masimov@maxima.ru: In order to adapt this patch to branch 6.1
only changes related to finding the SubVP pipe were applied
as in 6.1 drr_pipe is passed as a function argument.]
Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 85e0d1c2a908..4b0719392d28 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -862,6 +862,7 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struc
 	int16_t stretched_drr_us = 0;
 	int16_t drr_stretched_vblank_us = 0;
 	int16_t max_vblank_mallregion = 0;
+	bool subvp_found = false;
 
 	// Find SubVP pipe
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
@@ -873,10 +874,15 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struc
 			continue;
 
 		// Find the SubVP pipe
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			subvp_found = true;
 			break;
+		}
 	}
 
+	if (!subvp_found)
+		return false;
+
 	main_timing = &pipe->stream->timing;
 	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
 	drr_timing = &drr_pipe->stream->timing;
-- 
2.39.2

