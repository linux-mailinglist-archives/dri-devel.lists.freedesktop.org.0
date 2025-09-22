Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A58B8EDF3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 05:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE0810E398;
	Mon, 22 Sep 2025 03:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bswxANUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237B10E398
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFuhXOW9dELJljKfY4V+ISd4y5JWt6RiniuV9iMT80n5XT1330m8Lw3QR2eTOGmmSxYX2xeS4Ro7D6zA9K/CN6/IlDldx/05sZrgwV18eYUYC5Tx7KFBjDeKKPMiPr84kalv4itaInGDWEFbF51XJ1fHhzcWypJ0nr6ZJ8F+qW9XaMh8byJggDXt/F+xpK0jhrGnxERk2BcDFrNNzphzdVqtKuZeZOcyf8zUQwP+Yl8NSvVsKyQmUjv21ECHeynK0vXBID2x96gwisVViX/UB5l7PIEwFwhtI5gmQMoDJnuG0XGKpfzZH5wlWwpfeaQMK7PunfDwSy6t4k+NkGh0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxoKgIcmeUdYbu2gDhTgTchMOXy9y7xYnFxZto5vGdA=;
 b=G46BgV5Iu5lhCVgaYEK5IRjsMbQyd8zQL17istSpfWox/EsXsrvmF7S3sX0ZLFXwlIVEK5kNnMnElEj1J47XCYofOyJqmH1gRZBGvH8JAUgiTnawacI1L00LhFEyK1rdPylZ7SOQnfv7lPT7qgc76zkGrtcWr0kr/ENcZOqQx89iC7iPXIVwl78XATvhffUsjMggjUx1WAeJYEzcaKzAFE6qnNSyteb9DgjRH1ZU+cAYPROjuEoIcBlyEtceJGGMcopRlJtJoog1XPWJaJyKttKu2C8UsCp0tZY9OzlUkkUhc48Hp4rNdyoFSMYZ/cQjQZ7x9ZCqQi2+Mr+3UDmQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxoKgIcmeUdYbu2gDhTgTchMOXy9y7xYnFxZto5vGdA=;
 b=bswxANUXWgO/TbRFwX0/si30YuoqU8Br4zt5PrvnyynPbV7ErPR9r8dKNqzY2Rrm480c5/jtfXbIJJQzrOCh+Rs8HirpM4dOSeEWUFeyD3hjwdL18U9jGUxd63EenuAywOm/nKtYshggDRDC/w/2qsBFjfkOWgjeWM225VRzZobvcqnK+1ai3nptHvRHzVbsmULDdmdbv8k0hS562TJ8uWjXWgr39j/Kq/0T1sQrOx9nBxr5Ebx5UXocdA80PozM32lt+mCLkQOXw5RZiqBUs52Wrf9z0l9Fmz9t6eHi5HbOz17mK8B986kcbdpj9SLY3JHZMJtSYYvcSDXMgshgDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10263.eurprd04.prod.outlook.com (2603:10a6:102:455::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.8; Mon, 22 Sep
 2025 03:42:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 03:42:41 +0000
Message-ID: <b3382f33-fdbc-48e6-89ee-0f46947fd42c@nxp.com>
Date: Mon, 22 Sep 2025 11:44:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] drm/imx: dc: Add DPR channel support
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-7-784c03fd645f@nxp.com>
 <aM1zrOdM1pj5jq/z@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aM1zrOdM1pj5jq/z@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10263:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a38aa69-8167-4324-5745-08ddf98a156f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGJkQ3JkcmwzSXFtLy9Cc3FXc2grd1FGVlFSZmJ0bUcvZkRudGI1eHBpQ1NT?=
 =?utf-8?B?NUg0MkhxdjlZNlBXS0t4cWV5SnpzaVhCb1hUT1ZsZlE1VUtOOGRqeWQwRzBK?=
 =?utf-8?B?M3A2MmhxQ0dvazJ2SHZVQndmWjZ4MGlkTzZCb3duZmtnV0VjUzJNdEdHTUlM?=
 =?utf-8?B?bWFOVGZBL1RNQ1BYSWNLR3kxNWZsM2V1NzdBSzMweW1Db2cwdXg2UlhUempP?=
 =?utf-8?B?bktWNFlaRitJbHovY1RGMDdWTlRHbzdEMjhBSGd0RlhDTGFRSDVWUy9XV2tr?=
 =?utf-8?B?S1JMRC92WjNsOVNLM2tKZkY5dngwTksxYlJKNmFzT3FNVDE1d0JpMTBubFVM?=
 =?utf-8?B?ZzVyMFA1YWN1akRlWE9DTmdWeVk2NnNVNnJuRk5CT1dBanJIS0pJam8vdTY5?=
 =?utf-8?B?UjFVcGhnNXc3dXYycmdkV01xSVFrcndSRDVzOXg2V1Z2VUlmcnd2WmloK0Vx?=
 =?utf-8?B?eGxSbEVVVjJEaDYrOU9IQzc5YkxoaHd1SkI2R0tPWUdzQWdGNUNMU0dXOHNR?=
 =?utf-8?B?Y0ZFMWphdXRsUWMxSVdUazVzZ2o2KzNTTExIYWFhYWp5dmcrQXJOdU1OS0tW?=
 =?utf-8?B?L1hoc3dZUkdBSmpVQXRLRkNYTlcwNnVpalREM3Q5ZDlIYnhiNVl5NzNnK1l6?=
 =?utf-8?B?VDZ5bTZxMXR6YWNmUVhiTUVoM2Y2WmJFazhuQ0F4dGVpSExSQTkzQ1B1bmFE?=
 =?utf-8?B?MXplYkZqRlIrTlE5bUxLVjBabDFrWWRJajl4Mnh6NE5GOU0ycXZiTDJFNnNs?=
 =?utf-8?B?YUFwZ0dMWW5Va3p5TWg1TjhHTExhWXEwVmdUcjZEM3g5TVgxNXJCUVpHQ1dZ?=
 =?utf-8?B?RHAyRmoyQkxaVmNkZkQyUEZrWS9CTDVMdXZlZkp3QWhZUnF5SkZ5SVBtcjRE?=
 =?utf-8?B?RFc5Vm5yS3B3VDV5SUVTeDNDLzVmQUVxaHgrYTNCWUtyV2ZCUWErNFgvM1Yv?=
 =?utf-8?B?L1V1UUw5WThNalN0a3VPZEJuWml4bVpqUEpDMWZGYlFLNWFKKzUvRkpDV3hX?=
 =?utf-8?B?QWQrVnB2emJsVnA4NzVtWlpISndOVGxZeUJ1b040RVEzSjlYTng3M0crNzJ3?=
 =?utf-8?B?ZDhqV2Q5clc2U1cwa2U2ZkI3ZGgzZjJYV0kzZXZwcUZBcCtsbU5tY1J5bDYz?=
 =?utf-8?B?aXRvRlpuTEsxNE5lSkpSOHRITHFDUHhOMkloaHdoTC82bFM5ZmdMRmpqYUpm?=
 =?utf-8?B?dVk5SldGUm5nQWxIMEt2VVdmbCsxblJDTHhwQ0dxY2ZlN29WMkR2cHBHeEVH?=
 =?utf-8?B?YkxtM2tYZStwZ2NHK1krV1ZPMnFZd2RoUTZJMlNDSms5MjB3MTE1ODFHTlRI?=
 =?utf-8?B?dUlKa2xQWmhwVWxhS1JMQTdCMmZib3VzY0JHS1hWR1crSjlxajY2Q2RFckk1?=
 =?utf-8?B?am5peDhHUzNGUWVWR1JBZnhTd2hQY1lyTW9RTW50YzV4aHpZYUdqMzFBb0c1?=
 =?utf-8?B?YVlzeWxOTzRKdGpFNUx3NVA0TDJhMkR5RGE2UnpvMDlHVjYrNWRqZkxabDNQ?=
 =?utf-8?B?dGxJR0NHUnk4NGFjQWdCcGEzemtVTGtXNXd1NlRRZThSNmxURlExU25YKzRZ?=
 =?utf-8?B?YmJvZGU4VmNPOFFLaHBUZFA5elc0QnZOOVkyZXVwTEVLOWxZeEdKSElWQnQ1?=
 =?utf-8?B?MHdxNTNnQTFtN3pvbk03emhRWGZyZjJCdlJoM0xpdzFTaWFjTXBzTDBKRnJY?=
 =?utf-8?B?N3crQ3poSXNCWnBWeXlJbmRyRkxkTERqU3NqdGxCSXdhL2dvQ0Y2UzkvS1RH?=
 =?utf-8?B?ZksrSjUwczBvYzI0bVlwS1FlYnhlQ0NHSFdPZk1yYWVBUGhtYy9HZExUYnph?=
 =?utf-8?B?eW9LYmxMeFBpTktKVEU3ei9yYkFrU3VKUTVrVFFjdFh0NzI1UDYwWFZyd1d2?=
 =?utf-8?B?ZUlpaU5qNHk4NGhBV3AxOS9Ka1RXOUhidGZDcm85SnF6U1ZHWnRzdFdtdHB4?=
 =?utf-8?Q?2oAIGzkq+2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpUYUQ0MkhLeWZyWXZYdi9QYWVmV2Q2R1A5WURyTjVsdERzM0U5cC9MY1kw?=
 =?utf-8?B?ZS9vY3RFL1FxVy9KZUVPd1ZPOTdSeUJQODhGMUFyTkUvWlFDTFpKYXIzZXF3?=
 =?utf-8?B?OWMzakZCamxPQ3hReHZEV1Q1bVdVNmRpWjhqRlBVZUs1UytNYTc4aWZvYjFy?=
 =?utf-8?B?ak1Jc0F4bW1vU0Y3RVdiYVpESHErMkVQVUpPR1FFd3dqekN5YWtUUE9hYjd3?=
 =?utf-8?B?YkJtQzlxd1NhSTF3MmM3TWVVSU5xblVIWkxEbUlrZmc5cDliaXBUdDBWNHhB?=
 =?utf-8?B?QmpvVHNydnBRQXlxS2dud0poa3BhM0U5YmFxbzZxbnk3dmJLTkdQZFc2TDdz?=
 =?utf-8?B?TkcybDVVSmk4TGlSaERVc3ZkdUoxNkVyZ1lxNFRlcGdtam1URldETktaUE1z?=
 =?utf-8?B?NFNDM0xtM0h4WDA1dEZySWRhM2w3TTl1MWZ5UUUyTmtQOUl4MUtOaVBwUllI?=
 =?utf-8?B?MXFGVy9rbzk0SkYyV3hEbVJ1d0RNQndIYnBUcmdhbWJLU09GbEp2UnV5cXdl?=
 =?utf-8?B?NWwvKzBQUmx5czBseDF4WTNpUjNpZUdhKy9IWWswQ3JJMUorZm9zVDdYMEV0?=
 =?utf-8?B?bnVQTkhIRjdpcUFmRHVnM2o4NERNSUc5Sy90ajIvbitXZzFRWDVsRWxkS1FL?=
 =?utf-8?B?NlJ0SnUvTW5NYVJDWm1uQkRnZFdraitCbWJXWVplWFJRQUoramFyMzdkaStZ?=
 =?utf-8?B?bkM0b3NzOGVRcDE1RExWM0tFQlo5QkdlbnZ3aHVxdGU0bWdmenFRVWkyZFda?=
 =?utf-8?B?Zk5GSHJBR3NSUUFPQ1o4SVZvbTNWeEZwQVBDajZHV0xpSC9BUUFJdThkT3N0?=
 =?utf-8?B?eFVJUkU1Wk9TLzFySkNEa2szekZRUG5FNHhQQWRGSU84eTBwQjh6Zm8wNGQ4?=
 =?utf-8?B?M1NWVkJ2RWg2YmdJT1dvNXE0YVUyL1poKzlaL2ozOUgvSmhHL3MycTRKamM3?=
 =?utf-8?B?OTlScWhEL2VuTzNrankzZHhMZktDOE4wQ20xUHF0aHA0KzVZL1VJRk1YNVFn?=
 =?utf-8?B?Ulptc21CZFM1WmwycWJPYzdnU2p0NFVhcS9YQzl4eWNYMUJXMVdBT1dUOU9G?=
 =?utf-8?B?bXgrY2s3OWRjOU1VdDB5dmYySm5GOGNjZHE2MHhKUU9nUUhwV254cFNQK2FV?=
 =?utf-8?B?cUFaaDg2U1MyR0hjK0c3azJoVmVac0g0T2x1alE1TnAza0VIYWc5VEJzdjZE?=
 =?utf-8?B?SnVTU2RmcWNIUHFNUnRydVhVMTFFRkhkcjlkR3hRRDF3WDdUcm5zNkZpYzhU?=
 =?utf-8?B?MStEa1g1K2EyeW55MWJ6MXVUK25CN3l5YVJwZHZzdFBPVWpoc2ZjcmJyeGhi?=
 =?utf-8?B?WDF6TUFVcEVHWC9hVERpZHZ0dFM2dGJJdXF3UTM0cTlGdmcyRzhxNnU3bUll?=
 =?utf-8?B?cklYM3RSMC9OaGp5U0lCV0FjZnhzenlvaG5kWXE4ckg5Qm14SUd1djMrZ2hH?=
 =?utf-8?B?QUpXZGdWVWM0aXREQ09pR3RyRzJwR29GL1Jkbzk0aUZ6RnN6RFZIa3V0Q1Jm?=
 =?utf-8?B?T3BVemZWTXVJdmpjN2N2RW1UcVplSDZtYTJWaUtBYmpqSk55cHFITE9KdDI5?=
 =?utf-8?B?ZHVuWWJyZlY1L2RPSEdreUdDTTA4Q2dMd3VDWTZMQllFaENuVkZTb3p6ZjR2?=
 =?utf-8?B?YkZJS1g1Vk04NjBhaHYwVlZ1c1RNYW9FWkx5QmlPWmk4YlZGME05V3ZrUHlp?=
 =?utf-8?B?d0I5eE5RazhVZEZxNExiV0RVSy9KV2pMR0c3dFloZks2bWdod3dvNUxFRlRF?=
 =?utf-8?B?eGI5LzJRMVZrRGM0Wm1MVXFGcHQ5WnZrZmV4d3pScEprMDhkdmpPUlJyWWx0?=
 =?utf-8?B?MjhlRm9rWmdzdmo2OStTUTJocno0aUh1R3RvemErV1l4S0NHV2NmdSt0aEpK?=
 =?utf-8?B?RG05R21pRUFZY1J0aTVyVGJGa3pxZmdiYm54TCtvL1kzclg1NVFPOVJHUFdN?=
 =?utf-8?B?Ulh2Mys0bEFyMVpKcGhmL3hRdFNJV0V1d1VnV1RYQlRyanFNRVUwK3ZoR0hn?=
 =?utf-8?B?bHFiRDNQR2YyUlRiQk9tMG9tMVdkOTIvTWFrMDNiZ2ZOSEJUR2VNQTV5eGQv?=
 =?utf-8?B?UmdaSG4yVzFWaVpDVk4rSU5yWkp4amtmQkxTMmtDd2Q3N3ZsRjBjdzZpVmdt?=
 =?utf-8?Q?HmJwbxL0zM3seoq9zRPZN14VQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a38aa69-8167-4324-5745-08ddf98a156f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 03:42:41.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DTALD8C1sKvv7S62ZRsuJ/dthzTff0+yt4sy9l1gXqAGT57sd3NzJFKLlaRyNzT2xFSw9mvSlNLR504muNWnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10263
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

