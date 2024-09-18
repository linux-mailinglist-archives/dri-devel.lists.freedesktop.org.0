Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE2E97B6E9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36A10E51B;
	Wed, 18 Sep 2024 02:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gI3k0aEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2079.outbound.protection.outlook.com [40.107.215.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B6610E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgQ2rx2cUP0TG2IHW2DbCU6oUAj0knOYh14dY48u7EZ/qhWzW4xuhaOU6lPOHBQv+cKr07yJo7n4J/DECYUuxWOi4vEUmXQZSKvtzMDOayMEDQf5lAhCJcxOkq4V2FQDvEzrHEyiVhWDfJivoZFjxTL4DRmcCOdC/AGykG7KRtAch3Es3+xIuWksrod4XcHSrQYT1FR8hvYEZsRWIMpgBQofUbnr/eZGHK2bWHl4o7oBiJuenMYiNki6G9taUSzRdfYsVKDHMMkjBh5wfx24aIw85Cz9/Vf8cvGPfzkSu+f6260OvyHKoCQYJ7kvLMCrUVVjzAApSX5gTs+e9PmyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP85JJ7XhHxUZ0bL0II6CGxMXuUorY5CUTQpLmn9RwI=;
 b=lMZ4IPyuuELt3vSYe3OdOjaLO/zQh/gUxnIfDj9LFrOcZH/ycVnzFKGslZ0UfLUnlxl3ELpi+UqCSYWz/DShlNhMLn4CDbJz9kCM92LD4HlGLKVsjnv5QmyY2yseuI+5T1KlEwkZ3si2jfovzKotQEsjmqZwngBtuRUE/oNqelowY/hBchWNxcRZOy4VghrOmxj1lfq6XFF1N/bEY81/HptlpJHYq15D/qWvxIpw80Ws51gP9o5E+52+UmsqsEkUgV2IVEgXoQRlwMxTFnUEMBMMaVtbDGeks2SuCnq5GcnQ0n7koJU5EdJNwS8wbO2HnVtjc5Go3MDM44ducjHh3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP85JJ7XhHxUZ0bL0II6CGxMXuUorY5CUTQpLmn9RwI=;
 b=gI3k0aEWi0rwSlwwgnoP5tggGMEITs03lOLVmL3YyOHXpxhmUCZP0w5r3NBPktIiFxCCIR39p+rdWUA0XY8NxwY2nXIFMPXlHb3Do6SMcbUlVOlGXihmWBWnr7McvGpv6vKYyJT3+9vgrC11gXl22I9CBpNC7v5qWA+38BnYlSuDwYdyVjaDuoYUMx/4vccXaP9ysSEwdSXtsXO5FTDBWtxoQ5tYdtcxKmCDEBOAYhfoBaavhwN3iqAD+Zbj39eT+ReuTRYNRuegXDXlzG/GIQzK24vRtvHm76MReEvsNSfXP/RgI8B5TZp2KJX804J8Gd8oJDlHulIIFfInP4AJXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:53:04 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:53:04 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 5/7] udmabuf: introduce udmabuf init and deinit helper
