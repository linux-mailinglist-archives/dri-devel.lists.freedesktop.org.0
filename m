Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F393EB01F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9FE6E4E8;
	Fri, 13 Aug 2021 06:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C726E4D4;
 Fri, 13 Aug 2021 06:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN4FDsqGZj0Vua7rPwkKUd6Rmm8DgR9lct9xSgc/63SufNOwuRkt9XKE47MdxSgQdDFuhFxjtEZZf43XXvSgtxGq5ZDo1Rp+Vc60ooxUWtCiDqlVBx+3hHIDgb7BIY0getn86lYiQOQzTE2JvrAzO/rHMeZ3anTUco2y1ddvxnFhBhgbV2eRuf8g6iBNuviesu4iiVsHKTipssrSf3lmpbkivmGhrSCIW/BNGVzmZBYXI3Hmo121tvLgtp29GDmTehKXEGMHVLoTbPhBmyLXh+/QKEQBRGiCg9jrVWhmVEgwFuANmSfmBrypgi1WKX3doIpj0XKNJBwRdgm+ImOZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3ThOLGhVWnDkKgI8BE3aHhWyP9mVZRtKdRj/+WuuuM=;
 b=jj2KQZc/i6WrOGvxyMrGx5WlOTb5cv5dAW0BCibPpzgAXKC/pIqPw1e6O4WHzF98Bdg+Jl9/jiPafNQ8BRHUkyYtXR1ZquexbflwthWPOJQmSsatMm9o7IrZdWU3Mv56rzYo7e1noludH/kdyq3KatnNHh0sb8ardqMuXUu6DuicmGHZqNkFt5CTRmIXUTKQgX6JI1NJ+vDHsmUKuzU8tdNMoiYqzTUL4yWev7rPKgTL5aBuha7VtMq091WZrtrYtKOKuKlYjreHkoGTI4DyxATdf/qQXUyL+Pb5xPhu/GnBHcIq6vjz466QOYlxjHbBLimh+C6fS7GiaWx2a8YhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3ThOLGhVWnDkKgI8BE3aHhWyP9mVZRtKdRj/+WuuuM=;
 b=Owg2f9c4wD6N+qsgOA24tOfzwrUMBvkE7CyTk0bPuk2VUS4qDhHsS/UcgVq66H2RJXDYvwlJfdRSF1m3Qd8ct4h6Tcfdk7exNl6mIjz94j12yrHsiHZeYjPO42z8pKtPp10KHizVzow1OAXheo4ddp+CUtmLQGfyo5DC8bzsfzY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:06 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:06 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on migration to
 ram