On 09/19/2025, Frank Li wrote:
> On Fri, Jul 04, 2025 at 05:03:54PM +0800, Liu Ying wrote:
>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
>> It fetches display data, transforms it to linear format and stores it
>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
>> driver to support the DPRC.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 499 +++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>>  8 files changed, 556 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
>> index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
>> --- a/drivers/gpu/drm/imx/dc/Kconfig
>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> 
> ...
> 
>> +		return false;
>> +
>> +	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static int dc_dprc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct resource *res;
>> +	void __iomem *base;
>> +	struct dc_dprc *dprc;
>> +	int ret, wrap_irq;
> 
> If have new version, try keep reverse christmas tree order for nice look.

Ack.

> 
>> +
>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
>> +	if (!dprc)
>> +		return -ENOMEM;
>> +
>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
>> +
>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
>> +	if (IS_ERR(dprc->reg))
>> +		return PTR_ERR(dprc->reg);
>> +
>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
>> +	if (wrap_irq < 0)
>> +		return -ENODEV;
>> +
>> +	dprc->clk_apb = devm_clk_get(dev, "apb");
>> +	if (IS_ERR(dprc->clk_apb))
>> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_apb),
>> +				     "failed to get APB clock\n");
>> +
>> +	dprc->clk_b = devm_clk_get(dev, "b");
>> +	if (IS_ERR(dprc->clk_b))
>> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_b),
>> +				     "failed to get B clock\n");
>> +
>> +	dprc->clk_rtram = devm_clk_get(dev, "rtram");
>> +	if (IS_ERR(dprc->clk_rtram))
>> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_rtram),
>> +				     "failed to get RTRAM clock\n");
> 
> use clk bulk API will simple clock handlers code, include suspend/resume
> codes.

