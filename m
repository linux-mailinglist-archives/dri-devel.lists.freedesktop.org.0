Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BD97133C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3610E352;
	Mon,  9 Sep 2024 09:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="qXsd1NvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2059.outbound.protection.outlook.com [40.107.215.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6312B10E350
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WITgtunADyOFV9KE4T4OaSomGnIU3UNJu+0gPrrtF45p769tjOU5VOzLe4nE4gJGIGqHRQk0bC1k4/pFFtrLjAkLhxz13/JGxhwNKielcYD6/Uaxt1CWiVJPod9aFSHtsznHsqmHJdnj46iJY/TeSIVPLRZpxuAyr9iorjf11+kMk1VzwUtQVy3eeepqEJH5ZkiMYGIT+sq6ow11wsAg7G6fiOrIS2I+3uefTnJcd/XyGOeGbP7uzMjPDfFKZZyS56mpJmUSzSiP9woX1RYFiCXq9GCy2DBK9rFtDoBoA2hPfRbcINCFm2S2/ZtYlW5VnffkGuqi+Y2HC8sH09RdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/F4MlgK7pTrUhUQUbT6eSuBN6AE8jElWIdcMynY65M=;
 b=jqTA3PekZwXZN/OYVKJFizRcBn9zGbdCWlBX/zJeqicS13dLe+PSZCHvU7JntRKcgRVJjBM1Ye1oTnayz9vWKnElNzxC895OUDHEqpRnge83NzY72k3VJr8sxnYcD2qHiGdMS4XR9LxFLVsYMRImyTha6t+a20PlX5vZ6ozgm5nWAghPpc1WQ3HgL4LsZa3pJkIpubrHxVvhc+husHK5XMCx5CrV9rN4LE421/d8AvH1xH8722ksa/D/o6iSz5+4Y37iC9vwFFYMovoIsx/zR3ksTjFmmiNoqi5TI5qO8It41yjmJyUzzzJd2eXBD2SIZW7GiJ06T0ciYbj3VWKN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/F4MlgK7pTrUhUQUbT6eSuBN6AE8jElWIdcMynY65M=;
 b=qXsd1NvQCBdGpu4XpuK0Ua8MKe8EeZ89PfA5E1fcu3jtOaYO4HPjHCf1+SU8UIBK/KeMDeOj8SSuXrJ3mj8K6H0AzvD57y+yYUysMc6l1WBdJ3YG6DxY1+AEjoSNvmBTJa8na47vskDHQPcZbZd2qpZSoS0asvbQ0X2TmfQ3Hf/0JeonXM+MXk7pbfXR78aXU2WbxJQXSgn6q5AfHh/acgbXy3nf6776pkVRXhXgbJqvmSaB39spRtbak8upHIFUotknjjdwXqjLA4szwFD77gxVtISqqGKlCJx9I8QwVcknewhE4r4Eq0uOqGpoSn3KKOSA0+zqZo9pg4/aFAqSLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:23 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:23 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 7/7] udmabuf: reuse folio array when pin folios
