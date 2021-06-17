Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90733AB737
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53F89954;
	Thu, 17 Jun 2021 15:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B090B89954;
 Thu, 17 Jun 2021 15:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtT7kGqvM65Dc3Xb0Qs4HL0QJUioENtjVS/xPbxd+0TAoRLHQJWOmOcqacA5qDy8sPahUrhs6wlvtPSVsufM8MRpB6j4x4qNcEs1hrgFfFlYwRTsDYH3d9QyXfgDUgwllTuEiXLtG4yUG4buh8BWzY9RaeY7bAFHfYfF77vJJ9Isx3aWb3djoCXPf86H0TH6fBGGp4FZfnDqK6YcJOapzM0xC738dk8nOdv3v8SJYyiqIfw6rHGtiVDsIY8cXZ4xuwIFXuO/HvZPbn7EiEY04Yrs4dfOJuBz52vUupSzz2Xpt3+/VnEiKlb9wGETBZB6rN2bzrmQK5Qgm/e8BZAOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVTS1977Z/NhsI3R5uOCbHIiScNTi7F80jObhOphaDI=;
 b=IFog3XCupoaS33gX9AmPATKlDH248nlsoThOgeVCjG5tYPCgTC6ICTCN0znYKmKtfSVn6j61VljLpf8KrIMToZeoA6k35hLicWTYPQyq4/j0DzpKIhpF4NFKG4kk8bHXH27KjimhIn/P8JjkmWrXo+mthsFMUHHs70kVdBDmmIjHGtZpLuBR6SdLN/Om1fynHmD/xSpkegR2Y7dbjyMfCMwzwz8o/pWKVUqNK7JJ2UNQ36OtESj8R98ru/vB0erG03YIRcBHT5T+V85eDtIc0g+te3lvrCdWK9Y0E2o3AjPhtf7hIW8AwKs0gENdU/R7h88iGNfFDXSsxa+UoYPWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVTS1977Z/NhsI3R5uOCbHIiScNTi7F80jObhOphaDI=;
 b=TYvWeZv2WmdD6pu7jF+oxOKJPc6H2USmhbw6YnbTvn9p9QDJ3aRbgTP+sLKR99xaqwpwjWZVypyjKkW7clBi6em27Qlg3EG/7JovH03/2Y5i3mYzpy2QIws/Z47ys9QAZDB6DKqhcNn1258LkybQKv7QtHBfbajbI2Jk1iE5acM=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB2970.namprd12.prod.outlook.com (2603:10b6:5:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 15:18:22 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:22 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 4/8] drm/amdkfd: add SPM support for SVM
