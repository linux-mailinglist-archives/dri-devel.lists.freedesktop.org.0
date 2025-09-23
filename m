Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35EBB93F21
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AF010E52B;
	Tue, 23 Sep 2025 02:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OTIe/ycV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9905810E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:08:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyUQdTkTHCszo+7jI2qwilmQ0fUOIpwRieX2PqeSCp7/zwYzEkLRq1QXgmhLcKrliXAvPhhYJ42hfPawXfsQxbzWlD9yw7la92J9lT4VbgalpHsMwJCMSGFU+YdA/aCMt8D72zE6qiFOfF6uQqCEvVjGHlFK2d/U9k15lCVpKSxdjNWqYomhNOm7LsU2nIN+P9VmATwkh5V5cedduojS4SKGQz71xE3ohe32ClKHF48bmGCxEmQc5HKsY6mSyoB5g+74W+rpYdtwXZ5kIcLqnMyVViSwovLM2luGf1CLQEy6Lrty/+wKNn5SrAtieCCcxzh/eCKgib3Zki6ybjnBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7QLXbjuk6fNa2kO2V+f8b86lDisD70Yao7aPtQS8Co=;
 b=pgiUs8QTSQIMf7DixzpdbUvy4expJuZaTyk7cBYlMPByBWViX5KOa8ABD4lCQapPajseORC/DYP/+fLHAsuupmpsMKBmJHzoR1vgMXp5ce+AU55CTMfinKjaRBE/yDnKG1twI/fOAj7EcQ/5rNr1JXGcj104BvljhjJEIQKwaNq5VYXrqZ/YFzAu6+MqxEOlUdovR6Ugq1DegLXJntDnkws5XGHimdDefP8vt1xSS8L1hCToP5uWGMo3oW09iK7MFG85SZeYLoQ/kBuEMyCothK8jrQ5B1fZeKULn7jKzqZjJEmco5hxvhtAWSFMOQbN14ZLQ8M56qRERSPXWGwa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7QLXbjuk6fNa2kO2V+f8b86lDisD70Yao7aPtQS8Co=;
 b=OTIe/ycVM0Bq+H0p368fC4yVfCdAo16bCk3j7j7zBYQk0xucuqQ4icZvHNHqHC1r5ZBgeX3q59WxPJ0hEMYw0+EWkBchiqQA5qFquTOa8HUyaVknDk42rxkrfr2RhMjez75C9oDdH0oAqt6I5N4VVUFEG3KiFtMYX4tBs1bMdttGwys25NVYNEujcQ6RMMugXcPrOfx6cC7tuhBiWqzDm08hP3GAe1Lqgkoe4qEUy8ZDRPWDhdt0LLIJ3Cqe2Rh4gCieq7s+dPh8Yq7LJSNZQc1x1FZe1+j9oL3eucIUmjyQ6UYxoemkYtoImuejiz8VBMWA8oyuAdM3T+4CU6h4UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:08:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:08:01 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:08:03 +0800
