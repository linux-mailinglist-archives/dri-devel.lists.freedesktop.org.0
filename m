Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6983664A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909C110F2C6;
	Mon, 22 Jan 2024 15:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031410F2C1;
 Mon, 22 Jan 2024 15:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 795636115B;
 Mon, 22 Jan 2024 15:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E686BC433F1;
 Mon, 22 Jan 2024 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935631;
 bh=6ZXLAZ3CUd7RckLL3TGYSlSEb3X1k/ch4z1/v29BQPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pAEzrwXP663CBCxl5C1oxV+iOTiexH2M33bMSLwAh2RPwOWHiizIrivZBDHDhHRFd
 xtItIAXd0IXA+mDM6qiWizjSzIQugw9wEBsu7IkjbqJZNYjj+KdJQcoB7ixFcZjr4/
 QH97JAhcGwVP91e/z0yPHxBlBBr7dy350qRl6qI7o/Itkr5yF74T+AZEAkNYwjK9CJ
 NUDQjSq5UumoXxTPf3qLnIQ4KcGwwhACKry9NJo/SMul231vDp5c/4fZ8nEz6wC5L6
 8FDbHFPFe2V2eSlmfLk73PY/6WirVWyO4oJdpgn2+j13e9LnJbbEinUlEHoVir3+vG
 CPX1tYqi3R0pA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 67/88] drm/amd/display: fix usb-c connector_type
Date: Mon, 22 Jan 2024 09:51:40 -0500
Message-ID: <20240122145608.990137-67-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <charlene.liu@amd.com>,
 sunpeng.li@amd.com, airlied@gmail.com, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, Allen Pan <allen.pan@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Allen Pan <allen.pan@amd.com>

[ Upstream commit 0d26644bc57d8737c8e2fb3145366f7d0b941935 ]

[why]
BIOS switches to use USB-C connector type 0x18, but VBIOS's
objectInfo table not supported yet. driver needs to patch it
based on enc_cap from system integration info table.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Allen Pan <allen.pan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
index f91e08895275..da94e5309fba 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
@@ -256,6 +256,10 @@ void dcn35_link_encoder_construct(
 		enc10->base.features.flags.bits.IS_UHBR10_CAPABLE = bp_cap_info.DP_UHBR10_EN;
 		enc10->base.features.flags.bits.IS_UHBR13_5_CAPABLE = bp_cap_info.DP_UHBR13_5_EN;
 		enc10->base.features.flags.bits.IS_UHBR20_CAPABLE = bp_cap_info.DP_UHBR20_EN;
+		if (bp_cap_info.DP_IS_USB_C) {
+			/*BIOS not switch to use CONNECTOR_ID_USBC = 24 yet*/
+			enc10->base.features.flags.bits.DP_IS_USB_C = 1;
+		}
 
 	} else {
 		DC_LOG_WARNING("%s: Failed to get encoder_cap_info from VBIOS with error code %d!\n",
@@ -264,4 +268,5 @@ void dcn35_link_encoder_construct(
 	}
 	if (enc10->base.ctx->dc->debug.hdmi20_disable)
 		enc10->base.features.flags.bits.HDMI_6GB_EN = 0;
+
 }
-- 
2.43.0