Date: Mon,  9 Sep 2024 17:18:45 +0800
Message-ID: <20240909091851.1165742-8-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 485a1bac-d4f2-4d16-369d-08dcd0b07e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OAGKN3bF+0OLEYdyh3UQAoEipSPKy8NsLdoOWYo8hj2ZGt3tLrpdMdvzooYn?=
 =?us-ascii?Q?hMie+Dq6qgIrPq+AKW+hO7Ew36sS/vjyNqzUjfl/v3abW+Qe9A+ROxwFK398?=
 =?us-ascii?Q?QK4o1Xi1E5ooYhnSxvmcVE5gO9TpOpy5uCAZoA/BXq3DyOZSSQGKP+nG8foH?=
 =?us-ascii?Q?6dGCOm9/Kb7QB+8U6Vy1rsA43ktNsz8IM6bbEmKTU7P6qgw2LewjDAfacAT5?=
 =?us-ascii?Q?SFyBtTvjJwllZ3i02lIMmBQTVvKHz02Fuxp2s2okendgO0WqbChZrWZaeL++?=
 =?us-ascii?Q?YUvmCGNOTNWzYqQZdoVXjO6yKIL4AJyAuUeURm6m+Fk/V8n3Rctbh7Vbgcq7?=
 =?us-ascii?Q?9lNZ80IqcwnqI/ngQO3B6NwvutNXyB3G33Cq+/ulDyivq8Out/oY0Kh0WegH?=
 =?us-ascii?Q?odD/2A4vUCNfjNJEntmMivQ6LjqNlpJONOkbhHUheUbyoG8FJ3YnjnB+4WFm?=
 =?us-ascii?Q?gFAQJqjo8qe9mOEiUdFNBaV80/M+2ffWq8mMsaWdOIKO/+XQOzAv6cqZvHHA?=
 =?us-ascii?Q?y0w0xdYeTSIhYfGn317tpaF/nwOad4xdlHhQKN/q1Mptf4W8EXCRrTAOgwSA?=
 =?us-ascii?Q?uDJT4yjdW8Uk/zrDXQ+z/Xms17nglxUDadqsKo/yEFsm2MyKeR5kRRC431s5?=
 =?us-ascii?Q?A03vUpGaQ+54dMz6sX6TaJlWJbw0drjZ4X4xk4tYaQsY8rrHuVujeZVwng4R?=
 =?us-ascii?Q?WeEhYD3dU7BNq9Mf0guEO29FY7GB2BeoRrio1LXgXJScRk6RRj8RHBIgxcme?=
 =?us-ascii?Q?jsKVBcRsigTRTBrDBcFtcIxk3eBHVc6v+ZQ2a3OCX3JRgxSg1vF+xwCaWbj6?=
 =?us-ascii?Q?3U0VfjIvNbXHB2DGOfyY8yv/L/CMPBkVAR7XpmOgF8zkGx+A1J1jijf940Ex?=
 =?us-ascii?Q?N7vCfC9oKEeAW8lXnruPa76UFkmSKLNCCQblzRLoIeVgo+c2QWNiBtUHAol+?=
 =?us-ascii?Q?9oz5g7lUq8o3gvYMh22BQm19sDZcfrn5CGL+M3Xez9iBqNp+4BOObQY5hYgi?=
 =?us-ascii?Q?VUK4oi2g98oJEOqQQbOS/sip/hAv+/3mRFFBGExvNG87PqCk3OVHac9R4uYB?=
 =?us-ascii?Q?58XaSkID9+YiVw6nkhbTnOB5AElVR4V3dsVJifA3bVSYsIDZaKDQ6Ed9SdpY?=
 =?us-ascii?Q?9ct05VD6Fyh/OGg4zTvhGA4zfGVW/gObPeVztw6GdR0MgH8ugq23B3ay6Pft?=
 =?us-ascii?Q?WRhKgDXXN8h/sPXV5WwpxFENC85WuuZaSU+MwVjm6OAIqsRcknTg/SkuxHB6?=
 =?us-ascii?Q?A5iGFldWMEhuzpgVwzL9nESZyqAagEo99x1lFDS9qrr1KrnpsGV5BxC6Vb5w?=
 =?us-ascii?Q?Wrg/KOI5Qo8Em9tq78ylmw527fTfWPethYd7djA9zUjgXtXw1Z16Zn02x2dq?=
 =?us-ascii?Q?k/1pw7z419RDxi+B/ucUvSwRWpjCmGc33IX3q1Kn/wHv/3w/nQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYVNRXpqF8i8tVb/OVtlRNfvb1pQ8uHc0l1rB84T2YV0FsSfqPgTu2ZB+bdb?=
 =?us-ascii?Q?rKz4S0+rwoA/4MIO7HzT/tE5R+CVKtcgQdmTjGpX1hxcqO1+i+vxQVunYe8p?=
 =?us-ascii?Q?fepELI8FMYGZpcMZPyJTPXiVM5BJLRxNWpjKX3qAhaiDZ3j8W649h5mQ8lGG?=
 =?us-ascii?Q?JfKcVeBztzdIkR/OBXiplJ+TSGdyHa/WYeqVSG7hyR8oeRJFSmhiIsyyCzH2?=
 =?us-ascii?Q?yFpuwmIHrIQFm2LvJzNmY4O+RbtMO7uxqE2NIQV06+axTacGXsFHXHWHxg6T?=
 =?us-ascii?Q?54kMl/k3MYkbYrfo8hbYTlm8DiryaEHuk9177PTt/rOIjxcXpKv/auqoL0hZ?=
 =?us-ascii?Q?xrZoelQjuGUnorH2BB+qgU94Xqd4cjCVQBqw0PNmOYlbNVjO5GLLX39pZRjJ?=
 =?us-ascii?Q?ed3ZUM9CrghoGnFdS75+h1bOYysGxajoHUmNKdlUszQ9uzEJNq9AoZyFe9f5?=
 =?us-ascii?Q?QBeDont8dHdzy26F7TZEvs7hB5Lf8TMY/EHbqVrAy3HHSJAgCrYGhqeWmaFW?=
 =?us-ascii?Q?Wf/gD3r9py8hzYrXAGc/1295BLXNNLN+UEq0W739ivFRle1U5APgQU7XSBV5?=
 =?us-ascii?Q?tpKPFqpss87PuAcz4LlER+v7yDRp85Sl+Md6ByaKtM8n7kGd1ilYzDfNwXLy?=
 =?us-ascii?Q?vdiGzBT2VlTNuaz/8A7HgVSF1m/O9BN+STPVBML1WKl70H9yKIHESmCdQumI?=
 =?us-ascii?Q?lTJVfBoVO7/NnGbQVWnjQXsuieFrAB9TfKsZqipGnSTijWpnC4ldxLDozOAr?=
 =?us-ascii?Q?cZ+wxy49KYN2KwXfL2d4ybAKPbzBTrJvP6DPcQNGWzF15i3bZps7aCUY68FS?=
 =?us-ascii?Q?O6D0CrmYtkj3gY5TKTpagxcvZ3GjdM6dS+rATvcibrp3VsXfxbWh59mNaE1m?=
 =?us-ascii?Q?vnSrJGRGJmqn84hSzIzgDuIEmUY9CaXxSuR6TlQNQ2i1jmESEa5+g0M46oXS?=
 =?us-ascii?Q?Zv1A9tjKQm0+uQHDLztJmAZz5VLrraGSPptuJJqyRkHQ89QBM5DM4PaANHHC?=
 =?us-ascii?Q?o2BgFhHlQDaq2pz1Hi6NA8zIuDc9Ke4ykTZmID6NwAmURZcaeexP5ORWjzjv?=
 =?us-ascii?Q?LZSBjUtNFFMZUBIYaEoCRdukj4noNWDt5uixnJWFDzGfXr94nkYsd9Cq3SxM?=
 =?us-ascii?Q?4Qy9NKrOXgbVxhYpTHg4C1vvvsNeeqU5YGMau+VOfJn02r/PHRhGAbYs4A+S?=
 =?us-ascii?Q?ErfMbAd/hhM0YRenXXkQDFO4P+EwjiBr3y/6jyBXFSjxJem+TONbirXd+1ys?=
 =?us-ascii?Q?a5C2OPNQugqu2wxDVLa8DyxUZyQWZHADU6467srkb8eE5IOClA3dSvflB3Uo?=
 =?us-ascii?Q?JWt6a4SaKd0IlPDhU2e22+0xQM1tGl1RUzOzwlx4U6Z7bA2X1gz35Jnn5bSA?=
 =?us-ascii?Q?8DK+EMtL255Wga3WsWOY9h5T76/TQG0+ZfN7CqvuVnJRujNGxx+z2WiwkNEj?=
 =?us-ascii?Q?5L0j7aK23uLDeUo/FM9jp+rvMymWXjfkBmQKi2C8cONoOI+o4uNykKw4IQV2?=
 =?us-ascii?Q?NrGN1glocBsiydVN/Q+TV7O7UpF7bDjKsp/Z8zuYzJ1D+oyfB9SW70dvHd5L?=
 =?us-ascii?Q?xkGGp3UmikgiIKeUQtGgNpdLCWcU7Cw5IKh8gXkz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485a1bac-d4f2-4d16-369d-08dcd0b07e71
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:23.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M07UJOYdAd0KZjTr0u3U3LZY7IKix+I2WtF0434Myaslwk93HlXpn9NOcTFMTV9sqg6Uqe2QDiGPfjnswKC5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6292
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

