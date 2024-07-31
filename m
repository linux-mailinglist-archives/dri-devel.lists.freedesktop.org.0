Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DD9429DA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 11:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400CF10E2CF;
	Wed, 31 Jul 2024 09:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="i4SncwO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2082.outbound.protection.outlook.com [40.107.215.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319810E103
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 09:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RD+I1+ebJ93/Ea0CceJgc3Eyc2Y4D8E6ZfnmxQtJqpiotAwYBcvzwweOo8tyr3lE1tIx24/tqnXE7RIY1amW1MSGEy3ThJ94SkYR61UEu8bYN1yA7/h0eWjmu9NM2EfEviXYCEURb9k5thuy9iohCz3sRbnjEpKMn/xRWfafLUsajKWRWahvOq/B2QuXpoMHjXEqN3CVv+Lm6veuA1k+4GzrrkWybiaAmKaXPnu+wHJ59MAKR/uLz0jEUkSS8Yeyf1d1xeOtdQMj1ceQ1KbhMqf7gClgLKxH3wxfyUIEWzCAsGWz7Ija41eBhDNftdn3ywjFw7DY5E8lvtkrZh69hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh6mMFBK64P5wZb+ppyB0dcKV5TjJKuBEtiJnIYiZwg=;
 b=F2e8sbXoam2w4QSAxEqQw+7WPAibiONsYdsjF2RFlibiuQ/5juoI6l5rO1PHBQSb9ijQ2Gs5fxQlVAXhOFtcs39R0P3HeNZy9859ui3UmqRyRLBclXwlqxkO6cdb0rITU4/1szGV8tSe5SjImVCp09zo93cRn3WxXSCE60xO9HErKlDYFee/AQ2VG4hlaFCOiLv8qPB+TEeHb2Bl+0KpxGEL7XS/yjrnz+aAc+vIVj8dT0XWU7XbVUtvbAIr+zgTeCmxH5shqD1+jEr1ZDJTuIwehouDq+WA1YQyU8zPbgaZ9YjM4nwdY4StslTJgYfnk1jJ5gWjlT3Fwx8tdUVfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh6mMFBK64P5wZb+ppyB0dcKV5TjJKuBEtiJnIYiZwg=;
 b=i4SncwO2w6IeBvbOznB5aociyshFbEhiWlnoLrcNJxTF2pgIL9Kj84z++Fjhq30Eyv62Awu2YfNHlMAxnLalS55AmxPAoXd5rNy0NGAlns5rRWMEHmD0YDYzayXet7+MEix0llOtFBdAsCQsbm0tUc1Yt1on6arBJxLmPvoV4WnYZAuLHjbugiBHQ7IDHFxc3gZw4K5LFytN17c81TKRwmumljOSH+0pQqzczpGHs2hgPUTlXSZmM4ZUjotAwcdwDMYYcTEkmTuGVCvPsVVbRoejgLxTm0Oxkagx8v0DviXvwcKX3ib2SGUI8qM63Tx1O+2g0UvvsYiSuhEljxYs/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB7027.apcprd06.prod.outlook.com (2603:1096:101:1e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Wed, 31 Jul
 2024 09:02:47 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 09:02:47 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 2/2] udmabuf: make udmabuf folios and offsets set more readable
