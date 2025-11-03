Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F99C2CBFD
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604810E421;
	Mon,  3 Nov 2025 15:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vkpFj4tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013030.outbound.protection.outlook.com
 [52.101.83.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303610E419
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb57GI9lsUr0hebAbnwuODZdhbch5294Xb1uUab+BOEl1PxFsXVCL0BJJjgWsGgZRzSmLXrhpRN/z7ZVlYz7kC06Z8GgCUWnIW88fxuXqXDbmAjqPHObMY6S1CCqfY0jjCR1ljsRtR5Op4YudYmAikI6xS+AhTFjhQwZLI76F8+MD3hFbF2jiQKzfK7b4zbViJ2ecZjNmsPIshg9DTEKWfgcK+Bi68uh8OQWYnSe48gAjsjsHvpj1zWVhnd+FjQ2bPZh6OtG98ooDX415pQNioq4/HCrihxLflMrECWvlLgsOWnJg5EOgCUJCqVRyLUPAlh0EIooa/pzwklieQn4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA/GFDutmvKkWOYUWX1EYSUMr+bA6YIQrD+3l9ypQls=;
 b=eOEzw3UFeji8JR6FNnQMfGjFXxhQNfDEFjf8UGFKy83YYY3Bp2QDreKzoyvXfYTEnWyUjeGsUTBcHFVDIvTowvIOU4M3KhlgnyEOLaWj9jyH4Xjs7XJPtmhRgYzoZqhTNANnejSJnWueWegNN9tjuG/qoir8n7Yqjox4QxjHOpDuLH0fMdSW5+kF6L4uN3RLOm0DJhXaYG10SenLO88VqQs/zKL47WeSxpef4WBYr/BYowqiZGWEJyvi4c8v6fSZhkuKmcZ7jtVjrpLr7At5RjMuPwQpKGwwJLv/jSzP3gXtXOWBUBVGrS+++9Lv2yE+DWRqVsJoNZ4CRkX9VOig+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA/GFDutmvKkWOYUWX1EYSUMr+bA6YIQrD+3l9ypQls=;
 b=vkpFj4tnWObMLcftE53xfvktym++p0TffTxLQJGdNP6twJCs4IdKEl7EAnXfJLcJi85Sc5ZcPc+8/1XgZ3pYpZs+3QFUaYbFKkxgjmMyRVAh93L7RycQd8XogcOnnkq3/aVs13RjxntvYosVzOPFfz0F4jPPdwzJ4tPz67UkEPxIg+gWY8+tM+JImpzTyS284o01HxETaINgc40iFM86FgWxRU0dAPFQiSg87PBCDCJpJVOFIZLTWrdVpXziZFlZ1jAMyY/ZOWOh7cspTDF10PVKVkpbrrNm585KSzv8pt+jqKQTnBezvyL5hhrpODxGosDqRzwlqKjC3Jr8F7DPrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:29 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:29 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Mon,  3 Nov 2025 15:30:45 +0000
Message-ID: <20251103-dcif-upstreaming-v6-1-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::19) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1a7743-c619-4383-da3c-08de1aee3292
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1LOTQxdkFiUEMrN2xYSnNyU2VmVXhUTlhuK3J6TWR3WFdtK294aUVnbkdT?=
 =?utf-8?B?alpxYkJvQURXY21MM2Q5K01jN2drWDg3cGhNcktVUXJMTDBXaUV5bjJjM3J4?=
 =?utf-8?B?T2dUNmhoVUZSdFpEUlhqaDdrYkgvVzBjYmN4T1IvQlBra21iQ2lDZ2Zka2xy?=
 =?utf-8?B?NUZHTDZTN2JWZXRKeEhaZWl5MmNZcEg4b0J6ZWcvVUtuUU1GaUo5NzdRSFRt?=
 =?utf-8?B?Wk5yb1JsVmd3QWl6V1NCSWl5eGZCMFFPUmwwSktkcjRUdzlRZDcwT0toQ05T?=
 =?utf-8?B?bTROWTBxc0ExZTcvRFhxYzZEenk2UUtEaDRpTEkzaFZrMlVWMDAzRkR0eThs?=
 =?utf-8?B?N3MrSzBlSngySmh2ZjJaUnBsWlV1RG9SaFRHTUR4TTlONnNoOWVEQW8yaitv?=
 =?utf-8?B?YXBRY2x3eE91TU5aeTUwUVFNSmtaMFRZbnNlZnc3RVk2Y2wybUFQTm1NQ3ZR?=
 =?utf-8?B?Q2xyWnNSRjN0cnUzOEtRaTFNbkVhM1pEK012eFpOa3F4U3lxWnZFM0syb3Ba?=
 =?utf-8?B?VERGeWQyb2xLWXR1a1AxaWZoalZmdm0rWEJEU0JEcEM2M3d1b05NQXJMQ2ln?=
 =?utf-8?B?NDgrRHJuVG1MTlR3QWRZR1IxSFprbU5tSklrOEhTcmw2b2JSSTRWNStlOHF4?=
 =?utf-8?B?bWhKb3dweWhBRWhXVkliemxzMkNZZGZxcUlEZk9lUUovRGg5bnJpQ1FPSWo2?=
 =?utf-8?B?dVZxRkQyWlZjT0lKL0FGa0VtUUNOV3lERVNWVjdET2p6ODR6bnNIaXg1K1Vo?=
 =?utf-8?B?eGxGazJnemhYS3dORG5TNDlCc05SeFBHckJOSTNMY0RXZTZsMTRocVA4T2RL?=
 =?utf-8?B?eU82N1R3RTJiUkdLNVZZQ0l0bXRnV2w3czZBSHhlajF4eUo1a2NjRUt5d2pq?=
 =?utf-8?B?SmRIM1N0dXF2R05pdTMreFRiRzZCMFhSMkQ4aTFnN0ttdjBBUk5uTGJmZXQy?=
 =?utf-8?B?OVIyQkFoc1JDdnJrYVdIYnAvanhMY0c1VEpVVW1uaWp1bVB0Sy82TDdvZ1RE?=
 =?utf-8?B?cHBDeW5nOHJxQWFWRitWc0JQYSt3WmcxZjdMNUZGQnFIaEtEdEphTVZ6K2tq?=
 =?utf-8?B?Sy9zVTV3cE5DdjYrUWtRV0ZGZDUydVpxblNpM1NzN21ZbEx1QTBEUkY4ejkx?=
 =?utf-8?B?aEVkclRmTW9VOWNucVRhWUx4TnB1dmlFcTdsU0pUOVJUeTVBamltczF4REJk?=
 =?utf-8?B?bVVNcy9yV1dNTHh4K1dtdTdxRDlHR3F3UnMzV1FXN3hxRHJaUWFsOGVUTDM5?=
 =?utf-8?B?YnRiSkhlbEY4Ynh1dnVjdm1haXhROTFWclk5NGtXR2paME1JbHRXK0ptWVJy?=
 =?utf-8?B?c2U2UzY1ZTZWbk9sMnNTNHJkLzBQZmdiTWVXN29YZkRnQjNadk5NekRDWmJU?=
 =?utf-8?B?M1ZpNnlsZ2JjZjM2QXZuMUpSN3l5ZXhlS0RkbGYwcTYxZXpyeWY5ZllWc24r?=
 =?utf-8?B?ZHY1NHduU21EYjhCQStoMlNHM0xhajcwb3Y0d2RETXNBcUpJeVdJR3VIejE5?=
 =?utf-8?B?RXh3WC9CcnhtUmxwNWowVEJFYS84enliazBVSXVqbW9yY2twQUliMVhxbkpJ?=
 =?utf-8?B?RnUwb3RwSXgrUk1ERS9obXZhYUh6ay9zQzlSU2ZjSEFMZXVTQ09FMmdNRmV3?=
 =?utf-8?B?R0dPWXBCaDlYSk1UZUJrT1Q0T21SMVNLK2g4bU1wWW5TU0dZNTlYSXoyR2tp?=
 =?utf-8?B?RTFVTUMrcFcyN2NVaU1McWY5a2gzWHIrM2xIdUtDNGh4aG9rRjlHWmxDMFlY?=
 =?utf-8?B?NXRDTG9KTmZnMzBkNW81dlkxVldPREN2UER1RlpUeThCU3FYS040cEZ4R1BJ?=
 =?utf-8?B?SHBJa3pJbklzZExRN0xVVVZiRkl5bS9DZFc0TmlkeENCc0gyK29XL2NZQnZC?=
 =?utf-8?B?Tkd2YjhrT1hkNVl4MnozUklDNy8rTHhMelJTdER6RFk0ZEVhYU0wc3VNUGZK?=
 =?utf-8?B?QnVvcUNMdnJhMStKTWlaSkoyWDAwS3NpOGFHOEpYb0plQmFXanR1dDUvRUNM?=
 =?utf-8?Q?x6B4/meE05Wa7o6qzSxL7QwnT/SJ24=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDVVUmtwTmQ4ZWVSVHNqdFRPVFBhNkE2eUprNlVUSTJhY1JUdlUzeXgwU0Jt?=
 =?utf-8?B?TlVSZEpybHhKWitJOVlCWmp0SWJmVmcvaGxaOEJiZDBhc256QXZScjJjNTE3?=
 =?utf-8?B?b1plcDNHSk1SckZHNlpqU3VXbkVzNS92NnIydmlKMUpTOVRNbXNMc1A5U2Ex?=
 =?utf-8?B?Tm9MQXY5UXMvMGJ5NUt2L2hkUFIwUmphS2xVOFdTRDNZblUrMUYrQTJhRTQ0?=
 =?utf-8?B?cHFpOEtadWU5V2taRWlySEhib0JRU2JsaXRHdlhyWStTNVFIRDZWd0NNRm0v?=
 =?utf-8?B?TmNMVlVNdzhPU3EvTjAvWnpOV1RqUXUxdUIraU40bnZmQzRUNElCWVpEN3k0?=
 =?utf-8?B?MUZSTU5RWnErZDR5RGhHUFc1NzR4UXMyVktEejcvNFEwZ2Y2VjVrQ0txS1do?=
 =?utf-8?B?V3FsNmluY3BUVHQxajA2RXlBa2VKamhMc3BUS3ErQ0xLOEovUlVkNmpSWFkv?=
 =?utf-8?B?R3l2ZDdXTjVFelVjNVJENlNLTzRtOVNMQjdUSlFHUkQyQTdrZjE0TXNTdGVN?=
 =?utf-8?B?NG9ZU2NTdjhLbmlUZ0VaV3hzbWd6WitlWGJPK2I5SFovOEs0bkl4aWdIVWZy?=
 =?utf-8?B?eXhiYUJoaVpnYU5qM3F4ZTFvbm1uUGJ4cFFYZmpJTzkxZGhCNUlyVFhCU0dJ?=
 =?utf-8?B?WnlMTzFjLzFiWURZdmpIS2o2MnpwZ1ZwNmhLMkE0NXpOOGZXWnNBMWxmdE1Y?=
 =?utf-8?B?RTNmZnJ2RXpkMmhoYUdObm5BelBOZUNGS0lOMkRmaTdOc2ZJdU8wVzJsS1k2?=
 =?utf-8?B?MlUwSXBtaEhOSXphVnR0NVN1TitBWFEyM1dLbnJWUFNmSHhXc3Z5TkZuL244?=
 =?utf-8?B?Wm9ENjZsUVZBNFdGVzE1YmRtcXFwZ1BMbm8wU3d6bS9PQnM0WDViNXBtWUNY?=
 =?utf-8?B?VURyYy9hS2p2NFRVTHh4Q2dXL3d2S0c1dFE5UWVkdmNnYTFWbTFGdFBaRlZP?=
 =?utf-8?B?UG9wazJSZ1FMb3ZNY2JHemRVMFRjMjZPL2svU0tIUUxjeTdONkI2NDV4bnRR?=
 =?utf-8?B?bmFJWGRmNkRhOTRyY3IvUU9pSWFZVlZJYXFjOGV6MWtSVHNGRkZtOUdoNzAy?=
 =?utf-8?B?RTZGdmlMdkh5dkJZZWQ5ZS9YeUZOMFBpTXZQOSt0dTFueGJEQTREcmZLM01m?=
 =?utf-8?B?N0VHUWUrckduQktrYWNZa2I0STNSVVpYb0VJaTVkaDV4bXBueVNBQkYxS0p1?=
 =?utf-8?B?TTdKcjZVV0RzMlAxU0MyWHpOZ0V0citnamxaUjJNU3o5SUZHWnJxTG9ZQk01?=
 =?utf-8?B?WFBxa3Fra1A4T0tPU3EydFlPMnUzYWhFUTJManRydWo4MjVQRDd1eUs4REFt?=
 =?utf-8?B?MGFpL1RlanNsdGxtMjhiWnpSRGJYckZmVE9HaGJ2UWh6MTlLaVdFUE5yMEFn?=
 =?utf-8?B?QUNtRElqSXg2MWpsLzBrRGxUUVI1NVhwK281WFI2UUFkMndHREwrWFpXblgz?=
 =?utf-8?B?MCtOcGI1Rm4rYzUzaUd5T2kwWFVESWRzVmdKeEtWTit6RXF5NzZGSGpyb3RH?=
 =?utf-8?B?QmlnVHhzQ3lMaHlxbC9YQ3BJVjYvSkJBNThic0tiY1F1RnAzdXlCbGRibnFk?=
 =?utf-8?B?R0FDWFdKNWNYMi91bXlhY3Q4bTZXNm5JZ3czL2huQWhQcUYrZGk2eVdnSzRU?=
 =?utf-8?B?OU0zc2dVL2oxSkF2Q0QrNFFxZEdWSC9EWFNlWEtNa05wd2Vwbm5OeWhVcllV?=
 =?utf-8?B?LzhCRXhwVTFQUG02Z0dMZGFxT045NzVmejBhN0FMdzNhaDAzVTQ5TE9GK21R?=
 =?utf-8?B?MGNwNTVUbE96clRPYnRkRTBoN0JwVFNSNE5KemxydTBpdEVJNFp6V0xlS28r?=
 =?utf-8?B?R3FIVExiL2lrb25PYlMvL1pxL1V3Q2xodHErc2RSdGQyY0VscVp2Z29ta1ph?=
 =?utf-8?B?SW1JRWdHeS8wOEZCNDlPcUVVbEJXR2t0amxCRzFBdzVqT0hSU1Zkd3JOTGY5?=
 =?utf-8?B?UmFhMSt6VFJsbjIvZ3hwTzNZbVY1eW9YanFoU3A5NnE5RnFtYnprNytXbUQy?=
 =?utf-8?B?dnZHSS90Ny8weStaSml3a0ErL0JoOURDT3NVZ2xGQkFmcDkyNW56QWVHWXcy?=
 =?utf-8?B?ekp6alV0eitUdEVPeGg5ditvY0hnV2JBMjlkV0VtNWpIaDRvaGh4R01mTXlq?=
 =?utf-8?B?R3B2anpaRk9JR3BVNHQ0aTZuZU13b2RMM0QyK2hwQjVWRGtzbXFUK0w0TzFq?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1a7743-c619-4383-da3c-08de1aee3292
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:28.9381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oOIUeELFUIZIHdaVXjODvfF8ROOx7P6uazSF3HPwy+YD8WKlV+UGMPGbV2NjJyW8uR4IiN2qr72pJefp/TwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df60d7059959bd8cfdf6a311bb49f..a54b8f14780491468b7b78ec4fc6ae3eaa4d59e5 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:

-- 
2.49.0