Ack.

> 
> Frank
>> +
>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
>> +	if (!dprc->prg)
>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>> +				     "failed to lookup PRG\n");
>> +
>> +	dc_prg_set_dprc(dprc->prg, dprc);
>> +
>> +	dprc->dev = dev;
>> +	spin_lock_init(&dprc->lock);
>> +
>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
>> +			       IRQF_SHARED, dev_name(dev), dprc);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
>> +			wrap_irq, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(dev, dprc);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int dc_dprc_runtime_suspend(struct device *dev)
>> +{
>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(dprc->clk_rtram);
>> +	clk_disable_unprepare(dprc->clk_b);
>> +	clk_disable_unprepare(dprc->clk_apb);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dc_dprc_runtime_resume(struct device *dev)
>> +{
>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(dprc->clk_apb);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable APB clock: %d\n", ret);
>> +		goto err1;
>> +	}
>> +
>> +	ret = clk_prepare_enable(dprc->clk_b);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable B clock: %d\n", ret);
>> +		goto err2;
>> +	}
>> +
>> +	ret = clk_prepare_enable(dprc->clk_rtram);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable RTRAM clock: %d\n", ret);
>> +		goto err3;
>> +	}
>> +
>> +	dc_dprc_reset(dprc);
>> +
>> +	/* disable all control IRQs and enable all error IRQs */
>> +	guard(spinlock_irqsave)(&dprc->lock);
>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
>> +
>> +	return 0;
>> +err3:
>> +	clk_disable_unprepare(dprc->clk_b);
>> +err2:
>> +	clk_disable_unprepare(dprc->clk_apb);
>> +err1:
>> +	return ret;
>> +}
>> +
>> +static const struct dev_pm_ops dc_dprc_pm_ops = {
>> +	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id dc_dprc_dt_ids[] = {
>> +	{ .compatible = "fsl,imx8qxp-dpr-channel", },
>> +	{ /* sentinel */ }
>> +};
>> +
>> +struct platform_driver dc_dprc_driver = {
>> +	.probe = dc_dprc_probe,
>> +	.driver = {
>> +		.name = "imx8-dc-dpr-channel",
>> +		.suppress_bind_attrs = true,
>> +		.of_match_table = dc_dprc_dt_ids,
>> +		.pm = pm_ptr(&dc_dprc_pm_ops),
>> +	},
>> +};
>> diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#ifndef __DC_DPRC_H__
>> +#define __DC_DPRC_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_fourcc.h>
>> +
>> +struct dc_dprc;
>> +
>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
>> +		       unsigned int width, unsigned int height,
>> +		       unsigned int stride,
>> +		       const struct drm_format_info *format,
>> +		       dma_addr_t baddr, bool start);
>> +
>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
>> +
>> +void dc_dprc_disable(struct dc_dprc *dprc);
>> +
>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
>> +
>> +bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
>> +
>> +bool dc_dprc_stride_supported(struct dc_dprc *dprc,
>> +			      unsigned int stride, unsigned int width,
>> +			      const struct drm_format_info *format,
>> +			      dma_addr_t baddr);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
>> index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
>> @@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
>>  static struct platform_driver * const dc_drivers[] = {
>>  	&dc_cf_driver,
>>  	&dc_de_driver,
>> +	&dc_dprc_driver,
>>  	&dc_ed_driver,
>>  	&dc_fg_driver,
>>  	&dc_fl_driver,
>> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
>> index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
>> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
>> @@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
>>
>>  extern struct platform_driver dc_cf_driver;
>>  extern struct platform_driver dc_de_driver;
>> +extern struct platform_driver dc_dprc_driver;
>>  extern struct platform_driver dc_ed_driver;
>>  extern struct platform_driver dc_fg_driver;
>>  extern struct platform_driver dc_fl_driver;
>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
>> index 9a1a312c0aeebf47bcf50ffa77971aa3bb431a12..bb6c47133e90f9bc5eb3fb0e30c3f338ec82213b 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-prg.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regmap.h>
>>
>> +#include "dc-dprc.h"
>>  #include "dc-prg.h"
>>
>>  #define SET			0x4
>> @@ -63,6 +64,7 @@ struct dc_prg {
>>  	struct list_head list;
>>  	struct clk *clk_apb;
>>  	struct clk *clk_rtram;
>> +	struct dc_dprc *dprc;
>>  };
>>
>>  static DEFINE_MUTEX(dc_prg_list_mutex);
>> @@ -217,6 +219,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
>>  	return NULL;
>>  }
>>
>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
>> +{
>> +	prg->dprc = dprc;
>> +}
>> +
>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
>> +{
>> +	return prg->dprc;
>> +}
>> +
>>  static int dc_prg_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>>  struct dc_prg *
>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>>
>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
>> +
>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
>> +
>>  #endif
>>
>> --
>> 2.34.1
>>


-- 
Regards,
Liu Ying
