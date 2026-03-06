Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP4wCmauqmmLVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4621EE27
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF9310ECD0;
	Fri,  6 Mar 2026 10:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K8lMJDUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B28B10ECCF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772793441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJYSzg9vNyDy8YIRC70niUvoXuiagt/nl4vhegwZQ4I=;
 b=K8lMJDUjIHZF1N9eutVWSAPQq5ONAHU5HHhLlKfpsuHW6vi/MZgnMgir/taU6dOrpR2asY
 b9GzHHaOO7PM9h+D27pYNarr55Tu9xXTIqEGhUDC6IrrF3lZITQB/Gsvvwadq2nUL0td4u
 uvUaLf54ASvHBw5gr9cuXF1eE2D3AZQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-367-ylLWy7D1MiK14lBlXpaTbg-1; Fri,
 06 Mar 2026 05:37:15 -0500
X-MC-Unique: ylLWy7D1MiK14lBlXpaTbg-1
X-Mimecast-MFC-AGG-ID: ylLWy7D1MiK14lBlXpaTbg_1772793433
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D891E1800344; Fri,  6 Mar 2026 10:37:12 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.45.226.103])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 033FE1800576; Fri,  6 Mar 2026 10:37:05 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 06 Mar 2026 11:36:32 +0100
Subject: [PATCH v3 1/6] dma-buf: dma-heap: Keep track of the heap device struct
MIME-Version: 1.0
Message-Id: <20260306-b4-dmabuf-heap-coherent-rmem-v3-1-3d00d36c9bc4@redhat.com>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
In-Reply-To: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, mripard@redhat.com, echanude@redhat.com, 
 John Stultz <john.stultz@linaro.org>, Maxime Ripard <mripard@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772793417; l=3407;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=+cQjQX7wWYHly3CqYJA61GMkvrlvlEzfu2d2CAj6odw=;
 b=En+VXoYTUj9Wv8NJOCjiJ2RfNcXww6oL8TirckFIGLBYTejfT3hcTJrdgb6B6KgRDqrUo0tN9
 FelEna3sZ9ZD6c7cS4dja3evP5ZoiN/f//EuT4Ak6aRC+21Ljf0dHsJ
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: v5pfYh0hmWh6SwtlnPHgai64kBrpClRGg6D331Zk9II_1772793433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: A0D4621EE27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:aesteve@redhat.com,m:mripard@redhat.com,m:echanude@redhat.com,m:john.stultz@linaro.org,m:mripard@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: John Stultz <john.stultz@linaro.org>

Keep track of the heap device struct.

This will be useful for special DMA allocations
and actions.

Signed-off-by: John Stultz <john.stultz@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 34 ++++++++++++++++++++++++++--------
 include/linux/dma-heap.h   |  2 ++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a6494..1124d63eb1398 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -31,6 +31,7 @@
  * @heap_devt:		heap device node
  * @list:		list head connecting to list of heaps
  * @heap_cdev:		heap char device
+ * @heap_dev:		heap device
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +42,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct device *heap_dev;
 };
 
 static LIST_HEAD(heap_list);
@@ -223,6 +225,19 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 }
 EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
 
+/**
+ * dma_heap_get_dev() - get device struct for the heap
+ * @heap: DMA-Heap to retrieve device struct from
+ *
+ * Returns:
+ * The device struct for the heap.
+ */
+struct device *dma_heap_get_dev(struct dma_heap *heap)
+{
+	return heap->heap_dev;
+}
+EXPORT_SYMBOL_NS_GPL(dma_heap_get_dev, "DMA_BUF_HEAP");
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info: information needed to register this heap
@@ -230,7 +245,6 @@ EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
 
@@ -272,14 +286,14 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
+	heap->heap_dev = device_create(dma_heap_class,
+				       NULL,
+				       heap->heap_devt,
+				       NULL,
+				       heap->name);
+	if (IS_ERR(heap->heap_dev)) {
 		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
+		err_ret = ERR_CAST(heap->heap_dev);
 		goto err2;
 	}
 
@@ -295,6 +309,10 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		}
 	}
 
+	/* Make sure it doesn't disappear on us */
+	heap->heap_dev = get_device(heap->heap_dev);
+
+
 	/* Add heap to the list */
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 648328a64b27e..493085e69b70e 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 struct dma_heap;
+struct device;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
@@ -43,6 +44,7 @@ struct dma_heap_export_info {
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
 const char *dma_heap_get_name(struct dma_heap *heap);
+struct device *dma_heap_get_dev(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 

-- 
2.52.0

