Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD709394D4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 22:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4299810E101;
	Mon, 22 Jul 2024 20:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="G2eUgTA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD9010E192
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 20:39:56 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id Vzp2s6XwcnYGvVzp2seJB9; Mon, 22 Jul 2024 22:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1721680794;
 bh=J/KaIQ3vNxlLzX+SbS5+57XkROzSYNQ6vt9900sOyo0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=G2eUgTA3WxuLd5kQtzxl0rzlOfVsqMOEQh2T2TU0J4FAsn+YMHE2N3mlfUAhCL72S
 Bs6pk9ROzulbiRQ36yfhTmhznSqAQ5mstrpPCWLD/6OWWRUChHZZvWtDsvI6WIpXed
 JZgS/YWbKuiFkpj+Y028o4N/XKmY5I65WfuGVPwfB/WeU7fb9xTc33BuegeXQD8Efk
 n+8xp6aPMWAKHzD54nTJixGhOhtQtLKJCqDot9AVNJP/kFpFrcCRyNsiF5z/vEDD02
 yylVh/Pn5FTcqJ2tD68PFgLDmB3eU/kRWPFRKkUavgfopC+6MSy7V8i+lXLx4nqmwP
 g2QHEv7q/E65Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 Jul 2024 22:39:54 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ofir Bitton <obitton@habana.ai>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/habanalabs/gaudi2: Constify several structures
Date: Mon, 22 Jul 2024 22:39:48 +0200
Message-ID: <62ac505b660f433745f98de5ee468671e5c63a0b.1721680761.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
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

These structures are not modified in this driver.

Constifying this structure moves about 8 ko of data to a read-only section,
so increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
 191214	 134180	    456	 325850	  4f8da	drivers/accel/habanalabs/gaudi2/gaudi2.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
 198862	 126532	    456	 325850	  4f8da	drivers/accel/habanalabs/gaudi2/gaudi2.o


Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

A much bigger step, would be to constify gaudi2_irq_map_table.
But drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
states that this is a generated file. So I just report it here, could
someone modify the software that generates this file.

This would constify an additional 110 ko of data. Not too bad, for just 5
more letters!

   text	   data	    bss	    dec	    hex	filename
 310314	  14884	    456	 325654	  4f816	drivers/accel/habanalabs/gaudi2/gaudi2.o
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..40aebae29ab1 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -173,7 +173,7 @@ struct gaudi2_razwi_info {
 	char *eng_name;
 };
 
-static struct gaudi2_razwi_info common_razwi_info[] = {
+static const struct gaudi2_razwi_info common_razwi_info[] = {
 		{RAZWI_INITIATOR_ID_X_Y(2, 4, 0), mmDCORE0_RTR0_CTRL_BASE,
 				GAUDI2_DCORE0_ENGINE_ID_DEC_0, "DEC0"},
 		{RAZWI_INITIATOR_ID_X_Y(2, 4, 4), mmDCORE0_RTR0_CTRL_BASE,
@@ -338,7 +338,7 @@ static struct gaudi2_razwi_info common_razwi_info[] = {
 				GAUDI2_ENGINE_ID_PSOC, "PSOC"}
 };
 
-static struct gaudi2_razwi_info mme_razwi_info[] = {
+static const struct gaudi2_razwi_info mme_razwi_info[] = {
 		/* MME X high coordinate is N/A, hence using only low coordinates */
 		{RAZWI_INITIATOR_ID_X_Y_LOW(7, 4), mmDCORE0_RTR5_CTRL_BASE,
 				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_WAP0"},
@@ -2108,7 +2108,7 @@ struct hbm_mc_error_causes {
 	char cause[50];
 };
 
-static struct hl_special_block_info gaudi2_special_blocks[] = GAUDI2_SPECIAL_BLOCKS;
+static const struct hl_special_block_info gaudi2_special_blocks[] = GAUDI2_SPECIAL_BLOCKS;
 
 /* Special blocks iterator is currently used to configure security protection bits,
  * and read global errors. Most HW blocks are addressable and those who aren't (N/A)-
@@ -2116,14 +2116,14 @@ static struct hl_special_block_info gaudi2_special_blocks[] = GAUDI2_SPECIAL_BLO
  * and global error reading, since currently they both share the same settings.
  * Once it changes, we must remember to use separate configurations for either one.
  */
-static int gaudi2_iterator_skip_block_types[] = {
+static const int gaudi2_iterator_skip_block_types[] = {
 		GAUDI2_BLOCK_TYPE_PLL,
 		GAUDI2_BLOCK_TYPE_EU_BIST,
 		GAUDI2_BLOCK_TYPE_HBM,
 		GAUDI2_BLOCK_TYPE_XFT
 };
 
-static struct range gaudi2_iterator_skip_block_ranges[] = {
+static const struct range gaudi2_iterator_skip_block_ranges[] = {
 		/* Skip all PSOC blocks except for PSOC_GLOBAL_CONF */
 		{mmPSOC_I2C_M0_BASE, mmPSOC_EFUSE_BASE},
 		{mmPSOC_BTL_BASE, mmPSOC_MSTR_IF_RR_SHRD_HBW_BASE},
@@ -2132,7 +2132,7 @@ static struct range gaudi2_iterator_skip_block_ranges[] = {
 		{mmCPU_TIMESTAMP_BASE, mmCPU_MSTR_IF_RR_SHRD_HBW_BASE}
 };
 
-static struct hbm_mc_error_causes hbm_mc_spi[GAUDI2_NUM_OF_HBM_MC_SPI_CAUSE] = {
+static const struct hbm_mc_error_causes hbm_mc_spi[GAUDI2_NUM_OF_HBM_MC_SPI_CAUSE] = {
 	{HBM_MC_SPI_TEMP_PIN_CHG_MASK, "temperature pins changed"},
 	{HBM_MC_SPI_THR_ENG_MASK, "temperature-based throttling engaged"},
 	{HBM_MC_SPI_THR_DIS_ENG_MASK, "temperature-based throttling disengaged"},
@@ -8300,9 +8300,9 @@ static void gaudi2_check_if_razwi_happened(struct hl_device *hdev)
 		gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_ROT, mod_idx, 0, NULL);
 }
 
-static int gaudi2_psoc_razwi_get_engines(struct gaudi2_razwi_info *razwi_info, u32 array_size,
-						u32 axuser_xy, u32 *base, u16 *eng_id,
-						char *eng_name)
+static int gaudi2_psoc_razwi_get_engines(const struct gaudi2_razwi_info *razwi_info,
+					 u32 array_size, u32 axuser_xy,
+					 u32 *base, u16 *eng_id, char *eng_name)
 {
 
 	int i, num_of_eng = 0;
-- 
2.45.2

