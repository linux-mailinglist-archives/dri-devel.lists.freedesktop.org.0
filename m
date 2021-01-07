Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4712EC881
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771C36E3EC;
	Thu,  7 Jan 2021 03:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6546E3E5;
 Thu,  7 Jan 2021 03:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIjn+0248YfQx043dgREdIbUg3oURnj+27S/NRDOP2eHkbdUTIr1OVjWalzqTU3J7bnCJMsxKLyTVpCRlals38lHtSNVyQmpuNyb6pkThoPXSyOLv2YePlf0GcfF9q0fHQJj1aAZAv0M3xDoDhh9qOjui/L6GzDkBMnVhO/mLCES/kJBQS7qGN7TSnBhFa9fF+yxb9K/uWko62w6Ed/xaqlnKGkBCj4M4l1+jxl0x0DNtS4l2GuESU7wkRhlODe2nFrgzQcHihCNf46iEVA2wCXJcjFowK5Ur6Xue9opV+yM4+gySfbc8Q71H+CD2uCUKdMMo1rCXcHc/WK0eOVqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7z03Aa8iWb5N9EGKtByPE2AgEK9UxmidZ2MScKNl3s=;
 b=ng1EWD5kX46kuMBwgujjRaddeiv/EffwtXU6mYa0P0J4yn6Kxa849BrG0WnfmDtD952hu1hQyG1NE/Nltlx64oy/T0IbKJcTYlP/3ftfjXQFD2OLVOxIM8Wr+aRU1W2YDI8f71DMW2zQtb/gddtBgPnQiHSkC56N9TDDGGPaq8UBvrhejj56+bAI9N0Er6UilTCEXhkXqq6CgFwxqyygr242xFjjtx51669FkvCTRnhBRt2dQ/fj99TnWZW9lYYGkifIz5llL+6mxLOs/QcR+BCXpKV2qO8Oxxo/dot6AWw9KlQOdF4TBoaU6tx8DrJ/U7PhK7ribk8RphG4VqdJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7z03Aa8iWb5N9EGKtByPE2AgEK9UxmidZ2MScKNl3s=;
 b=AqzYQppqvRHerhAYneiVNlGY8Pz6uol1moH0r3RfFFiICyl7Y+PW0Szj+T5wq51DJx0kdutDITE0KttBm7Arez8W3R4PUJPpufP0ApE8vqsGDawEN4vouOAncEVBb/u8PKQQ+fEcQ68bFmerN2qkegslirmFnM69ZEgRY3fq6MU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:47 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:47 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/35] drm/amdgpu: replace per_device_list by array
