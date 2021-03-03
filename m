Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAEA32BB13
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 22:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F06E9D7;
	Wed,  3 Mar 2021 21:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F28B6E9D7;
 Wed,  3 Mar 2021 21:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avksmU7a5XhPQfeogMOMKI/ycXXcCFl4Gl5J1GczWw8QhBvJQI52PA0hAFPCVYf6Hpt+7XWu1InYrfE8fQq4lrsmXGw+Y4mWfTxMiyzT7zaFKWnXRWZqiClX7kcidCfgmgGLTHdwf9wAfPUA0G/l/K0mV40EBmd/LHxKXvPWub+dXVqOty+s5IVEckb7c6UI+0lREZgpeNWJhIjCcrxg7PtiDMV5F/2lMwJIZNbiwxzjGCTVz19IILV25wsPmoZxwgxovMpRw7l+CTasu9g7wmp54Uwve2pDVQx5/OS2MU+8xjyrC58wR9DRE/Yu7+pv/DopqNHhq8hpgCnvWIAhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZerPMKydv92aya6JxGNkd6oRAaKl9EOHU4oGJ+r2KM=;
 b=eAoSGhxtfYdgMstApJZBJsLHfaI82OWNkJKWDAmiACH1dIEVRIqOuDfOmUSUErNJ+IKnweauWAbifjsmDmrgLYSeKHzfU3QDZ/qp/0gBniQ+oUGfDl5Graa0EYqnqbHKIs9Gguwf7IEIR1/LCNDmGnTK7Gtl4Z6JZ+AnRbrLKyQH/ylEG4EUdm1JNXwnmwvQDUFdgWtbjZJw4Ce0r7yP97bmBWWMSbo8MlcMLAvGbAsnqOCgzKtNYJ5n828A0r227Ut9yCaRC2GGdqyIkVIT2Ao2Zy1MlvTziUnfe/drZfa7U5T1BKmQJwMZ+sx2qnreVYI9d5oSFQvrGbHE8d9G3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZerPMKydv92aya6JxGNkd6oRAaKl9EOHU4oGJ+r2KM=;
 b=RJLnK/2xV178pY5F2tzG7+ADAZkKj0Y0CrklJtM3uqYHcZ9kX76VIe+1NUKS+dR7qel+nHVr1GWpY1Wc3YVvojOQud9NCbBREKHQINxdr2W1xPIJ6z+VC7pqK/PIHJ/Mo4ScotTnOEP0Ip1p+kHGCF0Nbgrp2IyijjaYRd/bbQQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM5PR12MB1419.namprd12.prod.outlook.com (2603:10b6:3:77::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Wed, 3 Mar 2021 21:12:13 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 21:12:13 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 brahma_sw_dev@amd.com
Subject: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching setting
Date: Wed,  3 Mar 2021 15:12:05 -0600
Message-Id: <1614805925-32431-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.25 via Frontend Transport; Wed, 3 Mar 2021 21:12:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49f8cd03-654e-4854-d40a-08d8de890395
X-MS-TrafficTypeDiagnostic: DM5PR12MB1419:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1419D0509B008F4827069DAD80989@DM5PR12MB1419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ecdqrk/2zmVb5/HO1XMoD/KtThEAQZKNG8d1j3uxBmsTk/JSr0DEBbC2zPzVHT5kg53uHBUH/2Q+KsluomjGncrvrevFAZIvHQJ0BllOWQDEHjuqF98huJrfAVLXqmP92JYOlfUUjIEU1hD+NT7IiZojhGDpt1B4M9H+UAl/ZLksPgz3VFSTNtEP9AIBrDPdLMv8yDkf7ByPGAXYTOzIPxeHz2iLX89sttKx/s51VioFEpBOsoXx3DjHKfL0+XjmfX1w7XlEfs+1ij8Ne9jKGC+ZfIOz7TjCeRWucXUitDVlx7ChQH2cpIUsLkYCqjG0V/i5Oj84uA22M3UjB9yB2vxFVt+MrIN6xxoLTbNy4Fq8FjhHI/UFssjvXxH34RAEnStzWFQ82Lj5Th9B5J2XhcSlvFBpa/+7S4iOGnGYmEVFYMgQ6Gv3Ceimc/z1t7ZDPEk6yjM+6OhUKVjVyP6X8vcBc21+fszRsCwEaJNcAG+X+wIpTkU0v3DsXCMSASMxsRbVoI76UUrko7rRs5QzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(4326008)(6666004)(36756003)(956004)(6636002)(2616005)(26005)(7696005)(52116002)(8936002)(450100002)(316002)(8676002)(86362001)(66556008)(66476007)(478600001)(66946007)(5660300002)(16526019)(6486002)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yXEMtGdyovlDJts050QI3RNjHGY7OuMDhEoGEodn63PbOab+9+pr7IP+whLT?=
 =?us-ascii?Q?N1zhK/P121CkJj+qYcB+Sdd4LQQs9l7rlx1eVDIO51i/V888LdHZDLZwPjR5?=
 =?us-ascii?Q?gvIZuSV5V4D9nrTMt2pBORjz2nQrc0t+pPUg1oGzcwHcU3C628Zi8YtTAtg/?=
 =?us-ascii?Q?TWDrOhVTLphWHhvzivS0mSqGpKpciWmvIHKxRiP5M4iBqPFk9qAmekJ+VzdX?=
 =?us-ascii?Q?G643JGMR+XxehFUPQtVHrgVtHW/WWzXxp7nrNxc+1PfwfaxCjfv8eevRAETI?=
 =?us-ascii?Q?vhN1GvnSlsjN56Yi7TUS603MsnNiXBfnWXSr/jfdPsrtSL5EICzE745OHTu0?=
 =?us-ascii?Q?pPfV3bukHcp3/WT0BnrmPhkTZvQ52S2azP4+7i51c+s2nh3WSMx9UobTkjcr?=
 =?us-ascii?Q?l3BdGeRdCfgzcJKa5096l7yTkcGpl+7yLEyIPrLkabxAwAqiPlIKgG03Jrts?=
 =?us-ascii?Q?/KU7juiD4UeMHxuUrVemZ5m3EAlgU8BUuw+g/k16/eM0nSGa13rQQj1jtR2T?=
 =?us-ascii?Q?cyHCveW5Uzr3liTwFHpiwE0565NPaYxQTNZfJ5Wukycp56yk5lo47p8rfDnX?=
 =?us-ascii?Q?gMsy+WYLF5VK9aBLdDcmmptMyoBWJv6xNBl2gUyBN6ja3M8GKDR78zhK7ZHJ?=
 =?us-ascii?Q?aT2jSj5kzwynCvW0mbJpONgq6TU6SxWjlnZfaNp/I+e3DCQpaXso/kXUGOxS?=
 =?us-ascii?Q?GEsF6LhDy+Cc5iCrPhIw1Vzail0p/MuhKSHFpx78I6XyD/4F0pglOU0r0p64?=
 =?us-ascii?Q?vGG3Q9AfG4r/cLCfed/9HOqsQtBVYWBO0t0ocFjjJdR4INftQTIr6LFIXC4b?=
 =?us-ascii?Q?GclpEXm95maAc8wL6n0TIXBwnvjnIpqLwpbPrmHOQVfOGeb8GULskbCZT4bT?=
 =?us-ascii?Q?CimvtDnmAxLNXacYU4hlYVYOZsM5IBtbWHI5bUA65TZK/mffxWx+upgSJWP6?=
 =?us-ascii?Q?ZgXaqiBi56sJaRftZeKGjEFk9nXK0MopezcbnScyr7E0PHzVEnETZK2HYAlh?=
 =?us-ascii?Q?delPN5mwpZp6s+XrFGa8ySdka/XqSgbECGFB01jsRYiw9y1azhkBf0w+BxAe?=
 =?us-ascii?Q?Gwf4FIIKn1mNhr0onXYGsqqPt13gQ+nkfDGHk0HiIzOTNbLJeontKjGbmCgX?=
 =?us-ascii?Q?PvgGKXKB4I7jbhIfe2IiA9yVOfoYe5tFpGdmiWchWLuZcpjHqdBUV1w1kUYh?=
 =?us-ascii?Q?f1RRTg8rqGC7D+hsOKwIUYWtzlSnM8YD5+YSKaA2j1sPcYngYCEYPDUdeXf1?=
 =?us-ascii?Q?Gah9icun/S1xrZM6xMIyUlIwBhpmXJ6xCwkSjIyw30BbSQxVvpqKUow0Wt72?=
 =?us-ascii?Q?pBABHrg861HljROzEcOcNh/H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f8cd03-654e-4854-d40a-08d8de890395
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 21:12:13.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSBnzMf/6KU+yO8K5Vrtduxn5Pn7eSy22Nqa5op82ip93+u7kaDYPWQLy1AR5YvI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1419
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
Cc: Felix.Kuehling@amd.com, harish.kasiviswanathan@amd.com,
 christian.koenig@amd.com, jinhuieric.huang@amd.com, Alexander.Deucher@amd.com,
 Oak Zeng <Oak.Zeng@amd.com>
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
index 031e581..7c848e2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,10 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+#ifdef __x86_64__
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
+#ifdef __x86_64__
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
+		else if (mem->bus.caching == ttm_cached)
+#ifdef __x86_64__
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
