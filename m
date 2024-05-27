Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F78CFFA4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A72410E94D;
	Mon, 27 May 2024 12:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="pE2znx8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61110F4E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:13:07 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716811993; bh=3gGM8Mlv1pxxuRoIYA9WhbGp72S3CJF4GKc75niPLk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pE2znx8ngj+qRv7DjNTNbVO635BiKxt1o7ArbCDzGHCDGWomD4xgFuJiBOQ3mypjH
 Naz3Xuw/85QSrSvjLDbbbL85IzoirLfKuc7jUTuVfumrwAOeA34whgcHPWG1o4wpSu
 vQpYZyVhQ3P7Swpy8K4lyQidDMxtOlg50qyz0VmmK31xJ0izkvtAYwkQ+zSi2N/NlM
 TIGRZQUVebU90VUISGN3RUQXuZdodFwZC6GkC7jXMMg35GKp2EDMQf2wBcZnqwrc3q
 HeBzswYyAyHAMFouA12JR1q/FgZpCUdlhQaBXYHnWefYi6qVX/5eOdSHqTxCqUwdSF
 GbXsMGtiiuc0Q==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RCCuau1921351; Mon, 27 May 2024 15:12:57 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 4/8] accel/habanalabs/gaudi2: revise return value handling in
 gaudi2_hbm_sei_handle_read_err()
Date: Mon, 27 May 2024 15:12:50 +0300
Message-Id: <20240527121254.1921306-4-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527121254.1921306-1-obitton@habana.ai>
References: <20240527121254.1921306-1-obitton@habana.ai>
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

From: Tomer Tayar <ttayar@habana.ai>

The return value in gaudi2_hbm_sei_handle_read_err() is boolean and not
a bitmask, so there is need for "|= true".
In addition, rename the 'rc' variable, as no "return code" is returned
here but an indication if a hard reset is required.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 08276f03c80f..18cc7b773650 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9263,8 +9263,8 @@ static int gaudi2_handle_mmu_spi_sei_err(struct hl_device *hdev, u16 event_type,
 static bool gaudi2_hbm_sei_handle_read_err(struct hl_device *hdev,
 			struct hl_eq_hbm_sei_read_err_intr_info *rd_err_data, u32 err_cnt)
 {
+	bool require_hard_reset = false;
 	u32 addr, beat, beat_shift;
-	bool rc = false;
 
 	dev_err_ratelimited(hdev->dev,
 			"READ ERROR count: ECC SERR: %d, ECC DERR: %d, RD_PARITY: %d\n",
@@ -9296,7 +9296,7 @@ static bool gaudi2_hbm_sei_handle_read_err(struct hl_device *hdev,
 						beat,
 						le32_to_cpu(rd_err_data->dbg_rd_err_dm),
 						le32_to_cpu(rd_err_data->dbg_rd_err_syndrome));
-			rc |= true;
+			require_hard_reset = true;
 		}
 
 		beat_shift = beat * HBM_RD_ERR_BEAT_SHIFT;
@@ -9309,7 +9309,7 @@ static bool gaudi2_hbm_sei_handle_read_err(struct hl_device *hdev,
 					(le32_to_cpu(rd_err_data->dbg_rd_err_misc) &
 						(HBM_RD_ERR_PAR_DATA_BEAT0_MASK << beat_shift)) >>
 						(HBM_RD_ERR_PAR_DATA_BEAT0_SHIFT + beat_shift));
-			rc |= true;
+			require_hard_reset = true;
 		}
 
 		dev_err_ratelimited(hdev->dev, "Beat%d DQ data:\n", beat);
@@ -9319,7 +9319,7 @@ static bool gaudi2_hbm_sei_handle_read_err(struct hl_device *hdev,
 					le32_to_cpu(rd_err_data->dbg_rd_err_data[beat * 2 + 1]));
 	}
 
-	return rc;
+	return require_hard_reset;
 }
 
 static void gaudi2_hbm_sei_print_wr_par_info(struct hl_device *hdev,
-- 
2.34.1

