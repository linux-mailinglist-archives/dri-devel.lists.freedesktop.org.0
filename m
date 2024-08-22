Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055795AE40
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF0E10E789;
	Thu, 22 Aug 2024 06:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="G6WGwiXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2050.outbound.protection.outlook.com [40.107.117.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223E10E789;
 Thu, 22 Aug 2024 06:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIFdC3qZQk4992qbNI/Fz7MBJwjMomeSM8Vk4oUIh45cAyyYQv7Yl7eEUl/3guHWGtYCkK5sSp79wSx/f1SuXeGqhXT+UGLolISBa3WSnE43cLpaXZ2gAblWf0hdhjmz2J2IfUV2Bx1sPSju7ApWj1sTI+xggfHg0FFhaiMguoA7GT6Ug/fAHJ4eAW76EG3MUac1jxR2YBH5CZWCv/2lJlI5X1khUMUxZ7xLsZJJaUy4onTnIl2WeR/ZYBEn3frvf65JQLPjeGFNRKY0/nJ2jOP3zMqpROaKlUabaZlWuKJXVkPYpMe6Aeo13/Owhph+wtUAd4NU6zKzA53yqxwwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=sYx8mg8yXAXNRQ0ot2xV2TvfoDNhVL19hU0Ge2MRVZZV/YQSu4yrtsPrGM0UCWcYcgChJi1cBDz8dg5ba1rhZgfMDU4uYk/LuNToXTkD5RuBqxPAKfDyn5SKBhBXMJkoTSlhnOyoVWS4qYxAzKbW5DKQcWPu3ggkMiJibKSqEX/MZAnpESjjwxnc4TkjGaavxVH29M3aMrzLjCCTT7jBos6axeez3rCvdnzEL7aIyW67Opwxkru33NcalJQohp2QB/burXokmthw9npMzwYgr7z5hORp/tToSTb7SyOfHSs+Ce/yXO2mN+oURIQ5WZrIPQMXFZOZpPxRhOQMWZY5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=G6WGwiXmFgPHtLndtyKrnmDonClwby6Gl6hX/ZJH+fdIAtekeLdju8XcSgvzR3cr84K1B87u633BwvqKod6W5yp6HjTFoZJ+JRbuyo/QbLdpIsSAUdLWbYVZDhWZXIbCC7NqZesSAGtFwX4S8zS5A+GjpW5PbZdN9Qod7IuTigQRFYE6JHYJWEqV40S2ruolEeEug+5PVfRgZyMUEJZq9y3Mossl0H24lZOb5/7rGfX34PRvQSGdIBKVoWT3jd73d7Hyx+GqjKxDgGJ0YlfU6wYNlOeX8mCLlORjnqKax/2Yn+bsjgyDaDRQGrbPD1/XjOV6cj9v0HNvf8xYoj9bdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:57:42 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:57:42 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 1/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:57:18 +0800
