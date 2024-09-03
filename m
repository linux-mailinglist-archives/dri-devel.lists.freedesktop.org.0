Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75850969774
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9D10E437;
	Tue,  3 Sep 2024 08:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gBrldKQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2048.outbound.protection.outlook.com [40.107.255.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0310E436
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjrzoBmjhL8lpT1oYnHLmwoiP6KVNdS54hJA2aBZuEWOAGnJ82Xo0J94jyWkFWH9lJQfevy3Pc0TBQGNsbaG0hSb01gLOAgWvp7JJedE9iwAtymZRgk/ELqcK/XkPIm4vjEgHfOO8GjTvMhKTF3NzcI3yI/sJEJHnwUWrxcIeHeqfCxh/1qQt8wwEnASkv2TxAOba+lqnqv5XbHgTY+ZKCiQGQtfk2hj8ctSOUiF1FyeVEcygW4dptJWUEm4qHUuPl40anOtT66K07dGZdMuAZleDT2FV6J9b9QkqgQPskPbLyJs2kZB5LYpF8tMqit/wB5dYXmnj0JqBe/CKxixqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO19NvW2yqwHS9ErLNNIkL0bAv+E9vx+kkHbMqAsKoc=;
 b=RvurjIzPAWKNApuZkF+y1rnaq8cm0Q6pHwg2mTAVLd4tCZ8NM3zeKTvaw/WHj4NnriMEwvfvS7AWdW9zaYHEX61U2mAUdrMCqO35SYJb/hNnvzZ+Vn5NaYKXqMQ5/t161ekBTYziSJck8ywdiHk2DeycltAN2tJZAe2B4RMISveesUFLDdZQwX/oOIvxRsUmrWEu3EVhxjYMeDUpUX0DfZD14ls0cE7pVfg2X0ndt9+j7xeBW80XVV+GDNsIi18wzYQsXtzdHD30+7oDn0hIontd+CnKvmldP5ipfwiPGS8/iuXCirkPQ7aUoS91vMbvPqd7gLTSjo1wvFty4yN29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO19NvW2yqwHS9ErLNNIkL0bAv+E9vx+kkHbMqAsKoc=;
 b=gBrldKQ4tOnFXvjooYnCQQmsqyeD85qnWKYvTzBWjrOXTM3dbMIoB7yuwJwxsirGBBBUU8W46LpwPc/NvnmMrqVlS2umz1qhrCkqTaXHnWp3PSsWK2785qIptaO0Rnm0Ee3qZJv+UpGRMsO8r5J40bdJuQ1YgZlP3FiqYtVNJ8D/TmipWCiRUCcKS9EjjLDWDcFvKgZQAMw9fj5NIiJz1P1O5sZvkNDTF8TLRhJy1tA7pta5DKY0d5AOouLxjOk01sMLXW2sKrQYSf6DwJccCidBMd+yQ7J/gcz/fuDkF1x2Jd4EWebwWOtG+h2I9FQPZSxbUwft16JlIFTC3lxNuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:55 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:54 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
Date: Tue,  3 Sep 2024 16:38:12 +0800
Message-ID: <20240903083818.3071759-8-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4d0df1d2-189b-419d-aab8-08dccbf443a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QaUsqUtOJKBAq4wo9kQdnWPRJoaLGKKPUO2WvuMF1iBjNtf/MNJPa/C5ce4W?=
 =?us-ascii?Q?ltNglHA88rkBluAd3ONVKEvc1TP/VBDs9cNs9yzB8y33NDjyJ1lhyf9Twd84?=
 =?us-ascii?Q?2L9NlK9J+EfaU85T/MoDrgLOrnax5zVOyf6QjsiUHVZck7+FA6BJJslcFl3y?=
 =?us-ascii?Q?epbD25GCQ5Hp0L5VQ5szF0nU0Crygf0LRmrX86LZagJuBiMBultfjM9u62rV?=
 =?us-ascii?Q?DR0R9IUfq/yWa/sDZzLqJi7N9/RI+rsu88XudtxhfrYy9fsruNPW9blmWLN6?=
 =?us-ascii?Q?M2F8QXoXWabCpcmyH2SRBvWqtPc8OscsZ/HstpiA0rH0aYhLaKrMxQji0sGz?=
 =?us-ascii?Q?2qtihQy/bSzRAjRvDNKFtouUplvvr4qpnSB94s+HOdFvSyQU50P7pRVvgLdb?=
 =?us-ascii?Q?JTe3wr8MBJjTZPvV+k4pvot3XRnyO+0dOO+mWcYmGrFxZTFA4zMzIi9fkKI4?=
 =?us-ascii?Q?wqm50nEz7R3deerOgMcISUlkI5lZkOGJUodPWMqxxBl/lDbyCYB6yn8Kw4oU?=
 =?us-ascii?Q?RwAO+V9w1UJy5jLUwZ/R5EKgbQ4uAcIJ+P37M8RYVG1yLxiRUHfzB+ZDc/QS?=
 =?us-ascii?Q?gTWlv7xmroWPGjqiRrI0blc56cdg+SPawZOFmphH+N5H9j1sv8LZ1B9cNt8e?=
 =?us-ascii?Q?qpZwbA1c/UqJsiu3zejKroRd4kovvJQnWoyn/IZrWQVokuY69QxX53X0dG5E?=
 =?us-ascii?Q?2AtnO08U/usQdX/GCS2bIhykM1bKKJioFLr5uNjV8IkGT0h3tNMEYaoWdIGq?=
 =?us-ascii?Q?pYZ93No5iPgNzre44M8teQqpnu+P2kKlavmCmzmV1Ip7RTAdkq/GAdDCS9yU?=
 =?us-ascii?Q?kDSoew4AmXOcz5hBTETwFPlz0sBvopqle2peAR5DbmvMUuyBk3jevK9GCoGa?=
 =?us-ascii?Q?Cl6zzmrYRhrLzsQD/J56QSD7Ytwar5RuuVPpaCUpEGPKljvw/ozVy475tA/z?=
 =?us-ascii?Q?4pPC8mbSC355m/tcldmIc3ULE6w4PDxfshZX/Ktn/QA6kCEcmmlpbIAfUvS8?=
 =?us-ascii?Q?3Jne2VrU0WJwHT/o8+CBG6Bz12YfNYN9hjEiTbEHU6mJDt8F467EXZYB039Z?=
 =?us-ascii?Q?png8T72UZTK19KtEHTvtWQZl6Vk/v+3T1OqI4i+ufBrJEtZJRF51xH3gAQze?=
 =?us-ascii?Q?x2ECiFOlf986MG7ywnRj9CKYkM3bQVuA0g3Q6BG8n867p7u+Wdgr8+dcOiVy?=
 =?us-ascii?Q?zj5dTEpPOWyimXdGO7NSHz1Tvk4aygA4LkBaH2r3NvgDxYsYjYA3olex9xZy?=
 =?us-ascii?Q?nDd9t+fK+o/qCac+kl+yvTG4TGCdicP3KtTYocTibbgt9keCdX5FdUc/92sq?=
 =?us-ascii?Q?TejcJIFJ/paDigrQNPun5dzde8xx5vOIaTSnlUavpjCM+Mx17QRoqBXgm12Z?=
 =?us-ascii?Q?Q7MquufyoB4BkxPmMS2zLlwPhmcqtq2RXSry5pDadRBcYvUKQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfJ/7h8ztenxhHQ4FnT2vEw8aFGrOXpXTM02QOo79FkOFLbPPoeMKDZKUNDt?=
 =?us-ascii?Q?ZYjhgkg4HhUY7QKqnh9MdFtzOUMulhxHl4oOIw7ZatLJqVLtGxIQo2199sK3?=
 =?us-ascii?Q?HgipopahGDbIJn06TPVzvPgrbOvsv+xmEisvzwpyCezs/sPPMTEsxE/SY78K?=
 =?us-ascii?Q?AhYZTRYlYVSs1RE5kYVhMpbnZTYvlM+VOwB48RNNl9LKI8XlEXBaSVm5kmqA?=
 =?us-ascii?Q?0IVYnrQh4j6TiPnni7vAiGuRAQgsd6sAZodNMO7fpbUgX5nrK0TdA+K3QGUg?=
 =?us-ascii?Q?UkP49PDK2skp01Ey7RHGQDtWlwP/XCcuXRV4Ai/iFYb11holfZ2hUgpHZyGr?=
 =?us-ascii?Q?JToE0StzwaBMAKNw4u5E7G0qwSU9KbITO4Pw7ZWB5qd5vZa58RdtEJfOt3jg?=
 =?us-ascii?Q?Uen/OId3RZpXl71PqWBj7sjmJyoB9gbGYUQDBeaQPsvAMfnfLx36WPxvqA9W?=
 =?us-ascii?Q?V9kBNRi1ZAQEgkWzAu2UgPnXdwzFiJEH1LX9WFSJWjVb12yIkmI9ni6+xsCg?=
 =?us-ascii?Q?S4yQIvsX3etqhnfnYGUbHpE4sh32zPJ3ZRyOM4AxAL5Bgr76vi4DO3eEalHj?=
 =?us-ascii?Q?j8J6pXx7pu7eYDmB9vypHDPEiJ0sEIoiCzdCxFfD7J8HWCwl3VTvG9UFesUW?=
 =?us-ascii?Q?GF+UC0xuQOvoWXrIxAYhIjWPY5lAwdc+gSRxgozslmEqDo4hM+g3srlFKJVH?=
 =?us-ascii?Q?DdRvwENOsPbPDYVZbTCZQfsRkj90izjZ+K0xBhPZlVoMdX3dnIbHZKaW2nBl?=
 =?us-ascii?Q?K6MEbyRwLL5q8TP92FEKLLxYwGnTyAS2/5PLA0Yql25i05uH9JDKTryYsYiN?=
 =?us-ascii?Q?PfOy2N7sUOtTwahy0YWNKYzc12X43cCyBRtKzLxf/i1TG7KaetZy1WaUObWj?=
 =?us-ascii?Q?DPVlpF7XZQ8QQuh3LO83sBtkVpDKzrDlzWPaHSX1GEHeh2h+i6WRSSigYPEa?=
 =?us-ascii?Q?t6Ftv/mIsK13rTFmfHPVf74Xp9ZEM+dF+tPz89Weo/AWj2GqhdalSIcL0Boy?=
 =?us-ascii?Q?C/H/7tJc5ecFImERmpOseQMiIv3ugE/vu53k+4ftP6+wL2qxaTD0/Yy9B69H?=
 =?us-ascii?Q?7Wl4HaQHz8blUbSBndS7XZX8kGRHUSP1tmZ/UhICdG7Qmv/DG/f84Sn8ViCH?=
 =?us-ascii?Q?akTmEsnOT661/ekuTh3GHqlEDFr0Y8edvwHubsPaXyoSA2gLd9pavt2/e1sJ?=
 =?us-ascii?Q?ElNPJxGJh1EF9Ot/ZeAgn3fIPVSl2F9/8brwJO33XWKmdgsDMcVlvjAAq1vs?=
 =?us-ascii?Q?83cNzOS2dekSH5UxFli2LS/lxqJx001mlg37H1k5y7PSLvuqQ/QJD65iwFdd?=
 =?us-ascii?Q?KyESwPaB42dHaT4+uD3OMlQF4pxs52dJQZ9oDfZ1d5US1wqPtzJ73R2Xxzpr?=
 =?us-ascii?Q?0Gdn23Kkr3QibHbof8AcRgVkDcHh6yvcpo4gdhsNmHoLDyWK+k5nHKWqcv1v?=
 =?us-ascii?Q?UmaZGMMM/I0LPBt14ko+ky4ndL2BivM2Is2bmFEu9jwV73mnhM7AWFSGUGN+?=
 =?us-ascii?Q?yqSSemzvEiAw1MLZYTI18lR2D4Bv6TI+L8BzPw/JwRGOBHUEyFQtUwEXUMsH?=
 =?us-ascii?Q?pQScwusK90jL96Tevod+PFAdbMrJVAd2Pho/cUlB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0df1d2-189b-419d-aab8-08dccbf443a7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:54.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGwm1g29Hv0XqNBYTKe5spvNeBVPwFAiHEwvfGt2dYujebYrQ9Il7ik/TAEJPCId5N48qqI3O13y+4lk207dGg==
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

When invoke memfd_pin_folios, we need offer an array to save each folio
which we pinned.

The currently way is dynamic alloc an array, get folios, save into
udmabuf and then free.

If the size is tiny, alloc from slab, is ok due to slab can cache it.
Or, just PCP order can cover, also ok.

But if size is huge, need fallback into vmalloc, then, not well, due to
each page will iter alloc, and map into vmalloc area. Too heavy.

Now that we need to iter each udmabuf item, then pin it's range folios,
we can reuse the maximum size range's folios array.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index d449c1fd67a5..d70e45c33442 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -343,28 +343,21 @@ static int export_udmabuf(struct udmabuf *ubuf,
 }
 
 static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
