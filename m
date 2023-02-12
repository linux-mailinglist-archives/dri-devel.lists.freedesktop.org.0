Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BB6939EA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50F810E473;
	Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AC110E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7905AB80D8E;
 Sun, 12 Feb 2023 20:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33808C4339C;
 Sun, 12 Feb 2023 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234718;
 bh=RMMcoM+nbFNJQrOc/0LDUPskPaWu77+k7C3H960LbcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tY39Y9KTCs5Pmb8gq1AGehl1mLqT7QRyJTuNtVCO/lVj4oDtmgPCKo9v8muUtGqLP
 wX26GWK8P7AmJnNHXS7BI0PX2+BW6hNVJ1Hs08sjDCLVr52b2qqubYod1AdQTsgrVA
 TrYtjY0MVTC/5ES77K/DkTLfaoJOHY1oG8TdP6HCxIS5N5vnKrzeHrnK5Tc62YrVKY
 DrcfeOGdp3i+K0sCEp9eii3dj0D/tINuzF8I3y+UXIcl2TS2LaNwF6waLXTExR3dWw
 AVkabJyPzq6Qe4AaA+Dkkykisfz/JO5q6Cq++edMf6b/Uo8h8/cuTMT95a55gjoFM0
 SJg3Dg4+0oKaw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/27] habanalabs: enforce release order of compute device and
 dma-buf
Date: Sun, 12 Feb 2023 22:44:36 +0200
Message-Id: <20230212204454.2938561-9-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

When user closes the compute device file descriptor without closing a
dma-buf file descriptor, the device will be considered as in use,
leading to hard reset and killing the user process, to ensure the
release of the dma-buf.
Same thing will happen if user first releases the compute device file
and only then the dma-buf.

The implication of this is the duration of hard reset, during which the
device cannot be reacquired.
Moreover, this behavior adds a constraint on a user process to follow
this order of release operations.

To avoid killing the user process and to remove this constraint, enforce
the correct order of release operations inside the driver, by
incrementing the device file refcount for any dma-buf until it is
released.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index e115d264b03b..1d318d7240b7 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1835,6 +1835,10 @@ static void hl_release_dmabuf(struct dma_buf *dmabuf)
 
 	atomic_dec(&ctx->hdev->dmabuf_export_cnt);
 	hl_ctx_put(ctx);
+
+	/* Paired with get_file() in export_dmabuf() */
+	fput(ctx->hpriv->filp);
+
 	kfree(hl_dmabuf);
 }
 
@@ -1875,6 +1879,12 @@ static int export_dmabuf(struct hl_ctx *ctx,
 	hl_ctx_get(hl_dmabuf->ctx);
 	atomic_inc(&ctx->hdev->dmabuf_export_cnt);
 
+	/* Get compute device file to enforce release order, such that all exported dma-buf will be
+	 * released first and only then the compute device.
+	 * Paired with fput() in hl_release_dmabuf().
+	 */
+	get_file(ctx->hpriv->filp);
+
 	*dmabuf_fd = fd;
 
 	return 0;
-- 
2.25.1

