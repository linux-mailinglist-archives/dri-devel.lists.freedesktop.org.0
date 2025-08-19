Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB3B2C6E9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02C810E1C0;
	Tue, 19 Aug 2025 14:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="LtiuodL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013063.outbound.protection.outlook.com [52.101.127.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522AF10E1C0;
 Tue, 19 Aug 2025 14:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8dgq78JZ1+Njv0wZbqZ4pF+VaOCEZV9KiE/13VHLHb0XdRJWJmLs6yeZ4t9jRZHV3m3v/RQMiQhUtCtRkUBNuV6xomtwPAeqscMai6fzCZGLsGZIjN6PnuTqlYQRAmH+gZ0wkIksACRfc/DoUfMdKxgu1ubJQxGbQd2LDOaW4XLc8znqwlOFY1bT9P8089X52oS08/VvKeqMpwzxyR6LL0CuhXtKiUsOdu4fAL/cz3W0b+zQPjlBLOqG8qguVVeJZxwCt/7k/xPOnfS6NvjJLWkfiA9uRgXHo9Jh3OzltcnyVhChpWZyYTND9s1fuA7yEIe7i/GDBn8xhbVmCzgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fkRtyeKvLtdj29WpA6YQCR/8SUChRk6XAilaTQtLVE=;
 b=gkHdytl6Xwk8XFMRDcee0bzGv5WHoPFxf3UKbGCKnMqkUsQIDycYfFcpU+sMQ8DF5Kay5Lcz8aEEqe9U3sgplgjC8qnR0rpwHELwJnKLGF6L8nKFP5LOshbo/osWhPLLcCLD1Y1N6F7+iVeGlYq7hvRggYv75GkaOjROIUIYi646s4YATudf+k+rlKimVcphk8JKo+VLkkrjN84FswF8aIXiUW9luxfQ+H3qquuKiEa1EAYn2FLvip45aZQdg8r3quAsRR8WN2kKaiJwZf7xmKlo9K7yos/qvCQYIgh0GntcV9copHic3Y8r7QZUXF+2lhYFgQHFbip7rkqGXqW8YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fkRtyeKvLtdj29WpA6YQCR/8SUChRk6XAilaTQtLVE=;
 b=LtiuodL3kuR7EYY1o7h4ztrKjIvzBy+doq5vKQ2RaEtkLfI+KfZ/agoYb4OknNrKLsj8KBehflKmF+VpMpNKBJ3ABw0eglMCCIOjsuT7O4SrchbU4oC8iZSaGliB86TO9SZthah+jxjjNaqhT+cGLs77kH7ueqL+Bxut1PFQ2joKhUmrPaoRDhcW1qrdBFyQFF7GABDOhRb+0tQ64lGI0L+uO7YCqI1O5tcwCp/K11wbwugQ0x+mKf/7jQUWU+cueMdB1CsBsVwT18KAwRFS2U0Yt0v4nR0knHBO2/SE9iph7GP0lqO9R+I+MRGqnbJZkxsCd84AdX6wVMtsDN9usQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 14:25:07 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:25:07 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Yihan Zhu <Yihan.Zhu@amd.com>,
 Muhammad Ahmed <Muhammad.Ahmed@amd.com>, George Shen <george.shen@amd.com>,
 Reza Amini <reza.amini@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/amd/display: Remove redundant header files
