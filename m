Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF73AAA13A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1028810E529;
	Mon,  5 May 2025 22:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W+9dhAbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B7010E529;
 Mon,  5 May 2025 22:45:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5C50444FE;
 Mon,  5 May 2025 22:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E25C4CEE4;
 Mon,  5 May 2025 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485125;
 bh=Zr23LXzKAkDJhY/m3Nmdy7bsYe+I8SLFZgwi6J7cX7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W+9dhAbOPgizSM9nCX0ND2V7cT7ForAcigWBCtBjAs93jdZS8TLxE2mLfyWcHXg+v
 Kui9iWphrwvHyi/0h89e4OAm2eDkLwfalAY3k9zvoJQt/gnx845XrWa2z9v9SSGQvK
 4NcbMq2X+JBZxB12EHA3mToAn2eOVUk4zOVfb5Fj/uTSbPmNHdiN4/r1HxmwOcAcJ+
 sn5wa8oye9kg0z+7etQOirw9k0kQMsxSzIoFFlUaxHFuY6C6Crb2tZ28/VgJPT0Ura
 ONBG3lWu2oIUFxciFsraoAUBDkXfLjpCLx0lhFIjAKerGPrHgKpyRQdpv/yTqt0K3z
 kieQFMxvzusfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Amber Lin <Amber.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 173/486] drm/amdkfd: Set per-process flags only
 once for gfx9/10/11/12
Date: Mon,  5 May 2025 18:34:09 -0400
Message-Id: <20250505223922.2682012-173-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

[ Upstream commit 61972cd93af70738a6ad7f93e17cc7f68a01e182 ]

Define set_cache_memory_policy() for these asics and move all static
changes from update_qpd() which is called each time a queue is created
to set_cache_memory_policy() which is called once during process
initialization

Signed-off-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Reviewed-by: Amber Lin <Amber.Lin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/amdkfd/kfd_device_queue_manager_v10.c | 41 +++++++++++--------
 .../amd/amdkfd/kfd_device_queue_manager_v11.c | 41 +++++++++++--------
 .../amd/amdkfd/kfd_device_queue_manager_v12.c | 41 +++++++++++--------
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  | 36 +++++++++++++++-
 4 files changed, 107 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v10.c
index 245a90dfc2f6b..b5f5f141353b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v10.c
@@ -31,10 +31,17 @@ static int update_qpd_v10(struct device_queue_manager *dqm,
 			 struct qcm_process_device *qpd);
 static void init_sdma_vm_v10(struct device_queue_manager *dqm, struct queue *q,
 			    struct qcm_process_device *qpd);
+static bool set_cache_memory_policy_v10(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size);
 
 void device_queue_manager_init_v10(
 	struct device_queue_manager_asic_ops *asic_ops)
 {
+	asic_ops->set_cache_memory_policy = set_cache_memory_policy_v10;
 	asic_ops->update_qpd = update_qpd_v10;
 	asic_ops->init_sdma_vm = init_sdma_vm_v10;
 	asic_ops->mqd_manager_init = mqd_manager_init_v10;
@@ -49,27 +56,27 @@ static uint32_t compute_sh_mem_bases_64bit(struct kfd_process_device *pdd)
 		private_base;
 }
 
