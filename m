Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5299C52B6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E86E10E5AF;
	Tue, 12 Nov 2024 10:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QwMF1O4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC310E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCrZF6tuJ2RCMteS7iGcDLv9QYBsr5yLa7LlACnYs6dAWHWjyJeb2w+nm8Pwocbi5KsFvd6fG2UGrfoejeEtSMa32Pp4jIlCWAbX+/N9MINTvQLgFBaAoRCvTKriMmBVbBjlGydCrvG2PTcks79EYPVpoPO8peKNmk4NSLDWwbmHpq+R4nQVkd6T5pYbnD96kew4oEsotoB+suHVO5RqwevVQyYAvd/+BXafeWiayKjblGSV/HEImYAXtpm8OKVibDYS2CVOwgGl/+YxLAxJ9nNM8r/Bis+rpzVlNWzQA8K0LcS4IaIx+simKUt1V85yGuQKUga/0Ka5WUqVipBK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0ooql6tJx9QvI6HzImFAbKMebLcspbeKsCrIWpXV3Q=;
 b=c1hQ+MrxgHqePlSVBRTLS6c0oSXXf19wMGklh6B+E1yy+r7qFCyQG1WJ8fe/KsjR458r+Ct3oWV+Wns5UVKXjMGOq/TEZzR9Yl3X3T/ZcymlblJJD5a6OB4SwKirsAzB8pXUz5LrUNhOOT/X6opPDt3aIJ8o8Wdd47SUZTxmgYQLLJUkwT9yIPQjVj8c3sxYHUn7ZxCn/iF54ADbkxXTtBhopTnrn5FLRw3aLLpBV5NH0qpmurtzh1T/aTVyxImJARZ8CauZjV2EBZGjDOtbaYNpqVITVnzKvx+oTDa0RJZXpikGKMSVgoaNJvSlt0072NDV8yQ4cKm8CE/PB3dK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0ooql6tJx9QvI6HzImFAbKMebLcspbeKsCrIWpXV3Q=;
 b=QwMF1O4rVot27CWfjhgLcGPSps2jQ6tjpiuQW1k60oqYsnPhbCJ7h+ND5KJm59K+jSd8LACo+aAojq2KrVNrntQw8+Kswfmr16tCLVjmjJ6Ylo5/uikk8LS1zVuRxwDz68yQUJCSaTTRaknMNgIYtrUQ5Kotpvu2PA0TUcyw1PUBNQ4tB/0tWBOaY1yPUS4glY3JqQnJ1LMsDfTHAID6l9lux3Rb0v3KADRvMdf9BlGtSCJoMewATqQ8o1VG6oPSaXnRq2G5pS4yN5+xPgWJtsTfv+NB/AjzGzyhDsM4E5z5OVJe7pcE/vyopZMwcd7RGuc4aIsb6tO9xmIekwTaxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 10:06:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
