Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C132DA3B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 20:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6536EA6B;
	Thu,  4 Mar 2021 19:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22936EA6B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 19:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaLHDhKVRiKf3cQ3cZM3f54izpgSeq94rgi0oV3E1R0emnDqOY5Z3YEIo/FpsI7gA+VlgrA/Pnu9hyKJtmSl55Amb7BBjDzYgf2ejbwuD42Z/C3BYJtj7fdg5SXILB+szCS8mee5icitg/q3mxT+6I1OOeE5mGchyMG4yMgpHUMHSjoEr/CpAyj8TviLc9fJ1zMztpoAtvPO6Vh7dUOK/si3sfcYPB8435+KxOsvAmffWEd++hc6R9Uvfs7ZT5awrR72i0nr+JqmGiTAtDbHYZgb4ZI6gQ6VmmMvDQn6M9jUFQ60piHpA/XcAglRcKJBoPChb/M4Iym8aJO136NpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJgWs0i/wWxh8sbkZKKMwMNS4/Ls0ngm54t4BlqG6jg=;
 b=VYSKoFqLJBoMcfLAvJzYo8vu4jhIzh1r+gr6yScOi5g9S7njL9gNIhsUHQq9yJphB4zvDRP3uAcmgxxZlkQRp+SupMtsOzSwfDMO/coIN57AYjVB1zxtiJL1cqaOQ/9h8+r+l7zctVDc5vHtryHMXHlPerXRD4mMYvH/3fE4cn48YKFdupSmkIAoKc3d89CibYFlQG8XGvScZ9/WxmcarUXEuGpoI7WEqrFq/kI98yPII281GpGa6m6ieH1hnkahqXR8I74ybiSbvtcyB6lpa5df6JxvbefQeg7sfxM2v6VhWbGvoCgQPj2ouSCuRXKdLow8s/ovcyEuPrRXYYdCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJgWs0i/wWxh8sbkZKKMwMNS4/Ls0ngm54t4BlqG6jg=;
 b=Lw8pwZi2TvOzC0faanuSMth5weFnJpVn4OW8M7Hl8L+RHF3e98oqMc/24FsqaGHjf7hw/cZiH9H1bxXaY10L/5gYgLKdTAt8zLLVEB7MfWsdVD+JB/RZO4igKTWIAzAWgPiuqkXYVk/UJ5MJS2/8fXYfgA3eqd+b44myfY4W4rg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4734.namprd12.prod.outlook.com (2603:10b6:805:e2::20)
 by SN6PR12MB2607.namprd12.prod.outlook.com (2603:10b6:805:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Thu, 4 Mar
 2021 19:17:08 +0000
Received: from SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e]) by SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::2984:fa58:6c16:469e%3]) with mapi id 15.20.3912.018; Thu, 4 Mar 2021
 19:17:08 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching setting
