Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246497B6EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C777A10E51E;
	Wed, 18 Sep 2024 02:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Qd24zVKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2081.outbound.protection.outlook.com [40.107.117.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67E110E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waNQLEole6aiZtTYWKuwj+nCsNRLynhmEd0yj8AAeWFlfsvADAYz9HFgfHemZ9xUiU65yW5sYdvzYDxvN2lMiIA/W/sJ+cDKzvHVHrykuQe+2h7i2rSBt4cnMOBZwGJd88dIGlgyert4dxpwaNQrRCvrXO/al6WO7BSEfBDEo+oVCaG24IpHx5fCpMOeQA1PuCyYWPWBWr9DzlU17hxLSd0/ypVaqzuxzCKZGOGwH2O6np/3MZvqkFR5JzM7CbGJKK25ycYsFMa5pP2IVYk3PXl28gSZDkU5jW5xv4IBleF4fYKLbjx5ZQL1GRbzUlmBYyGGX4RxFI1IhTKhPEq6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpZaqFy3+zW1czl3YqV+mpwLQ0s0TQhAq/biiZ5XOno=;
 b=hAF9fZK3ba08U9EHgdqz2zYa3TugaNXhLWniFJibrwXpF17gIREiXLZ/KVkRtkATLpJZbFfvrbL5cAJ13I/ZT3TMNezaBMClBXsTCOYfNPjJ1YQJwm+3Zvjwif9C6glsf4WF0MRIhep14nkKUGH3BYsO1M25J5ld43MJLycnXXKdBmFLwqT/kIDF6iDnadhNJyUaW94XgkHA5tsqnMUofeyV/9LvWKFQGEpauGYad8MWLU/vZOD8hAXDyG5tLaP51mA7Sbo3RsLp6d4yFFVnzTfZ4ecOeXZ2z8p1zSjXumsJ5QTKyVRyYaw5ZtJjfRUCs+N2eXdTJMV/il0l/GUXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpZaqFy3+zW1czl3YqV+mpwLQ0s0TQhAq/biiZ5XOno=;
 b=Qd24zVKBpjBoG+WoM9qAvpKsvQ4BbYk6W+hdYJWsRKVN1JvFSBYbyM1Wu+/+4bhYxo355AKtjuk1ZvojXlmDc5Pgf+XxO1ZydMcSRd4yMSghrdr0Sj7Xq8ZGIBRvAg7I5YvOj5na7ddnXWZeqkZHDLM9eQgMiG7FUrceM7tNNsbSmWqVlNxnSHcE8qQjBZVIL8hjr35XL2saEJzNZltLN0pgtGOfH7yd8k46EbkbGjDF4U0qD6YB9mPOiDhxaaVoN3dARBNGWhEdcV0o+CcjyOc91lcPEyc6OaGfYpzII5w7bTPom4RBi9XT58hceqoq3CnsGc8xzEEBYeDmr59kiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:53:07 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:53:07 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 6/7] udmabuf: remove udmabuf_folio
