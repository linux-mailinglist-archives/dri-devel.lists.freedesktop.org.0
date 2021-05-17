Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA8383D72
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2F26EA45;
	Mon, 17 May 2021 19:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459F6EA3E;
 Mon, 17 May 2021 19:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUToboc71kjzvnXpLqj6nAx/l8KxFKqzKmvaAkMYWb+h5biKEjf8HDtIaF6Wi2rRMc5Sbv+mt1lBIulySXW8FvWeWBk6wB+FnPB1jsIiK8m4wgdTO8ILiitdfyZYFlvRUgzcYQtqX9+XOz6FILwMZkf6pEBC/ROsfHL6dXo/d2HnXR/36CPVXvv88/GqhbprrQPcO2NlUna/zxCTYKQ0gfQxHp9EfsAXLiKJ7G6F0zXG2ZK60dzADER6YnLQDgh6e/vKgjynB20eut7mIwkalchEb49AJ4SJDvdF8uoq3hH5q1GfyJeBJ9y3n7zStnSwLxZpwXOJ+RXpMpy6jq9P/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7LSX2I7cMfruh3XKRC8e6ePPSNt5CVI7tBXe8C+fas=;
 b=MLpdIRxiQe+4Eow6GdmzAVN7pDK55WtYh21enK+vtVKXJk4M6GDdf48A1O+uekpqMhBibNERtMxIzldP29jJ4w7RXq/H0qP0TX2AzixUjtvBbEIrL2YbO7P29bJC0AYA5wUXWqX/lUrq1Z5QIpSl4eh6dKRc+wwQY1n7FULI6D2kAHnDHm6s6HZs/l2mGP1UA0sWzxF6SixctaQY3ArFiDAGOFtb4GLzu3pPCJtwKuDPbreSkLEl5wrE78gqY8EmGzXG1F50txhgSRH+qq5hicY2jqtHl6YHeVNSFTJTGc6ZNk/PJmZTnOleXClPivrnmC96Jboar4rSSMtT6O5VlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7LSX2I7cMfruh3XKRC8e6ePPSNt5CVI7tBXe8C+fas=;
 b=5tnCw95JC8T1VHw3uf0TaTaE53TUW3bvzLSk2okFJg24xW0L6NARX1xVtK49cedd239AWCRXKxpvxBtlU31oXnkJ2SW6ORTBPwIvgER2e900CniJ6Kr1hx+L/Wj89Um/jxYnOZahdZ80IA1NmW/9shlHXNbmTgmrX+/4L+iifOU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 19:31:25 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:31:25 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH] drm/amdgpu: Unmap all MMIO mappings
