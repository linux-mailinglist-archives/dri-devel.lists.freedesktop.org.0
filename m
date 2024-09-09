Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EA971335
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6410E34B;
	Mon,  9 Sep 2024 09:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="D3OxzCue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC710E34B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB6H+otLvm+di6YfyUQslFNCL6fPolzH3AqFQx80CVc02oYQw+tBl0btBD3uhnmx1+S+oXWVIEcUGIgOOrSPmm6Sw/q2onUkWCeF+q5h/yubIl7CUr+k5deVe0F2SGclASIUVwYpJ+3bn/vX7zlZWuDK5sa+E5WA+DpBA0Ax6ygrvjwm3zAMl/DY7S42OR5m+mzBNO9YP7I77aSCCTQH+AwXSwOKQ11sstfXr4/wZhO80DeEgSBQ7xY9n/pil9QMIrvcEGn6F47xjMQcBZzlEa2ezzNlcNmWVOK8SCfZrUPulHCb8xgvjFeRBbSpUaX/BHGmz2gckmWzEl09yufyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htKih652snK6YMvQ1BKfnFkyzLJzkrbeAa0pGt3freI=;
 b=bvEuE8q0ndjsoZqLZGRwXHaqhcS6XLhrUCxg4zMZ5PH+SjQzWoIUXlGC3+gS5U67rQdCWC9engjHt9ekcOtGgZNKp2gzrXYBpfSGkpFWJ6v59v0HP9W3eY5VbgEkQ14+dZpG1TM4/IVWHOMEoMsjq165keSk39G0Vsn2CTLMo0bPFr6NUt2zv21cJaMpCf1ehT83L47J4FsubAt6T2t6SWnYPCSpGiocxoavUcGXDowFmezk2nuRqYcyYt/Z+LPXeAvykVtxfT2jYZiX2OFZ8etY1dOHkSMUB3TmuQbpUnBSBKbaJU/2v2xfOOqRy5EWw0nh90imRciNUL+usPsBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htKih652snK6YMvQ1BKfnFkyzLJzkrbeAa0pGt3freI=;
 b=D3OxzCueFA3gRUmvkxaihXLLkAZxnkcATKpy3MgV+KIRRwbz803BC24OziIUmEDFJDIHa6+GPkgcHSXH60BCpqiXiGrcE2pqBGPMLunEGp2bZfGUOkU1EV1OrC2deGmGoxsuNknxNzXyMXF67FJv05Ks7zIxp0xruYdVfgUsiE+tY8uU220uvQf6+uEyxzXy0xR0Fow1wsZwlGUtWvEklouVij0OLzD3qI/qi360l7YzU10XRKnQPI9okHUXNjfIFfbBhg8BOoLh21m8sqJ7aVeAFt0ZoS8D8Wc61sKcEmdzYzG+I+sc0Js2q8G8BGUeRqCoZAwU517fP+mzUdma9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:18 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:18 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 5/7] udmabuf: introduce udmabuf init and deinit helper