When invoke memfd_pin_folios, we need offer an array to save each folio
which we pinned.

The currently way is dynamic alloc an array, get folios, save into
udmabuf and then free.

If the size is tiny(alloc from slab) is ok due to slab can cache it.
Or, just PCP order can cover, also ok.

But if size is huge, need fallback into vmalloc, then, not well, due to
each page need alloc, and map into vmalloc area. Too heavy.

Now that we need to iter each udmabuf item, then pin it's range folios,
we can reuse the maximum size range's folios array.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 0e405a589ca2..9fc5d22d54ae 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -341,28 +341,20 @@ static int export_udmabuf(struct udmabuf *ubuf,
 }
 
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
-			       loff_t start, loff_t size)
+			       loff_t start, loff_t size, struct folio **folios)
 {
 	pgoff_t nr_pinned = ubuf->nr_pinned;
 	pgoff_t upgcnt = ubuf->pagecount;
-	struct folio **folios = NULL;
 	u32 cur_folio, cur_pgcnt;
 	pgoff_t pgoff, pgcnt;
 	long nr_folios;
-	long ret = 0;
 	loff_t end;
 
 	pgcnt = size >> PAGE_SHIFT;
-	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-	if (!folios)
-		return -ENOMEM;
-
 	end = start + (pgcnt << PAGE_SHIFT) - 1;
 	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt, &pgoff);
