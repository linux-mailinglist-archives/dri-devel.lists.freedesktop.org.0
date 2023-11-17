Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147A7EFB16
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBD510E796;
	Fri, 17 Nov 2023 21:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42DF10E796;
 Fri, 17 Nov 2023 21:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/s2wwMihiL+bh4yrB8mfGGCftnRUecC99EkOsVRihembL0Y9yS44whBwWyMqomRp9sVeucMTsvutmQ1yqe8xSMk2p4K8DGeSYd72roi1dS04g0p6j+Y6nPQ7i/2rGPMTl5YdIpq/cJlIBtz8fgXSxjeXEU9ILPLMlRDPkVo2PzUKJ1u8AVbLph9zhf2LzjoSkPbe5JRw/42Y6zQXN075EicIrbWigLrJ+KMBzUoHIcnWf9SN7l2OG48ywOlgQnr61hkq5ojw/iE6ijNndkDTJckyc2lI/UpzBsP9/TzJsPvsuVc7ljh9SaDkQlXKAex7giMKnMuo2/fRiHCmQ/e1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6RUTn7k26le8slHS9LlgTldfLCBOm/bn3TMrj0N8is=;
 b=FZhBUMv2g48hmFnl+5OErHJWVLMs7z1sfA+bE6aO2/lejT46KM3lZ4XU0KZdGK4klM+hduuUuh5bF8JEhDdHuyUsdNa4QKUUlrnPdZOoy06irkyxKPODzGl5BVDW5aG3jbLfETb0B/EUoWFk9l5nOjL2SAaCbJI2+I1QZm2Bye94JiVLlIZ6BS2CvnIL64B8Zdh7ZvCN7XFKu4+hu8Xb7Pqmg8KA3LGKCPRJeWiQanwhvgrHnCaBmsVuhPv9LHfEfJhA3BV9Y1G1bvHXCUmYBVTKWJU3OIkQ+g1ZVitqQYiH91hlZbvIs5/u3Ct5aLCm2SaEEGAFV3vHMjVRfWV5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6RUTn7k26le8slHS9LlgTldfLCBOm/bn3TMrj0N8is=;
 b=GrP6Nq/uiOKcMhIbefeSBdi+q21uLqsKplayvPlUUXgcPUUc9pO3ufBAahjAh8cNM3Pg5Jt113FIIu+HSAcMe78Ku11zUeiFyc+ZWjSSnibSwiUxaMaB5lmbEi8fQMg/x+XNOO+V3XJsj3s5Te/P6fIUVHgU3Tf02Q7WWzNEk0I=
Received: from BN9PR03CA0425.namprd03.prod.outlook.com (2603:10b6:408:113::10)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 21:57:01 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::78) by BN9PR03CA0425.outlook.office365.com
 (2603:10b6:408:113::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 21:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 21:57:01 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 15:57:00 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Date: Fri, 17 Nov 2023 16:44:17 -0500
Message-ID: <20231117214419.418556-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CY8PR12MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 113a7b92-491b-43aa-ca60-08dbe7b820cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+hIrM/UnzuDsCErE2LUonoYroN+cgEjH1IIO9wD9FV6EPyiFZwwstAtTy+uiD+pixgpSQmdr/7nbtLLzG28KeDNGo7nb7q8PthqDmIjGSo17naSCDErF25IEfIX+gjlZ/nVi3wzuaRDa7S5AZDyy1VcY596HtG/SBzsNa7Y8pJ37SFPmf2QCb7msvCBnqEbbrmwSAvmzsZE6kYgt6RA2+DlDN+gSk+J2aAZ1gOOESkBuCOu0cKzNGTNNErPch0bVZUIwMm88eoteJmF7SpEXAEHh2/XPOVmU4S2faD0qFUV38dd7Q6BksQ8PBxg4mDW6vbIfan3s0Jfo2wPv+oeTts8TSiBftiJRxhmvGT/STk/Ktf0u1h9bYRrrBXQYLxAPBnsgw1oqHd2KKK+agecM+jQzgl5cik2Ch/6nDxtTY9X9kAydKwj9KD+K7OOne6jpYwheOed1NpBh9I2VAhlhOdaB+2l1JbOAT37Eq2qRw4e647Jjl7ED8TC7PkCZQF35QmqmTn12kFoszNlbBoGSYjBNzsMq5GFPja/kwqMRnrFUndVEzn1bA2Rb92V8EgvhSHXbM4OwtMljPO2Pgy9rPZSqC6X0LjKXew7glxwVsmB9lXLPGer6efkmK3qWO4WtoMf5iQzllREWZ8dBT8/BFPP7LwoYe4TUeqCD+8rqzaFqlfCWbwBifSLSMXmZutE9TSB+WEDB7kO4sADmCzp3TIFKGts10CfNFdlxgiUtCeaKosqpmM95dY4sG/0LZTDtpEzSAMkgO/3v01iGW4hhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(47076005)(54906003)(70206006)(70586007)(110136005)(36860700001)(66574015)(2906002)(86362001)(82740400003)(8936002)(8676002)(4326008)(81166007)(356005)(316002)(40480700001)(5660300002)(40460700003)(83380400001)(478600001)(26005)(426003)(336012)(41300700001)(1076003)(6666004)(2616005)(36756003)(16526019)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:57:01.2657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113a7b92-491b-43aa-ca60-08dbe7b820cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.

These helper functions are needed for KFD to export and import DMABufs
the right way without duplicating the tracking of DMABufs associated with
GEM objects while ensuring that move notifier callbacks are working as
intended.

CC: Christian König <christian.koenig@amd.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
 include/drm/drm_prime.h     |  7 +++++++
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 63b709a67471..834a5e28abbe 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_release);
 
