Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32E9B42E2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8289F10E5B4;
	Tue, 29 Oct 2024 07:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UuoVKdE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763610E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5lBCtRXwKRpeHCQTPQllkpQJAwZbW4aQgBIWl7/O4cs5ATxmwijjshBurXlVvxPfF1rB71eCsymYQUiNm51QWOR+IdXu7T1CDNtFC9Bwrm3zSInpPxJjFCrUf5NLQAWtUwGi1lN07bEcGXgbUpxznClSCSC0tXkJUZwbjEiPkK38PhnpvBEUEDW2RTAYhr+B1ub4ycpqTofYamMgQevgrxHplyX8nOm9hGIAfOwStmGDuIDntFBZCbHbBx8NXEJ0C5l4Dy3FfklecTjQC12LXT2gocTW57nO9MVcCKEibpE9P9PUHYoloZWR9ya3gGjYpYwTLc++3DN5Smoxj2A7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivGYDgZ8H6whzh6DrBwYqX8qkH0DbudOCpAVcKPfXpY=;
 b=wMupfYfS0oUj284TMDiD4jd8ZmYe4+JKlr0fjjS/HMpDgRs67vyWM3C2Ct5Sgp2/SECH3TGQVGmtLiuj8hw8wQY2gfy5o5JFeQYvweO822et3W+MS+ykLDbTjHqDhY3gxXvdzhRloybj7eOZZk8sJI45ea/2QAQa1kOQjoAQBdkgu2o7KiHbpSVS9vrAzoUX5Wl931B29Q7elC1aCXLp9DBgTsPw9kNbo2ODwKrZt84HK04mke+8YYrAYayKhK/YfdXGnSytJrpJwaskLsIHqpjO+p0DOiHetskuXgO+XTCrM7bxYu0PTHfFxTHUMe04QBzQ02lQSFC7Rw24ywcsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivGYDgZ8H6whzh6DrBwYqX8qkH0DbudOCpAVcKPfXpY=;
 b=UuoVKdE3A6oSRbrM9nS0Znen3m3Y0X+NgsWuo73WbZXS93jb4ypZaWg5royyrfA4qYC1ip3OQN3MJCKShGdJG+TSWpdjuuDaGEUs/5/e9FGLTAEneM6gMgsB4dJmWK6j+szKFYDjKhfM103yiUebZUXVVAUmnCB5DKmyCfXq4juP9uI9JxN2bmqILUx3hvwcGi7PdL+Bickcfqh8h7soGWHcebl94AoNFpCM1ux/CWo/WplfWTbeRXCcgo1Ae9l1jBFJ4KG58EhaFQJBqhPRMWucOMNrwqXQFcS/orwweNy7OwDMLcmJzziJFlCxQXqCZbb9gGgSQy5tNCIsBLVwfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 07:13:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 07:13:06 +0000
