Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44070948D91
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 13:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0195610E0C4;
	Tue,  6 Aug 2024 11:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1092 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2024 11:06:15 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F42710E037;
 Tue,  6 Aug 2024 11:06:15 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4769hVUY022632;
 Tue, 6 Aug 2024 03:47:53 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40sfu02hvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2024 03:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tejGRYMF7fJ0fbBTs6bxIgRua4gYyv8nVaTPpaa+2Hd+b/N6KS7Gc5s8cX5Pr7/apUqYm1wumr6+s5KVAGpNp5/vLh8TT4ODed+Ia7vAEgwEd9IfUiXfFcbSpu/uI68lEqV7+3H2ZxzPjV1l+zRp8ZoUtieZvpk13hnjXRYXaLRAyJkUxHURAUlSKJkSbWHy29JLfWH6VK0WftV7mLebFR0OIRHUIUnJp21I9GA/aNTtK9M2Rkfzg6KmOs0hmHTZhmL6uCXuGs+9+wcfyhbem50e/CkxK3sNkOVNDNrU7aoTubp2VQyDtpWNHihSMh3TjhJwVCpTfYucyMy4NGv+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iy0l8Jspg8sF6hlvIdkK0Jn1Lso0oz563CtANL9est8=;
 b=Ku4r8Pih0mr1VHncqCr9rN1wxE70yaOri8RG8uXSUzFUn9IzBsmsWVEc7lPgmd2hTG36zXVoxDvZNUjNRI5RsnpK+axij0Qkm0He5WSOfNwjhNsFckT8iKnlFLcxiGc8lwBgvlCE9jR3fbeqyrAUlgTMdGXa+zOqXgwUROktw4xv9MbKQ6SrvfRSMw+CHeJjX9/1uMliSeA4xwbTDpWsDN3vDk/sRGyfvhdzpPrJgVvxHQ6zOs02tm9d21s8m7305aU815VPO/aZqLg9hkPfhhkceZmQR4OP5aUxZmt0IR8s+lRc1Wy6gNj8jNwljxOoNQZMLo/wI/RxshAQlLmxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 10:47:49 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 10:47:49 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: Remove GFP_HIGHUSER in systems with 32 address
 limits
