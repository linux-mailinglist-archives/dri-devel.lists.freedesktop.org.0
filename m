Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DF9500C7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A1210E2A6;
	Tue, 13 Aug 2024 09:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="fU6YpAqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010003.outbound.protection.outlook.com [52.101.128.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2610E272
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn7gCkZO15xn1rtXLqTNY4CryzG0Ic7RwYoGo+h9jHF04am/vKNcnPvvEUkhNpqP8l+xpv4DY12yCSyADSorCUWOpDxarfXuHb8ucrWqPM0ls4Svpwfy2fuGDovOZs4kwrqtlvUZ6ZqQUQKPSWC0csSkufS/nI8t2RkZJqrLiC9FRhSqiPk+jgGrTYj3r7wvImGHs4tfoZTDjkaP+nNXKu97NTGvVBkusLaYJZsq3L1v3L3aHxd6Wf2fUWpQjlLqah0amCkXOptWy+Wf2DSiTrjdpXB8KlpSGtKI7wZ1VXXnWO16TJhRJk1itsCPV2COXRUPz2syK/KUaB1zxzai0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM+4srm+h3ujw3a+DyJXfMCGQHcV9mbwLUC4bdV0DqQ=;
 b=c5h5gZqv1kAwLnVAZ4P7Ptj/vGQNTqu0Xn3aI6dBVvRagUtIMRVYjVZyAFv/WJUAXTkXTNSKBOlB7ZCasOPrz+VNnZ6qMf/3p0ocaiMy5eHX94qliy0Y6HFGf3zazztnEVc59S8a3vKIuQJXRSsGEYK9m3GStFzM7JW4TqkqYjkaIQWQe7elgbP/Va8VxvDXvZN7FnD9Fy3ZC6mp68YQYszEttA/Dz4VUhUz2B9CM7fA+5k4h28fVQNkhc/eVpBuwvBB/DaRNqhaSsav4AYQ1pY1EtV1F6QazbJr/4fgCkXxC9NGY1Qvo+Xwy5sVxjVq85xus05aSla2qgn5IlhSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM+4srm+h3ujw3a+DyJXfMCGQHcV9mbwLUC4bdV0DqQ=;
 b=fU6YpAqSKJdufyYUY5cvkETVU2yJnPDu5JSZKFUud+Bpmyj/6d5TIlbUayr0xq2nPoDDBaR+1AmngZiCHQdYaqprkEDggYHfSC+spYmP+l3/G4z8hUrD30KlSN2OIsZ+GmeBoxXQVqVdMJQ5/rjMQ+26Qin5R/mhD/gRJC3SAqg9zqK7lOmjoSYuV1d3tZoJURzG2ReX8VRPnADulJKybPO0SjnE2i5lY9NONzx/6UFkuLyZqAXnVmB7VnUx6mJDTxIzgJOSXeXS43vbSdy89tQmJyAetiKZO3TVCmngzc7zqrXbMzcTV/URt5MpmWP3w3JK9ME8mXqbiahMtQMvgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:05:42 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:42 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 3/5] fix vmap_udmabuf error page set
