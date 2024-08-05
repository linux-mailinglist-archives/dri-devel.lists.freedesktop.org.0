Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EE9473D6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A10310E116;
	Mon,  5 Aug 2024 03:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cfK/XM5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2055.outbound.protection.outlook.com [40.107.255.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100C510E111
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWeSPB3cojb5CCrsNtHsWaS5i7Mq6dIVVQAFl9DfFTSzZfpt2XKXMGxLl+tNsw6jQvRGHaDSDXDs+OWsFnpbsfbAh2zwxXI6Tow7cqPa7Nyeju6FqUzW1x7jom2ZoBAKjaxgmQzeqaMJSw3mDQKCZDrgXT6fKmOarmf5FYZZcEApYcY65EjCAxyzLr9G/DOiZC7S4h95yKqHAMtxi+RI99uSc1JU0ZvAcnLOrAUNOg7sozKBsRcAmciPJqe2eXEzy8RfiEMrAuoDSijNVeEgF4AD94oHgEFlCCv/OVWtavzShyTXh4Ym16f2ia+SUre919VoBaLco6bbbELi+O2Wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUCEDBtnwqDVDwiaL17GMS+rnWbFLnQk5kXnB8bMGV8=;
 b=rr8DfNJfjeAhi9WkgWAsnrucgs1cOBAM7mrFTnlFfdsBw8rnvT/sOhyotk4maykMetIvxVULelL4q+/OVNgH3h19vKwSWjoy7nCC5YZndRrjvpLJ+X+wMBuJ8pj7q4451m/9qWefT/oWH5fErHTBJ7eyj7vBXI+kuSU05rIxc7jhLncq+d5TI3WWNCBTmqR06PswZ2/HYw3HV9Q2Q9I670kQZhxYiqPl9JZ4aO62MsiJwTsCk+zJVvmPuVdi7EgL0NmLvgHfNdJlrAtyt7gDy5uzR8vF5qov2A6swCkWknn0Yqa0HBp1T8xb8O44s62YNAFR6FG9x6jfeAec/QhQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUCEDBtnwqDVDwiaL17GMS+rnWbFLnQk5kXnB8bMGV8=;
 b=cfK/XM5tf15v//lTPxq4WTLGLNn7RUgCOBVOHtjcx+fOh/kDmx1X6VzoJ7uji/Nswc67hUHdGHK21qViaPwH++ZtiQp4l8Vuy33opAaq9yGFTSiqtqJihxwrC0r1GkKA7vvIx2egzWLZT6x+P1GWXoqSxIfbWJ5cCoB8xAKI5WORbA48cKR6Rlm1plxSSHapfFQ/1ussLGEgyHyL5tZCyTdj+cqUQERLNKox7Lg/yIYeFnUqOXnveFKQZjivcQEzuR168gNE9Z9fxCQo+nhIBFJ0Ys8Gg2QVrcPRCfJlKunkQjsq8G4phBT3aRHvY9TTWOZhB9ceRW4rk6+wAsLigw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5471.apcprd06.prod.outlook.com (2603:1096:400:265::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 03:26:14 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:26:14 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 4/4] udmabuf: remove folio unpin list
Date: Mon,  5 Aug 2024 11:25:46 +0800
Message-ID: <20240805032550.3912454-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805032550.3912454-1-link@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffa4ada-1df3-4fc7-5716-08dcb4fe5c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pNpj2guqwhOgAMs7ymw+XbXXP9dJ81NAGdkSdTkot+rS0TW5sgbuPnUP5972?=
 =?us-ascii?Q?jnzQHUE57LI3fpJKPGUzOBvMOq6OquiLhJeC2UYDsKjwX8pvgvii+x4zRsJx?=
 =?us-ascii?Q?h1iFFgvWF69yHCxmT/Ga7Z0zXKYtogvkMx94QEqQ7aeBwous6Wax+RdJ3y/B?=
 =?us-ascii?Q?GbiWqR4akrThNueHVlWU8Vi+2KtbEx3hnznVw2mQcOpl7CW9U1nt08DVQpF1?=
 =?us-ascii?Q?boW0xlreFB6LW9J+0/JxX5+8CSh9AzcMAk9Lz6LlMIRZrYYHhngkrGkHGrYt?=
 =?us-ascii?Q?sDrU8kYMQhX+s3hTWwbM0L5SXZQ7rQGwrEhBglWnkHZU4nruwzfk76p9C4jT?=
 =?us-ascii?Q?t4F87KKpXR2Giva37APi7YKClCi1Ob71TLjQsUEWphDxXStD9K1Qvf8Wx5Q3?=
 =?us-ascii?Q?cd8LDpFnLpHJHA9VRt5SJ/6KDjMbzO13OUWqZ5RYL/6ZxsIbDbwwB4VphtdA?=
 =?us-ascii?Q?ZaXWwGAK0+Qo6lXw4BNFITUieIeZ/dRDyJ+YgBLMY90al8lxb7TJ0EoF+1eM?=
 =?us-ascii?Q?UCyZHMELvjHCAj8KZltCAgG7hq1TLrDJjON98b317OLTBPKc6E9XV2q4sUQr?=
 =?us-ascii?Q?iwFN0+H7KTqKZfoWtXx/N1JfYylWsQPLAuplfDtuLwMX4ggtcRHJm4l5H1Ra?=
 =?us-ascii?Q?gz4vLjRZjP620YHQj3f/PLmFrBiUNKqmvnP1p57kvKMVKIsUHrnoqNOEsTok?=
 =?us-ascii?Q?w4tF/9xVGw3MUCJ+stjC9ffAzvRf60BleE4cNtQHLsx71sJOPU2QqHm8mMCm?=
 =?us-ascii?Q?KD+L1VmS1JMILnrcbKD/OhoWrMvhrcOjAzcmsQtCr3kNOFQojZNLZaaR9kw+?=
 =?us-ascii?Q?dZJqauaxbhbgTymK2AQ/tP+LGEG60Nm71nKulIETKo7cAVfQ9X8e8R2NwhUC?=
 =?us-ascii?Q?QO1yZ59EhNNGwM8jqIXT6On7T23q3zsMwqjdpmetzqht7w4YXt6jwRZMXw7s?=
 =?us-ascii?Q?F7d9787axwSYgx8sQLdaLk6yqIg69/vB5pMcrrdHtCqe5RitUErUZawXQfmX?=
 =?us-ascii?Q?Xxuk/2dMQzvM+r8Fg/ShKtA7bMzZMT1UPEbr3IG12cIBwypjNrPPS9ijfxdP?=
 =?us-ascii?Q?m/4kgYB8VIRe952ia7DkWqzx8RqS8g4LsqhpEOjO7HAZ7oquE0M8LQRPUzDP?=
 =?us-ascii?Q?elytb8iiMBONseVrWKDC+lcyjthjDTr0vj0yQAj1WSP+keiy2dNiDTHzcvzu?=
 =?us-ascii?Q?8fgnaT7Ip7wnD/q9rhVQ5mjYrHw3KEphd8YsneIJyh1zyQja5L1xMpM5oG4F?=
 =?us-ascii?Q?IMMLDymzu9Qpc6zadLhOVxXLudmGNdvyNInCJdIHP25pOvXcFQ3n7jI05FGe?=
 =?us-ascii?Q?4s2AuYKlWVxtxbVucO7mYweLaVaxYLKlkyfyAXVsnptKV3CvNvKYITsu61ZM?=
 =?us-ascii?Q?0OZxQpnnjjYepKbALr1+zRw6E8eE48SBFWkGnsX0HFpKr8cMzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2k4+cDt0zX0ovjcnOokCNhOvEyCoqZbaydpumfZEV3xTrI/WopSD+3g+ulg+?=
 =?us-ascii?Q?t2ng03YnJl0031/BQCKae2gNS8azxDyP0HMGlbiCwbBF5Ku87PvG/RFaMDkt?=
 =?us-ascii?Q?MyPvx/aJULVov7+S9ZzRAysjAcxrh1ZtUA8IaqCZCJhwYxa/agDkYgW6DEGo?=
 =?us-ascii?Q?WzZ8roz2hBtKfsl9TJe36nP7F2NcMY6YvK3veR/DBdx/t9Zb4+zesn4fOh7i?=
 =?us-ascii?Q?R6pjYU36tSqkoou8xVHKKTK+6N7XS7+0BMZDZVwwRjeEk2TfhyilLsGjAjEz?=
 =?us-ascii?Q?V0CAwApEcVzNb6sk2CJs1aciW+rrkRdlxOXu3W/S0vQ3BZLnekVUbxQuNOBj?=
 =?us-ascii?Q?2pGkMSS0eCUfzARuz68Tz6i6yRR38T5ODpqFdAnXMK/fpUb9GMonPz7A5MiR?=
 =?us-ascii?Q?Mgj2yj1RTIgkDzXd8nKTcp33CF5CzjFDsPn8dW4i5KVFpUuCoy2emc2mmvy+?=
 =?us-ascii?Q?THSCt7bDdve0DE/KVgZoT/tEGI7l9EzcAofwe+chyXjtOF/OqRsyw/OTs455?=
 =?us-ascii?Q?Q/PoW62/m8C3sVYFfh/VkRAeFP/iN4RZN6ggYrCQTFwT7IuQa/JwDXfZRAYh?=
 =?us-ascii?Q?o4wlFnfiYSg6yEHu0hMsYrwAvEPsnAvVJyfXExhddxvSfZG6H6nDqrTXTXdu?=
 =?us-ascii?Q?hC2RCfLkldXKuwCzNY/JfPU62luVW6veIkgkJU5M/TvH0T5Lja8IUKFCWTT4?=
 =?us-ascii?Q?89/C6kh7A887/9Ym29VyhWUBNg47mAGTzP8h8rgNWyXpGByqA9uzkQlXYj0C?=
 =?us-ascii?Q?T86/wTUq8EDnZZ39tg/y+FPvtiwLh58rrcx+zYLmZKv5dik2zHjHpnFgbmxq?=
 =?us-ascii?Q?rWOxK6E8pL6NNXDzJt4S5Sz5NrrLB2C31UeNoa809D17jywj3e7omF6cHF9g?=
 =?us-ascii?Q?v2Guv8gT9hVcfjq7gXv/xjuyFH2k1AqsBMWimn4Rd+idkB8sCqBa42zLBof/?=
 =?us-ascii?Q?5Rt6BjOJQTHHqO0iLBvfCHNOa66BqBktn96CTVixYiYio4sbFaqdRlx9JXYS?=
 =?us-ascii?Q?RG1xemqujEk9TJbyk62n8FXCK96qHXdRT0SyJNmQfrUVJrF5xwLcI8m8Of88?=
 =?us-ascii?Q?UN+4aswHpFDMXhzBR40GhzP+LdcYhOVjCyLcIKr9NQUup2edEXynVh0n4JvD?=
 =?us-ascii?Q?HkG9syacNPTDvjzx52KoS+6F3I4k6DCOCrDCL62IMrqzjKQmWu5DQSU8PMXl?=
 =?us-ascii?Q?U2XXvPzaIC10MuHG95OidePK4Y6ITzuXg72JDZlQ3kWbR7Uxl8JyUofE0D3G?=
 =?us-ascii?Q?2p3+uM9sCgKl4NmGmczFGJiOPLssm3b71oacLke4g1Zfxk/IA+SGqVl+TyVi?=
 =?us-ascii?Q?gtqOboPY/T1G3sSUcZ0bAmm/6q9ipgdKuXfe8DmXDp7itjN7IBl4Kggffezw?=
 =?us-ascii?Q?5YQoxLHgOABUGGxtuWcEsn1rtq0wpiYE/5U5XZwrFcrEXNa9g9huV+8Pu72P?=
 =?us-ascii?Q?FvlJd7EeuVOgq7jaYuUylnC/qS3jzJJ5HnfE0ScKw/Z88bcQO0xvsPiADZ2+?=
 =?us-ascii?Q?uggUFjppw4oc77GKDIja56oSjYynEi9mwMf66GcpWUt1hCQNkE4+ghjuy1O+?=
 =?us-ascii?Q?i9TRR8rQC6tP4o4U60voX8YS7trgD5HCD5/ZJmsJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffa4ada-1df3-4fc7-5716-08dcb4fe5c79
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:26:14.7402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTH0Mcmbs7/Gy7mxHbJrUgLLwi2gmhnjGV/qoxf4JC8WMq1m10QLYM+GoWJZC7lH1pT8tQJ1vUhYLZEHBp9wnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5471
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
which is not friendly to the CPU cache, TLB, and so on.

Therefore, this patch removes the relationship between the folio and its
offset in the linear address mapping.

As an alternative, udmabuf both maintain the folio array and page array,
folio array use to unpin, and the page array is used as before to handle
the requirements for the page.

So, udmabuf's folios only save the folio struct, foliocount point
the size of array. pages save page in folios, number offset given by
create list, pagecount point the size of array.

Even if we restore the pages structure, its memory usage should be
smaller than the combined memory usage of offsets(8 bytes in 64bit machine)
and udmabuf_folio structures(24 bytes in 64bit machine).

By doing this, we can accept the overhead of the udmabuf_folio structure
and the performance loss of traversing the list during unpinning.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 167 ++++++++++++++------------------------
 1 file changed, 61 insertions(+), 106 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9737f063b6b3..442ed99d8b33 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -25,17 +25,24 @@ module_param(size_limit_mb, int, 0644);
 MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
 struct udmabuf {
+	/**
+	 * Each page used by udmabuf in the folio. When obtaining a page from a
+	 * folio, it does not necessarily begin from the head page. This is
+	 * determined by the offset of the memfd when udmabuf created.
+	 */
 	pgoff_t pagecount;
+	struct page **pages;
+
+	/**
+	 * Each folio in memfd, when a udmabuf is created, it is pinned to
+	 * ensure that the folio is not moved or reclaimed.
+	 * folio array used to unpin all when releasing.
+	 */
+	pgoff_t foliocount;
 	struct folio **folios;
+
 	struct sg_table *sg;
 	struct miscdevice *device;
-	pgoff_t *offsets;
-	struct list_head unpin_list;
-};
-
-struct udmabuf_folio {
-	struct folio *folio;
-	struct list_head list;
 };
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
@@ -51,9 +58,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 
 	for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma->vm_start;
 	     addr < end; pgoff++, addr += PAGE_SIZE) {
-		struct page *page =
-			folio_page(ubuf->folios[pgoff],
-				   ubuf->offsets[pgoff] >> PAGE_SHIFT);
+		struct page *page = ubuf->pages[pgoff];
 
 		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
 				      vma->vm_page_prot);
