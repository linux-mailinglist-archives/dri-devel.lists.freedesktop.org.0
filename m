Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D269398C986
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 01:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D0B10E333;
	Tue,  1 Oct 2024 23:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41AE10E322;
 Tue,  1 Oct 2024 23:35:07 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491NKBbw021537;
 Tue, 1 Oct 2024 16:34:51 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xd33v0ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2024 16:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xpejua1D/i0ZcC68G8NV+x7Qw/CkWnDK1QVfDkVOaLsyc9b+HwRiB1KHXW7aghksmT/zKyvLSk7M4vYrRLJG6GAhtuk2Dn6a1iPbJ/CbZeUuqYunuJ9S7NB93aqqoGFBZmeT0yB2LqgR9Q+a6EC0x5RoGyPug+wdDJVQX6n2GoKDEcgcz8ruTyAjb1WZjvfH2xHw+ZlEutsrgrC2y6plrZCPEWnVRkulAlQVHfvYdxwLR4tGTw0nyn+gX5E1qg1MvxulRR/o/B5N8F1GdO6ObP+rgBYALzbGsD2vwvLNOxdxeHUW6/rXNV53+H3y4Z5zkKkaexUQZcDp9wKywnbOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iX5TfSsQt0FTXna6G/GiRO0JecQdmmmdAT2PVVA7iuc=;
 b=bda3oDo9wJ3oXGtZxUbWrGWNZ7rxY7wMfqyf8mMD5TF6xirLdl/JoArjrwx3EdWJktkZjqc/kKaRy2df/vIxmcTMd9eOnKWlmqmmoRA+SZSoLmhu7DYOZhNyFONrbgUqVAz0gta2RqyM9VGnqZ7B3TZZCBmtzVb5Nsu+gZSeDquBT9ScITYNXcZmzQ7LucUagUUtpNXc4uWN0uI3DJoqgSQ2M4XleQalFj/q44hFMPlqJVomj4zaS/9d0HOozACxAR73UQTiOV8L8DQhW8r13dtWH0vTdtJ/BYj9EWnEgTwg6u3w8s8H6ZmiFF3Z+NzG5H5ZhLGhf+iUa+f8EFeTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 23:34:47 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 23:34:47 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: l.stach@pengutronix.de, sui.jingfeng@linux.dev,
 christian.gmeiner@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 linux+etnaviv@armlinux.org.uk
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
Date: Wed,  2 Oct 2024 07:34:30 +0800
Message-Id: <20241001233430.4072268-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: cd82c803-4c11-45e6-d60a-08dce271a2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xdPrwgne2lDTD3BiA2gEfdwP1puomKspCtn4FIR1SY+u5ru0kyr3n+yj6elW?=
 =?us-ascii?Q?9G2xODPPxHpll7MCU7UsPYEON2L/9dTUXEfJeNRjcOrmM4OmQVjOyqoCEXEm?=
 =?us-ascii?Q?2CF3zwk+TDXIz7PcikZBspRcaHlr021x94G81El7EmOcCyDY9NP+aLZ/NTWB?=
 =?us-ascii?Q?Xk6+gEMbHJaXeDk7IjPK6bwiWt30Z7nhnDJWi2A7BxjzCUxIwDC9dHWRIpwn?=
 =?us-ascii?Q?M4jJaIzhRc//T3IFowQhTbH6KWTHyNsaBLpKuuWf4Qr9Mjy0UHA4OCaA4v5Y?=
 =?us-ascii?Q?rvc3n8O6GCxFzU7i7lQmBTCEIX1TSzhhLWLeMBRByYt9LbYUR/v6HaVHS+LM?=
 =?us-ascii?Q?dpmMJzsv+ouyRsGC8W4y/ySAJWG1ksuKMrmX61LEieWsXaRU41bXw1Nycx2L?=
 =?us-ascii?Q?NPVW3PbxMtL49ZFTNoBnbLVy+jC1q2M5/+7Vt6LBCxekPElwGHb80CFZwrK7?=
 =?us-ascii?Q?e1Jgz1q9RUmBLaOzDDuxBtI5JWwug4S08X4tQIoJux7j0/2Dy6guBOzUvyk+?=
 =?us-ascii?Q?XQ4mWt3huxR3o/Ek+jczFRVjBwGnhneansNAaK5yVhUP9l3ApGo31L/ZVP30?=
 =?us-ascii?Q?r8mZlfYprvb2mv4HtzdFUo4VryulMmNksm2cXuRL2zWgUEe5TKZJart42Stb?=
 =?us-ascii?Q?k5X4WvRSMMEZe7f1oXL0f4XiFuIZsIv/iXupwXw1NNaFJSh+wxKGqSIv8awE?=
 =?us-ascii?Q?qmLU3NXlp+I+BcMY+eLhQBlP8ttwJqWgaH8dkhVqGoxYQiILAjZK611W3p/P?=
 =?us-ascii?Q?PHUxHHG4x9Y0gMQu6DoiuU2jdlOZKrjW3fnTZZqHIU1HyD3kMolJFFmYaVB4?=
 =?us-ascii?Q?R49vr9RwK+5GOIYD/dKpevPDb2K7TrgUcX1TDd4MzPdHJfaUV7SQ/QNL+lSK?=
 =?us-ascii?Q?3cg3UJbeB4WhbzzazeRYEoKHSGEjm9jFmRFpwSgykQ+AxtERPYsXvdzjTUQw?=
 =?us-ascii?Q?bQJqEOAibBYOMLJHDxG1+aBcS9tK2TsTCAGKwn/uOkkBP7KsUqo0uv/7rJge?=
 =?us-ascii?Q?enzrhcFvw4cjwSouOyenGexXHGxE2JKsup1LNrzNzKyzWSCDiUiiM0QC67PS?=
 =?us-ascii?Q?9qwMkQFQpfCmcFNfkVbyOHfPrUwAEErkS4pRIFiMYFUalRZJDHYU0yTWbEpO?=
 =?us-ascii?Q?pofXiY34MRFx9qpxTZ2ojXI7vHk9rO8b+CSiJt0Ee/xsm1nNOt5+gLrWEduR?=
 =?us-ascii?Q?HZ3M6qQYRDkG/Lx6AhFEQ9IF8ZdtDSCzwOfXcXtSyX/RVnJaXW/FbFv6UEPU?=
 =?us-ascii?Q?XFhQPpIK67N3no5So4LBPGmTC2U+ia3ZZKJ16crcP5JtYtnG2T+FyBaxY1i3?=
 =?us-ascii?Q?+d8sWyJZiCRtvS8wkar2ETBI8AGdYPb5jSdMZ7NDJ3KjM2wyF2Rs2U6FLO77?=
 =?us-ascii?Q?8NqPOW6EbJ1xe52G8zZ4duA/QcL2RHe3dRhas5qoZPvcqqNWig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQRM68IetAOIK+TSuh9Z7fDUof6HGkRivUxcpnwxJ6VyGHdg5eTn7evK8a6M?=
 =?us-ascii?Q?y7gmBF5rL+Q9F9CMXulfqp2KZhzchdWvj0+QLl1ObQNuQRoPbwzFpQ5u3Co7?=
 =?us-ascii?Q?iTuhjUxBzozVBxe/X1eyj+K5G749SMmAYDHtHtQl+ijIKRpilP9YuzSCtq1O?=
 =?us-ascii?Q?d1X5ZLlLQAm0cbvY2jqukCr5oq2CsNxFCb+rbXy2YPQfNL0tpmU5YquklXXz?=
 =?us-ascii?Q?O1CpN9auzfw8r68RhIKq0m0W9VjGxbHaNTmP9heU9FvchkNygw7QswkNNTd8?=
 =?us-ascii?Q?32hQ1lTKRYcHWZxezZeDmrtc8Rq6+8Vr36U2ZH7BCqA2hxdk18XD1bsXX6L1?=
 =?us-ascii?Q?LIytg8dwHLCJfX7LiBbMu5+3tmC+7McyX8msbusMyAy4H74ydyNeShuxYmK3?=
 =?us-ascii?Q?aVUhA1spZuMnLXZaalO++SIa3g5IbE2SxvAuCOWcbkSjOhucmeJULyj4owJs?=
 =?us-ascii?Q?eLuc3lBNFLrWGec2SY8Lzo7DOa/Hq3dnH/x3RTgUWy1YbaYUe/ZAoY5mm4tb?=
 =?us-ascii?Q?ajj0+vEVpyXyZ4Iy01KQTWQ6xWUn2zqQ4GzdmhpCXKnLnLqaHi9bgiasQD+T?=
 =?us-ascii?Q?tC31uG1XEUF/V6VQDhzDIZDjWEjiqn93/JdXSrf5A/ipTYUeh4gsCJJ3H86m?=
 =?us-ascii?Q?S2vz/aTrH++Qb9lBolQPU6Rj00wWRjuKA15kQjrDz9GNpycqamOAqmKoHpNG?=
 =?us-ascii?Q?E5zOxbdtAWyTpRGghidqhlNsqKpDV5/VOZinP62Qwt591CMdjZqV3ZQ+jdgF?=
 =?us-ascii?Q?kQ9eyBEPSnavq5HK0PPdRhYVB7+fav7BwtYBaPLnwejKKPxanu+41IhKdqoz?=
 =?us-ascii?Q?IPFyHaQ7pnhooGJjS48E5+rY75/+BPBmjtrOpGFyCND47eKtA/r3cBK7wxLH?=
 =?us-ascii?Q?vG4F/3elyDJzBR+Ug0fFOk5papD+75t/lJt2P8EEBgWAYr/CI98fw9WLzKmm?=
 =?us-ascii?Q?LLU55Xpa8mWasZNdaMDwa8srvP3C4kx6KNdpTaKX9l2zvHCj4nV/7EnclX6Q?=
 =?us-ascii?Q?7DjuAgaF5BRQqzPuTuxBDHPZNrF918k1Jbu2b/OF2D1iY4XEXMRKg4i9RyIg?=
 =?us-ascii?Q?h+dvudtu+oqXW3feBbRevfgJLe4/15Ts9FpPAsfvqWP9/YOM6i+TS1oPABSv?=
 =?us-ascii?Q?7itC9HHEeMZgzGSsvBrlvPbn9TVSgztjDfPPtOnxqxNZ8EpCsdr4vhwl1gwK?=
 =?us-ascii?Q?0PwSE9lQb1Mm8iZea8VEgxNOsb/CwNCFpaMFDceTDw/aAavwbfU+eRECiMmt?=
 =?us-ascii?Q?M6Sw9O5ThH3TGZbUua90Pm7x3FozlRoKQE3lk/FA143CQgjBI9Wbi69tgQ9f?=
 =?us-ascii?Q?MlqTUnwnCtIauuQs4IwhWoL06QzHNVAcknw02VSS1m9k6dRdghTcWv0NRr6z?=
 =?us-ascii?Q?/EGCVHEt1GtLK/A23i18uOWw3BMC4k0qPQufLk0bUt3QvZTr89ecJfvz8VOj?=
 =?us-ascii?Q?KSRUynfPORh6wwC3JunYL8amfrgBvezBHvMMnPBEjOeA1WQIncubHBDtPYsT?=
 =?us-ascii?Q?shyLB2pQR4tmJE2DZKSlbS0PootX/60l7zgTQNzynAQ24RTwV4tCon7Bfeg7?=
 =?us-ascii?Q?XMXL9VI1eZb00mxjTQyK0BHMyuSvkCN6tjXxfO5lJmvYnvn+SgBnwy8nmW4f?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd82c803-4c11-45e6-d60a-08dce271a2e5
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 23:34:47.4150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2+bMo0s2ePzraeYxGWqrp3jNupQK7cGRUv+9p6DAoR4L4qyhmMhUPJGijauJrjHjv0luNXIS8wAc89nzgbN6+FB9//0Elyx+nm9+CcA2y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
X-Authority-Analysis: v=2.4 cv=deDS3mXe c=1 sm=1 tr=0 ts=66fc871a cx=c_pps
 a=UtaLnOzkojfj4BVWksq/2g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=V2sgnzSHAAAA:8 a=VwQbUJbxAAAA:8
 a=4Lk9SkUsuccqyY5IzNwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: k0WXFf9yeJr1bLjF8xC5iWJ8n1Gd7X8T
X-Proofpoint-ORIG-GUID: k0WXFf9yeJr1bLjF8xC5iWJ8n1Gd7X8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_17,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2410010156
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
Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
---
v1:
  https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/

v2:
  Modify the issue of not retaining GFP_USER in v1 and update the commit log.

v3:
  Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
instead of
  "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"

v4:
  drop the HIGHMEM bit only if dma addressing is limited.

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 ++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..19ec67a5a918 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -538,6 +538,16 @@ static int etnaviv_bind(struct device *dev)
 	priv->num_gpus = 0;
 	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
+	/*
+	 * If the GPU is part of a system with DMA addressing limitations,
+	 * request pages for our SHM backend buffers from the DMA32 zone to
+	 * hopefully avoid performance killing SWIOTLB bounce buffering.
+	 */
+	if (dma_addressing_limited(dev)) {
+		priv->shm_gfp_mask |= GFP_DMA32;
+		priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
+	}
+
 	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
 	if (IS_ERR(priv->cmdbuf_suballoc)) {
 		dev_err(drm->dev, "Failed to create cmdbuf suballocator\n");
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