Date: Tue, 13 Aug 2024 17:05:09 +0800
Message-ID: <20240813090518.3252469-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813090518.3252469-1-link@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1298f1-368d-4a7a-bd57-08dcbb771ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g+xTO4CjnAlUZoHx8tVicgE3X1i04Ma+8PQsLPEGYXu8pbdo755CE0Po7evz?=
 =?us-ascii?Q?8tR+AZ5LxS6PzsQevUmDeLFBuqopJLGAzZAxEkcYcGxYge5DG4wTrojc0ogu?=
 =?us-ascii?Q?ab7GQ+KMPH8AF6iPtG7T/vqAw71mUyzEuPBzakZEc/Iz6f0+iKc3GcNJF+bF?=
 =?us-ascii?Q?xXYAyO7bP5eB3BSbL1B08BXRT2d3dBQxIHnBAYPfYdFVd2sM6LfYSQhNO3eP?=
 =?us-ascii?Q?dyIgZQ2t3Eu74jpV6p4BpgIe/UwTL9rZ2Bmns/RkIFvbXemzKA0Qo3n/K73E?=
 =?us-ascii?Q?D/9SL2NFFjgbtloKvQYnLLGznJY6NYOMFxA9JWnTjqJ+Y2usefO5Q0TcBbj+?=
 =?us-ascii?Q?P5XOD90eAzkkOCthl3jcAYM25XLtOrXF1A4ySW7tFkKadNVGq5PNLS2Uhs1P?=
 =?us-ascii?Q?QmARwujATaGg24jzYEu1eavP34TRfF/QpyX01mHrkzLfPD4kncGrLNIB+hz3?=
 =?us-ascii?Q?RqW7fPQ5FRPBQtlpr1osx6+ur5KPX3Hy4OmFI/Y4/glqdtrFdL/PKKdCnHjt?=
 =?us-ascii?Q?YM+EzUQSUuXAzdAlsFT4GDH94N9Sp06Ie1iEj0SXmQTnSG7xDdIdA0dMmUfw?=
 =?us-ascii?Q?8t+bSERGjFCUd/BCMAcrYbUpcv+HcRo0v2KYt9NTaBxmGJmOMtBbMoJWOdNM?=
 =?us-ascii?Q?CG6Jld+xMHwQOt2q2jlbYaGxRE6XGYELls1sV2m0Uq1cEEJ8SLlq8WS+VIRC?=
 =?us-ascii?Q?IasuOurz3RI7z7Bqy6JUrTtpYF6AI6uBPZMn1mqOXP84zNYgmH3BA6P/6QnB?=
 =?us-ascii?Q?FqUgG7rIgxK5ZdTKtTG+Z8Gb89ol/KzffSmO/18FcNPaXgfH8dWa+VZIW28U?=
 =?us-ascii?Q?btGlK+64VvYeKWO5KXnTykRZWER1F7RzBvp99W7ToWl5I1PoPr59YLyeKbPQ?=
 =?us-ascii?Q?tQv/BOhEcR8dlM4FpmhxzE46d4hS3lqcNve9Wu86sP33GdQE+uwSTqxmW3eI?=
 =?us-ascii?Q?NJ+RfkBiMsqx5ZMLHupN1mzJPOtOWbxMRmUXbkyEcQCCHl2oaHJtTWK/AVTe?=
 =?us-ascii?Q?vk7THP69+SZieLkuXtorDRBWET1PNqJo7u5uZAI/OgFgVLHDXZPooExSUUAZ?=
 =?us-ascii?Q?puGggfd53mC9oFtVtGr1FlJqgGXoBD89oEHwMsIzqm2YF1I9Vyo6DM0m3v+m?=
 =?us-ascii?Q?ur3Cy/xhHCOTD59UGiM5wlhlHW3bYToNjQz+O6mcJPrysrggYapSX8AXGScr?=
 =?us-ascii?Q?fsUU0E1YBCEv1Qiwot5XWKu/Z2TJN/xXAdVqRh/NH4AQmVdol66i6EoQzM5C?=
 =?us-ascii?Q?T+v9G0t6zFjfbZJkmHfk7Ae8KBrI+2n4j9dBInHgXsBOo/So0RmxUFMwhyD2?=
 =?us-ascii?Q?2/p8KI5UzI+drPjMQk6aVg3YONMJOe6MvQHLWeH9RtsDrA5SRWgjFgM4KlST?=
 =?us-ascii?Q?9jvkxaXJEpQROEKynuVnQYidjNesxD+Nz7sWniQrZ3IrLNnKCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVHPk5hYDPK416Atl+K+uFHg09jZ5T1VNAObY3tFVB+H0p000lQjPUMSNanx?=
 =?us-ascii?Q?+cBnzAMvGo6RKQXape9RYblwRtL2QyP9f8Szbb680YWkhU3G71BSLhYFflsn?=
 =?us-ascii?Q?+X1AwNmSg4q4213CgX4tiJ28q7C6QcyP/de5uOxbMqI34TOX6qI8C9duMhLm?=
 =?us-ascii?Q?OC+OrnyCkhfhjMZZCFl+EKYZJcdwjihHU1xwaA+WI3Z78645l0C4LhgMbeRv?=
 =?us-ascii?Q?sMUgrrMb0qhYklrZPg/aA3G0Y2QC4BQDHY9FeMn9+ij58m/TmOEfMYhNP8N/?=
 =?us-ascii?Q?Ie4Gz13bXmlxhzBGO9HknkVDI36Dp0iPeI+ZqtZTXggZUAwWSr/zFgMWlbbG?=
 =?us-ascii?Q?7u6RU9gb+Jl3ToPjXuMYhXGlb1WAWRQMjyU7ofkWTRlYadKh9fs6XtI6o/vH?=
 =?us-ascii?Q?AuDCdOgeVHVmhDwB2w5b45I7OI348vCjRTVFoeHVzmOryMZlFgLdzwp260aN?=
 =?us-ascii?Q?TKm9gb/htAtjOnvLZXs3rqG9DhXnzOJfUT7LLU3uw/vYvb7Zt4VTRX6mC0D1?=
 =?us-ascii?Q?m+ERZycTG7NVHJzPi9oPK/y1dyRXqRWtZ2m/kBM2Od3Qbhj4Ob8DYtKoPkPm?=
 =?us-ascii?Q?SbhHIT0IXz2VpxvqXwC6C0eW8Neww2RuysWZl/lMqiEMFDFPipNfGC1+HRdX?=
 =?us-ascii?Q?Iy64b993IcIOfG7tPesp/lA0XK8PfsR5gR2G6ySqpG6CRPySiLHkhgzvVJWf?=
 =?us-ascii?Q?PF/quoUCTizj7zz2ixLCKVWgMQhb+Sd2wIh/c1TRkNc3oAOGcmLKN9mJfdSv?=
 =?us-ascii?Q?64UXndOqgkK4w0Trn7fxRniE+mQR9WcT1D8jk/Un6Rp1u4WDzGlh5RuD3PVJ?=
 =?us-ascii?Q?PW9hIL+ZG2rLFP1f+3rntWoO01a+Z4zEu1YO5PX/5z36Nz5wquvMb9u+AHP8?=
 =?us-ascii?Q?o8f/aD38Q+Rg1+3yYGvF1fmMRn8POCQOTsaeZNkXwxcloSjx2mFCrUrxAWWE?=
 =?us-ascii?Q?lMb62ZaCqYdXjOD+cGxJC9xKrDGZamyELsBGOB340EQ4YPaTxkhRFWhkGIrY?=
 =?us-ascii?Q?T4Nj7K++hcBoHPzrTHYHOi233OEzRwDr4Z6T9rd7lje7J3C5tAC5Hyi+tJFA?=
 =?us-ascii?Q?2tJluQz/nYs65bnoZ1Lg3QwO6XZRQj/2T1cpx8oDTGGWgWrFs8/zbW9wDLN0?=
 =?us-ascii?Q?S/YFNustXiMBppZqilDAdUngvSbW6lrtJw5Xm0lX6b6Iiew9qnDzZ1BjfjEf?=
 =?us-ascii?Q?k5RyGLTpO9WKRM/TUv7wJDL/qv3NP0EgdrSjcBwtom0xly80hJuC4LjUqVYP?=
 =?us-ascii?Q?tF3VOxTgAq+lcqVWuGTgAWcepmmaao3ag9XZNotT/lo071iToQqps7GWxjhs?=
 =?us-ascii?Q?d8i6aiOv8HdXrrV/zUfYjICOF+aISP73OKzzbWFXPxlDvYSQpGne6URRGEBc?=
 =?us-ascii?Q?V+zJr0pA6nv88Oi+YmmvKAOpOGDhThz5HanGXMHjWCKm9AsylPNmiSL2YU71?=
 =?us-ascii?Q?wS6o8PndEk9xfBpHaLv/6V9uNqp2YfIlp7wGiHPr2G/TtCQsxNPQDaePYCf6?=
 =?us-ascii?Q?KpAmDKnf6+ZFeQDy/vI9q7a1tgctevuNCiwGwpkzqxrJYXJxObF5KsMVMOyH?=
 =?us-ascii?Q?qXWMKTrBNSjZZSSH4bMtEWhKkTNnNIf6+H+Y2aAu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1298f1-368d-4a7a-bd57-08dcbb771ba1
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:42.0345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb0mMbd/6NkvCXSaAopZkOsEW7ygD940Wk+u7/nudITHMT+3ZRdxOiXGIg9iDPtzHpQnd+7BpCWt5+JVnGYW2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400
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

Signed-off-by: Huan Yang <link@vivo.com>
Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 3ec72d47bb1c..4ec54c60d76c 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -67,21 +67,29 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
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