Message-Id: <20240822065723.1336181-2-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065723.1336181-1-yujiaoliang@vivo.com>
References: <20240822065723.1336181-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: b77d6580-f358-43aa-6718-08dcc277b7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I0q+SS+VIvNrWTIbEm+Vfw/ORIxIJxTiYFGX0o48mkDLWiydYT2Sta+jNxn8?=
 =?us-ascii?Q?mhDDkYvpsq/ZAuq4qjSDZcCAjnxnthSXOzzgiHRvhtAH05mFXoFUDJyAuLoi?=
 =?us-ascii?Q?g2h9Ngr3L0WW3bjGcIMHyLUj3gVZ4FPzwtBPKOATAxKzGekxaimOKzZXHWvT?=
 =?us-ascii?Q?93dUAM4s6/CVgLtoOAKWbAyeN3juFOINfRfwD+Eq5I6NFm/MvMZj7CywPvSB?=
 =?us-ascii?Q?ja3wN4ywrulBaOgrjWM0EjT+HAGyS6cbypXArPBq4qZmBTNxCnw2OusbvtaA?=
 =?us-ascii?Q?VJ/4H+QAQ5XQF27YMagHyTB8nuYI2slNgnRL2CZGozfrQe0UcQW3Jtfsay8h?=
 =?us-ascii?Q?ktPQxO5ZE1Vx1WpRU++6uJS9lR7UQlSOZMd35EVeqs8yFwtmeHiK8bgLCO11?=
 =?us-ascii?Q?O7rbUGzbDb07iLamJkcRTZhuRD9/z/HfqhnQp74ldR8jzKS/9VsP9w0Z30GK?=
 =?us-ascii?Q?kyp4Q5cu7uAaHb/kCTohpu8uHfdXiDaQIt5GTaU6nPP6bJtOSbH4XlMtex/q?=
 =?us-ascii?Q?czIxHPPAuKdAtHe+Zn0UBAzeslZKIuPHKh3q/RJYqkPLnGz5eZcS2zTXcUmT?=
 =?us-ascii?Q?s3Kde66lfciWT2hH+th4pa6NojDoq2ujKBi1u4dzMk0shF/ZTBMBDpjOj57u?=
 =?us-ascii?Q?2LsdbktX8Ei+sJBuhPGxw4AaN0lNy6a6dQsRl6EjwabP/z1shSD/fd5Abl3P?=
 =?us-ascii?Q?PWoo6923rIBFqzIC7YlkXB0YXpM5/ac9i4UpDUlq7Ip9Ai+AqP9n6QKYN4By?=
 =?us-ascii?Q?+If3yKPQZvaonnOpg91NleQaqB+Lmy9Cd+x3kxhrCXIMZZCNWQz7kEdr/fjf?=
 =?us-ascii?Q?u4G9sZ0gpBJYeeB658DwFN6xalyhpGNQTV29VYLasNJUj31h0cM4kIGSgL/r?=
 =?us-ascii?Q?9dqvD9QPAP5QANI6oJolw5qjruLqn2UNrlkmIXoukJwN5Llx3OsRKp+g2AKe?=
 =?us-ascii?Q?PkEspIfu8wRx4eZfZ/9bg6/yJtvwM4EFOVdzLU0esFQpOWfV3hCPzGmDVyUx?=
 =?us-ascii?Q?vdrGb8db+HZBDKjPTM8yn0vS67i+yDiDtj2p1Pz9/VQpsjFjeKIr4nzMsxnT?=
 =?us-ascii?Q?a5FPTFhwWhySUBGCIgGEOLPWzt2/knXnHSe2R/THA3VTR5ZgcTezaijYuZMq?=
 =?us-ascii?Q?Wx6kH4yGyEoxDPtZRmGLcp4C6CvXHxLieX9JXzJGwMZRF8urWpRn3mpTSjyh?=
 =?us-ascii?Q?csXLTncfOutNcqj99QQk9bWpgGuh+3H022dlFMxetuBDLl5lQdnwXxICE67M?=
 =?us-ascii?Q?6RBRWx7zQxd7QMQDHVy3gya/CvBcqJcdHBULVBsADmCoBZ0xx3nR4uWMrbz6?=
 =?us-ascii?Q?zbaiOsXw8NI/aLUIIGRCKujIn+0qdE8xAYlh6CtsQqxdsp51G0TiDHqeXmni?=
 =?us-ascii?Q?OzgunAoSIYWzKim49Jn+YD1Yxlqd78pCjTW9rk2aSXvqLThoHHb0OmCY9Iz/?=
 =?us-ascii?Q?iuFvAeQDgKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYjs0V+LXl8Ut8X2SbZ7Nv7qyxYhOMbSYQOM3UA1hkGWGrjuhfnkF3RaigU4?=
 =?us-ascii?Q?u8uQ9S718G7AcYW1e78XkxVV+SfQ9d5EmK0GrdoKCAO5r+YYFViPqvYqEI0t?=
 =?us-ascii?Q?qbuODbK4KhZXUvR1ifUNtcNNro2tgLv6B7pCvdZ0lgN8j14+39wS5/te8+Iv?=
 =?us-ascii?Q?FDGYSKpGIKa7qYbhBbaUomMELUZWi2/8uDs3Tw5llv27AxAQIiT3w14INbTw?=
 =?us-ascii?Q?OItoICs9HAWSaLc5dClxBU06aL+6oyHxV03CWIDkkGyqoUaNiNNHVJEFlC1p?=
 =?us-ascii?Q?vO2WO2kAmyPIyXnpD9WPxI/dkX2M3qxYBljj+4AJrWVzmN5QkwcOjSZL/Uz/?=
 =?us-ascii?Q?oJ3GblXK2akyG4UsJFm+vG2QPwId/+r+P/i6rmedrEZ12mkmuOXz2Fzxfss0?=
 =?us-ascii?Q?rdgvlhkDzNam/w3ARwBw5K6stnr3msY8Z8FvEXDWoqELv4bYRcr10pP/ai5s?=
 =?us-ascii?Q?C4JAmaMh4Ta7EECuYfziUMbLTR7uzqSv2r4Oy3u0e+TZcek6L/MpjWDwcPMY?=
 =?us-ascii?Q?+krwA8h8/vuLZTolyk9UofVVS+cJ3Gbb2s/ACP/HC9yCMBFaJky+G29aHgSM?=
 =?us-ascii?Q?UvjQdQkYDtSH7SdKvTVG8nqac5PxIdJudKZUVY1MKOvwiCwVJmqF+WcMVw3h?=
 =?us-ascii?Q?XDQSd7zJ+IFRCIr3tjsp4PayMeio6f77NeZTD9i59PNxiVpejJ2Fybnq50Hr?=
 =?us-ascii?Q?bnGWUf8piOFYKO/CFLGirIoUa2JSdLPa2ofwj/xk+gU9WQcf+/s0WDPiA1oS?=
 =?us-ascii?Q?/KnAGH66BemYMBVZZg3dKOz2NY8J6UTmcA+yOlr7AokqUOwDscFEvYHMVFzs?=
 =?us-ascii?Q?6efrwQIj2Zt4CysQQHMC0hDnZlvTKYtZf/UbX9G0kWykeGOdbYEDgxX/IhRm?=
 =?us-ascii?Q?IB/7lamh08szkE7ot3IssTwwe2aAXjkGm/Bh/zh14Hq56PMMYCTgmOpkNbWN?=
 =?us-ascii?Q?4SBdXtoBbAF55f5DWDJZ/zaQXcdhHJ7olZalVlU4vOvx0a+n6YSUUOW2pDpK?=
 =?us-ascii?Q?wNHiW6O6QdvOxVJmire040JMC6qEuyW+UPt2L2PIdfMBrt2RsNA3ame1gsmY?=
 =?us-ascii?Q?BHm56a/HLIsp1erVYTDaZ+uT1kjrUqeXZ7gCjXAMbboeJ4lwR5W4Ye4dWvgy?=
 =?us-ascii?Q?FjzL3GYIAYsRFnyX4XP6EBeGyzoULMUPjg7fV2q+ICz6/1MXs9gSzdxeqkT4?=
 =?us-ascii?Q?C4JnMMQ4VYzkjUX2SgS6fDQmcQgaDKHi2gCAGHL2QBs9mrDuvkpOhl/jGep7?=
 =?us-ascii?Q?u4cIm4FggS+mCqwKkQ9L5dCPsKwrTN4ga4ilgiYgk4LVIAHkCh9mmY2J9Zni?=
 =?us-ascii?Q?7UKG+2cgpe+t4bg4MadQFCNJrpll7sH10jcJV8BvRuNP92ZoZLcv0yo9BYFK?=
 =?us-ascii?Q?9apnJl9h1HJ49kyNV/cyMwC5K68G/no57gAzX33j/VcB/SqAG79KTNYZ1yXF?=
 =?us-ascii?Q?Vpr1qZhk+zWwHArGIEMezqOjFAOl/iCWIqq/xf0lCxCq/5WpRISDm9nXiiQA?=
 =?us-ascii?Q?i90Ck5C/t3ggNQRlFJVz885BFuoHSFs3IFzetT6hlNIOkbbj48xfcyD8cxFS?=
 =?us-ascii?Q?avQPw63Sh6iXVdDUo/913UrllHR1s0t3+DA2uqgD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77d6580-f358-43aa-6718-08dcc277b7b8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:57:42.0609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH/wQfF2fG6ESyO2PDBAz31piNXdJNBckutnqvHsfHLg09JGjuALNzcp7R3wTFECDc/T5cqQcZ2eZmYDS3VyeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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