-/*
+/**
  * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
  * @dev: drm_device to import into
  * @file_priv: drm file-private structure
@@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
  *
  * Returns 0 on success or a negative error code on failure.
  */
-static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-				      struct drm_file *file_priv, int prime_fd,
-				      uint32_t *handle)
+int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd,
+			       uint32_t *handle)
 {
 	struct dma_buf *dma_buf;
 	struct drm_gem_object *obj;
@@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 	dma_buf_put(dma_buf);
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
 
 int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 	return dmabuf;
 }
 
-/*
+/**
  * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
@@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
  * The actual exporting from GEM object to a dma-buf is done through the
  * &drm_gem_object_funcs.export callback.
  */
-static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-				      struct drm_file *file_priv, uint32_t handle,
-				      uint32_t flags,
-				      int *prime_fd)
+int drm_gem_prime_handle_to_fd(struct drm_device *dev,
+			       struct drm_file *file_priv, uint32_t handle,
+			       uint32_t flags,
+			       int *prime_fd)
 {
 	struct drm_gem_object *obj;
 	int ret = 0;
@@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
 
 int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
  * @obj: GEM object to export
  * @flags: flags like DRM_CLOEXEC and DRM_RDWR
  *
- * This is the implementation of the &drm_gem_object_funcs.export functions
- * for GEM drivers using the PRIME helpers. It is used as the default for
- * drivers that do not set their own.
+ * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
+ * using the PRIME helpers. It is used as the default in
+ * drm_gem_prime_handle_to_fd().
  */
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags)
@@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * @dev: drm_device to import into
  * @dma_buf: dma-buf object to import
  *
- * This is the implementation of the gem_prime_import functions for GEM
- * drivers using the PRIME helpers. It is the default for drivers that do
- * not set their own &drm_driver.gem_prime_import.
+ * This is the implementation of the gem_prime_import functions for GEM drivers
+ * using the PRIME helpers. Drivers can use this as their
+ * &drm_driver.gem_prime_import implementation. It is used as the default
+ * implementation in drm_gem_prime_fd_to_handle().
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
  * &drm_gem_object_funcs.free hook when using this function.
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index a7abf9f3e697..2a1d01e5b56b 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -60,12 +60,19 @@ enum dma_data_direction;
 
 struct drm_device;
 struct drm_gem_object;
+struct drm_file;
 
 /* core prime functions */
 struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
 				      struct dma_buf_export_info *exp_info);
 void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
 
+int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
+int drm_gem_prime_handle_to_fd(struct drm_device *dev,
+			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
+			       int *prime_fd);
+
 /* helper functions for exporting */
 int drm_gem_map_attach(struct dma_buf *dma_buf,
 		       struct dma_buf_attachment *attach);
-- 
2.34.1

