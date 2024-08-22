Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF7395B0CD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2310E7C8;
	Thu, 22 Aug 2024 08:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="q18FGH1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7B10E662
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:44:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm58CO9/tApObrNcpf2VstrtudbfJ2AMybkOeoCzcJh5oc802S9ZwELSoSSocYI1KKxKNaxGVKcM6T7j7M+Q8gkOB45I63Cbohn0LMJbkKDb/BSQYGbwXDKr6mviYh2H1XtROuxRybw6Gh+vCCcN7h4tpqiZqhbR9WX4QTNesd0CHTEITgjbNn2D7KdYUlsfCO4mj53wMUA08HUTrDIe+2qiD7aL0FUGO6aFNRQq2IFiGmBoNyjHxHlwmuX5DPUQ+M4vZ0U+fgFPUYvCzw95emkaS0l0DYXs7dgWkEEeiCpdgbJ0KR3+73dXis9L+ahPJSVMeF6G1sTDA916AkdEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/GUYS9uhhT8EiUqZYlaKs2ODEKxLXBvtKncVnYF1Es=;
 b=PLdmcK3ugsie8ewYKl7JHvdRbogDSpAyVZSRHbqcG4yK2Fybi9vVds+ufQRlF/kDUEZ87dVP2bZhf/R5xvjs91Jx7MbGCcDdBtJV+ewoW+hPzctmWYtW9+1Gh+erGohHgMFaWp2e0ICdxxUYTz8crvTaobKKYV7HvstSKbbcukI1ezNKzgXMBlPISzjmKB6q4cBgSr+rpvqC6q2q7fmRVYEbc88C2Sx8iTn5L5NcQaASsvpqROUnMh+2rCoHLCMhNF6hRKeC1YlZN7DElFRCpDIuHN2xF6WuyO9+yZ8R3UN9Rd5FBrQOhw8mf6gQMT4tW41Nn43pbW2w9aASG8R5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/GUYS9uhhT8EiUqZYlaKs2ODEKxLXBvtKncVnYF1Es=;
 b=q18FGH1H2+1EE6Vg6XDHMNN4C4gCqDjPObdfshkQZBPKUALQTeBKgBi62KnR8dyDL4885DsbbVmPj7syX8qz011MyD8B9zhzh1PtYw1gJTSm6MBp9jhuuVip5Dkcy2Pkcg4AUBnaPGgZoWb3SZj8vdHPbS9ubpPTLJXlbkLWiha0pxuBWdzeZ2887M0lfjEFe1jAzDhYqPdLFFVPWGjxuf6QUBXm1bgh3SI4MBwGt3SLTn5iW5I3IYfS7gaxUst8AjA4wSYpYaSyH663ynAuGzTi5DLWKltWV00XiAFWzbCBdhVuFJkdKA1fQlxc1nDYCPfJTty1Tk0BngFtc5ANMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6402.apcprd06.prod.outlook.com (2603:1096:400:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 08:44:51 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:51 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
Date: Thu, 22 Aug 2024 16:43:37 +0800
Message-ID: <20240822084342.1574914-6-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822084342.1574914-1-link@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 489ea39e-c09d-44a1-c097-08dcc286b009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6u/I1z7xb5OhKvsDto3tPFjd1pOXM/B0POSWuflf9vCgqw2lQHP36nRUBFhF?=
 =?us-ascii?Q?ic0ABu9Ugur8mMA461t3QiYc/w5jnJ+wNjuvrR7AJrNbpr+/oaOUCyRcOYsZ?=
 =?us-ascii?Q?cDY/3JMQo2VbSMTacCvw8C8JeJ9AIExPHR4fgxb/0su21hn83EjkVdG/1fCw?=
 =?us-ascii?Q?3HnWOPfg4wUIU0bGJSqAanXhqitLaSQVHv5EUOV/PhG3ETXv4ovNXxXjaW8z?=
 =?us-ascii?Q?yNf+vxg4GIYsQ+/n0QSM9tKvpDrzxn3+BF9Bu34VjOv43Tsd2tQNIHAeiIrT?=
 =?us-ascii?Q?srbu1W3STV+10IFzO6cKFVqwFEXKyQx5t62Qte0v0ZRG7+9fBvY+CZnMThzy?=
 =?us-ascii?Q?1MTzbw/p+MPVSQQL997s0bvkA7ScMOBvzqbznwUEUb1U6WgfcKwZQzwQbf1z?=
 =?us-ascii?Q?bvQNEGbXdop3Huf1wAYhONdBn35FSCIh2DgFFi8FF+Ybcapi9Pzci8M0ZAyc?=
 =?us-ascii?Q?cJMupAlr38HFeetr6O8QIkYvFIy2qkaVxuwnSvZbBWpHzx8KQ2JzJa2BFer9?=
 =?us-ascii?Q?ruNEGmeDBucXVwxPt9Gv4iVEVr/FqNJCJx8vAGTR55RtF7oJ/PUF+9hrcTmw?=
 =?us-ascii?Q?wx7ncBYGmRX2QF8t69UkUe7f+HUSm2anPP3C3kbojYmmEO79dTsPD4cNuiHw?=
 =?us-ascii?Q?Z/r75T0EWd+RhKM8nMaH/OsGo86T+8/ABvswnXdTI4RGeLekyQMwZSk54rVI?=
 =?us-ascii?Q?xk2R+sw4h69vbfEOgcRgAL4058zw6yt6S4PXL6l8m74mtBIiduWuz/QD/4QT?=
 =?us-ascii?Q?NObTSIFXl0GmpWZGlx85tPzCyeomMUgqRVPEo28ydYpDYWf6PEuhqxelltHM?=
 =?us-ascii?Q?8TjZMeozsvD8N0JaDaOG/uHUJqmmMTDjbm/7/0Cc15yi88NFFuNb79f06ebk?=
 =?us-ascii?Q?NX36f9l3CW711GlKFu5mK/JJWbJC4hyhz8lfy6pw8+gDBotyP7+BZOdn/Z6N?=
 =?us-ascii?Q?x1Pid3lSGeNG1+LYI3KVAJqHsOxatj9LaQpsNG87lXz28TeSXexGVNNNmfJj?=
 =?us-ascii?Q?7tmRnWDTJP+LtXZrviVzp5J27nFHTIiX0QZxF06+Zgm4YpnReaYnMjvQHLOX?=
 =?us-ascii?Q?L0D6j4pdqoF8y3Q6xUjdsO4btWZNaR3lFkfo76Ofbnn2n0RJ9z7S5F/WD5jd?=
 =?us-ascii?Q?YbQ9TRnqZ3DrnwpfsooebGuqs5DFKCPpJWWagLxYvD9RFFLD0UhcrB9k9mw5?=
 =?us-ascii?Q?Pf0D3LaXPMb3obwuBqi7EXFiKyZjCiHPRhC0zAsQh1jLco4RF80SxYKwTa8k?=
 =?us-ascii?Q?WdUDYuoboYaIdrJH6irxKYoqeSlThyGhSkcBbXlkVUSGW5B5iSECZp2m2DtF?=
 =?us-ascii?Q?jU68IXWkY0MVOiSKh3sXeeaXy5FQlTDeKsnHDdkcranKrhh5K1uVo1gzJMui?=
 =?us-ascii?Q?mmw/liSXO6Oj99StUTKbf+WUI3UvTTp8NCDCfRgYB741y3wXEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+3iycOLFw0lrmgduuN/HOFaFXTLUjXMDyCMjR5e/MdLbN7ZHYjoxlIDIUREz?=
 =?us-ascii?Q?UNvy8U2Fu+XJZT3UwWTT67UTGXxbkS/Je4cSE/2aqYaqaDOst9zmISB2trSs?=
 =?us-ascii?Q?wjMEoVzJPNirx3UIM7m65fH5N9G62bD75O2iUl21Q7Ze6I1U9tgpkA7Z/mq4?=
 =?us-ascii?Q?R9tFhoco3Dfel6zZWokw5rYnxs6bInOsmCXbBNFyoSFk3gHx+nA0z2kdc3CC?=
 =?us-ascii?Q?cB5ZX2vmY3UQDimWo9DEGa1mAmx5c3Xu75LS2fo98dQsnVe+Ya+ADo32eX7v?=
 =?us-ascii?Q?e47LkaGCcHZ0Aj8xTAFa3egBOemhNnlklnLoHGCqYDCcKPIHhAOtq6P6DtLB?=
 =?us-ascii?Q?ZGesev4HDz5ksNBOASUBD0YxbxHuI0Fp7J+xL/2LBDO9XXBYleEkkIat0UAn?=
 =?us-ascii?Q?Y1cIZchgTgPeFC9SNdBHJhBtxYXgAO5ARFRdmJcNH6Gn3XD7MFyRJ7iglVLH?=
 =?us-ascii?Q?MXqrtpbnHoRJEj6vBD18A69cA85At4XjBp6tru9V39c5UYvqNl+5wFQgv1wZ?=
 =?us-ascii?Q?8opDsoTKw5gTNDT2Z6TdkycKFMaJTa9p8xSR1u2ZVrXshFERvPd2yL5Ms6OP?=
 =?us-ascii?Q?jWydbppavqumxq9VnwAjJWAKsMwNkeVm3Oe76b8RLGeZbG0ZdtmWXaW/NxOF?=
 =?us-ascii?Q?wfzHOjhXxvYVHr35ndy/xgLECo7V2G7Jk5kHYffn3oVfll8+pTLwzmULk5MK?=
 =?us-ascii?Q?cVg4ZFQWB6l9acj7rhlCeLaZiQuFNty1m9yp+HLys4+HYT50ECq9BjpumVmG?=
 =?us-ascii?Q?cnU35L2WUMkW3V3VZfTj1PHXqT8vNEqfBhleGGDfQCHAuj+Wo0/s35CbSIa9?=
 =?us-ascii?Q?Cwz6rjmprT2M9Ic/LK1mXTUWaFSRF8wRJDJZfURiyBANGzxeS4VPRQv1B5km?=
 =?us-ascii?Q?/Sa9ZihHwoFibZRZvnj6QpkUQrSDNqP5NtlJ2euJSRT+jsBpmf2NnDpJh8C1?=
 =?us-ascii?Q?iC1txSiZPRypUbZNzCaL6ezRFz05zCkNWlP/dvR69EKvll4MRpYon9VbV3qa?=
 =?us-ascii?Q?Z7eScmBxFz1S/mL1FXPsUcFylQwfzYN5KQ7OtRKfFM3p/KgIXWtAEl5p8gm7?=
 =?us-ascii?Q?89Hvn4Hd+0GgKJOmrMR93XeY772O8/PpxiBQsPiXmH1vPOJlnctBsOyUTyRi?=
 =?us-ascii?Q?jGbTv2Sp+eOh8oIkKX0O6wZOWQeSEFuSh7dJhVIFPiwvbt12Pee9T3LDH/rL?=
 =?us-ascii?Q?bv/8wAV7uCVPtKCp5jvdR5FFN5aZBtP+LG5AJiSF8XGDKJFIxLmjuAkBD/Fe?=
 =?us-ascii?Q?kYB81FTFqKeT+KApb7W/rWzzumMdhJyB7q50M3zVaVIP9heTkLvEhbZZ2Yc1?=
 =?us-ascii?Q?DZv6Cnh+kER/iIy7WTDQ3kj8iQEaSMmqC1+GMwK/fb4DUy33QVat1xjf9rql?=
 =?us-ascii?Q?QFL6CU3WREmL3wk3OK6qbdd3S8G56ZfPnoaNd1qnwDxu9qrW+0X6xMjbJIho?=
 =?us-ascii?Q?pB7K+1UR6YjWw8miiCW+/c2zz/Cu8rjEeioaioslLoo1hnuA7IuMMiLLGCYD?=
 =?us-ascii?Q?XIFpNm4fnrA4PAXif8jSbYV6EMy1A3educg8ZPsaP0QEAoqZlUCJhXSNE95B?=
 =?us-ascii?Q?poVkB0tmmxz7oilFud2RQXDWL5BhBMhTtFpwR+5+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489ea39e-c09d-44a1-c097-08dcc286b009
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:51.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jINC/2t7b2tobQEnX2S4z01JaP5Myv/WirH+BIVhTRGRjGIgjTEjam5b7uhZYkjhXd8V7qJ/HQ0nv1TKttnksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6402
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

Currently, udmabuf handles folio by creating an unpin list to record
each folio obtained from the list and unpinning them when released. To
maintain this approach, many data structures have been established.

However, maintaining this type of data structure requires a significant
amount of memory and traversing the list is a substantial overhead,
which is not friendly to the CPU cache.

We actually don't need to use unpin_list to unpin during release.
Instead, just use a folios array record each folio is ok.
Compare udmabuf_folio 24 byte, folio array is 8 byte. Even if array need
to be pgcnt*8, may waste some memory when use large folio.
The access of array is faster than list, also, if 4K, array can also
save memory than list.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 80 ++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 43 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index eb55bb4a5fcc..a45cec1f82b3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 struct udmabuf {
 	pgoff_t pagecount;
 	struct folio **folios;
+
+	/**
+	 * Unlike folios, pinned_folios is only used for unpin.
+	 * So, nr_pinned is not the same to pagecount, the pinned_folios
+	 * only set each folio which already pinned when udmabuf_create.
+	 * Note that, since a folio may be pinned multiple times, each folio
+	 * can be added to pinned_folios multiple times, depending on how many
+	 * times the folio has been pinned when create.
+	 */
+	pgoff_t nr_pinned;
+	struct folio **pinned_folios;
+
 	struct sg_table *sg;
 	struct miscdevice *device;
 	pgoff_t *offsets;
-	struct list_head unpin_list;
-};
-
-struct udmabuf_folio {
-	struct folio *folio;
-	struct list_head list;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -189,32 +195,12 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
-static void unpin_all_folios(struct list_head *unpin_list)
-{
-	struct udmabuf_folio *ubuf_folio;
-
-	while (!list_empty(unpin_list)) {
-		ubuf_folio = list_first_entry(unpin_list,
-					      struct udmabuf_folio, list);
-		unpin_folio(ubuf_folio->folio);
-
-		list_del(&ubuf_folio->list);
-		kfree(ubuf_folio);
-	}
-}
-
-static int add_to_unpin_list(struct list_head *unpin_list,
-			     struct folio *folio)
+static __always_inline void unpin_all_folios(struct udmabuf *ubuf)
 {
-	struct udmabuf_folio *ubuf_folio;
-
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
-	if (!ubuf_folio)
-		return -ENOMEM;
+	pgoff_t i;
 
-	ubuf_folio->folio = folio;
-	list_add_tail(&ubuf_folio->list, unpin_list);
-	return 0;
+	for (i = 0; i < ubuf->nr_pinned; ++i)
+		unpin_folio(ubuf->pinned_folios[i]);
 }
 
 static void release_udmabuf(struct dma_buf *buf)
@@ -225,7 +211,8 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
+	kvfree(ubuf->pinned_folios);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
@@ -326,9 +313,9 @@ static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
 				     struct folio **folios)
 {
 	struct file *memfd = NULL;
-	pgoff_t pgoff, ipgcnt, upgcnt = ubuf->pagecount;
+	pgoff_t pgoff, ipgcnt, upgcnt, nr_pinned;
 	u32 cur_folio, cur_pgcnt;
-	struct folio **ubuf_folios;
+	struct folio **ubuf_folios, **pinned_folios;
 	pgoff_t *ubuf_offsets;
 	long nr_folios;
 	loff_t end, start;
@@ -351,22 +338,21 @@ static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
 	}
 
 	cur_pgcnt = 0;
+	nr_pinned = ubuf->nr_pinned;
+	upgcnt = ubuf->pagecount;
 	ubuf_folios = ubuf->folios;
 	ubuf_offsets = ubuf->offsets;
+	pinned_folios = ubuf->pinned_folios;
 
 	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
 		pgoff_t subpgoff = pgoff;
 		long fsize = folio_size(folios[cur_folio]);
 
-		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
-		if (ret < 0) {
-			kfree(folios);
-			goto err;
-		}
+		pinned_folios[nr_pinned++] = folios[cur_folio];
 
 		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
-			ubuf->folios[upgcnt] = folios[cur_folio];
-			ubuf->offsets[upgcnt] = subpgoff;
+			ubuf_folios[upgcnt] = folios[cur_folio];
+			ubuf_offsets[upgcnt] = subpgoff;
 			++upgcnt;
 
 			if (++cur_pgcnt >= ipgcnt)
@@ -381,12 +367,12 @@ static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
 	}
 end:
 	ubuf->pagecount = upgcnt;
+	ubuf->nr_pinned = nr_pinned;
 	fput(memfd);
 
 	return 0;
 
 err:
-	ubuf->pagecount = upgcnt;
 	if (memfd)
 		fput(memfd);
 
@@ -407,7 +393,6 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		pgoff_t itempgcnt;
@@ -442,6 +427,14 @@ static long udmabuf_create(struct miscdevice *device,
 		goto err;
 	}
 
+	ubuf->pinned_folios = kvmalloc_array(pgcnt,
+					     sizeof(*ubuf->pinned_folios),
+					     GFP_KERNEL);
+	if (!ubuf->pinned_folios) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
 	if (!folios) {
 		ret = -ENOMEM;
@@ -463,8 +456,9 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
 	kvfree(folios);
+	kvfree(ubuf->pinned_folios);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
-- 
2.45.2

