Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F597B6E7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CBC10E51D;
	Wed, 18 Sep 2024 02:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Yv9zqMr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2079.outbound.protection.outlook.com [40.107.255.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1210E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7G38yLVQsQr7V5GO+n4phmKCcM+w1JTWwAT4yBqyEMnAFpqVj4clPHJ3ptBOopxBq8OINpDv5Ey7/peJrKGPHJaT8B1zUjHovdVyN+rIgoGmuBQe5Fh2akGpPWfZo/gK29++aR/6e3t+0/dz9AWzVJueuuQ93XXFprj7t13XOSNM3VsUHEAtcAT//yXs3Wo7JoP8VF/qyO20ZvgjU6OK/zr4HeZdBFWr/2Xp2ttgzm67f2mf1kWqOxHRq0MOzdWPnavVcfzhWw/L08oCEPoUuXgeFq8I6ytuFSYJdn6hJQuhgImnP834xGycFUAXKtn3aIcpq5yPR2/gVrdxm+3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR9wSPVOI7eXTkp0FrF0jRKskMdnCcm+aAsS3Z2Iew0=;
 b=GZExe/Jv7CsvVxXZ63L9FMwxwP6BcUvn4WFjXFywzB0fm3eilcsc12wxvHVh9k+Qh0sDTi/BrcY5ypk7zMWMrrKge4elFAjIVu13hzTCIxc27QlMndoNm55IXbmgKeA/o1metLWPmBQoNlK4sVM8nu6495N+bMoyf/37fTmGDZz1j+vMFAbtCyKoojzvlSNvXYr+Qh3gOLdkR7CLJ/dg6xYP5NFnWsCYw3Es8iT3/lS+gfViHXn1hjjTi1+93chOdgXhr7o9xRyXoYpuOSl6hEYoRsFVINZPdnXiN+cE0/8zAE4GdVe3aTaxjAGdfuOJUYgTI1YocPVF/LHLQz1ZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR9wSPVOI7eXTkp0FrF0jRKskMdnCcm+aAsS3Z2Iew0=;
 b=Yv9zqMr7E16+F7hFxE+U8LiQg0aoqXF7aCyMnp8qjxNbcE5PEiQEZb+RdFBtnGE6fdq9vQEhgCEAdci+rY45qgAb0zQKRIjemoDr/jzgGyA99R0j2JbXL4nVc5ZMONk7knMiMp4nzZL2+zXuQas5LIGotnOwupIXA8JuAnBU+oCR6ej/m/xEMecjlCz0E7+iLZV2vkZslvo8JXaDGYgpZRVW5bCoFwMtnZweBLLd6mFVMKJbcWOgMsf4IOCZogH+4pNo0Ib6kAzMI7tTCk8HDx6//3ltiPpbd8YiVBarP0HNPXfpQKoofpFx9tHP1qwjT7+f5/iGeuaoibr/9Hs94w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:52:58 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:52:58 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 3/7] udmabuf: fix vmap_udmabuf error page set
Date: Wed, 18 Sep 2024 10:52:26 +0800
Message-ID: <20240918025238.2957823-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 5030fe5e-96bd-4e00-94bb-08dcd78d00ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NhV9IdxDzVXyNzetCmjbDyqcoWjLC/yWk53OrUUgkXVLu/T9su3r3PS5bX79?=
 =?us-ascii?Q?8pmYnPaG40jsxiWc73GclwdaChEXLRA8hN6GeeSjTQn5KVpUccAqLsUYj+iP?=
 =?us-ascii?Q?dcZ6D+xi5AIxuYmIRBI763l3cSJhxxinbReVX1YLoE+YuhbG9OPu3k3kk1uT?=
 =?us-ascii?Q?CQET2WZ6ON8Y4DxC6qdgxg5iIB7L0K0A1v+wh8itBAcy1cyLG/7k3nGBmKpN?=
 =?us-ascii?Q?dcEwL46cQghVC52EjCeYBqxzzylZs1fyZviYcFeJ4OdIjw9udXx2Q9FWvUZe?=
 =?us-ascii?Q?5CJ0z5+Vdo7a4+EpWNlN07omDZTTanOaIrLBMEkep9PE61YdEyE9ysI+X26i?=
 =?us-ascii?Q?edIOeD/HucEudtc9UAtMmKhkZVQ6zWldiS4gkzZgW887uhNZjaXZO+0+Q0zD?=
 =?us-ascii?Q?KpSgmcUAALbNkvknHGxuQBG6j37DcwBFHPYW+eaXLWwEI64SUsXfDNbhXqtP?=
 =?us-ascii?Q?zjd8uAXPUANT/diETMld6Wkmqi8Rq3kFVSZ4k5u8UuGyYF8MY7nBaBbl8k72?=
 =?us-ascii?Q?0DMq6J83wfXeKETaVrRlOeClH2vT0VRsyQIupbOs7bX318nvayImFqQ2jyr0?=
 =?us-ascii?Q?GUxuLUopOjZhGVXx/WIl7jypMPIvDk4LZK9YKQioyeGFZa1Dt7hYlQTOiQIA?=
 =?us-ascii?Q?aDgi3t8+P8obXP+jyH0MBkGpRiihOIW4ZEnxT+q+iQiPwP66i5KbPDqHw19c?=
 =?us-ascii?Q?wH1ymMjPxQ3ryrBSkQLpCRIqN0dlCA3OsJCcgmAiWt1dxhxXGM56nSX6OaSl?=
 =?us-ascii?Q?6Og+I1B2ZVngfGhfxsgnQiksoWq+W36YVs5VpR9+YXJMr3gGLlC71xQqH1uh?=
 =?us-ascii?Q?VjdO2UN4+Ghs3IlhZ3/c/aKz6gz7C0DoIWAqkkNibU313918JXTF+y8+PyVm?=
 =?us-ascii?Q?OX5t5mdZC9yNxqgPx5L5XtgLaXJxA6AEEzgZ3ns9iIcd/3fV3/xaMXwoht8Y?=
 =?us-ascii?Q?vEdpKfrJ6hyoXVFTFmTeAhUhQ0B88KbgP2qL2q8yeBbzYpFtWFfySwd5smBl?=
 =?us-ascii?Q?N5SCbMeeUC5pNK1VsgqYXVZDez1SX4FiArquV7liOKVjQbUNj2HsQeWoirTa?=
 =?us-ascii?Q?9i1aN3keOury2qD8OdA4hiPNrSf8zLSyUqOVkk3PuepXlYANRdQKTdBS2rnP?=
 =?us-ascii?Q?5lPX9P7fo/pzI2mhzajQrnVLp3CBe3S1ByukkOZ2hjvFIH4FbjmhJ+dbk4aK?=
 =?us-ascii?Q?91ctHH/TCuX3z0/1S8fDjrEInKa5FhSnmAlQag89jA1XuxlsK7zFX/zm9+/1?=
 =?us-ascii?Q?Fw2QDjnyW145e6mGorctt6VWILo0Ug8/pMZP/8QiOUQDUvoeA/dHTPJ+5yyb?=
 =?us-ascii?Q?a/+SI30Y/R7Ycej+qBeABriOEU7WmgTYd880e7BoaJDuaAdVsTcjMx81GRAb?=
 =?us-ascii?Q?eN11AHt1hmBsozkgG0OBgLMPo1rHGYVoaUX3IgRDtUTFB7/K+jH6RA08paGK?=
 =?us-ascii?Q?zRd7P4qggNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SMZeFA+EuoR1qEUWUAoacDIL8Fy4ndBotw+csp1fwjyTAvyy2uIS5dpbqq6T?=
 =?us-ascii?Q?tDX6CKOGSUrX/Jc25eJ9bHY69gHkdTRlOAVaW+8GrGHODUsp6Cv34vccHc79?=
 =?us-ascii?Q?+DmFl0GhlzCDx804XWNNSqZZqH5IW8HnX31WQDl/mJHZEdjEFj9mzIOCz0cj?=
 =?us-ascii?Q?mxYyoCQGYVsyKaclbn8yr4hUN6SOFYq9zYQXmlPoHXt+ezJhZ8E+hPIlvF3B?=
 =?us-ascii?Q?fMIBPHtldP3zj7QEHR5zeQCmmxC/4soTe7uQJ6aX9IzOZkSoUxBf0rnZWKhp?=
 =?us-ascii?Q?g7YHf0E6GvHyqlqHfhNFMfDOiTzuc1WCiN1FDNrBWd1uRHAYNh8c+9Y1SKzp?=
 =?us-ascii?Q?ot7y7sCfx/QLMnWUTthyAqKL1S9ByqBjxzBIb599nM5Rms+nS4ZbrK6plTgK?=
 =?us-ascii?Q?r+XC88QFnCtoaTAtOPRhaip7GDHahyH8DfVkyhc/rbtjlEqdBkai7F77BJxa?=
 =?us-ascii?Q?IdAiiOZBfTD5KOEkSHGVgEibxuhXti9uxqJ76GnrLe/fU3swBInnx44wP6Xk?=
 =?us-ascii?Q?ciXpBoRzb08NtwLG84DjMxL8gs1DFWZlzeyplcmbaVGjKPXX7l4DeepfOOnw?=
 =?us-ascii?Q?JrUqhxt0mNiB0FDHnml90EcjqzXh0/apwN7fLQSRZ0/JP44JsByAF9X/Wit6?=
 =?us-ascii?Q?JpFmfKiAK045ysM/7NAyF/4S3R6KjsQTEYzkNU+iyTt2usql/NJQzlrXUzdx?=
 =?us-ascii?Q?b6bMB+gNdcDmKx6MBt1PqYMQNNjmpSStF1O13rWrnrhm5DoA7NjjG+nyC8MM?=
 =?us-ascii?Q?pI2aN9ufQDyi7h2puUvyqj7GuIKi/b7ICQuwr4FVsrCITxr1M46vxv35WcsX?=
 =?us-ascii?Q?O6kjJTFJz6eV2yXBdFf447+S/QEeljb7EIe+pBhWGe3MLZQ/YyQ6jqta6x8K?=
 =?us-ascii?Q?JfKmgTbvPHp5wItTRnXIkClTRbbqNPJ3JYUmxYwDGmHvUJmIE1PaxI7KPW9D?=
 =?us-ascii?Q?z7Tv3bHMpJouipNwN4manYyqU45Y83BVG447ixcPhvfS/cHsMWEhMZeICcSB?=
 =?us-ascii?Q?P8382s1YJrDgp6Y3WQTwtAcLyoRzGfm0KNb3A/MxdD/Ea6591Nun+swannAs?=
 =?us-ascii?Q?RCvVLJPUxqF14j3u8UYtiNjdcxUpKDNn6/eJKqc9vM/jubVXPUKllV9J+Imq?=
 =?us-ascii?Q?LaI4pzJKaEDK9M4NEIIK2qgj0NgVvmPR2mS6SE2xBmKZhfFhs0iscuRlJTa9?=
 =?us-ascii?Q?lehXtKGP0eVgaKHyUvkQsH8pOP2B2L00QLYcqppTmWPd57SCtgTJlcobzBfp?=
 =?us-ascii?Q?XReEvRZ3WnVaAD9UW3xl7fbRVT04WwknAmFhsExT297ZWiwLnR1eSxnMChcy?=
 =?us-ascii?Q?YNVp1XdGVcf4AllyfXxGDx/5HAiEmpIBMMlhM/5yQpwq59V4VF3f5zM5KipA?=
 =?us-ascii?Q?wBSgTpS9t50MH6R+LMOhDUmMcDv8CkxXkJuIxx/LSojpBwVH6A3eM4wAyZUj?=
 =?us-ascii?Q?npu9EqQpDGyQMSZ1aLBsXgo0kmUBdyRX6fAI2nIZs02CwZYgNkr/EDF2CX3R?=
 =?us-ascii?Q?f7jUKEzkzCMjtlA7rV6CsUkEigy09ZXkKFs5PedXTi0qUpkswFptFrH8Qphb?=
 =?us-ascii?Q?Vj3O2nJpAt+LGASYu5gVgkyqe5r21q3KzFzJGo8c?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5030fe5e-96bd-4e00-94bb-08dcd78d00ca
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:52:58.5178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T9db4i6KYS9Nb6SMjitG9gy/3H3w6f7wTYtWt3WGX2KrXrnHzXrs1lY1/Fo/vuKxDTnLo2pRVzEKjvE4fh5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
so, we can't use page array to map, instead, use pfn array.

By this, we removed page usage in udmabuf totally.

Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/Kconfig   |  1 +
 drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..fee04fdb0822 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,6 +36,7 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
+	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index ba9dbc7caf71..aa182a9dcdfa 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -103,21 +103,29 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
+	unsigned long *pfns;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
+	/**
+	 * HVO may free tail pages, so just use pfn to map each folio
+	 * into vmalloc area.
+	 */
+	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
 
-	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kvfree(pages);
+		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
+		pfns[pg] = pfn;
+	}
+
+	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
+	kvfree(pfns);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.45.2

