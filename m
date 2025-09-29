Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFDBA7D17
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33110E1FD;
	Mon, 29 Sep 2025 02:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UPrVl4UL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577410E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/kiG0kdB6PnmbE/L4bbn9dfucus8Lu7t2dbvVmFFI/rkNm1DD2rMDa3A0hxYpnHIZUDjBqQLGBmLYStFnNBx2NRwxKH8WRqbxSeChnu3Pm1gbgc08kuMyFPtpRigHu2Qgz8+3MHYe1NvS6hBjMBZIWm8ZgP12WaI6ou47mF7z4SDQa0e0IPT+EP6drJiXFkfl4ODmaC3oLggEXWj/FcbrB0Fviuakr4OuCw15eatmbBqqTP5Yth+PZ0lwBbDOeuL38EvjbAtZSH1ANOXgdKVhSkYq3t/GiN1cARtcXShJdG6UiPbh+UM+nw+eOVDIDHVXlr6yGghsTbyWqVe0dMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsF7C8NFElY1/U9tLKeFXBg31vMouNLm+QqRV7iGCyY=;
 b=HYUQYDEV4dpcVYmy7V6o7zt7N1s0Q82PexikieR4b6BDa2fDKjbfvnsXRghONKrgO4IG0tbXT8sHWcYEWs+q14B8YH0INldojY1rtYl1FUjHxpPBJ8y7LBTD1RBM3dDCn4N8QwkbDHn3Rxeeoqq8SCoTzM8/Wyo10lE+VVEnlvD3Pvvl0NqTIHvoWAlSC40WLDo/qxDbgopPtVo/EIqE6fUreJaFoQPZr/z1BwOoYymTo0qMiq0Bt5AyZ0gGAJ7tst521LrlUwlvFodpPUdWv2MD1AQQh+fkyQq6a+Flcj1OKij/OL0ep7TePusDH1DDwTW/KiwfcxzKJc7+q2zfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsF7C8NFElY1/U9tLKeFXBg31vMouNLm+QqRV7iGCyY=;
 b=UPrVl4ULfDkmJSrjKYkFL66vHqtEGx4545R0gw71taB13hR6+dqq/22QILk7x4zLMkzkVoJLilMop6HSHh9GuYIE0alhp+pZN5ll+8BBlBuSXaoxadzy/2QXJP+p9woicMJDne2vFBnsFE8iaZJ44Kg6NhYwE0Oup+lTSP53IE5GAIawLcWexcTLyKcfmYZ6xEGnG3biPOVFrf0LUBm7lOpHNwTqrGtDZNju3t2AWXt1I8SIRgNQ3XMtSX9O1AbizGPzLSf/93E1C4bq3wqdNg6Z+er1G0qXyrHCXPETTCT91btlyUuFF56zCHEhGewoXdmNyEiT1VpJwVNYDHSJqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:02 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:41 +0800