Date: Thu,  4 Mar 2021 13:16:58 -0600
Message-Id: <1614885418-26116-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To SN6PR12MB4734.namprd12.prod.outlook.com
 (2603:10b6:805:e2::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3890.21 via Frontend
 Transport; Thu, 4 Mar 2021 19:17:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33a3a91f-4c1d-4bcc-5e95-08d8df421abb
X-MS-TrafficTypeDiagnostic: SN6PR12MB2607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26071D888D0EDAB5B72668BA80979@SN6PR12MB2607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nlrbFuyrfPZS52+iniAUWFlrgTjAjIq0lUe3L3JY1jSHbZhIzJdwD5f7thXypn6CSgSlVbq8sn5z3y5J4tllfyynGcHxw2Lo8ycfsqrTr5QCwwpQcZxrybRfZJzMdz+ON8WsI4QsOTpwZoE2lCiTgmwg1WboEQ3ZwrBxq9esixHH2e8IRp/dTPnj5oOZ+quwqFo9YA0wQ34l8agPpqPZ2apvvIKclzKsUDckPxqbPzvg9Hb2nxFs+dL/MMIxwIXM8WoPQ5ZodULR+iuLLUHjiJtLhg/oOdVXSwYvbWe7hDFReIodwBd9eFdjl3OU5yuD+s5t5Zh6M6NxANT6XJV+WTfPTk4cOJIT6z18/JU6vbfOmxhUY1EKO9WTsxQvlDoXbhHqBsCBSH9uzsVkKBBHs8Q8o6nhLEHJYTdzApYGzPReBvYQgeDafLRnwCLOtbIA25kP13ddVCtkKlXTiV1z88+udtwu6Edn+AtJg5umCNXNOkhF8z2DqejaJs8ICDJrxc6PJRrFCaYM/uXJkriWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4734.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(2616005)(86362001)(52116002)(478600001)(316002)(66476007)(66556008)(5660300002)(6486002)(4326008)(186003)(6916009)(956004)(66946007)(36756003)(8676002)(6666004)(2906002)(7696005)(16526019)(26005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?30yALVkDBRg/JzGlYfBnCqNrakmffmJRYs8rw/4fn0XLp0eaJCzAUXSM2pmW?=
 =?us-ascii?Q?diWcRC9bz4FSFKAeGjhTJzBdvudZG0p99P0jtVXFbAMaIefZ0ZvHbC0pEiHW?=
 =?us-ascii?Q?YMQpXUgXnFR0zI2Fx5PHSr4cKzPfU8cGSe9KI8kMtzPCg9/1krTloe8q31PY?=
 =?us-ascii?Q?YNPOfRxoGBSAnSWkWdlMpuNj6NeJnptGbW/Z8CVT+86rQ00knoMgLCrPvW2U?=
 =?us-ascii?Q?QLFpLtKuaNMnNiTB2k1GKWoNOinZ4shVtPRIpXWVSuBJ7fev8rYk5weBZgtV?=
 =?us-ascii?Q?DsFk83+V8rnH2R7wbyOCkhma+cY0uOgLc4GsV+oT7K5FWl42UB8vYe0EPjOT?=
 =?us-ascii?Q?U98ENN1gdX+9GYol9FOWG8/n08YoqXB84K2sgK5y/0bf9jUlC6PSVBxAKd6s?=
 =?us-ascii?Q?VMlKWSCmpxpK5QhpFFoRFNojmxWHzc/HvY8ASz7XlSQVC3ULCkFVdpL+9CQL?=
 =?us-ascii?Q?XcxUGp7TI/d0kOs5g8njp6kkuKQB/jXiWhgo++w8aU1joaNPJ8iYmF6/H8bJ?=
 =?us-ascii?Q?6zbCMDTmKlqow01A7OxWb65ZXvu+oGm9UULe4d9gbeVOU4Skwo9I75w8Hk3D?=
 =?us-ascii?Q?Dd91MV29o7IAsYZRPC6sGahDGz5Ns0wtCLo7N4KGbcHId+2uxJMryX0YPxbg?=
 =?us-ascii?Q?klaHFMmzCCGpaWuVrDRplY6N6vk3olIj9Y/1m12F2BlAap7WM6nJQDOkI5OL?=
 =?us-ascii?Q?NqA+bYDHRF/qmaMyH2I0tcsjyl4fqmNI89M/md+FIxE5wOLGlpYU4Fz91TiW?=
 =?us-ascii?Q?jWdLggq27RNEntBlK1FyGQ9+uOLp7OE1zMNxvpdXxNs47WAoetR6N0OQNuHE?=
 =?us-ascii?Q?YVTz3aUdj5J9RHzgjgKLg2hCptRe+nyNP6Ahc6gDT+5xD9VmUupGPFaNcIMT?=
 =?us-ascii?Q?JRfoCAVYK3i8iShJVvhe5cZkyXSHZnZZ5QX8MrbDMatyoPSjmhLr/K6UJb7Y?=
 =?us-ascii?Q?EN+K9iBxq4dc5jqmCouc4xQ0eKpKHFvxqqT1u4+3Mha4H10xO+iw8N/bgzxD?=
 =?us-ascii?Q?hVNRPIraxu1fIR1p3QWUlM+qgWjayf0JagQ/0biMXpkA4utBQ5KvFQHiGnUm?=
 =?us-ascii?Q?0ZWdM9R89EVL3t+tyx+QXcR6lUsElLOtZQA7G6sh9Htn5Zm5ZOX4219lyWu3?=
 =?us-ascii?Q?VBkx4KsZPzM7mDrgHt5A4i3BMOlF1xUkswdgWo5PHQdQlblwzL/MXyEdZp2M?=
 =?us-ascii?Q?QjWgI6vAS0rW1a9/ANrHD2JSx1I5e9bGXqFEQ0YEWDvZ4W8JgRVsc/9oHg1K?=
 =?us-ascii?Q?EuijJ+Df2FhfzPy0peGU6XKuEAvuu08eyq1cs4HKt1bwD5j6miGm60oSrdQc?=
 =?us-ascii?Q?8plLMuOkX7jPccbXsnYHXGiK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3a91f-4c1d-4bcc-5e95-08d8df421abb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 19:17:08.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHXvpNOnGk4436mv388+5t+u4H2DUXkyL+hWrvWCFvQPk4n7DsmlN9iAY8OKGir+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2607
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
Cc: Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If tbo.mem.bus.caching is cached, buffer is intended to be mapped
as cached from CPU. Map it with ioremap_cache.

This wasn't necessary before as device memory was never mapped
as cached from CPU side. It becomes necessary for aldebaran as
device memory is mapped cached from CPU.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 031e581..296bb20 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,10 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+#ifdef CONFIG_X86
+		else if (mem->bus.caching == ttm_cached)
+			addr = ioremap_cache(mem->bus.offset, bus_size);
+#endif
 		else
 			addr = ioremap(mem->bus.offset, bus_size);
 		if (!addr) {
@@ -372,6 +376,11 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
 						  size);
+#ifdef CONFIG_X86
+		else if (mem->bus.caching == ttm_cached)
+			map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
+						  size);
+#endif
 		else
 			map->virtual = ioremap(bo->mem.bus.offset + offset,
 					       size);
@@ -490,6 +499,11 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
+#ifdef CONFIG_X86
+		else if (mem->bus.caching == ttm_cached)
+			vaddr_iomem = ioremap_cache(mem->bus.offset,
+						  bo->base.size);
+#endif
 		else
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