Date: Wed, 18 Sep 2024 10:52:29 +0800
Message-ID: <20240918025238.2957823-7-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ac98169-343c-47c1-d939-08dcd78d062e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WYv4eiTzpz2iCHoUYjAaXySZS26cDgW9ugvRxu326R3Ewo9pNXcNE1sNY+VJ?=
 =?us-ascii?Q?l8E4a9ShGg8bdJhaIQzGt0x8ZRwWz523dwwmqMQ+IefYFLyr2yHIzOJg8LXG?=
 =?us-ascii?Q?VpgKk89koaCBVGkptIl5D9pHQsYDe0pzPhxO3aQ+B00pYTPCRgjHK+aMbL+4?=
 =?us-ascii?Q?y1Kn8h01fvUVwVNNrQ94iXdeLGcFSBl8DPgIkWpweud2o6fca9xnSuMWFskH?=
 =?us-ascii?Q?dGcFJ3LvtaQ7QIw3IGl724Jlg/vWrLpkXGRpXjOv3KLIc3l7ikVXiqjw5QXZ?=
 =?us-ascii?Q?UCYQ64BUReiUJgQXby3a6mv4aiEGdQ7otAPcZPg6/G33mf1g/FhgKJG/e1Cv?=
 =?us-ascii?Q?1morm+JdhYV8IaqRadIlqmXI4PezX3gnaBsLfXpO02IjNfQKFRP1hd6EYJO8?=
 =?us-ascii?Q?pJiLb4UAczJ+IFj/M89LZHN+pNiYhmBJMCx1tzmV8TmLtviLu1v8ain0MP8t?=
 =?us-ascii?Q?uo1C0l3ffsSkfQNL57mOuyw/A/k7XX1t2QzXVh2ds+zqzxVXVPXWFay5hm3b?=
 =?us-ascii?Q?ggUIrmaNGAKDlSrCO2gXOTD0mhhQeIFgZN4d37YA47atPftw4h5hSdd2jqTW?=
 =?us-ascii?Q?5qnBlKA3hil7A/t4vceway+/l/5pClwVUXMnOsYRon7foJbBt06ztyU8TPSH?=
 =?us-ascii?Q?mNDaAoVcIFDnTkmXkgOL23J0NJ/XIIpAaIFwHEvU15MPL2VGTStlSPK59oDi?=
 =?us-ascii?Q?dPZL80W0EU96eJWh1vskr+v2fTeETcMACrsrkl4l67s0eBvjoAoYxGEPl4GA?=
 =?us-ascii?Q?sP1W0MA3sfYeCIzPOwHP2NPAy9jXnxqHbt1VcQE987b+oshCadqKWe9bFlFu?=
 =?us-ascii?Q?HwgVi5T7NSPncoxFGtmTJifQp3W77pTMNYo8qNQ7l7zJ9QHtSpqZWRdVowVP?=
 =?us-ascii?Q?2STlGgKfs/T2MgxMSinO1cKt1+MWYeIOepr7uDCyR21BU8jEuBvo6+ra7QlI?=
 =?us-ascii?Q?gjUU5cEG2AhSDcEJoEkM5qud2BIAHJj+TEawhD//9fzMW6MYHEiJLzwnMXO7?=
 =?us-ascii?Q?I920hHMEv4wlwd4w8ArmuTSxLIor3JgnfOFiRWiqSDgX26Z5Gk9Fkp2MECjS?=
 =?us-ascii?Q?B9yMcVFCu+ARMsbIG6CheeTy+3mhtjlf7gATPMhjQ8oW3+jVkCxUH1HCI+T8?=
 =?us-ascii?Q?7IRmUbg/Q9rzldjcY92TJgQCC8QKQ6Oo/rQ5j3+Qrl+EDOzYp6FiN3+SwWI8?=
 =?us-ascii?Q?viLZwx/W5SRuk8X5yguGqoi7ipQreOXmW6+iPeViMPR7aXurbVNiZYVYZHSb?=
 =?us-ascii?Q?coK3QbIXC8Bn67/l20DK3s2swZYoKrxmJNVGtPpvza3MtV7j2qtvQAwC+Am6?=
 =?us-ascii?Q?wfrVDGAo90syD2+br0rWzJdSPBFfKncrg+BTbtzbJUy45t7j3TZ46DTmzNVx?=
 =?us-ascii?Q?NYZJg1nCf7KNQfZksOH7Ah08tV2cReFq7VdugolijQlKqtHxVa2QSRFLiaya?=
 =?us-ascii?Q?xi/zdA3cWkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AVY76DOZvdeHT7q5FRsq7j/YMfBWIUNhwavmmlEKIpae4MVNrygdgRFfpwMf?=
 =?us-ascii?Q?S2ovu786I5Teozib88XG2wM+bUWvAa4pjhMyzHH7UfvuVlNsSehwvDbHcmkY?=
 =?us-ascii?Q?mB6JKqk7TXeaJuQ7ARGb3BEK4LSPIcyE/6l9QT0ay0EAXxe3S7H3m5hgApfQ?=
 =?us-ascii?Q?I21wLO1z+vbs5WCgDW3/B+8PArn68SuX/jtT6ZziWLUuk9WB2eFeD/pE9+NA?=
 =?us-ascii?Q?7nagA7deEA30Jo2dTMZCg0yjrif7TrnUF+okg5fWHV2AJVe2fokqfjoXRnr8?=
 =?us-ascii?Q?ulI46+AkwEV7nFaxZztyrApWoOcW++T2RQt7IHWuCtI11ymCQBd+zWkp8PVZ?=
 =?us-ascii?Q?pyAxHRwTY7WaFTzLeRisnddGEuob9h2p4fww5xAQTnHcpi4VhlghjvxF/6gG?=
 =?us-ascii?Q?R1T5zJTQwf3kULRVf9xyHeM/l7dCn6Z6gX/BYd4tvPb/4Ys5Z+aGoJfn3LBA?=
 =?us-ascii?Q?1DW7VQif9ZYsv5PChhySsQJkdxO04Y7ITrxI2kDpaCqFyaDlqjBf9RjNXq+7?=
 =?us-ascii?Q?U3NP7FBbFBQ695gQhy2zkOHbMCGy4M6lwIbcWMfYaSP6WyJ32C5tvzuquOMm?=
 =?us-ascii?Q?YGH/j5rOTtWmoOFl9jm/6IoH/95s9v2ou795/nl588o11C52WnBdTMZTVF/5?=
 =?us-ascii?Q?4v0kSOcuwWOTjeqauhx+E1EqZv19SkxJHJZfrQzrY9KWB5STR8Z8jQSryWuc?=
 =?us-ascii?Q?rLVkKgypBGzoFo4J2D9E96HWf1HNtaS2PellN7KTE+BS8/B2bXG41lzVsChU?=
 =?us-ascii?Q?j2PR/RDcAFZuCG/0ipQ31rYKG9s0JQI7paobc2w6GgD1GC6G1ypjNMx7u05y?=
 =?us-ascii?Q?zFCZYbumly3WHlmslvn7CYaIQ89U9YJ94nB+CAivRDhkpoR+MgWwOqXW5Zu4?=
 =?us-ascii?Q?MrpqFkKdOLJTtDHL5DQY2zt7nYF9H0RVcrZxnyAj7D2AuA9vM/r9QObSTQiZ?=
 =?us-ascii?Q?cnMdIgW+qMsFLsvvdGXK1KmUTc2CCpC6ZB51+4kxlrpqVQbSndrVkL80mrof?=
 =?us-ascii?Q?m4QOxhRU3i8oAwVfTcpWKI67LnefeD7qGtlMFwoWtFWEt9W+5deDIaJUDeZ2?=
 =?us-ascii?Q?QeHQMt2cwzVv926Hxmij6yFyOdPi8ZHBhFlwEX2Juam3VUkumwV8e2vH61Vc?=
 =?us-ascii?Q?gDz+dm7nB6g04W48YQx00Jlpieb1Tdg9Eh1lMxiet0YLEZm+Mwyl3NVhVgDs?=
 =?us-ascii?Q?1K/UI3eqD0z8fGJLKGfe186hoFwl4qf4Rfbx/YoucWkZ7iD8aXwKB41CToes?=
 =?us-ascii?Q?I9W9OJMy0TG2l0O001EH8BLAnWBXHIx79aVW4iZd4MklLHXRYcc4J0big4eW?=
 =?us-ascii?Q?9BbFUoQNi7y2fZ27BlO5hPXOn7ysBi11WlbLZst45amlixmcz5jVQNajzrcV?=
 =?us-ascii?Q?Hl8AUCy0M24K+7tIgBeIf1EpEvCCsEYDzRFIqTwOC9Dy9KFrINeuAU/U5G01?=
 =?us-ascii?Q?QLaQkYd7hascqOsyJ6rZa0B8Hr4UpPS9lZVQkCJTDice6ST5Be3X9jPlWD99?=
 =?us-ascii?Q?jSOVrFOAdHaNtRZLmk+JBhA0Ni21eLiU+t5eJrJdfYM6UG50jf6BqlXEFknf?=
 =?us-ascii?Q?q3WSngzQo7zm75yui8l9+I3hIrfqXa/pNdVN4Dpp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac98169-343c-47c1-d939-08dcd78d062e
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:53:07.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G63Hd6VY0fcgzqz5Uaj/a7OoUi7TlhDFAhbf8BkMo1Bn4TuGuSlY3oP7B5FAnHeDBu8lbsECdJnmLlfUU8+lIQ==
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