Subject: [PATCH v3 06/14] drm/imx: dc: Add PRG support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-6-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
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
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a21e51-aa1e-40fd-27c6-08ddff01a12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODRTbTBJdzRyTDN0b0NyV042VERaNFk1Y2gwOFI2NTlzUE5sazVTaUF0aUVE?=
 =?utf-8?B?UTJnSWVVWVE2Z05GSXNyR1o1MkdzU0lKOGh5L2hqNlJlVHAvNFdDRjBsQmFO?=
 =?utf-8?B?NUwrWWpYTlhQUHNQQkZRQ3d3SkdNRkFxdkJRR1M5OXBTRU43aHhGbklWVXFF?=
 =?utf-8?B?RUkwNWI4WDJvY0lyVGRuNEl2YmlBYUVCOE11KzRBc1hCTHQvSjQ0d0loVDF2?=
 =?utf-8?B?WkFKWElSREFBKy85ekdpS1Yxay9CbWRIRlI3VUhVaHN4TDlrWUZ4RXpidlpC?=
 =?utf-8?B?T0Y0am5YVUEybXUxK2lZMGVSSkdXWjd5c0FuY1VyU2RoZm9xanBoZWN3Mit3?=
 =?utf-8?B?UU0rSjN6eVRpeHhIa3kxVDNDME1xWS94UWtraGd0Q2tGOThYSDkwYWFENEFG?=
 =?utf-8?B?S20vbW16RjBMMTV0a0h3TGFEdWI0OVRGUkJXckY0OEJ6RmVXNG5keFFkZWcw?=
 =?utf-8?B?YkRvZk9mdUw4R0FpS1ZYK2IzNGplVDg1K1Zmc2hpSWVPMDFPSm94SUhiNzRO?=
 =?utf-8?B?MWxCMG9iU2VCa1NmZG1qMnpQWlNIc1JQOXBqVW4zcFBWZkROVUFCQzB0VC9J?=
 =?utf-8?B?NUtQWWNvZm0wdkh0RHNGbWJqOVYvTGozamg2SXNJRlMzd2g2TC9DUzM5ZmE0?=
 =?utf-8?B?c3h1cll6UEkvT0MwRVVrVVFaK3hIUVB5bDJYWll0YmVGQUQ1dG0va2JZVjFi?=
 =?utf-8?B?MUVaQ0FrNEdUM3M3NXkzeUthRTNQdGpwaS9oV1BMekd4dExWWWIvMkJYK0ZI?=
 =?utf-8?B?aDUxQTZaV3lYa25PVU53RHd0WUtXTXFVaGtwWDh2UHVUcnNlTGhwV3lqbXlr?=
 =?utf-8?B?NG94bHE3eXc4WE41djl0WEJWUU1sWkZ2cnNzU2pVTEg3SnZuVERMdTVKL2dJ?=
 =?utf-8?B?YS8zM0tpbWN2N3FxcjBVeDF6RkhYajhlc3FTSEpjV3dQcEYzMFhBd3I2MGlB?=
 =?utf-8?B?SzIvQndIVUxpSUg5eW5pN0dhckIwNW1jcDZIWldXZHZJUzdreFhkYVpDdlcv?=
 =?utf-8?B?VmduMHZkYkZ1NEUvdmhjRVBjSnZJc0NoRzFuL1dnMWZpNkxWTlJrb2FrWFRB?=
 =?utf-8?B?MzRyR3BxRmZvRUtVQnJobS9zbkNDaVBGTEJkSzY1ZjRLbkU1WEVKWnJ2MGRZ?=
 =?utf-8?B?TkZhTjJDT25wd21lODdPeUlUeGsvZlZwTHB2WWdWK2NzYWxPWW04a0tVOEZj?=
 =?utf-8?B?cEd3elRlcjhzelRnZmkxVGU3cjVVNE9NTGY0WlorWjkyN01kUE1URkJQWHdm?=
 =?utf-8?B?MHRhaHZuYjhnZmdvTWF1TGwrN0FBK09xL1hTYTdhSGFCdURvZWdwcXM5eFFk?=
 =?utf-8?B?ZXN0Q3hLMWl0b2RDbWZ4MktHTFNiczR0OTFFL3Z3Z2NqVHROSHBGUndsYjBH?=
 =?utf-8?B?V3hQbS9Ba2RqUXlSS3QwenZNSmhyYVZCV0cvNmJoV2N3d1RoNkU5YjZEdEYx?=
 =?utf-8?B?bDdzb0Myd1ZncGFRNjMrUEVkcCtFVUpzbisxTGlLck1KZDJKZmkxbTdiZHlE?=
 =?utf-8?B?aWVDMTRXMlRlT1NIbHlHSlIxYWxlUnlES2FSc2FkbVMzWlNZeTAreVN6a3Ja?=
 =?utf-8?B?NGp5L0s2Z0NBUXFnMEtZcWg5OWFxK2ppNGFhSFQzY1c2MjZpRmxHM0hVR3gv?=
 =?utf-8?B?RjlsZ1JLbzBMMHJnajA3U3NZSmQxd3FzQXdSM3FDWlhCeDJvNWtxS0gxanpm?=
 =?utf-8?B?Tlk2MUFmQ3UraGZVUGpUdFBoNUJHR0cxejFjN3VIU292bnF3SzI5T0E5aU04?=
 =?utf-8?B?ZVhYeEVpNy9HekgrckRUSHgxR3FnNkNaWU9LZVRPRjNyb1ZnOGY4VzdmTTk0?=
 =?utf-8?B?UGJxMm52L0FZa2NDdVZHbTV5bTFYNGxjQldKNnZpVWRvaG9Cak1wbnc4ZXRh?=
 =?utf-8?B?VFFLdmdEZ2pjVUxZYnNDS3BPQks4NERTeTEzenFGWnpNQWdWU0NnZUE3NDRT?=
 =?utf-8?B?cU5LTUVYQzNUaFVhYUx4NldnS0RFektzMWpHSE9mcWFEOStaNURROUoyVE9G?=
 =?utf-8?B?b3YrUEcvMk03UitQMWFRZCsvYjd6cWdxKzBYN0dXVnJXUkZDYUQvOVUrOGlB?=
 =?utf-8?B?OE9LejhKUFkyQ0lzQVdlU3NBYTNIRGVvaEF0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hxN3hockhTeExpT2NVYllLQmdvNWEvRytBdkhDeDMrQjl3M0pMT1RXV0Vr?=
 =?utf-8?B?T2drMklXUUQ5V21xS3Y2ZksxczhjYjZHRWo4UmxtSVZYQSs4Y2E3VmNEY3l0?=
 =?utf-8?B?emRTMThKdVpSQTdqZTZycHNOMzJzbjZDWGduU09CTjgxdGtYR1VxWU1sRVpi?=
 =?utf-8?B?Q1RPanJIeTR6cXREQW92TlZhNE9Db3REMkoya080VE5CVEFDKzV6UEc4MnlK?=
 =?utf-8?B?UFJvRmk1dDFDZGs3cmxTcWhwY09DN21Hc2U3WEJpVVQrVG5rS0MxSFkvMWhE?=
 =?utf-8?B?NkFzbkl3ZXY4dE1MQTdwaUdsc01tS21DUGlRZUdSVXo3N3FldE40ZlZ5b1dl?=
 =?utf-8?B?VkZrVDQwVjJ5ZUFnZmJhVE5rQlJabFlQMEExVVF0YWJkbFRuejVxb0MrbEdt?=
 =?utf-8?B?cVlZVGlJMWtpekhpZnJOdXpLcys3VjkrQ3VtTFJCQWszMnZzdGcwWlpSbzIy?=
 =?utf-8?B?aUhqbCtJWGNCenE1Q1FnWnd1V0tnQUtlV0srUm1XUXhudGhodnRQMER0ZDFy?=
 =?utf-8?B?VVFxeU5LM2pNOThPN2czVkE1V2F0SmdKYTFwUzJRMmlWZlozWGtOS2RJem1W?=
 =?utf-8?B?NHh6Q0F0K1RkeWJoZG1MaW80bW05UGtxNVZ2MHV0RlJ2Q2FJa0cybUtrcDFy?=
 =?utf-8?B?RUVOVjdNK2k0NTVjT29sTjZZQlN4VnBndisxeDBiQkpoa3FENzRYTC9FOEMw?=
 =?utf-8?B?UjRwRlZOUjNmREFHUWNwTzFXSFAxZXFwaHczRzd3aGt4UVFsbGxaSnlUOTRD?=
 =?utf-8?B?MENwNXk4L2RyZGtMVFVWelU3c1MvV2ZTUFdLelVzR2htWWVYT2VRclYrVHhY?=
 =?utf-8?B?L0s1eEFKZGRCWFR3c1NRNFJmb2REclF0eGxrN1hhZ2lNMlU5VkJhMGR6ZGdx?=
 =?utf-8?B?akQvN3Bmb1V4K1pkOUhKNlFTcGNIempZV0U4WGtSV3UrNG9EK1lOdlNwaUZE?=
 =?utf-8?B?T3NXcjVsWkpsRXoySUhINTA5MGRtWTVEcFVaZ3NpYXZMbDBiRjNGYzVmVUho?=
 =?utf-8?B?ZzY2SEVIejAzSS9Hb3BlMkxVQzVFcGRYRU5EeTk3UU9aVGZ2RkoyRGVRQzFB?=
 =?utf-8?B?Tm0yMmt3a3BaNHlMaTdQSDNJK0JPNVR4eEdab3ZXM2NhV084ck1wb203VnY4?=
 =?utf-8?B?b3pvYkFCd2h5ODRpd21uYytMTzFVL0FmakhLbjJkY3BaalZvZFkyUVEydTdl?=
 =?utf-8?B?WnFoQ1A4MnRHNUJlR3hhWXNDdDlNODlqU1lWaUF5cnNMQ1dMUDU3ZmgxYmZj?=
 =?utf-8?B?Sit4NFRENkxIcVMzdHdjWkdHWmZ5TDkxVDBwc2dxVGdYS3FHc0JPanZCUkpS?=
 =?utf-8?B?M2xXVHZSZ0c0L2JoZVRuMllrODE3b2dJVlc3TEF0Z3dCdGtsbkYxSTJmSkhB?=
 =?utf-8?B?WGh4cHROc0FqQS9EVUNTK3FaNHhQYkVQdVJ1REY4QldQZWN5ZFBoR0dta0J4?=
 =?utf-8?B?cS9BRVQySmpvbmVmQnNMU3BwcHV2cCtUSmNHMnJMUU1UTE56RUxTRVpQOGlr?=
 =?utf-8?B?Qm9DTDZSUVlSZDFJNERORFVqUGVXaytDdlpTOXEvcFdleitPNWIvbW84NmJ4?=
 =?utf-8?B?cXY2dlZYcW13WmRMOFRTOWlrZXN5d0dTbzBKc083M3BoWmI3eENVSHRnVCty?=
 =?utf-8?B?bHVKWXZFRGEzWERkdTU0dEFGdjhLejEzSWZtTDRBak1rRXFsM0ZYT1hUVHpu?=
 =?utf-8?B?eWx0V0VIbDVjR1J0MGkrSHYyZVliNlZDaWxmVGRuRWxzZ29xVEozRVR4WVl0?=
 =?utf-8?B?YVcrbmhUV3NwOEdzT3VQRWZhTEtzRlR1ZHA5MHhrMFM3UzVPRDkxMzFPRGUw?=
 =?utf-8?B?czA0UHFObUVKdytzTFVQVEszOHpIVlRndURKYVRwRk9QUndYcWoxeFR5RFVn?=
 =?utf-8?B?bFhrZ2lDT1JmcjhseFFGRkhWSFVQWWkwRXY4U2lqQTQzZjVrdVBIWmVobWdO?=
 =?utf-8?B?S3d4MndBVHVOTFVBdjhWQXBFaWxkenBwL1Nmblcwb1lCWlhIdURDNmRuUnhp?=
 =?utf-8?B?UExQZ3VkeHd1aHB5WS9ROVNnWGpkdytVd2N1WE1WcXNBRlIxNitiVEZOK21S?=
 =?utf-8?B?WFZzYjhpYjBPS1RrVUNmK0NLYldZb0hpdlYyVUErSkdXSTYvZ2s2UUxQamRn?=
 =?utf-8?Q?Ia5vY0zkil7AuyOpIla2SOQks?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a21e51-aa1e-40fd-27c6-08ddff01a12e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:02.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pTm8iutH47uoDzD4SoHshZnLfOkSyVpYpV6yTcM2vv+vUk/xza+s8RGfHuAKrJUeigb1gllDoxGHbP8Ui3urA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
