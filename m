Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EE8CFFA3
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9892E10FA1D;
	Mon, 27 May 2024 12:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="OjZ20Tx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D410E94D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:13:06 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716811982; bh=Gweql/mYSZp0D9OIhCBaIAviu0sxLWqrmSCFgLSuNRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjZ20Tx90j0hd7nl5hmcrPTat70TO6SQ6WRyUe6FE8V4QbtQ+zPbYRUKkPQw65Csi
 gcg4qB6ZAwSrP/Alh64/jfqXDyJ4yfvQCjOANI1r+71rAjaIObEutwwHBg19qTFK3n
 lyTknEjr8h+j0afti7ZrFFKNszw2z4NqwuMfzDQReNNIV19Imtzqia0coAB3NLcwtN
 y7yCqrz1taeQw+GTKOlalQUWmJmtILAHnSL+2h4DdgnGO8YkewnACP6PaUHRJC+ZQw
 KbNAuuX17u6nH66jXOSPT10sKHs7yZoKLBUcYJ0vIbxZXdQ6B+c/MAxGG7QxyYhfD5
 YIGxQVkExws8A==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RCCuav1921351; Mon, 27 May 2024 15:12:57 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 5/8] accel/habanalabs/gaudi2: assume hard-reset by FW upon MC
 SEI severe error
Date: Mon, 27 May 2024 15:12:51 +0300
Message-Id: <20240527121254.1921306-5-obitton@habana.ai>
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

FW initiates a hard reset upon an MC SEI severe error.
Align the driver to expect this reset and avoid accessing the device
until the reset is done.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 18cc7b773650..4791582d157c 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10004,6 +10004,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		if (gaudi2_handle_hbm_mc_sei_err(hdev, event_type, &eq_entry->sei_data)) {
 			reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 			reset_required = true;
+			is_critical = eq_entry->sei_data.hdr.is_critical;
 		}
 		error_count++;
 		break;
@@ -10235,8 +10236,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		gaudi2_print_event(hdev, event_type, true,
 				"No error cause for H/W event %u", event_type);
 
-	if ((gaudi2_irq_map_table[event_type].reset != EVENT_RESET_TYPE_NONE) ||
-				reset_required) {
+	if ((gaudi2_irq_map_table[event_type].reset != EVENT_RESET_TYPE_NONE) || reset_required) {
 		if (reset_required ||
 				(gaudi2_irq_map_table[event_type].reset == EVENT_RESET_TYPE_HARD))
 			reset_flags |= HL_DRV_RESET_HARD;
-- 
2.34.1

