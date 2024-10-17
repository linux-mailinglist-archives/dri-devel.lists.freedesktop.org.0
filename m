Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154D9A1F0B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 11:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4C10E310;
	Thu, 17 Oct 2024 09:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O68a0ZkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2714310E7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 09:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzr3xmrRqXV7Fcfrtg7yOzWOcHef3BzDdukM/LRCB6sIcyCnPuxNPZkQS9bzAufPhXWDIatCWJ0sYzvAqzULHkb2qqUzj1/q+j9pKh0Kb7BAjrHLwL22pkPGbZyHrqQ2N8QzOtqG362ToiLDK9/9qm7aTkR0GQ4CBc05vzov1WaB1vRZ2dLSVHjweCL62w6DHx30lsuvA/ZeuK5m8Tg+qq/mpL0sjae35CxcmDRiPBnHuFXgsrAW8nb3s+PTu9L1UyLzI4vYTQ02uX7CtDy4piaSGVxtFsB/c7wHcuvo2OvobLSRBAcEflCOT7CJhrzP2wx9RwDjhjG0f+Zq+urJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dts4sysU7cZZm/iubPo3ZES6O9MqLsoFewelL0ehAY=;
 b=JCc6qE4b4tWr1Nk4wHL8KOkCwTbj798yf+W5I6eZYjsLK+wzQY3vHRbnmvzNgbGmVgWPXCU3dLnHtAmhOMvbr/h+cAsSvgPeKeYOv00sP9Q3vYtelgl9gsUEYubDZYFe4OgrH0ayajDRvguXHV0wGawKdnGOT+KitpFL2tOjYaSmz3oXrEbP4CCcnkThRQ5ZnSv3hRLnecTWh1U8MftWsVYasyUIzb7HVsbbI/JMy47R8R5oATX6X+Vev6ky2745xe8cwMGC7WPjFYPzH5KZwJLTm78x1jGGUM7GyjowZ7N0D0TgEEQ/rwTWYOGOp1nu2D8E07YynOqoapNdxw/wVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dts4sysU7cZZm/iubPo3ZES6O9MqLsoFewelL0ehAY=;
 b=O68a0ZkRqOxoNaL2PrgHf6XtKPNyKkJCbj2JG/L5sA+Mt/vFNxklFF8hUYGdydV4GEwLnS64Lb06aictc7p4DMrDJVOXdgpYsAcIkCAG1cn/qEdqGKJaqgAXe+D9o3Q/IvyLATqu+Hq+S6QGoy9qZtFtYgQlno0LiJOyfnN63FfqQOkdok91N0aA4r56O7YXus1WrpDIQGmMybcPt5B0KoULhVb/XOw5/fuyLlLs4LvMFUFgHlCObyGyn03TfZWkE/dP8riSKJjYSLAxv5FWCG49vMyuBuh2BWmyuU2BWl/r5WuplPK0tFKiPZ57QbkRU3pSIUrpLjapdky5kN2f5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:53:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:53:30 +0000
