Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793552FAC29
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB8B6E7D0;
	Mon, 18 Jan 2021 21:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2D56E5BE;
 Mon, 18 Jan 2021 21:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGbkITEHtVq5AEFyS40h1ITecLd+76QvnISeg00sYmq5qEoDsPOH1scYLjdr/rf3OsuP0c/nCy3U5XXmblORphvlQfEaY5UvnpgnAvQEsU9YXKu4dns1m3f9u5efadtSs1VqTYdKJ1VkzLpiM0GaOqBsi4K9WpbKjRXCoWDh95UD8RYdvxYGNqC4xhe6uTKuxtKUnN1K9W7J0M/zDVFl/ngngkl6G5FCjJ2kmd3/XO4sBac4LD/yCwBciXexx6kZIvSALNtTsf+Zc7vU8L9tKj30J47NTp4MqB2PKJiAtC7Lf15sX/XuoIiYxGzErl4iBUi2sdE0a1myTbV4okg7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keU5rd9tfDfbyAQ+nfaxp0zWyerq6zZzsCruxbb7vKc=;
 b=XENJppeRFkCQqNk1Nx4AvhTpEMwznCPuCZJKA897yKgqJWVqVDSpZJmXL240Ka3FeVatpjbahmoGj71iWhaTxzsXFoMA8vI7hvQhnM9VTBFfHbETsNcN2+zputRF9IxwOBvL9LKx/meNE+1ziag9k4SEm7MBAdpWpUCl4mU4Apr7TDIyT8RIZu0WN+0OUzfmybk8DBx1eiNsIg2z1I4r2ljj58EOe9CP1V/lFgRM7tq/XA8/Ckmqyk9rI5oMn+VhBV9QjJaUsQvrAcruNOH3gdBXlEnC9BeAHPNLuLjxsjoxJPtDVzCKvl98ABv9CbMO3RfWQXF6o6CgvhSFlV3/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keU5rd9tfDfbyAQ+nfaxp0zWyerq6zZzsCruxbb7vKc=;
 b=rrASj9+oNQE1YNl5O2DbkcprH20h0QdKSZDqrA7IojyIMt0TD5fbeXkuxqhHhaygxHnXLVrr9YdI7x5SOFMZNMjKsCsJbaN1tZurW0Hf6OQtYlTS4xS3rJOiO18XkKs+3laY5T+6pKYgg59AZQBwCl1SG5BeNZG2dGQg7kquOfk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:41 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:41 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
