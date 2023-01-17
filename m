Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DF66E48E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18410E595;
	Tue, 17 Jan 2023 17:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5410F10E595;
 Tue, 17 Jan 2023 17:12:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 053CFB81911;
 Tue, 17 Jan 2023 17:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89186C433D2;
 Tue, 17 Jan 2023 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673975567;
 bh=WwkZdJTRH/e6oDjQt1JBj5r7Hxk3Sps4Rt8KnDt4/u0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZNGm4dQXyPpdlm7+X9Q4CvkWy0n/zRxxC7Ir3C+TUbW7gC1qxMaaS5DvieEd5lipB
 enf5LpmFk7sumKBslDpDA4iwMbwtkaco2vtLfWHLz3agHqyEFmDjTuJvj0Hqv+zKSH
 xKKUwC0JlzGg23g4T8+MHo6zp64b1EiBKmdlrQG0n5hijI21iRv5HUdykcWJz24et2
 SW/Lk95wWovkMoSGbJ5uySheXx62h3p13bsj02eTXe08CERf4E7LKK8dhRZGcGyr2n
 3dKH6wXinGH1vHVrOkN39F4fDBMA8ZoaeOBIb5POjI4UKDLtvWiRuAT28+zz6P5aUF
 xKt199peEHU4A==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] [v2] drm/amd/display: fix dp_retrieve_lttpr_cap return code
Date: Tue, 17 Jan 2023 18:12:24 +0100
Message-Id: <20230117171239.2714855-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Lewis Huang <Lewis.Huang@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The dp_retrieve_lttpr_cap() return type changed from 'bool'
to 'enum dc_status', so now the early 'return' uses the wrong
type:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c: In function 'dp_retrieve_lttpr_cap':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5075:24: error: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Werror=enum-conversion]
 5075 |                 return false;
      |                        ^~~~~

Convert it to return 'DC_ERROR_UNEXPECTED', which was apparently set
as a default return code here but never used.

Fixes: b473bd5fc333 ("drm/amd/display: refine wake up aux in retrieve link caps")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2 changes:
 - use DC_ERROR_UNEXPECTED instead of DC_OK
 - remove bogus initializers
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 9edfcdf3db3b..cf512362b4f1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -5088,14 +5088,14 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
 enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 {
 	uint8_t lttpr_dpcd_data[8];
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	bool is_lttpr_present = false;
+	enum dc_status status;
+	bool is_lttpr_present;
 
 	/* Logic to determine LTTPR support*/
 	bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
 
 	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
-		return false;
+		return DC_ERROR_UNEXPECTED;
 
 	/* By reading LTTPR capability, RX assumes that we will enable
 	 * LTTPR extended aux timeout if LTTPR is present.
-- 
2.39.0

