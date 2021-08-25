Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A83F6DF5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43176E10A;
	Wed, 25 Aug 2021 04:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 852 seconds by postgrey-1.36 at gabe;
 Wed, 25 Aug 2021 04:02:53 UTC
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F76E10A;
 Wed, 25 Aug 2021 04:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJKdRnW1mtjVyZk+/YMIa+tXeS3xNcmYupfchjiEAgs0dZkWa8mznQC7k2N4Btm6fcvXxj4OVBhM/JdZ2KoikrL1nZTDO5H0l2m3gM8ZIXnucF2ImfNgi1RjtMmLxUiFJeEowncJUysPVn2gsg3HpfDvkmuoET9gyE0HsXEBIgfy1mHgx48neZsbcJn/HPbjctrMfRPC64Y1HbWizn4P9Gy/LWnPerby7wBNmMGY/fOeHBEIlVGNEdDnK8wzyLYjk8RfOpekjqdG+2LQCjn0sI/0utS4VTQM6OMgVIpCBIr/jtQXH545ppdlIFEp6CgviMOkuX4r6Rt8Lc8UjGh2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzilRdg7u/L1sYg4tCIUqF5v6yBkwXcMogVV+Xzdfc=;
 b=Ayj1tp8Q3qjxbA7dgZAoKx9gZlxmsOb3XZ5B9wYvhk9/2+TxhZr0TqxcBiy5kftjC0CEFBawQ7QTvw34VZVlIgmjoxHTRUazRCI6Qj4VHvWdPdWMhvfKm17WguiMD3NP8//wIeWUV3AtwOG657Mkgaw3Hl/IjpyuuufZqFAf55qR6Cnz+HbSNy0LGm5pzmfPvEjmOVeBiTML8/P1RK5jMcxriulCClOvdI5KNCb8fpeHWIL79dWDNRtgtF65KXzizQ2BlKkEEWiDYnVqF26qxEiz2+s/KotAwTixiCAY4AKu8rFTnvl8av3VED/uQ/MdYzb3Ggr/D8p/9Yqq/yt+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzilRdg7u/L1sYg4tCIUqF5v6yBkwXcMogVV+Xzdfc=;
 b=KdTvO8EVsVeu4CKU+dj0zEOHQYPQWfBMCvECX5xNEsPNsST+vRov+yM4CjS/A0l0p8zsjDnjFtZX/cbX+VGYsNAAVUN60+Np3K+QWfKZ0tiNg+LqDO0Zy4bgMa2431x8gfmdDmQaxTJ8C5pkc+/+lmc8XIj4YelwsDziI1mhB7g=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:46 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:46 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 07/14] drm/amdkfd: public type as sys mem on migration to
 ram
