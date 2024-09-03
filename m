Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE99969771
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D23C10E3EE;
	Tue,  3 Sep 2024 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="L+6DvRb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2077.outbound.protection.outlook.com [40.107.255.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976C10E3EE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hs9X7PKuvHf9ZZL82gR8/motsl/pEQZqjgmlVSuBYDUgiartOX/AK68st9zMB5YTWgsJ18GJeIXDxmAhqaZzNuyRlDTpGaNCgJCPMiCcDx7Jxua+/8GYQDATne6mGHUG1E/WzoBryuieUhp2cLvTDSBPUTAMNvctj4NJwa/eGvNHOcdvO4E0H54N3jWxIjMRyaxXKO44UiAQA+7aaQJzrOhjTlK0VwfFqDBW2sPEh9tsg30iRx4PvhAjSdxr+2obxM4mbXZSvgG+bh+3we9n/lvw/GLrKZS8hezhBoY7qAlcd8TK8ZTBlCmdejlKqG79JL1xI4cwAdhwYOsXIpLpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+oBILXlrKLI4yMdKcQ0YyodD+3vURTgtAhI0Rs4j0o=;
 b=ev5wzGGusGRvotVWNDaiVs6HhoqJo+dl2et1tEn7vLPw7gzuxlXRE9esM+h380xxygfVfkFxRpp/ZleldyL8A1fmR94jyuCpUcRHgjqSXmsXEjYssm9gTJWG+KfSIPD0I23DoKCOdUR/9tLjEo3jkZ6rMXNCT/HVLq3SxspaQyAYWpOsC5tLSy0dJWlB7yNdVKm6rGSX1CCnHnEu8tzOXwRsoLNzgcrZgIEK0AGM58F4DdNW/tQKODPVyjlOy9o4i1zprtLkhRTzJUFUx/0P59Ypg92W88bRw8OLuyMrMwvkB/3xx+DOOpKSOln3YCAdIELFNYwpAVqF8Kv7tOtp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+oBILXlrKLI4yMdKcQ0YyodD+3vURTgtAhI0Rs4j0o=;
 b=L+6DvRb06GusiyIcGc5cHYfeor1DraKrFKeoZuF1kb8RTLiInupZyzyQhhMTy8AWBK20w5oHwdx4RMN6rlwtqz5k7PLRAGYXmVWfLdban4422ZH0G/VC7Gfcr2cmMe1nPQNMzq4ChbhiZSt51htSZmYCt5+skAGTe+g+OEtIR1WbHGn3sJ7g9KF8bci6Z142b/EYJXPw1CYjlIB4O7xk4bUDJvdTmWPbzWFCadGBze09tWSmAnA/oBj0ZLnZsASIqMfGhQe6g5EDtDtf6idjzVP7rUULxbHVu4TgLaq6Ar/kx6E8NjJbd5vkl/f/oKjP4G7U6jgN/kz67GfZljIIzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:47 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:47 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Date: Tue,  3 Sep 2024 16:38:09 +0800