Date: Tue, 19 Aug 2025 22:24:50 +0800
Message-Id: <20250819142453.368440-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b521a8-a0b1-4dea-d4f8-08dddf2c3281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qxp8yEhVU3UXQf2XRhwMC7It15TpxFM796UKp3xtbwe2d+rz0D99oBy+VHAo?=
 =?us-ascii?Q?ZXZreja4jwmkXscTfQK3FMbHzFW4p97FCj52GMmqAByHwyUs+UmjgVwsCMiI?=
 =?us-ascii?Q?24vB77+hFaZBxz3fGv++Ec4zbm+qikh2W/gshXo1cUm9Sqxpc+kLvmxnuZIp?=
 =?us-ascii?Q?uIf8FaV9oStgbSRYQGAhkilArPm5tZJCnh5Oh+/TkK/mSNDRUWuB+qE7NIPA?=
 =?us-ascii?Q?3zHSf8ZcIcY4KllKFzpyBGqiD1MNjIk+cQJa1JFVWHLkhjiJzlYz+j/PBpz5?=
 =?us-ascii?Q?r2KNHGAaohehyLBqMS6EFR2HN1T5RhvvF7WgQBE2O9gzEVgS64v3ocq0TBZ0?=
 =?us-ascii?Q?pkW0AGSoY+gCyhMQjIAPr4O+4Md9le8PEE5zCYHneI9JTqlLNqZ7YSLrRnEe?=
 =?us-ascii?Q?wFpgoCJjREWvrxuKb09w4NDExaTOP6+/Qch+aKhS40U6jvANURuvehLa1XRg?=
 =?us-ascii?Q?lm7ribi0VbjTGcKJOpAVDNtPYag9pXD2q8NjHFC+fXtEAbnLSyLzosXGVDx6?=
 =?us-ascii?Q?A9SiG7nrQtv4dhWDR4qlo3YBWHHb7DuZP4dM6JcQFcR5aJjokbyrP/7eySZc?=
 =?us-ascii?Q?SofGTVJh3KvC0eDPusqSUbZBoSowv2X9hNXEinqSNlo4Enpss/tg/WSdZI2y?=
 =?us-ascii?Q?bnhijC5E2UtAaXb9f+zsUpo2D/bsRkPUwoyiRSzBao4B922wDbofDK0rWy+0?=
 =?us-ascii?Q?RvZkacnQl4+rerM2z+RsafA9er3vUlUPLDCBMFldo4zIoFudqEQj/PhE/iqC?=
 =?us-ascii?Q?oRsgwSpVdYAECFj6JMKyrxBZeKB5dvjp1YdGB26HMZgX25FPCmzYsIlt5gWL?=
 =?us-ascii?Q?VJkUfi4xbPaQXxsLMIZ1VPsGkD4lUUaivZuKyGLt4bbG2vwsfytWSDEGdd32?=
 =?us-ascii?Q?7bPRdnWiZiB/0JMb7ZduyFIkXnaGKkKtWsxrGIaDDGqEWR2RTUOqobDDvsIF?=
 =?us-ascii?Q?2pmpIz4ihxJMHv3FphGdGEupYSqR0xCPSHZBHTYvHKHko15Hz64usrgszPkN?=
 =?us-ascii?Q?Vedcfi8fpMIO0M+XZWUDbVrUTrxavf51TCg5U0NFAkPTdaORKKVJ4RiBuDbf?=
 =?us-ascii?Q?r/krd9XG+0oADZUKoMdsMgkrOGmc0+SwIsxwsXJbK3j9AomHXY1cwyqGmOMi?=
 =?us-ascii?Q?ILgQPmRMe9PNjlPN2Q7J1+vmrdRUfb0rHJIY4vapWe3qpmlCdn6jQJ4xBYqc?=
 =?us-ascii?Q?dRt/0IWxIaRv1Dnb6PrG4LMRLFbzFu5cR1UrtDmqhhDUUTJo/6FD825LJsWi?=
 =?us-ascii?Q?9KTBWjZ/lE/+togXpa788Y+cRGjAIjlKbMmwoqWRFIm1I6fm6KRzu4ZsUzUm?=
 =?us-ascii?Q?VHTV5STnuqx5Qlf7hCw0NStEpFqcHUQn9/+R5OdGqrOCuiW6TzA9V2tU213H?=
 =?us-ascii?Q?5W8uDpLZ1ApJdx8Yyyvt8SvdIzjW10UDHVAIQUJaK5g3BkRhvvnZsQpBNAsM?=
 =?us-ascii?Q?o2eanUHkKmQd0j+4B3MauVOPr65pwhTxEtQOkU3H1JsaJTMWuXxRgbmQM9vW?=
 =?us-ascii?Q?uUjj/G1DseVHuYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/c50hCEIBP5iYRVHGLm/qU+dOWhi4F7OXdrE1OwSrZieU2ahRTY8thX4F45?=
 =?us-ascii?Q?WsxDd7bbxmFZZLVv75g+CqcOnv7OsP9dOyr8N3zWCvYsS4Dck4MIi7qiPoQI?=
 =?us-ascii?Q?60AbHJXVjgU267fG1QriDkBh4yN1BkpwahAzeg5oOdZzhp8t3uDDsdosjHCr?=
 =?us-ascii?Q?SpZsZkN/2g6U1vqq00H4AsidmR3c016SzEi413LXBYobFi/EzYCFJXdRf+x/?=
 =?us-ascii?Q?hpe/6YPEJYuXUyysGzdMiQfrvLIkVNTP9sAOvXMDV8UMoVcWcjgYjIhr1TEq?=
 =?us-ascii?Q?tzmYSfX7gDTpB8jbwx9/wNUxAw0MuPaJHi8d31eScyKd/XlJxfEUdDYzzODP?=
 =?us-ascii?Q?LfcP7sVpjjSQojXpMy1+l5Ds8pY8zi0FsAva5D7db5aza9lHftoJSqaoNyDs?=
 =?us-ascii?Q?N/QQ2RHhf7fMCZQTFjdnUBOhu2cV2pDRba5yimS124qwo7+mp8bnhP3j0wyF?=
 =?us-ascii?Q?hFBUgd3fWe1hJCBS3gIBDEAPFvE15nGDtTIDZev6zLEe0xof0EvK6REZI72e?=
 =?us-ascii?Q?uCfGl+ZMPGmf9Qi2ubiBA4o2R7eMXHvIZ5vJ8UKhZnGw36oZ2Ro6XBiK9fqU?=
 =?us-ascii?Q?eP0BU77Gfkh5QMRXBAjiOjvBuAXXFdNgKLxl457iXKTMBnsyd+eUwkPWASZm?=
 =?us-ascii?Q?9+iBGPNr1dA7lsmvJxbc3l3i9YFfvmn9boH/KigaapfoySGS2ijvV3h3xPnv?=
 =?us-ascii?Q?/dUEqJBHRZ2gWOigxKgE1m16h2KMumUiM+zpV/Qm/zOPoKbpGNWAszs7wDK7?=
 =?us-ascii?Q?Cv90Ia+jnpvszZSsocXQQ4McNmRBvFKuxYEvLGytAkqvtnNa1RlZUp14BskG?=
 =?us-ascii?Q?ntrGaG2HWczRtl6K6IKSIxxZj3pxbezU8QCnCcrI1OsPuUKpsyG6meL0Gtdg?=
 =?us-ascii?Q?8Fz/FwiCCEX+aSxb1LnEVHDAQaWXdk7/InUJHSDK2rG7BisCGwd1NbSmBjoS?=
 =?us-ascii?Q?nSEo09GaK1eKfxgsW/lHe57pGuIlXdFTCC9jWciJUNTE0LfijTcmlkTjKbPu?=
 =?us-ascii?Q?p5AVhq9MjM/aFT4Y0k+CuOPfWqkrNxP/g/UU4XJzVlTIZAinlKDrCimHknCO?=
 =?us-ascii?Q?z4N4+vK3i9APB25WhopifFUQTc1DY7qGCFzItNFWRS+JmdnWMZKReTJdOya0?=
 =?us-ascii?Q?6YF3hDCgqIrY33Ai29Kju3lU1+OusquKs9cREQSMowWO/omqAhUjjlPtrMYN?=
 =?us-ascii?Q?aefiZ30z70g0THJ/aUBU0TRKJhQCZrAWTZjg0C74B76IsFGASPNkjl5xTbZN?=
 =?us-ascii?Q?QriTtsve/PLloqJi8EH/lTMAAsI/OPK5LJtDlHC/Iea+e9AiPFINP0/YCm+r?=
 =?us-ascii?Q?88XdnodfF5UGa/kBevQKLYCflNCPbdIl9FPvRIT7+jP0Av4xZ6mHEx5cLM4x?=
 =?us-ascii?Q?FeuNl3/T+5to6A3sKJo+WpnnEw/FHP3l/jX9hu1Cp6Y2Nt7+EroLb514yTEw?=
 =?us-ascii?Q?tCMpGYpOFSHBzADXoEmw4ZXARUztwAjBKeL9nk6DsWoNwZJIMc5rNIcbjRRg?=
 =?us-ascii?Q?TQ19Yjl6LIbrlg7ZCsn3o9QqSsqxNinOWcHLodSOTbOoZV2VnIT0dm/T5XOu?=
 =?us-ascii?Q?ihT7Yd6mCYjhLL1N7GUvALisxlw3urniwR3iELsy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b521a8-a0b1-4dea-d4f8-08dddf2c3281
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:25:07.7691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QsK+AXmtffduzGnsvtVmCl1El6wAjlPIwPWGyYGjU3cLWQFJwlugd2/3s8O7JOaBPDDEEnZEvD7evUDlSKiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5134
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

The header file "dc_stream.h" is already included on line 1507. Remove the
redundant include.

This is because the header file was initially included towards the latter
part of the code. Subsequent commits had to include the header file again
earlier in the code. In my opinion, this doesn't count as a fix; it just
requires removing the redundant header inclusion.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 1ab05eabbddb..2ceaf861edb9 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1854,8 +1854,6 @@ void dc_3dlut_func_retain(struct dc_3dlut *lut);
 void dc_post_update_surfaces_to_stream(
 		struct dc *dc);
 
-#include "dc_stream.h"
-
 /**
  * struct dc_validation_set - Struct to store surface/stream associations for validation
  */
-- 
2.34.1

