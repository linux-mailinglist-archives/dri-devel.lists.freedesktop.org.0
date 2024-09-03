Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06A969772
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2310E435;
	Tue,  3 Sep 2024 08:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VeTTAqhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2045.outbound.protection.outlook.com [40.107.117.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296310E435
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcEpYELBzUJvNFowwWcRh8FmTJ/PcVgJ4PASxMzATh/jdfHWq3U3xjKWcG3YbzGfm+MsN365DAdcpKBnmG+2bBY09Kaiycm8dkjC3zkpLkfglczIop5zEUZafg+zKX70zUlEEm+K0wAPunqu4sRdqgrEMRGo14x3shreeXXM/xeV+uL9vBf1msOevvLW8B6AyI+EN2GShDeyVs2nKjeraA+ol5wbD7PhyS+OGQ68h6wkf9Blj4YsE0l/uiXYnqYZ8qJMtNkNOPZwvrqjHCTfivArLKqip7kac3AESaTvM99hIReuupLT/eA2Hc91EyF2wYcyd3VkSk44+/4TeLEfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSFf2g3ny3ZSHAkRcTr13Ksd+qIbg9+zhN/spkWHmIM=;
 b=TwfsBqukAn+oUuHsy+Ol6eN8325/hFvoq41F7Zd2FqcxewzhnoCIhCkveAVs3lEtb2+jtkmgVe5Xw7hsMbd3J6CjVezDN58WgZU9VlxwisLjLxJsSVIuC1BJ9Rf5OnEq092B8Ik4cPS4tyQB0w/oz7Vike7UpwzUECwFJb9L8eC3aiBQPkLZ28rplOp9pwQYodrrAF2LsaarA6M+KtlqPGIjWY4NQ8cnhyuaBUkffDhCddwQgAqe5ZfaARHXV0Ji5h0ApcNlfOJKwM+Mo+ZLRVxL7cme8Y6u/0Y+VGbcPnJj841x41DHISvA4RSe8ktjp5pk7byR2DApgx6Ap4fKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSFf2g3ny3ZSHAkRcTr13Ksd+qIbg9+zhN/spkWHmIM=;
 b=VeTTAqhJqSUmJ6aPS66q8dYOPdEqzXNkAdW8f9NNsrikGhIZtr+fkevG14c4crU4IugD2qkifvSVaGvGgNLhbZV/Wyndmfco+pFf8xOkxro+9IKv2CALgezh7x7TLg8m0iMB0j8VaAcUga/F9fAcqw4iXaGPgIr54ENRIxEbzKaGzY1NnLYxyYKZwObSAFQI5TbvwUNN6mI2MJ9ZBCXzCeAxUiasUeqYnbpLSR6Zxut3HXaA17Excnb4wk1GrOvKhmt7juWNVzZNK29LWUhYYZhAw2mkT+9s579GqihwlWSShBWQrBC3bonzTJv6VHMmSmqjV2lIoThANJHcjmnyQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5359.apcprd06.prod.outlook.com (2603:1096:4:1d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:41:49 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:49 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
Date: Tue,  3 Sep 2024 16:38:10 +0800
Message-ID: <20240903083818.3071759-6-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: bf3a0b50-ab8e-4cda-880a-08dccbf4408e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T0g8gcG8WM7pFoPX529vuNzzmf8DOsgv6MiB0Js77okuMlQlwuWybJBverDv?=
 =?us-ascii?Q?wJAYqbrY4lJ3Nx/AkWEWHjjhoq7WGO4RtKUlbRkVmXBhrUipF5kkbn4Zf3//?=
 =?us-ascii?Q?72KQqJOW1waZcZU+C5QSe3N8pRzCXjg8w3d1r4N5FjpHFJgdtS28tYuvadf2?=
 =?us-ascii?Q?0v6BFfSyjyEr2NWi5T5a0y5B2uGdiLbK3e2TBBzpdD4/ADEqNixC4KjfaOWj?=
 =?us-ascii?Q?SIO/vVffcrxr4KtduWjw9SUGugYSq/Go6XIZ1lW59pX7thvkY0RtBuSgvdPF?=
 =?us-ascii?Q?UDNpDy7jra/SlAEvVbmfFbJ3AEXsq2lSq9Zpe5ChCpPeWJw7tKFecHXNek+u?=
 =?us-ascii?Q?hTwAanmy0BpEa97fT4+oy0aKzlGwkg778n2DULdwR86kuDJ9jshrYhfWC8dY?=
 =?us-ascii?Q?B+9At5aBprd5sCRvfbMByPiHihXNJA+cDmW6DtKEGNzA4WrcpHWlBQr7D/Jy?=
 =?us-ascii?Q?PvZoib1uojzqAMc/8FVY/9iWm3jjQtm41Fmf/pTm4WGHgHwVJ7o4D6AohjVs?=
 =?us-ascii?Q?cqGtNoPB9sN4rfJxhAYU5iyyAOHxTmTwcKswfPPzsRjjrEm5Ylvi7mmELIcq?=
 =?us-ascii?Q?RXnB5Fs5LSEF54ayNHS6C79Etvpepwvsmh8mnMlFw2cB7w4X9nm6tLRCxxbP?=
 =?us-ascii?Q?MUo+J0RO8H9ZjqOzkU4VNPwTUEqiHV2h11DtW/0BO1f8OmV49Ljp9TRyqhYi?=
 =?us-ascii?Q?5xlQ1oshn2xGyJFnoQcarXVceavvdYIa9up1KkEE/HVA78WCp9yyYGnECv2/?=
 =?us-ascii?Q?v0YATSnrmaJrKXNeaTjq3bwCYrU/qUdVFdGnB1rLg4H8VzhN+mQ3tg4IxJ5W?=
 =?us-ascii?Q?re3KR7lAaLm9NlO93g07iJkIQviyCZJitp6BnNQDG/+ArP0vHJVZfiD9qMou?=
 =?us-ascii?Q?BHCa8V/eE2tAQchKhVTkdXFIgnCk62zYI4mZpgDBG/WLnUEIHPKQG7G8VKja?=
 =?us-ascii?Q?71lEGuYPmyf+jcAGGOP1Mn/5EJJG2pIVivNOwIpXFtij1YrUaPMpVRwh21RW?=
 =?us-ascii?Q?irf08IX/OCGO1teZ5+4x3o1dkDeQvwo8QNt1TMSXhOAO0g2nPBuNTOgKPfUY?=
 =?us-ascii?Q?Z3XmDb/1jfS9fpzAQhB+pPN2VTvnq6Mp5TgwvEfwRbTigpiLjY3aIr46xdra?=
 =?us-ascii?Q?Yay2raC/6M5APGKBVv20khkFG7QTF8YZJlOlCN65zVWiVUbhdfF2drN/E815?=
 =?us-ascii?Q?QpzVO0TMFQP/SE7IZtQ37nZTd9l8ejEG1KiozJletNhKGNeZOTytmmiJQTa0?=
 =?us-ascii?Q?OUfqSi4I5+0S+hPmDdp37VhAPGDG2tPU6DzJsxFNkEAQli8lL5N+oAfBRaac?=
 =?us-ascii?Q?ReEIVkkehe5aitgQ7fQx2kWxW11HPNbHTTBi0llJ+Mk6Pd04+oZu5lgK8lhN?=
 =?us-ascii?Q?bXk1Ft8GDqOTCYjZXHFKsn2q7IeQmT+iEtO1jdSQbf1Q78lqLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yz0Kt6suNci93Mhoq53zzx2XRFhb6e0GmQp+5Fsyy0/YQzh7nHObUHIwDQ4y?=
 =?us-ascii?Q?+iAvlhS0AgfLsUrf4FjOUN++XOsIgiIpLvC4s345ws9iVnTiT1YNguVdAFwv?=
 =?us-ascii?Q?+IJSYxMyp6mpmKG6ra82+Jie0NogLomomQYuxHGUfVANLjrXg7mI2stapM0w?=
 =?us-ascii?Q?A7tvOsiEgbIL1G+UPON89jvGgQrCDMU5u9+VNjGF6gWVLXCGJT2uQKp1sOmv?=
 =?us-ascii?Q?tQ3M57daG3ZGTI3gekkT7A+OydRRluSI6jGRBG7WbQfgQpKIFAN0doWMj+4Q?=
 =?us-ascii?Q?GqUiK83Ho3MsVzE2VxMtZuFpqhSRe6l27czteYeoI4JwULaAUBEHjgc+qxSA?=
 =?us-ascii?Q?pzYf8cj4Pf0ZyDqMUxVDvRtdAcxmdnl4JJaWRlGDHK0JyrSFS6jqw08VM305?=
 =?us-ascii?Q?u8u+DplKPKq5V5a2YxCz5shaHngf3zDHk7Cr067lfxZ8EpTyrl0k2vPDB47s?=
 =?us-ascii?Q?3EXD8MuakOW7qWts7SvHgmGuc8pCbN7IiYII4iNlkD4EQ6dx/5MiobGwP+9l?=
 =?us-ascii?Q?tzXbVTVY+aB2D2H+UaYBWzmb5umnBTjgvz3jj2uMyiNioqcimOzsGSjCiCIC?=
 =?us-ascii?Q?AxTEUwY7Wqi/kV1rEkmDj0EEBCVY3ndK5OwMo0o6NkVaTi0vumyO5KzBmMoO?=
 =?us-ascii?Q?3E/imSC+I9OYaAWzDg7K3NKSNTfVhRbiD6qBAHo8HRxI3t/FUxYbCUJq49YT?=
 =?us-ascii?Q?JZwiufATKWPrRx1ptsy02OTZkRX78JSTCNlYpr9JK7ALZQZRJtcjGiwsNfhm?=
 =?us-ascii?Q?8OC1bcaucP3JjcAhxiO/G6XVebhEOUUIqW9TZ23zVxpxFjeD3UArNjMVEuXe?=
 =?us-ascii?Q?nQSw5vHp61efYe7J/ODpyV27df/F3o9vFql7Dl5fW7eWdaGGmOMYKxlCF/PD?=
 =?us-ascii?Q?IdYZUpKN+/+AVRM8I93903eMBzL8gDTV2eFCy6wrSlnCiXAe07tDXfjS7drG?=
 =?us-ascii?Q?oNDt85qGeF4eB5XVqvZ/9ZZh4dAwjcqK20dvMQZqgJrwKCFSho/5/f146F3e?=
 =?us-ascii?Q?/NyXfAWTRjbXzoHJnuKwyjHPE/5BMSUp0u+oUcfc2G6ZosZLFVGpQKapnyB5?=
 =?us-ascii?Q?A0z9I+rkg39VdVB/NF/ZMSHU7EBMi4cCPdGKSo+9Rqslmz/M4w+bsZQcl5IS?=
 =?us-ascii?Q?k+sP0KOYr9Dd9J6S4KQMNe0v4rDZFqMtEF+FvZ0KkM9u1w7x2nGzcU27Lm+O?=
 =?us-ascii?Q?UUxIqQy0e1eOHU1JykPMR3N6wAT+FRPwD7K3auu+ieIpH6fRDdJodmDiXkBv?=
 =?us-ascii?Q?Py2xYTt3FgcZefTiHKvoZ5z0glVExO7TMspLfivwrsAYxFE1b5qfEVl4ClB/?=
 =?us-ascii?Q?5S+AvZlH6/SiO1v1CTJc7LBqBfmGmesqcYXYxb7F52AYsSvwpjFDQfdEtF2H?=
 =?us-ascii?Q?9q+DCSqICSoXTKmkEMQx75Pq1g62UP4B4HtRK/GmC4A2My8/YRrXF2FQt5/c?=
 =?us-ascii?Q?2d0nxi3Kdoqtevp+KpkYaIdYm14Oa14QC6bgtDsDkMmBG83wS+znU+8aSqhG?=
 =?us-ascii?Q?Sy91gl5MOODw/xr0fGxzz+RqJ4S8Knq5kR0cXiqidwZyh6uWigbENUJxH533?=
 =?us-ascii?Q?NWxcOL4y1cS28kDzmtpkxuqGYtk7Cgug5e1Laxw2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3a0b50-ab8e-4cda-880a-08dccbf4408e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:49.6819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4+UH7M0V/Vecu+xI5/neW35wzbcKE0wlg8ZxjFVFmgtdKna/ZDtZ8KCxR6JjP8EQvSrOKm7rFLbc3n+bbnqXg==
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

After udmabuf is allocated, its resources need to be initialized,
including various array structures. The current array structure has
already been greatly expanded.

Also, before udmabuf needs to be kfree, the occupied resources need to
be released.

This part is repetitive and maybe overlooked.

This patch give a helper function when init and deinit, by this,
deduce duplicate code.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 52 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index ca2b21c5c57f..254d9ec3d9f3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -226,6 +226,28 @@ static int add_to_unpin_list(struct list_head *unpin_list,
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
@@ -234,9 +256,7 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
-	kvfree(ubuf->folios);
+	deinit_udmabuf(ubuf);
 	kfree(ubuf);
 }
 
@@ -396,33 +416,24 @@ static long udmabuf_create(struct miscdevice *device,
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
@@ -446,9 +457,8 @@ static long udmabuf_create(struct miscdevice *device,
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