Message-ID: <20240903083818.3071759-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903083818.3071759-1-link@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: d374601e-6c5a-4a0b-d6bb-08dccbf43f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cn58EvbnXD7D23BVX5TVfF70tWvvXlkh/DWCPJ/vhwosnG3WHZSxvFi+qsxX?=
 =?us-ascii?Q?vMvg9J+UGDE1uP4XLA6cawFa85A4eqzHORHbR/heqolYh9EtcG5rXEKkq9OK?=
 =?us-ascii?Q?olFgXqgQQpfxHCXHB53yDxfPX/ws21y6n2gXbHV0o4cxlPniWdqiXHxZDCAu?=
 =?us-ascii?Q?tkIiWC2WBvt3YeDZVA8jgRNfR2LsFuk5lmumuSHemMnGoARVLDuflbjXWCak?=
 =?us-ascii?Q?QmszS21JdjoFk9CNjKGQ8sM/zwYGTTo6aY9cuF3BQrjpz0fAaFJrAo7gh7Uj?=
 =?us-ascii?Q?3rFjFEKEAxb5F/fjUIxuC/Ru5gaTKyWlOD9YZq0vBPFmSsOyt72WNLroq6jp?=
 =?us-ascii?Q?LvBZK5OUZYx4iS+yQc1Wre+1Swhagd2356o61yAytevSaMUYtIiQP9/iOm0G?=
 =?us-ascii?Q?UTZD+NIX6y4ltNNx2rgMsb06HKiyDcPAvRTjxyBWOVRHBwMRRBYBKCgOef/8?=
 =?us-ascii?Q?rPKq/FsBPkvRqdc6Agk/+GhmoDlTT0KJ25T+SHULMfzAz/GVVSIPl7F3vejH?=
 =?us-ascii?Q?iPLqSJco+8CA+6wR++b1q2WCcoW4JM+kVW1l9cNwcYnIF98VzsJvnxZ47HFL?=
 =?us-ascii?Q?XXqz2zdQK+stT6Y29Cw0ZijXv6x5DPDFX4AE6gff/ksL/JXb8/q+CzHvCLc3?=
 =?us-ascii?Q?+um84IslAcma17SNNNBQtgm3x3evVNbXzWNX1mH+sD+b+vWcyU4bC5+VFsy3?=
 =?us-ascii?Q?flyOwAaLDH2H+97qjrxN6PNCjp7awJtnTOGUzDC1zxkpRSbAetaUvsNJbrA6?=
 =?us-ascii?Q?jfXqcOqMX1pJScedj5emcjsESDeb98wGLVuyvqBuxmQ1oJS/LmJ/MGFiAI0e?=
 =?us-ascii?Q?jhr85wcNhByxSAsM1aIM4OJCvDVPhwH+Gxxy7+qVZsifqDrr8IqhfMBSPdne?=
 =?us-ascii?Q?vIk1huzj9MYiAbWFTw5HI4Fv3nVdqzdV36Bkyti59lEtX901okK6QcIfmdaR?=
 =?us-ascii?Q?qi3z1OBlg5crZYD1G++IN+Ei+bVhkb4juNZZjermtJzwbXJeD4HNn36PxPlc?=
 =?us-ascii?Q?qxkRwsU6DUimJtzbn45zEEcUrr/aXla1CUHm880k9DXDNCwyedbff2eP/Vgo?=
 =?us-ascii?Q?0DkDp7zPZqO9yCY3eSK2Z56Uwa+dQmzVO6ru+iVnlv0BQtRh0cpTzfHwvRGS?=
 =?us-ascii?Q?/7BRqh/qdQTtOIg8yYibpQG3QBvmx0F/m9PGOlzXY67Hzn51qYp11fpf30O2?=
 =?us-ascii?Q?/KZGoNdQKUHM6GIN054epGHtaWBndtSw39fySwhl4C/A1CiBL9OfJAd3thd/?=
 =?us-ascii?Q?srOwhwuTUGD85jGqpORp4cyJd2hnT7f1m0DdLtyWVIfe0s2aEmq5e+93TxK3?=
 =?us-ascii?Q?ZNu871SouH/bOB+zU22znO7CPXlhKkv2iIUKjm8THghWqaPnMLxbYP0qMBdf?=
 =?us-ascii?Q?u4vrx1oCWDCTKtV2pjJxNu4JLLhLGEUwKpT/7g54uSwQLVbR7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t6YMiXkMOmMBZmpuu/NJYN+C/GzDLZi7+8brNDT4xOh3peDg57RnWhUOCfmz?=
 =?us-ascii?Q?LxtMsK6UH+3MNeVwgBiUSOpLPmN4A7YhYUGAg0+tZfraDaxu/k9ybt6KsFaN?=
 =?us-ascii?Q?qmYMP53A5ZIwwPQPPhyoUwJjORWVYu4sEtAXH4y70hs3ZFFTQ/tKO9E096R+?=
 =?us-ascii?Q?X0YBHj/Oim8080323J+F7UV80Q7PSnv1AhYChWFuAZ+I1M2boiaaB0+RSoEw?=
 =?us-ascii?Q?vcOGIzqNi1FMapIPxuJb7XpKGwZU/6jhTJ96F8jAEyPN+W5czD8AUGq2tCUG?=
 =?us-ascii?Q?I1YcIWaIWugyLAgRHe0qdil5ns7rQdIhKYKA07RUGV1n2pEr1cdQL7xy+JAc?=
 =?us-ascii?Q?YJ0Ssh0zGD+CDoc4FcXzVqc3jIeSqKxF7RRMXPRDw7DwuFEAIOFaGTDitJac?=
 =?us-ascii?Q?FpR6CTT18PYn7poCb74eoyVkw1CgxgzpkOip5FxWbWlLm0+3bGNNhhK4uA2R?=
 =?us-ascii?Q?XjBkG+ZzlgqCjlMq/xrebhSr4ZNuyQgimrEfnlm6CT4jeU6lxepQV5vsv7e/?=
 =?us-ascii?Q?A6x3XhkHyOIrUtbFwT29JlAiuasWms/qTmrhFR7Q6yxpjFwaP2sGwjDL62oy?=
 =?us-ascii?Q?IByUeaSrypf3JRpZhi9bm2oB/ACeuHf1XKREJwjwc5ydKM3tPEvXQTmoaLLl?=
 =?us-ascii?Q?r6A4X1NqoWKBUkDBnedYObHbgN1zRuteOzpVp//tT+WRd5vArV0jWBznnbhk?=
 =?us-ascii?Q?/vf7KvCpCccBQZh+p5+cYlvGo+fyYudsTrkFN46810UJ9UeBkjDKLPaOw6lm?=
 =?us-ascii?Q?DB6Tsa6Tw+bpqvyhQiReZIgYVAttcqoh6OKUJO4zGFYuM0UUOmdRl6brXuGI?=
 =?us-ascii?Q?EwQfBq7zcf4hserP/LBiUZy+kvUX8BAIJGRRYPd/x/VaFB0EOw7arRioYLzx?=
 =?us-ascii?Q?OesimEH2F38z1arYl4+ldourF5gekoaQPkloRdUh1PYyRZO0kOMqBj34vWrO?=
 =?us-ascii?Q?JWbZdubwunsnyLSjntX1cc7xQGMOXk5rd28z59sDD69/JW42SHy4MK8ltuzu?=
 =?us-ascii?Q?myD4+wMgXW3SGir9dBpgld33qs3mIOmMDYt6UCfqgEMbQQBLKzQKaul/0Viw?=
 =?us-ascii?Q?InG301TyPVChJ+FqJgvY4WVOT8KlrX4OpkGHeC2kaJ+liCCtfGyxJOpnGMt2?=
 =?us-ascii?Q?trK/7eRat4ilfKzMgX7PTSueBV8FqniRzchfgbHp8Z1fmk/4ZzsG9STJ2Pji?=
 =?us-ascii?Q?mBgHTWJARVCIYKxffTERq+CiIkx2ryQbqJXlxPTP/+GQs4n9+FNK/dvZ0Z3o?=
 =?us-ascii?Q?Yw6fO8R4ccUpjG6kDpDYlm3LJSeqco3jsekdiV7FKHGpls27NAEpHJnn2y14?=
 =?us-ascii?Q?mi/RvynCQWg4vpXDR9QlUv8Nselk1YnxsUGIURrzmRXNBI2bJepR21qTztMd?=
 =?us-ascii?Q?MxATe8b55d+0HkqojDTUOn41WgdtobBxGSG2ztNTqiAHVx7EFqiv61fmHU7G?=
 =?us-ascii?Q?ZHXCPajVUcGvsqEvZz3BwHY/NNXo7ho1I0OYAKjB70H1nQmsrFQexGvQYm+Q?=
 =?us-ascii?Q?rai/pLun73nGsmkHoQb239WxTHEQ8Z0uGLM6WrFGOxjR0V8G9mzQfYYeRzTD?=
 =?us-ascii?Q?IJudMNGsNBJuHiALttc0xBxUtZkgaE32hEThOYuj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d374601e-6c5a-4a0b-d6bb-08dccbf43f07
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:47.0985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiPQwDpkf/K2qTB9u+CyNdTpjQ/9zNRUfcMFzqHjHaxfgL3UjhyuCscft1ncgzu6lb0jTS6+vsS4rgRC6IqxLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5359
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