Date: Wed, 18 Sep 2024 10:52:28 +0800
Message-ID: <20240918025238.2957823-6-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9069a733-c9a9-406b-11ef-08dcd78d0482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X+8aT7cWW7GxHcgK2k84niAdw/UJ9Sa0uRqRlWS1kaOStHaP81y90aGyfxrs?=
 =?us-ascii?Q?2tMjQebSX0mhFTnZy55qegrlLIVebf6FKBLYHLKqhnI97kNb2IaMnOSBBVFQ?=
 =?us-ascii?Q?6ufAbC+hcmSRYtrYMV1QcCodq42HE337hsn8a3QMUXQWcM2KU1dw0zAmw0fB?=
 =?us-ascii?Q?LbH6zOqC2LqiU2229kWMuSmWKu5LlXszAEeN4h1b2iqEdm3SUSo+nAmSdA1r?=
 =?us-ascii?Q?94G9qKhYDtkfs4U7ZjZO8uIiDvMsEIl8G8drysu5fsq9spKnGJdAgPQEJZPF?=
 =?us-ascii?Q?aDgQoRC4wytAWB3n509R84v9Vp/tzTV0ZZVH8LUMxobqccB+PBtv3IZmUwMX?=
 =?us-ascii?Q?j/RO044Sx9mjc6IBy9iYWqTBi5O5tMi+epKQ36CzU4Ht2wK574TwC6ZueKCE?=
 =?us-ascii?Q?gjOFhPlnnjW5pmupYZIk5fHiGK62+/r5rKCGf/kNGw6mylWsdKHuO/Jodqtt?=
 =?us-ascii?Q?LZVZGnG4nHXB8sR9xEJaxMUGo5JEVo94qJTNuon1uktSuNeWGx/xKtbcbift?=
 =?us-ascii?Q?NLCQ7e+zgxGfjA5i55IstKOIHu2eah5MNPsGiqgwk7MaOLyZ2GyBigG/AZCV?=
 =?us-ascii?Q?ZsXBU+2oxxgaH9nYP72pRXiQIVyqPHlyKuf9WfYusCJgPP7sfJKBMUQmEwZS?=
 =?us-ascii?Q?hHw9omNB2nQ0iY9CaNg72RoVUQlqsgfst1IaqmKcEjaypv4HB0OAiI8Wu56U?=
 =?us-ascii?Q?Q79HLs8gPwD/U7H7pMWQ1UiAx3Q/0YcFUkgu4WIa3te2zbrsXkk6IluiWV/+?=
 =?us-ascii?Q?hmvjw09lLt2YC/Bq1MZ/nmn5mu6gg7Yt+QK2S29plCXLkNwriQBBZEZQMNFJ?=
 =?us-ascii?Q?nE0lBpWlqLxDRcaS6VSpkGvrwjxASRj1UZ3XI6vPRqX/kKAq8ts7aadKi333?=
 =?us-ascii?Q?9YEli2yAPWM+XfYLSw41jrcwob+PFJNREZwd2ObI7M42ELP6QNcvee+JWPGI?=
 =?us-ascii?Q?wjRAS270edjWcCXzEFRiUWt/FkLXftvJJNIC8RJ3tUrXr2Qbozqs0zZYH5uv?=
 =?us-ascii?Q?jW5vqQ/HvPEojBDdHIYgHSjhbBLVe6d+z5rUZRWzMBjTYCxsYoRxuz3gSf8o?=
 =?us-ascii?Q?L/u2W1ltg6I1d4FRJ7HAXw6AB0nNeqADpojCRwDo0nfyTkE5mYL0z6NKUFEu?=
 =?us-ascii?Q?e5eiDkm5OWXfTwt+gNO7L2bQa151UgOKs+UO02JWcqmaMIMQhBLN3FySYmhm?=
 =?us-ascii?Q?vxmq3zmouIQP4B5uDPeVIAcC04wMoiiUqH6iMwlTSUt+ONo2oqjk5FPYIKfR?=
 =?us-ascii?Q?CdQO/j+f38TsqZIEZNO0aU8Xzk8GyU7usbWenTNsid6DuKiSSsGC4kLmeFtB?=
 =?us-ascii?Q?+U6LB/UDToTvyH/+2GUZWnWff+Bw+6+hcMwPXxurvriMUQ9AqrFkYBSfAtpT?=
 =?us-ascii?Q?b2RcyqRuowbKT9pW1OhMIFaZehSXd0WkhTY6rDKKeCAYmpeJFIvysuJIrMaU?=
 =?us-ascii?Q?8r8R3eMLnKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5StMi5Zvrykufibcz8X7cp7yyhy7riryR+888ZigI5El0vW4GDG0itK0UvLh?=
 =?us-ascii?Q?N6iOeT9ULN1JLzqhL04svOa1ZFHnkXZ1Ax44XKOYaalFx/hGKkZThkhCRiNg?=
 =?us-ascii?Q?LfSUYdDSyqSrFQxgVsOBTBrRERYXcNm0vTsLaG6bOaq4+L6IjqoIFYBqbZIe?=
 =?us-ascii?Q?P5UWk4NkfcZvK9XS6AhRkNRoVW3swwI+g/yM0UWBGhwWhtsEdcNxSEDU7nKb?=
 =?us-ascii?Q?fO0zxTTSwMK9YdDcLssDS/zMpugarWYlT1Yb8w2rwWEaZnXhxMjSBWl/lt9G?=
 =?us-ascii?Q?UpAey5dgw6hg2V3iptOeAjqzCBs84iB6ieKLgjc32Os9okGSlc1xl4KPKy2n?=
 =?us-ascii?Q?4ohLKUHxwN/Lk5WsA4TTCS5tBjObf5sxJ/YeXLkLxGNqlhNpmQHhmMlAinFi?=
 =?us-ascii?Q?Tozd4+ncK+GjG9L5ckq3TvT/GhwpLZ0bc6zQIb7lJWT4lMQCtZCsZUOil9WD?=
 =?us-ascii?Q?l7rIsCutqE6qUTv++OrmOjFQjpvyw6bHsaGlsruFYI/rJoKvJm293I1NyslY?=
 =?us-ascii?Q?I+1XzV18LaEeqhcug98outuGMd0UHjRwJOo9p3gyF1HnqrFt2FiExYMTJz1U?=
 =?us-ascii?Q?hfY8mwZh11pef2PAS38B3AvwobhGNBhCFO8mHR+AEml6dCEf/vVsu6oaYPVh?=
 =?us-ascii?Q?96g2bUslvSeHPQoX5kQGbwNEVhvwPXYuEq6BonC29DWVomaeyF9b4AEtmznf?=
 =?us-ascii?Q?D1cvIySyF/WuFV6katkFLrzb+rmJdlUvMniRe4hP1/Ku557AiPJ4UM9ef2Df?=
 =?us-ascii?Q?AqsM51Gmh8OFD2Jhq3AsgTW4t4OfqQh5D/ZVwXGa2LXQzHX3DoKQNlV6qtcM?=
 =?us-ascii?Q?AUGs96Zhd5eXep7+PfWG/Dm2iYNOJJRvz4sIOF8Zbz47jJdHeGKwavyn9Buq?=
 =?us-ascii?Q?JhMK7cnGvStSqIdtdnlBdArcVzvyKwrv+qt6DV3ojY2gGSOtO6oU212jYUMM?=
 =?us-ascii?Q?8SibAGXYpWlr2o8e4iNSEQuol0NmKFNTJHsiSvkRW+M+sHcyGp7bKqohk0Gk?=
 =?us-ascii?Q?4jmrpanhB3YrwQclcAF3+W0rGpqVpbQO6CMaYFDMpz1/kEb/2lbZFcbUyWAI?=
 =?us-ascii?Q?oHkhUvNfKxNLY2W3Ya9DVcMGTyoxSCdAgEk9pvtI98Us4loVz18EZ/5mpgKz?=
 =?us-ascii?Q?N9h9p909mMb4/Ky+UtHa3Q6XL+K5iOIWrZ4gDB1DOl9aANrxhmuR0C4nLCch?=
 =?us-ascii?Q?U6NUGLCdl7/lFca4NxHGedEMRdu5tQOpjXpeuzkshcWGayksu73n6Fnq3hue?=
 =?us-ascii?Q?4tO2zRM4f7gj4o5jTcVW9bFAqOouh/fAKBMFwfMCzdizgGL1NLzY1JwLGTlV?=
 =?us-ascii?Q?pduLezVyOcYem9k34RrmsD1Yyj65F30Qs5apZBklLN5pkvUhnY82wVkRy0yY?=
 =?us-ascii?Q?XUZhLXNeylXvXAvrtRpN5/y1aZ1Gm19yK/oqINnbeE31yfeXkIWMURCDvBnc?=
 =?us-ascii?Q?imZ3a19kQ96xNTtPUaWJzmUk8aKJ1gOP8LmlCVkv7fXeDhy1Pm/4Ufrhw/gR?=
 =?us-ascii?Q?X3Mp6X+I8JptuT9R4uSGpLtEAZRq3L3a8Pm3aCimIlHIytf0VcXm+cuvnHcy?=
 =?us-ascii?Q?fQaxm2KLcSte/84rJxQU16vRE2MxzEn3qo8wVESU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9069a733-c9a9-406b-11ef-08dcd78d0482
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:53:04.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axWcyLdZBYdW7NnfGHm31Ke9qrx8cezqvoSAZVYyIDxAa5uWkUkh61dfSyTLODq86eufN3qS8rsFKAvMTvcuSQ==
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