Message-ID: <1360191c-de5f-49eb-8085-afebcb0a1c97@nxp.com>
Date: Thu, 17 Oct 2024 17:53:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
 <TY3PR01MB1134691372F08F04BC4404A7F867B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <73k57zpmbbaup37iaoi7lejp6hq3af3nn5amt2bhbe7fpx4m22@n62lid6hw2cl>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <73k57zpmbbaup37iaoi7lejp6hq3af3nn5amt2bhbe7fpx4m22@n62lid6hw2cl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c953b47-a80c-45b8-fea3-08dcee918e47
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGxjMklnZDNuWlFibFI2RkFWcTkxd3RrMWxPZ01IWVFaN2ZJWFozSGdLSEdX?=
 =?utf-8?B?a0hwMDBtQ0QyWi9QdGFFRXVHcVdJMVU4MHB5Z1d1S2tCcWJic0wza255MDFT?=
 =?utf-8?B?bzNrUHYwUkp0TFVvb0J1YXFFeVFSMUNqWFRMcGcvcnlXZXNEdi9mTE5oSHB2?=
 =?utf-8?B?ZWhHd0FseVY3b3c0RE9GSlNFaWJ3MExTMzVxVDQyY0pWMVo1WStRcWhrRmJJ?=
 =?utf-8?B?K2tTdWxSR0NOUDVUWVJFb1dVZk01RkcyZENxaU1QTmlrTUJHMDZMNHNHMTZN?=
 =?utf-8?B?Q25PTXh3aVZmRUhhQnlCWU01NXNvaEdldzdOekk0QmhzNUZZQ3JCSVZpN2w5?=
 =?utf-8?B?N3dwVXVyY1M2cXUvU000elFWT1VjZmRrVUpCZE5CNzY0cVJsWDJDSno5VjRQ?=
 =?utf-8?B?Y211WDBMOU5wQlpZUm1GeHNWTE5xTEkrMmp3a1NJaytxT0lUeHBhZkwydGs3?=
 =?utf-8?B?YXpNZWFXNCtEREczRTlXdVZ3MlQxWGE5endFTFBaazJ0c2RYYisrNCt0NldD?=
 =?utf-8?B?UlNpck5CWTZSeWdwYzBZODYyQm1hTTl1aEVLLzlQdUxkZlI5Y3RmQkNWUlcr?=
 =?utf-8?B?Z1ZvT0RYbXlaSWtVV2JQS3JMOGF5VHJaWHNPRnR2QmthaXpBUmxSR1Y5ZjB0?=
 =?utf-8?B?TS9xa3FtZCtjU0QzQmsrN1J4U3V5SnJOdkZPVjNGaDVESDJWZW1UOUl0WUxw?=
 =?utf-8?B?SHplLzhiemZvRlFHUTYrQ2h4dHFYUDYrbXhRSThwSkVGbUtmZlpsSkd2MmRL?=
 =?utf-8?B?MWF3NUZJVlhZVjFvQkF3eHEzVWpHazlzRjh3bWFMRCtiSGNDb3ZDUTdHSG9U?=
 =?utf-8?B?dlNYSFhPUnMzQ2hJcGIwQnoraU9RTnFlbjRsUDdPVzB3anV1VHh2NmY4NDdu?=
 =?utf-8?B?cTc1VEFlbkhYK090REpFUDhtVFBIK1VnMXQwNE5nYlYwMnNwVjFyMk5JRHpF?=
 =?utf-8?B?M3VwZE5GM1I2a0hPYzBORXVwWHRsVG9Cd2xySDdtcEo0dUlSTjZyR0Uwam9o?=
 =?utf-8?B?QXVzQVp0dWJXMnRKbW9QdTBhdHFDMTNFUUdmblJvL016RmlpVzhVaGlwRVRD?=
 =?utf-8?B?bXVWTXV0RVY2NnR3cUJpeXBHb094SlY4aXk0QU1FU0RRMFVqdzZMVmZUSGxs?=
 =?utf-8?B?WlVybEMrMmNmWXFURVMvZHQwc3AxNTBCTE1Ldkxrekhyam45L3piYXNzbGdT?=
 =?utf-8?B?WDN6cStEV016M2VwWGdWc25LNE5QSnlFUlUyditOcThxR0prK1l3c0Q2NlN6?=
 =?utf-8?B?OTBtd1FoV1QzWUYwQTB6WHdNRUZjcS9KUVp1cGxtQU1kdlE4cHhwMC9kald4?=
 =?utf-8?B?dXB0ME9Fbk1lOUdyNUFPYXh2RzAzZmJUQUtubnlaMGRzd3dhdTZQbmVLelJ1?=
 =?utf-8?B?WDlrczF0ZjBDRVlHKzJQR3B0S2lMdXAwSHdJYUxuQXF4eFBrcjBtRlBwVnVX?=
 =?utf-8?B?UnZ4Q05iSHVralowTnFsODBQeWpnbm9lQXYxbkV6dXRFR0FpN2h0Z25mNTRQ?=
 =?utf-8?B?YTNBc2MyanlZWWJiRlRRWmp6MkNKTFRKRVRrV05DdXplbCs4aWtDV1AwOFd3?=
 =?utf-8?B?cU9yZXJ1RHpKcUJwaE5GZmhGOFVpcitKekpNT0plNkFKL0ZPblQ2VkR5bmVV?=
 =?utf-8?B?WXluT1JEV21CbVVPWDR0OFdxRjZYcEVvSm9oZjlDZFIvYkpZTE5IM0cyeXBk?=
 =?utf-8?B?bmk1VTBtSHRTNytLZXc3ajBzSkFlSXd0VTNyU01wY0JRZlBCQmZMcWVBU2kz?=
 =?utf-8?Q?XaFZL1WxUZ0NN5bByzXXyvJFO67t4DfCweZGHcE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNVZlZvTHZoR2xMZ3VvSzZyYUFnc0EwSmRtdkxXMTdOTjYzSmFOanJxNWxt?=
 =?utf-8?B?L2NqYVE0Q21ZelJUVHpKRTdZY3M2REVTSEt5M2R4YnNiTGV1WitKa0ljN0NP?=
 =?utf-8?B?SlR5eVowNm9rNU9xTjM2SWJ0eDd6MWNOVWpObWliRllhSG43SWlOd3owV056?=
 =?utf-8?B?UVQrOVNIei9GUDUwZXlDL2JPMU5RN3BtSEZ5L0xvUVhrVTdYVVBGOWhvKzAx?=
 =?utf-8?B?ZWowdmQzZUF2c0YxU2JxdE5kOEJtS2s5aGhkQkxFV0tUcmdnRmRkOGlHU3RX?=
 =?utf-8?B?Z1BRT0hOZldlY215enJDWUl3czRaNnVVQVhDbDRTdnNwbUhiRGRJc0pTbjVI?=
 =?utf-8?B?ZlUrMDJITlk4Zk41dDE3ZWtrcGpMNmNQQlJ5d1BucUxKVFhvSWhpT1BKdVZy?=
 =?utf-8?B?L0VsRUw5ZHJsLzVmNjd4UlYvd05zZmZjYXJWT3l6ajJQcThFK2l5UXVmNVA5?=
 =?utf-8?B?Skw2bEt6OU44eHdIWE0rNmdjTTNRTnZEaVVsR05ocS9DS2FOUkJYdzdSOXcv?=
 =?utf-8?B?anB6NVFhTk8rS01aSmZyVnVxdW9vYXdoVXcyY2M2b2pwYlBOOEdRQm4vZklQ?=
 =?utf-8?B?ZjdzWjVwNlZQakUva01MMXhBc0tWTW5jeGVaczFib212OHJZTWVGZ3F5VUc3?=
 =?utf-8?B?Qm5NWFNwWGdPbng5S2EzSFVidk5uN1JPTUtJY1F3SWsvUVJmU1VxSTFkY2Nw?=
 =?utf-8?B?Qit1R0VaWEZ4Q2llK2R6Vkk2YWNPbTNTSjZFbVhRRXMzNnQ4VmViamsrQ2Za?=
 =?utf-8?B?Ni9ZRGxHM0Y5MlgvSXNMWmdBelpPRnhMZEFDM3Job1ptd0g5bEdwWlAzOVMx?=
 =?utf-8?B?Sm1SRU1ZbFgxSmp0bjhHdGZSOExyYnZiWDJ4OTI4R1d4K1N0L1gwdWJQUi80?=
 =?utf-8?B?NG1EV0EzQUFYTXNmdlpIVHVHRExCY3RRMHlkeVJXbEJsdmZBT1grWFhMaE85?=
 =?utf-8?B?NHdZVER3dCtqNEx3UUNIQ1FJRTlLNk40YkpHeGczTUxFTUIzekt4dXpRUlJU?=
 =?utf-8?B?RzVmY0hmVVU0dSswbjRJT2F5V1c1cTJnQW1yS1dZZU8xWnRMelpJdUozMzQz?=
 =?utf-8?B?S2RuSzNyM295S0gxTS9RblBoSnM1MjMydVdXZW45SjBDUEt5UEIxK0FCUlQr?=
 =?utf-8?B?bHlIOTVET3hrTy9YZ0UzUjZQWDlDL0o5NUlGYnJRQjdvamFoUXpDUnFycTA2?=
 =?utf-8?B?U2dIaVJpUjI0aFc3TDh4MjVKZHhBZXZPTVZmbkZ5MnpsZFB0N1dzUi9Zd0Er?=
 =?utf-8?B?cXF5Nm1jQml5eFFrV24zdDlxSHZESkgwdWhZT1VBQUFRQ0d2Y01sOU1VWDU0?=
 =?utf-8?B?RnVONXcxTzcxWWIyY0lQaHJVc1p3ZXRhNmJBeWtIcytZVU0zTDdHWHJWOFpw?=
 =?utf-8?B?eEh4ZGxERzI0YjNMYnUwOU9pRHpSc3ZnWGpwalJ6S2VUWTBTZ0tWazBxb1lV?=
 =?utf-8?B?ZGc2Z25ISGhNNWM4cG4xaVJrSzdvVzlDVmRXS2ZtZUlUTG5ua3lWSzVDS1hJ?=
 =?utf-8?B?Y3JsTzRCbVNlY1JYUEI5bzBrNm9JUEY4RWdubjNNQ2JvVTAzQjNYQituZ2E5?=
 =?utf-8?B?YXlJWUozNHByM2RycHZERm16cUN5bkFEMXJpdWRLMFNoN3ZVZWwwMS9JejU3?=
 =?utf-8?B?eFkwS1F1NWU4V05TVFU3QzBsM2RYVjFxSWt5MXRMUi9wMHk1M0VRekFtazFM?=
 =?utf-8?B?elMrQUUwSk5WbVRKdWxCUXpyRUdnMlZWaEJBMDVhc2hSam91UFlpRnFpNDQy?=
 =?utf-8?B?Ri9yclVwS0d3T1lmbk9PWWcyR3lrTGt5akludHRaOGlHNi9GQlVJVTdRTHVH?=
 =?utf-8?B?Sy9lWTR5MUdXd29IdnplMHFLMkRpZTlzSHNCenVRRDVJNSthVEIyMHAyRnRF?=
 =?utf-8?B?RjZaQlJsK3ZmZHFseUQzQ3FBT3JYWnNadDJuc29idXFPTGkzQVdXY0VnVFp2?=
 =?utf-8?B?U2lLUkpmbHRHUVZRZkZLMWhMeXk2SVVXM2grc3lHK1U4VmR2azNtL0hTWG9J?=
 =?utf-8?B?NHg1RXRtQm5lbzdqRnlvU04yRFdDZWpsdVlUQ1crQmZpMUZZVFRSU00xaVFI?=
 =?utf-8?B?eDlqN01IL2pMRG9qUUg2blVKWjVHa2VQS3h6R21hWkd0UVBOQk5iWHlaUU1C?=
 =?utf-8?Q?tequPYuujABpyasJ+02CVReuM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c953b47-a80c-45b8-fea3-08dcee918e47
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:53:30.7476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2iXx4kcezbBTP2uq2mpx2NKVzIhrqgAixvQ9/1eqqDiiCiztSX74Szf+FsFgapOlpCxMI6bepthU3QWvrrrRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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

