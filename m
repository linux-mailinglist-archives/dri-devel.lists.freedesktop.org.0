Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC73CC5CD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929686EAB5;
	Sat, 17 Jul 2021 19:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227DD6EA9C;
 Sat, 17 Jul 2021 19:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7WvIgMWzlhLFDjL2I1n5wSyyUZwvmqgZEucFBO9gx/dHh+53tZ6kHiJqgRIiOYY33w9JFwQwsDk9SJSsB2qpgg4lHpu6UeHCRlhHOhc8ff1H73Dw4o3DxtxVOh48ECFqu59UpG+f6cRmh9h+s973Tu3V4+2LFWTEoEuoc1T/scklkOM9qHvHMsa7YkpqmgoVIA26eIAQZ8crXVrDt+1XZeeK+mE00E2MJFiFV1e+liTuDsuURPoVwRBqtfq1XhyxTwZ2LPqPONGfaKp3Wg+zYaCeyw8R/XgrTlc4ofC8hpioXxExEwtM9cFSrBl9QbS1pYNDvETWT2krIiDnhDxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2ckaEYhYH5EBOREpxdvq67kPzy/ubBjQwHjl/1feIE=;
 b=mCa56c8Cdshcx8FNTbNnXmc0rACFqWimefgOcTj7X3XocFxTqCvgk4QbZr6aGBHPRYbkDplzcCqzFxGr/RYK4d4jdxZmeAb1ZBJqe/F8JF5CUwqF86qaiENhRXKb6tkEpw+I/bgpEC0MTrGUQmpS1oWz+Du2Asx4WtGWl6H0PIrMeXaQ4b/KpmDpDACGivjccVfu6q+tsBuXa0bIBC8gJz0rSCP4SB6P4vA8XAE/97/wBOmEq2pGjzy9Aqnr7nfxkG1XSX5K9LM28cOi83lUOKhF56X9fAc1oTBvmxmsRWXcnDsehQYqNZIf8mcA9dgVDV1DFqR7JyB1bco6IyhyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2ckaEYhYH5EBOREpxdvq67kPzy/ubBjQwHjl/1feIE=;
 b=i76xfnCh9uQwxCh6GQXmsKi4J91E/6QapwOUhgPTfVhfKU39PW/u1epK8r65r2UT/eZ3Ea6HIKz7CeULzfxqg3hG2FzcbZk+jgSehrp2bKBmZF/bj36v1nIOrbFqrBORiFe4747nsuhqS34izNfeEBchhbi7YoasJcrvkep9Fb4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:55 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:55 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 05/13] drm/amdkfd: generic type as sys mem on migration to
 ram