@@ -67,22 +72,11 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
 	void *vaddr;
-	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
-
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = folio_page(ubuf->folios[pg],
-				       ubuf->offsets[pg] >> PAGE_SHIFT);
-
-	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kvfree(pages);
+	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -104,30 +98,25 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
-	struct scatterlist *sgl;
-	unsigned int i = 0;
 	int ret;
 
 	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
+					0, ubuf->pagecount << PAGE_SHIFT,
+					GFP_KERNEL);
 	if (ret < 0)
-		goto err_alloc;
-
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
-			     ubuf->offsets[i]);
+		goto err;
 
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)
-		goto err_map;
+		goto err;
 	return sg;
 
-err_map:
+err:
 	sg_free_table(sg);
-err_alloc:
 	kfree(sg);
 	return ERR_PTR(ret);
 }
@@ -153,34 +142,6 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
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
-{
-	struct udmabuf_folio *ubuf_folio;
-
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
-	if (!ubuf_folio)
-		return -ENOMEM;
-
-	ubuf_folio->folio = folio;
-	list_add_tail(&ubuf_folio->list, unpin_list);
-	return 0;
-}
-
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
@@ -189,9 +150,9 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
+	unpin_folios(ubuf->folios, ubuf->foliocount);
 	kvfree(ubuf->folios);
