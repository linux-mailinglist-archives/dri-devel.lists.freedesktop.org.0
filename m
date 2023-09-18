Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77397A45A9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9210E241;
	Mon, 18 Sep 2023 09:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8F210E237
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 826EBCE0A0B;
 Mon, 18 Sep 2023 09:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04474C433CA;
 Mon, 18 Sep 2023 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028426;
 bh=zodNnixLrbstuOswbxN+fWiJxkLR9+sM5/mxmqhTVXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EME/oURXieCa1sfLmE3YlZhm+wtm8PZ145+lR/Vy4z1husDiDrTjlljZKBKoyrIM4
 pb5Jaoy5cpgSEzauA4QbDzPKgCVphCQtCSgSh7dcvB+Myaasqc8e733J1T3wDLPHZo
 pjs0RdGGRSCAd4bH3we68nMwXkeheL2UGID2yvZ+maR5A9W4Z2rR0qABPwlY2kezSi
 LwkKykDsWqhd1PfLX9+jpq2+NdBT9hdGHP3V3S677lCyoQFTnE0I+AQ/3vv0hpCkXq
 Z8lmRRGNg0w5+ot/z0kFcJl6bWu8J9FlfL0TmWia1BM3imDBGJxhWBZnpsVoUlTnB0
 loAo9r5pJc8Pg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] accel/habanalabs: export dma-buf only if size/offset
 multiples of PAGE_SIZE
Date: Mon, 18 Sep 2023 12:13:20 +0300
Message-Id: <20230918091321.855943-13-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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

It is currently allowed for a user to export dma-buf with size and
offset that are not multiples of PAGE_SIZE.
The exported memory is mapped for the importer device, and there it will
be rounded to PAGE_SIZE, leading to actually exporting more than the
user intended to.
To make the user be aware of it, accept only size and offset which are
multiple of PAGE_SIZE.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 27ab176c55c1..b4a9ff692ebc 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1877,16 +1877,16 @@ static int export_dmabuf(struct hl_ctx *ctx,
 
 static int validate_export_params_common(struct hl_device *hdev, u64 device_addr, u64 size)
 {
-	if (!IS_ALIGNED(device_addr, PAGE_SIZE)) {
+	if (!PAGE_ALIGNED(device_addr)) {
 		dev_dbg(hdev->dev,
-			"exported device memory address 0x%llx should be aligned to 0x%lx\n",
+			"exported device memory address 0x%llx should be aligned to PAGE_SIZE 0x%lx\n",
 			device_addr, PAGE_SIZE);
 		return -EINVAL;
 	}
 
-	if (size < PAGE_SIZE) {
+	if (!size || !PAGE_ALIGNED(size)) {
 		dev_dbg(hdev->dev,
-			"exported device memory size %llu should be equal to or greater than %lu\n",
+			"exported device memory size %llu should be a multiple of PAGE_SIZE %lu\n",
 			size, PAGE_SIZE);
 		return -EINVAL;
 	}
@@ -1937,6 +1937,13 @@ static int validate_export_params(struct hl_device *hdev, u64 device_addr, u64 s
 	if (rc)
 		return rc;
 
+	if (!PAGE_ALIGNED(offset)) {
+		dev_dbg(hdev->dev,
+			"exported device memory offset %llu should be a multiple of PAGE_SIZE %lu\n",
+			offset, PAGE_SIZE);
+		return -EINVAL;
+	}
+
 	if ((offset + size) > phys_pg_pack->total_size) {
 		dev_dbg(hdev->dev, "offset %#llx and size %#llx exceed total map size %#llx\n",
 				offset, size, phys_pg_pack->total_size);
-- 
2.34.1

