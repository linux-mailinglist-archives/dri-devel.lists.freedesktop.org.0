Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41E95AD81
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C8110E745;
	Thu, 22 Aug 2024 06:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Casx9A7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2055.outbound.protection.outlook.com [40.107.117.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE51E10E745;
 Thu, 22 Aug 2024 06:30:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIuY3Kiw3rPLakY+SxLvoNfaeSscY9Prponf2NQG2lHCHnK2c9RzoGAj6H5T6w48XffpWOFuL9ufr7v35Nc7ODb40lQha/nUjHr4BZp8LVU0ghcUio5amOpUI8EDU3bc31X4lPeV0I3zHtiPu9a6g/jjNGhEl3FXybe3ixQCabwEWx+eivkG8Hv7kcUMCf+G0W57p/EvefeyTQucPy0QP0C/BMyZNXh7LnPOWEFg7nYFm0bG+o2Wz8LFTE3gCOh+mKo/rc3qCef7Gdlmdu2tEuIOFjH4djwIntJhzzogLpNgzhpmhcnmcki0+pS5mU01zPXNghP/MmHH+fhe9O9QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=QUl9U73AJwHEryC8rgDppbT6afUudD0s2LX+KwpTMrGZjdDfwo+uHz+CIl6FjW5Ev+56efVWhIN2n9FIKxAWf+Dix4kFTyG2NuoVhqQdXJemkLq3Eiyz6wNwNCtWfBJKXmptiS1b/LvjlX5kEtPG7xQuyMQ9RuoT7toem/R+ijMf7RUVmNZl8SH1u9nWBLXqJAUCB/EV3hjTdvmdaMc2jVRCWuHaR4BKA+TtT3pCVZiDytVhplyACyqRcp/fyJfBvlE5jyBJZxaA/ynMTmT+MoySTTnEQwog6LyGGKgS7W5c+WKW2NHQrTQpWwAu8vM1mu557T9m5uZRHRTP7IdNJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=Casx9A7og4bHBeg70StAf+tn9S/wAs75FgYFR8kAaU+MIbXEKloAhHoM8Fc243GhIkyQi4Pi4X8AcBpzORE0kr7SaJofDUX9+XmUCMWRA8m/biPCuAKLCX1YWfDdt8ZrzZU8Z2L1V9bPikMApOznUXIjXKzsY5acvK+VBbYvhntxG7mGNheWrtIi+jX0mcaOF7zi8bFK8dyfZ66jqfcsjABOST+1AUCMgcHLxYnXntAbK4iizM+910yzr3Kzt5v5RhqdV9sXyVt3Nl1IIi/Jf1Wwg9ReDuvxxCCc7LdJi1nwjpHlDPMIaF5GOX11NE1O7mr/ZVgh4KVqx0XuSshaDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:30:36 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:30:35 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 1/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:27 +0800
Message-Id: <20240822062947.1318340-2-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062947.1318340-1-yujiaoliang@vivo.com>
References: <20240822062947.1318340-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|JH0PR06MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: c1205b15-e8e4-4c88-a444-08dcc273edfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xSdz/GEfs0DaUfGocYcR8GPvZTEXEZhDmrvloha36wc/q01YEuF6X9+9fh+z?=
 =?us-ascii?Q?ObkWPJ6OM6X/mOY22WY0fxY00iGjaVV4nB+VwKtocHWcSCx2QUIcsnWajJEy?=
 =?us-ascii?Q?4IYL0SaMXBA2vPh1wos9QIRHfoYxBH0XbG4V1tPdfCy0gTdAUBeednscXqWu?=
 =?us-ascii?Q?QizpZ0gqG5uU+MPxbidWsZXS0x/G2FagBZx6X3g5H2YjBJOpXqsiQjrBpm8q?=
 =?us-ascii?Q?1lW2a1NjV6BWI58FZef9xyQzPrjr7qLZqOucU49Ra6ky+KE/cq8Gjur0Czfo?=
 =?us-ascii?Q?kqX72XiJMGh2XFZdJA1x6yIYqArF0M0aV8rw3TpnILPNZXLzaH5pq/whlgUS?=
 =?us-ascii?Q?cG6mZnKFRn4s/j3jqZ2PdkpunA/+L0tSHeJ/f/LSQPbiE8PHDoMnayjWWnZn?=
 =?us-ascii?Q?TpCfvi8BtNOAtH3+HytOrputbwWbTWJhPYBqquSWV6F4MI+YsvohD62+b40E?=
 =?us-ascii?Q?o/pJCwBypc7nQmyfibQc9dqW0u/sPkzNltd7IkyNK67f6zCa+1co+HvrksKJ?=
 =?us-ascii?Q?hGlnJRb2I0cPQQohz1GFUFpMqDK/T5yq+mP1zSGIsdwqVoc2p7N6ZEAd9qC8?=
 =?us-ascii?Q?SDM3kTMGVNZ0m5KlFw4wnA19CJTO9xcD9mRqcQHZOLb5bO+597i8NDzEehWw?=
 =?us-ascii?Q?7YH0t21dp1gc4YrI6U3p9k/4bDmz3lUeoMc2zHKlDTg3FEZCh/xKJGkygQJL?=
 =?us-ascii?Q?mNqBzFksgBXVl4JJPGcIPSp6rbz+gr4rxUGY9aTIyEpSQRAmt0gjSsRBpWF5?=
 =?us-ascii?Q?P1+sc2QTp/YxIGsQR02zVkkMKLtRYPYvWF1fs4+nykbksOMbbVe9cGxBQ9es?=
 =?us-ascii?Q?k3FIw+3FaYeO7Ufkykds8hlPqM4rguMw80zyMdpy+tZ9nxBcwCRj0DkyaLLF?=
 =?us-ascii?Q?IwwFc5AgSXFy5xxUc8UFHr2EoRFQa/nMNCnZTw1bWCSpUf9hfv6yvMKc0vXd?=
 =?us-ascii?Q?zHD2iVNEUDt3t7KhoH8yHUyTWrrQ3gMbjRs/Dunm03JT4otHbIfCtCC+FY5e?=
 =?us-ascii?Q?XEk7FQZlgbUaAFPtAMA2WdIm8ULdW2tVWLa+/+nPVL4G04UybZ6e2anNa5jO?=
 =?us-ascii?Q?N5XIPwWdV1Sz13hOTc+/iPDRPe1cgDPYsxZHW5xWy9ESWOdAEpIWJ5nBpx+V?=
 =?us-ascii?Q?3ClaMr06fD/MF/+THFSHLSMDDvETUyb0CadLEgCXm+VUvrXLtqt46h8QpBIM?=
 =?us-ascii?Q?r2fOCQB/JM93+/NKdDX7qvG7ewihcjtrfDXHPgEi5bVxyePcA0JJB3vIRo3N?=
 =?us-ascii?Q?eLg0auRewObvpaFgxS/qjWeDP14lcAQaeTY6KZc2KLkiNi7eOMBwfmJuQ8g9?=
 =?us-ascii?Q?SqPTHhmzC21j1TcWbhiYLsdceh8KY9sEzEviJvt/3rlMIqGvnARv4TPkYYq7?=
 =?us-ascii?Q?+JINs+eMUcZUF1Dx8PnbLGEb9jBP0CFeXu3pEMi4b23clSL134z7OuB2JU/j?=
 =?us-ascii?Q?7YnjVpIXPCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpajFXXu7wxnbLRfKLSi6fNinUaJBI2nqmT0Ko0dMO78njzL8Pk4DWA9sFcU?=
 =?us-ascii?Q?PFz4Rsbd2i5l5E6Tqk1zdcshHNNF7ESSD1cAoNdtbLsGAe7mZhDkKSlFASEZ?=
 =?us-ascii?Q?ShHKdvpFZy6Sd+rWfoB7t52VDEyt+G5BL6+5PaJO7mHoqeoaSFPLtlcUZ4Um?=
 =?us-ascii?Q?Dtx1bZoqsl+ykhZSXd9G0nI7cQFWT+KGAtdRF1lo7tUNG1bx58DRpoRLDKfP?=
 =?us-ascii?Q?01j2iz27qH/Wfm7vz+l4IS89tUVKQEFO408Bpqnc0Be3p5YLY0StMzK/iZsI?=
 =?us-ascii?Q?JCV/R46/uVUnhE9p/0cO6JhfrlEaLagKmf5oqqCd5YKArYa616bSpR2pZpbk?=
 =?us-ascii?Q?/RrItiCTlOe2uuPpkDzTKk1NYDNWIvXVlF9v2pSMjRM2r5XQWwd1Gl11Kf/Y?=
 =?us-ascii?Q?83YK51zxYc/24TkjDiUDMv3MPn9+CKRd7MCXg8FKraHEgnOcM49q+qZyGgVL?=
 =?us-ascii?Q?EVPKAXiewqTVCGfJKYu4Q6UlC6ivvnvqO2fRQGgnAkSb1yyJbAdjvL5fkPys?=
 =?us-ascii?Q?aVSGecx/9/ChKr/r+AeGjWVlUQrKFsiqocOFjjT0fbmbTlNJVqhs+M8p4LLl?=
 =?us-ascii?Q?UFcq2MBPSnwY3AKJGUoKmHJ43P47M6HNIJRn7H0gtpUxsBpH/VRsmGNS1vrJ?=
 =?us-ascii?Q?aBsTVNe5uStgDtpNER8axsWC6w88XF1RLfCwZ4KwVWHqvmtDy1Mjy4E11R5T?=
 =?us-ascii?Q?8+cM2Jgh6HQf+a+J4U5k2+TyLFiWe8XUeCGvx+eYvhBI/dKV7Tz3Cj+I+Vz4?=
 =?us-ascii?Q?ykG56R8KXlnKfSWXEpz8EL/6wGWlS1+3bAnsVKVgScQFGFqIBoOvAoWKat8P?=
 =?us-ascii?Q?VcfVrcEtUCZkerZWJCao7BR4Weq1KcTFwNrU5XcYYfoRlUCA/Sjp8pOZNhDf?=
 =?us-ascii?Q?z7pMZ6hFEwGKsaaUgQs0BXgIbiSrPlWYUPogdD2YQ9rpnywSQp3Df9SgSikD?=
 =?us-ascii?Q?jIk8GEfeHE/tIDMdDpFfWEUZGExCQrO9YEK+PawUqwKdTMni5uT2K8LgP/+k?=
 =?us-ascii?Q?eKhEt8C8veImby4Rm8HWZTRoKiwzey9PSQKrVtjmoUkqA4TyrCgMKJrwhN8+?=
 =?us-ascii?Q?h48cqncsW4I+ya858ZRLYRWaMqiSqpCsqaLHy4ueOj/0vjlOMUO3Fr7IMeu4?=
 =?us-ascii?Q?xZzqikGVbS19XKYhKeWH775SzbgXPuklARMawbxscar7LaFFuQxObvnA951Q?=
 =?us-ascii?Q?nNWAdpsV7Ex4q3caNTne6lrb8OI6X4dN/AHnrs3ukI/K9wwKdFamYjIV+cKy?=
 =?us-ascii?Q?aPGp13sDAA2lrdrHVDqeShdpn3YrTmyg4xuP7jK7ICl75S78ecQyuxWsNIgT?=
 =?us-ascii?Q?eXKpZIeDr9lo+RymK5IIqtF+wqt3n2OmjdWTYO10PkD1By9h+M7LYEzykEld?=
 =?us-ascii?Q?atOtQubueBNU/pG9Vn9h8yofyUUHf5Sf2ZmCLp4r3LJjxPgR+VchGP6MWYYT?=
 =?us-ascii?Q?xkxytBBcBoiTbv7qvu8EC7Ffhi01UPtktdmq5ouTfjmaLLBLETt4m2XIIdFQ?=
 =?us-ascii?Q?614ES0qjCroZnBoGlvWvqYyhUqO/O6MlrCr20ENKhvL+IaREnLuAm+pvwKip?=
 =?us-ascii?Q?GuqQF15hK+66dx5WXZl3Uh2+yEZowyn9J4ONLqcJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1205b15-e8e4-4c88-a444-08dcc273edfb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:30:35.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L3WWfoW06rsKNiCKcah2LKPNhktKn4/zyUPM3MbxVMeevzX0h0rZTu6PgBKbu0vau6ppiRMDzgI0Z+rQZRNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6344
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 3bacf470f7c5..f8c1650eb21f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -2300,8 +2300,8 @@ static enum bp_result get_integrated_info_v8(
 		le32_to_cpu(info_v8->ulNbpStateNClkFreq[0]);
 	for (i = 1; i < 4; ++i)
 		info->minimum_n_clk =
-			info->minimum_n_clk < le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]) ?
-			info->minimum_n_clk : le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]);
+			min(info->minimum_n_clk,
+			    le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]));
 
 	info->idle_n_clk = le32_to_cpu(info_v8->ulIdleNClk);
 	info->ddr_dll_power_up_time =
-- 
2.34.1