Date: Tue,  6 Aug 2024 18:47:33 +0800
Message-Id: <20240806104733.2018783-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac974f2-0d28-4e22-65c4-08dcb60536e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FgbwoTAN63Wo5Qup6MBJ+k9h7pEZQ5J1cIWHpceHP4QEWHIGx5kj6cznVE4a?=
 =?us-ascii?Q?lVI1H6LrvM+2C4smdHcCkbwgAozku0bso3ZkvC0cbrq/i6L1i+7JpdQ+D3Uz?=
 =?us-ascii?Q?sITlTBYplEFbjMtB4Qp2zoXPrD939U2A8rpbax/3kUCuB7zhjp+8q8NTZRnj?=
 =?us-ascii?Q?C4Etbu4CkgmHBcbG7hxmV1++YHLgX9H6JGUbol9tYkMxkJ+r7AWHam846TzJ?=
 =?us-ascii?Q?t14BbzA6+iRnYUBwiRez39QRAEru0oNNfoG+8L8vmlOwXpddfFV63ci7xal1?=
 =?us-ascii?Q?gi50/rq9KTaY88WCt/hvYJHX/b1GqpmhBxheN2WNPq3k+hBcyU2Iw57k3I81?=
 =?us-ascii?Q?PZZi4hByA1kWnrG6bNmcu3YL3CexoLUwVviI7YbEjoCmgCvslPB9VP/v6wDz?=
 =?us-ascii?Q?5LyycLLU2ahOV0mk8r4xbmaFIXV53YHPpPrPdyZbKc+tSFNDK94dRP3UuGjB?=
 =?us-ascii?Q?qF/WHJMfwMasMrhZPyqN6ZQSl0Sel4Qa8xvisEom/Qsrx7RHVYlyCiRp3x3o?=
 =?us-ascii?Q?qBpYNLY4mPV7S7U09qKJnUVwiCAR/K7X4T5Y3Eo7aC+2zx4pcV0mQqG6D09V?=
 =?us-ascii?Q?dKkeB3V0DdY1t+Fnl3mryrw6V+qfxeNlf1U4qWY/L2aBkE/MisSCL8/N3CHH?=
 =?us-ascii?Q?lF2gcQLURxaxxbt7ze6A/p/AzKnq8BCfRqP8P6DbXkFet8sf68wioA45Vp95?=
 =?us-ascii?Q?RMYewxT8dj8FCcxHcWmbBjgWQwgB8+KCdJIzq5YDal5VbUKRsxsx9I3ZHf9h?=
 =?us-ascii?Q?BnfiCUq9Ni+G9KLbtsUPvffv5no0yD3rzX+VbAMWpVZCFZ3gR4WAo4X9tMSU?=
 =?us-ascii?Q?/heeihSAa/vF4X3qycR1pq+45cuz4xRvhtTBbt5UQp6Pmza0wnd+8cvJphxa?=
 =?us-ascii?Q?dLydvhAzu1M2yql84P5Cople96UF6DYviZIFg22VYt20QTiGaofCSqrcoV8p?=
 =?us-ascii?Q?dTOMzARACmWWcBYE5+zMAo2JeQOQJ3UCpwsHJYGHEsneQeVCyuddtmF4NTtK?=
 =?us-ascii?Q?f9f48iU58gyzrx+Fv1PFWOsytOVNgNhpyx2cw9Ouo/oAXHxYC6ooRhKSJtzz?=
 =?us-ascii?Q?4kEH0gJJAQl/xURhQOOa3gQv1ir7Or9+UssoNTQyNMhdmfYKHrvuN6bxw+Fa?=
 =?us-ascii?Q?Qdzz9NXjSG3b0ME2nMlJFItTV6Nx7YpItI6mFsrXN2CL11Mr/Bbc/poTPnhc?=
 =?us-ascii?Q?6O6fWrF0yCeCi+aECkA8ypWu9oNeir58pdXRkOABRRKffcyo0DZN76/fKH/K?=
 =?us-ascii?Q?gX58/6M5DsrDegFSy/zpWnm84kdmCkZqKFCfU1QUUtinnopZB0Qa7Vt+jM/o?=
 =?us-ascii?Q?xYfymLF8EXwBdEbPg3kSq5Hp2VBP7LKqKqb32BVks415sS5FKGPUZi+An6hI?=
 =?us-ascii?Q?Jj3yi7jXgzeyQm+B6yenwwtzqZ0t551p07hmdPM2sSwGZXt6BA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlf6Nbn15guS8pbFqiX8uG5R5i6g1JsgetxFI8DIOrjPGUUPi0L+wxx4lOwX?=
 =?us-ascii?Q?nqK8NyoULb0XU3dQU6qjJEzfuU4YBnxDY4oSShiFdoe83sHUcQdrFQSpasUC?=
 =?us-ascii?Q?eE7r3u8LlZrpIC8z1+W+LTuzpvK4qbz6J0IASBVUdhy+9Qt7SgFU4twJd5N8?=
 =?us-ascii?Q?FCZj+YC63NuyaPPBfA3kfHM7FuPRlE5mKcR8/M3036M8LX5+L2Sf7wBuGo4H?=
 =?us-ascii?Q?YF3Wd7SdSfmPAzk6QtVaz9fTi/uQezVR49oi79Rn1fPh/bsU7BtcnyCdOQsF?=
 =?us-ascii?Q?E9/RqUByQOMUazwh6mAKpwuXemSwFleSaFmBVHYTHAnBUht3l+mHB0TgQ5UN?=
 =?us-ascii?Q?vsNBIJ8Z1Vm+Zic0NwSyLg9pKkOqYTzrMbjDs04rmskbAUl6tMiawSfFyxVj?=
 =?us-ascii?Q?kv8lOzPGaAzJO6rQugp1gRl4qt5dVCTuQOFXY3x6naeGd8Gw+YfBpFJ6ZAM5?=
 =?us-ascii?Q?oXfDjL7ZgeuMrXRg6+fcYCgP2uaa6x8nsa7UAzeT8DPekgI+bKa6IZZSWzne?=
 =?us-ascii?Q?yZxSUL7aB8nd9svJSU8pcczmvIidWoK+Smd5dFa0Ygyr8bRaWf0Xwjy6RJPD?=
 =?us-ascii?Q?cYbSn9XoRQWVzSVDo9IKSyt7GvifwpWyMI6ghujVK6RfaHFtT3YHZAhgKVQw?=
 =?us-ascii?Q?fPnKlL/q1nvLDMj+b7aFfEiwwXXLWS5bn8t90WUSjtimdMWd6PaWiJAweNGm?=
 =?us-ascii?Q?1OvCJ/Jcxg5OcS1bn3Bj35Qygnbi3OTFDrTV4RpFvABDgYzaqi1Lc3X/+kx2?=
 =?us-ascii?Q?RlxKH0bXAbGk8f6NKLg7niwFPrrWeI9tpIHQcplpxNIq71kPbZ/cmX65PtLN?=
 =?us-ascii?Q?ivF0OjSFq5YEcPUULBVEDowypWbNt4iA/WEb3xp2IcLW/JF1tyVtZaJTQZcz?=
 =?us-ascii?Q?MFmS+A8KJavkiO973sulnZ4bCLaHJMqQt/NDSBCDNBG0nsTivN4bdEcKFXeT?=
 =?us-ascii?Q?IpGfIFLvVD2claKyPx++/Et7BhdJZGp+aCAU9GSSXKe1YamBoqPAjxAZzg5P?=
 =?us-ascii?Q?xynDYoEV2PVpe9G4dKzmnxm6yxr0BhzVreCy63ze034fcRxil5qA2FDr3Cb+?=
 =?us-ascii?Q?jOQNHxqF7PRiz2OJRTTobiDqheT0sFs0xyxIA9QpMzcRVnJQ35AJh4YmSS9f?=
 =?us-ascii?Q?Nn+CHixLWpSqSlKqgzF6vc/rIeMYW09qgCns48SGEDFhu6BjBNgPgimb4FYj?=
 =?us-ascii?Q?myWFd4/0lU9Rt838JXwaLSiaqYZHwgqQm35OfoEG5eAmny6n16tTSDIPaOrO?=
 =?us-ascii?Q?WrIjO1kG4fy4UPcSRbC3/ReZQ7eoGweBXCLAGFQibBt0Yk3xUPil+/frhAJG?=
 =?us-ascii?Q?0akySBsI5BuZns1ygU117T6MoIG6jTL0Cb7IAncHw+SKWiocwQigZ1b/8pyT?=
 =?us-ascii?Q?HwcNsQQXi9SEOkmTzT4H1vkRjP7Ud8FN7PMqpRFjjQ+aibmAsPN1oakFEWcy?=
 =?us-ascii?Q?FbbKsaChUm6Y7qNisFdlNkghzkYxSS8phatQr3A3Sp9fWR6rRP2Fk3U66xKm?=
 =?us-ascii?Q?k2+RcfKRhUEph9SnfvXXU+acxHtbcdXIWxHKX05wKveULBXNODC7O546RDtw?=
 =?us-ascii?Q?8fR8bvhb7Xd8MbTQYH/l9lnC3rPDiG4E60m50Ua9ofvj2Pkp9fhKOPmCMbQq?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac974f2-0d28-4e22-65c4-08dcb60536e9
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 10:47:49.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqHm5y8ZJmz8DgxjZmnT9phcCGVVIHd+cohNFdbxAqLiDgammb/zRoQgKPeDjoNj4IK11/SxLmrD4XogMfVpSwOCfTOb9IjyMa9HDDtrmyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
X-Proofpoint-GUID: Q1E-tIa0cyKx7vZJd_qGzi3wDjm09sUJ
X-Proofpoint-ORIG-GUID: Q1E-tIa0cyKx7vZJd_qGzi3wDjm09sUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 clxscore=1011 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408060074
X-Mailman-Approved-At: Tue, 06 Aug 2024 11:22:14 +0000
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

