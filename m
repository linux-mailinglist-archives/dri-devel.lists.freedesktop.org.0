Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A0B43A32
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B3E10EA03;
	Thu,  4 Sep 2025 11:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="CjFTqKAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013053.outbound.protection.outlook.com
 [40.107.44.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE1C10EA02;
 Thu,  4 Sep 2025 11:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umFEXjYhk5AdwCIbHPrbbhv8Gri/O6uBnuM6nTD2yCYFp7/9p47oqMKRFpoXMb4SWTkeql3cbFR9AwrIEcvkahhdYp9bYsni/oKWHaE8LVSTZtpCKpigiFh8HOknX7BqHjcTz+m2Poc7NajT0J42DqSmivLKMsELnEK5YmHppTRUYIPHYhUHKC/67YFlIEzEFGM65mv1ZbMmDW1FFilNiIveWqj3k7466cDCRxK3Fm74I2QFmshkVF5cXulprHjzfbZy/9cmOCo5+Y1ojaM5vSl2CyRPH+jkRJHeLFQSQ3xwzLSixgjVCXA4F6Z6bI75rjjAHGAfxMFZHbU2r4OMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC7JSk25dADYyA0t+53FT3NR2Tom3mD6H4nE4Z1V7gA=;
 b=hTtaPEIY+5an4/wUJY2j/zCXWD5RIV7wshGHobsN/J+YSFE62nRnpsg0gMW5bIgyxC/aSy0UWBo2YWHuA6iusk9KnrUOMLWv1IGl7VHIggOVdhu3J8YbZF7Ay17jw5ads49hmFG7KhpyYTXokzR/u7Qq2Ot49W+T/n+A/cK96NRMyYtRyKISq4GBpKwizC48A4icRDFiQd3f+9OTVVe4ul6A23tZuzbKmKwcchlDBz7XOrSXcPm6eaDcWPlB5eMysbNIYvRaGqRShO8H37xLUZ89DwPYayMGSczFUkjNFv6BR7+FmciUkWOkkAVeFmqNpMwJ2bYFJ5Ko5AfGOETv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC7JSk25dADYyA0t+53FT3NR2Tom3mD6H4nE4Z1V7gA=;
 b=CjFTqKAdeoKyTDRSM5B7br0VGh+zxhyGIEbwJVEDNx+DWoeItQpaGh6PBQQbgizcVwk56W4k47ZiBEoTlfFtI3rWbAoNNJnKVHr+Anu9A4k+jUq0I0qnYfsGt8M2Iu7BtGU7bEUvF81mPNfFTij5oD6TP1e+1S1M32UmIZ001I3oXZSG+KHEu2AP2LdLiGLrAw24mGevHED2meZlr+50TIFDb5OcnkDfiL7LsEi7RZsa7hXTwmmHhTJ7uEuC81UAwKlTNq62puVdEUZxD8AF2wgCMp0AVGLbjMJaLhT62bDwr6OX13+jD4PjcIq0JN6Qtgv488ikWcoI595quVOo0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:32:16 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:32:16 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 1/4] drm/radeon/atom: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:31:57 +0800
