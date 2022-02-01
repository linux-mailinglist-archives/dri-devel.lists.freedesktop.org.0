Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09F4A577F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010D610EC97;
	Tue,  1 Feb 2022 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB810EC96;
 Tue,  1 Feb 2022 07:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV3aoDHinm4UTEceHtn5xpHA0ZWjUKLDIX+M4mrokSECL+uKBEK+7DH4of/YhFPWTkKoaVgBp+YHmGDfN/QPzZAWfqC6+c+55cKYfqdFpgSOrEFksvH7+voKCM74PLG2jftcRKiszzde2UsX2p2zysL3mceg0ADjITQ3Y0uGxY76/DB73Dz9qxVkSs2ppNePiFqfbNM2eYsKBQD8KgzU03vNKoPDyix+hAVQfI1JSaW+0oHoqxtTR79cwWdfTV42Ik5qTjPcoZJdbQ11W+FHGDhxLc10uebVR78WJDyWUKS4i6qsVc9YntHxMkIXL6nyvemdO8i3BTaDexCuFo9RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b51ocJMBk4G9G+uPxYS2c6YPUjtxQDBMQdZVtZ1jMWg=;
 b=jQCUrNbXvBUXj6iJ4P+4Oi5hv5WRX/eAC4p87sXfEygyA99jD6I3t24MJf1FzU0LiPvvz6KUGGlN5eO7dhFyk9eM+AwMDGYXkUWahnlVYa6JEVGSh6lE24pfWz3Xr/Heftsn7ahcNzNxMEgL8AniUwQ+5OYfBZbIFBf6VXW9urcWE9jpzRJ83EEeewenRDOQplDU50F/O724+SQJ+C0A36FmDeqN7tnv0FLO3sM2QSjX2bNfTz167U12AJRQUZHFwILXXGj+9k7jip6HUWvWUK5F8qOXbW8ygKgN+w1JsCKoEtq0uGjHBfzhV/jjaYT/6hvH+PMzJwfapEr/sP8KMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b51ocJMBk4G9G+uPxYS2c6YPUjtxQDBMQdZVtZ1jMWg=;
 b=gGBeBuqoct8oeL77wirmELX91j2ntlxFt0bgIzDFUeOXRTULSrJQdE1V7FV6IN7DE1UxwV8dFMQQTVICucvoGgy0iwj1GmQAUsJsAE6bShY0jfoFyFVFHDfybZTkTd57V53fioyF2pAzepFw2P2Fc1+wLC61aawnKI7xuIHeil6F859RGA+Dos7Ds63TYaSniz5YDTxvLNAojUqIpl68NM2zwhTI6a/kkLSZjapkTQ8+wzo533A5YtK4Bs34mTLJrGQFdUGyq4GpAFnl0mu3w/hfjI9qPmKQhjG/iRysDw/QpcXxIqXkliES/9ONHsOz4VVLs1Uz203bhG9rFeX5fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB3991.namprd12.prod.outlook.com (2603:10b6:610:2f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 07:06:47 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:06:47 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH 1/3] migrate.c: Remove vma check in migrate_vma_setup()
