Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1C3BBD44
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 15:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C489450;
	Mon,  5 Jul 2021 13:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484C589450;
 Mon,  5 Jul 2021 13:03:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B57D46144E;
 Mon,  5 Jul 2021 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625490212;
 bh=O9tVDHLp82fxI8fp4sMu7i3QoMxUxxqqvrdNLqZSB4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJb2d9bAZPcATE7ZkmAgKxPie7inq7+8E7R7lygyLai9dkK8trzjd0dyLEwICJ2qh
 ni6advReSuykJSlS9P1XylPPeV+FYHuFsunmaPicFSHF8y8qyT0/YWho83oOfO630f
 KejUpdsmj35ghZLZHA3U0J/zodkRBCpLtilpZxLKYUt3GvD8gIuq0MRqcSak5F6YxK
 ZPG/ZVWA+bQEzfDo0WXd8uIpKEvvTQ9fypDDkZwPOUhebEslDweEfELtQdr2goFKbN
 KM6PVxUAl7nBCyc7TTcGVhARPqE/idoN4xFLd4vGXOYa8Gr84Q6V1acrp6ZFxMsNH0
 Zd08u93kl0xAg==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH v4 1/2] habanalabs: define uAPI to export FD for DMA-BUF
Date: Mon,  5 Jul 2021 16:03:13 +0300
Message-Id: <20210705130314.11519-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705130314.11519-1-ogabbay@kernel.org>
References: <20210705130314.11519-1-ogabbay@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, daniel.vetter@ffwll.ch, sleybo@amazon.com,
 galpress@amazon.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, dledford@redhat.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Tomer Tayar <ttayar@habana.ai>, leonro@nvidia.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User process might want to share the device memory with another
driver/device, and to allow it to access it over PCIe (P2P).

To enable this, we utilize the dma-buf mechanism and add a dma-buf
exporter support, so the other driver can import the device memory and
access it.

The device memory is allocated using our existing allocation uAPI,
where the user will get a handle that represents the allocation.

The user will then need to call the new
uAPI (HL_MEM_OP_EXPORT_DMABUF_FD) and give the handle as a parameter.

The driver will return a FD that represents the DMA-BUF object that
was created to match that allocation.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Tomer Tayar <ttayar@habana.ai>
---
 include/uapi/misc/habanalabs.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/uapi/misc/habanalabs.h b/include/uapi/misc/habanalabs.h
index 18765eb75b65..c5cbd60696d7 100644
--- a/include/uapi/misc/habanalabs.h
+++ b/include/uapi/misc/habanalabs.h
@@ -808,6 +808,10 @@ union hl_wait_cs_args {
 #define HL_MEM_OP_UNMAP			3
 /* Opcode to map a hw block */
 #define HL_MEM_OP_MAP_BLOCK		4
+/* Opcode to create DMA-BUF object for an existing device memory allocation
+ * and to export an FD of that DMA-BUF back to the caller
+ */
+#define HL_MEM_OP_EXPORT_DMABUF_FD	5
 
 /* Memory flags */
 #define HL_MEM_CONTIGUOUS	0x1
@@ -879,11 +883,26 @@ struct hl_mem_in {
 			/* Virtual address returned from HL_MEM_OP_MAP */
 			__u64 device_virt_addr;
 		} unmap;
+
+		/* HL_MEM_OP_EXPORT_DMABUF_FD */
+		struct {
+			/* Handle returned from HL_MEM_OP_ALLOC. In Gaudi,
+			 * where we don't have MMU for the device memory, the
+			 * driver expects a physical address (instead of
+			 * a handle) in the device memory space.
+			 */
+			__u64 handle;
+			/* Size of memory allocation. Relevant only for GAUDI */
+			__u64 mem_size;
+		} export_dmabuf_fd;
 	};
 
 	/* HL_MEM_OP_* */
 	__u32 op;
-	/* HL_MEM_* flags */
+	/* HL_MEM_* flags.
+	 * For the HL_MEM_OP_EXPORT_DMABUF_FD opcode, this field holds the
+	 * DMA-BUF file/FD flags.
+	 */
 	__u32 flags;
 	/* Context ID - Currently not in use */
 	__u32 ctx_id;
@@ -920,6 +939,13 @@ struct hl_mem_out {
 
 			__u32 pad;
 		};
+
+		/* Returned in HL_MEM_OP_EXPORT_DMABUF_FD. Represents the
+		 * DMA-BUF object that was created to describe a memory
+		 * allocation on the device's memory space. The FD should be
+		 * passed to the importer driver
+		 */
+		__u64 fd;
 	};
 };
 
-- 
2.25.1