Message-Id: <20250904113201.352187-2-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8036c15c-def9-4a33-817d-08ddeba6b343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?40AdMt9tNvPb23VvNeDu8wErN9CJRe5I8ngPVtOL5y3QA2AkRXu8kZFlTslS?=
 =?us-ascii?Q?hBNf9bHVGsVLypt3uNehPE1gASrE8lqRUE02aswtZg4xBxU9+c8HJQJzXkVC?=
 =?us-ascii?Q?7SQunYHkWfZ8VdrFRShNsLy0cR5Itqzij5KIjf6Ok8dkLpO5M2r5Yvuv0neF?=
 =?us-ascii?Q?AuowVCp1n97f0DY9bJ0FfK50OTfN1Cb9KlIEEtrWEb6fTlAS1l+X0X+Lt4FB?=
 =?us-ascii?Q?5qDaXaURbdZTYCj+rELV+R0oxqXgkUKfiJIf0o9b9NlipTsL2LnhScPih28H?=
 =?us-ascii?Q?saNuuxbXaMVGlfJG5Ki6mNH7QohygV+7qlY4W1hU6kUkbnaiahbDIvmU8xvq?=
 =?us-ascii?Q?znJPtIVzm24qnaWs1HPPi4sc0AGdW5vHsFPppsxFjfOirFvrUTj+ZvhGbcXu?=
 =?us-ascii?Q?imGRzNkmtK9WPrMCz/iSYz9TY76ekNAHCLS4c2K5V9dXDbcFlt8KqJdklnBb?=
 =?us-ascii?Q?F6ThhwlsavueBWgB6e9HldNyIrPZDUgxWnIvY2kNwxpaZi2mvrqZeM8iEEvg?=
 =?us-ascii?Q?JSDXm8GHG8mULzUvFuddVRmvTXHlekZIzLFZYe+gauGT1uJhm8Y/bGOzHFvd?=
 =?us-ascii?Q?hcPX0DZD4MXaeZnDEKsd+/EufhEm1LZFkzss9pqulgyywJJWwgrLn93nslDc?=
 =?us-ascii?Q?7drzEtFr+0sdT1zAwuHlQbAA64gnU8Di1Gsn66DugYeN1TsrGM31cM7VnCuo?=
 =?us-ascii?Q?hb5phZCG1O/vrJnXqYI0gg1VO9aWb+a/mS2+sIKf3LQbkV+ymx8m98WIEIVq?=
 =?us-ascii?Q?DjZIOrSFv03mAh00OsiWcnldOdkd315nwJsaOOSWZR798JcMDu8vMpe6dSFU?=
 =?us-ascii?Q?aVIoAtHCKqY0L1Sv6YzikefEizYydItmWou2fXE8wEwhP7I8LpL9Es6htHT/?=
 =?us-ascii?Q?DCC508x4afLEMw1wL3NmhmUL8U9Se+CZSJ9X0QB87Zz/Mw7GhUJkOW0iyOEO?=
 =?us-ascii?Q?/EgCmiMtWIpO0uXHobTvax2mdai24iivaLFT3/ygrbc6szifJV0d3TVydSYa?=
 =?us-ascii?Q?GDX07cLS6y7B+PAMIoM1cUrhuljXey3s9K3LIqgvmgOIY+L8kNwKNbKIzSTz?=
 =?us-ascii?Q?Nlp3ucE0c0gekYTHvERtF+J6KSCNrjdnJ5Td2FAXZXn/IKKIrtOzJPNzOh54?=
 =?us-ascii?Q?sX/MlzHmQw3wlP1akPnl6ZboZT+KW1pA2q2mx3ZubcpGGOiOy2N3hNrTjn0M?=
 =?us-ascii?Q?ngfVcstxVLsiq/M/dgFIBypUtQu+RGuVTaxM82FtvUDIhuRbGQBIUHthGIUH?=
 =?us-ascii?Q?xnCvcl62C1TwbmwPrsBJJWhmd9uRqNIxPIM9aP+e5oFCJaMuLYS8qbagn6pX?=
 =?us-ascii?Q?CbqXTq6JTK9EAGEEKM8NbPnWfwQT9oN198dKqsaNyi5aN/xlJWauzZN1Ymvg?=
 =?us-ascii?Q?tfSiDqZbD0cW+GmHarWCjzlSS4HVFEVWjoqAwPix9uYbD3gTAI/mMaUz1rt0?=
 =?us-ascii?Q?t/YVENtfdVbghwoCojfTMiC9+tVQHdK5M8WsHzmv8TI2GVOVRElN/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tW5DGIsi9xcNca7o4ntSc3AEqaSX55K8dH8enFzKy2h7oQJsdIMyhRX5mbE3?=
 =?us-ascii?Q?yy1edxusAVPqRm1yrAJQIF4cDGLC3/XJyqBh12A+guYhC2WymQGllsCqZLgi?=
 =?us-ascii?Q?8+Rvs1aANTL2LnZkmIfpG4LK/V6rumpE7YPEhC9+wwIQzHhJEFB7aPQojdkc?=
 =?us-ascii?Q?8x5SoUy7niDhgfoVEhjrSTnHahVR6xvsA9TgBPyu4fqrecWLPRRIKfX97GDQ?=
 =?us-ascii?Q?UvmZTPx/s8thSqYzRq1FdnHHfphflUekEXjjoZ06Z8jClD1YAO61B8M5gYXU?=
 =?us-ascii?Q?F05mzc50nWU2qiElKEcBiCCl8pCUTe+3fp3r0texQaPrVasAyNMBxn0ZtIZs?=
 =?us-ascii?Q?dbG7HuSvEVUepepKlM7/ah3kH5/trbytcOZAcimVZaMBfr3ME9XD1sCD4VkX?=
 =?us-ascii?Q?ferufHCLfjd1ZRdYXMhJ1r0gJNLPJ9c+2z3yJ+IBjYz/WHrrcCrtdHQ9/bqv?=
 =?us-ascii?Q?FYnxDBloA6nJmbNrtrXi9wjuboAkANNaearloOYD8xLAf7xIC3ZiSL730TbH?=
 =?us-ascii?Q?FBdfestEkmoo48faGiCMMHimZymc3V2JFMT9Qh9CfmRzLPZBEE6flO9aHUgr?=
 =?us-ascii?Q?i2WnBd3RsYQFTor8PpbDLXcQB0u0qYPbkU6uivsfSuJgEXRqa0jd3kiD5XW4?=
 =?us-ascii?Q?6PTwZ01Qa7UaEE5kcBthPtpbPLCQYyu3dW6aPKO6ObgjD2+rlvBz8Cuy1AGA?=
 =?us-ascii?Q?ifv0OMRi8BEPb8ADxVu0O7fr3jtiA/9eJudBmV7zdzTF/jKCwU7ZttKoKqma?=
 =?us-ascii?Q?4HP1hVcfCqBa2sk+zQrdR7I6++On+Tpy2NV3xAjBF0gb8oQUv6OTxHCz1zsP?=
 =?us-ascii?Q?KPmEcJ56Nv6lhRCEwGz1hai554phuCHRtJGdEIbyuE/QYfdHs0ZwhkaL4VcB?=
 =?us-ascii?Q?gajvuSg0kJdqQozFzRB10Kw4R5buXfceAgubWxvXgR/F7O4nLuav7i1Exehn?=
 =?us-ascii?Q?WzAV4jly6P2ziKq7TbqksAMrgpoC5p9MYI+NGpQ1o/YeDdxFic6YYfzfOoU7?=
 =?us-ascii?Q?vKO35OpE+vaGTImqomr6RjYmMPFqtT1JDvEbtNkGcfuS/KdBkFKohEt76ZAY?=
 =?us-ascii?Q?Fk146k47c0bBWwUXxK+XAKdA9IjQnlzZ/MDzxJ1Say0hPGAkFME7cK3ld1ox?=
 =?us-ascii?Q?7Y4McC1CzI0jycwMjC6K1pn6+IyldhE1fxsTBHF5RA35wX0JSHhqk0Rf5dUb?=
 =?us-ascii?Q?uG+p9UDW8y/picuv9EqN7NaIVLIAmlCpYH+m86LZGYTuwJz514JoiSqMyWZL?=
 =?us-ascii?Q?3KXuzeXm+p3yGk2tI5OGuZb2DO9DrZn0woBzTAm20pdRC5R3c+z6l9b4XQc/?=
 =?us-ascii?Q?bcOa0uFXQEyPVb9z+vxEOKBrfDSfOVKLGx/abHToCJ8K6kYRpQ1c/3f3n/TV?=
 =?us-ascii?Q?HIngwpprxzhhiXdCWaw3lSYazi8OXUsiuxKQm+DdwqoXOzS9ikGbp3KXr7XH?=
 =?us-ascii?Q?RlxZs4PSzAqJUitceqrYZaQbN0fQaJl/XQVwmKZs+pgdB5wjvfG+VVnynh9+?=
 =?us-ascii?Q?mg1tBVKDHBZJOh6KosjZeyUuKXBkf+E7OxwjF9jzHhj8XCUwzr5FE3hfEtE3?=
 =?us-ascii?Q?RSMEtn0SdqlgkRqgWUImBRYyDv5rG5yP6PHNbzYo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8036c15c-def9-4a33-817d-08ddeba6b343
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:32:16.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPpAKSXC61bRT3GS6Hc+A5msXpm9esLqgSAPNhKIiI0kF43fWzT6fasJSMJ0dD6k0l91Q8WYwEIGAaJ6qzYW7g==
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
 drivers/gpu/drm/radeon/atombios_encoders.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index d1c5e471bdca..3d9f47bc807a 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1832,7 +1832,7 @@ radeon_atom_encoder_dpms(struct drm_encoder *encoder, int mode)
 		return;
 	}
 
-	radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+	radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
-- 
2.34.1