Date: Wed, 31 Jul 2024 17:02:33 +0800
Message-ID: <20240731090233.1343559-2-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731090233.1343559-1-link@vivo.com>
References: <20240731090233.1343559-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c10943a-cf4a-4452-c13e-08dcb13f8c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lHQCp9t2YyrcqD4kPKk49qgMEHLFvgAlxq120pTPBAaczC+NRMnwum/VBJcp?=
 =?us-ascii?Q?M3qXVaJZMn/iMkSpegyF3DAAT/xj7a0Qt3tj4zJN18BQ7wBMY/hBPePedvel?=
 =?us-ascii?Q?LOphFH8xgoDkXHr4iLMK2yz0gRgzTB3qXe2BSdzQXzMBUgcl0ROjp13i+Qz7?=
 =?us-ascii?Q?mKhrYRZULc4qVJBryT6l9HZiqDIKKxVHzsK87TF8AF+Kxzj7/AgmmaDgkRrl?=
 =?us-ascii?Q?j6Lht6p3pYVWxnLZgRLixT+/cR/6l3Dx409lTcfavuSnKsxKPSLNyuqImo/3?=
 =?us-ascii?Q?M5zZPD0tIomXeaN9vshuItiN0o2DH+WRlOoXMuLhRlfbAYTdtqFSX4+etPwu?=
 =?us-ascii?Q?UXMjdQ9BjpH7idWD32z4TLs92gmjkVL6KfuChKQet+Rsaxskb1+Nnw5BTZhg?=
 =?us-ascii?Q?cMrVdv1UQKnz7TOl8GFf2gCZYVjmlpWYUdUXm550vzOm3wEuGqTtNLWGPM+S?=
 =?us-ascii?Q?bfMWXeV2X3lYNKLeRsWsDmfRwstQGiFvPmlpEDcRSL0RcvLWYhSroLFdcPWS?=
 =?us-ascii?Q?64wJNpyzJg5ev36BfSyWuqRnWE57x1ViY+OT2dF0yqWAf98lofNpDF8AbECM?=
 =?us-ascii?Q?s+wuR5ohk3BTEpm7vyc8JC1GAdzNwhKJVdSjMB0qF7NqkCt6CiuyLo+izJsO?=
 =?us-ascii?Q?s5//Qkwsxn2r9voEjpcZiWpqBy/S4fUy1vLqs2jWHBzseaNGNMQptyNT/YzP?=
 =?us-ascii?Q?n4+cIDNZUfe/loc/auKa6Lu1eZ2MsrX86oO0hQls0+0D3rxLAw5VkqF/lkwX?=
 =?us-ascii?Q?2prcHMyvh9f4muatOALg7p/pw6WL9hrHWBBJbSRO+Jic6W2I42xikiJecZuJ?=
 =?us-ascii?Q?E8sBN1vXA2GHH6AijwLqIy7LAeUKtt4mBRjl2XIA1/G4cbhg/hyZ5Eze4f3j?=
 =?us-ascii?Q?XOsOPpBalCv25xnaSHuqiX7ol84vIstlVfDb6URvziwuN/ZR9uxPS9G1XZCh?=
 =?us-ascii?Q?uTxYRjDd/qQ4e0cZPeiGA7OSE/RDaQlwi7aOwWqr5Mi0Oce7Hn2eeMIAdXr5?=
 =?us-ascii?Q?2ptPftjLwuaQ+Eva/Ib/WDGYxMGP6u/Yj+aEna0oxMUs3skuHZx8QLxzakmk?=
 =?us-ascii?Q?6aA7w7KptXysN3ro77bJbvB1k/oQd4S8CuXBGreCDvKIopnPsUlEpzUifagG?=
 =?us-ascii?Q?aUrTqQ3n8XZtylmgjLTqBA7H4K17ps1LsncfttbqG+EqhxT5URmfh0rZVQ1f?=
 =?us-ascii?Q?GsOz7yGe6Cuv8D/gHwLrBj+pL9+UoXZSd5+PMQjRjLfUkJsN4bLX0NNvEoGS?=
 =?us-ascii?Q?3EG6N9mFIzYQlvvHjEdAw5sD06utjijW7Nj4rN2rS60XA0j8/KuuzuRIeBEv?=
 =?us-ascii?Q?AxsvLMGHd2Lv6KiSfvTKIwYT1RQvuNkFLGOi/U8k9isftM/zc6SX8cRL13/I?=
 =?us-ascii?Q?/yZDgMWk3z8Ils4osIFF1tobJtyoTuIkyuatucd0tlBV41z1bQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lQ02AiDFhOE6uoaxFqHPB795rw8PpaESQzi/1bHUxYFkr5dnUBVEkUE7v4eD?=
 =?us-ascii?Q?TIZYMQuNNm9VNhBEzDLOY7u8fFnYyyRg9DjPPvTS8+C6Q+6onF1t5Dy999n9?=
 =?us-ascii?Q?znIri4oKAdo9jTcWzpdEH91updM8BLfcPYeZGXz56UGTunSQj9qit8msAkj6?=
 =?us-ascii?Q?OJMnI8kg3yZN50lUZxQmPHz314v/rBJ+u/bkjmeP0o0+NgyF8zS+PtTSsH4p?=
 =?us-ascii?Q?0rDLFjg2C72zBqdfZGr1WKXLR+CAOxmGZRClMD9hqWb87eLI0c+znHi9hakz?=
 =?us-ascii?Q?lfAGIgxkZ/iCbOXIO5A57iLuqAd/mA1D35T3zgho5jYQ0jNSFm/la2eaVCWw?=
 =?us-ascii?Q?hcqBshz33j+rqqdyeGkHj14oSn0ErIVPvM5qDfLK4/hl8sXra+wxbyCNFzpM?=
 =?us-ascii?Q?zq8FwQcRPoR+3nJAeI/iHxqFvObkU0fVdeRwAHhp6BvDNPMbpYmdiT0k0yH3?=
 =?us-ascii?Q?BUX9aLE9D73Qs7EKm7H/LqoxV9N6fCAoxr6bcoHDmtcwYodX1XwfKZqMmj6s?=
 =?us-ascii?Q?tpMpcRmgCmi7nonUpG4EDRq7Hdfrt8CcJx2E1ttO97yyccyjqbDt1CWUbiAQ?=
 =?us-ascii?Q?Pe6p3AaJgd+iyF3ufOw41vK5nssTWWj3/uoZa4ZXUwK9HUcOmFlp4R14vKvG?=
 =?us-ascii?Q?8by6guogqZQphgGvIOm+Twv0FwwBK2JqjY45RFbbpPPwgZ0n6g4E1Wa4CzF/?=
 =?us-ascii?Q?VWlPE3Y1C44AXPLc5IQ+3d0Ro0qws5DWUe+qDavxS70crQiN0Tbyub/lz8dx?=
 =?us-ascii?Q?tMxOd4MK8d55V9TkOU8L4sx69Bq85DLXOzSWQxzsggF8/NdARiO80qqRmwBw?=
 =?us-ascii?Q?PmhQGgHMzYEC8Dl6yLMxHAnFdDCzCb3hnYfFMQBR3NJesp3J5paN1I1M0TrB?=
 =?us-ascii?Q?U52863CIKcIUaewfoOQrHAiWZTx8e/77isIi2KYQ7XLg7gIxxeATkasvbPJZ?=
 =?us-ascii?Q?i7CQDtI0TkFgiUEx2xvm6auZfeh23X8s9KWj1hxwDxJxRgak+GQcU0XXlpZg?=
 =?us-ascii?Q?FmudWjPSiEhVhPwdGL2LXQZD/LzPInjZxrFarVhJmqcPZAE2njlOCDORN/V/?=
 =?us-ascii?Q?Uk44GLeJT00MJl7Tb/plSewacL6aZJv8l/3NLHYy4jQiTdsy19ZNW7LSEwe5?=
 =?us-ascii?Q?dFMUDDZKyIu7TEIJSTcF4DLCYkk7Zdmr+tjmRChhol/EjSQ7Euhj/ZFKukwG?=
 =?us-ascii?Q?1CyaD+2+wWNAqpYVKqmK4Smk3ntvpmSetzUY19cdCkn+p7NrtXGggk7XoyEH?=
 =?us-ascii?Q?Zql0bcyIvur5qfRL32Q7FQgmQvn7xM/FDEc0/jxioqf7psVoW1xUH1Tr6r7U?=
 =?us-ascii?Q?9f9ihS3JD/Q4zWqIywn2k6ruD7UH0AeoNRXJqeT0dDmoxWL+9cm+P0iPrLm1?=
 =?us-ascii?Q?txS6vNjlkRyqtHGIymXXJY6fz44V2/+mhNncR/xfwH3I1GwqSodpZWz+RE6M?=
 =?us-ascii?Q?J2IBIl98Z/6+/cMf9VhT3O+twnFbBr4qeK2AodjqCU7/9Ha4vxmy7g2ZunQj?=
 =?us-ascii?Q?KKp2bLQVn1zi+vJUG0XGSYlrljHOeVzj03HpIDOevHw6NSqPUhplsvqJ5Ma6?=
 =?us-ascii?Q?zbxFzZwJpjjBc8cJG19eQINbEq/A5eeh90Bt4FcO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c10943a-cf4a-4452-c13e-08dcb13f8c1a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 09:02:47.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqZ8EUSKMSj5uuje2ME9i8oo+xM+JpttON2kqXir4SDtqmRIllSvVNFLpy95XOj9b7WcWy1eQ+MZJTVHQ6kh3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7027
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