Date: Mon, 18 Jan 2021 16:01:20 -0500
Message-Id: <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 39e7b75f-7e56-44ef-79f5-08d8bbf4650c
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB476706075FFE95DA315BEDBAEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJNhAeQ7pEm50pyfKGDJRDJboHb+BFdQ4QjRgVMYKRxwbuZV5lSBbUaHiqZWbJfEuTqPzz6vqgadZXANXAuJ5cRIWhnXwJtcpzoVvgdJOY4rsN2t2WXC+F0CojinOdFajdo5CWRJ0DmGzpIxzKVgsCToV4NXIXXmfoSkRxhBfQFQ/p/+rDaQ9rhJrGAWQ5jSYT2CKbxmRuubCIUKh1wATRJTcwy8YkiFJ00m71piUZCGJfeFP2rNtDkwU0GBSF81g+QxG8FBEdNMNMk0y+o2+2/MvfwP1sce9eqjvx07JQoiCEWSlCGUk014OVDpEGexgqQJuFpFe43Jh2O/UmEJXl9t+huNCofXbnDhYzxkZHnlOX0+P0Z2M97IeCZ62dbLf/4xZBCCOs2EBE7CRssDYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(30864003)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jMXMIsXjH+j2TZ7knWI8SRPKde7lDsbmuP9rnmzilBI1pUmchNnOGMTUM8ee?=
 =?us-ascii?Q?qCRAi2I7lr7uHhLHFx0+jJ5cyBmKcE9w/8D/nXXplmwbQUZ0PD11bYQ15tV2?=
 =?us-ascii?Q?R3mG0e8vYzaTxBm0LVKWnNnIxM94yRmB5LhX7xM3OjtLjsu5THe4ulIWJAsy?=
 =?us-ascii?Q?iENY9LQG2FfBGhq2mfTUhkuFAQ9pL7Dqk0G7JkNND8CDjexlrQxwsIw7i53k?=
 =?us-ascii?Q?YTvW/Yln69O4UDhdJ/NoIvO2N9fPdbBmHD09H0EMoqr+/UQ2gV9dwJtJmdxX?=
 =?us-ascii?Q?TZZMSGx70IwHWu4MEelMP0JlCKBGVvuh/jog3Tgophr2Y+5GYFFO5pK35Yce?=
 =?us-ascii?Q?Hf0nZZJGqBF8VodIsgyEeRcrq6UXHhMJRQbt2B488F2cELAnTJpapXipy9JZ?=
 =?us-ascii?Q?wn48bzzxc026b1PvSYdUDfwd2mqPRtKzjNr6JLiWVj5VwzxdLya0VYAlzGAK?=
 =?us-ascii?Q?8DlxbyCgl+jzsa+gBFqt67wJRJaLDaIbhJ5qwpoo1EXILrEQ4A7ojhlJVE9M?=
 =?us-ascii?Q?vNBGr7Cys6AT7QLgmR2eelhI0yi/CfbwXjRu9QdDZHWR5kDvhNGwDnpFCZEA?=
 =?us-ascii?Q?G5rqNavOFVcEnsXhRsAZl0pRscut+H7Ofx73RyLW1AEqiQRhlWuymH918Fwl?=
 =?us-ascii?Q?qGBRtb87pPEVYcqP+EprY4PAlcoLcBQBekKP0gZQUzafruB7GiXKPABthw3v?=
 =?us-ascii?Q?oQwoWK6tS0jT8nkqr4iSbUADQ7S4coLKeWOUjsZezsHTGv7EEENP19AkRi8H?=
 =?us-ascii?Q?W/JwZy3Y6pZEyDjpAxGA2H699jbptgKKdRt46G4rhHwv9cZpkMqj9auRin4u?=
 =?us-ascii?Q?uN1kQf71ZfG9CJ5pxGOg2c2u8AedHSZFlxCkj96Vq4lW14h8l4bN2n/fjDy1?=
 =?us-ascii?Q?eb2Wmb3ep4WEL94I7IowV3WiNPJ+xg0M+zZHpwkQkl14KFdePFuVt9uMz4Ly?=
 =?us-ascii?Q?mBn4SXOuuVQHNl3QID+tA5Bn0AHg5Y1rA56XYK8yll7eMRxFEEaCIpWQuuck?=
 =?us-ascii?Q?068/IXNWK0SpxiuZlKRRpPHbjObTehwAR9h30olFlpJKA3WQn3HEMcfP4Eeb?=
 =?us-ascii?Q?eMYEFG3LwJUWaYTP0gbMtbLdQGtXXOL8cyRep2iDqa25VtkE1NubGYLMmfc/?=
 =?us-ascii?Q?rEAa90HsDdPu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e7b75f-7e56-44ef-79f5-08d8bbf4650c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:41.6564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvPy2wFGC5DyFAfO12+0in2NBLKkbeHONH9HFJtvqFPjf27Bf1j2yZJ8KqyI1GfvmEVRdFqDIR8QV7Q9+OlYYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should prevent writing to memory or IO ranges possibly
already allocated for other uses after our device is removed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 57 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 53 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h    |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   | 70 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   | 49 ++-------------------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c     | 16 ++-----
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c     |  8 +---
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c      |  8 +---
 9 files changed, 184 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e99f4f1..0a9d73c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -72,6 +72,8 @@
 
 #include <linux/iommu.h>
 
+#include <drm/drm_drv.h>
+
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
@@ -404,13 +406,21 @@ uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset)
  */
 void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t value)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if (offset < adev->rmmio_size)
 		writeb(value, adev->rmmio + offset);
 	else
 		BUG();
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -427,9 +437,14 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
 			uint32_t reg, uint32_t v,
 			uint32_t acc_flags)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if ((reg * 4) < adev->rmmio_size) {
 		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
 		    amdgpu_sriov_runtime(adev) &&
@@ -444,6 +459,8 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
 	}
 
 	trace_amdgpu_device_wreg(adev->pdev->device, reg, v);
