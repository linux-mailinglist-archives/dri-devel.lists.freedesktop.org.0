Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8729AFC72
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B40E10E1C0;
	Fri, 25 Oct 2024 08:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F8Svgnq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A8210E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5HHtOPcC7Rhb/o29qT56kKKU5XSv6ajUXUr9kb5JrMyAGd2x+yIFpt9YFzjQ1aGT/6VzZslPy/V6JB27tlxWLuWEAdETdqOCk86B4mi4zhB6Ud+xl/Qs0noxEwIofVoqOSoZVK4SWsRgrzUP6X3vRq1KLzRggnN9Gm4s1PNj539HWJjNjokn2nz262KokazxnMT57NY69eKV7cOi8Kn1dHIO77j4SAeCmrtIb3AuNIeOLnhWZnbmU1O2JdZV94kdpkpJ4zYBZgoMmakPuPCTew+V5haNKoiSJ8dD7K2oPD1JaALSQtrPgoxrN3dd3mKXgFFx35nHsGpegLgcSho4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcBeeXpFAl/d0FTrrF1GbY9c3oSEWrJNaipXM7WvgR0=;
 b=T7x1MJJLnhMsRlh8v7AFJeyS6/WbB8XZAzT9T2VhwAE8J8oXqBczmQCK9+BXY6qTWKZ7tZSHvH0lViKfNf5pkNeyQY8BUBFE7Ekx+OPo7rdQ0bMLsc5065HsmwOFn1BQXR9xc11FBFFIt63u3JG3oCY+N8aZOxNJsPZ3JexUlwUy/qMOTfYEG5JxN9/1VpcJYZxolJ57Oq4w4P0g4p9kBF4pIZkRJEdgKE0d16s76GuW2gzih13btcrc9jWL6PuHXB6HeKaFc5duK34d7gKhFjtj1xLzcyFoV6zRFyq3gx8D8d2kq+BS0W9qp30Nn1WNSlJRa3bGT1vKYXrxWEXrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcBeeXpFAl/d0FTrrF1GbY9c3oSEWrJNaipXM7WvgR0=;
 b=F8Svgnq24RqX5AWFD39QCQ7DhcLxSDeIheB/+fugpBbhYTmOnpBuKvjcA0jjH2qfXl5OZ22Lw/kU4cfYlKDzs1NsjVlPupYbQkI8OoCNz2RjFph3NA4FOjGfsZGYILPxHVZgsZgnkHq75pZEVFyROOnnmdMRGj703UmSqviyjSGuHviWL9xGQjwxmbEONhDEYz0PoZTcTOUmxGMGJo1LsDW1JQmgPH8DFyP5es2mqLk0omDyjJtMMnQyosaIw5C3QrKl2p9W9PVeJw80sBE8NWLPAhsZZcQRfoae452uoYHp1F/qVAH0epPTtQeTXkibtKAMUnaO1oaSYp3YVsGr5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 08:24:26 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 08:24:26 +0000
