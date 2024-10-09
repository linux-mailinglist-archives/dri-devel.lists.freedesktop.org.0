Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4C996FCB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0D8914B;
	Wed,  9 Oct 2024 15:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="aRCv0Qs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4004D8914B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:34:36 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7ea07610762so2538411a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1728488076; x=1729092876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GvuOdksElWpJnNPh6RkDbo3IS4gekISRoo0yajPlwW8=;
 b=aRCv0Qs0XQiSz5OvyxO82Sw3hL4okg6IGj/xPmQrdTxWza+ZxnzOWkBWl2b5tvvJNV
 969ct8UlIeu9yWyBdkYEuvpOUCXvPtNM/M0293qnPWgktAxsF6H8hb2I7qXBcg3lgOLx
 7hpGGUhCCgwdIgafKkE62UUQzCv3GceY3Ap2TllPqElLPHLoKgxCNPcnDBQ/zAO5ghmY
 IdYbXhlL+XTiOXsqc17vrY0egMpbsdyckgzTfW1Ndm5DmGuQcoaxbHXTN+ufCnDoGf2S
 AZTzMndwp5UgJUDJKEcX/7uQ71R+eZfMHtuB3bhjOU0h9Pe3/fd3kzSGjd0OV5aJn9wg
 YD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728488076; x=1729092876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GvuOdksElWpJnNPh6RkDbo3IS4gekISRoo0yajPlwW8=;
 b=h5M1lb57Okox1MwKnQNqTNUBn+j+OMr+zttF/W8Z7K468WSpxcEQC22EHQy+8PeK1o
 caMVlqmRuIEJZWU7Oz6shhbpW9Jj65KHDAppR/ingtweoq29kqNB6g2csU78PnjFpFSq
 18nngIi7tS78uc9EI8rQoRDcruLxv+1+jEgJqejY2IURIwSOR+fFqVOhp4owgIqhMLZe
 VAuxi8LyFciRsNEWfo81Y7F4DAjN2R6Rsz9dQrtdNXT9T8EUiM9U0HwBHvIYzsMTWR3r
 LMPTAvMkDyEDsz7JHYrzAb1qIRRXREEir0qRq6Oq+Y8Qws8qcjFAjUZo1N6QAIEVloWr
 MN5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlD5xNqCofj3/JJOk+tJ2mxgArDonnmffeOKuf6UfETexC3DHh0X4d5w1kxvxhSN1ANELRxkW2fDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz8COfbyz8U13wSwpoC14qmeC4Zujvx6y5Owne2fVzaVOpNsLJ
 tzNnMEVGuHQ3DmCD9Gr/d+U4fWCGzu+cWDQWdNXy/CxCVRv8UohMxWLp1HFl5jk=
X-Google-Smtp-Source: AGHT+IGn7YV0BWxMiymAwibfTWGP4qHJkG8wd9cz+gVQLRXftTikih0zowerwBK6lm4+VNB/QwnaDg==
X-Received: by 2002:a05:6a21:4006:b0:1d8:a260:fd75 with SMTP id
 adf61e73a8af0-1d8a3be3646mr5847326637.7.1728488075540; 
 Wed, 09 Oct 2024 08:34:35 -0700 (PDT)
Received: from localhost.localdomain ([187.46.70.175])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7ced7sm7878069b3a.191.2024.10.09.08.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:34:35 -0700 (PDT)
From: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: LipArcanjo <luanicaroarcanjo@gmail.com>,
 Luan Icaro Pinto Arcanjo <luanicaro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/amd/display/dc: Refactor remove duplications
Date: Wed,  9 Oct 2024 12:34:01 -0300
Message-ID: <20241009153424.15256-1-luanicaro@usp.br>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: LipArcanjo <luanicaroarcanjo@gmail.com>

All dce command_table_helper's shares a copy-pasted collection
of copy-pasted functions, which are: phy_id_to_atom,
clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.

This patch removes the multiple copy-pasted by creating a
common command table and make the command_table_helper's calls
the functions implemented by the common instead.

The changes were not tested on actual hardware. I am only able
to verify that the changes keep the code compileable and do my
best to to look repeatedly if I am not actually changing any code.

This is a re-sent PATCH, as I did not receive any reply to 
the original one for about 2 months.

Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
---
 drivers/gpu/drm/amd/display/dc/bios/Makefile  |   6 +
 .../bios/dce110/command_table_helper_dce110.c | 104 +-------------
 .../dce112/command_table_helper2_dce112.c     | 104 +-------------
 .../bios/dce112/command_table_helper_dce112.c | 104 +-------------
 .../bios/dce60/command_table_helper_dce60.c   | 106 +-------------
 .../bios/dce80/command_table_helper_dce80.c   | 106 +-------------
 .../command_table_helper_dce_common.c         | 133 ++++++++++++++++++
 .../command_table_helper_dce_common.h         |  37 +++++
 8 files changed, 183 insertions(+), 517 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h

