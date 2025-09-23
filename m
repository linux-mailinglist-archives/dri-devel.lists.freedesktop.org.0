Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA43B93ED3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3E10E51E;
	Tue, 23 Sep 2025 02:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JX0ji54i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013045.outbound.protection.outlook.com
 [52.101.83.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2858010E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:06:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5x5hJ4wee1/Bb2OTO5phNP8TwZGk1HCX9XzuMnLG4c+TsG97c9gEef76kSq/xo3wjYbyRICgJsfiA/1cit5ep10XGjqYK2rjbErca8+N9ObMdSRrbArZ486PMz+XKODDqR1VrNHpWgYxNhwMsgkZoPShG58Nu0uDMgZB/BXRLPc9IWC8h2Gc61ib8Nnn1yQrbJaA4ysd5c1PGpHQ4Vqkry+zhWNYlfvxh8xqSI8jQjwOqiY/k4ALBcxe7Bb2f4ksZs3tNnYqBVVx2bra6525Ono3LvQEm74kz42OGA1OH3UGvt4sT40FcUKsCXYI7vIwyNC0kW64CsLLQ1z9+DGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrFrvz+Ies7mZbN92cpbGU0k/obq+KolyisaEJ93Fmg=;
 b=n+c5t3qHlxclMLP4r+4ftvDTjBeQe6KZt8TeeGGq///qx7V70WMb5jfHYymo3qYktPgeFVPjzNeZNB3NX0jCzZwcoHKDyngao+81SxBwY+F7hXXaqCF+HR3P++qNVmA5I0y2WK2rcQiz/Ob/rCJ6Lsvq9lpbyilQttIB3KnyhK/MGmF3ESwC/EzTc6VQV72nFv97PoEW+AskJKpDjav7X8iKngW/PP4UZDtl1h+7mSALjadseL8hKH1671aW1Vs5u6uj+7S2dVNLW1Wxorycaw662YaeYWpgSN1dhlFV1OIyzbgYkjOFq1bW1pxQNRs1jgQI+Y/5wIStB0ixMeHNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrFrvz+Ies7mZbN92cpbGU0k/obq+KolyisaEJ93Fmg=;
 b=JX0ji54idZJKv9c38s1l/le3+BtdOM5dJz4JcJeV8NbqMOilvqzBrvWE/9csm7imSZohdiElR5F1otXSDQ/MaHuYJZYx3QC7QG+dDCwQMM77hmw7OGBHKlE3My0UEnfuPEREmKzsBKxagdWYp57PL3adqQF7rp55UFNHI+CipE+GnAT2nMSJGMI/ggc7weiI41YR+JoKWMoKha/6FmbXerrSsV6uCcs7TxKNMrcPfmIaWBUW0PcAt+Oq/yysVtCMuSloKT/UVJSDGbrOb1/FNocV4Tco1I8sa8O1p1rflqcKcvC0bbc3vzjICEigr7jB20IR5O4jHKuAVE0quneEqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:06:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:06:46 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v2 00/14] drm/imx: dc: Use prefetch engine
Date: Tue, 23 Sep 2025 10:07:50 +0800
Message-Id: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYA0mgC/2WNOw6DMBBEr4K2zkaLwYakyj0iisis4y34yEYWE
 eLuMUipUr4ZzZsNIgfhCPdig8BJokxjBnUpwPrX+GaUPjMoUpoaqlCGtcXe4hzY8WI9kmq5IqN
 vpTWQZ0ch66l8dpm9xGUKn/MhlUf6k9X/slQiYdPWlirXm1q7x7jOVzsN0O37/gU6kaxKrgAAA
 A==
