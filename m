Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273382502DD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 18:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CDB6E353;
	Mon, 24 Aug 2020 16:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6726E2E6;
 Mon, 24 Aug 2020 16:37:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BF7622C9F;
 Mon, 24 Aug 2020 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287020;
 bh=S7ECAN+qn/s+wnh0kJhI7SdCw/kXvFwD8mdYQzpRZbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mgtUfMt3PnTYGw20EiVSz0yF1a0leKujTyIgz05XAagFXp9vVWNQsgWhHZrVX3Yt7
 y7iJIJsFvUvpjDhc1rbXSJJG5mNqNrGaxhPYv3qDZksE/1MQD/BJYz/COn0gouPwTT
 d/oGO8YXv0OMaDxmvHf2v3MEuHmEYxCfVcUc42ME=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 19/54] drm/amd/display: Switch to immediate mode
 for updating infopackets
Date: Mon, 24 Aug 2020 12:35:58 -0400
Message-Id: <20200824163634.606093-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163634.606093-1-sashal@kernel.org>
References: <20200824163634.606093-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anthony Koo <Anthony.Koo@amd.com>

[ Upstream commit abba907c7a20032c2d504fd5afe3af7d440a09d0 ]

[Why]
Using FRAME_UPDATE will result in infopacket to be potentially updated
one frame late.
In commit stream scenarios for previously active stream, some stale
infopacket data from previous config might be erroneously sent out on
initial frame after stream is re-enabled.

[How]
Switch to using IMMEDIATE_UPDATE mode

Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Ashley Thomas <Ashley.Thomas2@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c  | 16 ++++++++--------
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h  | 14 ++++++++++++++
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
index 7eba9333c3285..66ce9092e9950 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
@@ -121,35 +121,35 @@ void enc1_update_generic_info_packet(
 	switch (packet_index) {
 	case 0:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC0_FRAME_UPDATE, 1);
+				AFMT_GENERIC0_IMMEDIATE_UPDATE, 1);
 		break;
 	case 1:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC1_FRAME_UPDATE, 1);
+				AFMT_GENERIC1_IMMEDIATE_UPDATE, 1);
 		break;
 	case 2:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC2_FRAME_UPDATE, 1);
+				AFMT_GENERIC2_IMMEDIATE_UPDATE, 1);
 		break;
 	case 3:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC3_FRAME_UPDATE, 1);
+				AFMT_GENERIC3_IMMEDIATE_UPDATE, 1);
 		break;
 	case 4:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC4_FRAME_UPDATE, 1);
+				AFMT_GENERIC4_IMMEDIATE_UPDATE, 1);
 		break;
 	case 5:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC5_FRAME_UPDATE, 1);
+				AFMT_GENERIC5_IMMEDIATE_UPDATE, 1);
 		break;
 	case 6:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC6_FRAME_UPDATE, 1);
+				AFMT_GENERIC6_IMMEDIATE_UPDATE, 1);
 		break;
 	case 7:
 		REG_UPDATE(AFMT_VBI_PACKET_CONTROL1,
-				AFMT_GENERIC7_FRAME_UPDATE, 1);
+				AFMT_GENERIC7_IMMEDIATE_UPDATE, 1);
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
index f9b9e221c698b..7507000a99ac4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
@@ -273,7 +273,14 @@ struct dcn10_stream_enc_registers {
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC2_FRAME_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC3_FRAME_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC4_FRAME_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC0_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC1_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC2_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC3_IMMEDIATE_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC4_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC5_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC6_IMMEDIATE_UPDATE, mask_sh),\
+	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC7_IMMEDIATE_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC5_FRAME_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC6_FRAME_UPDATE, mask_sh),\
 	SE_SF(DIG0_AFMT_VBI_PACKET_CONTROL1, AFMT_GENERIC7_FRAME_UPDATE, mask_sh),\
@@ -337,7 +344,14 @@ struct dcn10_stream_enc_registers {
 	type AFMT_GENERIC2_FRAME_UPDATE;\
 	type AFMT_GENERIC3_FRAME_UPDATE;\
 	type AFMT_GENERIC4_FRAME_UPDATE;\
+	type AFMT_GENERIC0_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC1_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC2_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC3_IMMEDIATE_UPDATE;\
 	type AFMT_GENERIC4_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC5_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC6_IMMEDIATE_UPDATE;\
+	type AFMT_GENERIC7_IMMEDIATE_UPDATE;\
 	type AFMT_GENERIC5_FRAME_UPDATE;\
 	type AFMT_GENERIC6_FRAME_UPDATE;\
 	type AFMT_GENERIC7_FRAME_UPDATE;\
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
