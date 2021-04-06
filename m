Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5D354A5C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBA76E20E;
	Tue,  6 Apr 2021 01:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C746E1E6;
 Tue,  6 Apr 2021 01:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoeVCEnQKoLGKM7JpuVGTubKvu9ZetaP7kpH7EKEisovZoZ6rki9JjKDRlMHowXHX/iQ0tSk+zOetmNaycJLcqsA84ZNZhYrOMvNsKqPGqtJmMMPvN46jfYVkzgw5YHEFN+xmEPX6d2wLGTAvKTXV/4H0hEZNQoYi9f/7Si+TR/srGHaA1mxpyqAIjtENfpsmtx4Wv651/Cflc6BvzGnVt+r/TnbPmaSO0OHVZa5Q8fa58DQp90ayoyW0V+cXgWnEVCOmEZqbYWtv74HA5GoQlXFE7gxD/TRxM2xmgJIjCVJ7weIaXVvljM0s6OXzS2QXy5X0vNbbMfuR94v+ODZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FgbuWIgiZdll1yEXZTJPKfYTD161PJGQuy2rOSZ4lk=;
 b=AAqwR96S6fkU/XHo0tnG1FTNp/gDw1iBDxPaBMFOChLTP0KLP2UyZVzBAphjLHYwlG+yaONdQ7Vr/Wicx1VtebdD9rQzplcA/DgpcN0cbHAAofTqkrWVjcB/ktct4MoLmbTUW49brUk0LGP9PtlANtdMDKD4BORpk0/Z+fXhGw7lxYwCVLVrxAiY4fgKgc7NZ0SZ7V6PZq9ppTtf97FnFXMRHT8GVoGzcvIBc83Qi5zIr6HLeUaewlB4kthIc5LImspXFz0X967eHIiw0w+Bjdf+tt1wlD+nH2AJKBrHc0QQKgouryK85GbDRUUjmJfoT1WIgRPrCC6Q4cZAsGHFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FgbuWIgiZdll1yEXZTJPKfYTD161PJGQuy2rOSZ4lk=;
 b=CLWADVZJH7rlrZFiLxf3GCRrujL+GF7b9wCTh5tKiBcOtACY+QwP6m+bBXYFqqQxVXTgGdf/A7U2ImTLB9Ge49V8vBmYGkmUTloGqkuhtm1/FENqWVgv1aSjvg/+N7ANIJUaU7xDR74CLqth/Iqxbkr3dxFpVxMGJYsg0geNIxg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:56 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:56 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/34] drm/amdkfd: support larger svm range allocation
