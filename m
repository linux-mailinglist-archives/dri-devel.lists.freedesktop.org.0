Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF33969151
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 04:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887C10E279;
	Tue,  3 Sep 2024 02:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6299210E200;
 Tue,  3 Sep 2024 02:09:40 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4830rVMt020082;
 Mon, 2 Sep 2024 19:09:24 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41bxf4a9ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Sep 2024 19:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQVHTTFFAM0TvgcX8yi4raUH+TWM39WbIwBCQNgwHTTm2RntLEXRCRE60wF9NQX2veksjZcz91n7jg3G4sUqKoRRvWcleVv24Qct0rLb/+mTeFR0cKYcusUo/SSSBZReincA7J1dJqM0S7vqgYdwOTpRpXlLP1ID+yeFvwERDF/LI2H3Fb5FZ5ZM7zMawkwkUgRpcxhZ4hmUVg201j0bVncRSA70VZTr0vjrxXxabbfP4Za0xrhnATKv6jWxBwSa1Su0ExjLXV+REA20Dsygz7vbna3xa39hY2Q07bAqsxDu6AzsBkShWJ/PN7bVFSZGkf5l9GI9UFtzX7P++Msekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH0w2Ds76bXwhC2vODpKMfmR7gxclfT3mo0LVIGSTmo=;
 b=MdJpPkJLOgTHjrbRhBg5m5eBZI5NqVHB2POgNPtVwhA76dlu5pi8nGOvkf8gZqm4yTyWgdgA84eRVlxPo1zl4dN0WMcGpi2YbKK9cnq/taX87pwCGIe0T/JXRzGvYyljmLJ32VtA2ljGRSZBF94Tuth8uca8OmUGKPkl79c2fUVlq1O2ubnivfLaEE3DPiJhcSR3EdQAklw5j9NNVnktgAw3u0AAC7RC/TEjkDliqVghL/aOCM1YzKyjp4et7Bu6ZtWGWs+LefEH43VuTzOkunE4ehks/yv286TUAG0eVLpweaxQrZwBuaBS1QmhLgaaSBF5EZQW1vvU6g8+czpLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 02:09:21 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 02:09:20 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sui.jingfeng@linux.dev, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