On 10/14/2024, Dmitry Baryshkov wrote:
[...]

>>>> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
>>>> +				      struct drm_bridge_state *bridge_state,
>>>> +				      struct drm_crtc_state *crtc_state,
>>>> +				      struct drm_connector_state *conn_state) {
>>>> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>>
>>> Use drm_atomic_helper_connector_hdmi_check().
>>>
>>> Implement .hdmi_tmds_char_rate_valid(). Also, I think, single and dual link LVDS have different max
>>> clock rates. Please correct me if I'm wrong.
>>
>> I guess this rate will be same for both links in dual lvds mode.
>> For single link, it supports only link0.
>> We cannot operate link1 its Own.
>>
>> From ITE point the max rate is rate corresponding to 1080p(148-150MHz)
>>
>> single and dual link LVDS have different max clock rates, but that constraint is
>> in SoC side?? ITE HW manual does not mention about this.
> 
> Huh? I checked the datasheet, version 0.8.
> It specifies LVDS clock rate (not the mode clock) up to 150 MHz and HDMI

The datasheet says "Features(LVDS RX) * Support input clock rate up to
150MHz".  The 150MHz is the mode clock rate which kind of matches the
words "Features(Combined) * Support up to Full-HD/1080P and UXGA(1600x
1200) display format".  LVDS serial clock rate is either x7 or x3.5
the mode clock rate, depending on single link or dual link.

> rate up to 225 MHz. Please check both constraints.

Will check both constraints.

[...]

>>>> +	it->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>>
>>>   | DRM_BRIDGE_OP_HDMI
>>>
>>> BTW: No HPD IRQ support?
>>
>> Renesas SMARC RZ/G3E this signal is internal. No dedicted IRQ line 
>> Populated for this signal. I don't know about NXP and any other platforms
>> has HPD wired to test the HPD IRQ support.
>>
>> Maybe go with poll method now and add hot plug support,
>> when we have platform with HPD to test.
> 
> I'm fine with this. According to the datasheet it doesn't seem to have
> the IRQ pin at all. It's just surprising to me. It's be nice to mention
> that HW doesn't support HPD IRQ either before setting it->bridge.ops or
> in the commit message.

Will mention this before setting it->bridge.ops.

-- 
Regards,
Liu Ying