Subject: [PATCH v2 13/14] drm/imx: dc-fu: Get DPR channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-13-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bc0255-3b37-49fd-d58c-08ddfa46062e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0JmSUNhQkM4Zjhkd0RKbS9sQk02Z2NrZk11L2dMakh1cXdsVDFDL1o5aHlS?=
 =?utf-8?B?VnFZb3ZRa21zUDVOSW83THYwMWRGK2N3TjZIZm11YlZUWHFSYytKSm00SjRm?=
 =?utf-8?B?QnFRZ1RJSy9OdFhDT0xpWjlPRVBBbkxOak41Y2pNQU1KcmFjZGtDK0lqQ1hq?=
 =?utf-8?B?VGtJUW1ENS9yaVcvWXpiWWZiZFRpdlBUWFZoNG5rWXEzdW5MQTJyTDRSdEZs?=
 =?utf-8?B?U3lYc3lNSkI3NGpCdHpmN3pvM0pYSDZzNUNidFVvWjhuV1ZCTnVuT2dJclRB?=
 =?utf-8?B?VEdtdG1kTGgzQlNaSjY1QWd5QWU2bUNxZkVrNlMyRmhjdDRCZXQzSVlCZ2hp?=
 =?utf-8?B?M1VDdHdXUkY1cXN3S2s2WEFOTFphS0NjWFd4Vk9vczhXcStLVnozQkhWOG9q?=
 =?utf-8?B?V3NjbXNyb1NtREtwWXZQbWIrUVN3Y1orTjdRVnBmbkdRQ0xaYjVSaXJWMXNC?=
 =?utf-8?B?VXREOTlNVXA1czBTS1Y5dnVhZU9VUFdFMUtMWmhXL3dVMkE3QlpaVG15eFRa?=
 =?utf-8?B?UHF5TDlPdVRZY0J4bEg5WFdSeUJvckt2YnpGc2RTRkt1YTR1bFdUQm9tMnNk?=
 =?utf-8?B?YjM1VnlyNkFKejdjZVNKWEhCYVJBREg3a1EzYkp1SkxRNjFPbjh4UDNWQWtv?=
 =?utf-8?B?V04yOUJPc3pIWU53Z0V1VkhxSUZwUWtNNHhhZTlaTFhUS2x5S2VrczJwcWdi?=
 =?utf-8?B?YmtNaTJjeHZWYVBSaHlHbFRneTBuai9zK3dKV1hoUzNQaDFBQlEwZE9HYncy?=
 =?utf-8?B?NFo1YlZZdGRZRzQ3SEN3T0U4VmdQVTYwa2d4Znc1UjNPNG1McUNWdlhnYnYz?=
 =?utf-8?B?K2hRc2Nib0JoN2FxTFY1M1Vvd1BvaTRiL0lsYW1PMUtFZHgvSVBhUmU1amtG?=
 =?utf-8?B?NlRObGdCOVFXbG05bmI2TDU3a3J3bjVQbitXckpGdzRCb3pYWHhQb3FWS2s0?=
 =?utf-8?B?UEErTDFGWlRYTGtOTkYvNVdsMlo4MDJJdEkweDB4WEhiRU15ZW5sMFAxVkxa?=
 =?utf-8?B?Tllqd1Z3dWJQOWFmcjNpRUh4MzJUdFJlV2ZaVDNxQlFqN2hNY0IyMlFUamJH?=
 =?utf-8?B?UkVNenJaaXJhaXFZVkwyeHN2Y3lsS2llUUNBUkVNOCtlNFpodEVXem1iam05?=
 =?utf-8?B?UjJva0F4WEE4SSsrVXhCajFieEE1NU1MSFNrckxPekNGVWVvZ2VpMDRway9E?=
 =?utf-8?B?Rm8rdlIwWTFrUzFicy9VYnJZTmJCODJmTUlIeVlvdHZJQjBBTnpLbkVNNk42?=
 =?utf-8?B?ekhzNkIzMFBoY2Z6ZFQ0ZmVRTFJKbVg4eDdDRTlMR1MvTjZZSjNIRzhsOVhG?=
 =?utf-8?B?T2srUm1sWVVnZHJ6ZzNsTVFSUDlNSm1uRXRLZEZzUy9JaDQ2MEhNdFIrUnU4?=
 =?utf-8?B?YkU4ZUNjcXJCa1JkZ0dhU1d5a0xCOTNzLzg3cFkwcXRteUxaamVOMmdpb0ZE?=
 =?utf-8?B?czdWUCthZEUxeXZWNFpLakFOMU9VajFERXpxN0xWU25FNzBoNnVFVnJZeWts?=
 =?utf-8?B?dFJGZFppY1lIVkV6QUg1OG50Q0pWNkx6d3pCZkl2Smd4WVVKTFRCT0RQd1Nv?=
 =?utf-8?B?QmxtSFhER0VIVVFUcnhra21GQlo0Wkl2d0NTYi8yL0JxY3lVV2p4NDdDSTRQ?=
 =?utf-8?B?OUM5aHhlZHp1YWtpMWRTZG5JTnFHcldiZGN3QmEyOHgrMlYrc2FTVngwV1Ju?=
 =?utf-8?B?QWh5WkpyYXRYRGs0YzcvdXY4aUU5SCtkYkxITnFLd0Fid1hhTWJhRkJ3TmlK?=
 =?utf-8?B?OFRXY3NGWno1ZitUa01WdU81bGx0Um9LMG1lL1lpYksreWFaOE1KbXRSVzVR?=
 =?utf-8?B?ZHErZUl2dWhwdUR2Z05aWWEvVW1seTBTUkFkMkhyRXRJbmR6WFdkamczZjNX?=
 =?utf-8?B?aVgwWDdDQks5cjkzQTZGY3daY2V2d2c1S3o5blBSUDNOMWsvc29WVzhqNVdQ?=
 =?utf-8?B?eDlIYjQySXZRSHBhNzZCUEFLb1l1a3hvVVYxNnYzeVYvYVdjYTdheTR6LzRu?=
 =?utf-8?Q?SXQiq0H4bvEKB7KOfAGJXsPSsyno4Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHVTdHRxMjFXejRqaCt1QVpKZWh3NTI1RFVpcWtyUGlyZEpjY0N2L2Y1dmtj?=
 =?utf-8?B?NmtrdDNud245UXlha3F1SDNiMU1oNzB6c2ppSEpodGZDdlVoWDRJN0xOOGRa?=
 =?utf-8?B?dlNyZU9WVHlCM2Z4NjZCY2FOeURIYzFwSFVaTnRKYjVSOEdpYm8vN0RqbDRu?=
 =?utf-8?B?Mzd3emJ3b21uT1plNVNmU3JOenZ0WStDSWxRZE5mMWd3SERuMkl6ckxzRjFo?=
 =?utf-8?B?N0NwNzVEd050K09mT2NiQWIvK2FMYmx6L1o1amVudFVmYnE5bHc2TWtyUzdD?=
 =?utf-8?B?YS9ReXdwSnVwdndOM3RhdjZRM1UxcmJSSGwvdGo1K2dzaUkxY2FPd1ZoWWxl?=
 =?utf-8?B?TFBBTmlmUzFWOUVhTW9KWFlHaGcxZHdrUU5uMGxNSHI2am53aC8wNWtKMHFS?=
 =?utf-8?B?Nzh0R29GMVFULy96c3FaT0d4bmFLSUxpTHJYZDIweFRYcjNnY3N5MVQ1aVM1?=
 =?utf-8?B?OGQrZXVRdEs2VnRwcFBOclUrZG01bGFldWFWQnBUUDVSSGhZdisxWmQzK2hD?=
 =?utf-8?B?SS9uWmh4NGNiRXMySkNDVDFldmp0amlham40c2dQM0x2b3pCQUZMSktTOGQ2?=
 =?utf-8?B?WjF2ZXJhL0VlRWhrZXk2dFBWQStwRnc3WHREQ0ZpRitVSTJhWUFwQ1k2aFFy?=
 =?utf-8?B?WmZ6Yk9nbldnck5veFAwelVLZWI4VVdaODZnYlNaOFNRaWtWM1dESFd3c3Zw?=
 =?utf-8?B?ekN4S1RoQTVRREwycUVWcWlSTTZlYW45SnVERGtMMUE3c3YrUVFvODF6KzB2?=
 =?utf-8?B?cCs1RTd4SFpyVjNIa0FjbE4xUHhpRisvQ08waTlEQ2JQbVVlRU9iclgzTUhs?=
 =?utf-8?B?KytWRjRLeWN6RzNSMWRyT01iYWF1VXlNdlI5S0NCV3JkS0RHZzQxMUpyNElz?=
 =?utf-8?B?blk4d3VtM0lZVFFkVXZZSHZ2ejFtNy8ya0lzSXFwNk1mS0d1WVErZXJMTlhK?=
 =?utf-8?B?Q3EyRWlGaTJTSmpDRm9IUjRMMlVVRm9QT01GL09rcHZyYk8vUlkvSGM2UU9u?=
 =?utf-8?B?QlpzdGpqVVJqa3lWQWR6aVR0ZkFkVmpqSCtxeW9KREd1RFcrT25MaVp0VzVS?=
 =?utf-8?B?cHBTeDhhMTlOY2tsd0ovL0hvamNQeGZkcDhmMXAwMVBzaHhJc0VWT0pqUjlr?=
 =?utf-8?B?cnlLWnZoUklveGNsQmY4SVJvcmliV29lZyttMzh5T2grdlVrWWxmVlFXMks2?=
 =?utf-8?B?MmJlWHM2ZDNvMm9ld0JiTS9pUGp2REl2ZXZvNXBDU0t2MkxJdHN4bWNTU0Ri?=
 =?utf-8?B?akpWOHJjM2paZlVaKzEyMVRpZnA3cE03Zzg1MzZGYTN3RzF0aUZDY3JURzJB?=
 =?utf-8?B?OVowdzZmTzg5Q2NZcE1Xb1Q3MGxGVkUyR0F5YVdTKzNCb2c1TGovME8yWkJj?=
 =?utf-8?B?ZTAzTGhaNXRWeFpabVhjdjM4cGVoV3FXRUFyZnE2ZjB4N1NGWGJrTnROcHZN?=
 =?utf-8?B?QndTV05TZVR6MERwWFJEaVpUSERnYUNOU090UStpTU1mcTJMbi92NTN0Y3Ru?=
 =?utf-8?B?Tjc1NXFuMFVRL0NQd1Vhd0UvM0FNNjIzMHpJQW5YcHJpSmFmM2NqYm5Ybjky?=
 =?utf-8?B?NHgvUlJMQjFFbFFjQnFpQUJIL0NuQysxVGNwR0Vkd0JDbjZpTVg1UGtoanN0?=
 =?utf-8?B?Vnd2a3B3TTBTa2h3MjdUaEQrb2pqbGdMVVVqTFIxQjc3Ti9yWE1LQ0ZCSzJX?=
 =?utf-8?B?M3NiZ0V4Rk5SNWNscFJkdDl5bHNVNzJJTWxqNFNadEI0U2JLZVY3SzJ6SFFF?=
 =?utf-8?B?WVFnalJwZWtKWmtweklQbEduUE9xKzhSb3RqRU12SjJXODk1OHdXUTNFQXRZ?=
 =?utf-8?B?Y3hTcURpZEFZM2tuYVhGRkUwejl3RWRkbnA5N09yb1lZYS8zeEh1aGcySmFF?=
 =?utf-8?B?blIzTXF6TTE5OXBFZkRja0tEZFdnZVBtUmM5QjJ0Z0daVGoyQlIvOW8yVXk2?=
 =?utf-8?B?YUlhV0o4eHVWQzc1ejQ1MTRLbi9jUjF1aFpPNm9BcjRyWVJnUFBWRWhKZWhJ?=
 =?utf-8?B?c0x6ZGcydE45bVNGa0hNWHBtWHlLU3JRTVhmWjI0ZS9jQUpQQzhGbU8wRDlD?=
 =?utf-8?B?VXM1dnUydGpwYXdBMzNUOUxuK0ZqWVBzUXA2NFdjUzVvd1BHTE1ubVRsbnF2?=
 =?utf-8?Q?cwc3JePU87gM4ggNMHIC+9hGC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bc0255-3b37-49fd-d58c-08ddfa46062e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:08:01.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnfk2bmW7A92CHf+l1Wlom83oNz3uyH7y781zoznZR6JgpO0EiqfOEw1OdKuP/ayyY1LKfT26vYYVrU9g3y5Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
