Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05495B0C9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C88D10E729;
	Thu, 22 Aug 2024 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hGv0/goh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03B10E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDePbvr0GUJakKWB5bUfD7/9ff/Tm0801BAoJsP2uJuNvYbfcv61mcudevBfb9TPkBmnOy/p4i0Ekmeyqn6yR1gfK4MEqYC6d/YsVVkNJIaJK6AXakvGBGrC1EsaqJ/3pB4Nndd5oLlc/GBorfVhAVuenRU2XHR7VSS7kk6O79wDEsFdhEOn7gP2PJiG1NW+7PSF7ZKxcd0Qlc9mI+TQRl8GnWtO1j68pJbeLO5dw9sGSk5Vj6HVdYsaVkbad89x2/JDuuD8Be6KuB2YlHKx6uoYnINTQskPcxFNOREeLgHol9Rhli39o895lFYHnEmJj50TpQcBKcABJwWULHYjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko/aKqqMO/BFJfW8BMVb0nA4mKprdnKSjuolrgQoDFs=;
 b=k0o9pPiasQFm76R1vJ1VmrgoBTBjjZoI+mWFb27ER7EiPDnby/2MFXdp5XC5kYxudIq/DMa5T8CGstIAbNTVItleUGvKkuYZ5wOQJQijLcwdpQBjKbI7gqjcR0b+PaCwbRqSzJY1JVviQj627BkOZM9Xjpx+SBjBfTfhrgH5nLDvQ8sjvpg9Z0nOBezQRzPMoJEVJFulO1qmeMV5SiI4Sl1lweoJg/2hHAPzLiXLOicVThSkCgV4B/sD4Yu2b4IAWSQFApgIHE4J62TQKbITc1klkoSlwsnkiNtp6R1rnA/2TNwI8sXW4svfP+yDYuOUqlHYa364XQAqm2Wqx9KR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/aKqqMO/BFJfW8BMVb0nA4mKprdnKSjuolrgQoDFs=;
 b=hGv0/gohsJb70vLIBq0RfXFp8uuH9AYpJhKrtxe0HR/+KTGj8OYFjwO1KsN5V0cpqsagfuDJv/+QXqlWU1AQlgjtdLV2gMmfB1UtvRWXsY9jk4NS89fhDQzkrJSL8gYIC6M2p8daT6pPNcnxTZ80BMw7E3FkmgCGJsrsKl+ZPODhwVhOInRZH80eUIXCVZdB7VaEC6TwIqFVXxWerwxV3dG6Phk1ZlABIoivUPjtqOGAs61PiqR9oiqXe9gvVa//WrN5P6l7Gx1QLDVJWjazx8e8L0/gGjKRA0NjzpXS4wamUooTi1AsQpgSRAyg6AWlBrjQ6/6meXLzq/JKeIf2JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6402.apcprd06.prod.outlook.com (2603:1096:400:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 08:44:46 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:46 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v4 3/5] udmabuf: fix vmap_udmabuf error page set
