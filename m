Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46998BE1BE7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A46110E95C;
	Thu, 16 Oct 2025 06:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lJLx9TEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6A810E974
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGHhjHj3YUrbp1kj08JcjsTCWImp5y1d3lZRa33bkmPidYvY682NBdDV2Whz8eYohFQv5k/1hAeJp/I7SfGB2ZTw9u/U6jWON/Nv0ghkT0qSwsZCcPIc+qP321tfBtrd+HtuZ2w/RvuCgXfeU/uG2P4hh4qtsM96ObgC0zSYTuqaoTQ4WozPRHLLvVQYvjDSBgjO4ZRU2f+tBAXGyXVu4qPs8hpYufLMaBMwgjn+91MDxiYWEAX4l/ZPzk34V9dIE5kpMyrbtOfM0TS7YGsAEupffSybD0UHMn62kqUKHu+n5JNAHPNdqk6jFvff6RE+nHiW52k7O9zczvooiDJIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqekQUTrM+wVutVjZBsKT63EkRahEdNY2t4xODs5lhM=;
 b=XHnkPo5Ps5jPNgXvmqrxumd3AI/cPq6pOApBjozaiCc3LvFXd3ky+I3kJx+9pzg93rdTysUlobF2s3eveT54wqQKdiSqN1ltCXJiHzwJDFRre/zPMaSNoWBr1XJ7mE1/20Wsul4L/pD1i3Nw6j4+ubqSEMHy3pbEnkXbVIzFel88m2VbRhAorUePRhKWV7H7OEDlmfBtT628wxnEKOf9a69JUGyc3c5FnkpRdtCPbQnunIX5OjXK2Reon61byn3ZNnYRyGur0A+e0Hr2O+7DgL1bfKR9pGm/qaGiG+X+Ck1/mguhTxR6koLzTTJCc9//2+3uweuEkEspylUakyCjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqekQUTrM+wVutVjZBsKT63EkRahEdNY2t4xODs5lhM=;
 b=lJLx9TEkMLtCkMs0n90+bMweTPS2VwMwQrS7xhvUrkFRB5MADjeG89PqjxDLjE2cgPIw2Wam2UvngsYNQhhTLXZzvKm0N1N2fBZjhSfLv/X5OE2XcDlK3cGoL8j6k98vlwaxCQzQzhhU6CONboUe2eF/FBVZqltoLRnrW9Mf3AO7YIJarPF6QgFUY3vW2fuIOosFauWY9ZqzwrirdHXrF0myGLziArWDAS7yr0dwfPadJsecAAjfjbZV7cPBagxi9DKOVOFsvFQwYR3rsuMBWolpHFfaucRVX3kTh+hN9l9+e2RI0E6N4/5aLa8cZSGfJBQEG1sHzX2V/J334CKS/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 06:33:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:41 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:30 +0800