prefetch engine.  It sits between a Display Prefetch Resolve
Channel(DPRC) and a FetchUnit.  Add a platform driver to support
the PRG.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Manage clocks with bulk interfaces.  (Frank)
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c | 308 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h |  35 +++++
 5 files changed, 346 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index b9d33c074984a7ee5a6f0876d09bfeee5096264c..e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
+		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
 		    dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index f93766b6bfbfae8510db05278d104820ca0719c4..9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -276,6 +276,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
+	&dc_prg_driver,
 	&dc_tc_driver,
 	&dc_driver,
 };
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7..557e7d90e4ea8ca2af59027b3152163cf7f9a618 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -81,6 +81,7 @@ extern struct platform_driver dc_fw_driver;
 extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
+extern struct platform_driver dc_prg_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
new file mode 100644
index 0000000000000000000000000000000000000000..f37bff12674ae792dc35a1f27cf754df4c372f20
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-prg.h"
+
+#define SET			0x4
+#define CLR			0x8
+#define TOG			0xc
+
+#define PRG_CTRL		0x00
+#define  BYPASS			BIT(0)
+#define  SC_DATA_TYPE_8BIT	0
+#define  HANDSHAKE_MODE_4LINES	0
+#define  SHADOW_LOAD_MODE	BIT(5)
+#define  DES_DATA_TYPE_MASK	GENMASK(17, 16)
+#define  DES_DATA_TYPE_32BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 0)
+#define  DES_DATA_TYPE_24BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 1)
+#define  DES_DATA_TYPE_16BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 2)
+#define  DES_DATA_TYPE_8BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 3)
+#define  SOFTRST		BIT(30)
+#define  SHADOW_EN		BIT(31)
+
+#define PRG_STATUS		0x10
+
+#define PRG_REG_UPDATE		0x20
+#define  REG_UPDATE		BIT(0)
+
+#define PRG_STRIDE		0x30
+#define  STRIDE(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_HEIGHT		0x40
+#define  HEIGHT(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_BADDR		0x50
+#define PRG_OFFSET		0x60
+
+#define PRG_WIDTH		0x70
+#define  WIDTH(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define DPU_PRG_MAX_STRIDE	0x10000
+
+struct dc_prg {
+	struct device *dev;
+	struct regmap *reg;
+	struct list_head list;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+static DEFINE_MUTEX(dc_prg_list_mutex);
+static LIST_HEAD(dc_prg_list);
+
+static const struct regmap_config dc_prg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = PRG_WIDTH + TOG,
+};
+
+static void dc_prg_reset(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SOFTRST);
+	fsleep(10);
+	regmap_write(prg->reg, PRG_CTRL + CLR, SOFTRST);
+	fsleep(10);
+}
+
+void dc_prg_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
+}
+
+void dc_prg_disable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	pm_runtime_put(prg->dev);
+}
+
+void dc_prg_disable_at_boot(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+}
+
+static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start)
+{
+	struct device *dev = prg->dev;
+	unsigned int burst_size;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+	}
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	regmap_write(prg->reg, PRG_STRIDE, STRIDE(stride));
+	regmap_write(prg->reg, PRG_WIDTH, WIDTH(width));
+	regmap_write(prg->reg, PRG_HEIGHT, HEIGHT(height));
+	regmap_write(prg->reg, PRG_OFFSET, 0);
+	regmap_write(prg->reg, PRG_BADDR, baddr);
+
+	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS |
+	      HANDSHAKE_MODE_4LINES;
+
+	switch (bits_per_pixel) {
+	case 32:
+		val |= DES_DATA_TYPE_32BPP;
+		break;
+	case 24:
+		val |= DES_DATA_TYPE_24BPP;
+		break;
+	case 16:
+		val |= DES_DATA_TYPE_16BPP;
+		break;
+	case 8:
+		val |= DES_DATA_TYPE_8BPP;
+		break;
+	}
+
+	/* no shadow for the first frame */
+	if (!start)
+		val |= SHADOW_EN;
+	regmap_write(prg->reg, PRG_CTRL, val);
+}
+
+void dc_prg_reg_update(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_REG_UPDATE, REG_UPDATE);
+}
+
+void dc_prg_shadow_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SHADOW_EN);
+}
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	if (stride > DPU_PRG_MAX_STRIDE)
+		return false;
+
+	return true;
+}
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
+{
+	struct device_node *prg_node __free(device_node);
+	struct dc_prg *prg;
+
+	prg_node = of_parse_phandle(dev->of_node, name, index);
+	if (!prg_node)
+		return NULL;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_for_each_entry(prg, &dc_prg_list, list) {
+		if (prg_node == prg->dev->of_node)
+			return prg;
+	}
+
+	return NULL;
+}
+
+static int dc_prg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_prg *prg;
+	int ret;
+
+	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
+	if (!prg)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	prg->reg = devm_regmap_init_mmio(dev, base, &dc_prg_regmap_config);
+	if (IS_ERR(prg->reg))
+		return PTR_ERR(prg->reg);
+
+	prg->num_clks = devm_clk_bulk_get_all(dev, &prg->clks);
+	if (prg->num_clks < 0)
+		return dev_err_probe(dev, prg->num_clks, "failed to get clocks\n");
+
+	dev_set_drvdata(dev, prg);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	prg->dev = dev;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_add(&prg->list, &dc_prg_list);
+
+	return 0;
+}
+
+static void dc_prg_remove(struct platform_device *pdev)
+{
+	struct dc_prg *prg = dev_get_drvdata(&pdev->dev);
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_del(&prg->list);
+}
+
+static int dc_prg_runtime_suspend(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+
+	return 0;
+}
+
+static int dc_prg_runtime_resume(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(prg->num_clks, prg->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_prg_reset(prg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_prg_pm_ops = {
+	RUNTIME_PM_OPS(dc_prg_runtime_suspend, dc_prg_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_prg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-prg", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_prg_driver = {
+	.probe = dc_prg_probe,
+	.remove = dc_prg_remove,
+	.driver = {
+		.name = "imx8-dc-prg",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_prg_dt_ids,
+		.pm = pm_ptr(&dc_prg_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
new file mode 100644
index 0000000000000000000000000000000000000000..6fd9b050bfa12334720f83ff9ceaf337e3048a54
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_PRG_H__
+#define __DC_PRG_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct dc_prg;
+
+void dc_prg_enable(struct dc_prg *prg);
+
+void dc_prg_disable(struct dc_prg *prg);
+
+void dc_prg_disable_at_boot(struct dc_prg *prg);
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start);
+
+void dc_prg_reg_update(struct dc_prg *prg);
+
+void dc_prg_shadow_enable(struct dc_prg *prg);
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr);
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
+
+#endif

-- 
2.34.1