Date: Tue,  1 Feb 2022 18:05:55 +1100
Message-Id: <02339ee87f428688336960d0403059b7af5834fe.1643698773.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273833b0-db72-497e-fd5f-08d9e5516982
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3991C63DEF82DE3858256A76DF269@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsBkYo9DX1SiQYRskbiXpG41ptiwVSg7PEBH5boMEiI5RlkF4Oc4KkKziHPSmGA/x1+OMhaYnvwKLYhol19GbUC/AYdhh3B/RIWa0omKhiwcKQ+JHGsbVqvrQe3Ss1KVaDJOZotXEAeK5L11kULFGAeysjLUWCW5qQfilt5nihLHCFfcUyTKmP4/BuQUJhuA1V+YUuI24BPJHz39nTEkiyVLWpcpg87x9VAgaXlgfHdLXMcGblZcvAyQs6+nSjRDMAoDAiy6dkH0el2pagBL+inIuXCGE6z6UCUSrPAXVcBi5UtXpLI9eP4XoKoEvLN5FYX66Q8nf8RFZpeZUQ5jwYr+zd6+/7vsCVX/454xA4vknx1QTJFP9hifwoYKMSqSgztlonkWpS/rfI9dgpMrKbQKYEZO5RGEUhpf1Dr4Hwx6rtZgk6wEz3IM9uIjTgSBwB4ZcufB1/UNXxHB+YA4FTcP0/gGLZ3TD+utzHGcDG2BmM9Xwyj3dSJRbTtTcfCWdPn+4cGGeQnuHTT4sS6fhcofQ+5jtRCk1qhI7Yh3+4gtdaChbmpeio6tnUtZ7g9VGI2XcYvfX779tWDVD9YSXEaqWcU1dFQD4PXSVu87QxdhUv175k4VVvN7spG/FIMGF4d5timu9xtv3A/ojDzoYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(86362001)(6486002)(7416002)(2906002)(5660300002)(66556008)(8936002)(83380400001)(66946007)(6512007)(4326008)(66476007)(36756003)(8676002)(186003)(2616005)(26005)(107886003)(6506007)(316002)(38100700002)(6666004)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x18ZnB0Ni1bjxp8kuBxH+E6d9IJ8vlnftoSyjSs0By5M3fpl9HnFsubM61yB?=
 =?us-ascii?Q?faigWydnmrqP3ZGVBkRgjlFK7q4AewlhNYapwSc4AOpCVFNs1I7w9rPi0wnU?=
 =?us-ascii?Q?z7yTUN3mpiB95wgj1+ZNHtbHM66nmFU3cdt0voYKu/ym6yaqbDT33THbl1CC?=
 =?us-ascii?Q?CP3QnW/P0Ge9a7ZEfNRyhJTVDt64J0KVF68LJu2fc86/c24mciX1oLgFv5Hz?=
 =?us-ascii?Q?nsxY/zfxst7UM9zCDsgnxEFPyA6A4qEpCNubhydk9j7merDJLOdd7swqQdpU?=
 =?us-ascii?Q?HM9JWDgMTI5kTzNcaCkl41PQr+wh5gO+sPXrRYVlVefSS9VnuEI3BrMDXMP0?=
 =?us-ascii?Q?izH8sbwggaL+ZH9RydEo4XU0Xl3wjnFHlGDrVd0ccKXADX6gL105ys8lYd5s?=
 =?us-ascii?Q?y8e+0CA/QzYrD1YoWnF61j9Muoq6+g26fypWAEzgzCVaPd6kIqFLpVD1+h0D?=
 =?us-ascii?Q?P0ZgGbzi8bj3lazefAPQZkWNesbU+j1biALiWEZdEPTR0AVLqGE0SX3dVB8m?=
 =?us-ascii?Q?17X6j9acvmhG6BnOPYoFd8JGrH1YVMDEAXS24Is3EaFAbsNqUUp3ohz0QtuJ?=
 =?us-ascii?Q?YI+OW8DOr2dw02Du+X6LVXLnXMbzZfCsWYshBIxl+LL+dMC5bq6KkKF0Olph?=
 =?us-ascii?Q?NeZQZUCnb/tEDAIP6BrMaTD7Ydcflhkoxwsz+B7hTTpFQOP2MvGni2LaMC2B?=
 =?us-ascii?Q?DYZQPz+zGI221PvcAzzlmIdRYlCo4Hrli9FPbC/V0WFLwt5/cuvvHc1kcVJW?=
 =?us-ascii?Q?yOssgzZ00xKW5tfMjWHSKXjWgMA2VajWZ0mNgy+fI94qWMfVpSomFnkS/bLM?=
 =?us-ascii?Q?w3dhbX3ji3RilB1/8/xqXv57CcRoZyRehyg4Ku6dJYlPAu1GTj1rPUs1qTHO?=
 =?us-ascii?Q?Hr/m5GF8dk9UHMjLatAvP6LB4WfCqWF4LP0J3CvuNFuMdlDOvB5R9eY2xUwW?=
 =?us-ascii?Q?lz5yJ9ZGKTJ2LNSOB+jX8FdAXawukuq3ygsTbnDI1nPtxef3oRrdKENd8vgX?=
 =?us-ascii?Q?MdcR6htn8EIMgsNtpAdPrut08KMboo2U89xcZk68sDGb+vviTCSwNaapaYVA?=
 =?us-ascii?Q?+FP47iwixsW+oYLBwPeWkKe9I8GuMBgGqPWbIO/83aQWa03qwR4GDeiXbcm4?=
 =?us-ascii?Q?oyO6F5ep52IzdhVaf8cX58bO0LOmrbi8ynOsX5LoccS6uvx6nuwIRQYkEp2V?=
 =?us-ascii?Q?u/hE7muPyejO/ZECtVQ8W3GGbejR77bEgnWPjIVtfHx9Ban9srRoJBiJWMWh?=
 =?us-ascii?Q?eSfYQFhNEjWspKYJ34yyVblti5oIx5uSAs9GnqOkU6WGxYQrck/lYnl588Pm?=
 =?us-ascii?Q?NfjbiweetdY3ZSf7EjHJJY2wCFhDWZUs+7mohDImkQ3nEf2hbhtbwGH9/Z7g?=
 =?us-ascii?Q?Sgv7qcHlUa/b+zuiprmL0MlEyQZu+1itvBigMXPegUYk0MTAjJSdJXRGSZ3Z?=
 =?us-ascii?Q?VVttCFkp4ZM10UA3kAevywWHKWDaMcBap/LpFYbC7c9nqdc0bQIn0RSbdovL?=
 =?us-ascii?Q?ZvsoX0dJXQrIKXAWb1HC444v3Itgpqa3YHpBv6hg4++KgkE2/6OAzTAqeK2t?=
 =?us-ascii?Q?Z8/MS/yuUdHQQbyJ2RYYPuzGktPS0FEx3M1hgypZXg5tT6KUa+p7jvW/YWgQ?=
 =?us-ascii?Q?nILiOUgUQOPjcyKgD0Be/f4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273833b0-db72-497e-fd5f-08d9e5516982
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:06:47.6658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zS38548/NKGbLWh86kc/aXLfM+yb2E7n34p9uOoP7BxIK+EK3WJEd5qxJT0D4DnLanfazwsR3gM6Vvo+cATdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