Date: Wed,  6 Jan 2021 22:00:54 -0500
Message-Id: <20210107030127.20393-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 903ca109-1197-4ab5-07f3-08d8b2b8b60b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39997FD0EA5E84B1422DB53E92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymW4ADUUIduVl7dyy5N7Yenc0dogB8B50Vh0ehelId1P7DX4+Cxffs2yxmy2ssT0mBaYNeRbKZSpnVdBQic75bAVFDxli+Mg+IKnxGzPcseCHdGTR0rX0DMfciFaz+goaMBXMwIPc6jXrYcAmla90vA6gsvh1xMKxvCTjJ4OacLHf1BQoesvYzjZWGNV0T/U+JC2UAZ+WlyG8Ffeh52SqgWRXdgcFs+tFjXb/JvTIMgouow+M7MFkSCA44rmDNHLTFGNHiy0jgySMLSLJt9pb26sJEb21vXAcheXDbW0C2rcCF68wRARjBoSHHhw2CoP3V+xFTgQAdak2mROlaC29gMhcbeSq8SMfljaif70wXLF4t1QSDi0C7d3sa2XtxQZ59fVIOtT4BC/WGzO/WlgKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(30864003)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AtduEtZyfsbNjg7x7KLaPugMwDaBOPYRkcB55drrX9NwSS2zI5+lSxhEcA6I?=
 =?us-ascii?Q?m1ZB1mzUOWNM09CFIQEDnZU/WZgqj7RNBbyuM1rJzLVer5v+UW/kNZsc/bUb?=
 =?us-ascii?Q?wIexesEPkWzJ5Ewz0IGavo6EKTl2p9gUJV+QrQlcB0Ww5EVNhcTsIm5WbGOj?=
 =?us-ascii?Q?W4ebvsiAbl4rT6FxkWtABsu6suex++gDwNnjbxDmuiMuHzDUo4wGqqVsztYo?=
 =?us-ascii?Q?TSNOGcu70zPsAzja7cyMfRcVWitNGFNuLcYH6AzzYsNP/Ttysl1Hvc63I3uy?=
 =?us-ascii?Q?YQyA5dOG9eoB0qxzed143VaWhngm3/wQsV4KUTBNGArMLzf09KKt05O5iNqj?=
 =?us-ascii?Q?UzCNiteUzbe7uVC97APFlGTFKaqubcIk7XCzQkIpo+I1x7kY6ZtJLSPIEx0Y?=
 =?us-ascii?Q?SbGKCneIlT4ULteuXfF0fLOSDyxXM/6vygyQcIcRKTZ9O7EyqHpP/3Hk8xPy?=
 =?us-ascii?Q?pEJEBW7/iAvFDUml4PFf8FV7F8XYhIVBBJc35KBSmgr5wfw2CfpvRjll3Ou8?=
 =?us-ascii?Q?l4qAxFfyaGj2w0GwK1aamV6v0xzzU/jMhOxIBiSTLjxqTMdPWvi/cz9SfXBK?=
 =?us-ascii?Q?OyXGyHoi2nC0zXJldGnLMQ9wUBZHI3QjPN7rmSWDT9/+j8oJ0OGG5Qtq/p1Q?=
 =?us-ascii?Q?xgfU6VPSKKUqQLZ7OhTh8+lQundBS6aZUUDbKQkXYW0vi45flNi7yFZj8hsw?=
 =?us-ascii?Q?IpZe5xxUgH9nlBF7CY32crdRcwZWxGDVyp5Qtn7OfT6xQkVE+Qerl0ifxwJX?=
 =?us-ascii?Q?ixjKl7vXzAK2NnR+5HhgGODDTppnUqFtEJs7YhR/Ssi6gWiA290YtD9Up3lH?=
 =?us-ascii?Q?zFuSTxGCtKKGy4hBWj/yrO2NdPoG6dG/iBRXmbNBOz4YhgD1H4DZQ0epvQX2?=
 =?us-ascii?Q?4z1Hn34LmLIfKCI8jDO3pbAOkox/Wca4vT6SuphGxx3GoujrrkAzNR/xgJwG?=
 =?us-ascii?Q?Mx25nf88Bu+XFK+Dg1PrlNt+cbDsxZB3/F+9QnoXoMY3ci5S8HIg1uWFTSVy?=
 =?us-ascii?Q?Djgg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:46.9752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 903ca109-1197-4ab5-07f3-08d8b2b8b60b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzWUB05qnRvssEU0qQU6KRa5VLywYzRtIazTbaybSF4DzjZbtEZUNdYheudQWKmIcuzuCNIvmeydha2/D48zEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Remove per_device_list from kfd_process and replace it with a