Date: Fri, 13 Aug 2021 01:31:42 -0500
Message-Id: <20210813063150.2938-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71bfe2f9-9339-4452-9aaf-08d95e2411f7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2782BC984EEBC49B5C386945FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41BSe1ceSMYGsk1V4tQNttUVH1V4vToWcnmdQNbGNHZlpX7e8yWk15clQUtV82M1X7wdqoqcxmzFlhrBqt7ZosI5/EmKTXptLjXkQdebgPpodE5DoA8iastOFFeSKETXMMP+77IgdbentRCezgTVusvztcp1ilT18d6BV+eh9pB++0/LBV7qxD95gWrVuCK1gcMUZ4f1Tw58iTOBU5F8hEUQc09faLVmk3n4hSXabFnbFInB8yNZhhjFj9wPwx7hiL9VysCpYY/Z4iAbrEzLfEVKrLk5sl5iA/Pbufm/a+nW8DTQeZvJkpu84PvNzjI04K4Fxp/bmJHm333+kyrPAChTh5wqmrhx4tAeL66j6uHKF8c91VJKYDfg45CpDQhoUHyCgzXrFxFaDoJbEwsO1M76k32/eoc1VUzTOiKdpzx1UbNMM1n4+EyPuSbPP9GZe495G6oN+fKKRnVGTgTJqLrkQexmrikBqvY6d5V9LQv1wCgr6a1ijgFH52UtxyyfdxfrpYRRd0G/jWSxKzD+ge1MbNwUNm7SzSHHhrQhL7sq94VjALEi4l93ICLnefEFRBPQQiWJhLxhYSjFfXJZg60PqjbE8n/Km/gh2dHCZ9KehOURx1S7B/HhMzMb9dybqkuVD0Ae+Ch5GOSJTKUVnKoejrKaPQLY5t+EwVCHu8DHEkVqbWXO71djjYvjB8MQ/qk3W9UsgP2KXTulOlGhbQWptnl5+oEshgyzBT/uMvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4v5X2vns6d8FFuY4aH7+923wOI6+3ZD82bGck7OTW4YzAZF7jAhoNpOWZLkU?=
 =?us-ascii?Q?heBV1BMx6BXoTNQTSatGqTFb3clvsooLYyFaC7KrK7aAMeElCJ0JNhIrV07o?=
 =?us-ascii?Q?35y8lwqF9Mgk0fmjzWJbL9tpNZRSUkeA+961vHjriw6FgMiJhErDDOVy0Hzv?=
 =?us-ascii?Q?7trMVpKipMA6IQpiqDCAHeWeFT/k6i3RfM4RRrwerIgKvUVi+k8paHbjoI8o?=
 =?us-ascii?Q?EqEAV52BcR9A9g9G6lVFwEAqSwsHfA7zFJHZ39GhO+gWefR4nNrRWEO8mAlS?=
 =?us-ascii?Q?Luqv7VJnV6eq7XCx7d/+X4L0YW10daKwaax94kyv18gQa9Rhzh0rr66kzdVI?=
 =?us-ascii?Q?dIUREQSANdaxEUgtpt8EpSMPZxTTv0sbOwLFna3MfayRhVAzsXLzu/TDGrDt?=
 =?us-ascii?Q?F0xwJ7bzr6kLBLubhnxD6j4ed6yjQ+zevGkFBPB96rJpICTJBIGZRK4UoEI0?=
 =?us-ascii?Q?XYosH2gV2cjrxc2b8eJs11BqmxjX84sIMqzUveRhE5HGd3RMUeneJl9x9cuW?=
 =?us-ascii?Q?gbxO29nv7lFSrc+iEURjfp6rv7v5W1IOXWfr3HDsIyZo2FhzOcTYp4HZuSSl?=
 =?us-ascii?Q?ULvrXnZvyvrQkYkYT49dDs2xcOSGySH/e7lyA4aD0l5eN0Wa/6ugol2m+ZQZ?=
 =?us-ascii?Q?XfNn/PFWWEkl2jd71TU03fO1ZWG4+ZPW+I5D/8KrU9EORXSQFEcCOtJ8poIB?=
 =?us-ascii?Q?6Uv4UklOjKqIbNdC+kaLLA9StE9jY4oDZK+HZlS3xt3QrPGERD9rPHM2Ju6H?=
 =?us-ascii?Q?cf+dMUl+u1bK68flvY0/n8HYeAMMK2DLw1ovV5Gak+V5lcw6WXwUqPmfuou0?=
 =?us-ascii?Q?QvyCaysFCPGw94vYxumKOuDol4OcDj5cQorNS8/iN4ATcOBorr3LQXR6PsfE?=
 =?us-ascii?Q?4nuU30rzBT5hTR24OyOI2D/SdElEmhDFSBGoLo7FB4hpvC0FdT9YB5XGd/6g?=
 =?us-ascii?Q?E+4rIMRky6j5v1clZKak0p2FahT1I+jVw7HK4DXPcgtQJdCixGwWS3fWC5Sa?=
 =?us-ascii?Q?uxrEeU6u79+Cyo2cWr2cPHwk6QMXZK7gYJ/fWlslvcmBLrM+UlSfS4UFbt8f?=
 =?us-ascii?Q?NypIR7WvkzpYF1F7B6TiQ71c7XtKAdKMOj8qjofht/9ASQgwbKcje2cGGrWp?=
 =?us-ascii?Q?wGMevjyVDsWHuKsh9AD3t/C6AO3K5oBZyhHeBpUm68mPg/3uJ8N1R/ULjGXV?=
 =?us-ascii?Q?aV6KmUP4xvpJH49+hdRjuJqAL+IyKnPSM1kosezLSuD6toOK8WNBhrRLZOoH?=
 =?us-ascii?Q?ED41TIWOw1aueUcsSb6Cb+eHPQATByLYYrjAP/64Ogvb3tcSo8DCCpH3ZpBb?=
 =?us-ascii?Q?qGAvwU+SRR3lR8G5XLPV1/YA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bfe2f9-9339-4452-9aaf-08d95e2411f7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:06.4168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mHUfx0r9yFmAgEGDCL0e2//lYys7pLCTjMubmKVfl1U4AHmSZkunD0oeivBBzm5UeMz3uNO8nCa6moZuOIVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 24a8b6d4f947..e5b10de83a5f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -616,9 +616,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