This patch split pin folios into single function: udmabuf_pin_folios.

When record folio and offset into udmabuf_folio and offsets, the outer
loop of this patch iterates through folios, while the inner loop correctly
sets the folio and corresponding offset into the udmabuf starting from
the offset. if reach to pgcnt or nr_folios, end of loop.

By this, more readable.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 132 ++++++++++++++++++++------------------
 1 file changed, 71 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 456db58446e1..ca2b21c5c57f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -330,17 +330,67 @@ static int export_udmabuf(struct udmabuf *ubuf,
 	return dma_buf_fd(buf, flags);
 }
 
+static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
+			      loff_t start, loff_t size)
+{
+	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
+	u32 cur_folio, cur_pgcnt;
+	struct folio **folios = NULL;
+	long nr_folios;
+	loff_t end;
+	int ret = 0;
+
+	pgcnt = size >> PAGE_SHIFT;
+	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+	if (!folios)
+		return -ENOMEM;
+
+	end = start + (pgcnt << PAGE_SHIFT) - 1;
+	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt, &pgoff);
+	if (nr_folios <= 0) {
+		ret = nr_folios ? nr_folios : -EINVAL;
+		goto err;
+	}
+
+	cur_pgcnt = 0;
+	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
+		pgoff_t subpgoff = pgoff;
+		size_t fsize = folio_size(folios[cur_folio]);
+
+		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
+		if (ret < 0)
+			goto err;
+
+		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
+			ubuf->folios[upgcnt] = folios[cur_folio];
+			ubuf->offsets[upgcnt] = subpgoff;
+			++upgcnt;
+
+			if (++cur_pgcnt >= pgcnt)
+				goto end;
+		}
+
+		/**
+		 * The term range may start with offset, so the first folio
+		 * need take care of it. And the remain folio start from 0.
+		 */
+		pgoff = 0;
+	}
+end:
+err:
+	ubuf->pagecount = upgcnt;
+	kvfree(folios);
+	return ret;
+}
+
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
-	long nr_folios, ret = -EINVAL;
-	struct file *memfd = NULL;
-	struct folio **folios;
+	pgoff_t pgcnt = 0, pglimit;
+	long ret = -EINVAL;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
-	loff_t end;
+	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
@@ -349,81 +399,43 @@ static long udmabuf_create(struct miscdevice *device,
 	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
-		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
+		if (!PAGE_ALIGNED(list[i].offset))
 			goto err;
-		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
+		if (!PAGE_ALIGNED(list[i].size))
 			goto err;
-		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
-		if (ubuf->pagecount > pglimit)
+
+		pgcnt += list[i].size >> PAGE_SHIFT;
+		if (pgcnt > pglimit)
 			goto err;
 	}
 
-	if (!ubuf->pagecount)
+	if (!pgcnt)
 		goto err;
 
-	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				      GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				 GFP_KERNEL);
+
+	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
-	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
-		memfd = fget(list[i].memfd);
+		struct file *memfd = fget(list[i].memfd);
+
 		ret = check_memfd_seals(memfd);
 		if (ret < 0)
 			goto err;
 
-		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-		if (!folios) {
-			ret = -ENOMEM;
-			goto err;
-		}
-
-		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
-		ret = memfd_pin_folios(memfd, list[i].offset, end,
-				       folios, pgcnt, &pgoff);
-		if (ret <= 0) {
-			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
-			goto err;
-		}
-
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
-			}
-		}
-
-		kvfree(folios);
+		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
+					 list[i].size);
 		fput(memfd);
-		memfd = NULL;
+		if (ret)
+			goto err;
 	}
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
@@ -434,8 +446,6 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	if (memfd)
-		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
-- 
2.45.2