Date: Mon,  9 Sep 2024 17:18:43 +0800
Message-ID: <20240909091851.1165742-6-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 148ba25e-c4bc-49ac-7d3d-08dcd0b07b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u4yt+ye+F16q88bOvViqzdwUu3MOhGw5uY/CVC3Lou9ffygECzAaiTD5eH1B?=
 =?us-ascii?Q?4/GjeXErDac+2n9SfAvAaoqYQekXivnJn8HxkS5roQKLIbYI9Ha1u79+s1v9?=
 =?us-ascii?Q?J/CVngtDPzcvHqHXT3qOo9Oo9ppOrVToLabwSRDmNJCWBx+nsdDePrY0gptT?=
 =?us-ascii?Q?qIeYBa7KRcmpmRsJU4OZ08bgTOhUqs7QpOuzPBgGufTrEm4hreqfmq3wY5TR?=
 =?us-ascii?Q?GzM+mHyW/843kvoTNbRqXnocA29yppj/mKRmogxzRvY5+fpJJfAzGDPiNDD+?=
 =?us-ascii?Q?jp8yfqov7rBc0/2yyM+vsNbS9KuIiYLSvXHms6XbHIS4fZkB81wAsqj2j45G?=
 =?us-ascii?Q?uf1N9JppEjJ3vDjnr7mMR/hFCeH2QTAycysqNVp0/9hoK+LYBBJlWebHUrc2?=
 =?us-ascii?Q?xACamiLtBS8jws/JuV/zQaEDz9nR50nXHb/paTLydH6hFr3EJ3McNY1eGuoB?=
 =?us-ascii?Q?/IcHxmgXs6x5eHWTnFm5XJ7rN4DXI6tDEXj7WXf4kxABwFDdJPSiuvHm999y?=
 =?us-ascii?Q?gU159G8O/S/3k0VC03xddce2BU26+r+AZ7ki7zF96xohZcQqfOVVUBIvDj/n?=
 =?us-ascii?Q?D0gQsh+zNRJNuWafRU6tWNzNSj9NzAalor2jvKaLlGnmNgdh2kvCfQcv1JEE?=
 =?us-ascii?Q?0IMsR099S0YcY3QVI9ilTbh3763YGngN3fgh1BQAtmcemgMZKHN6+PytJMPe?=
 =?us-ascii?Q?IVDf6v1K/m6AKIUWcHt/PHOT3yL7rHKI7XSYjvDepRGF01B6TzM866HG/dMN?=
 =?us-ascii?Q?nKXqRMHmPqxyfd58P1+Yd1geoZ9u0O+5XUnihGq09v3crIRUnVbafVajjdDt?=
 =?us-ascii?Q?ILbhHw+9uGeLXKYCrkw78vis4iIbh8cCaRjcFQMplgZN8soQbZkB/jYrETAR?=
 =?us-ascii?Q?rMzUJPjiReLoePGxGwtDvrj8Oa//xSZTS9SSY0yFwTDELZMA1wsDVYmFaR0o?=
 =?us-ascii?Q?xglyy5q3dFAyxg+9QlcmPCAcDSUu/Ws8Wh1+p3jk/qftD+w0kKM5urZMOFzD?=
 =?us-ascii?Q?U65w4awJQsM6AKNoBERQ3cSOiHPUtzS85NCHHhgEs06pvX9m76nPVCRSIhGo?=
 =?us-ascii?Q?WysePGnqKKxaUdWl1Cm2JEdNKkfgCa/nXom59W89OdwpNyUkompHf422XB7q?=
 =?us-ascii?Q?pPRz2+FvzjeiDHXc1Ud+Dk4oMW++d6/e7xD7x27uYdAhlB8+639JoxF/SJWT?=
 =?us-ascii?Q?6XAQN8uOrfFpnk9QNAnrAKSZjTYtX+u4+mzCDd4dvcMXuPOEEKxdktxyFvPE?=
 =?us-ascii?Q?6plxoFZStnlCkq09l72tIO3rhfPihgsTSPrlDd+T+3lNaP7N+qI6GKvRr+Fu?=
 =?us-ascii?Q?NY/HxLMBVhnaSah/YGsltSHUwbb63wZ4GMJDd5s+wW96o861/+QYVyZ5wjb6?=
 =?us-ascii?Q?lo+ep6Q2WXA1gDLIXV0naODNUV4ACthNxfwPXEXkEIKmJqSI+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2xf40Xm8KVaU+FcL8KNc41r3/iaAHJD8y3niMr+nbwAH1pU+mao9Aq7wSwER?=
 =?us-ascii?Q?IGiwkyRF94gj22j7FGatg5hEIFqYOKI0RQV8Sk9z0P7GGhN4jrTVsJorzJG9?=
 =?us-ascii?Q?QVoYL42Eg6YjnqHYYd7NK9vKuIDAX6SoqqmlwCRd/ZiBSFZXPh8FCELwbvya?=
 =?us-ascii?Q?j5kJ50/crTbSDkv8ZVjOI8dbBefCKe6jMg1tSi8XEhAsjbCeiNgh6pQyvSUR?=
 =?us-ascii?Q?cwbSm87TQeCJx5KCuLrG4CHXownMiqUUQQ0MXP3J6QFq5DVYtW7Zr1myFFpC?=
 =?us-ascii?Q?4DYYIDQJ+rey2ywqkbdJMGfm1xNIof4cLbJTGu7tAKrMEfgzlLnkl91mFBim?=
 =?us-ascii?Q?NZisDoBTkKqJl+rSsUPenA+IP2UZA/fhJUYJsPr8mRklAJC8svPqbBQWAwAl?=
 =?us-ascii?Q?sKMQlOOxGllD+hy9hrEEm3Z62QQ1HzETozRNXpWHUFIb2i56yoPDcnPvgZ9q?=
 =?us-ascii?Q?ZB7fsGzYb0hpNvYV7sMQBaHyMqkjpdWq1XCYsk2GtF+zu34LaNUGkwHgrYY4?=
 =?us-ascii?Q?rJNeT7VGVL0GYmiHGnWkiwV8+P/DHwqP/Wdvsas9sijgEDyEm81tQdJLqWWs?=
 =?us-ascii?Q?KS4JKIkBaFbpiiKL0vHyH7dVRqYB67F1wFi10nFfXWLzSv+zJrDV7m/pNimw?=
 =?us-ascii?Q?Zt+/3UUecgsl0WaxZ3vH4tusODdICUXnHfgfs0dOPkRcfl4amCUE7b7zR2Yd?=
 =?us-ascii?Q?5zha1MGMvlkLAYLUTh/RerwlrkVJUS5iLTs3sNcM7euwezMDPPrjDSjLsiTW?=
 =?us-ascii?Q?yQQairXSCvmXBHGfNlqIk4IiqxOUJNKUWDrWvY8S9QlpxpER1bUhlz3k0eYV?=
 =?us-ascii?Q?4eDW6AVGo0t2ZeipkG7MpHpcM9lGpIZbtcHp7P2ZDb1UDQamDFSxbSv8NqbI?=
 =?us-ascii?Q?xY0jBhiDn0nW+p1KkcpOpZhdp/WdVzrPFIS9rGqJbKY7bapETqW+SLB9JoT3?=
 =?us-ascii?Q?g1aIuXdmHJ5CPnT8T7aAECx2dUKtqFOLbbc4R6dJ5awDkUL9WM2ussGIgaer?=
 =?us-ascii?Q?4CFctHOvAX6vq9uugTyae73c/EmftuqVj3IT/XP/UV8Kn3o61hG+AEQGVtkS?=
 =?us-ascii?Q?sdHfgj+ak5YayrS5K24WvfNZNtASS1V0ddQVZAm5iUb7eV5P/BmkJZv90hMq?=
 =?us-ascii?Q?yxVSPIUFtKzk4ca9GD1LPnNTKbigP4Y2uvVkGg45KawskaJMXZx79z3WFsKM?=
 =?us-ascii?Q?dwNJ8bJH2xS73+ZBHXftJauA3VXSdeMfLoqp+zhUaKRuGwtmzcJxiU+GiDkc?=
 =?us-ascii?Q?4nSx2tfW/hTJDy8rg8qrXhsjDSxih6UPnI43vEHgVf/CjYPreprv0vdEUfp9?=
 =?us-ascii?Q?nkVtXKDXwmNGjGIBQtv/L4QKlB9orPuRpNMjiigW6B44kOboGGdBlAXabSiG?=
 =?us-ascii?Q?PWOSFAqT7c5WFD+lMYtXcHgyI4iwc91s59P9vAKIK5keiMBiekkNi1bTDWvO?=
 =?us-ascii?Q?3FZXWYZcucz83F7nNVYNvHlePf3FVCtSOnXm4RDiW+zFvtzHV3/iu/677xC2?=
 =?us-ascii?Q?t9ZZFWCJqpUHu3EHQpvvmdCfeDjbBVgTZgUl+Ukr44Wqn6zp3UZz0ZRLf9lO?=
 =?us-ascii?Q?9XbNlf91061YDbFNUSahj3FTIqUioXh3gfdq/7CI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148ba25e-c4bc-49ac-7d3d-08dcd0b07b7c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:18.6017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwurMZeiQI3gV8FRJP0mHWjmniuKuwyiFfKeUt4hwbkgF3gFgGLxTHBw0RQgk08Ais9Q8DhC9HbVGT6WZ/krHg==
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
index fe1466f7d55a..c2eda960aaaa 100644
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
 
@@ -395,33 +415,24 @@ static long udmabuf_create(struct miscdevice *device,
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
@@ -452,9 +463,8 @@ static long udmabuf_create(struct miscdevice *device,
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