Date: Tue, 24 Aug 2021 22:48:21 -0500
Message-Id: <20210825034828.12927-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e08265-d84a-4eb0-843e-08d9677b3d89
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47500C2F7C06A9F04A794DB2FDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6whwGGh7uAC8OY67KKSenLN8OyQa0ZuD2qkW5AewbQb9SkGhMoHKUNod4SXPNcwiNcihv2Q3aPnUPP4kqCb/nagChytmu2spxWVLDofoNNg02wZ5WdIMw5aj8pCk3MyztGK0vvmMZ4iaM77lo9omyKYSC3WB9p4ktt2b7nZDHqSRAIidN0D62PnXYTJfenF9qvgikWexUGcd/cT/XwKEp+OvC0qo2NTEdnFrU73IS/OsLa14q55EG53yhI7N9vXHDGrVpMTWl1OKKUq9nDKSbVeK+h2nhLa1vwTGPhLLdgKIqpD4zoJpCDe2EFDkT2tdLICX9BmNKDW0CPW+ccUg8HtfuQv7OMjwx5pfp0kN8rneiNqZCBZzJA5tYVAa7HWf6z5x/p9Xd9gYsX5U+uLvLMSgI//XGqU6LUNYjOSKQeZzA4xUeKLadRcbgc5bUEOAk8qKRQEvAfs99Vcs40sh3mPNQjjgBnYSquevnkQFetCzHmcYeUyU4nL17/kal4lWf1VIMs7KMyIhYLvMmsqSgD2K3gQXBEWmi5IM/85+Q6eSI2Ag+iqDr8G01U8gh/8WgU7oHWgZ1UMLnFdzN0IMLXpM1HvmAyFjubZvyV0BeHFOkR2k+tpQYyUrcwz4zE9bxL370beTCN6gAs0sc306e7GIGST3wR2I8GC6cyT/XMqyasTsiIcGUlqxtnPB4bz8dNjMcpmGID09l0wgCf1QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTEmg6nbEV/cdmN4opTvmbsXSSDqbaqcIaU5O5AY6Ph3xHdLIzgynOZeNK0I?=
 =?us-ascii?Q?nIRK+ZEGIrsvB4BItoywcfi8yHvEukpuP4TGeowEcUAVI62xhTAv13vOmduC?=
 =?us-ascii?Q?dfWJDn26J9ByxPb4yKQBbGHiheQ8RNmOUfJWcmAp/ELFtn0NmHhQ0ZCq2P6R?=
 =?us-ascii?Q?h8637DtkeVD1M52jOXpp0/syrLxpyy+kNfPQrpmhe8DU2sx9o1WmwS0HQiVU?=
 =?us-ascii?Q?qeuJQ0HYEk10VbRl2uyw6KX/19OD03rlFfmoOu1JZtj3h1TE6bvkohysA6ip?=
 =?us-ascii?Q?0DvdYb+Ni8VM/Hv44qpz9dvOZMP0raD4vva2y/e9mBFxae6ci9kPTzJEL4QH?=
 =?us-ascii?Q?Fmf2onqI5uoUZ1F2jdN3v5jmMU8RZL+J5ILV1qb9ikdCGt68ImnXDUp5Kbu/?=
 =?us-ascii?Q?EoZLrEPxMvblbGCrP7JoNdeMEJcJtw1NSg9kwdK78/4yhg2SKMNrOpr/DWJi?=
 =?us-ascii?Q?q7EUBadVZ/Q2IqDK1hL/ob8xPVL7MF7V9tzPtJJ6e2UyMU+Agx35Pp4mi5nK?=
 =?us-ascii?Q?abpXvMiPXCXsF/umpcT2sJn5F6k6Pk48s1fZ2x1zIKbkMMuNODTYl9Ppv6ww?=
 =?us-ascii?Q?T4d1rBDL46y06vXAqi5gBYKoyOxKcdGNDIGtjIkvIaLWKVUCrwXJc8llHr2J?=
 =?us-ascii?Q?wwWnMSvQ22dHVPhajB1HlmGoL91cqUHXs7M+yoyPfA0fS7yKxPvAr4HbMybp?=
 =?us-ascii?Q?PHh+4micMbVAEpmyXO95i/ewG893fUYrTrsTcdTTWkXQvBuWAXn0zB7shtev?=
 =?us-ascii?Q?ookBdS3B6+zyx9Zc36GE1SaoPMRcc3MSl4FicOluLN70kU4SlfiabeS/pyZW?=
 =?us-ascii?Q?QaNLhf4Ht/N9lPMAUERYQKiTBNbg30iK6pREpuICKqmyVRL2uiQgqZuM+IIu?=
 =?us-ascii?Q?K30kc/B4dCJr67nBWURQ8k+0dqOj6szWrkQGqpnig+nSLHGVsTMaK+i1cyjj?=
 =?us-ascii?Q?I3eJ6NT9ngB2DtxF4K5PNgvfzUC7odsRkj91SYEYWYZI8VbxVqvQHMKKVBmo?=
 =?us-ascii?Q?gpwo66PhhSrhz1L6Bg6selt+IOQ54P1uzQAs7kmLo/j9pATtbuIqDG1i4dmM?=
 =?us-ascii?Q?a0nthumNja6+/HH3GG6LWO2qPImLYrvIK/ctU/wN/Jtov4MgquTYba0/0/6U?=
 =?us-ascii?Q?UIkXwXrm7pAd6z2LEuglcZbBwx80iWUbSBCbcvUovmYR68hpprdRno7AdfUJ?=
 =?us-ascii?Q?A+GGJZpg49hmRcgUyXi91Y6Mo4eE0NYacaPf0u890gDd0iVSwA5KuhcP57gt?=
 =?us-ascii?Q?3UebyKz2DnCjBbF9Gt9GvNUHYc43MirJnzPx/UUNqb9s5RKhVj4NpsDg8Xus?=
 =?us-ascii?Q?mkWo73W61zEgXEuaUI+nB86r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e08265-d84a-4eb0-843e-08d9677b3d89
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:46.3524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtVSp/4/NpTc2uoswF+JliVzYRO+vzMYOpZSDWKTgGA6gtym6CxILecxqktYEsSCeEr3Ac+SImMulo9lRFoxgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

Public device type memory on VRAM to RAM migration,
has similar access as System RAM from the CPU. This flag sets
the source from the sender. Which in Public type case,
should be set as IOMEM.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dd245699479f..618035dffc64 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -616,9 +616,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_IOMEM;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