Date: Tue, 12 Nov 2024 18:05:47 +0800
Message-Id: <20241112100547.2908497-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112100547.2908497-1-victor.liu@nxp.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: cc538929-e9de-4940-dfe7-08dd0301b977
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z7tFFzDALkKSSMLqXkbVuHRpwTIBDtrFg9AnU1tpXznhl0zI+SpBbRZSFlSz?=
 =?us-ascii?Q?e4Blrul6Ji2+KOgTWiJSOJNB/BBbDvmQI/3I67p1f+x6cds8iC+dTa7mYhVC?=
 =?us-ascii?Q?6ufGu0aIuruPU61r78lLtFBSLyft1w3PGrgMcRZI4zW/eiQZex8YWXVRm5sa?=
 =?us-ascii?Q?3Dzj6nPqmUbRVLuYtECdpZWgS642JJYHDKZBzYUAiFR+gDZ1td/KjkU2/MuB?=
 =?us-ascii?Q?0D9GDj1J3SVI/UStWfEaSvc7I60ZqER0M8Rvsc92tI9vNwY5Vu+BTtZFKNcU?=
 =?us-ascii?Q?1pYQ/G8/lhYDkG1MImcd1QhqT2mVQ+l/PcJO6HMxQsIZ+nsNvcC2N+DzXbzz?=
 =?us-ascii?Q?1vB/Uu3a1r4lgflEwONt/rfFaU0xPWE4Eh/u8ZGNakGYsFS9n9gU+AcxRkNc?=
 =?us-ascii?Q?FDwxLobDW4uCn1LR99a+1xguWMw9DYWIDH7O9sgjaQxMwkogZz8qWDcn4T5o?=
 =?us-ascii?Q?KLCtD2c3FLxJGcFFsYzMAJ9y24+TEZ3oBnbEpcIhx2B0CNNquCQ5d7DEtX7Q?=
 =?us-ascii?Q?wxtryvnQqnSrJY1ElVdeUIvUJsmwLOA3MyDS5bw2aj9rQZftLQhdsAzpykeN?=
 =?us-ascii?Q?K9QAW8rrkRVCwMmaO1NimZtUDsSZwDtL1S//PwSsvqzJ8Lhy27DDkNF0ppa8?=
 =?us-ascii?Q?ZCAOEVHFX6YbuyAUTzvYvAWU63+o2JXxJFKVgtXJwL3NEfJilWAaeDr1FLCR?=
 =?us-ascii?Q?M7NBnbVnEBbUk0OSzmYpTYULzN4hQI53GiUEbuHA0DECiB9AOIv3wOGCxbDe?=
 =?us-ascii?Q?BLn7mvKCuz5i05zQl4y5M0VK9jZifxTJUqPGXG9g0XMowbEhgA/EkLxtd6Uy?=
 =?us-ascii?Q?CY4rqGwSN5RhTq+yu9hgsySpwFTfWZgoSFuwH3O0Y6XW0fFB9SdPKneWn/uI?=
 =?us-ascii?Q?unutb6zFTwERcsEKJCLw7H9ZES6j53ELGKpBwdKrX/QyUkBTL44qWSlqsOdg?=
 =?us-ascii?Q?w/QFWdswbVeldC+b5g0WpuLI1SWf3gTnN9HCNSn0ktMt0zK+YV2Ls8SDiZgo?=
 =?us-ascii?Q?p++1pMAPYYKbN/b9XcBME+7rE/DA9w3JGSAAk/wtSSMSQ8PHpSfsWt+34Ne/?=
 =?us-ascii?Q?vFB3v0HF6g6IUv9Aptwo583nnhizj2jkbmw+Tmy/UuPe1zxeGe3NlxUvLrJm?=
 =?us-ascii?Q?R4WYevwLtGTXRYvylbPyoUfp2sAcQcrilU0/gq6bw6MumvHA28FRPphBdDMQ?=
 =?us-ascii?Q?GGBGMZkmJAvge2S/to1AVRx3IIz/hQcgRS5YTVUbePa/BsoRcBVymscN8Cvn?=
 =?us-ascii?Q?nOlnEWY2Q3MeH8AP8ZcitKz011E/cnlWlMX1nvHSLgIzxt68wdZ59H2xpipy?=
 =?us-ascii?Q?De7HUEfxL9WvHWfJMs695Aa/nYWwrscXn20AYLNqfGYbSotVfEXk9MxMEliP?=
 =?us-ascii?Q?yt5V9OU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CWgn6G3XPj9RGYp11WWp63P7J4ABdj/ycsummiNJG+pi9TNK3w/IC08xOQAg?=
 =?us-ascii?Q?aVQItK9VdaiiDGM78dlCoebUdluhTvJZzo0eIu1EauZ+0lA1fn0OEkH9lPNa?=
 =?us-ascii?Q?5qnxbnlK91Yn2kKNaQF8jO2ziUnyXDtCuKmii5uluE9SqxY/Kj7v0AaDCIJV?=
 =?us-ascii?Q?Z9PvJsTJLwQWWVe9uO9HrwC4uRFrz8RTZOTit0SMi3NvSieFL8dONqCq2+GS?=
 =?us-ascii?Q?9ydmudHmzDVcAmDiCpLcFej9vrV01dniab9SM6ipjcvz+GX1OKOukdrmJ5tb?=
 =?us-ascii?Q?GxkjneUKfJx1Q4l1vQY2PPENV2W9YB5asWuWwnM3HEQrkpGGFhzFNBtCjmck?=
 =?us-ascii?Q?8Rw64pzo/EC3kqcvHyLY6CYgfgrgMv/cSfDga1tkTvJc+uuicOu5RxHXNnpD?=
 =?us-ascii?Q?yY4rAzaolwS7d3XDhMp1Oc30rwLgBUsoFwsL9ruyALy8bxHGgF6Bflr5ZyW2?=
 =?us-ascii?Q?NXfj65TNMQci7IQxjiMKb/0gJf8qIq2SYI7xwP/L46z9eqEFdOqH/Vinv67g?=
 =?us-ascii?Q?b9eDdRAsvAco6CyWgyqV7svxdbZblMCfTSAor2g+9yh4JseMJPbzsdxt5G2y?=
 =?us-ascii?Q?Fp+mPCwCS8Zu721oCuPhY9UkCTnY/72qGilVc8yNtiBRtOVyQzone36y6ZFL?=
 =?us-ascii?Q?wt8woSbM9UZGkNUyBkdIF3r0nveNxjJLvKC/mkaLNi80wo5B58YkbFiB55Fg?=
 =?us-ascii?Q?0zV74zUHbCOgHBjDSTGssqcayHDQ/pB3uQT+fmVkqF1iuHng3urBkaKAkBXj?=
 =?us-ascii?Q?KOE8O0V+j9m4DWI9X9/A8ig+UpWI9eKHwLjbEV3ZWEFgAK9G8+h4AKmYesNZ?=
 =?us-ascii?Q?1Ab7eFqRhfFj8fPlos0dfuLL5+5/+1XFjG/6c6pWjw300MF71xTp6X6iX7A/?=
 =?us-ascii?Q?SMKu10DqVw/rw9/4oCXU0r/MPikAb5lvdEqxDl6E0WoE3pogfAcmFBty7xTy?=
 =?us-ascii?Q?wtUFgdSVWuW6IqoK3AvNOMWS9eRpzETBVEcLdgZw1bE7IcV272AaG2Iy+YXV?=
 =?us-ascii?Q?zf5W1Ah9hl4Lw7UdJLjpqdylD7+TwQ5XFEPYMVviyyNKOTEg47sfDK1PEMLV?=
 =?us-ascii?Q?OT2dxWUbnOyc7I6im8n5wFiiDIBFfW1zsfQqNL69hPKg/CiIyvI9ZzxUSfNX?=
 =?us-ascii?Q?F38KaLQ+PrZmNQYmM5rgKkXNlH9/zvTj6XF2hK2nCtnkpMusWyW9FI81pko7?=
 =?us-ascii?Q?2bhjUdS40eKyVPK7sF2RCwL+k4qqIOMjuzTbbduLPUaWXue/U9+jKlcKOGP9?=
 =?us-ascii?Q?2XLFCibYWBMNlFaHe7bMBweFKzLK7e4hhLlJ0ywRTv/rbOmVmmei3l6A6NhZ?=
 =?us-ascii?Q?8DO5ZPa5l9c4favpC/mMZ8kieIe7w1nxP7xpXZoMH8Qn8xSElAnGP74tbdc3?=
 =?us-ascii?Q?/UW/8H2JMvhNa1o3M7Xg1JyM76cGoHAkvz8Ys5VvEtOQM5Mntd+ikvE3uBs1?=
 =?us-ascii?Q?2fk+SBh3fhgXk5qR5j13SbCdyNXJgr5QhlPM4Dve6JqL20V9TJUpX4AIQ+a7?=
 =?us-ascii?Q?V8MMim86jmK4rGZEgYpYKIvVhqfftRrIriIsz2F5FNJGahcQDkO1WFO/gYKK?=
 =?us-ascii?Q?EopdBfxssoFn9A6ohCfV3zyrevlHIiFd1uycLwOO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc538929-e9de-4940-dfe7-08dd0301b977
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:50.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv5X1GG2QYaSRVMXUmTGPnboqgg37DC7T7gUfIjTQhsfqfeIewQC/+/mUmrQCpUSE+hBwC1fp0bqdVczT5dswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
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

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..9b20b75f82e2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -901,6 +901,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1

