Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABF4098B2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105A26E1F1;
	Mon, 13 Sep 2021 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B946E1E6;
 Mon, 13 Sep 2021 16:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKweG7Wx6hfU78SNcLP/ZrxC/aGYMVSwCgtDk5KGcXUENQ5eyNlV0i6jwTulN5A08RA5DFpEeRUwuJno9klFvHuTtY/TtNJXtniPXHZ3zIUHtaGW1aBZZ9L0UsPqPIGp0d1xHu5tImBW/nJHX9urtWudozVl5Bp/ALVUEW11W/Hw3KvUI1PAO0Z8xTMHMDAFwgug+sDB5X2yHi8oABiYflsFLaWQxuxUCJ6mRA5Oiv51qzKx4WTkTDOymhCxFSnhkhn7Dzyqgl3ec2HH0nBWbd5zw/NKIGi669vfB2p/bykk6rdCti4rBLgzJolQyKrO9QUzxcGRWh7auG83na7NGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DtslbnmgwcmVuw3/IJPuNMBAqQP2tzGnRh8lFmQvcmg=;
 b=oAaR3GtSJx5M9sA/G6TAkAE3rVlAYUYH8wl/C6ppVrBv4+pPYlJ2cX6bC/gZkQcWL/3/Zpex9m9QzcmN3ulTIIS/3rFSnjCuU1Cbteq12l2pipzkV++0/scQuSIZPDxwOvzrUudXWN3LqQF7G58XT3G4BwHHOYiMXsH9gGiSEyAg19MDPs8MePxtFcNyvaoZXLI5L3bYD4YBDIBEgzSugsJBWIw9wHnFMn0cCfXBWlMNJ2rEHR/j/6NxK08N/hkZuCETXck3cmt4r2CpYj+59O82pkObGzCt2BSzFuxAJh7GagXbHXzSpMLPLr0CDXU6OLmBCscJA5w0EbyiOJxESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtslbnmgwcmVuw3/IJPuNMBAqQP2tzGnRh8lFmQvcmg=;
 b=WysfpxMJgNIFvpKm6atq9yT9N72N9MTzx+x3x75Mt3xm946+ZOc7Q71WMCXHPy6BM42i9zrGujKIdRR2ORSasN5hAq4Y2L5Hor179Ex7Sx2tprxhKkeKaKN5sx5/nNdNZWzT0VoDpnlC6Nt6/GRtxA24lEC/eXot0WTP5OYuJeI=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:20 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:20 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 05/12] drm/amdkfd: ref count init for device pages
