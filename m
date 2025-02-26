Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C089BA45CC8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ACF10E8CC;
	Wed, 26 Feb 2025 11:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="Rb7R6VuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1770C10E8C9;
 Wed, 26 Feb 2025 11:11:47 +0000 (UTC)
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
 by ksmg01.maxima.ru (Postfix) with ESMTP id DF666C0032;
 Wed, 26 Feb 2025 14:11:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru DF666C0032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
 s=sl; t=1740568296; bh=p2djvdE/2JpuDcbCUzGal+sGcocVc2RKdb97Aa3KrF4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Rb7R6VuZQBLFseAm0TUtAVzKWbL+6up8b5PHG1605ob9qHexVsirPbPnYiBMlNkHa
 dtZn4DwfnpucJ+Zy4PL/Dqy4g9q+TUUm60HfezOxCMlduCl7Ruwlem6EuD752+aBg5
 IeKzbJzgzWtH9f1PCHija63sKPtYawqjwSiU3g+ZIPNbKQz9KRdTrOCiYv+SylTw06
 Kw3MFEHNmzR81T838qXd0BmzX9f3zs1HP+pubVUvwkFDRJwx0xYoLlElVx5hLnVY25
 8yXQ4TKVY5WB8op+f/U3Rpd3xfwZTusdB5NUIIlDGdGNNSNJxJADOmlsL0eSHOJ52T
 JMHUReKJIvdSg==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg01.maxima.ru (Postfix) with ESMTPS;
 Wed, 26 Feb 2025 14:11:36 +0300 (MSK)
Received: from localhost.maximatelecom.ru (178.236.220.144) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Wed, 26 Feb 2025 14:11:34 +0300
From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>
CC: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>, Jun Lei
 <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung
 <alex.hung@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, Aric Cyr
 <aric.cyr@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/amd/display: fix type mismatch in
 CalculateDynamicMetadataParameters()
Date: Wed, 26 Feb 2025 16:10:25 +0500
Message-ID: <20250226111027.9528-1-v.shevtsov@mt-integration.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.236.220.144]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail},
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; ksmg01.maxima.ru:7.1.1;
 mt-integration.ru:7.1.1; 81.200.124.61:7.1.2;
 127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191310 [Feb 26 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/02/26 08:18:00 #27466298
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
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

There is a type mismatch between what CalculateDynamicMetadataParameters()
takes and what is passed to it. Currently this function accepts several
args as signed long but it's called with unsigned integers. On some systems
where long is 32 bits and one of these input params is greater than INT_MAX
it may cause passing input params as negative values.

Fix this by changing these argument types from long to unsigned int. Also
this will align the function's definition with similar functions in other
dcn* drivers.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 6725a88f88a7 ("drm/amd/display: Add DCN3 DML")
Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
---
v2: Change DynamicMetadataLinesBeforeActiveRequired type from unsigned int
    to int as per Alex Hung's observation.
    Add Fixes tag missed by chance.

 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index cee1b351e105..f1fe49401bc0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -281,10 +281,10 @@ static void CalculateDynamicMetadataParameters(
 		double DISPCLK,
 		double DCFClkDeepSleep,
 		double PixelClock,
-		long HTotal,
-		long VBlank,
-		long DynamicMetadataTransmittedBytes,
-		long DynamicMetadataLinesBeforeActiveRequired,
+		unsigned int HTotal,
+		unsigned int VBlank,
+		unsigned int DynamicMetadataTransmittedBytes,
+		int DynamicMetadataLinesBeforeActiveRequired,
 		int InterlaceEnable,
 		bool ProgressiveToInterlaceUnitInOPP,
 		double *Tsetup,
@@ -3265,8 +3265,8 @@ static double CalculateWriteBackDelay(
 
 
 static void CalculateDynamicMetadataParameters(int MaxInterDCNTileRepeaters, double DPPCLK, double DISPCLK,
-		double DCFClkDeepSleep, double PixelClock, long HTotal, long VBlank, long DynamicMetadataTransmittedBytes,
-		long DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
+		double DCFClkDeepSleep, double PixelClock, unsigned int HTotal, unsigned int VBlank, unsigned int DynamicMetadataTransmittedBytes,
+		int DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
 		double *Tsetup, double *Tdmbf, double *Tdmec, double *Tdmsks)
 {
 	double TotalRepeaterDelayTime = 0;
-- 
2.48.1