Date: Tue,  3 Sep 2024 10:08:57 +0800
Message-Id: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 176c1221-94ff-443e-e95e-08dccbbd6c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XHIDB7zd/Z1/fAO+te00gC8RUqCHxZPgM9mcQAgst2LNF2DBqxsxkMz/TamG?=
 =?us-ascii?Q?yS1iW3o51JaoKA7+3ylLb4D6S88mceAx6BTB40HGHK7SKMx3sVMqJBWkF2oD?=
 =?us-ascii?Q?qvZNsq74uw5ryiNvlXX5tXgfwK/5wEyNicQVpUtMtu2j7CruxwzBJSTVhsXY?=
 =?us-ascii?Q?zi2laOlYSpyhyQO8FUysjPBgLHF2caED8k8MNK93tLSD7oAmQ5dgpdEzDKCg?=
 =?us-ascii?Q?O/VWVqQsrL6Ocza2SjjmLTXxKwbR6v5/0Ehsxpv9QY40hfDTjYhXH0YCoMS8?=
 =?us-ascii?Q?a73LLAhx6VvLYH7bPvhTdyLW+El2YyzkyakNRupoiATJ1V3aFGqUzRnM3bxQ?=
 =?us-ascii?Q?5u3nSknnHgAkcD3yr8xoWA67SQMEg7SXDkJhyrJ5O6Fb0Z204b/rc/lIoG1X?=
 =?us-ascii?Q?taP2ImyEa3jyngyMXrw4wX1Dyxw7RpjdZQ7mfiPmdEoX3OcXUftcYAB5l2UM?=
 =?us-ascii?Q?Sn5i3RY11Qnw9c6navXQdBbye779GXMtLTVzZLJXBV4Dx7fV+NKBJWcgNUUc?=
 =?us-ascii?Q?VFIXtACMIXsTQcch5uAZgSam2fSEWlk/kZBJmzHXgmGK4gV8HRWzmskEoNnV?=
 =?us-ascii?Q?VWJeu4sw5Bqbj00yLdsI/UTNMvo5n4wWGWP42sHVnQC8e4hCtI50A+RcXZRO?=
 =?us-ascii?Q?QlnE4i/fdlG/k3f1jCiAsRcpx38rDcKOdzAvANiYr08lx76SkKnJccGGsVw/?=
 =?us-ascii?Q?RsMUs7vNxkro2Vh7+QydWV0vADv0ObXKVHwMbtoVTGDFuA5CAt3IsLwkgfep?=
 =?us-ascii?Q?79IBsCy89NZELHlsAvkqlg6Yzk3GBzjmZZXwtaZspVNeDc9xjoz7P4Ypxvq7?=
 =?us-ascii?Q?V5KrBUVD6o5/93ZQF6wvNv6o2Cte1EXEzQ2FJR9VJzpq4WW/TGznRhVr3n9/?=
 =?us-ascii?Q?ujjkiqo7SyJDIsvLk+VzPxiYuLDfIFvIyzw6rnvK1G5bF27XaLxNcXYsFt92?=
 =?us-ascii?Q?XqQNDUCtvKh+DyE0NJEGuYclIt6nsb2u+2TPMw2KaSB895XkOQRvfuRTHX8B?=
 =?us-ascii?Q?F6RtXCAGTg/i0EsLY04KSxpOv+6jNrjitsXfB5wiGU+S4IVb7OOEtvK2Yy6S?=
 =?us-ascii?Q?6PHUad5luZq04DVEARRcbX0jgUvb2NJv1tUyAnTC4KSZHc0VWx9J5mZ29YQh?=
 =?us-ascii?Q?pDjAiVGvvg9261o7sULxaE6SIhuI5reogTvDCdMZXr2FBwSyUzwHj4d4OEgK?=
 =?us-ascii?Q?8VXkvmgGKXMLsL7A8V5q3PQD4FSZ82xXK+W4FVOy6H2xdy7hqaIkxUowKAI2?=
 =?us-ascii?Q?nA4OjTRzs0f/YpguBH2KTm935HSIkPKktio2aaSfGhb7BiNFPcMMNlc39OLf?=
 =?us-ascii?Q?PrMmSeBAM/494vgG8FYtUJAKht0W4svXj0Q8bQxL0omgHTjLg8Dr1+P1zQSN?=
 =?us-ascii?Q?eB2hLF4EQ/VbT06rn4EA5c4M0S9opGJ1Z6yB4Y1cT5kBMSwZKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6O/D8A8dXe3vTTK7Fr9rkt8WSfI+Q7mz0pPYXHFVxHFEcqsNWwcTUBd3t4Z?=
 =?us-ascii?Q?mLTrIf5TkqhxvnOo6Q+wk4xRAbgON0LpZ4GijNuNmUgQ/e2lN6Qi9TflMD5k?=
 =?us-ascii?Q?jQi23573FRZQW5sXo+7QTnHeNU5MaVgvjrpDW51txJ9VG9yKJTQZkQoabMeW?=
 =?us-ascii?Q?TODCMmFby+cep0Js+NGZ7N9wYOWRV1aiupFCckAFII5AnPezyn1pMaC8ZMll?=
 =?us-ascii?Q?K3vS03/qh+SzfmS19GcqclVbYB48qyxhDmZElnAsviUOywg4ppj+ljh386rI?=
 =?us-ascii?Q?vidYVZNqBpkP3uqlxVU6jKZy+6DQSFANMcLh/TbW+lENgbwJuR5ZU5rcLNm/?=
 =?us-ascii?Q?LEEh8GsatUVY43mRsEg5sOJL9N6qxq4Y3KLEIBBSPI2aWRQSKMQ5q1VwP4Bq?=
 =?us-ascii?Q?k4GVbI9jWzA0hlP2gpZI/pvqvv2OvAx7+MJdhDLjyxiHTBzxZi+u40qL7n0S?=
 =?us-ascii?Q?uTve3dZvgN0gzuVvH+x0spi7NMC6cMFCGfUsM+ap2B6cB8A4btWOJsKcmWbs?=
 =?us-ascii?Q?O0sI4kkaxpDLEE6gIs1EHDba1AYivbKWMvWU4VOAcrnCE+s1rGyPRC9+3Boi?=
 =?us-ascii?Q?52h0/pow9aSongUJlI8yHM88tgs3zSO4hXCUSpgmn6MZDDufOUXNmuyJXNur?=
 =?us-ascii?Q?fqWbPoHTpVyg+g8eM4im46ng9SJYUVB8hhuf493Pc8gOs798jvCi3OwHdR0g?=
 =?us-ascii?Q?YSAaiUlhFxjIVp73fx9rJTz++8hZRlE907M8OSaMHeV7+7mS7rAvHoUwOL4v?=
 =?us-ascii?Q?XSQKQvdkAK29HzWIuLrX6SC1Fbyu+7Ct4KoFQHwR48sn9KBepSc4EUgcnYZi?=
 =?us-ascii?Q?qGi7pV3yJxXdiSX48p8Aw7CU0NHPNICmhs/OO8PeivYxwqX3Vfss5/sfwmln?=
 =?us-ascii?Q?Ft5T7GbuUhXB5hrJ6B8qtT/loQNLn6HlM8wDIuz/+QqI30FbQpfu0bPZOfrJ?=
 =?us-ascii?Q?LzjVGdz3Mxfk8Vyadn/LYyiiA58phd9IBSFPTpmO83s8HygfKDQQjziUyfiU?=
 =?us-ascii?Q?Rw1u89ClzpES08BYd4CIMpO9On/amIJrV0Ts82o0XT1GmdrASdgAgCYKMd8N?=
 =?us-ascii?Q?X04IWRr6EF8WLRSe2SQbh7K6Q7WGfQAPpjdaGe5BCutvkAVbdr1YVdlAMz7V?=
 =?us-ascii?Q?RbEJq6nSd5Zdb3WM5Kj4ERW3fVspqPCSuh0LFxcbtMf6aQhzi7CJYHAsvlmE?=
 =?us-ascii?Q?c7o7+R9ErvYFZL+GNuN5AqGpuj+QV0ROArnslkZAEn8GWus4bWACWgvrXNpc?=
 =?us-ascii?Q?EgTsxDZm+TsR41XlnOUTe515pYF1+4/xg/kx0wvBm0ICbYNl+vi3BcB258Vo?=
 =?us-ascii?Q?bKwQOscClMXj0V6muingab2o5QwzP5way6u8h0f+0qRYA41nLwCBWkK0wohc?=
 =?us-ascii?Q?ZAfeOadFX2s1zjgapFtT/vWSE4xaniAMx3JCHwoJEmlG2UijdmtV8Kp8E9tA?=
 =?us-ascii?Q?DgDbYGyRRDdqNG9tACZaLfJeLs674DL1/o7Odi9m4CKSt8m7o5pwxnfPfdG0?=
 =?us-ascii?Q?FJwU/kuHWnic5AYO81/OLm1rGJtLWx9C0whJGfblNuznPRJq13zYGRUNSTZx?=
 =?us-ascii?Q?GNuO4OzW0SxcnndGhuyCbv6fGfIjQgpuegjAK42qJ+iGC2fGXYdN9ghTJkLN?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176c1221-94ff-443e-e95e-08dccbbd6c20
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 02:09:20.5059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMHK/WjKf1/9IjZE+QWDr4wWDWlfCBZx5xUUW+wZE/lheDyUrjezNHZ/+mkzj7GLGrYlLc2jJ5QAFKQceAfLBuLbyIRdRsxVFOEbxCwcLbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
X-Proofpoint-ORIG-GUID: 6T1pm8cvV73Td-1G3Xz4_H6PTdwpNcsX
X-Authority-Analysis: v=2.4 cv=X8QAK3Te c=1 sm=1 tr=0 ts=66d66fd3 cx=c_pps
 a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=4Lk9SkUsuccqyY5IzNwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6T1pm8cvV73Td-1G3Xz4_H6PTdwpNcsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409030015
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

Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
and since all vivante GPUs in the system will share the same
DMA constraints, move the check of whether to get a page from
DMA32 to etnaviv_bind().

Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
Suggested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

