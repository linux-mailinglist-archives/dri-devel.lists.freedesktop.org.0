Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9FA9E9A5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8282110E3C1;
	Mon, 28 Apr 2025 07:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="LR3Pd57L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011025.outbound.protection.outlook.com [52.101.129.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF5A10E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhtPrdOaGDuHtINCNC/98bEU2e4z0oRfx/On14bemJCEWFkMhCGXWZSkKTFEBxYQRwBeO3Q1ZEnCMDHpS9pYbw5CjRwEVJiR2Cx0zJqadx8jwW78s5LDZzlg+B5FuYWdLYZpO6xt4nP0lmFmS05clW8xtrCqon2oGZ1wqBi1ldrl+If3XOI+9RsAk0m61dOZfUDhhdpuWMvCixhH/N3vXs+eG+mtf5i0Rq2iZ0BnB0p6zIDqMYwFR5G4oWYTq5ilOtUGlehxOKm+bGI8gpOaSvaYYybc99ET5SGFi32iUeY5U+oYcwRHzEoSTjgxaWIHWQBHjLQ7XJmgBHAjyRFw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5zygPXH6v5K0gRIijjami72BuRI2k/5i+WkCw8IEVg=;
 b=mpQpN/YLFk2tVuamwSjSxdM5wsCYLd6ZMOUNUjumwlztPQNHQKZ8NJHOXYImetqEXu6EaUdYkBvirIBVHHbwoAFjpteD+nD6QlzyL2m1tsbdIpR0SOpb29lCxicG5Kw8w0JTfQf8xQRaDX8zq01zpxuzKRluOiAjie/EJJsFpXpUlN7degnrf9jOzF4SdSWIbdLOrcSWkqUip3hhr3xzxsCwvd5H/7//TvgiKt83VkW+zsMXE/B+EpagLp6fMTQqibyJV4jNROdHVNqWipURq/uz8H1ZIsHRp8Z02cU0Wu60yCcvu+SAFhoAALIe/Y8YnurkJl1OVe0IL+H9qe7C1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5zygPXH6v5K0gRIijjami72BuRI2k/5i+WkCw8IEVg=;
 b=LR3Pd57LPtBO+T2XAyK0L6ieny34VwieuFtytl8IPTI7acpSbrfkqcJ87Cur6Xxywtffzfd2j65CyqHut0QaYPRpNzsPaEBXbVn99GuGgh0TN3IMVZoxvacOoLk0TQWixuu3IxHLzWE1jehHTouv+p9ot1jsdxS8IzgOj14K315X82MXdAb9mdrMqrCKPBs6CuAt3JSI9W+DYc5hqNecsxguLMlcIGdFxzfekfmpR2oHbSHTv09uBdJJIR1qxtfOi+8YZWwyflS4fOOSirp+PiT+CxMN8JnuzwW5bj7o0oNUe7pe/Lu629u3BoSTGiq5WApGk/zqdAUFAWARmGBb9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB7093.apcprd06.prod.outlook.com (2603:1096:405:ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:40:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:40:53 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 2/2] udmabuf: fix vmap missed offset page