After udmabuf is allocated, its resources need to be initialized,
including various array structures. The current array structure has
already been greatly expanded.

Also, before udmabuf needs to be kfree, the occupied resources need to
be released.

This part is repetitive and maybe overlooked.

This patch give a helper function when init and deinit, by this,
reduce duplicate code.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 52 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9d58c045b8eb..40ebff2c77f4 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -224,6 +224,28 @@ static int add_to_unpin_list(struct list_head *unpin_list,
 	return 0;
 }
 
+static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
+{
+	INIT_LIST_HEAD(&ubuf->unpin_list);
+
+	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
+	if (!ubuf->folios)
+		return -ENOMEM;
+
+	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
+	if (!ubuf->offsets)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
+{
+	unpin_all_folios(&ubuf->unpin_list);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
+}
+
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
@@ -232,9 +254,7 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
-	kvfree(ubuf->folios);
+	deinit_udmabuf(ubuf);
 	kfree(ubuf);
 }
 
@@ -392,33 +412,24 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!PAGE_ALIGNED(list[i].offset))
-			goto err;
+			goto err_noinit;
 		if (!PAGE_ALIGNED(list[i].size))
-			goto err;
+			goto err_noinit;
 
 		pgcnt += list[i].size >> PAGE_SHIFT;
 		if (pgcnt > pglimit)
-			goto err;
+			goto err_noinit;
 	}
 
 	if (!pgcnt)
-		goto err;
+		goto err_noinit;
 
-	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios), GFP_KERNEL);
-	if (!ubuf->folios) {
-		ret = -ENOMEM;
+	ret = init_udmabuf(ubuf, pgcnt);
+	if (ret)
 		goto err;
-	}
-
-	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
-	if (!ubuf->offsets) {
-		ret = -ENOMEM;
-		goto err;
-	}
 
 	for (i = 0; i < head->count; i++) {
 		struct file *memfd = fget(list[i].memfd);
@@ -449,9 +460,8 @@ static long udmabuf_create(struct miscdevice *device,
 	return ret;
 
 err:
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
-	kvfree(ubuf->folios);
+	deinit_udmabuf(ubuf);
+err_noinit:
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2

