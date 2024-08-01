Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A148C944996
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B08110E8FA;
	Thu,  1 Aug 2024 10:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="DdOHWUFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD5310E8F6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+G3EyOEXo73JkPiG1EmoXUjznVxcuxHItWBS2soK8fN7vkc0A0Wt156uTQbaxaiyZYtcgnV8wD8HIHeVSJFxhtMS+8EVY75mkqOgMjf51cu9wySZAFUml8XOJ9fAlaBlbhgGARhQ9P/gGc24NSRVigjCaNwh+pTmv6adRvS/EfSPDvkDGsFw+GjgGFIybZPJEttFVOLOuaLAI0z9Mtreo3aryPFOPt/byIx47wquTui4JnbmEeOPO8SAMFPTEwfOA/9Eq4Bt6Pk6hC3BhFD7gXm8HxTmgaBIx8VsHQmSwwDgFY64/G+qlq47FJJh8e5pUZ7R4FuEeF2ImmZmXKzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWLnCdkp610v5/9iVGLy5wlG5gZLG9AmQrLM+9Xbh9Y=;
 b=UJzeqNpBlwWE0mWF21YI4p8pRKUvoiRDoUJtLf7macvMneHxUXS8Ov+uzs58OOWRSP0fKGY3oFVvHr+cRTv4VMNjTW1fhtOtcOCmk3f0ReSSRuE73jU29cJgx2f6ESYV1HOg82bgsrKtKIofHAcNNTMtWg3UPaMWtkDW3DspOCtCP63deBaApXb55hIMOovqz2AFOgPGeplqnnLAXQNZ3l8hRKEVv7vqggCqKWvrb65/QfCPTkf8+hOPOw6xcvKYiYPwc/kkMlJUBLm8PSBUYrG27DkFVXE/mBGKMJ9bAXPT48G3TYSIAv7zYETS1kGEFZnvDMt53G6duH0jU+iIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWLnCdkp610v5/9iVGLy5wlG5gZLG9AmQrLM+9Xbh9Y=;
 b=DdOHWUFGFVCKodCcWwtLXvRC9jNIy7TmjQaU/ssgEAYr3xc7IAfVJQuKNdm2LMAhauf82Lpr6a35v3fOieX+rOuF0xoK3wua7SFDK/bGU8qHSgpSAUdnhYC6ZXH/tc3FjgUPgClaCbd89m/F1qGFG2fNeFxI+Zgkotqn5rwvB6OjT6l9lnEjLwt5j8DR47O4ne0jWBecHCkEkSBcDRwQt2D7312tEwihhMc3h5r9aXFPHW6cZPB0/SL20gSmprBZ07zQVIxTXiaJTHSqLCb3UGQtyBS7GhqKcQ8Q/SoIqcaCuo6GF4QIOP2xgyFAZgAX5gHp+7Ovm4e8s5ewh08ByQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6304.apcprd06.prod.outlook.com (2603:1096:101:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:45:29 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:45:29 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 3/5] udmabuf: fix vmap_udmabuf error page set
