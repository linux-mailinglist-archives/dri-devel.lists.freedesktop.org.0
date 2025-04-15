Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3CA89274
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 05:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C96E10E06C;
	Tue, 15 Apr 2025 03:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RtMIpINU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011006.outbound.protection.outlook.com [52.101.129.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6FF10E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 03:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh6Rz9bs1fd1XVIvN1wOIIb4ZPPyxt4IY0JuzaAxnXgfiC40MLqkyOo7bYJJOXFqcyUF4LUNp2o4f42tZtXtcpnbiJuP4iUmlI9bueOx7ubL0IizEZlCXDzLf9hpbe7TsDZWLtQWeOWM4MHjZPqLzzk7776ce5bdI7RlgADXtUSSi/yVfuHBZHDzo+s+jY2b3CAnRAkqUhAZXVtedX8pTiCihVhfdxqNamVOamo00Wov8zia5cMhtICSdwR+gcMOMTe9WEgoEK5WxZYVPRQriFasMaoPhCl5hR5xvJsnc5fBLzRWeaW7iTHhIzXp8R4AAOTc7jabGQHNKMqMgTx/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5zygPXH6v5K0gRIijjami72BuRI2k/5i+WkCw8IEVg=;
 b=fgE9OCQoYj438d3e9POCDcCJAmES0i3ZrYXudc0zzXNoPR27qLWK6sG33Wu73ZWAgeCvWTdE9VqzsrgQRyYm/CsFOR8OJtMM++ormxXAh+7cwYGRR67xIiqE5vaeDfrv07XMc7xeCuk+7iLyQVuHgL6AvnMW7pBLd+e64XwVA8yqOnoWv7aNu7v7ujWT7KEQMfih15xQzB6pn6cIMHIfUmvrZlmleZdsdwi38gspt36cgNEIgg93ruLMUqfFVCL45HdvXAE/fxe0NTpY1sElLKnv32hmetyotEJwCLsYJJWTMSuVnl6g68GWC1s009AE9WB2GxA27HT3EW6BOqkewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5zygPXH6v5K0gRIijjami72BuRI2k/5i+WkCw8IEVg=;
 b=RtMIpINUM1C2ICLMG7YGODtGlfZ0te7jMrUi1F7DAOoYHQ3aiVosG1j11Hgk8vJWGh88BYXjOqQzPZoD4b5D7VyD6b/QzsDUGBy69pmZFs/iVoJp+ZF8FLaUjbp5e5uWHOhx71JjsNPOVKw1lCH+fSDO3CAR1gVJpnpgPddT5T2WwU+gDjg5c7kGExAeImJSbQZr1Vi3nYX7WQ1xMgkNNHbk/qHVKPOeZLfHTOATl0Mb/Kg7z2jDYFkHDwSz48rRxSJViyekHr4NCtDiJI6Ku9pkTrUHCBJ6c/6yd2g6KJQdZFjGsvyf7D0S+7LwsW70Fxj5utfEuZER9oQCgQjWpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB4984.apcprd06.prod.outlook.com (2603:1096:400:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 03:16:24 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 03:16:24 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 2/2] udmabuf: fix vmap missed offset page
Date: Tue, 15 Apr 2025 11:15:47 +0800
Message-ID: <20250415031548.2007942-3-link@vivo.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415031548.2007942-1-link@vivo.com>
References: <20250415031548.2007942-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e410317-836e-43ca-3979-08dd7bcbe74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NwgMjPXX2ewii741mlts7leT74NXp+5yLSsGZRZORfahOi5mvyBMmNTqQBUo?=
 =?us-ascii?Q?T7Od2Wc/RwmhDjtiwCHC1FJ2jQC6p0pEVCuDohkJbYh7NAxFR93CKYVhndBH?=
 =?us-ascii?Q?f+gCetn6o8AbVqP2Gzt7v6TiX9bQmbyn/gqmNzWceXXDxEiBsJsjltlaJ1w0?=
 =?us-ascii?Q?AKd0sVkHovB6Az5e/JB+FffPgekf+xxQ5CUKPWysXE443rculBQxGWgQiAye?=
 =?us-ascii?Q?wARP87Ku/Gfb33u4M1X9jI8yIGHeMXJZlWvPAz6/rirO80oXnlFi7YNpSFqB?=
 =?us-ascii?Q?rb59jipzsFX/WenRrsooVXAvRMcoUj8npD267VVitT5mIVCwg0mxnidnqes2?=
 =?us-ascii?Q?IkoERH67kKyJgH4VXc0Px31xZDOmg/CAVbBPZjdDwOb1OlkKmTVvgdKNC7hz?=
 =?us-ascii?Q?wwN2+9nR6pUXoPG0Yg8Suht2+iBIZXNm17CGjAVWVsP1FP3n8JQ7Aibd2dB/?=
 =?us-ascii?Q?YKYJIungGxpWf5SxGHVM2VyoyIXLQH2cPUhmvxGJHeapJN22NCgYCt8YFv7H?=
 =?us-ascii?Q?GSkDsKe4SEY1BFBmYpSovFFnw7YZJ+5Y5wQuQWRVbnhNdWzfjTNqXXSBD1Xz?=
 =?us-ascii?Q?RkfhRjq6BTnX1Dby1uoh5ZfxijEtbG57NbmeRNCgCrRPSrvnGQzXmCE7mioi?=
 =?us-ascii?Q?yW3tIt62XYTFV5z2inExX6IRXaShRTmaqr/IfE0fQfgpck8jLDeJuXnbqMGQ?=
 =?us-ascii?Q?Bcrke3wgximdcd3phbI8aJBDv4t8zAysOsrkq8l90UBXSImc+pv+9u+Djwig?=
 =?us-ascii?Q?INS8w08wO6kVZz6rnSdiX0YHCCDZH7y0HiFevYEDP1+uOk3XkhqnGOuhatVC?=
 =?us-ascii?Q?uzzXKRgWR896xT1XURZoyrJayK8DZXovE4Uj7Da59GrHgxyCSR1fF5rMAGcp?=
 =?us-ascii?Q?Qrcp+5zCvkbl3gp1nTYb+gMszCd2rzHeoa/ATPbcYJARttGfR3gIwxJGREY5?=
 =?us-ascii?Q?MjusQxHj8/0PtK6jbUq5Fvql5aswxB1oALmVjZkkg9fK0EDC1mdAKDla7D3u?=
 =?us-ascii?Q?8589YmglkQiSbbObDGDX8609fuhwOlgUINzQQRbzetOe+E8GuV+NTsGJzMz+?=
 =?us-ascii?Q?k3m1kBMDW746eiQiaUjaU/zkJdD9plxpw7SMBOxlhPma5XA92+SaegdN8LVn?=
 =?us-ascii?Q?wkjX7xpWISCo7gVdwQXHEGaYqgTDicDIR7eHoCvdpFKHMLr1XDwKadbcFN5x?=
 =?us-ascii?Q?v4ZHL7oUFNXox0VAhj5HLkgRMWW1d5N7CoPLaUFOk0wOc/X31Zxw/UYXlZZT?=
 =?us-ascii?Q?dDq50sep0slaTvWhHNuRmo9gf4hYfD+c68oXVYut3PMgiTWovkMlZz0AFoDY?=
 =?us-ascii?Q?n75yaybJKNAli/mMecY8tMAxJn/tB/XT+zwkjXOWEnN5ZNfpRIaa8x35Ra5J?=
 =?us-ascii?Q?JMQXcEX/j0P0fkQi4F9UOyFjGzko8cYnfESOvjQCTXQXxTCs/1e+0/xEthcl?=
 =?us-ascii?Q?WUJ2FFEjJlcbLs7ur2l6VB3I8+0DYYWtNQnCKIXwLP9tZQLxBwhuLl+WxGrm?=
 =?us-ascii?Q?p40gO0Z1vJdQHWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?My4zz78rWETKkTmPfqicczH4dHT+EehORJ8PJ8yVkFsthXVnP3em3rHAkh1L?=
 =?us-ascii?Q?XFcLQU0C3qdXz4W9po7Sl9IqGzrLqjAzk4uFglKgBaWfpPzW8zRIp9DPpDAG?=
 =?us-ascii?Q?/B1a3jDzWqYzgnZipCfaYAbxz84bIIvkEkDZTMKAnn5pS+PR+D+6FQ+2Qr3p?=
 =?us-ascii?Q?i9/OtJnvXKVLDAEv7qMdfJp75peTvpybVxEnWa38A8NJO2dedUZLnJNX4s6A?=
 =?us-ascii?Q?W/imxkaJvEQGPTqhgVNDGXaL/N4a3q8E/4pKpF+FFhxzd9dpQ8Ne5zCONjDy?=
 =?us-ascii?Q?lW5gz66jyKAAWLnQ/4jwLXlcscJu5V6dCI+2ZYKe91V1JvXG7FNA5fjtNlMs?=
 =?us-ascii?Q?lyiCUWlJqV9rmSCOl6+mityszBy2o97q91tR33dM+seLjq/b8ZRGSJunHDhA?=
 =?us-ascii?Q?AusZnA97qcchgLfGjseocudNruo0qcGv7Bvo+PKOUg/F2HS23V4Ix7FWOHVa?=
 =?us-ascii?Q?J/TDpmX+4CodSxXPqyuEg3+ecpUMt2n4JMK/Dl0T81+suB+xKNTMIVkFPklF?=
 =?us-ascii?Q?S5Ydc+YvfYUFRzhkyFnv0vRgKphpHz2tvbn8CnRi8hmVeoNovWguwN0mHO7Y?=
 =?us-ascii?Q?mCCFMipNvSxM9VNUlm94mDuVmVwQkN5f6Y5RTTmN5/35DswMQeLpn/V+dCCj?=
 =?us-ascii?Q?d486689TMB3ET+nI5HovZiqmpkJRiEmPdNbGKg4b5dRpusu0bTGM4wjyWgHb?=
 =?us-ascii?Q?QtvTdGCAoWLT98Ecgn0F3hvYb+gxDTho4TFg72VBF60IaogiyMMXG1bgj0Ug?=
 =?us-ascii?Q?zc6flXOFMpFvNIBm/O/Fy78Pr8cpHuk6rty7/J3Tgpu1wCRfDmHJCbr2Y0VP?=
 =?us-ascii?Q?IVykz0hNYtdFuMzrNTrPgEDlkyVXHlVDbO6xRoRCiZG1MgUfXbKOu5sfkXDN?=
 =?us-ascii?Q?kDiR/K1Ao7btUTHnQ1qaaSC4oiS2/jbEY9oOsKS/NJJeH6bXsF+TgDWCTi7p?=
 =?us-ascii?Q?ajgjPg4bUbRxWSLvzIDE+LERpvs2+o36U3UpMU4WbVnvVb6lyKpTR0o9ykIO?=
 =?us-ascii?Q?UricFX/bvoMipbZo3d+CZcVM3AeXC/da9SoCr4ykMkFHvyJ0mhWYz65PY2ht?=
 =?us-ascii?Q?nVXwC5/Qee08X42wYcVqOO6b7Qw08dHwPRzlFbVij0tEXdjb83FK1i63F5rU?=
 =?us-ascii?Q?Ej3tA/6q0Pj8w752HvxePWhz01tBTCWfzjy4bItby6ZNtTRQD99fICrfuU7F?=
 =?us-ascii?Q?ztaKyGijy2xGuiSr8mBC0EmwTrF4PryAotMWDMtEiEKiQ9o8rLvwRBcHbfhj?=
 =?us-ascii?Q?DaSaqLi7wyDj1qwoJv1tQSjerPv/z/9ycvPeaNz1eCx69bzwi/6QZ1jUvJ8a?=
 =?us-ascii?Q?AGupz6qtRVliSi7l4htjAL3FPJModi69V5yZU+jFmmUrOaqkh2aLVrpy2L+D?=
 =?us-ascii?Q?RckOjYSSDmTzxqRlnreKaQUGRKB1E7NnMATD/Psgy/X1HvL9MWH5b5j20Bea?=
 =?us-ascii?Q?1NdcsbOMmHy2hJJ+6qvyExne3nDg63AMHitHm71DHIpiOpLF2x705Uaa28Yz?=
 =?us-ascii?Q?aGJpeVBg6jCRkHnWdRGsFbJWJ7TTVYex2aO+2vYDTpBzh1VZC4g6oIkiZnZu?=
 =?us-ascii?Q?0lRLgOm12ZwQoXPYBEWrOa6QH68yiejgjnzeBrud?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e410317-836e-43ca-3979-08dd7bcbe74f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 03:16:24.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HavBAu4GPE1S8qmZKTjcxLTajUGswyq0U9xvISkKI5iZHrSffZIgaw5TiYsya5N23mHdxkAPLy9GK+aHqmIX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4984
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