The current code for setting folios and offsets is not very readable.

In fact, udmabuf->folios represents the head page of each folio, while
the offset indicates the PAGE_SIZE offset within the folio for the
corresponding pgcnt. And folios only add head page(the folio) into unpin
list.

This patch changes the loop condition to use folios as the outer loop
and sets the subpages of the folio in the inner loop, making it easier
to understand the relationship between unpin and folios/offset.

The loop conditions for j and k are actually only used in the head loop,
so they can be turned into loop variables.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 40 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 6604d91e7072..0285194e6b51 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -301,7 +301,7 @@ static long udmabuf_create(struct miscdevice *device,
 	struct file *memfd = NULL;
 	struct folio **folios;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
+	u32 i, flags;
 	loff_t end;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -338,6 +338,7 @@ static long udmabuf_create(struct miscdevice *device,
 
 	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
+		u32 j, k;
 		memfd = fget(list[i].memfd);
 		ret = check_memfd_seals(memfd);
 		if (ret < 0)
@@ -360,26 +361,27 @@ static long udmabuf_create(struct miscdevice *device,
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
+		/**
+		 * Iter each folios we got from pin, add each folio into unpin
+		 * list and setup each folio and page offset into folio into
+		 * corrent page count position.
+		 * So that we can iter any offset in size and get correctly
+		 * page.
+		 */
+		for (j = 0, pgoff >>= PAGE_SHIFT, nr_folios = ret;
+		     j < nr_folios; ++j, pgoff = 0) {
+			long nr_pages;
+
+			ret = add_to_unpin_list(&ubuf->unpin_list, folios[j]);
+			if (ret < 0) {
+				kfree(folios);
+				goto err;
 			}
 
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
+			for (k = 0, nr_pages = folio_nr_pages(folios[j]);
+			     k < nr_pages; ++k, ++pgoff, ++pgbuf) {
+				ubuf->folios[pgbuf] = folios[j];
+				ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
 			}
 		}
 
-- 
2.45.2