-static int update_qpd_v10(struct device_queue_manager *dqm,
-			 struct qcm_process_device *qpd)
+static bool set_cache_memory_policy_v10(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size)
 {
-	struct kfd_process_device *pdd;
-
-	pdd = qpd_to_pdd(qpd);
-
-	/* check if sh_mem_config register already configured */
-	if (qpd->sh_mem_config == 0) {
-		qpd->sh_mem_config =
-			(SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
-				SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
-			(3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
-		qpd->sh_mem_ape1_limit = 0;
-		qpd->sh_mem_ape1_base = 0;
-	}
-
-	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(pdd);
+	qpd->sh_mem_config = (SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+			      SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
+			      (3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
+	qpd->sh_mem_ape1_limit = 0;
+	qpd->sh_mem_ape1_base = 0;
+	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(qpd_to_pdd(qpd));
 
 	pr_debug("sh_mem_bases 0x%X\n", qpd->sh_mem_bases);
+	return true;
+}
 
+static int update_qpd_v10(struct device_queue_manager *dqm,
+			 struct qcm_process_device *qpd)
+{
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
index 2e129da7acb43..f436878d0d621 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
@@ -30,10 +30,17 @@ static int update_qpd_v11(struct device_queue_manager *dqm,
 			 struct qcm_process_device *qpd);
 static void init_sdma_vm_v11(struct device_queue_manager *dqm, struct queue *q,
 			    struct qcm_process_device *qpd);
+static bool set_cache_memory_policy_v11(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size);
 
 void device_queue_manager_init_v11(
 	struct device_queue_manager_asic_ops *asic_ops)
 {
+	asic_ops->set_cache_memory_policy = set_cache_memory_policy_v11;
 	asic_ops->update_qpd = update_qpd_v11;
 	asic_ops->init_sdma_vm = init_sdma_vm_v11;
 	asic_ops->mqd_manager_init = mqd_manager_init_v11;
@@ -48,28 +55,28 @@ static uint32_t compute_sh_mem_bases_64bit(struct kfd_process_device *pdd)
 		private_base;
 }
 
-static int update_qpd_v11(struct device_queue_manager *dqm,
-			 struct qcm_process_device *qpd)
+static bool set_cache_memory_policy_v11(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size)
 {
-	struct kfd_process_device *pdd;
-
-	pdd = qpd_to_pdd(qpd);
-
-	/* check if sh_mem_config register already configured */
-	if (qpd->sh_mem_config == 0) {
-		qpd->sh_mem_config =
-			(SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
-				SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
-			(3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
-
-		qpd->sh_mem_ape1_limit = 0;
-		qpd->sh_mem_ape1_base = 0;
-	}
+	qpd->sh_mem_config = (SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+			      SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
+			      (3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
 
-	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(pdd);
+	qpd->sh_mem_ape1_limit = 0;
+	qpd->sh_mem_ape1_base = 0;
+	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(qpd_to_pdd(qpd));
 
 	pr_debug("sh_mem_bases 0x%X\n", qpd->sh_mem_bases);
+	return true;
+}
 
+static int update_qpd_v11(struct device_queue_manager *dqm,
+			 struct qcm_process_device *qpd)
+{
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12.c
index 4f3295b29dfb1..62ca1c8fcbaf9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12.c
@@ -30,10 +30,17 @@ static int update_qpd_v12(struct device_queue_manager *dqm,
 			 struct qcm_process_device *qpd);
 static void init_sdma_vm_v12(struct device_queue_manager *dqm, struct queue *q,
 			    struct qcm_process_device *qpd);
+static bool set_cache_memory_policy_v12(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size);
 
 void device_queue_manager_init_v12(
 	struct device_queue_manager_asic_ops *asic_ops)
 {
+	asic_ops->set_cache_memory_policy = set_cache_memory_policy_v12;
 	asic_ops->update_qpd = update_qpd_v12;
 	asic_ops->init_sdma_vm = init_sdma_vm_v12;
 	asic_ops->mqd_manager_init = mqd_manager_init_v12;
@@ -48,28 +55,28 @@ static uint32_t compute_sh_mem_bases_64bit(struct kfd_process_device *pdd)
 		private_base;
 }
 
-static int update_qpd_v12(struct device_queue_manager *dqm,
-			 struct qcm_process_device *qpd)
+static bool set_cache_memory_policy_v12(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size)
 {
-	struct kfd_process_device *pdd;
-
-	pdd = qpd_to_pdd(qpd);
-
-	/* check if sh_mem_config register already configured */
-	if (qpd->sh_mem_config == 0) {
-		qpd->sh_mem_config =
-			(SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
-				SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
-			(3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
-
-		qpd->sh_mem_ape1_limit = 0;
-		qpd->sh_mem_ape1_base = 0;
-	}
+	qpd->sh_mem_config = (SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+			      SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
+			      (3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
 
-	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(pdd);
+	qpd->sh_mem_ape1_limit = 0;
+	qpd->sh_mem_ape1_base = 0;
+	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(qpd_to_pdd(qpd));
 
 	pr_debug("sh_mem_bases 0x%X\n", qpd->sh_mem_bases);
+	return true;
+}
 
+static int update_qpd_v12(struct device_queue_manager *dqm,
+			 struct qcm_process_device *qpd)
+{
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
index 210bcc048f4c5..3264509408bc8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
@@ -30,10 +30,17 @@ static int update_qpd_v9(struct device_queue_manager *dqm,
 			 struct qcm_process_device *qpd);
 static void init_sdma_vm_v9(struct device_queue_manager *dqm, struct queue *q,
 			    struct qcm_process_device *qpd);
+static bool set_cache_memory_policy_v9(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size);
 
 void device_queue_manager_init_v9(
 	struct device_queue_manager_asic_ops *asic_ops)
 {
+	asic_ops->set_cache_memory_policy = set_cache_memory_policy_v9;
 	asic_ops->update_qpd = update_qpd_v9;
 	asic_ops->init_sdma_vm = init_sdma_vm_v9;
 	asic_ops->mqd_manager_init = mqd_manager_init_v9;
@@ -48,10 +55,37 @@ static uint32_t compute_sh_mem_bases_64bit(struct kfd_process_device *pdd)
 		private_base;
 }
 
+static bool set_cache_memory_policy_v9(struct device_queue_manager *dqm,
+				   struct qcm_process_device *qpd,
+				   enum cache_policy default_policy,
+				   enum cache_policy alternate_policy,
+				   void __user *alternate_aperture_base,
+				   uint64_t alternate_aperture_size)
+{
+	qpd->sh_mem_config = SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+				SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;
+
+	if (dqm->dev->kfd->noretry)
+		qpd->sh_mem_config |= 1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
+
+	if (KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 3) ||
+		KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 4) ||
+		KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 5, 0))
+		qpd->sh_mem_config |= (1 << SH_MEM_CONFIG__F8_MODE__SHIFT);
+
+	qpd->sh_mem_ape1_limit = 0;
+	qpd->sh_mem_ape1_base = 0;
+	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(qpd_to_pdd(qpd));
+
+	pr_debug("sh_mem_bases 0x%X sh_mem_config 0x%X\n", qpd->sh_mem_bases,
+		 qpd->sh_mem_config);
+	return true;
+}
+
 static int update_qpd_v9(struct device_queue_manager *dqm,
 			 struct qcm_process_device *qpd)
 {
-	struct kfd_process_device *pdd;
+	struct kfd_process_device *pdd = qpd_to_pdd(qpd);
 
 	pdd = qpd_to_pdd(qpd);
 
-- 
2.39.5

