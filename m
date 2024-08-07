Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EF949D61
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 03:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7E210E120;
	Wed,  7 Aug 2024 01:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E550310E120;
 Wed,  7 Aug 2024 01:34:03 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4770udWC006299;
 Tue, 6 Aug 2024 18:33:57 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40sfu03a6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2024 18:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AApIFSayBToKg47n05So0LBltVi74H33KaCTFoZXZqwqV2jaGHn60tfogZ+FWEx2EbbDrjAcg+/WlS9zKP2WKYtYpUSPug3Uxbi1VPqtECYb3IQ2VGXxCi5GtbM26StmTDGN8IZJpcnury/iUpPgDHozoCU6qWV7nv2uMv8XYBRwt8JB3UUX9y2KyC8BOGSrwO8JVT6tD26MzUD8+8zMNfSJ0kJv10v/db8YGzPms8eToF9Gc+1UgUs2rsukLqzxlycIdYKaVGta5gVgzpVJPEHjI78WERj7IsuEFd1+asY2e9sKD1FHJyvo4umeo2abpqzea1nC7NVODg7JEfzocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U5fk9LZm04ySE6hZAqs7Pwtv6yBrIwZi03XzCmjocY=;
 b=KN8WvjE83m2SnIx98UW/XJuTlJZniLTgWV+hMpVx5X5YrcmM4Of4Jl+ZniKHQOspeMptjybZ2cfOmHHUnglFLj1rs6Qv1KKeY+nux4QmcdnPbdWvmDwkiopQZVb6E3yAJmN0jPAS5ww0JVbstPYK5ClasGreWcf7jffg7HY7tYUejNFDp4/TH2c7CaRaUxMXXi8R+VFo01Mg67NbekRL+c+vzg6V/QEfP0CEHuT69NkpvU/9J8qtBGNy+z3dxfFlLfOsuH3xrGcYK8wD+QRF2fEOw99V33A1p+26F1v1za0p4vHaixaZRbYruVLYxHwsYcGmS2SDaOCehclG3PQzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 01:33:53 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 01:33:53 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_HIGHUSER
 with 32 address