Date: Thu,  1 Aug 2024 18:45:07 +0800
Message-ID: <20240801104512.4056860-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801104512.4056860-1-link@vivo.com>
References: <20240801104512.4056860-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4719b95b-7ece-48df-94e2-08dcb2170fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PMm5e6bHf66DsFkQJdP5uAMmAv5EhKxKPkW0s6tEmGaYHBqvjkJVrHrdPY5z?=
 =?us-ascii?Q?y7d/czmrvW9AI9871xjCnpO8sYFQJQfzyR8eeKplur473qUtOOytO7xlHfBF?=
 =?us-ascii?Q?+2wOyjkvEzlXRYoIBZZipp+xiK7pmIyENyYng4oBNwVErc4kEq/G0ZfBPe2b?=
 =?us-ascii?Q?SKdUspapa7WrlcoS4wqVrqj9xryQxXHIMrok3oBzOZ95PtNHEIntMrAKr48V?=
 =?us-ascii?Q?N2jjoQm5/yeNCowQ9S3PCiIUwK796Q6rYCSj6pPaSMZqx71UdR1Eds4Ya7F9?=
 =?us-ascii?Q?0QCuuF40NVmse6qWVEEgvqodSw3WssLRE2yclvG+sXTNqrf53BFMlwnA+0SU?=
 =?us-ascii?Q?RHYiWjIhzsgxIi8c20Vrl5lzj/B7g5QRQfRhjUP4RhUmMNTlt/kq+zO3cXFL?=
 =?us-ascii?Q?XW8uh9tqMvML+i6EfQWPW33y1Ta4q95ZmoCUxk4Hp/YGeXZNr7nHUURV5WnO?=
 =?us-ascii?Q?ZVVVn6QxESWLWxseh3AapPE82X/LlmjbGJZEEzrro+4rxu9ESpaRUOqT0iPh?=
 =?us-ascii?Q?Q3HwHHqcpr7sOfgIhfxw8eOwLAB8BVLkFNRn0VY2jLb8ueGY0oECVcxxTmGS?=
 =?us-ascii?Q?BWFkrT+AJqpNa/WPmC7WwEOM9ssfA7YA80NssAZi3u1o77WVM7UYZzUDRZGt?=
 =?us-ascii?Q?mxcFrjaHRhEZyFhVdst+4T6m4qVzGGToINuxIvx5fQkxC8gwXQd4Hx8N87M7?=
 =?us-ascii?Q?LDx4NAFdAdzsWH4SPIVcK0RMHxisomj5Q39AciOSnAV+X1E0L44HOAF3wV9Y?=
 =?us-ascii?Q?gcCwH+r0G6g1OEZEPS5U1pMYYrPTbA02JWhOMxVmubaYkJuA0L0otO2eJgc8?=
 =?us-ascii?Q?oQcO5wqgGDS9jeK8ATIngUfhfHB1ObTZHa4Yt0LP0+G3+jfX2PPx0uRjGYH4?=
 =?us-ascii?Q?RNdRBv3neZkTJOx84Wt6n/bsTAVGOlpt2f6bHfbwBxWgK9HxNj9She+YxGvB?=
 =?us-ascii?Q?B7W6MhLpik3DlT9pOShTuavjtY7t9Dl8jeI8pHk8dTFpq2uvE6am/AXkZwnw?=
 =?us-ascii?Q?7Qvnb2xxlbfARk6O3APU0eMoJ3PQCV9GSaj9QwkZ3urC85zFWCSshx3ghwmN?=
 =?us-ascii?Q?jgha0zqcDWN6kvc4MArc/Mb2emuG85+TRKQ82eerFX0T/qTrxrdg8dk8/yoS?=
 =?us-ascii?Q?0dc+2abeDdwSrp3KLzuIUytn0cSgDHGHyrYmK5yGSxGUD3Vso5x0AiebmTeE?=
 =?us-ascii?Q?Hsgqgwi8QjnzRch00Ri07orfj6FkGB4F2TUeAZRR5Nt6aRVFrhHhx1LteFIQ?=
 =?us-ascii?Q?0gWgFjgjnsMOnhZadZQ21eJai9jDnfSXSyy5XlmkeUxtvscSOgkKIAGLw0Ct?=
 =?us-ascii?Q?XcVm5120tszvFR40h7gVv14qiNejODet5JCO+Vgb3WtLffmko4iD68kZdV9f?=
 =?us-ascii?Q?HwmW1n2EzBK679072WLsomheBChpT2aONHmgOCM8U6BlKaAxoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utMyP9wT6KRPW0toEjXI93yth4JkGI6xr15Dw28av04eqtuRZc+VCiwXnhXp?=
 =?us-ascii?Q?7lJmdQoxJZcaCt+ZCV1VVdANR6sYEEF4iIx/utEcAUGIlLxomxgR3O7gG4fY?=
 =?us-ascii?Q?wv5I/ifIht8CywWwN4A4axm7Vt4hj7k306Y5YKuvAuA1N6MD50hma/T8Hj/q?=
 =?us-ascii?Q?S5tp54R/ohBSq5eCCU7fKo6XDxL8MmoARLwV/7L5jZ3tVfWyDUKYG0HNPyv8?=
 =?us-ascii?Q?KDvVmogOrm8tH7LL8QpvUAmaVGz6ymSjsMBvcxeUbkkRMtuhUaZ0KJwSjJmF?=
 =?us-ascii?Q?GdSkaeNmQtF5lP7YONMRWBfvcr5po97nImy/eRKFgU3fndpqKeEmF4VuFlzC?=
 =?us-ascii?Q?+UnJUFK+hE/n98h3cET9deGHXuyIvv62k6IJabQoGIWYlLvxbZAd+0YFaGaQ?=
 =?us-ascii?Q?xft6oO+YrgYgLhwrocVl+31rgOUJqrhm3lBybb+KsethNjpI5WYGzL67UHnM?=
 =?us-ascii?Q?ehH1qevOl2r1tKXsJMQuLeYoBf4uUB6FBhgYGwYiw706fBPwKyddbpB+6+fM?=
 =?us-ascii?Q?WMiW5clQCsc1jKMLjDqOANLF6Hyx53NJ8yyLCDyDxrNtyJhrctkRyNGnEYl3?=
 =?us-ascii?Q?mGrLzuHnCs1HHPNergSxu0gyYaYg6IfriWbZHjnM3gu50AYFc1+rjReBnCtc?=
 =?us-ascii?Q?vvA4P7tZRI1fkIZICmnYJV/1NPVNNLBlk7PMq+2gLgYq6t+H1CfbL3fgWG72?=
 =?us-ascii?Q?m2IvScn8ju4sVQ15EuQoDomBRootH/mhGk7NXeDuWsfA3BiU3XdhSXdtVH/X?=
 =?us-ascii?Q?WLFxmu1VHlFv2AEKsOztpKJBbzvR0wegC6FkOe2dn57H9bhMDFU+foA0QVwN?=
 =?us-ascii?Q?PQTQhOY0ZwUE7z+lUG3zp068U+PlLgVVOmB8b3l729F1KgeD9RD3HRkVHQcs?=
 =?us-ascii?Q?Og9see1iu8FNy3vms3ydP2KD7T8SDGzrPahUMXdgxl8LuBhG9Gq6JR7JW7kl?=
 =?us-ascii?Q?Ee2Mr6F3QW5C00IKKj5Z4LhIHeUGY7BJpoXqn89zEvFWRMK7YZDf+0lplMDv?=
 =?us-ascii?Q?N0fNiN1qhmVotmK9y+aiZyyv/3H7BHRCN/hwiMoaFzv+FKErFA11rZ39U4x6?=
 =?us-ascii?Q?1NvoIux3B7HM9lB23TykJbMJg7DwGbmmnMoctDbXc8NbhHO3c46zt7oKZa3S?=
 =?us-ascii?Q?BmA1UBsScpEVJmHVDaTVPAGhT76HZZK7eSSXj7Kri9wbW/8e8qLH3GlF+AKB?=
 =?us-ascii?Q?Zo6ns2O9lTHQajXpPc+KB+7BJrWf3MxLGQ9CflFzvIQhCk46h5+io/x/Xq8S?=
 =?us-ascii?Q?+AqaiXpiZssQ5wZTXqk0dvIYiwB9Wn/JQrJV3mGYrOgCneuHaRXn3XNEy+J3?=
 =?us-ascii?Q?QfXPEC2xkjB51w/vvKHtoh7CJt39CPSdEXoesRwi+ln0QHOv/w9KmTjVhByM?=
 =?us-ascii?Q?FhC5upUn7/Q6eqPg/1ObZaSvkxcVWJAjfcHqZOvjXJ5rV5rEt5mS2uTswCzU?=
 =?us-ascii?Q?dIrp9cyVh5sKw06ZshqpbqurHemH2yX3y3Cod33tF1KndUUyEsaHOPfMwxqa?=
 =?us-ascii?Q?Su7P79K97l9PFp8bN8cXVtnB7dKdWxlNupCT1HB6B/xEgpbMfa16WukidURP?=
 =?us-ascii?Q?CKmANBNN4aFp5tFjBjONPZAoLWjwX7mZxk3ga8CE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4719b95b-7ece-48df-94e2-08dcb2170fb6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:45:29.8643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zr45C1J5ovY7QqR15omKBELEuOiRRn/bB7mKz0UmlWfWwpaLnIDuQkvE/AJqF02gI/bA7b15r4kSTDTLeQvOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6304
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

This patch fix it, set each folio's page correct, so that pages array
contains right page, and then map into vmalloc area

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index a915714c5dce..7ed532342d7f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -77,18 +77,27 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct page **pages;
+	struct page **pages, **tmp;
+	struct sg_table *sg = ubuf->sg;
+	struct sg_page_iter piter;
 	void *vaddr;
-	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
+	if (!sg) {
+		sg = get_sg_table(NULL, buf, 0);
+		if (IS_ERR(sg))
+			return PTR_ERR(sg);
+		ubuf->sg = sg;
+	}
+
 	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
+	tmp = pages;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+	for_each_sgtable_page(sg, &piter, 0)
+		*tmp++ = sg_page_iter_page(&piter);
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
 	kvfree(pages);
-- 
2.45.2

