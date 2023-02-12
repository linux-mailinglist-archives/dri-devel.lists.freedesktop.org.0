Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083A6939EF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9550F10E475;
	Sun, 12 Feb 2023 20:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353D10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBE06B80B1A;
 Sun, 12 Feb 2023 20:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DECC433D2;
 Sun, 12 Feb 2023 20:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234722;
 bh=ZKBBLr3Wy/YtNE/mCqY14bOUShTjcsBvjGSs8nib3q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lvp+9UYEYrCXCLJiwDrNkAj6Jh31yNbhXH+mnQxfCfqDBsiLcuTpvoT5gQsQEuA7V
 Pn1a7Gv08dRshQgmzntythujWGmQ2g+Njz0t5CaeWQzzoJ5r9LM8SLl/nP0dqDyRGk
 XIEhIChqngM/bWGku+sVEH0f4e/j1GU2iPCh1RIACDOw1s1KtPRy1H7kY1jG32hUcm
 YHOi4VdNzgy7svt70aexg3PP3OxfXuqkn4uFJH4+54OM7oMzi2CGwy8AmljREzU2ui
 cujYdjuhXCRM3UXrKuaA6lVfRf9yM2UgeLEpjtvcuWk1wKQUdigBAPC/74PmOxjxJm
 BflLUL+eXp9WQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/27] habanalabs/gaudi2: unsecure CFG_TPC_ID register
Date: Sun, 12 Feb 2023 22:44:39 +0200
Message-Id: <20230212204454.2938561-12-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Required to allow the TPC compiler to know on which offset of the index
space it works on.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index a212f82e6604..694735f9e6e6 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -1595,6 +1595,7 @@ static const u32 gaudi2_pb_dcr0_tpc0_unsecured_regs[] = {
 	mmDCORE0_TPC0_CFG_KERNEL_SRF_30,
 	mmDCORE0_TPC0_CFG_KERNEL_SRF_31,
 	mmDCORE0_TPC0_CFG_TPC_SB_L0CD,
+	mmDCORE0_TPC0_CFG_TPC_ID,
 	mmDCORE0_TPC0_CFG_QM_KERNEL_ID_INC,
 	mmDCORE0_TPC0_CFG_QM_TID_BASE_SIZE_HIGH_DIM_0,
 	mmDCORE0_TPC0_CFG_QM_TID_BASE_SIZE_HIGH_DIM_1,
-- 
2.25.1

