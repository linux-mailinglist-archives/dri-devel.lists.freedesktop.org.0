Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC792B43A37
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009010EA05;
	Thu,  4 Sep 2025 11:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="OBMW2Ckz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013069.outbound.protection.outlook.com
 [40.107.44.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43310EA0A;
 Thu,  4 Sep 2025 11:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZnTh0jymAxaxHmyUbUGmofTrzbytu0KGSiJlFhE9FzITPXCpkU3kncxgSn1i6mImGc38ndqbxqR0YsP8IbWwgElzpGQiCDDq2SPZYtwfk0is19pngXLy0dIjLv9ATa09SmL9wwKDOdRsqdHprG6ihQbBSGjGke5Y+KwMiHmJsYw5m7AVXdM/1a/L37rsiKn2pdj2ym+2CkX7+SAI5LZos2EXw3gFIwiAk+2zSzjRZHWZ2o+giCA7V7t+x2kGeEIqWnuNFPqIHn6CbGDfef66UUS8nHbleCc8+HlPuyh2V9BGi4BjLEOyICq137LPfdFo1MI8tFdccRED+1jt+aQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6VcH3d6zZZPhUSNk2x0irKWmEbTRpebc8z1g9kGJkQ=;
 b=lsIoMwnliw0/T7SWrjg+0Bwh5TY3jWFacbYnzFeJI9TFHDq5bIobnTctNC4Cc0nD/awv8scMHfs41P3f6SOrUP+1qMmnl2lM1DNtOLn7mVMib+NdeGC9lIfBFkPHSzgdCa+6RskfLgr4G6qH1sc3Aelqxw2P9QiOx93RuzLfOteNbCzm66nUHGyEiQHsmmllSpA0GRlWE5efgbgdvAl6fGprvNlzQa1bMWXkWRJE+NWVMLocHLezX19PraSXttptPkudmXtu8biI4DX/KDS0E6CZhOU2kNRtKwRZhk7bzffHkfIbGEngjYax6EZbZX4tsOfHLpBHt0C5huxFsWrlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6VcH3d6zZZPhUSNk2x0irKWmEbTRpebc8z1g9kGJkQ=;
 b=OBMW2Ckz72HysZHhZdYFxmagIZ5pMwRGM5Nf92IM9+Te6IZ8CRAhsPBaPpQJ+LkT2Y8ZNM/L8cn9XHYktRBK+iqKqnIhM0TnGxgoO8aX9SHeimEv0B5L96MFzisbs5YR95HRuojoRf8kPrlEHB3c5w6Ksfu2MgSEWSYsEZGgLChjYxD7hR/pc90UcBSGQ0Pc19BQoakQBSkXtSv6d8QjLZBb2OMINO6mI84Izs3U7q0xYrLR1fmfLI1EljP4lPuRrfkS+d8M6P9JJibk/mBjZQa78HMlpyUt6ZxS1Tn3e5pkVdfyfbvIAiyHjsOcjUQsGxQcREc2RZ6TxX1VVoJiEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:32:26 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:32:26 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 4/4] drm/radeon/pm: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:32:00 +0800