Date: Mon, 13 Sep 2021 11:15:57 -0500
Message-Id: <20210913161604.31981-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b8218a3-a963-4a0f-56d7-08d976d1d2a0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27676BC1299A837A2F7BFED1FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6I2Zus+O0FBgz+1ApIpd52hkvk3S/pKvqSH6SZyg/pxvtFZCooyFOC/uazIWNuNCSra9FCc6mDySHB32l+VQq/5GwyNfGk+v6vOC6kus6/wLfEKv0bLUVghhn+97AG5ce/R0BZsTFGiONXkWQLu3+LISz145QUj/YjicksLb7EWWtA7X6KrSDhHQ18zMSgcuSADTCldhnDla8uxcOf4XJCvWhnU8mfduMiR8AbWeV66c0xLPqyeJ48MFLb0sLJW7yN0nxXfn23AxVyhsUl6v++s30C+QmDMHiKgna6JhtaBLuPPum3avU1bFD1fPGj1vMECI7h5/+SznvQhK8R/XOE+UfxMnHrkXMzF8MK7RUhDNGyFbcLcDPAfkbr04uBAaKp2KSpm2kczmg/YTp/6/TLMpf8UW3OJ2SK0T0H0gzeeSbJhSjbcmQNlm5unQYWyg9rYPKB3nLX80pbXQcYXJSTu3/bHhO5uDC+IeG/lb6WY6azkSp15finwW6H+sx6Y2oiUyOXjj1UnSIGYquV3by3kkk592Yml8XtrsqDAiUdnjrWCIqU5782zWaYwdip4mC1IgHCzJ4jxx2ipjXryN/w2zJxj7EA2bgCw1InH5dzLnZPAkJH3fMMHiHX4YRY1sxvlHVDUS3iKRDPDTw7XXcTDooWUiSpEeH2QMz5B7uFgzbEeaCwInk7OPX6pGDgTSRh5I0Fys/1VjlpzcjN38Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(86362001)(66946007)(4744005)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BhpBqPIwpLB38UvGlkdXfdJtLyHgl9MBt4DFfigJYgW2X4M++DT1RuKo3ya8?=
 =?us-ascii?Q?URhYnoDD8nLp0dB7BD/sflUcjyiAq3f0hsZIpq0VahsPbIruP3clUNF78KW7?=
 =?us-ascii?Q?BipnORAHErGFaAVXNiJyoC6k6Qw3ZvhVPomM2OMldXLgCAKDjEpMl7FkY2I5?=
 =?us-ascii?Q?XVz3Ai+pKPDHhsVqMPLShgYsI/EWPM8Nxxi9CBIWMx9SecElgcOwLOVWceK/?=
 =?us-ascii?Q?DXiavDqfqOREbBuQtw56hFhdSBsja6IO2OmpeTpBOW4IUBbM2/gwu5/aRF0i?=
 =?us-ascii?Q?6NyN+SbcFImdhSu/UXsG8TkzRhtMj7SiN2iXQZ+MD0PXc7Fo9XPymeYffU9V?=
 =?us-ascii?Q?qHeNsHo73XtADAPEzVbApUJJptgy/AmWOZQLj0/ItGKACI9CP/w+3Bznkwln?=
 =?us-ascii?Q?YtuXvHuzVPCsN7vSmu4luUDZ66nWzLnPvFLaSwVUTIFHfD8+p2PKpognr6et?=
 =?us-ascii?Q?P9JU8u14xM9lrUWvOGzdynH8jU88r+hB7/HHf06wsOE4wCt6UubFb4XwqSVf?=
 =?us-ascii?Q?NTi8+1D22iHACTaqa2WC1Ul2gBSvhsAugjtzMNjh2imXzBIgWTt+/3K5w9PL?=
 =?us-ascii?Q?KVRu/eUKeTwmBeImW6aG9DSlIyzvtdEAANRj6gIsHB26+U02KXiO2ppKmjHU?=
 =?us-ascii?Q?IDxqlQD71Pjwb9+g9nOAhAXv/eB9PQ872ee96m4GeWGgmKlRfsIGaZzkfypD?=
 =?us-ascii?Q?ti+CjfmyrKXtHyVrHtxkfyZtwkXQIaJCruD9UfRUcjwkyqOLNi0q2Yj6rkxE?=
 =?us-ascii?Q?Bcg3BIi1BWZG+hVG7MFDZcMfZVdT49cxgAu4lg2FAR9MaENFHHkiLAHMymA6?=
 =?us-ascii?Q?+4Il9vpSuwkVHwbQ5QICww1BvZm7G/EIB+n2L5T6R7JOoyxf21EL6vBYXaya?=
 =?us-ascii?Q?opw30qnuQSeiKAuY6YbCiYZvuOM+zUEvojjjfFWuEXxknlFHVD4Y84F6uIDa?=
 =?us-ascii?Q?DzP5bZb8VrlFn583oh4ay08VBWJnyQG4LwI21RfJ96m+WMBAnTBJpDXvSKaJ?=
 =?us-ascii?Q?Hdzc7d164UJ2FRiQ2ShBYy5xrppPiF+IHeZYQDlTFDqr9qGZtVFK0cXvo4Dp?=
 =?us-ascii?Q?/kUpy8Kin640RFuAI8atDHvVb15s0Zns5zrjDzp96Wd1iqNbw/dLPjE7NczA?=
 =?us-ascii?Q?yVpZQBcdhc8qNUujZFPiARcHt6bSSa2QqGWHjE+aC6JDfzX09Tk5wFRQFuO+?=
 =?us-ascii?Q?SDb3KKFIH2YpUr9bnB4PrirH87Qsf7m0J56H4FGiTEttrxcJmo7d3zyMrMFy?=
 =?us-ascii?Q?jhjcr4bu8kTb8J4KUf5iGP27HcHi6Mi/2AAzD+4aFSxof/LeYFkVk49QwWlo?=
 =?us-ascii?Q?JVncRgfO8bDfX8kNil0q2J3o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8218a3-a963-4a0f-56d7-08d976d1d2a0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:20.5214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtoVzQaTrJcpN4z1dnO3PyEiWFygZvUUjqPlwQXWxlo3OsVwhhD1a/g0e97wE1QVZa9wDfzLsD99eUzQvsHJ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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

Ref counter from device pages is init to zero during memmap init zone.
The first time a new device page is allocated to migrate data into it,
its ref counter needs to be initialized to one.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dab290a4d19d..ffad39ffa8c6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -220,7 +220,8 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	get_page(page);
+	VM_BUG_ON_PAGE(page_ref_count(page), page);
+	init_page_count(page);
 	lock_page(page);
 }
 
-- 
2.32.0