Date: Wed,  7 Aug 2024 09:33:28 +0800
Message-Id: <20240807013328.2795300-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:404:42::33) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c7634e-3465-4807-599f-08dcb680ff14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EbswzdhC3OSPyPctP3Wj8xiLg/nPz2/i7nsTitFlUPcGOKBsX33vn/VuBW19?=
 =?us-ascii?Q?SU0wQRhSAJe21ZTd64ip6iUq/ahyg4pT6tzjKm79nxYO2hwGR7hgBcTb0lHT?=
 =?us-ascii?Q?RXGtkQc9zL1xjsfsoFXolN74DE56Z1U47mavBmL5Z/SVV6kvb485ubMXj/TL?=
 =?us-ascii?Q?CpY24hhUYCqImSpu78/1scvGPx9D7F5cibAISiHa5BYW8aHoCJYVMOymjLCP?=
 =?us-ascii?Q?QMuOdIl39zsh1RprkrmXEb+2/dNSZ2SL6sm+LbNoJINsYidQ/IuuPUDxh3Wb?=
 =?us-ascii?Q?KZ/KXABo8z9/lQlEHAKXkueOJHbSNVmy8Y28jeTEgvJ0hgGso4JkbDyR/G0j?=
 =?us-ascii?Q?+L1se3UV2HLAwaMwc2hdI9KQN9+rDMyO7hFNQ4nIvCoBNda0SuKEL66trB2Q?=
 =?us-ascii?Q?UGqCM8G1bCRI3T0sut+eZYAxFjMN1KU4pTQTzHuf8C6bxEH1zdR36sAtI0xJ?=
 =?us-ascii?Q?SbGiw9+Xu3EnIF3ezmjoLMkf5CmUwEGi051hwmcsKebCXCrg9Uycx4b4b4e1?=
 =?us-ascii?Q?Kcz6kU18ekwT/C8XZCP74rR/l55ru6jRSxqzyVBfZG51juKjB1d50AXWg2Z0?=
 =?us-ascii?Q?kJ4lz31phwplfCvEFfF6NUjxLs1KnNCeeh5j7WqQ+nuJ0odTmmR0vYdaB0aR?=
 =?us-ascii?Q?VbPKWRpDlgsBLD/syBbYv3Qsongw1l/cTEqXmrmgDczwPJhPYQjrEx/VF7NK?=
 =?us-ascii?Q?5nTbSyExXNld0UUp+AVYQj5qTn7BmIU6NZuk1yB3za+06qGd4flkuOzrHa1M?=
 =?us-ascii?Q?FDufd6Nvn68qVsSvm/qp28KCQhHQuQJEDrF8/q+t7PC3N/WvpF7Hd2nXzH9F?=
 =?us-ascii?Q?v01Spgijzp/WKDY7OTjlmraBAqqJqBzxxZP7hEo2k7b6WZ6m1iyfxsex7pmI?=
 =?us-ascii?Q?yGk0p7ubvOwcRlM3WWZlaoRlsugw5SF/OQLRvyOXS+ue3xI9C/A8aR0EnPqr?=
 =?us-ascii?Q?fbCp386KjLfUkuuVdcA3T0aQznQpb+y/6it7z8zjRag+kWBMvZk1v2amc7Bw?=
 =?us-ascii?Q?O2YJmXwEsoH6kF2Y9Rrt8eNqEhprWvBv4v8wamcvq+exiz2NAJ+RhAbA2iaD?=
 =?us-ascii?Q?fPfCOXaXwEFKx3hyVBHGE3dlxKmogh5k5suAxHWS2/LsklGO16VOiV2sO7L6?=
 =?us-ascii?Q?lm5+gbeDw6rKOYdlIHXfcn6c56AexeADB+7qiBI+vjex2pMbvw9c5vVuoYoF?=
 =?us-ascii?Q?OaGmWOgbsA01dD6I/DMfxVzKxg6v1R5FAlu34jSuMSLzE6t+v5YBkRP0Bwe5?=
 =?us-ascii?Q?pP8rPfZ31/6Vb37exZNOuXpWAE8SppEZCglEcPLHCnFmWwz5j0AFbDy9ieup?=
 =?us-ascii?Q?ga7qoOOl9AVc3l0x4kJsrU/R+Mwt0c7udZGb8KcldFzanQeIhHJnscSHlrsi?=
 =?us-ascii?Q?7F0+mAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I1E8QbQUXuHZ6O4lKwqmjd6PUAT4AsVORvmxPkKigXIg2K1ExFGOZNym9UY?=
 =?us-ascii?Q?tiJ1cgWxRimcxgm7eBWptVwAbm9iKa0h4SRRDcZaYHQBR/MDT8aZ8t364u7q?=
 =?us-ascii?Q?lqmYBwUigX0gflgW3lWC/DH6eCwY+X3vhpvpFRUolm5vQuqZm2V9xMHG7TJ/?=
 =?us-ascii?Q?H5hu00Ta65btDvqkGZIJWrzm7pMgH9KtqNvR/42PaxJrlbw3w6YuLB4FSeOE?=
 =?us-ascii?Q?YQvYzyW/OYFmk4I6bmjj1ffrOG/yv2Z70qJK+hfL49M4HdlZZgtObxHD2OPU?=
 =?us-ascii?Q?cn4TccUsqoFo7ndnHqlNkBu6MsFF/p7+2T5LsMLbW7J9NfACp2VEI3W5ZUnj?=
 =?us-ascii?Q?nJ3T/p2XIRrGqdH24pCz8kTnJZuquzdk5cVO13n7Zj9SYAfKlOdibuuD9OwT?=
 =?us-ascii?Q?RShYuSSlknqrLlzjkmm27b8ZnFFC912+cnd6Th9omtjCoLjkfJUDrat/QvhH?=
 =?us-ascii?Q?uAWBI/XgWt5EPAZ+UVqpeRNAQm4fpS5Rs48ilSch5S7GtTnsSnF19/IJqR8y?=
 =?us-ascii?Q?HYJur1zDC2KxfTgpHFDbr2UDMmaGJW5zG3JKRtPIHW+OlDQAp7Z0i4jkPB9/?=
 =?us-ascii?Q?7TjoZ96U9c/pA5UeuzsBrYQMX+XXqrjtHAdyQBy90jW9D+iolm5MmrD8BzJ4?=
 =?us-ascii?Q?tm3jesd5a46TYv3n2eY2hF/8EsPwahZLOlCY+G517+SiNwgXTAZcjQNtX95F?=
 =?us-ascii?Q?2gKMluDFC2B7HB/Fgh4N5MZW146Sur2Q5NoODaT2uoSd+Pxn066PBcLv67Kz?=
 =?us-ascii?Q?NC6XVkfVdPoMJrYzZwwt5Tsf8n3narV7kLQqskWgNaQXGKhCtNiPyBNAQ6Xc?=
 =?us-ascii?Q?wMW4QGRWPiGOI2PXDYDH9AafBG65JevDQYMjRyXo4ssNYyiYSeyIRBsDlaG9?=
 =?us-ascii?Q?gDRakrNMc1bpwTNoctQYTSeo8ros4ZQ3b39mjGSCOJJsZ7OYxMMq7IW+qrsa?=
 =?us-ascii?Q?A8Hdszx8/CxuFzn79BAVsEwUxy1NdnuGwZgv0NOzJR6tl3O3Loyf5Yqc9CSq?=
 =?us-ascii?Q?d1Irkob39G+pfBqxArIOtWacGQRIaXBaotS0xPJH01wkCHUzCOONTvqoMIO1?=
 =?us-ascii?Q?xq5ee7OH0VPYCzEPi/JF5hSKa83mxG+mzNEi0xk9EQamTT+YPtvLVRdDfw34?=
 =?us-ascii?Q?YQisoqsjnjwBv7K5AptjSd7pcg4kQrZoUFjyizFm6+VulDxxKPDfgV5C69x0?=
 =?us-ascii?Q?pAXSQNFrT74gdSdVJXtL7+EibfOe2LgUo5hOgMWmKnLu0kX4ecz2rR3k4SqE?=
 =?us-ascii?Q?P9Ob+loUClF114h+8yrb/hYKzRv1m5git3auNDJkyv6A7RqHzAtlq4YPjZEW?=
 =?us-ascii?Q?NRUrvhsBHnvf+jE/OWPgTbEl546lKymvrNqoei2zBIGK6eZad7amfvMFfSHR?=
 =?us-ascii?Q?dcE1oGxsxDSWBuKbeTIfMRjkYZBLyX1P6wRCyXFCIhPV4jtG3EFZiDjt/6WP?=
 =?us-ascii?Q?/eTgiDkE8fl6kbkak90SSdI8lYQsH0FJoDjZeK92EcJiqvU0xZ3AXzdv2n4f?=
 =?us-ascii?Q?vNJTvoxhi7/ZUc5qZz2v/PmL53TAvzySXoUsN+mp2JYOlDi+DKh/BsuEBoRq?=
 =?us-ascii?Q?hQ3ktJ3YvgcXlnWcllAUB448U8j/9ULeImmjenDHaGV4G317DFVw9p3i+LDl?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c7634e-3465-4807-599f-08dcb680ff14
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 01:33:53.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVb6zZlh8KRptnpC+O0cymndTi6m8fDNRdBUulst40oHGvwac2ODZRwXcd0wpL9UgYYINnuAsFo2YkPBxnnb23LMC/CZWNrFUvoVFY4VEsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
X-Proofpoint-GUID: 7L5Db8HiGIpVEIepVWciH_vBVxCWZfqC
X-Proofpoint-ORIG-GUID: 7L5Db8HiGIpVEIepVWciH_vBVxCWZfqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_20,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070009
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

GFP_HIGHUSER is a combination of GFP_USER | __GFP_HIGHMEM.
Only the highmem part is incompatible with DMA32. Reserve
GFP_USER bit here, as the driver allocated buffers might
be mapped to userspace.

Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
change log

v1:
  https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/

v2:
  Modify the issue of not retaining GFP_USER in v1 and update the commit log.

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..0e6bdf2d028b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	 * request pages for our SHM backend buffers from the DMA32 zone to
 	 * hopefully avoid performance killing SWIOTLB bounce buffering.
 	 */
-	if (dma_addressing_limited(gpu->dev))
+	if (dma_addressing_limited(gpu->dev)) {
 		priv->shm_gfp_mask |= GFP_DMA32;
+		priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
+	}
 
 	/* Create buffer: */
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
-- 
2.25.1