+
+	drm_dev_exit(idx);
 }
 
 /*
@@ -454,9 +471,14 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
 void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
 			     uint32_t reg, uint32_t v)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if (amdgpu_sriov_fullaccess(adev) &&
 	    adev->gfx.rlc.funcs &&
 	    adev->gfx.rlc.funcs->is_rlcg_access_range) {
@@ -465,6 +487,8 @@ void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
 	} else {
 		writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
 	}
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -499,15 +523,22 @@ u32 amdgpu_io_rreg(struct amdgpu_device *adev, u32 reg)
  */
 void amdgpu_io_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if ((reg * 4) < adev->rio_mem_size)
 		iowrite32(v, adev->rio_mem + (reg * 4));
 	else {
 		iowrite32((reg * 4), adev->rio_mem + (mmMM_INDEX * 4));
 		iowrite32(v, adev->rio_mem + (mmMM_DATA * 4));
 	}
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -544,14 +575,21 @@ u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, u32 index)
  */
 void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if (index < adev->doorbell.num_doorbells) {
 		writel(v, adev->doorbell.ptr + index);
 	} else {
 		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
 	}
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -588,14 +626,21 @@ u64 amdgpu_mm_rdoorbell64(struct amdgpu_device *adev, u32 index)
  */
 void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
 {
+	int idx;
+
 	if (adev->in_pci_err_recovery)
 		return;
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
+
 	if (index < adev->doorbell.num_doorbells) {
 		atomic64_set((atomic64_t *)(adev->doorbell.ptr + index), v);
 	} else {
 		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
 	}
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -682,6 +727,10 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device *adev,
 	unsigned long flags;
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
+	int idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
 
 	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
 	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
@@ -692,6 +741,8 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device *adev,
 	writel(reg_data, pcie_data_offset);
 	readl(pcie_data_offset);
 	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 /**
@@ -711,6 +762,10 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev,
 	unsigned long flags;
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
+	int idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return;
 
 	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
 	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
@@ -727,6 +782,8 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev,
 	writel((u32)(reg_data >> 32), pcie_data_offset);
 	readl(pcie_data_offset);
 	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index fe1a39f..1beb4e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -31,6 +31,8 @@
 #include "amdgpu_ras.h"
 #include "amdgpu_xgmi.h"
 
+#include <drm/drm_drv.h>
+
 /**
  * amdgpu_gmc_get_pde_for_bo - get the PDE for a BO
  *
@@ -98,6 +100,10 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
 {
 	void __iomem *ptr = (void *)cpu_pt_addr;
 	uint64_t value;
+	int idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return 0;
 
 	/*
 	 * The following is for PTE only. GART does not have PDEs.
@@ -105,6 +111,9 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
 	value = addr & 0x0000FFFFFFFFF000ULL;
 	value |= flags;
 	writeq(value, ptr + (gpu_page_idx * 8));
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 523d22d..89e2bfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -37,6 +37,8 @@
 
 #include "amdgpu_ras.h"
 
+#include <drm/drm_drv.h>
+
 static int psp_sysfs_init(struct amdgpu_device *adev);
 static void psp_sysfs_fini(struct amdgpu_device *adev);
 
@@ -248,7 +250,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		   struct psp_gfx_cmd_resp *cmd, uint64_t fence_mc_addr)
 {
 	int ret;
-	int index;
+	int index, idx;
 	int timeout = 2000;
 	bool ras_intr = false;
 	bool skip_unsupport = false;
@@ -256,6 +258,9 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	if (psp->adev->in_pci_err_recovery)
 		return 0;
 
+	if (!drm_dev_enter(&psp->adev->ddev, &idx))
+		return 0;
+
 	mutex_lock(&psp->mutex);
 
 	memset(psp->cmd_buf_mem, 0, PSP_CMD_BUFFER_SIZE);
@@ -266,8 +271,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	ret = psp_ring_cmd_submit(psp, psp->cmd_buf_mc_addr, fence_mc_addr, index);
 	if (ret) {
 		atomic_dec(&psp->fence_value);
-		mutex_unlock(&psp->mutex);
-		return ret;
+		goto exit;
 	}
 
 	amdgpu_asic_invalidate_hdp(psp->adev, NULL);
@@ -307,8 +311,8 @@ psp_cmd_submit_buf(struct psp_context *psp,
 			 psp->cmd_buf_mem->cmd_id,
 			 psp->cmd_buf_mem->resp.status);
 		if (!timeout) {
-			mutex_unlock(&psp->mutex);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto exit;
 		}
 	}
 
@@ -316,8 +320,10 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		ucode->tmr_mc_addr_lo = psp->cmd_buf_mem->resp.fw_addr_lo;
 		ucode->tmr_mc_addr_hi = psp->cmd_buf_mem->resp.fw_addr_hi;
 	}
-	mutex_unlock(&psp->mutex);
 
+exit:
+	mutex_unlock(&psp->mutex);
+	drm_dev_exit(idx);
 	return ret;
 }
 
@@ -354,8 +360,7 @@ static int psp_load_toc(struct psp_context *psp,
 	if (!cmd)
 		return -ENOMEM;
 	/* Copy toc to psp firmware private buffer */
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->toc_start_addr, psp->toc_bin_size);
+	psp_copy_fw(psp, psp->toc_start_addr, psp->toc_bin_size);
 
 	psp_prep_load_toc_cmd_buf(cmd, psp->fw_pri_mc_addr, psp->toc_bin_size);
 