change log

v1:
  https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/

v2:
  Modify the issue of not retaining GFP_USER in v1 and update the commit log.

v3:
  Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
instead of
  "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
and move the check of whether to get a page from DMA32 to etnaviv_bind().

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..8cb2c3ec8e5d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
 	mutex_init(&priv->gem_lock);
 	INIT_LIST_HEAD(&priv->gem_list);
 	priv->num_gpus = 0;
-	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+
+	/*
+	 * If the GPU is part of a system with DMA addressing limitations,
+	 * request pages for our SHM backend buffers from the DMA32 zone to
+	 * hopefully avoid performance killing SWIOTLB bounce buffering.
+	 */
+	if (dma_addressing_limited(dev))
+		priv->shm_gfp_mask |= GFP_DMA32;
 
 	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
 	if (IS_ERR(priv->cmdbuf_suballoc)) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..5e753dd42f72 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	if (ret)
 		goto fail;
 
-	/*
-	 * If the GPU is part of a system with DMA addressing limitations,
-	 * request pages for our SHM backend buffers from the DMA32 zone to
-	 * hopefully avoid performance killing SWIOTLB bounce buffering.
-	 */
-	if (dma_addressing_limited(gpu->dev))
-		priv->shm_gfp_mask |= GFP_DMA32;
-
 	/* Create buffer: */
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
 				  PAGE_SIZE);
-- 
2.25.1