X-Change-ID: 20250703-imx8-dc-prefetch-028e306591c6
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
 Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: 511645c3-a666-4b76-74ec-08ddfa45d900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNqMmx6aDNpTTBDRHdrOHR1UzVlODM5MEI3UTBDZjlDMTBiMHVvQWpxZ0pa?=
 =?utf-8?B?dGljUzliWUo3bVVBTEZZQWFxSTVTdGgzSElSNHpyL1J3ODMveXZBT3Iyd1l4?=
 =?utf-8?B?NGg4K0RmdE4ybXloRU56OEdVSzgzVjNIU2ExbWJPcS9oUmxJRUZJOFpDWWtE?=
 =?utf-8?B?aHpZRzY0K1A3RVJTSUtPOHk2SHV1NFZFNlpubGZOZ2JXRi9GeGorampScHFW?=
 =?utf-8?B?azFKQk5vRUQyUTcvRXFocW5DT0dTQThhbXBIUnZtczY2UmdtQWF6blJsQnZO?=
 =?utf-8?B?Q0lEWWE4UTE5cWNGWG44N2MzMHp6QnUzMXFQWGEyQzlDQVN2a0ZJd0xHTjRT?=
 =?utf-8?B?WmFBNktYc1VVR21LcEdLdGhKSm44OFJuRXpGL21WQVBsS1FIUExsR04yR1BM?=
 =?utf-8?B?Ry9nTmRlUnB2S1JVMXBlVGZsa25PMzN1VkY4dk9KRUtRYkpjZDdiaTM3L0x4?=
 =?utf-8?B?K3BaZExtRmlQSDJRNnV4by83b29Mc1ZtZzRkV1hFUXFoNTZpWFVFVlhOeU54?=
 =?utf-8?B?NFZJZFYwam50SjRpWG9CbkNKd0NLU2trTHNGSThSMlVmVzA0TjVLZWljZUpx?=
 =?utf-8?B?RUlQalRwczJiNFk1dHBPT3l6TXY4NlBrbHVsT2dJNDNuQjdPK0QwdVNYSXZp?=
 =?utf-8?B?aW4xV3NNeGJZU0dnMGdCcFBvdHNDcEJxd0F6TnZhSjFwSHNQMHVaUW5VT3RD?=
 =?utf-8?B?aGYyYkd1d3R0TlNrck1KNFNNa2FuRVBjd3Y3YU9DSytKMlRQZzN0b0RMRU85?=
 =?utf-8?B?OG0ycE5nZFZKZEVLbkhsb28yd1dzVmR2TTY3UitrNDljT2YzcmlzVDZremFL?=
 =?utf-8?B?ZmlvMHZFWmR4RnZvTjdQbkpjTmlNZExNM2d6T084YlhSOU5mYzVzUGt4Yysv?=
 =?utf-8?B?MHI2Tm85QVRBS1c4d1ptU2NCM2IxTCtZUlNOSnZoUUppNzlzVC9tVXU5T2FE?=
 =?utf-8?B?K3JCTEtUQ3dHWmpud0xHQTRRRllsVWFwelFzOVUyRXhOTmxibFU1QkRvbDNt?=
 =?utf-8?B?clVMZjRFL01kc2VrODhKa1VPVjdBQjVMQ0tqcWl6QnVUZ3B1ZUlNeWRiUDZw?=
 =?utf-8?B?V01nUUhTb0k3SWozTTVVMHFYVVQ3anROYTdWTkxCTkhMZzQwVjhkYWhUMmpu?=
 =?utf-8?B?V0pwSCsxNjR3U01aSG1jTjF6ZWErcDNuRldONDV3UVdwNWZTNm5DU3ZXQUtZ?=
 =?utf-8?B?eVNnNzJZeDB6Z2R6SUYySHJQQ2R4c2J1RnphQXVYOXhFL2dQNVhTdzRpdkxq?=
 =?utf-8?B?VjdGOUF5d0tvUHl5K3BUMUZNbGk5VHFDVEE2TE1KRUxPTmdiS2JMbXpTbndM?=
 =?utf-8?B?Z2hweTBDd1VSY29nV0xKbGZXVFRsdXF6TmlzWmQ3V1BOcWlibS9LQi9NK0E5?=
 =?utf-8?B?ZDZ1Sm1UNlNIeHZhTmhRY2xjVk44ZzV4V05XUUcwOEVaUk9VV21PVVBZN0lM?=
 =?utf-8?B?cmM0Z0RUV2tOVnRoS2gvQUJRSFo4cklIV2M5Tmt3MFdDUVZ2YlJoUFdEMzBX?=
 =?utf-8?B?N0szdXA2TFlGNnlabHdOSE8rRkxTQWF6L01NSndGV2duYVFCREQ2ZUJxTnRH?=
 =?utf-8?B?L3lFYXdTU0syNVlFTndEbTcyTHZTdXhvdzQ4aHU2V2dzY0FGUTVZNXBGVk1X?=
 =?utf-8?B?RW5lR1JuWVByN3M3K3diZVlXV0JKQW44OGJyYUdONFZiL2lpVWdxWUtvNU5X?=
 =?utf-8?B?Skg0ZHFuSVFISTVab09OYzByTjZjL0NUWjZuMngwK2dHZ1pOem1kL0lFSGl3?=
 =?utf-8?B?Q2lDN0dGT3I2TjZxOVlxWFVTL1NqcEo2d3h3aDIxUWI0dnNBRDhEZnhUUkxF?=
 =?utf-8?B?NzlObVA0SG5SYmF3VGt3MUtpbWVFcWEzcHozdU5Tb1EvSlZGNVJUNzdsWTNQ?=
 =?utf-8?B?SytSa0xXUGd4TzJyZ1A3WWFQUG1ZT2l4UXV2bGRzdXUrczR2NmJpR0pKb2l1?=
 =?utf-8?Q?eyF+mNRpzNkZLCDey8X/2aNG0v0D+VBO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FhMWhJUyttMCt3YWoxRmRHYU1MdnpZT09XK3FtQjFUVmxseUN2TmpVaG9J?=
 =?utf-8?B?MjdaY211OHRQYjRBSUd1WXUvdjBWMWt5dkJPcENvTTQvWGsvajd3U2xFallw?=
 =?utf-8?B?MzV1cHd3aVZ6bStjeEs2ck92SWN6N2UxMkZnYWthb2RMUVdFNDJEQmtSdlpL?=
 =?utf-8?B?R0cxOHJqS0Fyekg1dXdST3FiTFhkcHV6RExXSGxmd1hCdklqaXMzT2lESWxW?=
 =?utf-8?B?TDF6K0VqY000MUxyZXVmeDY0Y1B0MG1BUzZGREZXSVdFMGNkQnE3S051VDNl?=
 =?utf-8?B?YjZFSGFMV1Z5S2NsbHp1SjZDSTFSbEI2SnJGMVZlZ08vaWdMdkE2YXVOYzRy?=
 =?utf-8?B?MGlpdW42Zm1tZnRoQkxCZFpic1hHM01aQzlTejZlRlQvcjBOdC9iQ0hxNVhS?=
 =?utf-8?B?M3BCbzYrWlNEcU1KYlZsMHQ5Tk9yTVdQaEVVbXV5V3d3QUdaeHliZE5YSXdr?=
 =?utf-8?B?QnQrS2hPTGxTelpMY2w2R2VJRFZnWlBWYlJESGQxUENYT0VnbEduQVB3aDZS?=
 =?utf-8?B?ako1cVFIRkRjbjJtTlBSSmFBc2oxUFlKZXZtQVpKTzhzZzEvV2lNbE52aStN?=
 =?utf-8?B?enQrbWFSQy9NZ2x5YkFMY0NhVTl0dU01T21VWWM5WTZMaWV1enoxOFZPdHNo?=
 =?utf-8?B?Y1FMekQzTkpOSUtpeGdLTmR0MkZUeVZLTEViSzVnQnZnTUhmU2VxQStORU8z?=
 =?utf-8?B?Tll5emFteEVZODN5a25jS0pqdDVsSFk0L09lQjlzazlEWmZnbklyQnB2Qkwx?=
 =?utf-8?B?dU1Yb2VHWFNYaWxEc0xwbzhYMktHc00za3FCemVzMStvV0s4L2phVTNJdk5a?=
 =?utf-8?B?Q2ZVWVVVcEF0b0xkaytBWFJMOHN2K0ZycXUzWjJZVnRGN05QN0RvMDJwZ0Fl?=
 =?utf-8?B?SEhSZmI4REd4NWpWS1Q3d2pWOHdKWGcwb2taRDgxTyswcEtQaTBFc1BEd3Z3?=
 =?utf-8?B?dEU2VXBkSkIyT05LYmtURVB1VzlqZGNremZ3LzVibEpLVVU4UGxWSEZUanB0?=
 =?utf-8?B?NDRuSmVjZmdEWlZ3SUJ1VVNIWHJpa0g5TVIzSW11R1ZPUDJBT0psb1BTbUNL?=
 =?utf-8?B?SzNJTW0rWi83eHB1QUZIZ0crdWdzdHJNcU1hLzhvRURtandQb05SWjYyRU0w?=
 =?utf-8?B?SGlhTzFyQzFieCtQMjdhejI2bE9CRXR5ZVJBMnp0RTBiSFVBMDVhcmIxTTJG?=
 =?utf-8?B?RVBUZXZydVZSRlR4c2ZSdXpmUGFFa3M3RjJrU1lla3o5TFRUUFJkZStFeTQ0?=
 =?utf-8?B?UU5SUVFENUlYTWMvL0dic2xHMG14QWIxY2VUdFBLM0JSbmY0ZUJ4N0lYY0xn?=
 =?utf-8?B?RStSdGtNN0ZWT2hpRHg0UC9PSFVRUnR2WmM4Nmhwc3d5UXRpcDU3bzhFK3NO?=
 =?utf-8?B?U3RWWUg5RnJhb1VvejNSaFdkNkxCREZRZ1FVaGhDemFoMHh6OWozd0FBb01s?=
 =?utf-8?B?SjlVeXVtakZrMXp6WTBDdjhHb3UrUnJUR3pDZ3lBQm50YVdDNXhuREVmVlhC?=
 =?utf-8?B?R0R2aFVqbTYzVndRWXlIZXpIZWxDRkxhdkVFNVhITVVJR2cyZGlhSFAraXBL?=
 =?utf-8?B?SWZ1OFd2V1BlVnJocXk4VHhleGp1ZExPRlRWTkdsb1ZENlpURDRLZzUxZ2sw?=
 =?utf-8?B?SEw2YlJob2t4Y0JmRnZVNTQyNWY2eHdFWXQ0NHZDNUVYWHo2OXF5cHZOT3Bx?=
 =?utf-8?B?b2RtdU5yd3ZtSUFnc3RwSm5QQS8vM1JXUUJaNUZ3akgrNXo0ZGt2bEVIY05H?=
 =?utf-8?B?Z2JTVDY2NjZ2b1dNWHczSndUQTBwb0d4ZkJBVHZhU1IwenpyeTRoTXIvOFox?=
 =?utf-8?B?THFvMlFETVppSTRoZFF5dEFsQXlkcmthb1BZNkUxTUxpOHJ5bTl0dXBMV3Mz?=
 =?utf-8?B?OGZsZmJ6RWxSUVJ6VkRNQ2Q3by9TaTd4a0tQYktwUHZiWml1T3pjRkVYUUVQ?=
 =?utf-8?B?SzdpWkxqODZzQnlQMk9ocGRSVktjUytwR2xFNjlrWExNa3lQTGtnUHNyMDRo?=
 =?utf-8?B?Y3U2R1NOZndKM1AzTEpNQ3o0aXlHOVM1eHBFODBIRy8zcHhnTDBMY05lUFN3?=
 =?utf-8?B?M0FWUU8zNmxrQTB1d2RkclFWdGQ0WXI5WFNacDNESmZZOTRkL3lHZEhIeFpE?=
 =?utf-8?Q?zL6hNdrqhEgTi2rua0kHD9b/x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511645c3-a666-4b76-74ec-08ddfa45d900
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:06:45.8609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WvZ8bucn3kpBPL9OxdY3NF9fTC637ifVAAWn9oUQy0rZbHpV6h9X/9NuBsjiplFYCfg/KMndIWjYpZDvSvC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
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

