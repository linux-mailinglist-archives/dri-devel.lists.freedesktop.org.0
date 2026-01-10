Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01BD0DA5E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 19:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5568F10E17A;
	Sat, 10 Jan 2026 18:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRcUiShW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2410E1A2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 15:26:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-81ef4b87291so449541b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768058793; x=1768663593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExHuWpFYuvzYHoUvmHMsDGIZ1gwQCmuqPwja0g87GZ8=;
 b=gRcUiShWCzffzTATCEa0/YKDL4PVsbaQM2OKsjZfrV2cXG8iaPozPhVvXmmy2r/3x/
 Gxi4MrMHWFseb+07Md8KBbi77b+4T85RcIYhJH4HtaJf4LAZ2r5U3ADlkP8bsFxA00ka
 NbyinvzFick9jEh+0MPuPGzbT8Xv2tt41O5pfBXHMrVc/lmut2H4Kz4SuiUKD4LRYMb5
 g5i4ClAOMK3fOSZay9gqvmS5eY7sbj3I6J04z5atuy+LzebO6MElTFCu48puu8LYX5KZ
 9/ZeopMOKFWTBCdvHKEIiNMYPsiA0RG9rVt+tP5WMeMTUr92vVb1Q4Geb9UjiXYFfpn9
 V3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768058793; x=1768663593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ExHuWpFYuvzYHoUvmHMsDGIZ1gwQCmuqPwja0g87GZ8=;
 b=i4O+KOyw37ZOdFMBQtjTSzYzhX7j8JqbfWSWU8hkhnM58psA/4Z3je1Wm4TU0UIMDH
 SiBSsRLos4LvN+4p82HpRTgRNACiFjuuUUYSKPOqhKUPCASDVTBlWLoK0TL1Xj7FCTYk
 mT8PuAMCaXU2BiHRgJ13RZjG7PEiOskyfImOvpiOcO+fMwTK2hs+ptuzGGkTsT+QrWWZ
 uW68HOUxYDFQ/Rder1a+0RmAyZZzCiRvJ3B+q32JhpxKeWWKW6YK93Thf1PG6CQbUqif
 0yypeTfg5bHS/tsNbbkBuUt/bIDynMv/E3pYGiwYKIChhKWpipTUe4pKis6GdAd40ofW
 MKVA==
X-Gm-Message-State: AOJu0YznNdPOO+46ixYLlLNofSTfnGFG9YNVq3BxXRgiPFNv9dU7fViD
 z8I+bQYjx8Se89z8LCBHrUg8c+vQw4P9Q2/oZjpYmPA3lpgh0mjN03w=
X-Gm-Gg: AY/fxX54H3UzutH8rJi4mI7ano8Y+whbNmUhFm7mDSwG3fQDUZEftrXwC4omTOKcvyy
 uSog8Mpn3LdzYunD5kixRiu5GtbBJVL7bsoNS+btGlaLXUCcUQ2McpQeJw8WpLxK+f9GuJYUXCg
 uu0WYiFBQUyuhTLhJMnaP4qr9mUQsxQ53EIygqpM/G/9Xio0cqs7/4b1ZozUN5etHFUwuiyRVp+
 aBUXGqXlbFRTaeg0JcRlAlIyz6MOGr8XMj7ICDlYsM9gGg0VeZeSByEwIapeBiHJrXb2Q9fHJmL
 GZOHu6wlTfH+knsy0ALumjIq64YipfwKMW4NKSkm39z6mFNmOqmDPIvG5l+XNaZCW5vMGz0aWIW
 LbVwybO04uYBUCW8gE0NTiXqk8NbIpX+Mn2SpJPtOdg4d8r1x14MMmYG/4ALO/igemo2C8vz9Y+
 E14RQ4e71PmW7aiWWWHbrrqh+mAEtRrMB+2YFmF2yngxtc1BU342xS4XaPjTg+TiHT40Qb74UmU
 bBd/TRt
X-Google-Smtp-Source: AGHT+IH7mBj7PPLRfVb3A2O0XATpTJScJZZT8x3SVMdLz/XnkWw7wXYuSj38Xx7/krVrHHAnyz4MDg==
X-Received: by 2002:a05:6a00:4186:b0:781:17fb:d3ca with SMTP id
 d2e1a72fcca58-81b7de5c609mr11127452b3a.15.1768058793103; 
 Sat, 10 Jan 2026 07:26:33 -0800 (PST)
Received: from DESKTOP-BKIPFGN
 (ec2-54-169-177-146.ap-southeast-1.compute.amazonaws.com. [54.169.177.146])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81c4905ca83sm8487203b3a.38.2026.01.10.07.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 07:26:32 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: sunpeng.li@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] drm/amd/display: dcn314: clamp NumDfPstatesEnabled to table
 size
Date: Sat, 10 Jan 2026 23:26:03 +0800
Message-ID: <20260110152603.2107-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Jan 2026 18:20:20 +0000
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

NumDfPstatesEnabled from SMU/PMFW is used to iterate over DfPstateTable[]
in dcn314_clk_mgr_helper_populate_bw_params(). The value is not validated
against the maximum number of DF P-states supported.

Although we have not observed any firmware returning an invalid value,
an oversized NumDfPstatesEnabled could cause an out-of-bounds read.

A similar bounds issue in dcn35_clkmgr was previously fixed and assigned
CVE-2024-26699. This patch applies the same defensive check to dcn314.

Clamp NumDfPstatesEnabled to NUM_DF_PSTATE_LEVELS before using it.

Fixes: 19f7b8334484 ("drm/amd/display: Update clock table policy for DCN314")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
index db687a13174d..50ea75d974fd 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
@@ -754,9 +754,15 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 	struct clk_limit_table_entry def_max = bw_params->clk_table.entries[bw_params->clk_table.num_entries - 1];
 	uint32_t max_pstate = 0,  max_fclk = 0,  min_pstate = 0, max_dispclk = 0, max_dppclk = 0;
 	int i;
+	/* Clamp NumDfPstatesEnabled to avoid out-of-bounds access */
+	uint8_t num_memps = clock_table->NumDfPstatesEnabled;
+
+	if (num_memps > NUM_DF_PSTATE_LEVELS) {
+		num_memps = NUM_DF_PSTATE_LEVELS;
+	}
 
 	/* Find highest valid fclk pstate */
-	for (i = 0; i < clock_table->NumDfPstatesEnabled; i++) {
+	for (i = 0; i < num_memps; i++) {
 		if (is_valid_clock_value(clock_table->DfPstateTable[i].FClk) &&
 		    clock_table->DfPstateTable[i].FClk > max_fclk) {
 			max_fclk = clock_table->DfPstateTable[i].FClk;
@@ -782,7 +788,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 		uint32_t min_fclk = clock_table->DfPstateTable[0].FClk;
 		int j;
 
-		for (j = 1; j < clock_table->NumDfPstatesEnabled; j++) {
+		for (j = 1; j < num_memps; j++) {
 			if (is_valid_clock_value(clock_table->DfPstateTable[j].FClk) &&
 			    clock_table->DfPstateTable[j].FClk < min_fclk &&
 			    clock_table->DfPstateTable[j].Voltage <= clock_table->SocVoltage[i]) {
-- 
2.34.1

