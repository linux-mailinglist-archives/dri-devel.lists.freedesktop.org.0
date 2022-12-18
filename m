Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7AA64FFC4
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB1B10E1D8;
	Sun, 18 Dec 2022 16:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8057810E1EC;
 Sun, 18 Dec 2022 16:05:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3AC660DD6;
 Sun, 18 Dec 2022 16:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D289C433D2;
 Sun, 18 Dec 2022 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379487;
 bh=umouLSA0PCSKowQjJ7kX+BkOJw7cBp2o3XmBEK7W//o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WTBn0xvbbJ+SnHQjg0aJmYvB8iMckSCmFzdrp5y4/ODn37Jvv46Dk/59K1fNNuy0F
 NMZla2HWCyplfmX7P462cS9kytZcAvFFIUDXfPsTpLP9OE49n46cSNcxaEdg6QN83q
 VRFZAUv/CEtlh0FW+W2MhXW0/FB5hrYfDSgHK7nYxRr1/ThJjCiiqBLLHw3D7Ud4QO
 7S2Glm9iteFvDcihxef/ZwHOZmSddrA/AvDtNxsWQY9pUMIBbuHKhro3mVo55+GI08
 2H7X2lNZoSW++3Jvjma2pmrYoiNUUSkbX9x4Z2XPkqje9M8uTOKCCBQh6Dv0s/wp1V
 CpBWs0rrLPHkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 46/85] drm/amd/display: fix array index out of
 bound error in bios parser
Date: Sun, 18 Dec 2022 11:01:03 -0500
Message-Id: <20221218160142.925394-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 tales.aparecida@gmail.com, Tom Chung <chiahsuan.chung@amd.com>,
 wayne.lin@amd.com, sunpeng.li@amd.com, sancchen@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Martin Leung <Martin.Leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit 4fc1ba4aa589ca267468ad23fedef37562227d32 ]

[Why&How]
Firmware headers dictate that gpio_pin array only has a size of 8. The
count returned from vbios however is greater than 8.

Fix this by not using array indexing but incrementing the pointer since
gpio_pin definition in atomfirmware.h is hardcoded to size 8

Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/bios/bios_parser2.c   | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index e0c8d6f09bb4..074e70a5c458 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -462,6 +462,7 @@ static enum bp_result get_gpio_i2c_info(
 	uint32_t count = 0;
 	unsigned int table_index = 0;
 	bool find_valid = false;
+	struct atom_gpio_pin_assignment *pin;
 
 	if (!info)
 		return BP_RESULT_BADINPUT;
@@ -489,20 +490,17 @@ static enum bp_result get_gpio_i2c_info(
 			- sizeof(struct atom_common_table_header))
 				/ sizeof(struct atom_gpio_pin_assignment);
 
+	pin = (struct atom_gpio_pin_assignment *) header->gpio_pin;
+
 	for (table_index = 0; table_index < count; table_index++) {
-		if (((record->i2c_id & I2C_HW_CAP) == (
-		header->gpio_pin[table_index].gpio_id &
-						I2C_HW_CAP)) &&
-		((record->i2c_id & I2C_HW_ENGINE_ID_MASK)  ==
-		(header->gpio_pin[table_index].gpio_id &
-					I2C_HW_ENGINE_ID_MASK)) &&
-		((record->i2c_id & I2C_HW_LANE_MUX) ==
-		(header->gpio_pin[table_index].gpio_id &
-						I2C_HW_LANE_MUX))) {
+		if (((record->i2c_id & I2C_HW_CAP) 				== (pin->gpio_id & I2C_HW_CAP)) &&
+		    ((record->i2c_id & I2C_HW_ENGINE_ID_MASK)	== (pin->gpio_id & I2C_HW_ENGINE_ID_MASK)) &&
+		    ((record->i2c_id & I2C_HW_LANE_MUX) 		== (pin->gpio_id & I2C_HW_LANE_MUX))) {
 			/* still valid */
 			find_valid = true;
 			break;
 		}
+		pin = (struct atom_gpio_pin_assignment *)((uint8_t *)pin + sizeof(struct atom_gpio_pin_assignment));
 	}
 
 	/* If we don't find the entry that we are looking for then
-- 
2.35.1