Hi,

This patch series aims to use prefetch engine in imx8-dc KMS driver.

One prefetch engine consists of one DPR Channel(DPRC) and one or two
Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
DDR, resolves data in tile formats if needed and outputs the result
data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
processing pixel formats with one planar, e.g., RGB formats.  When two
are used, pixel formats with two planars are supported, e.g., NV12.

For now, this patch series only supports prefetch engines with one PRG
because it is enough for XRGB8888 which is the only pixel format
supported by imx8-dc plane driver.  Two PRGs would be supported by
future patches.

Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
by Rob[1][2].  I slightly modified the patches' commit message to use
imperative mood.

Patch 3 adds DPRC and PRG dt-binding files to MAINTAINERS.

Patch 4 fixes FetchUnit dimensions as related to prefetch engine function.

Patch 5 disables CRTC at boot if needed to support prefetch engine better.

Patch 6 and 7 add PRG and DPRC drivers.

Patch 8 to 13 do preparations before using prefetch engine in imx8-dc KMS
driver.

Patch 14 uses prefetch engine in imx8-dc KMS driver.

[1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
[2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v2:
- Rebase the patch series onto next-20250922.
- Collect Alexander's and Frank's R-b tags.
- Manage PRG's and DPRC's clocks with bulk interfaces in patch 6&7.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion in patch 7.  (Frank)
- Link to v1: https://lore.kernel.org/r/20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com

---
Liu Ying (14):
      dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
      dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
      MAINTAINERS: Add i.MX8qxp prefetch engine DT binding files
      drm/imx: dc-fu: Fix dimensions
      drm/imx: dc-crtc: Disable at boot
      drm/imx: dc: Add PRG support
      drm/imx: dc: Add DPR channel support
      drm/imx: dc: Use TCON operation mode
      drm/imx: dc-ed: Support getting source selection
      drm/imx: dc-lb: Support getting secondary input selection
      drm/imx: dc-ed: Drop initial source selection
      drm/imx: dc-lb: Drop initial primary and secondary input selections
      drm/imx: dc-fu: Get DPR channel
      drm/imx: dc: Use prefetch engine

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
 drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 ++++++++-
 drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-dprc.c                   | 465 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
 drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
 drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 ++-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
 drivers/gpu/drm/imx/dc/dc-prg.c                    | 320 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
 23 files changed, 1496 insertions(+), 30 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250703-imx8-dc-prefetch-028e306591c6

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