@@ -570,8 +575,7 @@ static int psp_asd_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->asd_start_addr, psp->asd_ucode_size);
+	psp_copy_fw(psp, psp->asd_start_addr, psp->asd_ucode_size);
 
 	psp_prep_asd_load_cmd_buf(cmd, psp->fw_pri_mc_addr,
 				  psp->asd_ucode_size);
@@ -726,8 +730,7 @@ static int psp_xgmi_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
+	psp_copy_fw(psp, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -982,8 +985,7 @@ static int psp_ras_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
+	psp_copy_fw(psp, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -1219,8 +1221,7 @@ static int psp_hdcp_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_hdcp_start_addr,
+	psp_copy_fw(psp, psp->ta_hdcp_start_addr,
 	       psp->ta_hdcp_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
@@ -1366,8 +1367,7 @@ static int psp_dtm_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
+	psp_copy_fw(psp, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -1507,8 +1507,7 @@ static int psp_rap_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
+	psp_copy_fw(psp, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -2778,6 +2777,20 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 	return count;
 }
 
+void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size)
+{
+	int idx;
+
+	if (!drm_dev_enter(&psp->adev->ddev, &idx))
+		return;
+
+	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
+	memcpy(psp->fw_pri_buf, start_addr, bin_size);
+
+	drm_dev_exit(idx);
+}
+
+
 static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
 		   psp_usbc_pd_fw_sysfs_read,
 		   psp_usbc_pd_fw_sysfs_write);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index da250bc..ac69314 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -400,4 +400,7 @@ int psp_init_ta_microcode(struct psp_context *psp,
 			  const char *chip_name);
 int psp_get_fw_attestation_records_addr(struct psp_context *psp,
 					uint64_t *output_ptr);
+
+void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 1a612f5..d656494 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -35,6 +35,8 @@
 #include "amdgpu.h"
 #include "atom.h"
 
+#include <drm/drm_drv.h>
+
 /*
  * Rings
  * Most engines on the GPU are fed via ring buffers.  Ring
@@ -463,3 +465,71 @@ int amdgpu_ring_test_helper(struct amdgpu_ring *ring)
 	ring->sched.ready = !r;
 	return r;
 }
+
+void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
+{
+	int idx;
+	int i = 0;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	while (i <= ring->buf_mask)
+		ring->ring[i++] = ring->funcs->nop;
+
+	drm_dev_exit(idx);
+
+}
+
+void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
+{
+	int idx;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	if (ring->count_dw <= 0)
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+	ring->ring[ring->wptr++ & ring->buf_mask] = v;
+	ring->wptr &= ring->ptr_mask;
+	ring->count_dw--;
+
+	drm_dev_exit(idx);
+}
+
+void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
+					      void *src, int count_dw)
+{
+	unsigned occupied, chunk1, chunk2;
+	void *dst;
+	int idx;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	if (unlikely(ring->count_dw < count_dw))
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+
+	occupied = ring->wptr & ring->buf_mask;
+	dst = (void *)&ring->ring[occupied];
+	chunk1 = ring->buf_mask + 1 - occupied;
+	chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
+	chunk2 = count_dw - chunk1;
+	chunk1 <<= 2;
+	chunk2 <<= 2;
+
+	if (chunk1)
+		memcpy(dst, src, chunk1);
+
+	if (chunk2) {
+		src += chunk1;
+		dst = (void *)ring->ring;
+		memcpy(dst, src, chunk2);
+	}
+
+	ring->wptr += count_dw;
+	ring->wptr &= ring->ptr_mask;
+	ring->count_dw -= count_dw;
+
+	drm_dev_exit(idx);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index accb243..f90b81f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -300,53 +300,12 @@ static inline void amdgpu_ring_set_preempt_cond_exec(struct amdgpu_ring *ring,
 	*ring->cond_exe_cpu_addr = cond_exec;
 }
 
-static inline void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
-{
-	int i = 0;
-	while (i <= ring->buf_mask)
-		ring->ring[i++] = ring->funcs->nop;
-
-}
-
-static inline void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
-{
-	if (ring->count_dw <= 0)
-		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
-	ring->ring[ring->wptr++ & ring->buf_mask] = v;
-	ring->wptr &= ring->ptr_mask;
-	ring->count_dw--;
-}
+void amdgpu_ring_clear_ring(struct amdgpu_ring *ring);
 
-static inline void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
-					      void *src, int count_dw)
-{
-	unsigned occupied, chunk1, chunk2;
-	void *dst;
-
-	if (unlikely(ring->count_dw < count_dw))
-		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
-
-	occupied = ring->wptr & ring->buf_mask;
-	dst = (void *)&ring->ring[occupied];
-	chunk1 = ring->buf_mask + 1 - occupied;
-	chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
-	chunk2 = count_dw - chunk1;
-	chunk1 <<= 2;
-	chunk2 <<= 2;
+void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v);
 
-	if (chunk1)
-		memcpy(dst, src, chunk1);
-
-	if (chunk2) {
-		src += chunk1;
-		dst = (void *)ring->ring;
-		memcpy(dst, src, chunk2);
-	}
-
-	ring->wptr += count_dw;
-	ring->wptr &= ring->ptr_mask;
-	ring->count_dw -= count_dw;
-}
+void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
+					      void *src, int count_dw);
 
 int amdgpu_ring_test_helper(struct amdgpu_ring *ring);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bd4248c..b3ce5be 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -269,10 +269,8 @@ static int psp_v11_0_bootloader_load_kdb(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP KDB binary to memory */
-	memcpy(psp->fw_pri_buf, psp->kdb_start_addr, psp->kdb_bin_size);
+	psp_copy_fw(psp, psp->kdb_start_addr, psp->kdb_bin_size);
 
 	/* Provide the PSP KDB to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -302,10 +300,8 @@ static int psp_v11_0_bootloader_load_spl(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP SPL binary to memory */
-	memcpy(psp->fw_pri_buf, psp->spl_start_addr, psp->spl_bin_size);
+	psp_copy_fw(psp, psp->spl_start_addr, psp->spl_bin_size);
 
 	/* Provide the PSP SPL to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -335,10 +331,8 @@ static int psp_v11_0_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -371,10 +365,8 @@ static int psp_v11_0_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index c4828bd..618e5b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -138,10 +138,8 @@ static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -179,10 +177,8 @@ static int psp_v12_0_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index f2e725f..d0a6cccd 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -102,10 +102,8 @@ static int psp_v3_1_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -143,10 +141,8 @@ static int psp_v3_1_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