Date: Mon, 28 Apr 2025 15:38:30 +0800
Message-ID: <20250428073831.19942-3-link@vivo.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428073831.19942-1-link@vivo.com>
References: <20250428073831.19942-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f4bb34-2e4c-461a-39b1-08dd86280124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IBr81VFVJLOtE4SNMYAmXetJB/v1nsWxQu9YDOXkqdwYeikU1Q9a9pXT2z8o?=
 =?us-ascii?Q?3xestTT1czlyBK27icBi7BGW6U2/DQm23avT5n+7hiBJaIpPTmTF5U5mqNKF?=
 =?us-ascii?Q?lcyIbMoo0DA0/tzkB5EtsdQ0soZMFcxLKlcQzK+b4Rz/J+WTNtdijvZyoENx?=
 =?us-ascii?Q?hDTH2KGUcAEE8nQ0LtTTwbi6IMn8g82LQnU4tGngCWp6/5/+jFqTPAus5/im?=
 =?us-ascii?Q?vb8AgMpN0HWPs1cEDJbsO6u+j3Ordv4OvOqDblukiImHRPFLPsi0PO69AlUV?=
 =?us-ascii?Q?woPwZZllOqRMvQvwI5lZrVX8bByjfax4TEBzZ0mEtU7xV5hNoYOr2oPGkmmb?=
 =?us-ascii?Q?dC/0uwG3QmvjhR7mSti0QQ9X3WuLSWnx6SAc7+sDvMPsw2BVx2W/xJ+i3xZN?=
 =?us-ascii?Q?dCoSe7pgSfnehe1ZSaEOU8yfjR+R5TCsZkcQStGBfjJXHlzIH2nRjODBZC+p?=
 =?us-ascii?Q?PKb6u/6Qmq45yVaqWjWlVACkM34QE5nc2FQR/1ezSu/1hA/XXGR9fHidqD2v?=
 =?us-ascii?Q?uVtmx0BETn6++GL8JThLEZ9pdm3A9pa4U/857VAcSa2t9pUAz2rTMlhT+RtD?=
 =?us-ascii?Q?xhSHuwLXIIG6bVzK5Qup9vGObFweWGWROG7JB77qSxVLPM3gM2q5Yzc2dDNd?=
 =?us-ascii?Q?LDwNaeVVo0aMg0sx/IVWf9gez1fQs+yXH9reP6IMpSIa1pwmioJFhfgjk6s3?=
 =?us-ascii?Q?MH8IWdEIdKQTATvvadRrpmbm6512I0BbZvPuphOH36NV8llzCYu9SxFPhzDY?=
 =?us-ascii?Q?KEOpdPUHZnyDZDbNfKbndWJpvhqN/nWZMRV5N1nbdfu4HG6QELJDhjqlLyDs?=
 =?us-ascii?Q?BeBiIIYBke/UbkDb/3lznRvoIeu8R6L/JK37Ll5ptyXqqCAw4HHG2ZmJKKzH?=
 =?us-ascii?Q?KVZjUOFP+EVKWiw1+RVPv2Ptw6n5y1ZyQKL4f5eo/8Cg9nLoo+oBNQ3xHw6W?=
 =?us-ascii?Q?SdZJzU1DQrLzU/eidRlH38uXYrP8xhf3zTnANm803c3iElZdEWkHH0SbtzOR?=
 =?us-ascii?Q?gr9n1wm3rV7SQPTavFdDg9VZcfImoBKUUD57fcYTMmgWt9xnd64kG72vrofL?=
 =?us-ascii?Q?hpZCDaxhbJWR/ZQqjuX4VnpupMo4BZphfjWt8lpTLAGfKfzd25qJZ0uQR39v?=
 =?us-ascii?Q?6mIauNhYF/peoZhBF29yd8uehCL5yYjBdvsOLwVAsmqog2JGqItRI6SPJppK?=
 =?us-ascii?Q?jbKOAPa7EFJZcdt6gBzRcGgtHcu/GJbv1XsFGqTfBoRpmExrjGobx1x40k+0?=
 =?us-ascii?Q?m5m5mZGyi8GTiDASUVfIGaU9AhsSDR6OChoBYQxSFYf9fjuOQvdsDlmeX2y6?=
 =?us-ascii?Q?1dMidpAv+9VbV14w1vUswegkqZN9hBUk01Z8dDYzJumrcfbSrJ5RKChGpy0G?=
 =?us-ascii?Q?kvNM/6/jKRNhdAydpb/1dS9VuceqaVo0iLqKkBwN2sRE+J8pZMije6mNbjeI?=
 =?us-ascii?Q?il9Jst2YZETQluwAwYm3lJ9LC/engnZhG4yGCpdyBVCsY85m424fDIW6W5Dd?=
 =?us-ascii?Q?QIBrTtSgS2nmN+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GhAnbmOrgFrEz/XUFOo4Y+5p8NR+5Ist6tGUGZ6Hln2thB9YzaLS6ooXfdR5?=
 =?us-ascii?Q?arITYCeEZgcOS7YnBCvXCJUi3xElWmBcWDFhBppQHLu/TUEsrNREZTW9jwlm?=
 =?us-ascii?Q?KwwWfKtZ/pmLkqTaz7O/5YHbbJpZ2DDqSPJyEyU5uU93mDHg//Ypj85u4+l6?=
 =?us-ascii?Q?8UrQna2iP1F8S7KiYqTd1nqQjIzHtsXO1yGFgwmLETFUyA7iYMlHt1gyKrqa?=
 =?us-ascii?Q?70ARLRfjv9qTSIsQMYvUpG+hl5AIWV1CmoKt+/9h1eN/gie3oay7R/ZXjJ78?=
 =?us-ascii?Q?PwWl6jYf2y2eVEtf+W5gL3NgfqzFqBjP+1nv0jLgS1IfB61Jn83dsplVk4if?=
 =?us-ascii?Q?gzgAlkNizJRvWPfxRg6CN2+QjZLGnrgiNEoR5/qTh8x9khznW2nHoGYejess?=
 =?us-ascii?Q?Gbe5fcub2R6PN49l961PisJPVSVdLT8d+rjlhSDYQd0d6Q4bHD2jqKhQwaXa?=
 =?us-ascii?Q?nj1mCFxq0c2j5ZIablfK9jW302JAedCAJjihwVhx7ZlHA67NRmIoKjAa1j0H?=
 =?us-ascii?Q?uMFb06EADN/boAD+HnZWozsOzZk5ROY6waKfzxPcf6ALNrxLRJTbod0+NPRT?=
 =?us-ascii?Q?ssnMWyRuAI4qv7LycrbvR8gZFdLTO7Fi1ID9cqHKcpMn2K0nK/+4zjWEoHlt?=
 =?us-ascii?Q?jNxkH1v/dom6qN9sIj2pJry4HqX4XEficU0vktPwt76rO+yXpcle/9CJ+zFY?=
 =?us-ascii?Q?rfXb9edCiFC+VarSqGxt15qf4mJvapS/aagsLssVCW6X3i61e5eCTUj1+3pX?=
 =?us-ascii?Q?CNoRoCu4UMOYjfYE9EpyX8rILPnt1hEcpowC+flsb04BbB9kYJ/oflFq3/FD?=
 =?us-ascii?Q?u/Ikg1VNt9m4mG4AQhcdPDMMlvzJWzkcNWfxM4MagmBgqZ8P4u7J/y2SZmrq?=
 =?us-ascii?Q?0YVnRX0nGIQvdO9lFKALSATjYVc/Y6r8veBuXkU0hiPdNRD3e0NlDOzWSGP1?=
 =?us-ascii?Q?mx2yHCwoaZ/9MZWldnZE37hZKosisjw7H4Ml4GdvU87KWqxA6rP2U9uysycs?=
 =?us-ascii?Q?N/BKZlaeAU69I7AfcIs5n3+H3NCetBlDkhoMd1pY5Ui8kkDxaRNU1djPLwD2?=
 =?us-ascii?Q?6v5Igg1ioG9CJrxgzUW3h8qEi1Fr1UHc2vXVHtlDUl12veiMtBsu4+0ghjT3?=
 =?us-ascii?Q?aFGMVxmMUSjgRQd5BiIwnkBti8791g8yZbYdrYhWEBWZlOfMf9aMVqxVThwi?=
 =?us-ascii?Q?XH0C+Sc/9k2ZDeVTTkJeIf0tPndvNPFIIqJ8xcH9DTn+Ai4hhnyizIR8N9GL?=
 =?us-ascii?Q?0as1gczeg5SQhxMIY9Y0tm5fxQEtaDyllP9Er1pch83ANd1erjm6kqPXH9gU?=
 =?us-ascii?Q?q5b1Icf4Nw3/RsPp89fwX6i4AY0euk80FV3o8qhtPQRx03DO0yftll9uq4J8?=
 =?us-ascii?Q?VAHdkSEq5NMdvusAMt2adQpudKDhbz/etHcPNhy9+ioLpXoGF38UKBBRLEFy?=
 =?us-ascii?Q?7l+JCB2KjDNE/PHj6bcLTkYCigOn8Pw0wuZgHvV0NE1C+wiyn1W1lPEn0va4?=
 =?us-ascii?Q?U/MJnReCuiL+EDbLy/3u8FDsDzrHPF8epdOWC9BaoKq3EIHsZ5uvaPWFBhT6?=
 =?us-ascii?Q?4W2uxL2G33du2+GJIsi7dK+9eREgX2fCf8Ejtn5N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f4bb34-2e4c-461a-39b1-08dd86280124
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:40:53.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAS1IasSm8dsYgjIFUUTLEYQEb+3GQsOiYtvKnEtFqC8J7v+AMpKtKeW3mkkIJwcLPC24cbxwzcMBhMk8Qr+vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7093
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

Before invoke vmap, we need offer a pages pointer array which each page
need to map in vmalloc area.

But currently vmap_udmabuf only set each folio's head page into pages,
missed each offset pages when iter.

This patch set the correctly offset page in each folio into array.

Signed-off-by: Huan Yang <link@vivo.com>
Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
---
 drivers/dma-buf/udmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 79845565089d..af5200e360a6 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -120,7 +120,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		return -ENOMEM;
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+		pages[pg] = folio_page(ubuf->folios[pg],
+				       ubuf->offsets[pg] >> PAGE_SHIFT);
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
 	kvfree(pages);
-- 
2.48.1

