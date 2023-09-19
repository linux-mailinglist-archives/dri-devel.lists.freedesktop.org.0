Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7467A5FC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED610E26B;
	Tue, 19 Sep 2023 10:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A3610E386
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:37:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61900B80303;
 Tue, 19 Sep 2023 10:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E248C433C7;
 Tue, 19 Sep 2023 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695119874;
 bh=iLY8jDKtSVAY6opAQk2w67hTUaRy54MGzl5xyB9e4qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AslT3HTDZ5tKSBCPcqRK+lcPXB/M1Ph1kjgwHd+IcA3LVMVQfmEbPgA3PcgQMC0Tk
 uCINC8VDjlcu4uIbsobH/Ou9sERaeL3jVKhi9qS4waZZyGmhaeQe1WX/xsOixM3/cQ
 wLVhdvSluGl0jBGMJndOf13p+//hKVCW3ZwC2tXtJO5Xn1ibG4OlIoRP7egJDrFXUZ
 c6ae8SgR+30Td8DKgjrvvOrT3Q/hvSAdKivBoQyQrXyDDYYMYx2D1H6a155oP7T6jY
 JMFaRJfoAQmqsRgGLQzrVkJqkDOLRwPc8NNU1CSuBFEdcqyz6zbnD7yN8JV/ukgJaR
 rcDWFRrg/TGgg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/habanalabs: add traces for dma mappings
Date: Tue, 19 Sep 2023 13:37:46 +0300
Message-Id: <20230919103747.955418-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919103747.955418-1-ogabbay@kernel.org>
References: <20230919103747.955418-1-ogabbay@kernel.org>
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ohad Sharabi <osharabi@habana.ai>

In order to get a full picture of DMA mappings (e.g. to track DMAR
errors), DMA mappings APIs should be covered.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/trace/events/habanalabs.h | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/trace/events/habanalabs.h b/include/trace/events/habanalabs.h
index 951643e6a7a9..0d3667399d01 100644
--- a/include/trace/events/habanalabs.h
+++ b/include/trace/events/habanalabs.h
@@ -87,6 +87,49 @@ DEFINE_EVENT(habanalabs_dma_alloc_template, habanalabs_dma_free,
 	TP_PROTO(struct device *dev, u64 cpu_addr, u64 dma_addr, size_t size, const char *caller),
 	TP_ARGS(dev, cpu_addr, dma_addr, size, caller));
 
+DECLARE_EVENT_CLASS(habanalabs_dma_map_template,
+	TP_PROTO(struct device *dev, u64 phys_addr, u64 dma_addr, size_t len,
+			enum dma_data_direction dir, const char *caller),
+
+	TP_ARGS(dev, phys_addr, dma_addr, len, dir, caller),
+
+	TP_STRUCT__entry(
+		__string(dname, dev_name(dev))
+		__field(u64, phys_addr)
+		__field(u64, dma_addr)
+		__field(u32, len)
+		__field(int, dir)
+		__field(const char *, caller)
+	),
+
+	TP_fast_assign(
+		__assign_str(dname, dev_name(dev));
+		__entry->phys_addr = phys_addr;
+		__entry->dma_addr = dma_addr;
+		__entry->len = len;
+		__entry->dir = dir;
+		__entry->caller = caller;
+	),
+
+	TP_printk("%s: phys_addr: %#llx, dma_addr: %#llx, len: %#x, dir: %d, caller: %s",
+		__get_str(dname),
+		__entry->phys_addr,
+		__entry->dma_addr,
+		__entry->len,
+		__entry->dir,
+		__entry->caller)
+);
+
+DEFINE_EVENT(habanalabs_dma_map_template, habanalabs_dma_map_page,
+	TP_PROTO(struct device *dev, u64 phys_addr, u64 dma_addr, size_t len,
+			enum dma_data_direction dir, const char *caller),
+	TP_ARGS(dev, phys_addr, dma_addr, len, dir, caller));
+
+DEFINE_EVENT(habanalabs_dma_map_template, habanalabs_dma_unmap_page,
+	TP_PROTO(struct device *dev, u64 phys_addr, u64 dma_addr, size_t len,
+			enum dma_data_direction dir, const char *caller),
+	TP_ARGS(dev, phys_addr, dma_addr, len, dir, caller));
+
 DECLARE_EVENT_CLASS(habanalabs_comms_template,
 	TP_PROTO(struct device *dev, char *op_str),
 
-- 
2.34.1