Message-ID: <4e78781a-bce6-4582-b6aa-417f57c4725f@nxp.com>
Date: Fri, 25 Oct 2024 16:24:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <TY3PR01MB113465BBC5FD4EAAE89D9EA57864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465BBC5FD4EAAE89D9EA57864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 30020c35-450f-459d-dcc7-08dcf4ce703b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXlqaEw0MUlWa1U0OHVaUlpjaW02eXNRQ05VdWxxN3BITE5GcXQ5N25qdWtF?=
 =?utf-8?B?ODl6YzFBQU5kMWNycktCdmRLUC9PQWtUU1VvM2pOVmJEclkwL0c5UHc3Z2F3?=
 =?utf-8?B?SFNVTEFYek10QWcrYnRDR1BhRGJmTTNTY1FiSllJRXZIc2RJVk8vai9UWjQ3?=
 =?utf-8?B?UmN1NlRxQ09DN0JUc2ZKSmFON3JQd1V2d0g2ZE45aS9vZGtVcHhodnpieHdy?=
 =?utf-8?B?azQrWTVKWVk0NEh1eXd5SVVJOG9GbDFvcVB6MFBPVUtXOWUyZDdiZ3F0UUVq?=
 =?utf-8?B?MTQ5NTRvZG9rMkQzSWovQTZzYUdTTGtJZGlwSUFUSUg3SUpOVjltSm1VTFZr?=
 =?utf-8?B?SVFnR1lNaFJWNjZWRHQremk3NENzdFEyRzRYaUhmWVlYYkVyNFlsRWNEVGNk?=
 =?utf-8?B?bjlTeS9nVTlIcDRna1dicEJlWGlkK3BUeDFyNWZXd1lqdHV4Y1RZY0ZCVDB2?=
 =?utf-8?B?U3FYVFRseC90RDJlaW9YdVp1L29RaGFzM1RqTHlwaSs5OUpYWGx1RjdVWURp?=
 =?utf-8?B?NkYyWTAxb2ZDc1FSRFlMNE0wMFdGWFF1dHZuSGNQbDc2aGFNS1ZTQnNPTWcx?=
 =?utf-8?B?YnNkNlZocVliKzNZYTVjMWNML3o2UGsyblZZYVduSElsNGpSOStOZmlaakdB?=
 =?utf-8?B?K3pLY1lRbkd3amh4dmQyZjEwSUpDKytrY3l4NHVEY01TUWNUOGlIcS8vTk01?=
 =?utf-8?B?R2xuVy92TXgyenhRcHR4UGdIaTI5SU1NU3JzbXg0SXE1dTA4b1dwL0RNVVVT?=
 =?utf-8?B?TW1JK055RW5HZU9TeVVJeS84bG4vYlhreS9xY0xRNjZVS2JZWXRkWHhjWXBZ?=
 =?utf-8?B?UkJQZnBjcWxycmlTN2QyektaK3cyZGhGclhYbldxaXdSem1jaHpvNjN6SVgr?=
 =?utf-8?B?STJtekVJMlA1L2lyUXBTM0NzaUxlQnpEcXhJMXAyRjNnQlRPcWNMTVhrb1E4?=
 =?utf-8?B?Y1ZaeW1pbXdFZUV1VzlBNkNsTjNoT3NnSFc3Wk10WG5pUmpFYVRRc1hvZjZF?=
 =?utf-8?B?d1kvTDlxT29ieWNScWJWVEw0by9YMm96WDlCbGtSd21aa2xuZFNEY05tRVNu?=
 =?utf-8?B?bXBxWlFYeHYyWGh6NktlNEp6K0ZzcjhTcWJwUVVzZ2lDUDVySU05QWJBZHBq?=
 =?utf-8?B?ZE9ZMS9UWVc5citXdTlyZzlkSE9uQngwVTlqT3VoeUpPUitXTzZ3TmtGemgx?=
 =?utf-8?B?TTBtZ1grQmdtY0N4ZHB6Tm5NNldWdHBhb1hZQjRQRVRoa2I4eHRlTkZnWEFy?=
 =?utf-8?B?cUtsRnJyMkNmUUZFZjdyZWxTMUZqVmFodTRDTk5oRmR6ZndVNUVxM2gwNVJF?=
 =?utf-8?B?aGt1Q3BHbTltR21HUmZOQzNuU3p4WW51Nk1lOHB3cTkxaVNERTh5UHBvZEdq?=
 =?utf-8?B?eE9XdWlFQ0dqMXZERnJRQm5oZG13dnhKR2VsOU82SGNaWEZmUzhaOVB1dTB2?=
 =?utf-8?B?UXQ5Skh1Q25HZVE2TW1XQnhUZTFaQW54b1NZd2FEeUdTSDJlRytMTFNsdkdt?=
 =?utf-8?B?ekh4S1hNSDNPY0h5RFBuUm1WNHRDdGh2ZFVOZjNHbWVsUEVydUdqOE9jTWpM?=
 =?utf-8?B?ZkxGbExHYUYzMXhQN1ZuSHB6RWRxYTlHbjJlOVpKSmN6SVZSMkVkL3VTMm9y?=
 =?utf-8?B?RUJDY1dGZUVFeTJ3cGdsdllnTW9TQmoxbDJUcWVPTkZNNUJORU9YS0xnQ1J1?=
 =?utf-8?B?MHFjMnQrenRKaUVSZnZXMm1BbkttbHo4eEtHd29UU1E3ZjVERWJadk5Mb2Fs?=
 =?utf-8?Q?iOure9T770azIK/H9TE4WQ9wskg8AkfEPMyDm8Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0kzYzlpdVRDM3FXSnN5d0Q1SkorTHFGSFJsSERNbEkvMVFIZmFWY0ZDL1dv?=
 =?utf-8?B?ZUkxSjArcm1kNFZneTlOdlFGYVNjK0FOdmtET0J6anFvcHRGMjZ2dW5nYVgz?=
 =?utf-8?B?blVXSDZKRytiekVQeDZGaDhRNWlwazRqeWsxaDRCQjdjVGp5bnFrVG52bmNp?=
 =?utf-8?B?RTQ2Z3IycVh6VEdrWFhUcng5eXNRU2hQb08xREhYbSs2Z2c2RG5jOUtRN0da?=
 =?utf-8?B?TFZwc3Y3SFQzQ1BRd0xCMXYwNi9UemIvZ21TcVVIL2FuamJWNitmaThXNUFP?=
 =?utf-8?B?YkR1QnVhZmg3VTk5Z2htdG1UbzRSalZBd0tvYytyTmlUSnBWSy9QaEFKRUZU?=
 =?utf-8?B?d1h2NmlXT0JIU2hsRkdSOWpiaDNHU1M1dy9jRlphNlRHRFg2RElUMUYwMlgz?=
 =?utf-8?B?eHdvZ1duN2gzcnhwOEdYYlFpWm5TUmo1ZjRaeWlTV1VEOGlHcWZ3UkRMcXgv?=
 =?utf-8?B?bFJHalVxNmhKcFBrcGNyYm1Sc1VrMWVCMnFuZWNtOTRyUUU2emNSMkhLRU5j?=
 =?utf-8?B?QytUQm5xemtIM2ZIOGZBQWVGVU9nK0JQdWVMT29qMVRzYm1iZVU4b05aK0I3?=
 =?utf-8?B?MXpmME5TOUxiaWYzZXB1ZzQ5MEQ5cERsYkZ2UUxpNmIyMDkwcFNSaEdlbTlT?=
 =?utf-8?B?bXRaTWN3NmVvTUtrOHpDSmhGbm03K1BNK01aR0lGbmE1bnp1N2dTZE96dlZ4?=
 =?utf-8?B?KzRwYnU1TDdzVVVBcVhXb0FYdDhVaGlPVHV4S3d1THRVS1RBWjh0a1Nicnp0?=
 =?utf-8?B?dWNYaEVTejlUcndkaWNOY1M4TVlhR2VJY1M3ZG1tWStzUmlMeXNERndhOTZR?=
 =?utf-8?B?TmlkbGxBSkh3d0JqY2NkQ05wek00Sk1yUVNtNFljeEU4UkNjTWlubFM3QlQy?=
 =?utf-8?B?Y08wOE5iQ0Q0TGdNb2FGamZXRWtueWgzd1hvd3BEOWx6eitlV3dJVHhYd2tE?=
 =?utf-8?B?UzdGbktYL25MV1RqVUl2T1JyRWVKL1h2a1BCdlllc01IL0RSQnlJMlBSSlhq?=
 =?utf-8?B?SHoxMVNQaXIvNjFmT21xMGROaDFtZ0I1UTF6dVlieGJhRjhma1pFZUZaQ0JR?=
 =?utf-8?B?SURWSFZoV2J1cWhhWkRWUkl2SzhSd09pTjYxVGVpRE1EYU84dUIrbGFKZ1Z2?=
 =?utf-8?B?RFRYaGNrbHFqclBmS1VCL0lWbjNSNmpTUnY3Vk40Y3VadDNIYlFEaEd2TWhh?=
 =?utf-8?B?SExRazJxdU1HTWtzdmVpTXU1R3pqOGczK2NBb3ZzMkY2OFhvV2xwbEg5QWpZ?=
 =?utf-8?B?SnV5NDdBZ1FmV0xXVi9jeTZoTktzZkNxTW1wcHAxWjBqZ0JBOEdGNGJnQ3ha?=
 =?utf-8?B?VXNnVEs4Q0ZwV0xRNDJWZ2F4ajBLZ0JtYTJVNHNvWmR5ZTh5dGUzTHVmamtV?=
 =?utf-8?B?QjZqNzl2anRmRVIwaWl4NnY2RS9jRW5mc1Y2TVlhL2tpV0Jsc3hPSko3em1U?=
 =?utf-8?B?REh5NTlObExmc1RDUGhIV1FNQW5nNkRmV0tkcjJhcmpXQWNpaGRQdi9OSlFr?=
 =?utf-8?B?QVgyK25USjFxdElkeTR2aHFHeVBDMk1DRmp4citOMkNxMG51Y2phWVZhcU5R?=
 =?utf-8?B?RlkvWE5udmFpZWQ5alNaYTJRTVM4TitTaWdOQWZqdzA2SFNmaUl6SEh4eXc0?=
 =?utf-8?B?VThaclVwSTJFSnBlTlJ6VEdJcUNpVjhGODN6RW9oOGJaS0ZpMUdjYzlhMnRZ?=
 =?utf-8?B?K2Z3ZWxPeGxKMTh0QWZzOXZhT0ZmV2dHSXB3cXFVZXVTMmpsLzRrSjFzczcr?=
 =?utf-8?B?S2VGWCtOdWRjZExJQjNldktNd3RncmZicVBrMU1EYVhpdlN0QkhyOEJEUU1Y?=
 =?utf-8?B?TjRpZUhsZ3Exc1JiMExDRFF2MzVRK285STF5Y0VwNE9zaHFVd1ZHOVFBK0xH?=
 =?utf-8?B?azNiKzFyQUorNm9Bd2Q5M0JnQXkzZFlvZ1ZtQVBiNEpWeExBTHpsMHlUOUF0?=
 =?utf-8?B?cTBNc2dpMUVrQmpGTi9RbC9hWTJXOW11amYyWm9WY3VqRC9uTzlpNEFaZFNB?=
 =?utf-8?B?dTRuU2kwSXlsemNMa1Q2V3NnYnpXbGU2K3dFYXRTbUd0N3pnbVd2eXNtRjVI?=
 =?utf-8?B?RUx6U1VVMnVsVWZicEF0c1ZuSnF4Ti9QMVBUQ05UWjh0bWlFK2lJMlNGc25W?=
 =?utf-8?Q?uZfgvhn14yKvX+9kLSP5oVP5v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30020c35-450f-459d-dcc7-08dcf4ce703b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 08:24:26.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yugeoa6XZy1wbvtUC2RlA+Cwrg6q51eoNeNk05ulFaoCPYLAC2GwBqMyUmZMMlJDZhoooaLfFxaxt/xTYxxINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140
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

