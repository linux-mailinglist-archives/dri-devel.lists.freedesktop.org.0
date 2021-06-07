Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D077E39E8AB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097EC6EA16;
	Mon,  7 Jun 2021 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5B36EA0C;
 Mon,  7 Jun 2021 20:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbvudekOZoj762VXfd8U8rvr+eaS083WfrCJjoFZU+gVanDs7xZp4oAhcNJPBehegM2k3IQ0c09eqB/VdJLlqqvAf/1XnRfiPgkXTRNJ9ns1hgfCbO7rfEy99ELAg/DM3EAk5AJ5Zo00KF7VGFJ2TlSgJWQboUxD5i4fSI7lLWTwk2DM3M6H/u2mVsx5GECNEKD5TWvfeaYYo4CCykF/jbudYqEZL47rrzhYFD1bdGeLzfWvJg5QzNnist7edg0sNr3prVOJPCLyl00tfHv4YovoOyraZb/WY5ZNMqaNf9zf24Yjz2CBanTZUnOUWardubJL/MRsNe0fIEJJH7bPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fto7oGTXuEchER0GieOzKEfkpiqMw64yv0w2SD6NgAs=;
 b=grD2EHIkLP8zn1oiO90bTVhjnl0q0tPvA4zfBosTUuQjIxJ3iylqYZWdfRn9Jk4pBqw9/j9TpwNkMONJFf12yzXw+TswwklIIUUGeErEA8iqDBA7lmrvXTlMHXOZEcqscc2zwPnk1CG6z0MAYRkAyPYoBUqXCmi3ME9+85kdQRb6wP1XmpCDv85e08NFdJpow/1SJ5N+Wg++R8eb+8IAMcKiKgmPZd0sbaJO0sUE71+USqhmKkQrgHy6BIafiORaj0EnrzkWQAO82h12XcjgOVRQyHbaSWw2WNj9IeKVb3vQzQmyXcjTTqTc086yUJfD+wVA5Z7YG4Zz/1lesygBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fto7oGTXuEchER0GieOzKEfkpiqMw64yv0w2SD6NgAs=;
 b=bil8kyODU73wnU7ABfd30JsZY5NPgCy+etLk+JbFlO2J14SFvk7izPKP42vmeLJB72IAwoxHdJN+Ccvwn6BnVPW6dHKPhRkV2Xo5AOEtjW9jVDuW0Qj/DnMiIJyfPWFbyko3OmQcV4fvNBzipe58zg9dwj4JvAlK9Zb24xvoGqc=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 20:42:45 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:45 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 8/8] mm: call pgmap->ops->page_free for DEVICE_GENERIC
 pages
