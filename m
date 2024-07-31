Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3B9426A2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 08:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AF910E129;
	Wed, 31 Jul 2024 06:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ZJnFzIL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2080.outbound.protection.outlook.com [40.107.117.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501DC10E129
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 06:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1rAW7S2vVMgTBJb0sFzJuTplqU1HK8MfeCNmjRXsc5103PaLGO4OZd3KAzxxfcIqTk64xbgijEUHOPUy7ajT0XFVsqGRev+51bXpuQmJGahdaEhJT785lbgUnv9s4vwksqe75eHCbgf4KLPCEpBrd88P17ycQKvfsSr6xSgLmOIvnwPEqsplVll8vBoPnB8jTe7XaE0Gb2Xrb8BD5dNZzimY50QfxVKTpE2E9T4UcNEIWxhyWKsjgXe8kGrEJr4E9raZxl8cc8q/3ZR4Ov1PdVpqwuUUbhBRqMy4RVDBwKgpHaGPy72uFIHaqfFL8N/lTIkAyJkzVkvVw4cdqQMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5qh3ztOAiwwoA98nzSe8h2NnoEfP1iipqo4UkErlLE=;
 b=VeSyka8vbHnBHLU24mE2muXHBtH4rAolygCcAotPpZNs4JrhnP7OGPUB0vMURSG+a0iH3K3ngD+xgj24Dy4dMj57SomzxqhmfwroGVQjaBSWllMFwEnojqOl/Biw/gflxyHMrvlhbC5nSwdNyN6GYhf1Z9dIfhN6JrWlK0p2sQ9Hj6pLJ9SfxfYT77jddwwDryw995NzxTd3Q0xJTzW6/U5dXmGPiAb58fI58KV9i/FL8V/YsHIvsyOJWisAbAYoyfLqCChFs0CgKaeT+XF/IOxIQSc3U2bbf2eizk0ceL4Pj1Ww8OjxheNzm0pTjrPimEHuYA0X1xI3yywk/nJlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5qh3ztOAiwwoA98nzSe8h2NnoEfP1iipqo4UkErlLE=;
 b=ZJnFzIL4DDgZIZ8S05k9FsDSWhI0h7jBUTg3o/7MIQWXybyq7/8CcGTMZDoR8vhGWZiAEJpljrpnrBAJVe6ToExNOLn4sbdCDWyfPIwmLHkcUQybQ1xZwkIa2GOLTa+nudOhfQ7PlTM2d5Qfq2n1abSz26cGFov4rvc+cvkedRqzTi8eDqmhjrSyXhSXg8BJlMJUS1noD0/fj+ssK2wBZoqyEns4vjlUAdoZTAqgeu9lNnjfBruLRuu3ScPtpjzEcFPOu7EUIzeHA3txmtHhO7rOHsBvvTR1PGfEFRjOAc3yVLaxdD4xTVV/gxoridTt1COSK2dCmHSXbtKsTHD1XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5084.apcprd06.prod.outlook.com (2603:1096:4:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 06:26:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 06:26:53 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2] udmabuf: use kmem_cache to alloc udmabuf folio
Date: Wed, 31 Jul 2024 14:26:42 +0800
Message-ID: <20240731062642.1164140-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: c39cd229-bd3c-4fd2-fd92-08dcb129c499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQYRm0xhcRTNH+LOGF0oweOquNVO4n+yAna2ESh42Je5iyWUjDBJissYvUM4?=
 =?us-ascii?Q?+WNtbE5blRBs36oXOtmVue/EqyDWqLrib8P8+Zpy1KQ8Ib8XAF7XSflh4U0v?=
 =?us-ascii?Q?Y/VWSwPPJ1mQ0FHSI8+J1A6JYOSzrwyBZ3qcCW6+Vzm0r0ysrAA/SOCCAhBL?=
 =?us-ascii?Q?qSM3RPU4NBxdBsBW0VkF8WlPhFw51KmhnQ3cnd/jYI+DAJD9vRRcK+O20V8c?=
 =?us-ascii?Q?NE2XMKb5UgNysSPuvdtRDQojbpqQ2I6XP4RuSaMps9OcCdfZJeaRPy8mlbwv?=
 =?us-ascii?Q?pEuM4LcDBVYAyXMnvcUNUDfwTcjhebpDoo4OEvS7FDIF7psIGKFsgySqpoVv?=
 =?us-ascii?Q?7BadR0lCr/f25l+i3arp8WH096utKU1iX+5wQFXc6gMkv/KZbXKW421xdxBs?=
 =?us-ascii?Q?BOAfoTC/hgLnLNC3s9+FAHdhuxZvs3po72vxNTpc/g+RKmVtks6AQ/9Cck7X?=
 =?us-ascii?Q?Tt0M8fyyZQakyoVq+JivFNamiYqxr+TiRXkbhkGx+wl/N0rY0Ni8Vg+ytDg/?=
 =?us-ascii?Q?36chVGIvomyihLdO0s5BTyxAEJ+ZBX0broqN+NSYjZFzJ3KteoD+gG//AUcr?=
 =?us-ascii?Q?v+kh75FjXGXukKBPrFwqMTDudatDxjcAhe+BRHeyqimIzwLMFXISPmHKaowX?=
 =?us-ascii?Q?PBTj2LB1tz8mfz+RNDaLV/ciH6mOkZewu4KykxhAITsmaHuQOzYn47sjoYr8?=
 =?us-ascii?Q?wNVFeT4rCnvTbuXBGVA+1XlSYRldlhtnLRV0SNKk53/1stzC2urLqnXQIzp6?=
 =?us-ascii?Q?g+xDTx1mOXrP9thDnANoNJwepWQ+o7dE6fNE7BL1uYRclFf8HLM693zUflkC?=
 =?us-ascii?Q?KheQbRWbh7AUKQCMEL20k/4KTgU4FSMZHQFRgoFS0wLnsLcke0U5BlsjLz/p?=
 =?us-ascii?Q?DkqydgPAFp9/nsVjAm9vyAtb5aRm0JSoF8r6igrJJFezyYdOWvHX8VkQv+6t?=
 =?us-ascii?Q?J2oimrQqbcOaTJZGX+OPiaVfQlCF5UYrigW1/Vnwogr28r9F0301DOmjrfiY?=
 =?us-ascii?Q?Kjuwxp5zqTzwW9vSH40EgITwDJRUOMLWKPvxVckQS+YWDUMRaXCUT4cYvmeu?=
 =?us-ascii?Q?H1MJjEItLQEkP4CPdIk8/Sgx8yTcuvTMu9ifXNIZO6pohUrLSGcSMgVNgPDW?=
 =?us-ascii?Q?/6wdZpZaCfQTBJcJnxDwpO8oAdiC4NzskjUqNNLqs7z2UVl4NTLAs4y/4SSY?=
 =?us-ascii?Q?ktwqbIKC0kagWYRvmGDEkZUCZdc0P7YOvlhcKwwfYRdoXeGjEeCjWtpsR/X9?=
 =?us-ascii?Q?yuPXViG6ymPksCjbLqpalGHDKrW7EEfjSuwTpZiECTRmbDMMi1qhgf1K7ITy?=
 =?us-ascii?Q?Tgtzo/wEbsra5czFIIYCY19/5kKpGGHvYAkvBD55zdP0XCYpOE35y/S7b6RO?=
 =?us-ascii?Q?IqioGNhPBeMIM3hCVsfYMoVlnkTZg5oc5nPyYDuJSHPtvDC2uA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qwY2bFQIBXopiEQhgNwzSqtyXHKQjrHDwLOlP61p4TfupSoA09kbIwlbexk?=
 =?us-ascii?Q?R3JZtSRiyAKsLwzlALUEd1x6RBwAEvs+dBI4O489GNfi9MW4BdGFk14UmqVA?=
 =?us-ascii?Q?Clc1MZOL9p84mtWUCDGk148OVcZEimw03HVUecMnl80r7y9lT2KAgtQ3vHBi?=
 =?us-ascii?Q?4z+xh9ddEB+rGHWxzWeIN1UM2hYffqjRMYPkDiTCOLSWNMQJh+Hh6UMTPyD2?=
 =?us-ascii?Q?3mOYgFRaUs8sU4rnY13ej7Ia5SAaBvPi2tD7vjC6Sx2OIaTPWG38Xth2pZaK?=
 =?us-ascii?Q?rM/Az1+GC5Xhx4LFig3LOdj4+iVUqrYGdJjFs0QWqJffv8TGjFrzgF3wZ8TR?=
 =?us-ascii?Q?Y9NcuZXkb5pHVC91g9bY0r5rEmlDHSsBjoZlq2XW6vLtd0TX8T7ICVVzNBY6?=
 =?us-ascii?Q?as/0LzmAo4JWPC0gc+EvOTZm7g05n63VB8a1RA2Ql+wrq/Mnj8yUffCZQdUs?=
 =?us-ascii?Q?fmXtmGk95Ip6hX4PhtJm1oPziwTAWxcQGr8vEBOfQPDFAO7gxUP580g7BFOP?=
 =?us-ascii?Q?YGiJgLlOsoKXQZ1LeG6I+HTuPlnFB7YcSaSS28pO+uCeTHvkXScxBNASRaQQ?=
 =?us-ascii?Q?pmHpv1bQkEQiKX4WLCGUQ5xIfjXWn5vZBxwDhxCquoqhp1tGNKqdu9X3uInE?=
 =?us-ascii?Q?ngb6RhuxuOTI0uxQVKOmCq98JRnOssXCBVnM+ZPCqwKdxXjf56LONFkAW/Js?=
 =?us-ascii?Q?MXA59g10nkiZD4POfNi7n+4IuFq+Uo2wnz1kFEltoXVn4jOG45QUNhHILKGk?=
 =?us-ascii?Q?tA1CYzyzUF5VDPjSk4uqTX1wNDPZtbJToxH9RbabsHvgRXfKv34wKGv0AKK2?=
 =?us-ascii?Q?dUAnhjafZYvwEuD+w9PP8NHKH9wzwueR6SUHzCD8dFM51Jqgqr9MFy2sCPrG?=
 =?us-ascii?Q?PL5+BJDFOl/LMhvpklLFRtuOcbrHI+AOdxiof+Dn+j1HkJHG8aKF5PKoQE5u?=
 =?us-ascii?Q?f6hGNX2W9DNN4tmC45LSJxu25zwH5RjKjaPmFhhrpdmLun7oDMDpdmSuf3J3?=
 =?us-ascii?Q?LYRcYSKdz+hutQZwvSyy5FXI6Ff9KiACBt/LZ3fh7wJGEdEorn+9tx++rudf?=
 =?us-ascii?Q?/Jp4HrpaubxLKpz1fZ9bKsdhT2SjXlJosV2TmaMpcBWTgjLWnKVT3GI3CL+G?=
 =?us-ascii?Q?m0Pd9iM80F8W64+rZ9KgSoeP9mFEInPTs+Kn47XpAi5WGGWnZdOUjnDZlz+Z?=
 =?us-ascii?Q?nYMrsRhhWqoELvFYkVxH+wKBoQEJelxHNsgnb8AlOWWXysCEzatExjXaJLG0?=
 =?us-ascii?Q?JWbVDlkJTOXb3GidUa1ZjQqbw/y+nRkdJhYSO0m4ynJioA+hhrObdj5ztNPM?=
 =?us-ascii?Q?4RLQr7YfirSbYvJKHOA46CxD+oAcD8c26pgajfw1/JIYowIQApUvszizrbaP?=
 =?us-ascii?Q?ZfE4f0uz1/Jgq8NIoAu7gKTSOJMJROqVHKlJcgIi1M38BOfHNav1XFM56l/7?=
 =?us-ascii?Q?Dfq56jfFndI6Zj4P6K9Dj+Y2s7BdqV9xVVWUYLfYh1QDqJ+dQGWsO7qZ7T0l?=
 =?us-ascii?Q?aDU9M7NqX4XqrLmrPimSSzCbupRBCB1IEMYLP4DsIlA8w6sTO2zysrOeAzaD?=
 =?us-ascii?Q?Y/a2YWYtXDu+UXOnTQR+pqU4IixHmbhNRJM4WHU7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39cd229-bd3c-4fd2-fd92-08dcb129c499
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 06:26:53.2803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq/hGQpwXEj41YKdKhy0r6vwTttYwsExRzXdIA0HAv2/W8Fb+lFs3BNNUwSkRujhqm96/JNSXbIaeZp/XGGvoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5084
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

The current udmabuf_folio contains a list_head and the corresponding
folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
allocate memory.

However, kmalloc is a public pool, starting from 64 bytes. This means
that each udmabuf_folio allocation will waste 40 bytes.

Considering that each udmabuf creates a folio corresponding to a
udmabuf_folio, the wasted memory can be significant in the case of
memory fragmentation.

Furthermore, if udmabuf is frequently used, the allocation and
deallocation of udmabuf_folio will also be frequent.

Therefore, this patch adds a kmem_cache dedicated to the allocation and
deallocation of udmabuf_folio.This is expected to improve the
performance of allocation and deallocation within the expected range,
while also avoiding memory waste.

Signed-off-by: Huan Yang <link@vivo.com>
---
v2 -> v1: fix double unregister, remove unlikely

 drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..c112c58ef09a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -24,6 +24,8 @@ static int size_limit_mb = 64;
 module_param(size_limit_mb, int, 0644);
 MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
+static struct kmem_cache *udmabuf_folio_cachep;
+
 struct udmabuf {
 	pgoff_t pagecount;
 	struct folio **folios;
@@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
 		unpin_folio(ubuf_folio->folio);
 
 		list_del(&ubuf_folio->list);
-		kfree(ubuf_folio);
+		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
 	}
 }
 
@@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
 {
 	struct udmabuf_folio *ubuf_folio;
 
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
+	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
 	if (!ubuf_folio)
 		return -ENOMEM;
 
@@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
 					   DMA_BIT_MASK(64));
 	if (ret < 0) {
 		pr_err("Could not setup DMA mask for udmabuf device\n");
-		misc_deregister(&udmabuf_misc);
-		return ret;
+		goto err;
+	}
+
+	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
+	if (!udmabuf_folio_cachep) {
+		ret = -ENOMEM;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	misc_deregister(&udmabuf_misc);
+	return ret;
 }
 
 static void __exit udmabuf_dev_exit(void)

base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
-- 
2.45.2

