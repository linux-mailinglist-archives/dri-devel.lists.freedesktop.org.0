Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C781194B3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766CF6E97F;
	Tue, 10 Dec 2019 21:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E7A6E966;
 Tue, 10 Dec 2019 21:17:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFA1724698;
 Tue, 10 Dec 2019 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012129;
 bh=08DoADdqRUPWJ+sopBpimPGPenU5rEjxVPErtPZY8oQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=05mzdiJhBJ0isiIRr0V2fOfI8N6D9Zpq0X+WpMWj39YPYhPabfGiHVKDxzkqLRAXG
 P+Rc146ymxoakk3snwRQpet/7V2Rm9XexFJbzR3+WMq66VJrSrc8XzsAVCrHfaBGbL
 v+0D6HtIUE7e5AYbHl0z/GuQ+urq1M9spiX3iA9E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 098/350] drm/amd/display: add new active dongle to
 existent w/a
Date: Tue, 10 Dec 2019 16:03:23 -0500
Message-Id: <20191210210735.9077-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Vitaly Prosyak <Vitaly.Prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[ Upstream commit 566b4252fe9da9582dde008c5e9c3eb7c136e348 ]

[Why & How]
Dongle 0x00E04C power down all internal circuits including
AUX communication preventing reading DPCD table.
Encoder will skip DP RX power down on disable output
to keep receiver powered all the time.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Acked-by: Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c        | 1 +
 drivers/gpu/drm/amd/display/include/ddc_service_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index f5742719b5d9b..9e261dbf2e493 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2691,6 +2691,7 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
 		 * keep receiver powered all the time.*/
 		case DP_BRANCH_DEVICE_ID_0010FA:
 		case DP_BRANCH_DEVICE_ID_0080E1:
+		case DP_BRANCH_DEVICE_ID_00E04C:
 			link->wa_flags.dp_keep_receiver_powered = true;
 			break;
 
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index 18961707db237..9ad49da50a17d 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -31,6 +31,8 @@
 #define DP_BRANCH_DEVICE_ID_0022B9 0x0022B9
 #define DP_BRANCH_DEVICE_ID_00001A 0x00001A
 #define DP_BRANCH_DEVICE_ID_0080E1 0x0080e1
+#define DP_BRANCH_DEVICE_ID_90CC24 0x90CC24
+#define DP_BRANCH_DEVICE_ID_00E04C 0x00E04C
 
 enum ddc_result {
 	DDC_RESULT_UNKNOWN = 0,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
