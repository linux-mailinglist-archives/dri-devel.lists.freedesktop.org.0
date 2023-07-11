Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B1174EC6E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035010E379;
	Tue, 11 Jul 2023 11:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E1210E372
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 915A56142E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D243C433C9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073956;
 bh=MCArzWC6q+e9w3lwQdYeV+tlqHV0iwb092ut/gu8pVU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RPBakGMgPo3o+5meJk+uAoOQCfgixVJx4GDLBq4ifPHrDihRyFlpWZ1nSlTOONDM3
 sreqSL6wX+S7kFi+7TUVkHsllDmkKTDFnkiSYYqaug3WyCxNF5MHeplm5/v8QK1BiF
 lMCJYVqQ7SBHLMdUWXi1MpL90gmHo2gJ0kwepC37Yurt6IzuQRpT5400x4KPT8mWTD
 kdpq/XmKRybjdD0lFYJPfOBqodfrj2N3Lz/hJzKkPtCOf4WPluXvO43H8QJ6/t2zuP
 q8GjaLFVmliEk5pEGvocW3Z4VCU+Y5Kbo80XTswzMzm0bxbCx1qNuaekXBQ6NaeivU
 45I29/BzzVz0w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] accel/habanalabs/gaudi2: fix missing check of kernel ctx
Date: Tue, 11 Jul 2023 14:12:18 +0300
Message-Id: <20230711111226.163670-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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

If we are initializing the kernel context when we have a Gaudi2 device,
we don't need to do any late initializing of that context with
specific Gaudi2 code.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 0f9e9522233f..70b8f744cd73 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10650,6 +10650,9 @@ static int gaudi2_ctx_init(struct hl_ctx *ctx)
 {
 	int rc;
 
+	if (ctx->asid == HL_KERNEL_ASID_ID)
+		return 0;
+
 	rc = gaudi2_mmu_prepare(ctx->hdev, ctx->asid);
 	if (rc)
 		return rc;
-- 
2.34.1