Date: Mon,  7 Jun 2021 15:42:26 -0500
Message-Id: <20210607204226.7743-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0df5c0-d618-4759-b7c9-08d929f4cdab
X-MS-TrafficTypeDiagnostic: SA0PR12MB4382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4382E5DD9A454DCF68866112FD389@SA0PR12MB4382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ln/jdAEv2NcggsdMbtH/oXoU9tF8Qh72Pp04Q9pIZZHkBp8dt8yNLfGlIaJcJ2oBIvm8mCw1neYRKB0Z2CRWEsyDgldmfob7rEaZ91oOfTimR2JXwdTOGG+I8v9b9F8SKpSWSOUBqbuOFmclIoh8wwtZhLNcIkCeTN5Gw5F2N3mdh3zn5A2H3l/9vckI/pjAGZQG1cLbTm3UJtp2OC4kpBLyAqowGpjBQ3U6X9egagqzFxO3SBg36CMimSxQd608iz2jTaVKI/o5789if2pPrtkJBXsH5lg5T/bhG2YN4KaeoEhHI9WD5AuCUP7IxhgJw7AwL/+89dzMu3vaS+y2ocpmCO0RodQXZiXvkQ9qYHUuiZM39pte6nFnIVjYfE6XL40VIx2P7lWLf2RSjbz5AEt/iU1YXSQsQ2YPUhhmbSAxnhUjTbiUEXik1acstdNGbhq+yAm0PrvzjAsmwy6uQXEiDvWVtaAJMfzj5sq4bKjaeGLW52MunB+XdRq3ob5ZUnUw/aeZ0ZbsSdX9RLGSzumY3HArL26/6jalOpsjXiKvxBm95n4y7SK4YKQH+Y6kcsGLVbDp2/mPiHoaChfpvJNxqwGZ9PZPoreL4Uj7IUMbqaZ1psiYf5HABJkMpWF+gLfYBWPN0HlCazQZUWq+hKRpxf/mnsev/5n30/j2PQL3g/OramLzcIyn4ZBYetpE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(86362001)(956004)(2616005)(2906002)(52116002)(16526019)(7696005)(4744005)(6486002)(36756003)(186003)(4326008)(478600001)(1076003)(66476007)(83380400001)(66946007)(8936002)(8676002)(26005)(316002)(5660300002)(6666004)(38350700002)(38100700002)(44832011)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r89GUDAkMeol12U7Id+Ua7o0DSNrJMMIjYmg3GFWVpme8+stbXNsk41vKwQE?=
 =?us-ascii?Q?88SRzfsAZMENOiBeyQdLKWkeD3cvTKRQLktFnLPTAnOWARuHuywMFIALrRoJ?=
 =?us-ascii?Q?O9MsMv7YfrLsjAVDKDi3VO9IDbqQAq+02fMxWpVfowhqC8RWM2qQn4Lb+KqJ?=
 =?us-ascii?Q?QPE0p8u4h+Swq4NBmG+Wrp7jcxHDL5mC0Lj+wXWPGbi3KTsYpvo2nte2v7tp?=
 =?us-ascii?Q?kJI+dWCf4Vsa+7YMPxqm9ENT9peDg11TVHbCJLjUHXYUonqmlcOkt7fz5Qud?=
 =?us-ascii?Q?xex1rVDxLhiNePKl/m620Jk5wKc7rDli+xZq9KqqPOITFvajQPJJeBrmeacD?=
 =?us-ascii?Q?XFTJiBcMLOiE+fbML7JozPK7Ei8tsQvn2639JzWyx4YPTo4HI+KWTTShMfYl?=
 =?us-ascii?Q?3S7gC8jSGCQxu4WFbbHWYk3H1Qg144HJzvzkTmUV/9CLJbEF8Kgd+w52RXFD?=
 =?us-ascii?Q?mSFXkE+xV5bh3iOkt201la7jLagoN1ZdM+YPJhleGYxMwQ+H24I06OsYUWZp?=
 =?us-ascii?Q?xKh/zM7jwvT3auZiriU/S2ClVAUvVXu927OC44jpvBFMU3i3fLLwH7voUn8+?=
 =?us-ascii?Q?KJmogpgPZDuLvhPx3x0o8tDaFFx70BT3WZ8Ei1mz5IICa9A7NPIZoOfnDJcI?=
 =?us-ascii?Q?CCVI388hhHcvgeZgl/fdGRenJgAMc9ksm6WdemtzTvxdDTs6vUQzUIEj+eCQ?=
 =?us-ascii?Q?hfhfKY6itKmd/k9f2FKiGhSssE9ORVo9BOisp+FofYDU4d+QH9tHFxq//gto?=
 =?us-ascii?Q?bmuKVrre8V5aFYNzi0k3maau++l1JnqCGWA2ZRymmUusF1GzR025nbdDkP4A?=
 =?us-ascii?Q?NtrQc5iekfKYb6Is17wbzCnT/NoylgCkzOi5im2YLVAld8iI+yhdoWQGptV4?=
 =?us-ascii?Q?9vEuIGavzTg6Bo/41vMmj2Wn8YgP4n8ofDa8clNlJDWqNHL8EJC5cbHv1Y0C?=
 =?us-ascii?Q?FN/jZXdGWE87//Js/vUAKbbJp/ZEf8th7D6XXrMu0dkV0P+0HgN5XllNyTCW?=
 =?us-ascii?Q?f0OKsrFw5a86ldnpYy/VAtuiK2ObxHYewogSS6sAVxirJ5P/Hyis1N3DpuT6?=
 =?us-ascii?Q?6dHRaOBcUBNnF2KXD5hs5Xu/KQZdFuQJI3w7pPWPN/UBSeOOd8sK6VP/v1uJ?=
 =?us-ascii?Q?0GM9/purot0OJ8OqCWr/dz3cjpWcZuuqUYki0B6u3AUU7MC4ueOv7fwiCPoC?=
 =?us-ascii?Q?5DvPonUJkJnvb1EbCqC8N/eCQkSTY7VAfq1iCOSn4L1pUqgT0W/ET6rn2Lbj?=
 =?us-ascii?Q?UY2alse42VqFU4EZMamAzccQ5ifvMOdQFpfjvfPwZA4Uv2sxH6n5ZV3bZHip?=
 =?us-ascii?Q?gqzcecnF7AAHBv6Z4TpwTQK2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0df5c0-d618-4759-b7c9-08d929f4cdab
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:45.0102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYEX2bM6MZo5nS0ruBW3ZtEnlNW6gtKbsXpbng8cMwKyczRcQj/NAeS0qFDbWTmWb/R7n+6zN6U8UPYbiu57Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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

Add MEMORY_DEVICE_GENERIC case to free_zone_device_page
callback.
Device generic type memory case is now able to free its
pages properly.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/memremap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 614b3d600e95..6c884e2542a9 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -438,7 +438,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-static void free_device_private_page(struct page *page)
+static void free_device_page(struct page *page)
 {
 
 	__ClearPageWaiters(page);
@@ -477,7 +477,8 @@ void free_zone_device_page(struct page *page)
 		wake_up_var(&page->_refcount);
 		return;
 	case MEMORY_DEVICE_PRIVATE:
-		free_device_private_page(page);
+	case MEMORY_DEVICE_GENERIC:
+		free_device_page(page);
 		return;
 	default:
 		return;
-- 
2.17.1