Date: Sat, 17 Jul 2021 14:21:27 -0500
Message-Id: <20210717192135.9030-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8f95946-c051-4d78-1d72-08d949581ff6
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46704007637736B38EACAA93FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGMsnx9RYgioKfhg/oMqvMu3oXZf0cwYcmCwHTZQ6I5yP/Cx+gFXfnlyx6UaItCZHllTShH80ioUD5SHOFA42YyumvoHeXiEmXX5YCJa66RC8WT3qe59CDaTkk2CWvoFAepfOCaSdVD2dZ9tm/jIClvYin9ZumpIq76PldBbKVWsRDsMDQ0ZoqJm0JmMJa7u57Lar4iqhP3MbmKTX/+YjCDE/8NXNgDMNWhZSQMzSuJxw5lPntLmfPHQGj7UQKWWwFVBC3pibE76BwPEPqSJ5e66W6ybHinZZu0lEJH28VGfItsZDZ7lxcmyHzGjRY9dzr7yfqQtJ+VXx9emvgfoBxOZLikNdpU761T615UxmgMyckOnbxvHzp/wIh5YrhYS/4VVtB9GBLotA5vFBlB4+FhOI9gd2U9twqgLprwNAcyxMJHz3f79nKlJ7VO+sKyGDFgaR2+elCC1k9Bj4skpCU58BVHybbbWujLSyy0N4RzPgZUEPLBkbcmF3GRYPgX/NuBRmfYwb227j93nB6H65ZQ7aQdOZAb6iaNDTcJ76eB7FG0/ZLqSeihl70H0Ms01GGU05adWIIpTuztFNBAA44SNEjbde7cG/ljwAzWatpBpk70p2WKm4zF9mTHcIm2SwOMdTmZXOOXsVC/3QPCr3OErSFb2s7SWouSUp9ml/M4yuoGXscpZEYJddUjpBRI+OcmIAUZS3MCOHcH1AU7Zac2LRRVCw3QzitQvtgC5les=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJ3rMfjwjPLcWxRqUTMtFOHvI/iPm+rdt4KvKiDbLBrsGpL1kIrshuvkVYXN?=
 =?us-ascii?Q?E7UdeYeGonzuCIXfbhimB0OJx4d80S1BbANPAQFxfopzbIfzNOGGiV22WPIK?=
 =?us-ascii?Q?7LNqAQ1HbjlzpaBjxXmboe3hSO2MGPtbyKi4Q8LnYPptLy5Ektr58zF+QKDQ?=
 =?us-ascii?Q?kE8No3tZRdauSUwxBgr+qy9jRZf7KeW9aOHEpD8qFcUw+hVdIKpNhrMKba+r?=
 =?us-ascii?Q?j5g2Dz/SwzZNzOA4MywTUvVLgIDEyJDYaY+DF0wjYpyfKTlWJAXHfZYBdyTf?=
 =?us-ascii?Q?yQ1j3WsUxkHShZ7luvuUw+0bYtugSBUUiHRpKWWgDKhE7rdg9n1P2Oh7DprE?=
 =?us-ascii?Q?U/WcUkeFHevTu2e2g7UH5vBr/kpROAG/2uH4oZnPhQ1Yp5QhI/Jr4EtQ0HCE?=
 =?us-ascii?Q?3akw7wVMrGICqW8spsRbbwNEehTsVMdhWq7R3RKQGvdLFYMpWFG6gxQLx3Qh?=
 =?us-ascii?Q?u2LDpWGWNk/oD+4Ooa1xIJIyZ0fJsDEGM4AaHw8w35fcftUGOCHjX3vk7veg?=
 =?us-ascii?Q?SxLUJSVIhJbLWwgaJs22wEbXjCAKDUYp7gkGyNUZk6+Yi+QKJApOl2Zgsccb?=
 =?us-ascii?Q?eMiR6XS9VRepQbonOD9MFowQNpzibCSdQ66IzmZd16WgJyYjL4gg3QEjYbL+?=
 =?us-ascii?Q?2cT1n57Fbh7SwOoiq4+XHkaGFd+eFQfoEiD/0yYWsbrP7zidKVPyY85nEGHY?=
 =?us-ascii?Q?1abyxTv/NHfOfA6zga6xERlXftPbI3T6VakKqSZ6mkqRtrmRzkcGTxPs+DGe?=
 =?us-ascii?Q?FT+ozp4Ykx09gR7ok8AR+/+sd+DWjhc2a8B/KVEswArKaTH2zJm5DUeAisg7?=
 =?us-ascii?Q?U8vf5Dx16rUix4SgI+YeugzC3gXJcwesiN9M3hPz4Qiv8wRHU+PvcQloeKfU?=
 =?us-ascii?Q?aEF629kEbrZVOx25PTuxwKO+hy55uyfPw/G7t4SbfB4pCOiVs4BXBtff9RvZ?=
 =?us-ascii?Q?W90hcc+nL6Q1nh02aSs3ki8ctz0A2zHosWbbYdKO6AhJA3ByQYzON32H5S74?=
 =?us-ascii?Q?vs/jz3RajXyMay3JgODYHQvv+HBnXL/jjwe78s9JhdK7oSwNU7jFffateR3m?=
 =?us-ascii?Q?gmKyly8ATVvJPSdI6iaNhnplMipk3yg2RLH4NAkSTSGWofajof6UDjCedAkz?=
 =?us-ascii?Q?PpRqzHu08Ddi5AHqSh1OoejB2XKY80/Si8+kShALlMUholcIYMoi80NZXojC?=
 =?us-ascii?Q?VAnRYyb8TnHgLD8Gpwe7czSwMGmBQGfY9jVJnulNTfkePzXSE8Ep+66MMZlR?=
 =?us-ascii?Q?+m3UKZtB1CvdXpvJZOR05YGHwriThuV/IjLP5b8gg0Q3wXEFbg7bVfS1mM7H?=
 =?us-ascii?Q?opJIj4U908xonLsJWNPO1DIb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f95946-c051-4d78-1d72-08d949581ff6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:49.3222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64p9Vxxf8e2JBsQNgwu1Ae59xSyt6veg3Pi92uDQKHRZcpglyznuMEhmqF+GCEGMuf+iwAB0czSwIZ9NEfNbzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Generic type case,
should be set as SYSTEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3e9315354ce4..fc491bfc09f4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -664,8 +664,9 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
+	migrate.flags = adev->gmc.xgmi.connected_to_cpu ?
+			MIGRATE_VMA_SELECT_SYSTEM : MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
-- 
2.32.0