Message-Id: <20250904113201.352187-5-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904113201.352187-1-liaoyuanhong@vivo.com>
References: <20250904113201.352187-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 38407ad3-d343-44c0-964d-08ddeba6b952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YgpeJk+YIFf3sBpCRjpu7m4P1/OrS1Zq9lwq7kGbMAJxcrmV69u8g/YId9iC?=
 =?us-ascii?Q?QhwzpCX3LkdoOEkgZOefpXUqXttYR8HqZFw4NRiL+aK5hSjPOGCJtG49wwe4?=
 =?us-ascii?Q?RxNUJ13bhk6iCSk+4RyU804N8U29O5H1XxKYM8fZBB5hVWSacNvegSYLDq07?=
 =?us-ascii?Q?2KHEsbRQjHnqahYk85RaHDHsWKSSof5FTXZZHvrLrgRn+piMdO9gDABeBM6E?=
 =?us-ascii?Q?4LHue1xOPNph4mFesjDNBqCMDVtCcFOlXQ4xO1jis6XIen15V669kk11kbLx?=
 =?us-ascii?Q?vJOuJqpbWUa3pe377mfeOxTje09xvINRCBmuvGYGmNBMk/ZYh6OGkwJI2G+F?=
 =?us-ascii?Q?wVfVc1pKMX2S6gxQMVhv0sl52Y4ak8uExYHAQc2aUb8IsBIJjTfbWI9/kt7c?=
 =?us-ascii?Q?6QmXmhpRSKU77Y/cDpXQoGVVryuPj1x/In6WxLNoKv5wHMZOkAgbA3uPBlpY?=
 =?us-ascii?Q?Pb4H6yzQji0Hfq2rprcQTop/ZkR9jxvzZOYjJN97wucfD9+m35nkavQpBb2N?=
 =?us-ascii?Q?G9V1Vtoh/xMuA2M1V73dgO12zzPUI2Qcb2ODoiF3gbIa8gW4/j/+/Oye4SHO?=
 =?us-ascii?Q?/x1DXzKAxWMUdXmIGI6ZhdcHNWmvSKH4bjpdsPzwp4pX/ZxAP9s+3tHmT8eq?=
 =?us-ascii?Q?5dTVEZXVglbD/cjs6pr3qPpEoegKpG/9YD0rAkHvO8yMSwx+0/4ZG+FFsec7?=
 =?us-ascii?Q?vMDXLhuLuZIWtfWxi9d6ygE77TIUMY118J7sZM67mNNqKbqhV6McGTqKyRo1?=
 =?us-ascii?Q?DGVxpkUmIYZvJ/Zs/Mw5w+cRMETxUH8JBmTYWgXag2UWKprCgN8br5kCeB2u?=
 =?us-ascii?Q?CyXW7AnednJwo3svQkf7T8S2393dPMl0/iJiRSM3AGR8E2q6oWc/c8Q77hf4?=
 =?us-ascii?Q?2HbwLfhKlFuN6hJdioQI6IcF/fmie2Xsj75yA+hoSGZmbPv2mSBT9dlYu5Xm?=
 =?us-ascii?Q?DU6rvhz1fEA0/X2A9rDrs2jpaccuzGUWitPCRsHqaaV6YQylbSBZmPrsED6r?=
 =?us-ascii?Q?+HBTL854WbtxQ55I43r0Z7blpfE6aK8Hbp4vwzP8scMf1dlAnNdEQJgI7fG5?=
 =?us-ascii?Q?Bga9Xs/dYLsPj4tT04E6HprDwX+1uK44piJTgqjIWUCA2xWFQx1ysGYMyNLP?=
 =?us-ascii?Q?OpoN8MHXuHBFtOz3L1tgMvId89B8ilj5jrfrend64i2MTkF2Yb56vpS7Bole?=
 =?us-ascii?Q?M1lM78JB0thwWSAPmGzF9oTJ9qWpopHXzVKT4DB3mL6ezNGnmeFH7VxMggVk?=
 =?us-ascii?Q?+zl98+cZHnFyW/V79VKLbqK3E6OA2q38HYKs6pKVusdsy/EqRqVvFYUNbnVA?=
 =?us-ascii?Q?4Bn3dIQgu2/OgbwRYawAzr9yu6bF5AEuFeOP075xDiQN7wU21TZ4o6IS/Xpi?=
 =?us-ascii?Q?n9oLpfk7IHb56u2JyKFw0X8JKf6/YOi3TgGqC3n6tgzjZ0JfSyAEgyGsK4gx?=
 =?us-ascii?Q?EQPl/LzMEgUt0GVuoL3tFj10azPblv634mvE4dKfv/DHi3kZ42woQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QU4RT5A5nQVp0n7/d0mrr/8SY3ivOyc7X7hbUt8c/FTq1uvkXRkm7AhmoKca?=
 =?us-ascii?Q?ngNJn2niCtXcWEv5x7cLaT6QNNHmDSw20A8JajX4rwSaT2rbsnqJ3ZwEsGgB?=
 =?us-ascii?Q?eVM1Ko2WkDKpDIzFIjpY5bVHk2HV/DDeBA7uJkXwsEvLu0qDFiqGuerN+rJk?=
 =?us-ascii?Q?zMKH5Umbt6CcV2GfvGR0cTNb+rm04n6QgyMGMbbMXRUCzqIpPsXX9NC02NEU?=
 =?us-ascii?Q?FbAz4+2185Uo7v+RrdQMi/HjiOCd/ct8mzWYn3apsoPbLO1XWoiFh0P9fBIW?=
 =?us-ascii?Q?17TXyxlKAIawWQIgypVCAGCgEJSfxZZh/j9EWID34aFc4hUGFHO7oHasbP36?=
 =?us-ascii?Q?Sw7ICP5b5I5RpyZpGpbQ7NMHcXfsSlwSEZOpvxallFAmzOLEvexfPlV1SD47?=
 =?us-ascii?Q?ZZt6LzGJ9S096hz29cIpOXIm3MIL4pqXY7wL0Zdz73fTAOG346E+9thLqSH9?=
 =?us-ascii?Q?nPNsSwzGr8+CBZYWFmMXKKjBZraLlxyr5XNzM+ps+dcGUqpp7pNZ/VTsPg2x?=
 =?us-ascii?Q?8CGW4JTD4FImqCP4M7wCvYpu4Keuuk/mdT99KkJP9z2W91ZxoCh7KpVxDHig?=
 =?us-ascii?Q?j+FpuxltDc9MVic+vgrSspsuZHje9xaW8MEqozLxI9L/FuWTzeyfXczjnWEs?=
 =?us-ascii?Q?yQojKepkAo4PSur6y3m2eIxkS/y6YZEinDHxE6myK9NtM00kn3+m9oiHydCR?=
 =?us-ascii?Q?4+OUwOOFS17QhoPLDyA2Ojf7SbiOknIUNhGeqjetRSH+aTGfhr6vocdV5f5g?=
 =?us-ascii?Q?UYSyP8CE1bB8y0h/ts3PXJJvXZnuJBlnBFM20t/RVtyJ+BGsdPbRfw5CBCvp?=
 =?us-ascii?Q?cEeZC1qetS6pejHutHviVkOXb1OD2AsMqY0Dv8v38zaDXCjJ5pnbkpgiuhZg?=
 =?us-ascii?Q?KhC/enG5PqS83/LmkX8b6FuebMco6Sm5Yy8UyoY8eTwutVDWgOVb0aNfEB/b?=
 =?us-ascii?Q?cL3ayvmwZCULuAM4Rue1X8lzchlQMjPE1Lgf8lh/mz91cFKvptA1qWYTimP5?=
 =?us-ascii?Q?nO/A/ofDXt2d1fs2s+7zJZYOnlx7pJ+x7B6yhhFg6N4c+jkOlG/Bl/eVqa5z?=
 =?us-ascii?Q?f7Koa3bae5u1TnwgBi6wO41RJpu1Sbee1i2tcjJZpNPlzzu/I7mjp7l6hUub?=
 =?us-ascii?Q?2ZieirF09iue45b+FXtcHf8m1nng3scpKp0e+2doeS7gI4YEHtvq6Rbv22lN?=
 =?us-ascii?Q?TxUUVRrtNoGRTklIqdkJEG1zvLFIOo22oMS3sRTYG2DwhXSDaHtLJ1rXB5KU?=
 =?us-ascii?Q?3M7gTT/eA+oxj4evx5hmINvgiP/lgpdDxrfYmgs9wa8X7P2in49Gpryus8L1?=
 =?us-ascii?Q?2S52AsBj8RGStEBC9PW4vGOfrmxvQHD0n+FnwjcwTCQRkDSoyesTwJ5bnwTh?=
 =?us-ascii?Q?4sSqiWryrUFXpEQ8nsUlew29rGWmGC7nxAEyYUhZ3nr8EPUJ7OCPOcf0swqM?=
 =?us-ascii?Q?9eh2+VWWSQxsD+ezMiUlPL4tOWbnyi7hWPXMIt4qkMKf64d2kwzc/bRopkPl?=
 =?us-ascii?Q?H+TZSBRyXa+N/GduA5QwIz4Iff/G8EVp8dYianKmFToal1kt51/YmIy4WvQa?=
 =?us-ascii?Q?9LTE31SUTTT/cDX6YzZjR6dGwBA+C6aTLvcyd66s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38407ad3-d343-44c0-964d-08ddeba6b952
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:32:26.4773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHA5j3RCTDRSFZQQJLM3TVjahE7XBdgD8mSoGPBl/KMBz0WHV7Bq4Zq2I1biZXZpt+oVGM+j4r2p5ttETK/dsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index b4fb7e70320b..a855a96dd2ea 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -907,8 +907,7 @@ static void radeon_dpm_thermal_work_handler(struct work_struct *work)
 
 static bool radeon_dpm_single_display(struct radeon_device *rdev)
 {
-	bool single_display = (rdev->pm.dpm.new_active_crtc_count < 2) ?
-		true : false;
+	bool single_display = rdev->pm.dpm.new_active_crtc_count < 2;
 
 	/* check if the vblank period is too short to adjust the mclk */
 	if (single_display && rdev->asic->dpm.vblank_too_short) {
-- 
2.34.1

