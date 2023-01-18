Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC16717C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8C810E225;
	Wed, 18 Jan 2023 09:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D099C10E225;
 Wed, 18 Jan 2023 09:30:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0B039CE1BDD;
 Wed, 18 Jan 2023 09:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303B3C433D2;
 Wed, 18 Jan 2023 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674034218;
 bh=pUmitdCWgBZAVCI5fSjyfp0oSa/dGTogN9eI1BRZzrs=;
 h=From:To:Cc:Subject:Date:From;
 b=gwxTJQ77MUNvbysMBAN4/g9PBW68M3KSkeVAUYbBd4nDgMtihXlrtfGnEp8W+P5Mw
 fizsYN1JvKhCZcRTxr1+ZE5zMGsWBd4fxLYarfFaoSu3434LeHKYeU5ysqFW2t+zGx
 ucnrF/g1B5QlWKw0pwjH5xmPL+Pn7Zlpo7cEbe2tJr3ry9B1sDmJKMjxwLMAyGiWph
 fWVTfk+d1eO9xgH8qV9r4+p8z96Y3nnfvRl+Qa86z0XtLf6TYOEcT+ra9rezyV9u7k
 XtnDrzzgtIAClHuwHcPK6hCZ6QRdYIRocPww2ORNSIxuIUGhbpOiagnxV7aEdzvgCp
 oT01Ddi2oC/2Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: fix dp_retrieve_lttpr_cap() return value
Date: Wed, 18 Jan 2023 10:29:56 +0100
Message-Id: <20230118093011.3796248-1-arnd@kernel.org>
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
Cc: Lewis Huang <Lewis.Huang@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-13 notices a mismatch between the return type of dp_retrieve_lttpr_cap()
and the returned value:

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'dp_retrieve_lttpr_cap':
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1465:24: error: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Werror=enum-conversion]
 1465 |                 return false;
      |                        ^~~~~

Change the value to an actual dc_status code and remove the bogus
initialization that was apparently meant to get returned here.

Fixes: b473bd5fc333 ("drm/amd/display: refine wake up aux in retrieve link caps")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
index 088f4291bfbf..e72ad1b8330f 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
@@ -1455,14 +1455,14 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
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

