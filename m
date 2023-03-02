Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CAF6A7D68
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 10:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607DD10E404;
	Thu,  2 Mar 2023 09:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5B10E27A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 09:15:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D81461568;
 Thu,  2 Mar 2023 09:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E1CC433D2;
 Thu,  2 Mar 2023 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677748524;
 bh=gKXRRZo3rM85yrJg3E5iNmr0TjlM2wrhtv8MC2eaS8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gwtIeY/p6POIZ5z0h0tnSFp4V+JIWnqGZLwmIE6hHomIsmzZDDgEMVhanaEPKqZQU
 sQSoJZ30sOPlC2mR9+yRqjhqFsYD+GIeKgEY5zQjdt8tpzcAwjC81q0ZtEdCQ8f1DE
 KgIbwZAyu44/CqAaO7l6j18ugsrf+x/1BHdWCAVHPdQ75wRKaDhScDmNQQtWbYuk3/
 N/+m7ZxBgN5csd3EBTB+nEtxpVwQJQ6loF38ZiT3gCb+nEDprU5AQDaZAu9pljg9u1
 GNm2e2tgSu3ERbi0M0388g0xnInhUywMaCY+HtgduyZb0ipSykAjrJobeuoYzfrWpq
 u8yWlOSnlCy2A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] habanalabs: use scnprintf() in print_device_in_use_info()
Date: Thu,  2 Mar 2023 11:15:17 +0200
Message-Id: <20230302091517.14896-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302091517.14896-1-ogabbay@kernel.org>
References: <20230302091517.14896-1-ogabbay@kernel.org>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

compose_device_in_use_info() was added to handle the snprintf() return
value in a single place.
However, the buffer size in print_device_in_use_info() is set such that
it would be enough for the max possible print, so
compose_device_in_use_info() is not really needed.
Moreover, scnprintf() can be used instead of snprintf(), to save the
check if the return value larger than the given size.

Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 36 +++++++-----------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 99e793dfb126..8db00cb3b71d 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -482,48 +482,32 @@ int hl_hpriv_put(struct hl_fpriv *hpriv)
 	return kref_put(&hpriv->refcount, hpriv_release);
 }
 
-static void compose_device_in_use_info(char **buf, size_t *buf_size, const char *fmt, ...)
-{
-	struct va_format vaf;
-	va_list args;
-	int size;
-
-	va_start(args, fmt);
-	vaf.fmt = fmt;
-	vaf.va = &args;
-
-	size = snprintf(*buf, *buf_size, "%pV", &vaf);
-	if (size >= *buf_size)
-		size = *buf_size;
-
-	*buf += size;
-	*buf_size -= size;
-
-	va_end(args);
-}
-
 static void print_device_in_use_info(struct hl_device *hdev, const char *message)
 {
 	u32 active_cs_num, dmabuf_export_cnt;
-	char buf[64], *buf_ptr = buf;
-	size_t buf_size = sizeof(buf);
 	bool unknown_reason = true;
+	char buf[128];
+	size_t size;
+	int offset;
+
+	size = sizeof(buf);
+	offset = 0;
 
 	active_cs_num = hl_get_active_cs_num(hdev);
 	if (active_cs_num) {
 		unknown_reason = false;
-		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u active CS]", active_cs_num);
+		offset += scnprintf(buf + offset, size - offset, " [%u active CS]", active_cs_num);
 	}
 
 	dmabuf_export_cnt = atomic_read(&hdev->dmabuf_export_cnt);
 	if (dmabuf_export_cnt) {
 		unknown_reason = false;
-		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u exported dma-buf]",
-						dmabuf_export_cnt);
+		offset += scnprintf(buf + offset, size - offset, " [%u exported dma-buf]",
+					dmabuf_export_cnt);
 	}
 
 	if (unknown_reason)
-		compose_device_in_use_info(&buf_ptr, &buf_size, " [unknown reason]");
+		scnprintf(buf + offset, size - offset, " [unknown reason]");
 
 	dev_notice(hdev->dev, "%s%s\n", message, buf);
 }
-- 
2.39.2