Message-ID: <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
Date: Tue, 29 Oct 2024 15:13:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
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
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
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
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
 <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0129cf-f3af-4ac2-b6fa-08dcf7e92290
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1hyNlhBYTlvZVNKVlJuZGxhR0lGZVBoalY3ekZIN0k5YlNRT0dMWkgrcHB0?=
 =?utf-8?B?a2s5YzhrME5EQSt0UmJDR2JlK2k0Vkp2NUovWDFPbU5pWC9hdVJmd1plUEMy?=
 =?utf-8?B?NkladFI2dHBHUkk5cnZJYldWUzlwL2VUblRYZDlrMGN2dXNXQWp4bUFCcDFa?=
 =?utf-8?B?RS9QZ2dHbXV3bWlzNFV3SDZvRUxyNEJZSVR5OFp0UnpSZjl2akRpUUl4cXNp?=
 =?utf-8?B?R2lSMnVUT2M0TmZKd21MUS9MRU5hSlFnaWJ0SjdGZzBaWE9VVVM5Q1hmOHZj?=
 =?utf-8?B?K2NOdXJvWVJNSUdKaENaNklEL0xnNHVVcXFrWDZaTEV2SFFtY2loNmVLN0VC?=
 =?utf-8?B?YUpnc2o0bnN5Z2ZJNVpFYjVWV3V4ak1xUit3elVWdy9BdU9GMW1lQ0hoeFl0?=
 =?utf-8?B?c3NhSUt3Q09SbitzM3B4bnNPTnBZQ2V6YTJROTdJTjgwM3Axb01MK3FZRFUx?=
 =?utf-8?B?WWZwM3lxTytVRk4xSHhkMmZ0dmhyWE1sRy9iUlF0Rm1QMWFtU0d1OWZiQ3Aw?=
 =?utf-8?B?cUdCcEZsdGhoMk40Z1hQdDRTdHRiaDlVUVlTNWZjYW5XY1VqbVlSdmhzWmRV?=
 =?utf-8?B?S2JYcDJ2RGs4TnVHOGRQNWZrMVRqZTBEa013Q0NMUlNUOUQwRlpxVWxXRXZi?=
 =?utf-8?B?WEo5TkFtbkhuRkFiWVMyNUpOZDhrenJmVGtqTUJ3VkxFdHo0WTZnbDgvM0xp?=
 =?utf-8?B?blBWVDdLbWtwWUl3bVRwUXNnZURHcGRrNjZRa1RBYzcxd0t6NmZYTWJ5aWQ0?=
 =?utf-8?B?eXhOdjJnTEI2OTc0VDRBRUJ0ZHFiNkxkL25XV2tzQ0s3a3M2bmJTV0JpQ1Ew?=
 =?utf-8?B?bDdXNWxBTjNxSitoZThaQThlWURLK29ORnBsTDhaQXZaVGhYdFpCNkhubjNX?=
 =?utf-8?B?YmV5enZlTG9KLy9pZC9pNkdOcnV4MGFsRU1UbVhsd0xxQmZacFFYYzRNaXFp?=
 =?utf-8?B?RDdiWFFUcXdhclhML1RRSjlsU3RoUzlvREcvQ1J3V05OY2w3YWNVZFE5b0cw?=
 =?utf-8?B?dVl4KzYzQSs3VzVvL0VmdVU4cXVFMS95ekhpNnVuKzV6M2J3V0k3Zi9ReTZ3?=
 =?utf-8?B?eGEyd1FieGtZU2ZsZ0dLcEV2MkN0OW0zU3lmdWlkb1BCbWNwRC84VkJEMzZi?=
 =?utf-8?B?VFZ3amJpUHZnUStUTk1JdEtpc1lETC9ZTWRBWDN3VDhnSElUVGJjdzhPVlpk?=
 =?utf-8?B?eW9PUXFRNUw5MkhWWDZHNzZNTG9yVnZyRTZsaUNsTGFVVWNjZTFJektYTm1Z?=
 =?utf-8?B?YzE0Z3h0L0d2bFZJek41eENSdmlRRzhRclk3WVBGMDc2c3hzTkYvZVpNWERO?=
 =?utf-8?B?MVpwRXJOMFVudjY4dWMxenc4V3hHV0pqUmFCT3NXTjh4TUhhL0lsTjEvcDR5?=
 =?utf-8?B?UjJXaTJ1VGhTRCtKVzBmdGVnUlVpZjcwZGgrSktzU2xYMS82UXFYK2tuRTVQ?=
 =?utf-8?B?aDg0RVhkN0FKUVF2amZUU1RqRVJkVEIwblZxSXovMEpJYStIMGc4YkJib2xa?=
 =?utf-8?B?WVlmZG5BQ2tKZHNOUjhhdWswQ1JiMEswUGhhbllvYm02R3NHVFVFSVI0bndJ?=
 =?utf-8?B?aUVEQStLYTFCcGRUdDQ4cmdOVExVTS9NT1g3bnZ3RzZNM3F2VWU0R2YydVpZ?=
 =?utf-8?B?bU9neGJkU0t2ZEtoOXkwa0d5SEZmVHp6MjRqYUVHcHRZMXEwT3cwVW96SE9s?=
 =?utf-8?Q?bOJ1So9xU4Q0Hqp96CX+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlxZlJITG0va2NSTTBBeTBYWlI0aHJzdVBPY2pXdGFpUkNPaWlGMHJUYlVW?=
 =?utf-8?B?L0NIbjBxWHNwbVdGVG82SWNQaFpSdjl5Nmkza3dRWUFFT3A0SFJCeWZiU0s1?=
 =?utf-8?B?c3hKRGFybUo5c2w0UWc2VTA3WmlPSWJieGkzd1o5ZmtSTWl1MmllVmc0NUtH?=
 =?utf-8?B?SFE1YWNTVHkrS0VkOVJNYkw3NGRDd0lKOE1IU1FadnMyZGNZdERkZys4ZHNW?=
 =?utf-8?B?ZGVoUjVObmNubWZGYzBMS3duUnNsaFdxVS9GR1BvOU5CZjRSUlYzOEJZZUcz?=
 =?utf-8?B?ZURMdzZIa3l3RjV3dTFKNjRPNU5sVWU1bmRrTUg3OVBGQ25nODZGREtES2Fs?=
 =?utf-8?B?bHAwZjJIYzdJQjdYMWFvcTJPdzFXcGZGVkJCNGRrMUlpQy9NWnh6cWRaUmpN?=
 =?utf-8?B?SlNEdnRCTVdXVWNYM0hFdHdLL2p3MGxSLzYvMGZ3NnFzUDVIOFlEaUpHdUdI?=
 =?utf-8?B?M3hqNVluU29Jbi9MM0E0NkdhL0dRZUlnTGljbzNkdmE3VVNIRUxsU0pMK1lh?=
 =?utf-8?B?RktEb1lLOHRwRlFqc3BjdVBDTURkYmZJbVpja2Z3S2NqMGF4SnBZSnpwY2kw?=
 =?utf-8?B?YjkwSFB4MXJmT1ZkemlLYktuNFpTbmM2UzNOSWRySEtQNmM4N01TdElybUtO?=
 =?utf-8?B?MHkzN2lTTitOelhDUWYxUFFiWnlRc0JOVENaamVDaHZCQTVCUXcyQ2NTbVZJ?=
 =?utf-8?B?QXVWa2svcmN3WDN5TE1oeDlBcCtGK0dLM2ZFR2ZLL0JreVdQcGpHbGw3SkFH?=
 =?utf-8?B?c1lPblFLdlpORmpEMUdaWTg1Z0YvVWE5K25KSThKaFZKT2g5cEJEeWhlcVU4?=
 =?utf-8?B?VSt6OEljcy91VFlOb3Q5QU9wS0pDODlaR0RxalBGM01tUTRvVUFiRnRqR0Zh?=
 =?utf-8?B?YitCY1JGR2pDR053WVl3MnR0V001U1J0NzgyOGwxQ2RmY2lJSXF1aEtjaGlU?=
 =?utf-8?B?K3JUUXJ6UWIvU0RsTWdPZGhKckxCQXh2VUlnMXVZNnNvNkpSRXpacjk1Y011?=
 =?utf-8?B?dENEWEJ1c3NqZElpbHZNblhVOTVPYkViWXFnMDR1MkJabGRYNXFsRVY4eGM1?=
 =?utf-8?B?OUZiSGdNV20xNVpqNC9TUW03dnlLVUxsNU11cnBPZVR1eW91cjR3ZkhYQnBE?=
 =?utf-8?B?R0NLYmJuLy9zamZEdnhHd2tsMTcxOElhM3ZLZ0Fxd2xHUXRPTEFhZmdJV3BW?=
 =?utf-8?B?dHJiVHhxakFkc0VPaE4wcmVXU2kwZW80eTZhc0hRU3VFWXR6d1BNOStDWjNH?=
 =?utf-8?B?MS9NR2J1ZzFkSmxWOUJ5U1RwRFk0dUJPcXk2YW4wcHUzeEgvWUNxaGxEMEcv?=
 =?utf-8?B?ck9wOGxZZ1NVbzlaSys2ejdGUDVyVkVNVW9QZW1CaUswdVMyOEhRQ0pOalUz?=
 =?utf-8?B?a010Zlh3SVZWTHF4VGVDd3dzWTMvNTB2L3FzZnhKbnlaa3hCR2lBR1FPVkJL?=
 =?utf-8?B?OFgweG5QbWNZQW01c3ZtRjNKQS9LMm5CZWRsQjVRVzZGRU1FR1pma1N4dnV2?=
 =?utf-8?B?UWhqamlHNHVhR1FYU1hhNVVRTGJORC9keGo3WHNRM0dQK0NCaFJJQmVYQ0JY?=
 =?utf-8?B?ME1pVFRFc2syb0I5enhYalExNjBHVnhMMVRWb1RPK2V5OGx6NFdnRHcxVklz?=
 =?utf-8?B?dENDbWlaWDhaRGhKZEJUWUVKc3Z3WTlwTjM2THJqS21YdUNqbjhxR2IvbWUz?=
 =?utf-8?B?TjZ1SGlJZ2IzTTd0akJNS3ZJYWR1YUwxNU82Uk1nZVV4ZzFBUkFCWkJNcUxS?=
 =?utf-8?B?UTlPQTBZVzNWay9nbGUrYTV1ak1yeWUzVTNRS3lTNlVLYk12Unl2M0JaVWNt?=
 =?utf-8?B?Q2U4bldlK3hsTm9pRkY0S2J0RFZJbFBoQm84UnJtSjFOU1dwcnVLTXdWUTNI?=
 =?utf-8?B?ZVQ5NkxKZ2dCOVdqd2NiZHRGcEx4R0o0Ym1UVG1GZ1BPUmdDMGJQWVVaMUNp?=
 =?utf-8?B?cVM3QXl6VGw2Tnh4TGhKM0ZHK25GQkI0RVJmVFJ1WFN3bE9TZUNoZWx5dERx?=
 =?utf-8?B?eXZMaTc2M0t5eWVRK25YQ0REWXVVOUR5S3Fha2MxODZLWkVDK2Y4d3hncWE2?=
 =?utf-8?B?N2FaYTZma3pSV1BncktWeVhaYTl5aStZcTAzcUkxdCs1Q2VZWktxNzM4WElQ?=
 =?utf-8?Q?jXO6GbRWBLKL8vAEuiSC27hoH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0129cf-f3af-4ac2-b6fa-08dcf7e92290
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 07:13:06.2290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVo/bPGh3IuQTl7tAEtAIbmbFftpvU2boBqr652lOAv5DMH1PSG7eWXKgp5hcTN+e5R3fBD6cjMT2r7FMYzRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769
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

