Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05860943C5D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0FE10E846;
	Thu,  1 Aug 2024 00:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hp/1zalI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3B10E841;
 Thu,  1 Aug 2024 00:37:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF4B3CE17D8;
 Thu,  1 Aug 2024 00:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361DCC32786;
 Thu,  1 Aug 2024 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472646;
 bh=Cprr7vR9Z+EV80ZeTr3QpFys157E35gzydOAX9Cg+NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hp/1zalIBypwifAN5WepCoEzT1ac68OG0QfK5e8GokjfuQBIRRJ8UqtadMzZIwHyb
 ocamed+qiJH+qq/dpHPwTJom37Zw+CHpnaAMse0UfsxQ6VqOn82CnGGWW6WsF26hOt
 Yg86A38le81YZMCruQRi9H5KYiaUSp6vqFAJsSq8CXnCFCK23/E7qU0neVq9LJRl8G
 EF9Ng3oCvLno9937GJHgcEBmgb8DbNX1dAtdABwujmu42DKeaHNBWnIF7aod1ZTgu6
 Xm6Pgdz9fC9aq2xciL5jRgJRjEvT8K3UXqgW31RN9ijwdx9ozR6WibuB7NvK1bm9wE
 a4Vbmah9GLLaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 hamza.mahfooz@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 09/38] drm/amd/display: Check msg_id before
 processing transcation
Date: Wed, 31 Jul 2024 20:35:15 -0400
Message-ID: <20240801003643.3938534-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003643.3938534-1-sashal@kernel.org>
References: <20240801003643.3938534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit fa71face755e27dc44bc296416ebdf2c67163316 ]

[WHY & HOW]
HDCP_MESSAGE_ID_INVALID (-1) is not a valid msg_id nor is it a valid
array index, and it needs checking before used.

This fixes 4 OVERRUN issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
index 51855a2624cf4..b1d5387195054 100644
--- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
+++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
@@ -130,13 +130,21 @@ static bool hdmi_14_process_transaction(
 	const uint8_t hdcp_i2c_addr_link_primary = 0x3a; /* 0x74 >> 1*/
 	const uint8_t hdcp_i2c_addr_link_secondary = 0x3b; /* 0x76 >> 1*/
 	struct i2c_command i2c_command;
-	uint8_t offset = hdcp_i2c_offsets[message_info->msg_id];
+	uint8_t offset;
 	struct i2c_payload i2c_payloads[] = {
-		{ true, 0, 1, &offset },
+		{ true, 0, 1, 0 },
 		/* actual hdcp payload, will be filled later, zeroed for now*/
 		{ 0 }
 	};
 
+	if (message_info->msg_id == HDCP_MESSAGE_ID_INVALID) {
+		DC_LOG_ERROR("%s: Invalid message_info msg_id - %d\n", __func__, message_info->msg_id);
+		return false;
+	}
+
+	offset = hdcp_i2c_offsets[message_info->msg_id];
+	i2c_payloads[0].data = &offset;
+
 	switch (message_info->link) {
 	case HDCP_LINK_SECONDARY:
 		i2c_payloads[0].address = hdcp_i2c_addr_link_secondary;
@@ -310,6 +318,11 @@ static bool dp_11_process_transaction(
 	struct dc_link *link,
 	struct hdcp_protection_message *message_info)
 {
+	if (message_info->msg_id == HDCP_MESSAGE_ID_INVALID) {
+		DC_LOG_ERROR("%s: Invalid message_info msg_id - %d\n", __func__, message_info->msg_id);
+		return false;
+	}
+
 	return dpcd_access_helper(
 		link,
 		message_info->length,
-- 
2.43.0