kfd_process_device pointers array of MAX_GPU_INSTANCES size. This helps
to manage the kfd_process_devices binded to a specific kfd_process.
Also, functions used by kfd_chardev to iterate over the list were
removed, since they are not valid anymore. Instead, it was replaced by a
local loop iterating the array.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 116 ++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  20 +--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 108 ++++++++--------
 .../amd/amdkfd/kfd_process_queue_manager.c    |   6 +-
 5 files changed, 111 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 8cc51cec988a..8c87afce12df 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -874,52 +874,47 @@ static int kfd_ioctl_get_process_apertures(struct file *filp,
 {
 	struct kfd_ioctl_get_process_apertures_args *args = data;
 	struct kfd_process_device_apertures *pAperture;
-	struct kfd_process_device *pdd;
+	int i;
 
 	dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
 
 	args->num_of_nodes = 0;
 
 	mutex_lock(&p->mutex);
+	/* Run over all pdd of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		pAperture =
+			&args->process_apertures[args->num_of_nodes];
+		pAperture->gpu_id = pdd->dev->id;
+		pAperture->lds_base = pdd->lds_base;
+		pAperture->lds_limit = pdd->lds_limit;
+		pAperture->gpuvm_base = pdd->gpuvm_base;
+		pAperture->gpuvm_limit = pdd->gpuvm_limit;
+		pAperture->scratch_base = pdd->scratch_base;
+		pAperture->scratch_limit = pdd->scratch_limit;
 
-	/*if the process-device list isn't empty*/
-	if (kfd_has_process_device_data(p)) {
-		/* Run over all pdd of the process */
-		pdd = kfd_get_first_process_device_data(p);
-		do {
-			pAperture =
-				&args->process_apertures[args->num_of_nodes];
-			pAperture->gpu_id = pdd->dev->id;
-			pAperture->lds_base = pdd->lds_base;
-			pAperture->lds_limit = pdd->lds_limit;
-			pAperture->gpuvm_base = pdd->gpuvm_base;
-			pAperture->gpuvm_limit = pdd->gpuvm_limit;
-			pAperture->scratch_base = pdd->scratch_base;
-			pAperture->scratch_limit = pdd->scratch_limit;
-
-			dev_dbg(kfd_device,
-				"node id %u\n", args->num_of_nodes);
-			dev_dbg(kfd_device,
-				"gpu id %u\n", pdd->dev->id);
-			dev_dbg(kfd_device,
-				"lds_base %llX\n", pdd->lds_base);
-			dev_dbg(kfd_device,
-				"lds_limit %llX\n", pdd->lds_limit);
-			dev_dbg(kfd_device,
-				"gpuvm_base %llX\n", pdd->gpuvm_base);
-			dev_dbg(kfd_device,
-				"gpuvm_limit %llX\n", pdd->gpuvm_limit);
-			dev_dbg(kfd_device,
-				"scratch_base %llX\n", pdd->scratch_base);
-			dev_dbg(kfd_device,
-				"scratch_limit %llX\n", pdd->scratch_limit);
-
-			args->num_of_nodes++;
-
-			pdd = kfd_get_next_process_device_data(p, pdd);
-		} while (pdd && (args->num_of_nodes < NUM_OF_SUPPORTED_GPUS));
-	}
+		dev_dbg(kfd_device,
+			"node id %u\n", args->num_of_nodes);
+		dev_dbg(kfd_device,
+			"gpu id %u\n", pdd->dev->id);
+		dev_dbg(kfd_device,
+			"lds_base %llX\n", pdd->lds_base);
+		dev_dbg(kfd_device,
+			"lds_limit %llX\n", pdd->lds_limit);
+		dev_dbg(kfd_device,
+			"gpuvm_base %llX\n", pdd->gpuvm_base);
+		dev_dbg(kfd_device,
+			"gpuvm_limit %llX\n", pdd->gpuvm_limit);
+		dev_dbg(kfd_device,
+			"scratch_base %llX\n", pdd->scratch_base);
+		dev_dbg(kfd_device,
+			"scratch_limit %llX\n", pdd->scratch_limit);
 
+		if (++args->num_of_nodes >= NUM_OF_SUPPORTED_GPUS)
+			break;
+	}
 	mutex_unlock(&p->mutex);
 
 	return 0;
@@ -930,9 +925,8 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 {
 	struct kfd_ioctl_get_process_apertures_new_args *args = data;
 	struct kfd_process_device_apertures *pa;
-	struct kfd_process_device *pdd;
-	uint32_t nodes = 0;
 	int ret;
+	int i;
 
 	dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
 
@@ -941,17 +935,7 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 		 * sufficient memory
 		 */
 		mutex_lock(&p->mutex);
-
-		if (!kfd_has_process_device_data(p))
-			goto out_unlock;
-
-		/* Run over all pdd of the process */
-		pdd = kfd_get_first_process_device_data(p);
-		do {
-			args->num_of_nodes++;
-			pdd = kfd_get_next_process_device_data(p, pdd);
-		} while (pdd);
-
+		args->num_of_nodes = p->n_pdds;
 		goto out_unlock;
 	}
 
@@ -966,22 +950,23 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 
 	mutex_lock(&p->mutex);
 
-	if (!kfd_has_process_device_data(p)) {
+	if (!p->n_pdds) {
 		args->num_of_nodes = 0;
 		kfree(pa);
 		goto out_unlock;
 	}
 
 	/* Run over all pdd of the process */
-	pdd = kfd_get_first_process_device_data(p);
-	do {
-		pa[nodes].gpu_id = pdd->dev->id;
-		pa[nodes].lds_base = pdd->lds_base;
-		pa[nodes].lds_limit = pdd->lds_limit;
-		pa[nodes].gpuvm_base = pdd->gpuvm_base;
-		pa[nodes].gpuvm_limit = pdd->gpuvm_limit;
-		pa[nodes].scratch_base = pdd->scratch_base;
-		pa[nodes].scratch_limit = pdd->scratch_limit;
+	for (i = 0; i < min(p->n_pdds, args->num_of_nodes); i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		pa[i].gpu_id = pdd->dev->id;
+		pa[i].lds_base = pdd->lds_base;
+		pa[i].lds_limit = pdd->lds_limit;
+		pa[i].gpuvm_base = pdd->gpuvm_base;
+		pa[i].gpuvm_limit = pdd->gpuvm_limit;
+		pa[i].scratch_base = pdd->scratch_base;
+		pa[i].scratch_limit = pdd->scratch_limit;
 
 		dev_dbg(kfd_device,
 			"gpu id %u\n", pdd->dev->id);
@@ -997,17 +982,14 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 			"scratch_base %llX\n", pdd->scratch_base);
 		dev_dbg(kfd_device,
 			"scratch_limit %llX\n", pdd->scratch_limit);
-		nodes++;
-
-		pdd = kfd_get_next_process_device_data(p, pdd);
-	} while (pdd && (nodes < args->num_of_nodes));
+	}
 	mutex_unlock(&p->mutex);
 
-	args->num_of_nodes = nodes;
+	args->num_of_nodes = i;
 	ret = copy_to_user(
 			(void __user *)args->kfd_process_device_apertures_ptr,
 			pa,
-			(nodes * sizeof(struct kfd_process_device_apertures)));
+			(i * sizeof(struct kfd_process_device_apertures)));
 	kfree(pa);
 	return ret ? -EFAULT : 0;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index 5a64915abaf7..1a266b78f0d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -131,11 +131,11 @@ int kfd_iommu_bind_process_to_device(struct kfd_process_device *pdd)
  */
 void kfd_iommu_unbind_process(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		if (pdd->bound == PDD_BOUND)
-			amd_iommu_unbind_pasid(pdd->dev->pdev, p->pasid);
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i]->bound == PDD_BOUND)
+			amd_iommu_unbind_pasid(p->pdds[i]->dev->pdev, p->pasid);
 }
 
 /* Callback for process shutdown invoked by the IOMMU driver */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index e2ebd5a1d4de..d9f8d3d48aac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -45,6 +45,7 @@
 #include <linux/swap.h>
 
 #include "amd_shared.h"
