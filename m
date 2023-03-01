Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88646A6C67
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 13:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D152E10E0BB;
	Wed,  1 Mar 2023 12:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BC110E0C5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 12:34:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34FAE612F2;
 Wed,  1 Mar 2023 12:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF688C433D2;
 Wed,  1 Mar 2023 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677674097;
 bh=+OvyeyOpSaypmJBrkckiME2npXVwah1aX9rQEhp0WrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WLdyNtZvVPUkkzq9WXgGaLM3r4EkAkFJ27ZKdIv8HnF4GqrZRsDpq5CfMY97e+fGK
 OszglMc5XA5tQXqcSO3wOghprAu0gsSgcvUjC+iPRdBvEWzlIWn9OGjC6F3sXvRL9Q
 QgctzprkZKKVTcN0Tgh62Y2GGnNANn8Z7urWh7uGXlhPbGzZUvJ7LmIoHEo7BxkPQW
 tokdKz1WAgdloVh1J8xQQC9w4qoKmeBO23fg7zk6dBWVY80mJhEBjMHMjatbqd+gU4
 ReS9jnXEcJKIVJotCFOh0sDWr14fXr3TReK8Uziwm+yzybw1pieaCwLNmRsLgGD5PR
 ZtEwFY4nNV/wA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] habanalabs/gaudi2: remove a useless is_idle TPC flag
Date: Wed,  1 Mar 2023 14:34:47 +0200
Message-Id: <20230301123450.4127848-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301123450.4127848-1-ogabbay@kernel.org>
References: <20230301123450.4127848-1-ogabbay@kernel.org>
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

Is appears that the flag -
DCORE0_TPC0_CFG_STATUS_VECTOR_PIPE_EMPTY_MASK, has no actual use when
it comes to querying TPC idleness, since this flag's corresponding bit
turns-off after stalling the engine, and turns back on after resuming
it.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_masks.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
index e9ac87828221..74bc1daaeeda 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
@@ -79,7 +79,6 @@
 			DCORE0_MME_CTRL_LO_ARCH_STATUS_QM_RDY_MASK)
 
 #define TPC_IDLE_MASK	(DCORE0_TPC0_CFG_STATUS_SCALAR_PIPE_EMPTY_MASK | \
-			DCORE0_TPC0_CFG_STATUS_VECTOR_PIPE_EMPTY_MASK | \
 			DCORE0_TPC0_CFG_STATUS_IQ_EMPTY_MASK | \
 			DCORE0_TPC0_CFG_STATUS_SB_EMPTY_MASK | \
 			DCORE0_TPC0_CFG_STATUS_QM_IDLE_MASK | \
-- 
2.39.2