diff --git a/drivers/gpu/drm/amd/display/dc/bios/Makefile b/drivers/gpu/drm/amd/display/dc/bios/Makefile
index ed6b5e9763f6..0d2f7ca1d0c2 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/bios/Makefile
@@ -27,6 +27,7 @@ BIOS = bios_parser.o bios_parser_interface.o  bios_parser_helper.o command_table
 
 BIOS += command_table2.o command_table_helper2.o bios_parser2.o
 
+
 AMD_DAL_BIOS = $(addprefix $(AMDDALPATH)/dc/bios/,$(BIOS))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_BIOS)
@@ -55,3 +56,8 @@ AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce110/command_table_helper_dce110.o
 AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper_dce112.o
 
 AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper2_dce112.o
+
+###############################################################################
+# DCE COMMON
+###############################################################################
+AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce_common/command_table_helper_dce_common.o
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
index 11bf247bb180..6f8fec224b88 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -94,32 +63,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -207,51 +150,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
index 755b6e33140a..3392277ac3b6 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper2.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
index 06b4f7fa4a50..39b199b388e4 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
index 710221b4f5c5..49b3c6fd648d 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
@@ -33,6 +33,8 @@
 
 #include "../command_table_helper.h"
 
+#include "../dce_common/command_table_helper_dce_common.h"
+
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
@@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 	return atom_action;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static bool clock_source_id_to_atom(
 	enum clock_source_id id,
 	uint32_t *atom_pll_id)
@@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
 	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
@@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
 	return atom_dig_encoder_sel;
 }
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
-
 static uint8_t disp_power_gating_action_to_atom(
 	enum bp_pipe_control_action action)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
index 8b30b558cf1f..f8c66e3a8f08 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
@@ -33,6 +33,8 @@
 
 #include "../command_table_helper.h"
 
+#include "../dce_common/command_table_helper_dce_common.h"
+
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
@@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 	return atom_action;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static bool clock_source_id_to_atom(
 	enum clock_source_id id,
 	uint32_t *atom_pll_id)
@@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
 	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
@@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
 	return atom_dig_encoder_sel;
 }
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
-
 static uint8_t disp_power_gating_action_to_atom(
 	enum bp_pipe_control_action action)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
new file mode 100644
index 000000000000..44793c3a28e0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
@@ -0,0 +1,133 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dm_services.h"
+#include "atom.h"
+
+#include "command_table_helper_dce_common.h"
+
+uint8_t phy_id_to_atom(enum transmitter t)
+{
+	uint8_t atom_phy_id;
+
+	switch (t) {
+	case TRANSMITTER_UNIPHY_A:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
+		break;
+	case TRANSMITTER_UNIPHY_B:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
+		break;
+	case TRANSMITTER_UNIPHY_C:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
+		break;
+	case TRANSMITTER_UNIPHY_D:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
+		break;
+	case TRANSMITTER_UNIPHY_E:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
+		break;
+	case TRANSMITTER_UNIPHY_F:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
+		break;
+	case TRANSMITTER_UNIPHY_G:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
+		break;
+	default:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
+		break;
+	}
+	return atom_phy_id;
+}
+
+uint8_t clock_source_id_to_atom_phy_clk_src_id(
+		enum clock_source_id id)
+{
+	uint8_t atom_phy_clk_src_id = 0;
+
+	switch (id) {
+	case CLOCK_SOURCE_ID_PLL0:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
+		break;
+	case CLOCK_SOURCE_ID_PLL1:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
+		break;
+	case CLOCK_SOURCE_ID_PLL2:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
+		break;
+	case CLOCK_SOURCE_ID_EXTERNAL:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
+		break;
+	default:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
+		break;
+	}
+
+	return atom_phy_clk_src_id >> 2;
+}
+
+bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
+{
+	bool result = false;
+
+	if (atom_engine_id != NULL)
+		switch (id) {
+		case ENGINE_ID_DIGA:
+			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGB:
+			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGC:
+			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGD:
+			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGE:
+			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGF:
+			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGG:
+			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DACA:
+			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
+			result = true;
+			break;
+		default:
+			break;
+		}
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
new file mode 100644
index 000000000000..6c9246a6e4e6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
+#define __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
+
+
+uint8_t phy_id_to_atom(enum transmitter t);
+
+uint8_t clock_source_id_to_atom_phy_clk_src_id(
+		enum clock_source_id id);
+
+bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
+
+#endif
-- 
2.43.0