Currently, udmabuf handles folio by create an unpin list to record
each folio obtained from the list and unpinning them when released. To
maintain this, many struct have been established.

However, maintain this requires a significant amount of memory and
iter the list is a substantial overhead, which is not friendly to the
CPU cache.

When create, we arranged the folio array in the order of pin and set
the offset according to pgcnt. So, if record each pinned folio when
create, then can easy unpin it. Compare to use list to record it,
an array also can do this.

Hence, this patch setup a pinned_folios array(size is the pgcnt) to
instead of udmabuf_folio struct, it record each folio which pinned when
invoke memfd_pin_folios, then unpin folio by iter pinned_folios.

Note that, since a folio may be pinned multiple times, each folio can be
added to pinned_folios multiple times, depend on how many times the
folio has been pinned when create.

Compare to udmabuf_folio(24 byte size), a folio pointer is 8 byte, if no
large folio - each folio is PAGE_SIZE - and need to unpin when release.
So need to record each folio, by this patch, each folio can save 16 byte.

But if large folio used, depend on the large folio's number, the
pinned_folios array may take more memory, but it still can makes unpin
access more cache-friendly.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 40ebff2c77f4..24badfefa6b4 100644
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
@@ -196,38 +202,18 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
-static void unpin_all_folios(struct list_head *unpin_list)
+static void unpin_all_folios(struct udmabuf *ubuf)
 {
-	struct udmabuf_folio *ubuf_folio;
+	pgoff_t i;
 
-	while (!list_empty(unpin_list)) {
-		ubuf_folio = list_first_entry(unpin_list,
-					      struct udmabuf_folio, list);
-		unpin_folio(ubuf_folio->folio);
+	for (i = 0; i < ubuf->nr_pinned; ++i)
+		unpin_folio(ubuf->pinned_folios[i]);
 
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
+	kvfree(ubuf->pinned_folios);
 }
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	INIT_LIST_HEAD(&ubuf->unpin_list);
-
 	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
 	if (!ubuf->folios)
 		return -ENOMEM;
@@ -236,12 +222,18 @@ static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 	if (!ubuf->offsets)
 		return -ENOMEM;
 
+	ubuf->pinned_folios = kvmalloc_array(pgcnt,
+					     sizeof(*ubuf->pinned_folios),
+					     GFP_KERNEL);
+	if (!ubuf->pinned_folios)
+		return -ENOMEM;
+
 	return 0;
 }
 
 static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
 {
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 }
@@ -348,9 +340,11 @@ static int export_udmabuf(struct udmabuf *ubuf,
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 			       loff_t start, loff_t size)
 {
-	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
+	pgoff_t nr_pinned = ubuf->nr_pinned;
+	pgoff_t upgcnt = ubuf->pagecount;
 	struct folio **folios = NULL;
 	u32 cur_folio, cur_pgcnt;
+	pgoff_t pgoff, pgcnt;
 	long nr_folios;
 	long ret = 0;
 	loff_t end;
@@ -372,9 +366,7 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 		pgoff_t subpgoff = pgoff;
 		size_t fsize = folio_size(folios[cur_folio]);
 
-		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
-		if (ret < 0)
-			goto end;
+		ubuf->pinned_folios[nr_pinned++] = folios[cur_folio];
 
 		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
 			ubuf->folios[upgcnt] = folios[cur_folio];
@@ -395,6 +387,7 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 	}
 end:
 	ubuf->pagecount = upgcnt;
+	ubuf->nr_pinned = nr_pinned;
 	kvfree(folios);
 	return ret;
 }
-- 
2.45.2