And, call it from dc_{fl,fw)_bind() to get DPR channels for
FetchLayer and FetchWarp.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
 drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
 drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
 
 	fu = &fl->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index b36d3034b8d5962eaab212b6b65ebbb5c29f978c..47d436abb65157de7cab74565e44b199be76de52 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -10,6 +10,7 @@
 
 #include "dc-fu.h"
 #include "dc-pe.h"
+#include "dc-prg.h"
 
 /* STATICCONTROL */
 #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
@@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
 		dc_fu_set_pixel_blend_mode(fu, i);
 	}
 }
+
+int dc_fu_get_dprc(struct dc_fu *fu)
+{
+	struct dc_prg *prg;
+
+	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
+	if (!prg)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	fu->dprc = dc_prg_get_dprc(prg);
+	if (!fu->dprc)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to get DPR channel\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 518d1af49f5ae9d4f67da5e6c2e80abd7e962120..44b9497e53580589a05bcb180eb2312ea4449da4 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -8,11 +8,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <drm/drm_fourcc.h>
 
+#include "dc-dprc.h"
 #include "dc-pe.h"
 
 #define FRAC_OFFSET			0x28
@@ -99,6 +101,7 @@ struct dc_fu_ops {
 };
 
 struct dc_fu {
+	struct device *dev;
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	char name[21];
@@ -114,6 +117,7 @@ struct dc_fu {
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
 	struct dc_lb *lb;
+	struct dc_dprc *dprc;
 };
 
 extern const struct dc_fu_ops dc_fu_common_ops;
@@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
 void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
 void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
 void dc_fu_common_hw_init(struct dc_fu *fu);
+int dc_fu_get_dprc(struct dc_fu *fu);
 
 const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return -ENOMEM;
 
 	fu = &fw->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
 	if (IS_ERR(base_pec))

-- 
2.34.1

