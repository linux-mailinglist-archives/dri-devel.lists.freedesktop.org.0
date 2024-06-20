Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA32910400
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 14:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D510E96F;
	Thu, 20 Jun 2024 12:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="M26+S+ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196D10E95E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1718886469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ohuxApLNdhOX7LZ/v+Xu3NNVbPIJcpf85Dd0wZ/o3s=;
 b=M26+S+ZB7da4Tf54WshO20DXN4NdDv+ZKNPYgCJbP05fpECQBaQS+sxffHumo5a5Xd9qMC
 G9142wxy8t61XicEf4R3sQHKLHGiLjHDjMniZjQLfiiAlQ1OUy5Uf6ay2EA46BBPV8ZUXi
 zzC1qP6ig5jK22F+tbIrOI4l/Si+H8I=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v12 7/7] Documentation: dmaengine: Document new dma_vec API
Date: Thu, 20 Jun 2024 14:27:26 +0200
Message-ID: <20240620122726.41232-8-paul@crapouillou.net>
In-Reply-To: <20240620122726.41232-1-paul@crapouillou.net>
References: <20240620122726.41232-1-paul@crapouillou.net>
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

Document the dmaengine_prep_peripheral_dma_vec() API function, the
device_prep_peripheral_dma_vec() backend function, and the dma_vec
struct.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

---
v11: New patch
---
 Documentation/driver-api/dmaengine/client.rst   |  9 +++++++++
 Documentation/driver-api/dmaengine/provider.rst | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/client.rst b/Documentation/driver-api/dmaengine/client.rst
index ecf139f73da4..d491e385d61a 100644
--- a/Documentation/driver-api/dmaengine/client.rst
+++ b/Documentation/driver-api/dmaengine/client.rst
@@ -80,6 +80,10 @@ The details of these operations are:
 
   - slave_sg: DMA a list of scatter gather buffers from/to a peripheral
 
+  - peripheral_dma_vec: DMA an array of scatter gather buffers from/to a
+    peripheral. Similar to slave_sg, but uses an array of dma_vec
+    structures instead of a scatterlist.
+
   - dma_cyclic: Perform a cyclic DMA operation from/to a peripheral till the
     operation is explicitly stopped.
 
@@ -102,6 +106,11 @@ The details of these operations are:
 		unsigned int sg_len, enum dma_data_direction direction,
 		unsigned long flags);
 
+     struct dma_async_tx_descriptor *dmaengine_prep_peripheral_dma_vec(
+		struct dma_chan *chan, const struct dma_vec *vecs,
+		size_t nents, enum dma_data_direction direction,
+		unsigned long flags);
+
      struct dma_async_tx_descriptor *dmaengine_prep_dma_cyclic(
 		struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
 		size_t period_len, enum dma_data_direction direction);
diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index ceac2a300e32..3085f8b460fa 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -433,6 +433,12 @@ supported.
     - residue: Provides the residue bytes of the transfer for those that
       support residue.
 
+- ``device_prep_peripheral_dma_vec``
+
+  - Similar to ``device_prep_slave_sg``, but it takes a pointer to a
+    array of ``dma_vec`` structures, which (in the long run) will replace
+    scatterlists.
+
 - ``device_issue_pending``
 
   - Takes the first transaction descriptor in the pending queue,
@@ -544,6 +550,10 @@ dma_cookie_t
 - Not really relevant any more since the introduction of ``virt-dma``
   that abstracts it away.
 
+dma_vec
+
+- A small structure that contains a DMA address and length.
+
 DMA_CTRL_ACK
 
 - If clear, the descriptor cannot be reused by provider until the
-- 
2.43.0