On 10/24/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: Monday, October 21, 2024 7:45 AM
>> Subject: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> Add basic HDMI video output support. Currently, only RGB888 output pixel format is supported.  At the
>> LVDS input side, the driver supports single LVDS link and dual LVDS links with "jeida-24" LVDS
>> mapping.
>>
>> Product link:
>> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Just a question,
> 
> What is the maximum single link and dual link modes you have tested?

With single LVDS link on i.MX8MP EVK, the highest pixel clock rate I
tested is 74.25MHz(1280x720@60).  i.MX8MP LVDS Display Bridge(LDB)
supports the highest 80MHz pixel clock rate with single LVDS link.

With single LVDS link on i.MX8qxp MEK, the highest pixel clock rate I
tested is 148.5MHz(1920x1080@60).  i.MX8qxp LDB supports the highest
150MHz pixel clock rate with single LVDS link.

With dual LVDS links on both i.MX8MP EVK and i.MX8qxp MEK, the highest
pixel clock rate I tested is 148.5MHz(1920x1080@60).

> 
> On Renesas SMARC RZ/G3E platform I have tested with this patch set,
> 
> Dual link :1080p@60
> 
> and
> 
> Single link:720p@60
> 
> For single link > 720p@60, sometimes I get message
> "it6263 7-004c: failed to wait for video stable"

I don't see this with i.MX8MP EVK and i.MX8qxp MEK.

> 
> From SoC side, it can support max dot clock of 87MHz for single link.
> 
> So just wondering other than reject modes greater than 87MHz from SOC
> side, do we need to limit any thing on bridge device for single link Case?

Since IT6263 works with 1920x1080@60(148.5MHz pixel clock rate) on
i.MX8qxp MEK by using single LVDS link, I'm currently fine with
the existing clock rate validation against the maximal 150MHz pixel
clock rate.

> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