Date: Mon, 17 May 2021 15:31:05 -0400
Message-Id: <20210517193105.491461-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
References: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 17 May 2021 19:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a195de84-47c6-49a0-25be-08d9196a5c48
X-MS-TrafficTypeDiagnostic: SA0PR12MB4494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB449466EAF4DF182FE3FB1392EA2D9@SA0PR12MB4494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COXc7aVL6C6sXUCh+97j1tVR0DE8lFx+e15H+g+w3yQfqZLjNhN049VCyQcgrz6R1bScHVd7NN34ddT74JMy7awH/7qwx1anXk2hH+hQ9hFa/+ovEAnVpBqJ6lkUsjrK2HTNklGI6AIAfmD2G8RgNdvv4ml5JkL3n5kP7b13f+i+n8Gg9kyqvVYf7YIvae7tWgXw8AMU3XtOUtiP83OM7i0EzrSksfsVxA7Id9eK+8qfvvm9LlaQVhyz8DIFTlik0CdSMdvCCQf6lhwIpZkQxwV8DxRaQ4sy8ggMq40jteV6b2jP2RsqeYbw0V3w8zXTJQN1uv6AMlHI/1TCxEXUkAhE6Xiw0hW/RGzPH7xe8WKTyxfU6XW3S2DP8AQANx7LyBr1Omul0G1f9Iiyn4GQTM/oyGQLwcbq5zdvVYgm4wCI0SealiieQPtpFkP9mS29mPC1gaK3pqqZuEZ1E4+G0t+7M3dofWCZZ7t5ZtZHD4lUoJrP5UrqBaV36jY+MmeAG21D26vMMsG/pJj1+Vt2rwYWNUtMq7KWUIMW+yIdrkjaGCME+lUN3JRNB5iaEROC5nIPuioyi2bwmMz/4Rt6JVKtbayLNKd6k2GBxmpKfQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(66946007)(66556008)(6636002)(8936002)(66476007)(83380400001)(6512007)(86362001)(8676002)(38100700002)(186003)(1076003)(2906002)(6506007)(478600001)(2616005)(316002)(16526019)(44832011)(6666004)(5660300002)(36756003)(52116002)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZeZ1deJjbIfe6NpCjRAA5pdkxoBsNUg15GV9FnmayNdN7GLOnQWtfd3f2UVR?=
 =?us-ascii?Q?qZpAdTONp1wBwSTO4xy1Dxu05kUZfNgqNie85+6u4mqjFuHUXx6uevQnCDmb?=
 =?us-ascii?Q?xArTBfWZL0Q91Eu78BVMAKYbdr5zdYVCg13QUPhPHJihmzKvaMWXOutmBeeY?=
 =?us-ascii?Q?hUucXGcon3mGnxhq+UR2JyWYfvIwB/RhUCJTijW4my39sE9Hl5LnMp7Wi3vj?=
 =?us-ascii?Q?/H8WUUpe2/35cEMK2cqcORct1QlCtD34n9u4Z606KUuPbmOpdZbc5zY40oLH?=
 =?us-ascii?Q?lh9xcGQmC4uBbTSXo/P+amvvlEizdrHyMfeQKtEBJAlYncQoRf41T2bdlrkJ?=
 =?us-ascii?Q?NGguKk6FuPiJAtYDtILM2W8cPfv+6KlEbBR4dO5wGl91hrcOzY7JmMqivyra?=
 =?us-ascii?Q?P4c6cHMTVuGAQN4NYl51PXzP+EEn5mnT0H0UDE3vxgBwwcJzUprCZ65VVvM/?=
 =?us-ascii?Q?vJse0GDnIN+cuTnNR4bZq9AroQ8WToVz3/8ROGni2pnGwQxVtCW3nnL69GG8?=
 =?us-ascii?Q?YUoRGmeZEKUKiPMn80JnqWdVTN/a5AxeHitHP3wlJlDixm+pjXzsIFYRJjpM?=
 =?us-ascii?Q?Ct4YPKqd2bpT8be8znnZX2QT9rqwugUp+J2Or3IE4D13GsEiDqT03MYaiGBk?=
 =?us-ascii?Q?A7/2KwOfmwH/mVaHsibZyTuqNyt+YrukHtLQKuuBp5Ff/yPEa9tkn+algOFY?=
 =?us-ascii?Q?OLLkgVJwLC1gNFdr2+S+bduQMM5NYOmf3Dt3UlgrH0IPUSFdb1P4VwK04hlG?=
 =?us-ascii?Q?X4ZIRL28DT1Uwpq3D7mQb5oC2za9T5XQy9q2Z93rp+m5dijgUJqkjq8WHQDG?=
 =?us-ascii?Q?9m8SjLEKcXPnOuz8BLsccE74iHaiOJqHl6ti9do4JW5UW38dv6pH5FHrfrOe?=
 =?us-ascii?Q?05RUHPNSuDnBYUdCAQsiEro4BdCCxFf2HL15LT11Si0gp59w0qkUOd4Mqo7s?=
 =?us-ascii?Q?+cxYLrbYJiPs87tguXvDLbaIFnYNUWRR23bWX2UxL4ili2adByGH0KPym+Jt?=
 =?us-ascii?Q?KaSbcQ5uH0RsNpVSSLTJDjd0nVu0EkTreyguPDI2854Q+VZDMhbakOryYKCc?=
 =?us-ascii?Q?cvM8L9cVFpiTNxzgxJF6TIrkbSBBOcoV3ShhqWlQ1cl/RoryRovuXjJ585LY?=
 =?us-ascii?Q?SUau89wTiNgISdqMRQWIyM8NzUFltzgXeL/U8UoNY0Iw3NxYa/NGbWM9ifmw?=
 =?us-ascii?Q?jK7oP4mfIxT42e5BF0SBeZvEqlJVzIXB9SZjs6i58Qs/+ZL7WcT8Mi0PawGN?=
 =?us-ascii?Q?xIXuVDnvUnAipq9I2r6d4Z+Pa8T0iPiTeMM5iDudYXOPO3wSGJCSH9JB8GU9?=
 =?us-ascii?Q?SfKeNExTsYMb4JadbFgwM2WURPuBvu5iZ4I/MqVXTRsESMU6YP7xSGfdsP9W?=
 =?us-ascii?Q?sU9GksExswtsTZ6scpDdV0oL8oB7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a195de84-47c6-49a0-25be-08d9196a5c48
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:31:25.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLPSTWH5yGkv9buONKN4ahTbnnrWy28677mbz9KKcuhBZyMKWAjwwJROyuB+CzSVz/vLxExAq9GovI+QqXlbJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Access to those must be prevented post pci_remove

v6: Drop BOs list, unampping VRAM BAR is enough.
v8:
Add condition of xgmi.connected_to_cpu to MTTR
handling and remove MTTR handling from the old place.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f7cca25c0fa0..8b50315d1fe1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3666,6 +3666,27 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	return r;
 }
 
+static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
+{
+	/* Clear all CPU mappings pointing to this device */
+	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
+
+	/* Unmap all mapped bars - Doorbell, registers and VRAM */
+	amdgpu_device_doorbell_fini(adev);
+
+	iounmap(adev->rmmio);
+	adev->rmmio = NULL;
+	if (adev->mman.aper_base_kaddr)
+		iounmap(adev->mman.aper_base_kaddr);
+	adev->mman.aper_base_kaddr = NULL;
+
+	/* Memory manager related */
+	if (!adev->gmc.xgmi.connected_to_cpu) {
+		arch_phys_wc_del(adev->gmc.vram_mtrr);
+		arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
+	}
+}
+
 /**
  * amdgpu_device_fini - tear down the driver
  *
@@ -3712,6 +3733,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_device_ip_fini_early(adev);
 
 	amdgpu_gart_dummy_page_fini(adev);
+
+	amdgpu_device_unmap_mmio(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
@@ -3739,9 +3762,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	}
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, NULL, NULL, NULL);
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
-	amdgpu_device_doorbell_fini(adev);
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 0adffcace326..8eabe3c9ad17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1107,10 +1107,6 @@ int amdgpu_bo_init(struct amdgpu_device *adev)
 void amdgpu_bo_fini(struct amdgpu_device *adev)
 {
 	amdgpu_ttm_fini(adev);
-	if (!adev->gmc.xgmi.connected_to_cpu) {
-		arch_phys_wc_del(adev->gmc.vram_mtrr);
-		arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
-	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0d54e70278ca..58ad2fecc9e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
 	amdgpu_ttm_fw_reserve_vram_fini(adev);
 
-	if (adev->mman.aper_base_kaddr)
-		iounmap(adev->mman.aper_base_kaddr);
-	adev->mman.aper_base_kaddr = NULL;
-
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
 	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
-- 
2.25.1

