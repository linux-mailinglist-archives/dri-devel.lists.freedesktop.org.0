Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42026A78A2F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CE710E714;
	Wed,  2 Apr 2025 08:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XFvvJBsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1BA10E6F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:40:19 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324bVwj028575;
 Wed, 2 Apr 2025 09:40:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=O57YHWLCnRGXRM6fEMbfwha
 VjzaPSF81Go1oQmFvziA=; b=XFvvJBslzyoKDvsUw+iJNUYon+36AUdGOQ9atyY
 171SHXaPeonBDagyhbKMRSlgcYwrlQWZZzhv+o9fOW39+vJlepFR41YTGwGIEcVP
 jfkKTfQOQ8d2amEAwa0C7/AoGn78x3aDHF1Yf02YObMq7Yxs+l0DCXyzxOPbHzA2
 5tV/YLCC9EQ9N7QcM18RuV1diq/t19bvf6yb6vUjWPthf+xZsg8PJ3h1zIfdBsMY
 XcaxkjyElwORMBJwMwuXvF1ffScpmMkjiEpi3lMDLnD7ykSzp9Bo6YNLHzGOVlXf
 hjVx0rTLQ+vFy1XN4J3/+xQPxTTWfHYgo07HXbg5bSdbdkw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45rtcm86rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Apr 2025 09:40:08 +0100 (BST)
Received: from [127.0.1.1] (10.100.108.37) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 2 Apr
 2025 09:40:06 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 2 Apr 2025 09:40:05 +0100
Subject: [PATCH v2] drm/imagination: loop counters moved to loop scope
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAOT37GcC/4WNQQ6CMBBFr0K6dkyntWlw5T0MC6gDTCIMaZFoS
 O9u5QIu30v++7tKFJmSula7irRxYpkLmFOlwtjOAwE/CiujjdMXjdBLhKfIAkFe80oRUpCFANF
 Zb21tarSqjJdIPb+P8L0pPHJaJX6Onw1/9m9yQ0BwXeud97ojZ248DSuFc5BJNTnnL1boYhu9A
 AAA
X-Change-ID: 20250401-for-loop-counter-scope-115373392913
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18532;
 i=alexandru.dadu@imgtec.com; h=from:subject:message-id;
 bh=8dRo5yhmLPUc+TgSRL8jxqdLzy4Ivz7VTPz6GPbYDZU=;
 b=owEB7QES/pANAwAKARW10uOFNYqiAcsmYgBn7PfmvGChKglgYHJwXUpXXAVuvDV9JN1Fes9Mr
 /+WTDN2SuiJAbMEAAEKAB0WIQS9+pJTOgt5GeXoStwVtdLjhTWKogUCZ+z35gAKCRAVtdLjhTWK
 olG3DACP7wItNxpevC9uKAaRn4IrryHrxjF+5YKK1GCyTbzUg98V83WZzIFHeNiw220hg6nTAlr
 hzcUuMM74NAG5QPIIsC4ifEwFuGF/+QS2TK9d+RgBXHCsOWun1LY1sgrPyymh+cV8eBgBWnRd8p
 37qz6SvxbP/e7D61ahTufRDkLD7JNfkL5un4dty7eoPUH2upTcBL8TjwbxEqbZwr+KXPaeAzrL3
 VfpT1/PwXnGn+IS7b5gmzsHopYy/6rz50muloZ7FBaB6k2VesdLFCcdOwUpfIigMYJaUFNROan8
 Aagpbt0gUjqMLe8hCaDSjjZ0Y0ZIdn5BACWyKe3ne7hFB5Rh8LEY59fm0KhlqAnd63mTUlk56SR
 ejz5CXHy6hksySuEc+BK+jF3F6OAAAj3KTfXOBjdCgvzRFFkXgMz09xisTab1kC3vZ4Uf3ItMRZ
 BOv3VrnNSO3TufIKG7WivSxXE6QeldIuVRliJSvj89LEWKdeUxMrNatOrAjezNhztnwYo=
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=openpgp;
 fpr=BDFA92533A0B7919E5E84ADC15B5D2E385358AA2
X-Originating-IP: [10.100.108.37]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Lqt9hFRxGtN6crA57rOOfxJb0YOkiFWh
X-Authority-Analysis: v=2.4 cv=ZrDtK87G c=1 sm=1 tr=0 ts=67ecf7e8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=WWlI6AgWcwAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=t3gCYr1qIKSpYXPlo4cA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: Lqt9hFRxGtN6crA57rOOfxJb0YOkiFWh
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

