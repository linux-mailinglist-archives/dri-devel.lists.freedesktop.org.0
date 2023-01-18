Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00737672283
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9510E77B;
	Wed, 18 Jan 2023 16:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3010E77E;
 Wed, 18 Jan 2023 16:07:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D945B81D7D;
 Wed, 18 Jan 2023 16:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27895C433EF;
 Wed, 18 Jan 2023 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674058049;
 bh=erza5wFZzZpKsQRpijn12Ne9oD+6s0EUVrxM9VxD0K8=;
 h=From:To:Cc:Subject:Date:From;
 b=sU3sjFUfD9qPsYWoFVqac92lNyW7s5zIZLNULDMetjK6srOOinZ/Whv3xtYKSEGbG
 P66TD0OK/sWifzth9E5i7XqmapF+84ckRZlVDw6piDgLfi0rs7CGqVmRU1qJkV19Bs
 mRbyO0OXexSnHcMsyUBr42YV2jYhy77KXvs7JrSdccbFZx/9TivXOXp4E+clBwjU00
 Xi5tH73RcZNQhJjyve4H7PyA9jeWEmgu39meb6wMuyTbpYRaBIVEWYINn2S5CqvmtV
 8SFUaQwKSQsqrMhFfKw0IjkulweS4tKfmfJgh1dVNTqgOm7nYe4jmiJvzBmw/xd/6t
 r2qeo9C0iNY+w==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: fix hdmi_encoded_link_bw definition
Date: Wed, 18 Jan 2023 17:06:27 +0100
Message-Id: <20230118160722.289840-1-arnd@kernel.org>
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
Cc: Ian Chen <ian.chen@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Solomon Chiu <solomon.chiu@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 "Shen, George" <George.Shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Some of the data structures are hidden when CONFIG_DRM_AMD_DC_DCN is
disabled, which leads to a link failure:

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:234:21: error: 'union hdmi_encoded_link_bw' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  234 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
      |                     ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:234:42: error: parameter 2 ('hdmi_encoded_link_bw') has incomplete type
  234 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:232:17: error: function declaration isn't a prototype [-Werror=strict-prototypes]
  232 | static uint32_t intersect_frl_link_bw_support(
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'get_active_converter_info':
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1126:76: error: storage size of 'hdmi_encoded_link_bw' isn't known
 1126 |                                                 union hdmi_encoded_link_bw hdmi_encoded_link_bw;
      |                                                                            ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1130:101: error: 'struct <anonymous>' has no member named 'MAX_ENCODED_LINK_BW_SUPPORT'
 1130 |                                                                                 hdmi_color_caps.bits.MAX_ENCODED_LINK_BW_SUPPORT);

There is probably no need to hide the data structure, and removing
the #ifdef makes it build cleanly.

Fixes: d5a43956b73b ("drm/amd/display: move dp capability related logic to link_dp_capability")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index b7e53b7dc4ed..84da54358922 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -361,14 +361,10 @@ enum dpcd_downstream_port_detailed_type {
 union dwnstream_port_caps_byte2 {
 	struct {
 		uint8_t MAX_BITS_PER_COLOR_COMPONENT:2;
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 		uint8_t MAX_ENCODED_LINK_BW_SUPPORT:3;
 		uint8_t SOURCE_CONTROL_MODE_SUPPORT:1;
 		uint8_t CONCURRENT_LINK_BRING_UP_SEQ_SUPPORT:1;
 		uint8_t RESERVED:1;
-#else
-		uint8_t RESERVED:6;
-#endif
 	} bits;
 	uint8_t raw;
 };
@@ -406,7 +402,6 @@ union dwnstream_port_caps_byte3_hdmi {
 	uint8_t raw;
 };
 
-#if defined(CONFIG_DRM_AMD_DC_DCN)
 union hdmi_sink_encoded_link_bw_support {
 	struct {
 		uint8_t HDMI_SINK_ENCODED_LINK_BW_SUPPORT:3;
@@ -428,7 +423,6 @@ union hdmi_encoded_link_bw {
 	} bits;
 	uint8_t raw;
 };
-#endif
 
 /*4-byte structure for detailed capabilities of a down-stream port
 (DP-to-TMDS converter).*/
-- 
2.39.0