On 10/29/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 29 October 2024 06:17
>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS display common properties
>>
>> On 10/28/2024, Liu Ying wrote:
>>> Dual-link LVDS displays receive odd pixels and even pixels separately
>>> from dual LVDS links.  One link receives odd pixels and the other
>>> receives even pixels.  Some of those displays may also use only one
>>> LVDS link to receive all pixels, being odd and even agnostic.
>>> Document common properties for those displays by extending LVDS
>>> display common properties defined in lvds.yaml.
>>>
>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>> v4:
>>> * Squash change for advantech,idk-2121wr.yaml and
>>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
>>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>>>
>>> v3:
>>> * New patch.  (Dmitry)
>>>
>>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode
>>> 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>> new file mode 100644
>>> index 000000000000..5f7a30640404
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Dual-link LVDS Display Common Properties
>>> +
>>> +maintainers:
>>> +  - Liu Ying <victor.liu@nxp.com>
>>> +
>>> +description: |
>>> +  Common properties for LVDS displays with dual LVDS links. Extend
>>> +LVDS display
>>> +  common properties defined in lvds.yaml.
>>> +
>>> +  Dual-link LVDS displays receive odd pixels and even pixels
>>> + separately from  the dual LVDS links. One link receives odd pixels
>>> + and the other receives  even pixels. Some of those displays may also
>>> + use only one LVDS link to  receive all pixels, being odd and even agnostic.
>>> +
>>> +allOf:
>>> +  - $ref: lvds.yaml#
>>> +
>>> +properties:
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description: the first LVDS input link
>>> +
>>> +        properties:
>>> +          dual-lvds-odd-pixels:
>>> +            type: boolean
>>> +            description: the first LVDS input link for odd pixels
>>> +
>>> +          dual-lvds-even-pixels:
>>> +            type: boolean
>>> +            description: the first LVDS input link for even pixels
>>> +
>>> +        oneOf:
>>> +          - required: [dual-lvds-odd-pixels]
>>> +          - required: [dual-lvds-even-pixels]
>>> +          - properties:
>>> +              dual-lvds-odd-pixels: false
>>> +              dual-lvds-even-pixels: false
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description: the second LVDS input link
>>> +
>>> +        properties:
>>> +          dual-lvds-odd-pixels:
>>> +            type: boolean
>>> +            description: the second LVDS input link for odd pixels
>>> +
>>> +          dual-lvds-even-pixels:
>>> +            type: boolean
>>> +            description: the second LVDS input link for even pixels
>>> +
>>> +        oneOf:
>>> +          - required: [dual-lvds-odd-pixels]
>>> +          - required: [dual-lvds-even-pixels]
>>> +          - properties:
>>> +              dual-lvds-odd-pixels: false
>>> +              dual-lvds-even-pixels: false
>>
>> Hmm, I should require port@0 or port@1.
> 
> For dual LVDS, you need 3 ports as common use case

For LVDS panels, only two ports for LVDS sink are needed.
For display bridges with LVDS sink, one additional output
port is needed.  However, I'm not sure if this output
port should be documented in this binding or not, because
it doesn't look common enough considering the LVDS panels.

> 
> 2 input ports and 1 outport and all are required properties.

The output port cannot be required for LVDS panels at least.

We need to require one or two input ports, because IT6263
may use one LVDS link or two.

> 
> Cheers,
> Biju
> 
>> Will wait a while for comments and add this in next version.
>>
>> --8<--
>>     anyOf:
>>       - required:
>>           - port@0
>>       - required:
>>           - port@1
>> --8<--
>>
>>> +
>>> +required:
>>> +  - ports
>>> +
>>> +additionalProperties: true
>>> +
>>> +...
>>
>> [...]
>>
>> --
>> Regards,
>> Liu Ying
> 

-- 
Regards,
Liu Ying

