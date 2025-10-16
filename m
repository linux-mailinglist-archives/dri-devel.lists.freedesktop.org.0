Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82808BE1BDE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91510E957;
	Thu, 16 Oct 2025 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WwQS2iXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438010E956
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsnsL4ZdF/unWy8Ss5vcOIH/qRO9QETAsgPR4/ZxpqkFdGsGHeeOykGf21qKUQF9ml9ze2+Jml9HK8hDI1eHH8NL9TB+UszN3lx+/aKQUNz2MtHnuSZ9xpNHpU6TSZzc9LavCeLuY3z3PLyRfScZptt1bB7qahuWSQk8QTClzv4/XVXWqtbGNwcgQBln8tiCF/+LElZoE01VyLDahIMPouCAHjq5Cvn/Ax0eD5MAclbtgxRii9s+9sKhmsbfDvHr1xPHCYhawPCCoHJfhM2VH/wm3a2ev9jAi2EGSKcE5slmWaPLsiKTDLBQnY3NTwjrB6uYU88T87P6eiw7aWABhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsD9Sgp+4EZjesXNUs3j5P3Y7PYJ2/tD1wUk5ZVPQrI=;
 b=fKDW4b5Urr4HjXkmQecY+wBT3xVGJHL57LYPk0J5IOnhvxUitC1Llf6d/zXvECPtQsDil1CCLe01hjEuX4BvK4qZ3YtEOQJOS572w521Cnl/qN5iwOPK1R1/AQN+6YteVrTy7vFDYUXYUX5Evp7LVabYq58kR13ONglr3t3t2+CSTm+WDxbLHEVE987dcfuE8hlxhEdslGJKL7XM3UHG99n1mVP6YV+5L7ekmvhH0SpgGj9TNnXS4lrtXzOHd1ReUsR2DNTE5zIWFIhPlzsCo9omjQTtiYRDvjxU6Mh+1W9mvqYIhn+yqlGx+8ErBwP6Cu+gBUKKjDLokmGNxHQINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsD9Sgp+4EZjesXNUs3j5P3Y7PYJ2/tD1wUk5ZVPQrI=;
 b=WwQS2iXqSl/dOdNgDc6sSdhY/Gcnj30yH/LHwV2vLICNPgLGVSt3KR0qq3eQmnuZP2VybP2VM//LZithdcpGRu8LjHec9o+RPzL0LyyaIhgJIihhazEp7tOS9WH9oTuRo4qn2TbGiAdHlyRdWXUEttfjupdNChvQm+AVnUx2x29OeLnohnbdb4QQEWp8gLwLIcFJCU11OU/69UVS0uQVmYkcWCUezr+Ld8aUtkmlmqj+XcU0TFnVMJoEP/xn/3f7c69GqSD6wecxCV6iSKaaWRPA/6oSAsJIWPNJrhCNzIa2GP5tGpXcM/BMBrzQnOHg/AkSyn63tNK6JQfvrziVDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 06:33:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:29 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:28 +0800