Date: Thu, 22 Aug 2024 16:43:35 +0800
Message-ID: <20240822084342.1574914-4-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9980c4ea-b4af-4fbb-bb0b-08dcc286ad2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SbSsRkQLYbnJHIeEg2V2L0j3EUTFtGsUhjyP8o83ykD5O9qhUyo4pw+wFYOd?=
 =?us-ascii?Q?e34J4RjG7BCc6A0pWQ1QeQNhkfF8xB3KyB6ZCKmLqtwbYKsYkH1pN6z47kZi?=
 =?us-ascii?Q?8VlAVF0wKj3U/xrzdSOoGnOKwfUnDfzjknnzA3EZNxSNQLGdGMrmJM2Uy6dC?=
 =?us-ascii?Q?xa3+JG50zJeu5Y+qS+qw4o6w2+5KAgzZiLJP8e1pFlSMks9QKyx7r0Eegwq3?=
 =?us-ascii?Q?u4TZEVqvsseeMT3l7KDeYT7McSNfDvL76dO6vKiGb/YfSsaIZxZvTniUkNbM?=
 =?us-ascii?Q?W+e/AmHmH6FTh1EVN5sVBM/aDgH4UrQ9VXY1oOWTGDV+/Jl15YCy3JIP7xyw?=
 =?us-ascii?Q?hzouz5Vhf69v1dHMl7QT/MspdrCXVWliQl18fdzquYc3qJ0Suxi+G21Z1K/h?=
 =?us-ascii?Q?d53OdgBLo0SAr4ccSN9uo52mN90FRrmqKI0GnJ1jw+/hiGncPqtS8zzKC2/5?=
 =?us-ascii?Q?kEZc2RAq4hVdBoFBboZwp6dqDtiYIrIJOjXc3B8b7JmVqwFlZFoztZCsNuCr?=
 =?us-ascii?Q?eal8ll0BpekmNz017XAl22yAfWw7CzWB4LLgJjLqjw5D+4G3mTRT9HTaVMC+?=
 =?us-ascii?Q?wb32eKebaxBmA/70f5L3PWKdgnUVce9eiY2Wpq6j/fOgFqwxjfJKUagZb/mq?=
 =?us-ascii?Q?F4yw2cHKtxnS0TOQgYGmsa1LpYVbo0sLekQTpRMrApaerqWDVKAVj7WA7BUm?=
 =?us-ascii?Q?kvovhu6/tDKS7Ljf0yxbALxxjN2nOaib3P9W1l7HhlZu7mQ83losXOMfhTCf?=
 =?us-ascii?Q?KdehXi3fp8ozocHVX7co0YL9I6CKg+Fb5uGjDnwE1WkiZVEw3G/7HjE7yI96?=
 =?us-ascii?Q?aJzc6VuIpgpAlIRT75BNQcI9WHw953SCmue2gwxCCatQNjyyZazGfO0UNIOr?=
 =?us-ascii?Q?sJDgVRy5m3J4wjDY3kj6ML12cmflEAYuNluDj7fXMQMeqIq5ME7pq2VbZTed?=
 =?us-ascii?Q?z5lgt4bE5Ydcc295rB9dTvDgklXUdgyodfSg+nnNEmmUFyENRC98ldh8nqTr?=
 =?us-ascii?Q?6JMjt3YpMLBEJeMAsttMQ+jiEsQvXJdCEXNtH2r/6jQrWKZkZJEWzYan6C9+?=
 =?us-ascii?Q?xe0Z6NH/CiGjD9PZUNVTcK59jrJP/7g1u8SeToHKpWaOf5Xaj/E24TkhR/KX?=
 =?us-ascii?Q?d/1iO96sF+/bgDbAjVZ0U0E/FJbe6GQUWG0lctFVzaPiVBS3wT4rQ9gWB2ZP?=
 =?us-ascii?Q?g0sERu244ZUxlyTsXz4V6XoaHjHqaFCL0X/P7doeeyExeieSwvzhlKCiL65I?=
 =?us-ascii?Q?vakHK8wjX20XvRwDnEd6HbUVU8rqji1h9i+TI2a2ZWY+o70WFrcSeImRrDE4?=
 =?us-ascii?Q?uH17bVJDK6slehJNQMUkB4HH/S2guoGsgY6H0r+OPDDiwGyFrpqCtQWbtuJd?=
 =?us-ascii?Q?tFoXacuN7rPSOwjnZPX5AsuHaVt2/y6l4+0EiCCZ5s+USVsSRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hF7lIBJJ4LK9ClnsEk8e/vf+Ygrfr5myRc8qGy1whSDZZT9apaRb9OGHhYRP?=
 =?us-ascii?Q?90xcYehX8cg3PVrB11mlb+VtW3l59fEo8t5uGwoPCosapnEURvoWbVwAsItW?=
 =?us-ascii?Q?DoSocpCx2e6ryTRvDW6M7gejGG5X1rGc8kEKsY+O3f3MbmEnJqts5EVmlvZM?=
 =?us-ascii?Q?PhPHRID+LIQ+CfC6KIX8FPBurifhXbptPK2RtDMU8597eCWfP/m5aFCePXZq?=
 =?us-ascii?Q?wZN3NXSf//0cN4BU387q0mqR2+lC5X157anN6fWDY1Dm7mMEcXCl1MbmDEUv?=
 =?us-ascii?Q?RgF4wsC9vd25Qz7yZkUp9N6+sBBdZ69WoQwBY7a9ELJNOqYw+Y0tXJwpSrHO?=
 =?us-ascii?Q?8S3vRBZFKBUYKxrxwR/J0HxfhA9iEmhT0ths0KZcx2GzkuPldhLixip27J2n?=
 =?us-ascii?Q?k5tdbcRei3Ak6GIW2qPBajoEXy1NiRcnahQBaxwRiQUOwfoiwlFf7sB53dGv?=
 =?us-ascii?Q?v7c3sLNsLB61WlhXj8TIscz4M4YNidM0SdxIrauQJbuu6GwON/qEDUXx2RUK?=
 =?us-ascii?Q?p/XcrQ8d4mMYDAPDw7hfAjx1EaIKmBhEbUssFlBr7MtEdhk1l56//VDsOUao?=
 =?us-ascii?Q?yESLpgLQ7D6yvcp8N94bi8618WH+30NPv8BsX/pUJnnNcBEFkM46NChJJtyP?=
 =?us-ascii?Q?nOkXxZSm/6AXIit8nqeH47R6UWyQMfdCzQqyV+z6S1VhKwzIYgkDFBgSbf+1?=
 =?us-ascii?Q?jPW/bQ/UELKT0iZnxr1KbiapkEyO1xDobIWXAr2MNzjTi89BoQAIwTUxSF9P?=
 =?us-ascii?Q?q9XWEZmSLG6T9+x/Uz1e9RtC37sdVNe0ofvd4DYTDFaoIOdti3U2dO8d4tZh?=
 =?us-ascii?Q?7j0Ywxt4sclpHpQcrVnJ6OWpQKU0nS2REbaQxxMCnbPTUFwZZma93Vz9MMTB?=
 =?us-ascii?Q?0lA02b+QlUxnLDSHebplshWklKkGKdOQG0dGL6Zxv/tbuaVZdP5Qs5f6kw7P?=
 =?us-ascii?Q?u46cM15nRVyV9B3+cetG/IKs81EeNdL/1Y/93eXxytd109F38y+RpnoU3Ovy?=
 =?us-ascii?Q?bRBcW3le7R1W1Tu0/dAMX7/Onozz3nuf+ebPJJZVbhHAS7SEg77DFaIRK5lu?=
 =?us-ascii?Q?MrpPq7kzQXAWh7Ad9TA8mqjFwePnG0HBHY7w1yeTGIFGmdH12FIMkhTv2bU2?=
 =?us-ascii?Q?L3e4RUxtxB9H1YuRgLcKUwqvEGjMaf5G/6VdJGvboCCiMkHmTQspUpsHUjWj?=
 =?us-ascii?Q?9UIlocSZ96X9cIPHZMBGcc/AoLHpNFiuPBc5V5RYQxDBAVkG5guc5ePGRv0O?=
 =?us-ascii?Q?yWSS0N+GfgyDG9JqPUdtIjRpcmnKuwBDj3ufeSXTmvapZPHgBTcuMlM2/Wt8?=
 =?us-ascii?Q?sOW8trt7gK7PFxjm8UAmh9AJT4YO/o0jLRw17RyI5IXb8M5hKO/lMkZwxdmz?=
 =?us-ascii?Q?LhOyh0u2I0vn0Jno5xhiQZFWcBiTkWrBYtzt6mOaoIRq6OwQUB3Hi34SsXdD?=
 =?us-ascii?Q?LsckkeS7MjMaAr7vUI2O7VZOFGnRUbFlbwnj5tA9uPB0fnC8Nq4/ITqUikAD?=
 =?us-ascii?Q?x2SISO/69b3yHzJGofk4NJRMwIckNkFRhj+fuuIMmexQAv20jEa1aqJ2ff4C?=
 =?us-ascii?Q?fszmIig1z9Wp6M6+4tI84eURNe+vliumuCByiDzy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9980c4ea-b4af-4fbb-bb0b-08dcc286ad2e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:46.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qChdGE0dQrW3WKWv0SByqj3aHIYlXoT/hkR4+7FnlNFcipUeevkh5JB4RZ9/wC7C9HMljNl/bPBRRVgad0T/w==
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

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
so, we can't use page array to map, instead, use pfn array.

By this, we removed page usage in udmabuf totally.

Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Huan Yang <link@vivo.com>
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
index 1bad4576d492..0bbc9df36c0a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -96,21 +96,29 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
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

