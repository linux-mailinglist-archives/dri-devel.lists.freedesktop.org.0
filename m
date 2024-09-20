Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A557097DBFF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 09:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AA610E18E;
	Sat, 21 Sep 2024 07:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="sfrcMMTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Fri, 20 Sep 2024 21:49:27 UTC
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915010E871;
 Fri, 20 Sep 2024 21:49:27 +0000 (UTC)
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
 by ksmg01.maxima.ru (Postfix) with ESMTP id 97D58C0003;
 Sat, 21 Sep 2024 00:43:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 97D58C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1726868625; bh=WC3ILFut2f0eUKoeHk92ph9UKGLO6mpEKbgxlt9i2W4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=sfrcMMTPsJ/3rdVLHfmRN2+ZOQIjISfUOe+lpW3tkctLsY3jM9dJ/NxZA8jf0hTq3
 501oL4PdUEk7uwUTWIlgKBAOfJGVtXgaUimRD76ccBED0L2j7BrzIKBrG3GelbYrRp
 L72wLXLY6DFuWQOVtJl0ee2IRoq68yaE+mnm3uNhAjLAkFsA4Kv1zyhooru4ZTuRfx
 JdqHeWW2MyZNONULoCElWbRk/aCbAp5vHZCLsbLA9Aj5yvcwX8+4Vhbace+4K63wXZ
 euD8RUYn7bUUw7JiUVsHEkwWP6SVeN75EbF5vAdD9X6RwMvl2p8a10wbnNkO76c5er
 U1fCLAvlNL6kw==
Received: from ksmg01.maxima.ru (unknown [81.200.124.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg01.maxima.ru (Postfix) with ESMTPS;
 Sat, 21 Sep 2024 00:43:45 +0300 (MSK)
Received: from localhost.maximatelecom.ru (10.0.247.181) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Sat, 21 Sep 2024 00:43:41 +0300
From: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
To: Harry Wentland <harry.wentland@amd.com>
CC: Vitaliy Shevtsov <v.shevtsov@maxima.ru>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alvin Lee
 <alvin.lee2@amd.com>, Charlene Liu <Charlene.Liu@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Dillon Varone <dillon.varone@amd.com>, yi-lchen
 <yi-lchen@amd.com>, Alex Hung <alex.hung@amd.com>, Chris Park
 <chris.park@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, Tom Chung
 <chiahsuan.chung@amd.com>, George Shen <george.shen@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Samson Tam <samson.tam@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amd/display: fix typos in several function pointer checks
Date: Sat, 21 Sep 2024 02:43:40 +0500
Message-ID: <20240920214342.14792-1-v.shevtsov@maxima.ru>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.247.181]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187892 [Sep 20 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=maxima.ru; dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, maxima.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; ksmg01.maxima.ru:7.1.1;
 127.0.0.199:7.1.2;
 81.200.124.61:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61, {DNS
 response errors}
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/09/20 19:27:00 #26647840
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Sat, 21 Sep 2024 07:38:43 +0000
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

Fix several copypaste mistakes in *_disable_link_output() functions where
an improper function pointer is checked before dereference.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 2 +-
 drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 2 +-
 drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index d52ce58c6a98..c2364cb66d0b 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -3258,7 +3258,7 @@ void dce110_disable_link_output(struct dc_link *link,
 	 * from enable/disable link output and only call edp panel control
 	 * in enable_link_dp and disable_link_dp once.
 	 */
-	if (dmcu != NULL && dmcu->funcs->lock_phy)
+	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index 4e93eeedfc1b..5b6cf2a8e38d 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -478,7 +478,7 @@ void dcn314_disable_link_output(struct dc_link *link,
 	 * from enable/disable link output and only call edp panel control
 	 * in enable_link_dp and disable_link_dp once.
 	 */
-	if (dmcu != NULL && dmcu->funcs->lock_phy)
+	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index a36e11606f90..84153682af1a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -1384,10 +1384,10 @@ void dcn32_disable_link_output(struct dc_link *link,
 	link->phy_state.symclk_state = SYMCLK_OFF_TX_OFF;
 
 	if (signal == SIGNAL_TYPE_EDP &&
-			link->dc->hwss.edp_backlight_control &&
+			link->dc->hwss.edp_power_control &&
 			!link->skip_implict_edp_power_control)
 		link->dc->hwss.edp_power_control(link, false);
-	else if (dmcu != NULL && dmcu->funcs->lock_phy)
+	else if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
 	dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
-- 
2.46.1