Date: Thu, 17 Jun 2021 10:17:01 -0500
Message-Id: <20210617151705.15367-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e222fc3-2451-4fee-1a04-08d931a32540
X-MS-TrafficTypeDiagnostic: DM6PR12MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29707AA5920D4D2BC8B9141EFD0E9@DM6PR12MB2970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1dffeFeBfSIJSZzT1h4W1ApdzLMOQjQsH+dqS4SJvpl3aiVriZVqNyuBMD49aUK8e4OZpYnmzzxrIxjJhEJ3j3X+QKqMvFlr2rAyhPvcLBywMGGxWIBXIZ2ZqGbTxL+vzVByVmCahRlmuP+oGFZg+0c4Ef/njzi+pwAkqVBoT/oYzc7Fbo9UKGzqzpEqBlGpOJw5VRSMmaOX291ze7VSTJCA7Jpv0kEFsH/nzjl3aZ+3yHxEQJKQCnVxNF4nKLIM1uVRrqbif/gWXhSBylEdYWKiTOhLa6CdTtEt3LCV+yYgsXiRAw+fSxWeJMByAT3T2jtyk0RNiOtf/9R9YJJlz9MqR6yLmtwQM/QBQleTAKbFEBprl30eQTUNPmFB7NsABvcQc3DWsrh3xMy6r04Z0HISlp3p5weGhs0qhx+e++qf2J2pDrda+GQ5fuPcXkFXg8L8+TxNDq5n8twtZ/bUMqmQ7GFeY8PsgAZW/qNxTts1iAUwqbi3AnA4mFxncvowgRRnZKDcJrp3x4zu7rjA4iX8AZ06pgRUXWwOtMic5K3KRkmY6/5shHvjxvWkXxb9LBWUp/QK+qHTI1e+aDyWRdiUFqJiOOeOzYhtj/++g96EXx2seeq2V3O6at0BvxqnYDdsBcVrWhLQF1bMSWLKzEOlZX54Bc/La8EQ6juiyuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(83380400001)(8676002)(38100700002)(86362001)(4326008)(26005)(316002)(2906002)(2616005)(1076003)(38350700002)(956004)(16526019)(66946007)(66556008)(44832011)(478600001)(36756003)(6666004)(8936002)(7416002)(52116002)(186003)(7696005)(5660300002)(66476007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h0A+lcVeRKteG7VYEDdIoE2mDzDhdAbwHM8hboJY84lH3MruXTun8IPaoAmf?=
 =?us-ascii?Q?8ulHlyrkgAuE51HxpWN2md2Y5i/8mVo9/HCe5bXvlZvedREkKFrq9S4E3mnd?=
 =?us-ascii?Q?iW0Fiw9hPPRaAtrqr9m6thzpUTeMNK4U4um5auxzc5BmbQY8MrF8HZ9HPQOt?=
 =?us-ascii?Q?kiqQTR78skY+xNpPKutejZa5XAiFBuilj2Z235LR+SWfQDw+Jcz3OUMp7g46?=
 =?us-ascii?Q?YKoMpwdcMkwriMDP9pAGDKt49rgSq8Q47xnPLyrgQzhX3BOLk8bXYafifGkC?=
 =?us-ascii?Q?m2o5fZRip0rGZ4lJDuNxqMJyoPUuk572w98U+1dlqXS096aDX7l1mHlkcTL5?=
 =?us-ascii?Q?3Mg7gKDrbDIf7nxpdL6j/uw7B7vh6uxJaO26ftzcf33K5KerDx+/RMOVhMEq?=
 =?us-ascii?Q?cq1Wio8UJokJQS7uggmD94CAHOpkxqETBTQeVIbwl6AMkXaK6u518mdqCXfL?=
 =?us-ascii?Q?mX7jSqG9O7NmIWvuV3hgc2FLb0OTEH8j+AZexg3v7TbuVuaLlMpYFGu8kQgJ?=
 =?us-ascii?Q?/2J/OnPbHM0pzeVgjfYxa4OnhulQlVYfnvh6vquk1r36cHTL39UYm3Zqsy2L?=
 =?us-ascii?Q?8PXMuMYL567clDoUl2XH2Mti+okXZmhfmKI5tNx7C2n7+ZfucBapBEW4R/9y?=
 =?us-ascii?Q?g1SgXH+v3Frbx9EniMVzBksueAJkvpesP0hPHqYFMfFlXZqA3dp2W5hFKd/Z?=
 =?us-ascii?Q?Z4Nm4LXaBDr1PMrSh8AYrimIWU1JQg314KjRVZjqVcJ+h2CUhk8aR74Y9/g3?=
 =?us-ascii?Q?q4Jz4DoiT5bywHqVjsW/zlFV+LpqAlhtDZUNeANcH0VZKGCKU8KmfUc1ip/S?=
 =?us-ascii?Q?SSNPnT2VAd9aSTk6CAU9MsBnYYIIJ68zgqqhHMdvUrSW0mllxSke+aBFikoJ?=
 =?us-ascii?Q?f0o5d006o3H7m2oqkd+DETlYDG45AloPL+e8wJwmwJnIgi1yprii2N1l3PDZ?=
 =?us-ascii?Q?GFBdrUkg9pn1BEFVDJ8s1K6sk0c8b1xkcNYJMFTGSvyu4JgF13S1mc5AKqBA?=
 =?us-ascii?Q?8ClN94IHXyno52ME2k2Yio3LPPSV55QeS31anZZNwa0mWs0adVsyJQZi0KU4?=
 =?us-ascii?Q?NO1hZLItFvzwNbIHMKDMnRS399Kt3Mv82bUELrs8XEoivVhPlHelD/qSoJ0H?=
 =?us-ascii?Q?v2JvfeRiHdLzf5o5e5JgNyC0EIiqJBt1WpG6ipI4YuLGNrMjo56wrRDc28RZ?=
 =?us-ascii?Q?T+BQBWJLr1a3pBEszvJFnVIxE+95CWOQwOZUVw97nFMwzHUJVfIM7ptlxz6u?=
 =?us-ascii?Q?4WgXIDLBzRussnshGGem2PCs0oDw8Bjn9rMdptZcYgIhXsGmyiajGYHzOoOB?=
 =?us-ascii?Q?t2sY69z+t6XAlCmsdood18je?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e222fc3-2451-4fee-1a04-08d931a32540
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:22.5617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhIS3r3OBJe/MUYa0fYE08PWdVYRCFDI5stqs3vWdZeEymJj07/E5DNZgMJOAXoleSvgc0M1fsu9CaAot65GkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_GENERIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c8ca3252cbc2..f5939449a99f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -895,6 +895,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	struct resource *res;
 	unsigned long size;
 	void *r;
+	bool xgmi_connected_to_cpu = adev->gmc.xgmi.connected_to_cpu;
 
 	/* Page migration works on Vega10 or newer */
 	if (kfddev->device_info->asic_family < CHIP_VEGA10)
@@ -907,17 +908,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (xgmi_connected_to_cpu)
+		res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
+	else
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+
 	if (IS_ERR(res))
 		return -ENOMEM;
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
 	pgmap->range.start = res->start;
 	pgmap->range.end = res->end;
+	pgmap->type = xgmi_connected_to_cpu ?
+				MEMORY_DEVICE_GENERIC : MEMORY_DEVICE_PRIVATE;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-- 
2.17.1