Subject: [PATCH v4 12/14] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-12-dfda347cb3c5@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc88d03a-54d4-43cb-4177-08de0c7df289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck5NS3o4NGJjK3I5b2puRWFwdVpaS0llTFdxemppNlh6ZVRDWTVBbFB0Tm9X?=
 =?utf-8?B?L1lRVEJRRTRpeVFrbmFXeXFqZmZWUlVUdlBqRHl1d1NrRnpGR0JrOHdCcmxT?=
 =?utf-8?B?U1JUclZvTkZ6a2xLZHFrV3RoaEEwMXNRSXhuZTdialc4bkRlQlRZbWVKSytr?=
 =?utf-8?B?SjF0eEZFanVxQUROaWtrdGZBWTVZR1VqV0RDbWpXU1M5K01lWGNhanhZM1dR?=
 =?utf-8?B?MlBCYzc0akZUMGRNQ2ZTWUlCUHRucks4UWFpUEF6ajc1ZWZzdklmM1hoYzE3?=
 =?utf-8?B?alVtRWk2djh1WmswbE5iVmNyZ0xLNmhPTHRlYTVWWDJtNmpmalZ2aFNJcGRm?=
 =?utf-8?B?R3d5RURYaDUxaTRVOFU3NndyYjFTV21GY05YUW9jT1NWbWtCdXdidE5iUWpu?=
 =?utf-8?B?SmJlR3lMTDZtazFObGVnd29pcm1saVN0MllUTWhhb1M3LzJOd1BGN0h2YUhJ?=
 =?utf-8?B?cFlFdUVvOWJHc0oxWFEyN0JkS0tGQXJDcUhHRURlbUtqZThXdTF4T1N4UVNO?=
 =?utf-8?B?azhIOGhZMEFHaTRUR0dkKyt1dk1vVGpjajhtVmI1aDd2MDhOQTkxYzZLT095?=
 =?utf-8?B?TEd6cFZCb25FTFU3MUtwZEdyNm1PSEZ2Rm1BM1hvYURXZkV0dzVqTTlGQWtP?=
 =?utf-8?B?a3EyNWs3d3JhWG1Obm1ubVhQeXAwRnAxUE5tTHo3bDExRVg5MEd3ZVBVckRV?=
 =?utf-8?B?V0F2UGk0c284aHBOUWFWaVRKU0ZpNEd2TG84dUJWajlZaWllZFVhRW9WVnRs?=
 =?utf-8?B?NFJkaG41c3Y4NkhxVXVUNUF0b3RMT1JOcFo1KytaZVk0bjZVNXBZeW04emlp?=
 =?utf-8?B?bmZ5amZxNERORXpqK1NxNEdBRHJtNjU0b0xtbk5CZDJWYWJUMzRuc2Vrc3N6?=
 =?utf-8?B?OUhRVi8reG52clFKb1FyZzRETFgrYkhIVmEvOXV0Mnk5SDB6V0pJOXNTKzNy?=
 =?utf-8?B?ajNiZ2Z3UzF5T1JJaDN4eVgwRHRaSm9DVHZteEwzVHVNR3gxVDdwUDFCSHRr?=
 =?utf-8?B?UFFMMXVoTm1UTWswN0kxMmJZbXFNQjBWekxzRktOc3hKNThGSlcrb3Bjb042?=
 =?utf-8?B?SGwwaDV2L2NtV1VGY3hyaDYyNGtrcXRYNUZvUFIzMFRUQnpRaEpJNzZvL282?=
 =?utf-8?B?NzZZc0ZPdEN5VWFGTERXQmEwblZXMzlkYi9JSDYzaDgxa1dUcG9iUDYyNTRY?=
 =?utf-8?B?cnBEL2tRNENGbG9hSW9hMlBvUU1RWGlHV3FkZG1TSFlCajZua3l0cXhUSlhY?=
 =?utf-8?B?S1k3WW1VbG82SEM1M0JZVFdDVk85NFdlekNtS0M3Z1J0UFFsZlZXbUxhNExQ?=
 =?utf-8?B?NVpveDlRV1dzRmNsQjd0M2g4YldIU25iR1MrdzFjdWFyNTVnMzMvZlZWQjBm?=
 =?utf-8?B?d0dZaTcveHIwSE5QZFByNTdhai93VDk2ejVGTXBZQkZyZEFwOFQ4RmxraHNq?=
 =?utf-8?B?bzVMM01YRnJxdkpybW0ySEFOd3p6L0FxU2JtaE9HbEZ5blZrYjcvWTNmQWlw?=
 =?utf-8?B?WGh3RmRxSTNrVzRIbnljOGdvK1MvQ2NicVprSVQ0MStMM09uaXdleU5aS0JS?=
 =?utf-8?B?NzFqVk1nWi9uQXhHSW5tSUJTRXZNTlFtS3UyT0kwdWhiWUpMZ1d2MmJKQlVw?=
 =?utf-8?B?b1hxcDltOEJVOXZPbkMwYnVDTUdnbjgxbFA4dHhNcHZoV0l6dU1KNGMxcDNh?=
 =?utf-8?B?d2ltZk9SS25aQllGeGZianRxczI5bVE4eGs1eEM4dlBGbms3SE16RVB1TGt4?=
 =?utf-8?B?c3VBMldtU1hJQ2lBL2JRdFVacyt1Y0hnN29LK2d2KzhnTDQwR2MvNGJJZThN?=
 =?utf-8?B?SzIvM0tOU3pxb21pQnR6OU12OXQ4V0pCYi9nR3Y0QTRhUVpYWDNTNGhzdlFG?=
 =?utf-8?B?UHliNWgrajdGR3ZSRW1TVW45bmVpblhteHBOaHpWeWZYWXRUMjRTZnJRZ2Mx?=
 =?utf-8?B?aDJ0cWduKzdGQnlzWnNwaUZVUnRYNVc0bWRXK0tHOXIzZ3FtMGwvS3lVTTA4?=
 =?utf-8?B?RHBuUDVaNHUvaW1ScUFrNVZUb0dIOGhlNnBBaHlOYjVLdFlZR1A5M0JuaUpU?=
 =?utf-8?B?NE5QTzd2cng0UW9PMjhsRGhCMWF0UnJtVVJmdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDI1SlVwOGljZ0RCN3Jyek9sbGZVUGdSME9TaS9CRnRNSmp1dkFTSHRxeTdy?=
 =?utf-8?B?UWpVV0ZYMUs1UGpNUUVPci9JN09FdmY4bG51NTBHcHlNNmZPQTh0WjlVU3Np?=
 =?utf-8?B?SUlKQkdacVU3enBheFU4QmR0ZFRvWkRlOTB2WkM4WkMrZDg1UnFuTCs1NDRz?=
 =?utf-8?B?aWpPUjRyZUpYeW0zY3V2YkhMYlFDR2tuUkRzanZGaThpUjdKZ2VCUGdOeVIv?=
 =?utf-8?B?dGEzcmJMYTdyTjkvRXhlc3MxOFlkek9OR0dzaHVDeENMeUI4S0JGM3pmZXFS?=
 =?utf-8?B?TzZpVDU4NnR1djdQNE1ZU1N6aGw4Tk9SYVM3TWRJS2N1WmdGR002SmVMaEU1?=
 =?utf-8?B?Z0o4SDI4N2pFbTNlQzlTRldjS0tvWU43WTRSQUlDbnhkUGE5VGdZVUtqcFVj?=
 =?utf-8?B?cnNMNUFZcXJRQ1ZWd0RNaU1Za2pqbHdvVXM4bm51UDlGMFdHNXZkNi8rekhD?=
 =?utf-8?B?d3lNVlFDUWRRdGh4MkJVeEpTVlBlQk13YS9DNy9SMTR2cjJETFYyR1I5ZW8z?=
 =?utf-8?B?YzJIL1RNRW51Z201YWxOeFdLNUlBaUZlYVJUTFRhMEJ0YmR5Tm1BRndGWlR6?=
 =?utf-8?B?MEovMDgxVUNCWi9SV2hSNERQK0g2QXhJOFlVR2tFSzlBL2hkNkgxSllsOXJO?=
 =?utf-8?B?Ujh6T042R2RvTS85VzBrT1NXUStVd0RiNVlWZlJWQWhQOHZ6UExGZ2FRdThl?=
 =?utf-8?B?VHN2bmw1RlIyUkVhR2tuRHZuWXIxRlpkc1RrdlFQNEd4bC9HMVZmOFVnL1o5?=
 =?utf-8?B?YTg2QXpPbDlhMzFlS1p0T1dKRnAwN0Z4eVZGbGc3WFRqcjlYSTV6bXYxQi9R?=
 =?utf-8?B?SzdhNFZFTjF4MWxZTXhXSFhPb2Y1eVJOWXdGaTdTT251WEVzMkJ5MktnMjhL?=
 =?utf-8?B?ckdlQWpPZFVOZlhkVVpSRmlIQlhlTDIxQmxwTjhEQ0JIclZBRkVJdXlVSjVN?=
 =?utf-8?B?blIwT3NCUGU5eGF5N3hadSs0bEtpQ0FsZUNXWTZxcTdPazRXN0N4dUgwZ3BT?=
 =?utf-8?B?WUNodXZuK3VuVXZuV3FHaHErTkQ2cFNTQ1NybElMNzUzakUwaWFiOXppa2Ny?=
 =?utf-8?B?b3J3TTJ4UzcyQjRDMytLWk43MWVUeVgyVWptZUZNNWg4bklRd3I5ckU5dDRz?=
 =?utf-8?B?bVlTank0UHA2cmJmL1p0aFNhQ1BONVZ1NlkzdXdDV2VFT1hydGJvajBUc2RK?=
 =?utf-8?B?Rmo0Y3NaODE1S0wzT2hPRE1hTHUrNERzck44S3hMUHdsQXVyTWJOUHdiSTgx?=
 =?utf-8?B?Z3MwUGNHd2dtcFY0UjNoTkNqQUVSbWUvZ0RGYlZQcjdsNFZkQnFRUlEzOGRI?=
 =?utf-8?B?TEE2cnh1MkVJUE4yaDFGZy9tL3pMQzlGSlhHN0lNVHNKM1BpcVhkd0FmNlgx?=
 =?utf-8?B?c2MyZmoxLzhjM283OHdFblRoM3BsOXpjQlA2VFFRUVk2QTZLZi9WdlhRQktV?=
 =?utf-8?B?NGJpSVdYRks1ZjNMZ0YxYU11V3pkdlM2U3pyd1YybitFcmhVS1dNK0V5aCtj?=
 =?utf-8?B?cUp2YWZJdFdZekdsaHRpZlVSVVZVbVNGcVlQc2xkdW54SGVGRXVJU09DZ28y?=
 =?utf-8?B?amZNUXBRVVNKbHZYMnpiMVlpazFFcUFhVGNVektEemRJcnBsbU9WOUtEcTg5?=
 =?utf-8?B?OFNEbUI4b2VVMGxsZTlmOXJhWFQ3VkJNdUdSeVJzazhrSXZwQzFHd2R5Z2Iw?=
 =?utf-8?B?V2FNM3FzMWxsdmZOMlYybVVNTTVBZlVMSFRvdlFKOU14TkJWK1dZN0Qwemwv?=
 =?utf-8?B?WkErTFp3QU5JdzdPQU80NkVmMVFSamRPbmxzd0pXaFdqTGIyMjhWUHV1MGU1?=
 =?utf-8?B?MlEzWVJaU1kvcjE4bERBV1h5aTViS1dtKzhsZW5HTVYvYWZIOVhHMW56WUow?=
 =?utf-8?B?a1JLNzdCOGg3S2d6N3VrWW5FY212TjliMmZVYlc4K1QxR0IwUkRnK29yd0Vl?=
 =?utf-8?B?Nk5TRko3TmZqN0czLzRkallVaG00ejZEWTlnTUpNQkwzcWpSdWNLeUIvSHAw?=
 =?utf-8?B?clZUNkMvT1l4bUJUaUFJSG1BTUhoUGpVTHAyd3dTZUh5YTVHU0M2WFFXSFVx?=
 =?utf-8?B?dW5LcVlRSHprcU9YbkIwZ040Q1BtcGJWT0JYSy9YRnVXL0lUWnZZak4zeFcw?=
 =?utf-8?Q?Qa9O08RXncvLHplu3YrmDhnQU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc88d03a-54d4-43cb-4177-08de0c7df289
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:41.4523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI3QGbuVqU4CEp+g9bwG2UxVg6hwa8v5hiXpR4+erW9WvtGHsYhi+vUpXmtZXKsxccNvOBfWw4X0nNqbfdUwZg==
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

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 8622efac3f3d566ee6eeef33d90e2e26899f6502..4776e54439fb3df42075667d6fc2971da590662a 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.34.1