+	kvfree(ubuf->pages);
 	kfree(ubuf);
 }
 
@@ -289,19 +250,18 @@ static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
-	long nr_folios, ret = -EINVAL;
+	pgoff_t pgoff, pgcnt, pglimit, nr_pages;
+	long nr_folios = 0, ret = -EINVAL;
 	struct file *memfd = NULL;
 	struct folio **folios;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
+	u32 i, flags;
 	loff_t end;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
@@ -322,64 +282,58 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets =
-		kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets), GFP_KERNEL);
-	if (!ubuf->offsets) {
+	folios = ubuf->folios;
+
+	ubuf->pages = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
+				     GFP_KERNEL);
+	if (!ubuf->pages) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
-	pgbuf = 0;
-	for (i = 0; i < head->count; i++) {
+	for (i = 0, nr_pages = 0; i < head->count; i++) {
+		u32 j, pg;
+
 		memfd = fget(list[i].memfd);
 		ret = check_memfd_seals(memfd);
 		if (ret < 0)
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-		if (!folios) {
-			ret = -ENOMEM;
-			goto err;
-		}
 
 		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
-		ret = memfd_pin_folios(memfd, list[i].offset, end,
-				       folios, pgcnt, &pgoff);
+		ret = memfd_pin_folios(memfd, list[i].offset, end, folios,
+				       pgcnt, &pgoff);
 		if (ret <= 0) {
-			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
+			ret = ret ?: -EINVAL;
 			goto err;
 		}
 
-		nr_folios = ret;
-		pgoff >>= PAGE_SHIFT;
-		for (j = 0, k = 0; j < pgcnt; j++) {
-			ubuf->folios[pgbuf] = folios[k];
-			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
-
-			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
-				ret = add_to_unpin_list(&ubuf->unpin_list,
-							folios[k]);
-				if (ret < 0) {
-					kfree(folios);
-					goto err;
-				}
-			}
-
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
+		/**
+		 * Iter the pinned folios and record them for later unpin
+		 * when releasing.
+		 * memfd may start from any offset, so we need check it
+		 * carefully at first.
+		 */
+		for (j = 0, pgoff >>= PAGE_SHIFT, pg = 0; j < ret;
+		     ++j, pgoff = 0) {
+			pgoff_t k;
+			struct folio *folio = folios[j];
+
+			for (k = pgoff; k < folio_nr_pages(folio); ++k) {
+				ubuf->pages[nr_pages++] = folio_page(folio, k);
+
+				if (++pg >= pgcnt)
+					goto end;
 			}
 		}
-
-		kvfree(folios);
+end:
+		folios += ret;
+		nr_folios += ret;
 		fput(memfd);
 		memfd = NULL;
 	}
+	ubuf->foliocount = nr_folios;
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
 	ret = export_udmabuf(ubuf, device, flags);
@@ -391,8 +345,9 @@ static long udmabuf_create(struct miscdevice *device,
 err:
 	if (memfd)
 		fput(memfd);
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
+	if (nr_folios)
+		unpin_folios(ubuf->folios, nr_folios);
+	kvfree(ubuf->pages);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
-- 
2.45.2