+#include "amdgpu.h"
 
 #define KFD_MAX_RING_ENTRY_SIZE	8
 
@@ -644,12 +645,6 @@ enum kfd_pdd_bound {
 
 /* Data that is per-process-per device. */
 struct kfd_process_device {
-	/*
-	 * List of all per-device data for a process.
-	 * Starts from kfd_process.per_device_data.
-	 */
-	struct list_head per_device_list;
-
 	/* The device that owns this data. */
 	struct kfd_dev *dev;
 
@@ -766,10 +761,11 @@ struct kfd_process {
 	uint16_t pasid;
 
 	/*
-	 * List of kfd_process_device structures,
+	 * Array of kfd_process_device pointers,
 	 * one for each device the process is using.
 	 */
-	struct list_head per_device_data;
+	struct kfd_process_device *pdds[MAX_GPU_INSTANCE];
+	uint32_t n_pdds;
 
 	struct process_queue_manager pqm;
 
@@ -867,14 +863,6 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
 
-/* Process device data iterator */
-struct kfd_process_device *kfd_get_first_process_device_data(
-							struct kfd_process *p);
-struct kfd_process_device *kfd_get_next_process_device_data(
-						struct kfd_process *p,
-						struct kfd_process_device *pdd);
-bool kfd_has_process_device_data(struct kfd_process *p);
-
 /* PASIDs */
 int kfd_pasid_init(void);
 void kfd_pasid_exit(void);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 2807e1c4d59b..031e752e3154 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -505,7 +505,7 @@ static int kfd_sysfs_create_file(struct kfd_process *p, struct attribute *attr,
 static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 {
 	int ret = 0;
-	struct kfd_process_device *pdd;
+	int i;
 	char stats_dir_filename[MAX_SYSFS_FILENAME_LEN];
 
 	if (!p)
@@ -520,7 +520,8 @@ static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 	 * - proc/<pid>/stats_<gpuid>/evicted_ms
 	 * - proc/<pid>/stats_<gpuid>/cu_occupancy
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 		struct kobject *kobj_stats;
 
 		snprintf(stats_dir_filename, MAX_SYSFS_FILENAME_LEN,
@@ -571,7 +572,7 @@ static int kfd_procfs_add_sysfs_stats(struct kfd_process *p)
 static int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 {
 	int ret = 0;
-	struct kfd_process_device *pdd;
+	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -584,7 +585,9 @@ static int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 	 * - proc/<pid>/vram_<gpuid>
 	 * - proc/<pid>/sdma_<gpuid>
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		snprintf(pdd->vram_filename, MAX_SYSFS_FILENAME_LEN, "vram_%u",
 			 pdd->dev->id);
 		ret = kfd_sysfs_create_file(p, &pdd->attr_vram, pdd->vram_filename);
@@ -875,21 +878,23 @@ void kfd_unref_process(struct kfd_process *p)
 	kref_put(&p->ref, kfd_process_ref_release);
 }
 
+
 static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 {
 	struct kfd_process *p = pdd->process;
 	void *mem;
 	int id;
+	int i;
 
 	/*
 	 * Remove all handles from idr and release appropriate
 	 * local memory object
 	 */
 	idr_for_each_entry(&pdd->alloc_idr, mem, id) {
-		struct kfd_process_device *peer_pdd;
 
-		list_for_each_entry(peer_pdd, &p->per_device_data,
-				    per_device_list) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *peer_pdd = p->pdds[i];
+
 			if (!peer_pdd->vm)
 				continue;
 			amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
@@ -903,18 +908,19 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 
 static void kfd_process_free_outstanding_kfd_bos(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		kfd_process_device_free_bos(pdd);
+	for (i = 0; i < p->n_pdds; i++)
+		kfd_process_device_free_bos(p->pdds[i]);
 }
 
 static void kfd_process_destroy_pdds(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd, *temp;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 
-	list_for_each_entry_safe(pdd, temp, &p->per_device_data,
-				 per_device_list) {
 		pr_debug("Releasing pdd (topology id %d) for process (pasid 0x%x)\n",
 				pdd->dev->id, p->pasid);
 
@@ -927,8 +933,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 			amdgpu_amdkfd_gpuvm_destroy_process_vm(
 				pdd->dev->kgd, pdd->vm);
 
-		list_del(&pdd->per_device_list);
-
 		if (pdd->qpd.cwsr_kaddr && !pdd->qpd.cwsr_base)
 			free_pages((unsigned long)pdd->qpd.cwsr_kaddr,
 				get_order(KFD_CWSR_TBA_TMA_SIZE));
@@ -949,7 +953,9 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		}
 
 		kfree(pdd);
+		p->pdds[i] = NULL;
 	}
+	p->n_pdds = 0;
 }
 
 /* No process locking is needed in this function, because the process
@@ -961,7 +967,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 {
 	struct kfd_process *p = container_of(work, struct kfd_process,
 					     release_work);
-	struct kfd_process_device *pdd;
+	int i;
 
 	/* Remove the procfs files */
 	if (p->kobj) {
@@ -970,7 +976,9 @@ static void kfd_process_wq_release(struct work_struct *work)
 		kobject_put(p->kobj_queues);
 		p->kobj_queues = NULL;
 
-		list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
 			sysfs_remove_file(p->kobj, &pdd->attr_vram);
 			sysfs_remove_file(p->kobj, &pdd->attr_sdma);
 			sysfs_remove_file(p->kobj, &pdd->attr_evict);
@@ -1020,7 +1028,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 					struct mm_struct *mm)
 {
 	struct kfd_process *p;
-	struct kfd_process_device *pdd = NULL;
+	int i;
 
 	/*
 	 * The kfd_process structure can not be free because the
@@ -1044,8 +1052,8 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 	 * pdd is in debug mode, we should first force unregistration,
 	 * then we will be able to destroy the queues
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
-		struct kfd_dev *dev = pdd->dev;
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
 
 		mutex_lock(kfd_get_dbgmgr_mutex());
 		if (dev && dev->dbgmgr && dev->dbgmgr->pasid == p->pasid) {
@@ -1081,11 +1089,11 @@ static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
 static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 {
 	unsigned long  offset;
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
-		struct kfd_dev *dev = pdd->dev;
-		struct qcm_process_device *qpd = &pdd->qpd;
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
+		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
 
 		if (!dev->cwsr_enabled || qpd->cwsr_kaddr || qpd->cwsr_base)
 			continue;
@@ -1162,7 +1170,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	mutex_init(&process->mutex);
 	process->mm = thread->mm;
 	process->lead_thread = thread->group_leader;
-	INIT_LIST_HEAD(&process->per_device_data);
+	process->n_pdds = 0;
 	INIT_DELAYED_WORK(&process->eviction_work, evict_process_worker);
 	INIT_DELAYED_WORK(&process->restore_work, restore_process_worker);
 	process->last_restore_timestamp = get_jiffies_64();
@@ -1244,11 +1252,11 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p)
 {
-	struct kfd_process_device *pdd = NULL;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		if (pdd->dev == dev)
-			return pdd;
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i]->dev == dev)
+			return p->pdds[i];
 
 	return NULL;
 }
@@ -1258,6 +1266,8 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 {
 	struct kfd_process_device *pdd = NULL;
 
+	if (WARN_ON_ONCE(p->n_pdds >= MAX_GPU_INSTANCE))
+		return NULL;
 	pdd = kzalloc(sizeof(*pdd), GFP_KERNEL);
 	if (!pdd)
 		return NULL;
@@ -1286,7 +1296,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->vram_usage = 0;
 	pdd->sdma_past_activity_counter = 0;
 	atomic64_set(&pdd->evict_duration_counter, 0);
-	list_add(&pdd->per_device_list, &p->per_device_data);
+	p->pdds[p->n_pdds++] = pdd;
 
 	/* Init idr used for memory handle translation */
 	idr_init(&pdd->alloc_idr);
@@ -1418,28 +1428,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 	return ERR_PTR(err);
 }
 
-struct kfd_process_device *kfd_get_first_process_device_data(
-						struct kfd_process *p)
-{
-	return list_first_entry(&p->per_device_data,
-				struct kfd_process_device,
-				per_device_list);
-}
-
-struct kfd_process_device *kfd_get_next_process_device_data(
-						struct kfd_process *p,
-						struct kfd_process_device *pdd)
-{
-	if (list_is_last(&pdd->per_device_list, &p->per_device_data))
-		return NULL;
-	return list_next_entry(pdd, per_device_list);
-}
-
-bool kfd_has_process_device_data(struct kfd_process *p)
-{
-	return !(list_empty(&p->per_device_data));
-}
-
 /* Create specific handle mapped to mem from process local memory idr
  * Assumes that the process lock is held.
  */
@@ -1515,11 +1503,13 @@ struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm)
  */
 int kfd_process_evict_queues(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
 	int r = 0;
+	int i;
 	unsigned int n_evicted = 0;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		r = pdd->dev->dqm->ops.evict_process_queues(pdd->dev->dqm,
 							    &pdd->qpd);
 		if (r) {
@@ -1535,7 +1525,9 @@ int kfd_process_evict_queues(struct kfd_process *p)
 	/* To keep state consistent, roll back partial eviction by
 	 * restoring queues
 	 */
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
 		if (n_evicted == 0)
 			break;
 		if (pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
@@ -1551,10 +1543,12 @@ int kfd_process_evict_queues(struct kfd_process *p)
 /* kfd_process_restore_queues - Restore all user queues of a process */
 int kfd_process_restore_queues(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
 	int r, ret = 0;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
 		r = pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
 							      &pdd->qpd);
 		if (r) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index eb1635ac8988..95a6c36cea4c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -126,10 +126,10 @@ int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
 
 void kfd_process_dequeue_from_all_devices(struct kfd_process *p)
 {
-	struct kfd_process_device *pdd;
+	int i;
 
-	list_for_each_entry(pdd, &p->per_device_data, per_device_list)
-		kfd_process_dequeue_from_device(pdd);
+	for (i = 0; i < p->n_pdds; i++)
+		kfd_process_dequeue_from_device(p->pdds[i]);
 }
 
 int pqm_init(struct process_queue_manager *pqm, struct kfd_process *p)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