GFP_HIGHUSER is for userspace allocations that may be mapped
to userspace,An example may be a hardware allocation that maps
data directly into userspace but has no addressing limitations,
this conflicts with GFP_DMA32,The kernel reports a BUG:

kernel BUG at include/linux/gfp.h:139!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
Hardware name: NXP i.MX8MPlus EVK board (DT)
pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : __alloc_pages_noprof+0x5d8/0x72c
 lr : alloc_pages_mpol_noprof+0x100/0x4e0
 sp : ffffffc08c6a71c0
 x29: ffffffc08c6a71c0 x28: ffffffc086e46000 x27: ffffffc086e46a68
 x26: 1ffffff81122b260 x25: ffffffc089159304 x24: ffffff80da938000
 x23: 0000000000000000 x22: 0000000000000000 x21: ffffff80da938000
 x20: 1ffffff8118d4e46 x19: 0000000000146cc6 x18: 0000000000000000
 x17: ffffffc081b00980 x16: ffffffc081b002a8 x15: 1ffffff8118d4e56
 x14: 00000000f1f1f1f1 x13: 00000000f3f3f300 x12: 0000000000000000
 x11: ffffff80da9384c8 x10: ffffff80da938000 x9 : 00000000f2f2f200
 x8 : 0000000041b58ab3 x7 : 00000000f3000000 x6 : 00000000f3f3f3f3
 x5 : 1ffffff01b527005 x4 : 000000000000000c x3 : 0000000000000006
 x2 : 0000000000000000 x1 : 00000000000003a3 x0 : 0000000000000000
 Call trace:
  __alloc_pages_noprof+0x5d8/0x72c
  alloc_pages_mpol_noprof+0x100/0x4e0
  folio_alloc_mpol_noprof+0x18/0xb8
  shmem_alloc_folio+0x154/0x1a8
  shmem_alloc_and_add_folio+0x180/0xee8
  shmem_get_folio_gfp+0x660/0x103c
  shmem_read_folio_gfp+0x98/0x104
  drm_gem_get_pages+0x174/0x5ac
  etnaviv_gem_shmem_get_pages+0x18/0x5c
  etnaviv_gem_get_pages+0x100/0x328
  etnaviv_gem_cpu_prep+0x2e8/0x438
  etnaviv_ioctl_gem_cpu_prep+0xb0/0x1ac
  drm_ioctl_kernel+0x158/0x2c8
  drm_ioctl+0x494/0xb48
  __arm64_sys_ioctl+0x120/0x18c
  invoke_syscall+0x6c/0x25c
  el0_svc_common.constprop.0+0x174/0x278
  do_el0_svc+0x40/0x58
  el0_svc+0x50/0xc0
  el0t_64_sync_handler+0xc0/0xc4
  el0t_64_sync+0x190/0x194
 Code: 52800021 39003c01 d4210000 17ffff57 (d4210000)

Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..c3f329226bed 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	 * request pages for our SHM backend buffers from the DMA32 zone to
 	 * hopefully avoid performance killing SWIOTLB bounce buffering.
 	 */
-	if (dma_addressing_limited(gpu->dev))
-		priv->shm_gfp_mask |= GFP_DMA32;
+	if (dma_addressing_limited(gpu->dev)) {
+		priv->shm_gfp_mask |= GFP_DMA32 & GFP_USER;
+		priv->shm_gfp_mask &= ~GFP_HIGHUSER;
+	}
 
 	/* Create buffer: */
 	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
-- 
2.25.1