-	if (nr_folios <= 0) {
-		ret = nr_folios ? nr_folios : -EINVAL;
-		goto end;
-	}
+	if (nr_folios <= 0)
+		return nr_folios ? nr_folios : -EINVAL;
 
 	cur_pgcnt = 0;
 	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
@@ -391,14 +383,15 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 end:
 	ubuf->pagecount = upgcnt;
 	ubuf->nr_pinned = nr_pinned;
-	kvfree(folios);
-	return ret;
+	return 0;
 }
 
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
+	unsigned long max_nr_folios = 0;
+	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
 	long ret = -EINVAL;
@@ -410,14 +403,19 @@ static long udmabuf_create(struct miscdevice *device,
 
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
+		pgoff_t subpgcnt;
+
 		if (!PAGE_ALIGNED(list[i].offset))
 			goto err_noinit;
 		if (!PAGE_ALIGNED(list[i].size))
 			goto err_noinit;
 
-		pgcnt += list[i].size >> PAGE_SHIFT;
+		subpgcnt = list[i].size >> PAGE_SHIFT;
+		pgcnt += subpgcnt;
 		if (pgcnt > pglimit)
 			goto err_noinit;
+
+		max_nr_folios = max_t(unsigned long, subpgcnt, max_nr_folios);
 	}
 
 	if (!pgcnt)
@@ -427,6 +425,12 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret)
 		goto err;
 
+	folios = kvmalloc_array(max_nr_folios, sizeof(*folios), GFP_KERNEL);
+	if (!folios) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	for (i = 0; i < head->count; i++) {
 		struct file *memfd = fget(list[i].memfd);
 
@@ -442,7 +446,7 @@ static long udmabuf_create(struct miscdevice *device,
 		}
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
-					 list[i].size);
+					 list[i].size, folios);
 		fput(memfd);
 		if (ret)
 			goto err;
@@ -453,12 +457,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret < 0)
 		goto err;
 
+	kvfree(folios);
 	return ret;
 
 err:
 	deinit_udmabuf(ubuf);
 err_noinit:
 	kfree(ubuf);
+	kvfree(folios);
 	return ret;
 }
 
-- 
2.45.2