Reduce the scope of some loop counters as these aren't needed outside
the loops they're used in.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v2:
- Remove a loop counter variable definition 
- Link to v1: https://lore.kernel.org/r/20250401-for-loop-counter-scope-v1-1-5ba75770be52@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_debugfs.c   |  3 +--
 drivers/gpu/drm/imagination/pvr_free_list.c |  3 +--
 drivers/gpu/drm/imagination/pvr_fw.c        | 12 ++++--------
 drivers/gpu/drm/imagination/pvr_fw_meta.c   |  3 +--
 drivers/gpu/drm/imagination/pvr_fw_mips.c   |  6 ++----
 drivers/gpu/drm/imagination/pvr_fw_trace.c  | 23 ++++++++---------------
 drivers/gpu/drm/imagination/pvr_gem.c       |  4 +---
 drivers/gpu/drm/imagination/pvr_hwrt.c      | 12 ++++--------
 drivers/gpu/drm/imagination/pvr_stream.c    | 12 ++++--------
 drivers/gpu/drm/imagination/pvr_vm_mips.c   |  3 +--
 10 files changed, 27 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_debugfs.c b/drivers/gpu/drm/imagination/pvr_debugfs.c
index 6b77c9b4bde880cac6606764952d14be6c30b230..c7ce7daaa87a09b1c8e79f391e54b93642f0cb26 100644
--- a/drivers/gpu/drm/imagination/pvr_debugfs.c
+++ b/drivers/gpu/drm/imagination/pvr_debugfs.c
@@ -28,9 +28,8 @@ pvr_debugfs_init(struct drm_minor *minor)
 	struct drm_device *drm_dev = minor->dev;
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 	struct dentry *root = minor->debugfs_root;
-	size_t i;
 
