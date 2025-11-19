Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D04C7182C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FC710E6B9;
	Thu, 20 Nov 2025 00:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-93.mail.aliyun.com (out28-93.mail.aliyun.com
 [115.124.28.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E72B10E5AA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:28:48 +0000 (UTC)
Received: from aliyun.com(mailfrom:zhangzhijie@bosc.ac.cn
 fp:SMTPD_---.fQ5Hg1C_1763540924 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 19 Nov 2025 16:28:45 +0800
From: zhangzhijie <zhangzhijie@bosc.ac.cn>
To: Hawking.Zhang@amd.com, zhangzhijie@bosc.ac.cn, wangran@bosc.ac.cn,
 zhangjian@bosc.ac.cn, alexander.deucher@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: botton_zhang@163.com
Subject: [PATCH v1] tests: Add test suite for double-checking userptr write
 validity and VRAM
Date: Wed, 19 Nov 2025 16:28:41 +0800
Message-Id: <20251119082841.1179938-1-zhangzhijie@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

Userptr resides in host memory, and PCIe writes involve cache coherence.
By using SDMA to copy GTT to VRAM and then verifying the values in VRAM, we can validate GTT cache coherence.

Bo(Userptr) ----> SDMA ---> Bo(userptr) ----sdma-----> VRAM

Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
---
 tests/amdgpu/basic_tests.c | 155 +++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
index 0e4a357b..223a9b0b 100644
--- a/tests/amdgpu/basic_tests.c
+++ b/tests/amdgpu/basic_tests.c
@@ -2061,12 +2061,167 @@ static void amdgpu_command_submission_sdma_copy_linear(void)
 {
 	amdgpu_command_submission_copy_linear_helper(AMDGPU_HW_IP_DMA);
 }
+static void amdgpu_command_userptr_copy_to_vram_linear(void)
+{
+	int i, r, j;
+	uint32_t *pm4 = NULL;
+	uint64_t bo_mc;
+	void *ptr = NULL;
+	int pm4_dw = 256;
+	int sdma_write_length = 4;
+	amdgpu_bo_handle handle;
+	amdgpu_context_handle context_handle;
+	struct amdgpu_cs_ib_info *ib_info;
+	struct amdgpu_cs_request *ibs_request;
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle va_handle;
+
+	amdgpu_bo_handle bo1;
+	amdgpu_bo_handle *resources;
+	uint64_t bo1_mc;
+	volatile unsigned char *bo1_cpu;
+	amdgpu_va_handle bo1_va_handle;
+
+
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				sdma_write_length, 4096,
+				AMDGPU_GEM_DOMAIN_VRAM,
+				AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED, &bo1,
+				(void**)&bo1_cpu, &bo1_mc,
+				&bo1_va_handle);
+	CU_ASSERT_EQUAL(r, 0);
+	/* set bo1 */
+	memset((void*)bo1_cpu, 0xaa, sdma_write_length);
+
+	pm4 = calloc(pm4_dw, sizeof(*pm4));
+	CU_ASSERT_NOT_EQUAL(pm4, NULL);
+
+	ib_info = calloc(1, sizeof(*ib_info));
+	CU_ASSERT_NOT_EQUAL(ib_info, NULL);
+
+	ibs_request = calloc(1, sizeof(*ibs_request));
+	CU_ASSERT_NOT_EQUAL(ibs_request, NULL);
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	CU_ASSERT_EQUAL(r, 0);
+
+	posix_memalign(&ptr, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
+	CU_ASSERT_NOT_EQUAL(ptr, NULL);
+	memset(ptr, 0, BUFFER_SIZE);
+
+	r = amdgpu_create_bo_from_user_mem(device_handle,
+					   ptr, BUFFER_SIZE, &buf_handle);
+	CU_ASSERT_EQUAL(r, 0);
+
+	r = amdgpu_va_range_alloc(device_handle,
+				  amdgpu_gpu_va_range_general,
+				  BUFFER_SIZE, 1, 0, &bo_mc,
+				  &va_handle, 0);
+	CU_ASSERT_EQUAL(r, 0);
+
+	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_MAP);
+	CU_ASSERT_EQUAL(r, 0);
+
+	handle = buf_handle;
+
+	j = i = 0;
+
+	if (family_id == AMDGPU_FAMILY_SI)
+		pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
+				sdma_write_length);
+	else
+		pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
+				SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
+	pm4[i++] = 0xffffffff & bo_mc;
+	pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
+	if (family_id >= AMDGPU_FAMILY_AI)
+		pm4[i++] = sdma_write_length - 1;
+	else if (family_id != AMDGPU_FAMILY_SI)
+		pm4[i++] = sdma_write_length;
+
+	while (j++ < sdma_write_length)
+		pm4[i++] = 0xdeadbeaf;
+
+	if (!fork()) {
+		pm4[0] = 0x0;
+		exit(0);
+	}
+
+	amdgpu_test_exec_cs_helper(context_handle,
+				   AMDGPU_HW_IP_DMA, 0,
+				   i, pm4,
+				   1, &handle,
+				   ib_info, ibs_request);
+
+	i = 0;
+	sdma_write_length = 1024;
+	if (family_id == AMDGPU_FAMILY_SI) {
+		pm4[i++] =
+		SDMA_PACKET_SI(SDMA_OPCODE_COPY_SI, 0, 0, 0, sdma_write_length);
+		pm4[i++] = 0xffffffff & bo1_mc;
+		pm4[i++] = 0xffffffff & bo_mc;
+		pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
+		pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
+	} else {
+		pm4[i++] =
+		SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_COPY_SUB_OPCODE_LINEAR, 0);
+		if (family_id >= AMDGPU_FAMILY_AI)
+			pm4[i++] = sdma_write_length - 1;
+		else
+			pm4[i++] = sdma_write_length;
+		pm4[i++] = 0;
+		pm4[i++] = 0xffffffff & bo_mc;
+		pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
+		pm4[i++] = 0xffffffff & bo1_mc;
+		pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
+	}
+	/* prepare resource */
+	resources = calloc(2, sizeof(amdgpu_bo_handle));
+	CU_ASSERT_NOT_EQUAL(resources, NULL);
+
+	resources[0] = bo1;
+	resources[1] = handle;
+	amdgpu_test_exec_cs_helper(context_handle,
+					AMDGPU_HW_IP_DMA, 0,
+					i, pm4,
+					2, resources,
+					ib_info, ibs_request);
+
+	i = 0;
+	while (i < 4) {
+		CU_ASSERT_EQUAL(((int*)ptr)[i++], 0xdeadbeaf);
+	}
+
+	i = 0;
+	while (i < 4) {
+		CU_ASSERT_EQUAL(((int*)bo1_cpu)[i++], 0xdeadbeaf);
+	}
+	free(ibs_request);
+	free(ib_info);
+	free(pm4);
+
+	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_UNMAP);
+	CU_ASSERT_EQUAL(r, 0);
+	r = amdgpu_va_range_free(va_handle);
+	CU_ASSERT_EQUAL(r, 0);
+	r = amdgpu_bo_free(buf_handle);
+	CU_ASSERT_EQUAL(r, 0);
+	free(ptr);
+	r = amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
+						sdma_write_length);
+	CU_ASSERT_EQUAL(r, 0);
+	r = amdgpu_cs_ctx_free(context_handle);
+	CU_ASSERT_EQUAL(r, 0);
+
+	wait(NULL);
+}
 
 static void amdgpu_command_submission_sdma(void)
 {
 	amdgpu_command_submission_sdma_write_linear();
 	amdgpu_command_submission_sdma_const_fill();
 	amdgpu_command_submission_sdma_copy_linear();
+	amdgpu_command_userptr_copy_to_vram_linear();
 }
 
 static void amdgpu_command_submission_multi_fence_wait_all(bool wait_all)
-- 
2.34.1