Subject: [PATCH v4 10/14] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-10-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6ba93b-435f-4248-7d4d-08de0c7deb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVFIYmxRSzRUREZQUVdyY2JBRXhPclVFUGJ1dDRBZ3FCd0pRSGVUQ3pGSDEw?=
 =?utf-8?B?Zk9jalRKWll5Qm1Eb0VZZTFTWDdab2NDTmRkWGtHQ3JSOEd5czd3WXdwN3FY?=
 =?utf-8?B?TGREc25URkwvZ2FaSEwvVmdyV0ZMak4vUkQ2T1dzd3k4SlZTUm1YZ011cGxU?=
 =?utf-8?B?dkYwNmpPbUVKcmIyQjRRMHRsaXhxMUtjNVNLYUdPN0NIM1JCc2FhM2lVaVlS?=
 =?utf-8?B?bzg2K0NyOGt5a1c1ekl6aVZkTGpGMzAzOGZOMlhuYmRoM0ppUTJmZTVCbGV6?=
 =?utf-8?B?Ylh0RXE4UEhRVEVjUFBleTB6a0VpOEI3K05YeE84SldqWE1lUU0rTXR2emdM?=
 =?utf-8?B?WFhvUG90dWtnMDNGRUUzeXZtYy84ckdVS0l2NDRwd2JnZ0dMRHBCcVFwUEtQ?=
 =?utf-8?B?QWFwUzd3aVVVYWNFMjE1Z3V4SC9VYmcvSStDT3g2OWdWTjMvZjBtTGVubmtq?=
 =?utf-8?B?cExmNW45REl1Z2JvZVprenN6WUJhUGRPSHgzSWdmTUUyeFVGUXdaWEhYUGhM?=
 =?utf-8?B?Z0ZZeU1QcHU1VnV0TUIzSDFsMmljRDhGQkIwUGF2MVlpdzY4WlQwZ3F5d1FS?=
 =?utf-8?B?Tmk1K2dRa1lQVkhnNjFJT2xYdTcwUjM5K3EvaHp4YzVWUjlYSmtyczRxSnlu?=
 =?utf-8?B?dXMvYngvR2NIQ2taZVk2NkUwU0FxOFd0d0Q5aTA3bzdTQmFqWUVxNmhkU0xv?=
 =?utf-8?B?QTBrbU1URGRhdWxxMHJML3FLNmFva0ZheXI4aGJ1TU1DZU9mdVRCaS9FbVpN?=
 =?utf-8?B?cHVIa3NHUzQ0SlNHTkRUSmcweFN6eXFCYmI0dWZOeEZaSjR2NXFVWkRzV1Bn?=
 =?utf-8?B?R09EaTF6dXFtM3M5YVhiZkkyMG82SEI3YkthUzFQZ3RIN0w1WHBtVlhqVmNB?=
 =?utf-8?B?cDhHclhJaG16amlWVk1xR01FdU9YUTQwSk92TGJya0hwa2JFcHRqOW1ndmpq?=
 =?utf-8?B?dXRDbW1MTEVYYUQ0Ylp4UFVKdVBLNis5aW1BRFV4Tm1XUHYrUEhoOXFSN205?=
 =?utf-8?B?dFhIaHFScU0wc3Yxb3hKMWtqWGZhQWFZbHlUSXNodjg3ZVJxYWRsSXpnS2xY?=
 =?utf-8?B?QXQwWUtrcEVpcVd5REZyU0FiT3NHcUE4MUYzVUNESHBvZ3N2NDdGZmlIUFVU?=
 =?utf-8?B?aWhyRGMvNkwySTZtOWZwVUZxa001YUFSRWlpaTVKK09YYzRVczNzNVFXczVy?=
 =?utf-8?B?eDRQcHh5VGsraklQWFRnUlJYNUN5Zk4vbUR3MWkzMUpHNlRWTTk2c0dCODR6?=
 =?utf-8?B?WjYvYzdpOEF0UldSSlJFWnhYNEdDZlg0WEZIN2d2Z2lXcjBrc2Y1dE9BeUVJ?=
 =?utf-8?B?K0hlZ0w1b3J5UkxweWt1dEF2dVZoUnJCWHN4WmxuSGJEaDR1d0Y3U056ZTR2?=
 =?utf-8?B?N3Jxb3h4djI4U2c4bVpPOFJBa0pwREN0NlgxeUI3RDFEN01FWWIvRU9EYnJm?=
 =?utf-8?B?NGtkVnJCTkRuNStrbFVpSVplMXJ5VHBTNlJ5RTR1aXZtaHk4Y2I3WmcwMlAv?=
 =?utf-8?B?NTZzMCtkeEVHUHY3SlVhQmhDYkkvNU5jNGNoaXZ6ckU5R0lPQlp4L2JoODRK?=
 =?utf-8?B?TFdsdWlXeHVUc0c5ZXB3UzVTSkRibUJuUnpWbUJvSFhQQnVhc21wUVh5VVpp?=
 =?utf-8?B?d2F6bStCQjlpdmtCRzM3bWU2WVNUK09aSmhlVHpKK1h2cDVZQVpIZjRnamY4?=
 =?utf-8?B?Z2VXdzF0T1FOeVZtUjNvdzAveE01YUp4Mm1Fb3FVampyMmpGZjJBL1FmdDNj?=
 =?utf-8?B?Rzd6RjN1ZHhacVJ6REdmSmpSczdBTW1rU2tQVFVNQ2hXRzkyRG00WXBVMjhS?=
 =?utf-8?B?c2tuSkNXeWE1Q0x5eU9tNE5TVlgwdlVuTWxjSWo5REZPdVQ2UEVGd0JJMm5t?=
 =?utf-8?B?UTRYWGpCTnVhZ2pWYVJZdEs5ZUFoaDRFYnRrbllKSTJweXNYWHQwY0NFZ2Ez?=
 =?utf-8?B?dnBPTHZyRk5qd2VJVldaTGUwbHc2ZTJmeUViU0RPaWlyUFI1R3l4ZFQ2OG9t?=
 =?utf-8?B?Z2FOMWRiMkhSMUllOWY0dDFjcHFsU3NEUkZXVzJ6SXRLdm1PYUI0d0VlZURv?=
 =?utf-8?B?TzhVQnhEbjhuWS82VWhEb01hdUVZS01HRGFnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9LM1JtUDFaODBjM0ttQys0QU5WSzJRMjNKbldZZzQzNjJQZnZwUnA1b1I2?=
 =?utf-8?B?V1U1NnByS0g1WU93QUdYcWQ3dTY2OUdIcjMwY210ekFjZ2RoS2p4Y0J5OERl?=
 =?utf-8?B?MGxJa0FBTUh3SFRvRXN6ZkQ4K2U2LzFyNUFhM3ZtczQ5TlZiMmJCa0VCM0x0?=
 =?utf-8?B?dFhkdnIrbjhQa3pNS2preHQzR3hpSzJ0SG0yQmdaM290MU82ZVgzRDU5SXV4?=
 =?utf-8?B?bGVzUlJtdEkwQU10KzNMQ0E5RGc3Ty95NFdEOGc0UHRWMDFjbERBei92aE1M?=
 =?utf-8?B?d2RTN05za0tLSmRHZENRcWEwMzh2aUlaTS9TOXE2U3VtUXFvZGloeFZ6SzFT?=
 =?utf-8?B?N0g0SE1EeVU4K2NjOTNZYUhveDJrTUo5Z084bGRZN1h0UVdlSE1yNnVaUTdo?=
 =?utf-8?B?YUtseHRRMUp2dnFDY0FpdHcrVFNrR0RXZVU5MHBLMFl5bWFlVk9zbWh1YUNU?=
 =?utf-8?B?dnVNN1BxMklNRjlnNmtiUWtMclVPb3JIVE9qNDc2d2gvRmlNdjVoTTY0VFdC?=
 =?utf-8?B?RTg2bEtOK2l4SWJNdUxHMlBNT29BRnowWXVFYUU0NXpXeWpIcWlleW9NejQ1?=
 =?utf-8?B?azRzZGhoVkNNeWpRNEQ1S2ZYRVlWa3VuY2tweU9jUm9tT0U2L3JPa1gxUmdl?=
 =?utf-8?B?VWRCK0tPM0c5RTlsMEtaOUoxa2FYTUpCc1Z6QmFDajZHb0dZWTRadWNINjly?=
 =?utf-8?B?V3dMd056N2Z2dFdSTTk3RXJoSmZmWXcvcGwrdGxzM1V6QlZZckNZWEtmYUlG?=
 =?utf-8?B?enp6ckkxNTZFc2V6RXV5QVU0R0lIbksvdkVwRFpjcENJa2cxQkkzeDU1am1w?=
 =?utf-8?B?MVlyOHp4TmtxU3pYSEFlVVM1QXF2NzAyQXUvcS83K01zOVVUbk8xQXdvbkdU?=
 =?utf-8?B?a0RSZzJ4bzBpZTB0QXBqd2QyNUh0Ynovbld0WUFVMVF5RFg4Mm9rb3ExM0dM?=
 =?utf-8?B?b0Exd3Fpai8xUGQ1MUYvN0hxQVlyYzJnd3krT2ZWVGRvTVBLcG5MNUxJNWtQ?=
 =?utf-8?B?UEtaU1Y5OGVBQXZrV0RudG5oaVErL0kvYmFxcXJPcVlYeWwwZStXTURkMFB0?=
 =?utf-8?B?SGQ0cmFoUFhET1NXYTJtSktmQnZBSWZBY3VqWkJBTGpRQmpvWmRqSHVmMUF4?=
 =?utf-8?B?MmJnUm5OdjFRc1hYeWUxV1J2V1ZrQ2svckFBYko3SGplZEJqQXdWUEMvVzM3?=
 =?utf-8?B?eG8rbUZsWkE5VUUrcGVGaDd1MURyZjI3cjdnZW5TaHVRTXVwM0ZTbEpUV1ZG?=
 =?utf-8?B?bDlUUzhTVGZUamFuOVlsSThuaHl5TDBXVEgvNUlaZjBOUlhUV1FaZ1RPb0tM?=
 =?utf-8?B?bE5QMkVvWmp4Rk5COC9BU0NPb0M0eHM0YnZ0Z2VObForSzUwamNpZkdhSHUx?=
 =?utf-8?B?UnNhZ2hrU3J2c2w0MVBvN2xMdUlsN2pFZUJDakwremVISk41UnZvcnFXNXVE?=
 =?utf-8?B?NWYyRGNXcUl4QjcwS1RSN0NTSlV3YkFWMzM1MFV0M2ZpMkZlNEdUYzJ4OWlh?=
 =?utf-8?B?blQ4NnVIVUZJS0FKRERpVHo2TjkyVWVha2xTcjZuK0xnOEtwcGQxS1M1TVI4?=
 =?utf-8?B?eVNrUGx3RXZZS0w4cEZWSHBpVklVemprT3dRQVBRUVRlK1o3RU1tUEhYNkhI?=
 =?utf-8?B?RlhZUnd3NTg4ZEFtQXhOQ2FWVVFXY2lGdi9WU3hDZE1IZWFDYUxlcVhmTVl2?=
 =?utf-8?B?ZXA5emc1MkhuSnZ6U2ROTnhDRjZobkhDZU54bFpTZEQvVXFRN2F6aDVrNzhj?=
 =?utf-8?B?T1RDMmpML1B6SEl6dXEwZVVlcyt0NTZFemxCZlFyc0NDS24vZ3B3MGZPQ1By?=
 =?utf-8?B?STBzWGRyU1RGQndiKzVuS25RaVIvZmFTYzZXRmlvLys5dEJ6OWdYTHZ1Uisx?=
 =?utf-8?B?bldQbXJZREhaQnd2c1ZyVFBLb085L21sSmhDd2NLaDVlZm9mdEw2MGNua2Fm?=
 =?utf-8?B?bDBxektXUXpIVFdzcmZUNnZmRWY1cHJ5MVNEKzYzVjNGRW5pTXpXQmhGam5R?=
 =?utf-8?B?a2VzMmREem5TbldwNUlvaU92c1RTYmt2MldFekU2c3lKL0huWGlLZGRuVlhN?=
 =?utf-8?B?VW5zOW11SWxHdWdPaTljY0Q5RnpvWHVIbmNVOXYwVFFYQ0J1dkh0NUNPbG00?=
 =?utf-8?Q?l02Y+me8q//1xnZRM66PkZzyl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6ba93b-435f-4248-7d4d-08de0c7deb4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:29.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mCipgrvmPUztjFNsBNx3O62WVFmssvw8LcGWUyAjM1ejPqmeoBLiH8AnCJK605NYqelauPE+DE/soVe2dkH6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

Add a helper to get LayerBlend secondary input selection.  This is
needed by disabling CRTC at boot in an upcoming commit which tries
to get the selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
- Rebase onto the latest drm-misc-next and resolve conflict.

v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index ca1d714c8d6e654729e3c3ed5c00e74653b3e6b3..8622efac3f3d566ee6eeef33d90e2e26899f6502 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -20,6 +20,8 @@
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_GET(x)	\
+		FIELD_GET(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
@@ -182,6 +184,25 @@ void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
 }
 
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec)
+{
+	u32 val;
+
+	regmap_read(lb->reg_pec, PIXENGCFG_DYNAMIC, &val);
+	val = PIXENGCFG_DYNAMIC_SEC_SEL_GET(val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+		*sec = val;
+		dev_dbg(lb->dev, "get secondary input selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
 {
 	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 0b81dc6b251c452e7ca72f1cd12af065bafaa198..4e38aead69bce6e9ad4cf2a7cd1fedbaeda60650 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -93,6 +93,7 @@ void dc_ed_init(struct dc_ed *ed);
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec);
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
 void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
 void dc_lb_position(struct dc_lb *lb, int x, int y);

-- 
2.34.1