migrate_vma_setup() checks that a valid vma is passed so that the page
tables can be walked to find the pfns associated with a given address
range. However in some cases the pfns are already known, such as when
migrating device coherent pages during pin_user_pages() meaning a valid
vma isn't required.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/migrate.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d3cc358..31ba8ca 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2581,24 +2581,24 @@ int migrate_vma_setup(struct migrate_vma *args)
 
 	args->start &= PAGE_MASK;
 	args->end &= PAGE_MASK;
-	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
-	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
-		return -EINVAL;
-	if (nr_pages <= 0)
-		return -EINVAL;
-	if (args->start < args->vma->vm_start ||
-	    args->start >= args->vma->vm_end)
-		return -EINVAL;
-	if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
-		return -EINVAL;
 	if (!args->src || !args->dst)
 		return -EINVAL;
-
-	memset(args->src, 0, sizeof(*args->src) * nr_pages);
-	args->cpages = 0;
-	args->npages = 0;
-
-	migrate_vma_collect(args);
+	if (args->vma) {
+		if (is_vm_hugetlb_page(args->vma) ||
+			(args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
+			return -EINVAL;
+		if (args->start < args->vma->vm_start ||
+			args->start >= args->vma->vm_end)
+			return -EINVAL;
+		if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
+			return -EINVAL;
+
+		memset(args->src, 0, sizeof(*args->src) * nr_pages);
+		args->cpages = 0;
+		args->npages = 0;
+
+		migrate_vma_collect(args);
+	}
 
 	if (args->cpages)
 		migrate_vma_unmap(args);
@@ -2783,7 +2783,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!page) {
+		if (!page && migrate->vma) {
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
-- 
git-series 0.9.1
