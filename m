Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA39429D9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 11:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214DA10E103;
	Wed, 31 Jul 2024 09:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Mp7UU5oK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2082.outbound.protection.outlook.com [40.107.215.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4BC10E103
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 09:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS2oL8DDGp5lpQpEetRgcfLQK9B0Yl13+oyUx3fGlXq27aupo0oE+hnhOxgTWLRF7TyWUGKaPaF1qJV2vNdTGFNDT8K/Df8wsRt0WJsfezUvm8MT0IcExyL1cdB8ehbD7C02h48Sh2EbgOz1XAsV9xpBJHDO+m44iuY2T6CkAMf/C0NcvLTycjdMNdSwrlwKx3v7qSW+j1SNAvxYNirZO8jito49hsU7F+R1mbgpqtAeBFAyxvC9jfnvi8IS0CI+UQF392FU7f4CrHTP/XGDIDpEAFTVz/3kkZARN23+wVE8Nr/vItLVe9EVXt0leFKo5zjHOHqwTDlST57OXYCBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nn5gEFQG3ouo3UIbgc1txXVuZpkTgkwJnnt2k//NsA=;
 b=iN5KV08zmxmc61NOep59GgSGcB0pYsus2qU9yQCi0Trr9dRZ3rmKjAfYwRivHp5sKYbu0fnD3sGiDtXL1rf46kJOkP2A1pltfDmaHXGnopkJhYsiuQMt1ZVEvBirdulanPRtErlRfKOmEVlzfuRzvSmxFS3YMPuQm0iKTBrJoWnQ8sQ2QMyY00ju0M5Kevv9SP1zzjaEUEVTG9KURGQC3dSORrmFbUfFXd8Ejm+Gwffh5j1Jc7l2KYG3X4t/vhDr7VwtaeiqpBp99HDZO527gHZpUomBc1mFOFtoINBzRTU/dylNgmle9hOV492mo3E+CZjmy/4pQirfql0Aqg5Wqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nn5gEFQG3ouo3UIbgc1txXVuZpkTgkwJnnt2k//NsA=;
 b=Mp7UU5oK/uelY6JD+jYF5eTgVgbGrHCcA1kFb2DMeP3iGRGRl0C472/MhINz8G4IHz/wDuC+L1JP5Pw/B5SURz561ZuG5Xh/NTy08CexB+T/A3Rb9xT3BL0EiZyDfqErJfM8/nQ/dEmvZVeBTn2PXW3mmTzuVkds6VjxNm8AHR2CFuxt7xh/+1sIRtVw8kLP2t+BfdTap4VikqfbKoVlZKTFWE0E6iS9gdfL1USE5SyEibXqs7xjIX/GHINVe5bSAeUUcEJgfm2KHHHqhvbyqCOEtGbBApeBv2weggIfFWuv6Yq8Gx1QL3+yl3zNBTAYYuW0PeOcqsxMYMKmt1kBJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB7027.apcprd06.prod.outlook.com (2603:1096:101:1e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Wed, 31 Jul
 2024 09:02:45 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 09:02:45 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 1/2] udmabuf: fix vmap_udmabuf error page set
Date: Wed, 31 Jul 2024 17:02:32 +0800
Message-ID: <20240731090233.1343559-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: da3641f9-83ca-4682-8275-08dcb13f8ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7xb+3cbzTmXGoIndO2ZS3oaGa5ldAwJvUaUNE969nomGhzL62CcdiqJ3vCq/?=
 =?us-ascii?Q?iokYKiW8sLqcY7M98KK4qShObLz9jT65jc7vc38mqav9iY81dcg7MyJ2Hd7g?=
 =?us-ascii?Q?lD0vScVkY7mi1opfhxLyItcsR7cRv3u/nMzlMdbigE7K7C5HUvg2R1zdcCza?=
 =?us-ascii?Q?wMlA+ZKEIbKRaT50ZLp6L7y9+IanaMDIre5vp0gNG0Or8V69Ez2Zvg/XQOsN?=
 =?us-ascii?Q?EhrxjZV5/H8LbbbeaDRm/rWfVD+SAhKbw82ddimoMfdqmbTniIR9AShrg6Sx?=
 =?us-ascii?Q?YdTfqgZKAiC3F5PlcSXXI/DYBTlr/keZG5JaWaZiLIxEdag5yIaCgr9QqJ6F?=
 =?us-ascii?Q?VDlq0v/aMjYMMiUkld66W1UAH/Gd1paEQqWyEoVX4foXVhMcqBcRcl/jpUKZ?=
 =?us-ascii?Q?gRDtJ+weA5XtWdIMb8nowLiyvCN0ChPHXdZAlmd2IqH/h71jJoO2X8j8VdSU?=
 =?us-ascii?Q?64BunuB2elyy+c0Iu9xbirkWITnWD6h+XKON3L7ZKd1ruB6av226MMiFnQbr?=
 =?us-ascii?Q?R1qOM5IKiBwM58OdGt+KRTHS0oKtHUcTABVcDvI81l7vrmIK85K/6ViwaZ9U?=
 =?us-ascii?Q?FneEDZ0f/fMWECohPeFsnKPXfdvyI1qamWpSFnHsVkabadsDPZezEm6NUZbp?=
 =?us-ascii?Q?p6ZZRjqpHu6AItU1DiIzg3M7ECUbKrGvEPny8RQEjw6YwrEAc2SbaOfpVzWs?=
 =?us-ascii?Q?Vt0G7gLrOjeKEVfKbQMWW0SUYrANuuEdVvCtdTHXzyMoiEVE/QuY1xmawIES?=
 =?us-ascii?Q?L/3jkjFxtZ+A658QPyRgZvUt1tnCyIZdw/d6q0c2kv/2283TXeC4scDOstV/?=
 =?us-ascii?Q?Z/1r4kvXHBXadIdlWc9Mwx6xQspeidcyqUGnKLBHvlY4i4Sw4yUGCpEYytNy?=
 =?us-ascii?Q?eZU5mt9I4aGFVGfEKvNq2GvT5UWi97ibhLFBRn3y2JXJrq3Vw1TFI2dRU1/2?=
 =?us-ascii?Q?s5M1Pvu3fjl+Px+d/rTElY8l3SUz/nLeYILKM/A9I77tdkC3FzAYhss44+tu?=
 =?us-ascii?Q?zvGI9FjpMEwlayNjkRiHn2grel04/o9U+b+R5YrAf33QGW8xUe4Sp413GYI2?=
 =?us-ascii?Q?uMJEVCmrAPW8vTyRG6TTwYKoKPX2koQnTr7SSgW6JHxFItAqFYo5OwGmIgzI?=
 =?us-ascii?Q?BKOhxGlEX650GfSOgWOmIaEQhl0oNZVT2nyLd3TmL8J3DS6tymC6gGKEUDDm?=
 =?us-ascii?Q?A79X9x1cnD91Pt4Id53mMJq5nlvXOT+qPxxFwkkKlhCJi83ocjTMMm8APkno?=
 =?us-ascii?Q?ImCxJMbvtx8Auz6uo3UzeNzVowZCj6BLDSYSZgIRfuMnYvagGFfQffTKrpZa?=
 =?us-ascii?Q?wKFau+/iWKPDw16rAaWCBgs2n6PK+8uH1ONaQg3Uie6Ysr2lR8tfr9cVsFL3?=
 =?us-ascii?Q?SRxCoYQZ+sm7uEYLwYJnkgA0H+Xl479YDT4CEGOR2mssr/G3oA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q5KE05wV1J/YUUcn+hVGAIeQQbhBzuKBCd1fXgDHuCmdk2uQJqY/qnidX0AE?=
 =?us-ascii?Q?qyPAwDolr13CiMX+foUFyv0yQYChnxHv5V7OkddX7T40vHsXZeeqwpGa5UJF?=
 =?us-ascii?Q?TCp2TbNcR8cr04Y84zzFot2MgWJBWvBUZvoMr5lakxGIz0be0Z8jsYRrY/sY?=
 =?us-ascii?Q?Ik6n/2remusV03mpv1ubIP+hi48dqhux0TUn3Y+asWrP6khnD5BP7a1s390x?=
 =?us-ascii?Q?xc8x/GXtTQ5WU/BlkWLuMAMZk7xVyzlK2pawnvFd9EXTEdGi7/0DSWdbNM3f?=
 =?us-ascii?Q?5iaqfzYiI9hPC5jkoOkM1LSWt1E7Olr/4Yo+NhB5ZeSAuG5iuB9Xz1QRMswb?=
 =?us-ascii?Q?3DPdhObzRjvqdPoY8pOBrw79Ox9dTo/CWlgFoBv+p7IAqJIckPI2JqHnl0qa?=
 =?us-ascii?Q?bo5bpLIJMVgv5G3XbsRQwYeKVJli7G9d8eFrGB/l1bNBmLH16tA9bp62CSJA?=
 =?us-ascii?Q?6GGOh8dF5bDKZ6iVThVHl2bO8Ic8/o5tgDjsRQr0IvcJincD8t3R9lfO+JzY?=
 =?us-ascii?Q?bpw3ymnUaeHAlRLDjbIHleGaQZVifwy+4b51LviAaMRhTTAD2lLIpJmn5Np1?=
 =?us-ascii?Q?68IQijbxHB5ESAXCjunOLkLJ5295y0l+wztY12vXy0IDfyzJG6tMOHqRvhX0?=
 =?us-ascii?Q?B8/VA0G6fkaolcdiNOrg53JNdSplZRKLQgysbGUWAItuL5b0PdiAsF7ggrh6?=
 =?us-ascii?Q?0do/7BXGSpMCV17zFEeTBRA+/tI6FAx9UeXr0UQs6QV+XRMiIs7MaqcRDrLq?=
 =?us-ascii?Q?HzN6Ay8TTnxz02k/WM5TejgQlp4R7to8+zAEY9q9/rfgME0AnTwesJfAs0CB?=
 =?us-ascii?Q?Ee75opgEUPT9YMqFYTL1B0pTip8gcm61EmqDsjCiRdjiHQoti0V14i32W4dx?=
 =?us-ascii?Q?LBTjcw+ZWO3btFDG1fYKGEiuibRakreWOnlx3+s9qI7HGM3I5rY6bjzLaK8x?=
 =?us-ascii?Q?kr/Wl22fkVVkNOlVIhWN+B3mmkqJNM/0rHZE6YEmT8WNC7wLGLXBdyabsUkI?=
 =?us-ascii?Q?1XA1Z0fdPwKbcepNnH3xjjx8plOPxlLMVBlv080ngID1VkpJ7K+0ybqJbVBO?=
 =?us-ascii?Q?fqFPAlSg/1q9MZQRszKvNxGeW28Bt+cEZHxO8LHTf+BA5ENr4l6Jd2aw59PE?=
 =?us-ascii?Q?qtxbVWVOMQ+2dGzW4GQt6lry/6yyzr3Qw8xrpNb9wO6YI6gPXKu1t77zbltJ?=
 =?us-ascii?Q?jHXkZIe/RUDVInwChck8NJ7cQYeTOORlZIpXre/LFAbjJxFEjx+H3GTGcQ9q?=
 =?us-ascii?Q?F/KJWlWb51YarmEJ1R2Ve3CrZZlD9wiDA8MNxJcP2i576jT0izjaPoeCNreP?=
 =?us-ascii?Q?1q6GadBeGVYQGc8QWkM5CvNCM9g8BDYtwooaHIbmz7zNRcOgAFDB78EIeS56?=
 =?us-ascii?Q?Qcc5FEvMKRdNAmT1fEvX/FEpq8AYxvrtGsGwDPQDOtyYuzFY/z/7XkY5Nx/z?=
 =?us-ascii?Q?a75eTroCAUHqOyzv/Nz2pZFloJve4PEZH/csXLVXrxEUO1GaX91K3xDx1P+M?=
 =?us-ascii?Q?09/w9aHiQbJ3rX2chbN+w1X+s7hN4ozMwN7gbf6/5im4ts6TCKjB7ZLjGeiQ?=
 =?us-ascii?Q?vaw4N0KlNgOGZQa08FmzqpOaRbDBlnztIo9L267W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3641f9-83ca-4682-8275-08dcb13f8ae6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 09:02:45.3951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuiiuONYAJJpJ6oaMvXtUSeObgbbVwFbpebQVfbLa0SVrAjg6Qf6DMAzBYSFrdbT8x/lVwkz6X5vDwNVYmMIbA==
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

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

This patch fix it, set each folio's page correct, so that pages array
contains right page, and then map into vmalloc area

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..6604d91e7072 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -85,7 +85,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		return -ENOMEM;
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+		pages[pg] = folio_page(ubuf->folios[pg],
+				       ubuf->offsets[pg] >> PAGE_SHIFT);
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
 	kfree(pages);

base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
-- 
2.45.2

