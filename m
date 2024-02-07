Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A007884D3AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 22:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A5110E102;
	Wed,  7 Feb 2024 21:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dOcYImax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA5B10E443;
 Wed,  7 Feb 2024 21:22:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AABB61A30;
 Wed,  7 Feb 2024 21:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0454C433C7;
 Wed,  7 Feb 2024 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707340961;
 bh=XQmgObsbR2utlB2lO8x1pRM+8CpAf20TdDR/m8plFKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dOcYImaxQPzDWBGPnwr+hfUMqRCUiv4tCXIwyQy+Dkxt6Y+i+NAf+8Z0GfLMMZokG
 txkKZigh71p3BCVEqY0C6z2UMUJgnj0AIKiQRp9/x/SKfgwIO/5g1cAuNcrQeJaQF0
 AvAjpVCcXSJS8kGKux3z2NIcBzAQ09+A6l3YI/puV+rp5jjGRzlxreHFhiLi3wQU+J
 4fqmfPcmZ7R38N0tqFHms34HCno/8rCN1HbVyW1q4Bd2stH6cWB7Fy3WKHtmsKV/UW
 guNoNVVgYMc+nG9oi+S9cJipFEBX/7OAtDo3ByCg0W/odwXiU8gJiZDWdI4Lwab1xR
 BfnRI3GywZiQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charlene Liu <charlene.liu@amd.com>, Muhammad Ahmed <ahmed.ahmed@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wayne.lin@amd.com, allen.pan@amd.com,
 Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 26/44] drm/amd/display: fix USB-C flag update
 after enc10 feature init
Date: Wed,  7 Feb 2024 16:20:53 -0500
Message-ID: <20240207212142.1399-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207212142.1399-1-sashal@kernel.org>
References: <20240207212142.1399-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charlene Liu <charlene.liu@amd.com>

[ Upstream commit b5abd7f983e14054593dc91d6df2aa5f8cc67652 ]

[why]
BIOS's integration info table not following the original order
which is phy instance is ext_displaypath's array index.

[how]
Move them to follow the original order.

Reviewed-by: Muhammad Ahmed <ahmed.ahmed@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Charlene Liu <charlene.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
index 501388014855..d761b0df2878 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
@@ -203,12 +203,12 @@ void dcn32_link_encoder_construct(
 	enc10->base.hpd_source = init_data->hpd_source;
 	enc10->base.connector = init_data->connector;
 
-	if (enc10->base.connector.id == CONNECTOR_ID_USBC)
-		enc10->base.features.flags.bits.DP_IS_USB_C = 1;
 
 	enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
 
 	enc10->base.features = *enc_features;
+	if (enc10->base.connector.id == CONNECTOR_ID_USBC)
+		enc10->base.features.flags.bits.DP_IS_USB_C = 1;
 
 	enc10->base.transmitter = init_data->transmitter;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
index f91e08895275..3fca3dca61f0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
@@ -184,8 +184,6 @@ void dcn35_link_encoder_construct(
 	enc10->base.hpd_source = init_data->hpd_source;
 	enc10->base.connector = init_data->connector;
 
-	if (enc10->base.connector.id == CONNECTOR_ID_USBC)
-		enc10->base.features.flags.bits.DP_IS_USB_C = 1;
 
 	enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
 
@@ -240,6 +238,8 @@ void dcn35_link_encoder_construct(
 	}
 
 	enc10->base.features.flags.bits.HDMI_6GB_EN = 1;
+	if (enc10->base.connector.id == CONNECTOR_ID_USBC)
+		enc10->base.features.flags.bits.DP_IS_USB_C = 1;
 
 	if (bp_funcs->get_connector_speed_cap_info)
 		result = bp_funcs->get_connector_speed_cap_info(enc10->base.ctx->dc_bios,
-- 
2.43.0