Date: Mon,  5 Apr 2021 21:46:01 -0400
Message-Id: <20210406014629.25141-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a345c0a-a490-4528-77e4-08d8f89ddc43
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37734FE644FB9893576761CE92769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uTsMSc6CP3OfnwbVS/ZTrsKpIP9I5Pms4Ir3/v15VgoTeBKLDoQ2W35+s88yHvCvnR+cIQKpTjtN/eqcjhz6Mic4g+fzriobwTOC2yTsU1ke+hT7v/btl4wjtFEDV1aKYb2YOgAdweCcQD/+65nnAVnXPbk5zzrdmBgTPy873glc1Ukv9dXeGktJkU3ASYKKQJ9zeRVWUyGkfdFSDrp73pxRr0NA9ohpa9XKqKpsWILBULgw127vWO0sWpmOw57pnZHD3qr4pZA3+7KyP1mhNRAdBrufjdSCtQH3a+AdRz3Py/zmDbRZ8QlgD8jbG+0EHkB4Zbcl8767yv0LVad6A7+lk7o/Zqkt1LOawjov0FdMeee0H82TZ+zQfWnb6dyJ2rAPEJTFTmwBGJ2v3NzX1qZlVyhKFbal7FiZsJGArqmSX4F78+J7OPQ2oZa/BgE5uVdwTKua7/BBcB/PByn6ta8xUapwrxO8QVBRT1OmkMsbewHnmKW0MrE4Y5o1qS2OX09b3t0CYHlGjb7bX5DEvqF74loB2eTSLy3PV06w33C3qvDGI0g9gFATutldYwArIIms6V6uKhuZjCiNKXOz5R/GlrZZTgOZTl9B+NTctvjaFhuM25Nq9ght/+EO7Ia2kBwTlTjsyixc7GRsBAIUe8fajnynb0RqqLBEjJIolN8PvaoKSCzuGLbooqZf+7O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zG4DUZ9Yr7BecTgTRARKn4kXvW+PTg8+6ZbPMupqWSKkhZMgWD8q4QVS3/hS?=
 =?us-ascii?Q?DqIn8NlcIxFPFa1wKgyWFr+LSC/8m3HOZm625Knv43L3mRLVIxLXlnafTLLz?=
 =?us-ascii?Q?qvcsGnI/n4jCmcglUoaA4i9Z7N6+SDCSSlZVp2ZqPTzG6sBapnzysygTsRiZ?=
 =?us-ascii?Q?YutTe8BHkT3zYRAMWNaBapIFQ9G50zfjrs3Zi1ritWC2eNis9sKhHcWmtM4h?=
 =?us-ascii?Q?AVbDWpqrhU0tLXG3WjqAevmRvIZVyKCoK44nKJ7skdw4XXFXgd9mt5fm+ZTj?=
 =?us-ascii?Q?sL50jBfEWnER9yW0C3B/LWkzvHo/wJ9nLs3fi7om+6PHJg9lspJt0sw9W0v7?=
 =?us-ascii?Q?AebLUD2PkaJ7BYTg7HDHXk7sQk1g3c+AXa/CbMU0Cee1wVDTEqMOB224xfWs?=
 =?us-ascii?Q?eAMyPY+XDjVIObNXJOT0Pm8cnp3JCrCKbmVN8VshBGQO0gDD7pvO6YdxpgBr?=
 =?us-ascii?Q?DXgcQ33RR3evW8mLqljm8vvTE2Hj2Xtani52MkGBVNZqMX7H/alnZxpeMa6W?=
 =?us-ascii?Q?NnKXxhtagqWusSxoRZTkmVYKNLAi9hiaT+hOTUUq1KOGpI6Boppu8OfjwAdi?=
 =?us-ascii?Q?jJxislTakPTYGAXX2tcFcAxA05EWvvac9gg2o5IpAkkulzISiGkOv/Qs9uFy?=
 =?us-ascii?Q?Vwgyi4KyeEm+ufmJ5xfLVqszU27ZIVnSiG+2hkl5XC4DWPo0NqrZKSKy41yw?=
 =?us-ascii?Q?vIyjaTlH0qdX4YF8dAyUpTZGq7MAzWszKl/Szd4F2Sq7TnvYeOLJ7BgT3r0n?=
 =?us-ascii?Q?TWrzjjfvraZe0T9heru8wOG77IP9KKykRI8EiuthvFIFhrdlD8Uou2SFHnZB?=
 =?us-ascii?Q?T7HR82GhvoQThgIsN3GxkFzBcNFab6mQHhTPpOD+x62vOYPUKN6NOyjlIGHc?=
 =?us-ascii?Q?FsW0tF2uoE5/Iqm919B/uFr8Syo4uXzsi4FgWMB3M7tsrBIIvNZo52LhMY2+?=
 =?us-ascii?Q?LsxsFenebp0TAWblCERKXiCZrzMp4AiPcAh3RgQHcsfnfrDFr824PNTDTxpV?=
 =?us-ascii?Q?Ax75ZZQeSFpj6uhDrr0g3E70SNF43L+XEV4XRyjCQa7ctSfb5Js1ZPDIhob2?=
 =?us-ascii?Q?13N+KL4iGwq4uEBlLBNBhF5P+g6DFoAJ4tZrZFtK5sy6rHCyHy34MTG6PBMf?=
 =?us-ascii?Q?G3TYzt5JlvTbsfV8TiN7tuULdq3+H6HoNfkuNYPGVgdGop2pDJW0LWjJ49N/?=
 =?us-ascii?Q?qRIWIRU0uEBSE45KEwe2vtKiL6bQ/C+/zKgcb4zGAwJ8rtcnOUoVe7mQwenB?=
 =?us-ascii?Q?rdYKPUZ+d4Evv5Liz4I5s7OyIiWybwnRvIU2NmS8OqbitsrAmfvBOsKqcHBC?=
 =?us-ascii?Q?VCvN5G5NsDOSFtXm6mmHaF0t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a345c0a-a490-4528-77e4-08d8f89ddc43
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:56.4367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKQghZZaYLb191I/oXTBUKiUbpcte0hcxZH0NQbwQywfGZS9kcBB/to3VA4+hKgbpokKr9zTpnfn98uNqK2Juw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

For larger range allocation, if hmm_range_fault return -EBUSY, set retry
timeout based on 1 second for every 512MB, this is safe timeout value.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 997da4237a10..2741c28ff1b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -185,7 +185,10 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 	hmm_range->hmm_pfns = pfns;
 	hmm_range->start = start;
 	hmm_range->end = start + npages * PAGE_SIZE;
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+
+	/* Assuming 512MB takes maxmium 1 second to fault page address */
+	timeout = max(npages >> 17, 1ULL) * HMM_RANGE_DEFAULT_TIMEOUT;
+	timeout = jiffies + msecs_to_jiffies(timeout);
 
 retry:
 	hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