-	for (i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
+	for (size_t i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
 		const struct pvr_debugfs_entry *entry = &pvr_debugfs_entries[i];
 		struct dentry *dir;
 
diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/drm/imagination/pvr_free_list.c
index 5e51bc980751c9e84f5365b633a22540426631ee..5228e214491c6217965a465dd91d52bd2a0b8945 100644
--- a/drivers/gpu/drm/imagination/pvr_free_list.c
+++ b/drivers/gpu/drm/imagination/pvr_free_list.c
@@ -237,11 +237,10 @@ pvr_free_list_insert_pages_locked(struct pvr_free_list *free_list,
 		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
 		u64 dma_pfn = dma_addr >>
 			       ROGUE_BIF_PM_PHYSICAL_PAGE_ALIGNSHIFT;
-		u32 dma_addr_offset;
 
 		BUILD_BUG_ON(ROGUE_BIF_PM_PHYSICAL_PAGE_SIZE > PAGE_SIZE);
 
-		for (dma_addr_offset = 0; dma_addr_offset < PAGE_SIZE;
+		for (u32 dma_addr_offset = 0; dma_addr_offset < PAGE_SIZE;
 		     dma_addr_offset += ROGUE_BIF_PM_PHYSICAL_PAGE_SIZE) {
 			WARN_ON_ONCE(dma_pfn >> 32);
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 3debc9870a82ae7de9b2dc173df84c466c137bb3..d43efa8810b80f77edde8a6901317e43e629b4b3 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -50,9 +50,8 @@ pvr_fw_find_layout_entry(struct pvr_device *pvr_dev, enum pvr_fw_section_id id)
 {
 	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
 	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
-	u32 entry;
 
-	for (entry = 0; entry < num_layout_entries; entry++) {
+	for (u32 entry = 0; entry < num_layout_entries; entry++) {
 		if (layout_entries[entry].id == id)
 			return &layout_entries[entry];
 	}
@@ -65,9 +64,8 @@ pvr_fw_find_private_data(struct pvr_device *pvr_dev)
 {
 	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
 	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
-	u32 entry;
 
-	for (entry = 0; entry < num_layout_entries; entry++) {
+	for (u32 entry = 0; entry < num_layout_entries; entry++) {
 		if (layout_entries[entry].id == META_PRIVATE_DATA ||
 		    layout_entries[entry].id == MIPS_PRIVATE_DATA ||
 		    layout_entries[entry].id == RISCV_PRIVATE_DATA)
@@ -97,7 +95,6 @@ pvr_fw_validate(struct pvr_device *pvr_dev)
 	const u8 *fw = firmware->data;
 	u32 fw_offset = firmware->size - SZ_4K;
 	u32 layout_table_size;
-	u32 entry;
 
 	if (firmware->size < SZ_4K || (firmware->size % FW_BLOCK_SIZE))
 		return -EINVAL;
@@ -144,7 +141,7 @@ pvr_fw_validate(struct pvr_device *pvr_dev)
 		return -EINVAL;
 
 	layout_entries = (const struct pvr_fw_layout_entry *)&fw[fw_offset];
-	for (entry = 0; entry < header->layout_entry_num; entry++) {
+	for (u32 entry = 0; entry < header->layout_entry_num; entry++) {
 		u32 start_addr = layout_entries[entry].base_addr;
 		u32 end_addr = start_addr + layout_entries[entry].alloc_size;
 
@@ -233,13 +230,12 @@ pvr_fw_find_mmu_segment(struct pvr_device *pvr_dev, u32 addr, u32 size, void *fw
 	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
 	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
 	u32 end_addr = addr + size;
-	int entry = 0;
 
 	/* Ensure requested range is not zero, and size is not causing addr to overflow. */
 	if (end_addr <= addr)
 		return -EINVAL;
 
-	for (entry = 0; entry < num_layout_entries; entry++) {
+	for (int entry = 0; entry < num_layout_entries; entry++) {
 		u32 entry_start_addr = layout_entries[entry].base_addr;
 		u32 entry_end_addr = entry_start_addr + layout_entries[entry].alloc_size;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index c39beb70c3173ebdab13b4e810ce5d9a3419f0ba..d8004a56b1f4e29be3a773a41a7ffd74c14c5786 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -370,13 +370,12 @@ configure_seg_mmu(struct pvr_device *pvr_dev, u32 **boot_conf_ptr)
 	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
 	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
 	u64 seg_out_addr_top;
-	u32 i;
 
 	seg_out_addr_top =
 		ROGUE_FW_SEGMMU_OUTADDR_TOP_SLC(MMU_CONTEXT_MAPPING_FWPRIV,
 						ROGUE_FW_SEGMMU_META_BIFDM_ID);
 
-	for (i = 0; i < num_layout_entries; i++) {
+	for (u32 i = 0; i < num_layout_entries; i++) {
 		/*
 		 * FW code is using the bootloader segment which is already
 		 * configured on boot. FW coremem code and data don't use the
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 0bed0257e2ab75f66d8b8966b2ceac6342396fb5..ee0735b745a9ff5c99637c2cb312998679f47fd3 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -37,10 +37,9 @@ process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code
 	struct elf32_hdr *header = (struct elf32_hdr *)fw;
 	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	u32 entry;
 	int err;
 
-	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+	for (u32 entry = 0; entry < header->e_phnum; entry++, program_header++) {
 		void *write_addr;
 
 		/* Only consider loadable entries in the ELF segment table */
@@ -97,7 +96,6 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
 	const struct pvr_fw_layout_entry *stack_entry;
 	struct rogue_mipsfw_boot_data *boot_data;
 	dma_addr_t dma_addr;
-	u32 page_nr;
 	int err;
 
 	err = process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
@@ -132,7 +130,7 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
 
 	boot_data->reg_base = pvr_dev->regs_resource->start;
 
-	for (page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
+	for (u32 page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
 		/* Firmware expects 4k pages, but host page size might be different. */
 		u32 src_page_nr = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) >> PAGE_SHIFT;
 		u32 page_offset = (page_nr * ROGUE_MIPSFW_PAGE_SIZE_4K) & ~PAGE_MASK;
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 73707daa4e52d13fd1388cb2e9feff0aea109620..74b4c21ea69fbc4f2a97a5b283a71ffed88f0882 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -21,7 +21,6 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
 {
 	struct rogue_fwif_tracebuf *tracebuf_ctrl = cpu_ptr;
 	struct pvr_fw_trace *fw_trace = priv;
-	u32 thread_nr;
 
 	tracebuf_ctrl->tracebuf_size_in_dwords = ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
 	tracebuf_ctrl->tracebuf_flags = 0;
@@ -31,7 +30,7 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
 	else
 		tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
 
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct rogue_fwif_tracebuf_space *tracebuf_space =
 			&tracebuf_ctrl->tracebuf[thread_nr];
 		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
@@ -48,10 +47,9 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 {
 	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	u32 thread_nr;
 	int err;
 
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
 
 		trace_buffer->buf =
@@ -88,7 +86,7 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 	BUILD_BUG_ON(ARRAY_SIZE(fw_trace->tracebuf_ctrl->tracebuf) !=
 		     ARRAY_SIZE(fw_trace->buffers));
 
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct rogue_fwif_tracebuf_space *tracebuf_space =
 			&fw_trace->tracebuf_ctrl->tracebuf[thread_nr];
 		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
@@ -99,7 +97,7 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 	return 0;
 
 err_free_buf:
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
 
 		if (trace_buffer->buf)
@@ -112,9 +110,8 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 {
 	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
-	u32 thread_nr;
 
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
 		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
 
 		pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);
@@ -184,9 +181,7 @@ struct pvr_fw_trace_seq_data {
 
 static u32 find_sfid(u32 id)
 {
-	u32 i;
-
-	for (i = 0; i < ARRAY_SIZE(stid_fmts); i++) {
+	for (u32 i = 0; i < ARRAY_SIZE(stid_fmts); i++) {
 		if (stid_fmts[i].id == id)
 			return i;
 	}
@@ -285,12 +280,11 @@ static void fw_trace_get_first(struct pvr_fw_trace_seq_data *trace_seq_data)
 static void *fw_trace_seq_start(struct seq_file *s, loff_t *pos)
 {
 	struct pvr_fw_trace_seq_data *trace_seq_data = s->private;
-	u32 i;
 
 	/* Reset trace index, then advance to *pos. */
 	fw_trace_get_first(trace_seq_data);
 
-	for (i = 0; i < *pos; i++) {
+	for (u32 i = 0; i < *pos; i++) {
 		if (!fw_trace_get_next(trace_seq_data))
 			return NULL;
 	}
@@ -455,12 +449,11 @@ void
 pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
 {
 	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
-	u32 thread_nr;
 
 	static_assert(ARRAY_SIZE(fw_trace->buffers) <= 10,
 		      "The filename buffer is only large enough for a single-digit thread count");
 
-	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); ++thread_nr) {
+	for (u32 thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); ++thread_nr) {
 		char filename[8];
 
 		snprintf(filename, ARRAY_SIZE(filename), "trace_%u", thread_nr);
diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index 6a8c81fe8c1e85c2130a4fe90fce35b6a2be35aa..f936fc7d4e4d16fabe7836e4b053de6a11d3577e 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -76,8 +76,6 @@ pvr_gem_object_flags_validate(u64 flags)
 		 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS),
 	};
 
-	int i;
-
 	/*
 	 * Check for bits set in undefined regions. Reserved regions refer to
 	 * options that can only be set by the kernel. These are explicitly
@@ -91,7 +89,7 @@ pvr_gem_object_flags_validate(u64 flags)
 	 * Check for all combinations of flags marked as invalid in the array
 	 * above.
 	 */
-	for (i = 0; i < ARRAY_SIZE(invalid_combinations); ++i) {
+	for (int i = 0; i < ARRAY_SIZE(invalid_combinations); ++i) {
 		u64 combo = invalid_combinations[i];
 
 		if ((flags & combo) == combo)
diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
index 54f88d6c01e565f4f0d1bd4fcc7e2983914b9141..dc0c25fa184700992c8e986466a2020e4b2ad355 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.c
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -44,13 +44,12 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_file,
 {
 	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
 	int err;
-	int i;
 
 	hwrt->pvr_dev = pvr_dev;
 	hwrt->max_rts = args->layers;
 
 	/* Get pointers to the free lists */
-	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+	for (int i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
 		hwrt->free_lists[i] = pvr_free_list_lookup(pvr_file,  args->free_list_handles[i]);
 		if (!hwrt->free_lists[i]) {
 			err = -EINVAL;
@@ -67,7 +66,7 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_file,
 	return 0;
 
 err_put_free_lists:
-	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+	for (int i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
 		pvr_free_list_put(hwrt->free_lists[i]);
 		hwrt->free_lists[i] = NULL;
 	}
@@ -78,9 +77,7 @@ hwrt_init_kernel_structure(struct pvr_file *pvr_file,
 static void
 hwrt_fini_kernel_structure(struct pvr_hwrt_dataset *hwrt)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
+	for (int i = 0; i < ARRAY_SIZE(hwrt->free_lists); i++) {
 		pvr_free_list_put(hwrt->free_lists[i]);
 		hwrt->free_lists[i] = NULL;
 	}
@@ -363,13 +360,12 @@ hwrt_data_init_fw_structure(struct pvr_file *pvr_file,
 	struct drm_pvr_create_hwrt_geom_data_args *geom_data_args = &args->geom_data_args;
 	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
 	struct rogue_fwif_rta_ctl *rta_ctl;
-	int free_list_i;
 	int err;
 
 	pvr_fw_object_get_fw_addr(hwrt->common_fw_obj,
 				  &hwrt_data->data.hwrt_data_common_fw_addr);
 
-	for (free_list_i = 0; free_list_i < ARRAY_SIZE(hwrt->free_lists); free_list_i++) {
+	for (int free_list_i = 0; free_list_i < ARRAY_SIZE(hwrt->free_lists); free_list_i++) {
 		pvr_fw_object_get_fw_addr(hwrt->free_lists[free_list_i]->fw_obj,
 					  &hwrt_data->data.freelists_fw_addr[free_list_i]);
 	}
diff --git a/drivers/gpu/drm/imagination/pvr_stream.c b/drivers/gpu/drm/imagination/pvr_stream.c
index 975336a4facfd0472958c72683ed1a302f7144a1..679aa618b7a9cd2853c7f580e326461c58b535bb 100644
--- a/drivers/gpu/drm/imagination/pvr_stream.c
+++ b/drivers/gpu/drm/imagination/pvr_stream.c
@@ -67,9 +67,8 @@ pvr_stream_process_1(struct pvr_device *pvr_dev, const struct pvr_stream_def *st
 		     u8 *dest, u32 dest_size, u32 *stream_offset_out)
 {
 	int err = 0;
-	u32 i;
 
-	for (i = 0; i < nr_entries; i++) {
+	for (u32 i = 0; i < nr_entries; i++) {
 		if (stream_def[i].offset >= dest_size) {
 			err = -EINVAL;
 			break;
@@ -131,7 +130,6 @@ pvr_stream_process_ext_stream(struct pvr_device *pvr_dev,
 	u32 musthave_masks[PVR_STREAM_EXTHDR_TYPE_MAX];
 	u32 ext_header;
 	int err = 0;
-	u32 i;
 
 	/* Copy "must have" mask from device. We clear this as we process the stream. */
 	memcpy(musthave_masks, pvr_dev->stream_musthave_quirks[cmd_defs->type],
@@ -159,7 +157,7 @@ pvr_stream_process_ext_stream(struct pvr_device *pvr_dev,
 
 		musthave_masks[type] &= ~data;
 
-		for (i = 0; i < header->ext_streams_num; i++) {
+		for (u32 i = 0; i < header->ext_streams_num; i++) {
 			const struct pvr_stream_ext_def *ext_def = &header->ext_streams[i];
 
 			if (!(ext_header & ext_def->header_mask))
@@ -181,7 +179,7 @@ pvr_stream_process_ext_stream(struct pvr_device *pvr_dev,
 	 * Verify that "must have" mask is now zero. If it isn't then one of the "must have" quirks
 	 * for this command was not present.
 	 */
-	for (i = 0; i < cmd_defs->ext_nr_headers; i++) {
+	for (u32 i = 0; i < cmd_defs->ext_nr_headers; i++) {
 		if (musthave_masks[i])
 			return -EINVAL;
 	}
@@ -245,13 +243,11 @@ pvr_stream_process(struct pvr_device *pvr_dev, const struct pvr_stream_cmd_defs
 		if (err)
 			return err;
 	} else {
-		u32 i;
-
 		/*
 		 * If we don't have an extension stream then there must not be any "must have"
 		 * quirks for this command.
 		 */
-		for (i = 0; i < cmd_defs->ext_nr_headers; i++) {
+		for (u32 i = 0; i < cmd_defs->ext_nr_headers; i++) {
 			if (pvr_dev->stream_musthave_quirks[cmd_defs->type][i])
 				return -EINVAL;
 		}
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 94af854547d6c52471527b6388086a8f7a35aef4..5847a1c92bea8b0923628ad7b72913e8977d4b97 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -100,10 +100,9 @@ pvr_vm_mips_fini(struct pvr_device *pvr_dev)
 {
 	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
 	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
-	int page_nr;
 
 	vunmap(mips_data->pt);
-	for (page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
+	for (int page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
 		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
 			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 

---
base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
change-id: 20250401-for-loop-counter-scope-115373392913

Best regards,
-- 
Alexandru Dadu <alexandru.dadu@imgtec.com>