-			      loff_t start, loff_t size)
+			      loff_t start, loff_t size, struct folio **folios)
 {
 	pgoff_t pgoff, pgcnt;
 	pgoff_t upgcnt = ubuf->pagecount;
 	pgoff_t nr_pinned = ubuf->nr_pinned;
 	u32 cur_folio, cur_pgcnt;
-	struct folio **folios = NULL;
 	long nr_folios;
 	loff_t end;
 	int ret = 0;
 
 	pgcnt = size >> PAGE_SHIFT;
-	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-	if (!folios)
-		return -ENOMEM;
-
 	end = start + (pgcnt << PAGE_SHIFT) - 1;
 	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt, &pgoff);
-	if (nr_folios <= 0) {
-		ret = nr_folios ? nr_folios : -EINVAL;
-		goto err;
-	}
+	if (nr_folios <= 0)
+		return nr_folios ? nr_folios : -EINVAL;
 
 	cur_pgcnt = 0;
 	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
@@ -389,10 +382,8 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 		pgoff = 0;
 	}
 end:
-err:
 	ubuf->pagecount = upgcnt;
 	ubuf->nr_pinned = nr_pinned;
-	kvfree(folios);
 	return ret;
 }
 
@@ -403,6 +394,8 @@ static long udmabuf_create(struct miscdevice *device,
 	pgoff_t pgcnt = 0, pglimit;
 	long ret = -EINVAL;
 	struct udmabuf *ubuf;
+	struct folio **folios = NULL;
+	unsigned long max_nr_folios = 0;
 	u32 i, flags;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -411,14 +404,19 @@ static long udmabuf_create(struct miscdevice *device,
 
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
@@ -428,6 +426,12 @@ static long udmabuf_create(struct miscdevice *device,
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
 
@@ -436,7 +440,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
-					 list[i].size);
+					 list[i].size, folios);
 		fput(memfd);
 		if (ret)
 			goto err;
@@ -447,12 +451,14 @@ static long udmabuf_create(struct miscdevice *device,
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

