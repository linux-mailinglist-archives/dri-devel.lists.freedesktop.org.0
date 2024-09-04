Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378E96B692
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66610E1ED;
	Wed,  4 Sep 2024 09:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MJcxxs/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E14E10E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4+UaDBDfzJuUOhTw0XpRYHFUPwAN75GRf/Uz1WJE0/hfFZi0ZO2dVB30rX8bNSp9OTkWX4o6pX2RUOu98WxNErWSvkIgki0NK/rFLKCjrfMoqK2aSA+DdYn1PQEtvbekG4MyLCbqRsPsGB0czVR3ZzIFoQv1Ahp8DhwcrR5VLepocGx72mKF8flCV1h4lwUHF4BzZWgztmqxDkbIG7hxHi8DXtHhbZ+dQSnekqgS2flJ72JXX/25E0gCrFaM+BTfniwUbXU+QShKti+O9SgiYC2wLdaViup98B3UQNSiph0rpanVkBXn338M+bedq365usqzE1KLiT0D7sfPCXKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0pG6mVmbOtT2QHpTIG1Qb/ZAty45Ssbzumhc6M7Qbg=;
 b=KD6vt2Eqsp2l98cASkqBg9Eneuft00RM/gwjE+UC3f7+2j131t4eZEAFMKi5AbqF93nsfmgaOPTS/Ky+A62dJjvO63YIOkbBmZN88H9eOKjrH+hoWwJaf1DKpye+OsoUvU3D2Le0XxDMpCdMvEuG1HzcJ4qaUw4kXQaFHGSr9cW/tZb3BArZywwN4IneppB1+RxxoZtX6bFVVDuzW7WgMiNbQLAMd0zWYoqMkie1mag/Mpp5+fjdTTZ6ctsZjQXx/wMjjT/KaC6FSfpRIEX5w7PG2oMHgCjEc972vH19LFBr57FOzDx3ii4IncjwDSymRZlZAIcl9h+H9ACbRTfTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0pG6mVmbOtT2QHpTIG1Qb/ZAty45Ssbzumhc6M7Qbg=;
 b=MJcxxs/jKKI26BkmHon3Vl1l0yFP2p8H6Hwdq6X/pjk3gfrizZVlaWLVyJQ/GYIXg4DI1g+tavdKO48tt4ry/E6pMmun1vghVDJp2cXHYVZMtIsog2ie+muJKIP4t1IBgapHOPZlEJlxkLkQsxqBBvUh9Ksa6sICZTZHJzXPBJ780ird8efdvEW8Zxny550q4Vy82D9pMg6V7Wnv3Qsr1TfZZpvfJ2f7TZ5VQQFkO+MeG8Epwiad3blNJ9aFdwwKQb2X0x7NMnujWayMvCjHLxBz90dbU9NnRc4rm4BydDv9Hc+HOKmHjZDzwDoSpkK3jjPG4/BzPSE6Bq+AdTtTfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 09:26:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:26:40 +0000
Message-ID: <9d3abe39-7647-4d01-84af-2792388c0fc6@nxp.com>
Date: Wed, 4 Sep 2024 17:27:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imx/ipuv3: ipuv3-plane: Round up plane width for
 IPUV3_CHANNEL_MEM_DC_SYNC
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Paul Pu <hui.pu@gehealthcare.com>, p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 HuanWang@gehealthcare.com, taowang@gehealthcare.com,
 sebastian.reichel@collabora.com, ian.ray@gehealthcare.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <20240904075417.53-1-hui.pu@gehealthcare.com>
 <918336db-3c3e-4b5e-a9c8-096c9290f9d1@nxp.com>
 <2024090442-handrail-backwash-1493@gregkh>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <2024090442-handrail-backwash-1493@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 439e1c43-98aa-4ea8-de73-08dcccc3ae8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umw0Y3dQNSsybUhYRjdGMS9JWEhuMVRzRHFWYUF2K1VGZVJicHNheURCNzlZ?=
 =?utf-8?B?c3RhK25rcXMvYzRiaTF0eFQ0VnNJU3hqOTdtTDBMZklETTBUR2dxOXRFN0Vs?=
 =?utf-8?B?WWVwOWFNWkZGWHRHRTh5TExCNHZUZDI3RDQwdzJDSnVKVTQwRVFWRHRVN3dv?=
 =?utf-8?B?K1JneXVrSm5SN25yMjNMVGY0Nmo4MUgxMUw3MmEwUzYwODk0a2k2Y2x0L01s?=
 =?utf-8?B?OFdtdnUzdWJkRmREZDlpc3Nua0xzTitLOThKYk9ibnhMRjBBSkcrUFdZSHZ5?=
 =?utf-8?B?TFRiT1dlbGpEeUUrWFpVUlErL2VyS1NMU2JUbWJnckRzeXFSYU9IRWowVFF4?=
 =?utf-8?B?dTJtbmdFOXdHNDlQVXEzUk5nNDdab0M3ci9kUk1tVW5xODdhYkd1aTJQWXha?=
 =?utf-8?B?VnJjTVdCODkyeVdmNVZ4bjRvNHYwN1dFa3BjTDJObk5uWkF3RURTcUF6Yy9v?=
 =?utf-8?B?K25jRE0zMTZNVU9NbGt4UHJzZk9tTlRtQ0dEWDROMnNhRTkzZWZTYm5NL1l5?=
 =?utf-8?B?aGJhVEVkNnNqTXhoQmhSUUZHL1pReDJQZDhiSmNlUjIwUnp6VU81eTc5MTNH?=
 =?utf-8?B?RVplTEx5ckd2RldDeDRXQkpTaDZPNWlleFN4Q2dtd2FJcWMrbGhwY0pkOGpB?=
 =?utf-8?B?a1VzdTc0dGZjN2hXOUFYcDNGVXFOZGZKcVIxMnZoNy9sRnNGK3gxK05COW9S?=
 =?utf-8?B?UU1kcndOKzJRbVNuTndDTmI3MG5ZSXNFTlRCOHA2MUJoNEc5WDE3ZjZNeER3?=
 =?utf-8?B?a3FaY0Vwam9vOURycU45Z0R0bHlFV2hOU3hCSVk3Y0NQSXMvWnBYdGp2bHc0?=
 =?utf-8?B?NE1RREkzd0ZNS1pXV1pqU0VqTVNoQldMSU1Gc1JUUVpyWUw4QnZRWVAzRGNO?=
 =?utf-8?B?Qys1STcwa2ptZUltOFFHdmRWTmFHZms4ZXBPaUNXS2tyd3NpSnNUUldscFZO?=
 =?utf-8?B?eFpYQU56WXpoWW9tbnB1RzgwZ0xZVlVMQmNORnh0SGhHOE9reXpYNVVEUFJK?=
 =?utf-8?B?SDczZjNqend0ZkRCSlJKVUlJeUd2bDFZWkdHR2U5d1BtcW1YUzZwcXRzVmVX?=
 =?utf-8?B?dDBxTThTWWxXdTdUeTRybWluVXFxM2dhcGNNSzNiOHBRSDBndndiY3VtT2Vz?=
 =?utf-8?B?Qjl4cUZsOUE1SnI5clNIbWZWT3I0azgyWEoxVHNGNHNuUEF3TkhuUmtWdG9P?=
 =?utf-8?B?NDhFNFI1UDlZTjJWbU5NK2lrWCtQRFpxaWNRYXVYN2pnbEVaakJwRDM3Slpj?=
 =?utf-8?B?T1BvMytaR01WemU1OE9ITk1JZmptMDA2bUpLTG9zcGkzcVN5ZVI1MTdFOUpi?=
 =?utf-8?B?RlJzTHdlNzBQeDZmYTJ4alMrdVNWZ29DV3ZiamowTVBVekR0Uy91aGVUU2E2?=
 =?utf-8?B?Mzk3MnJiNHVIZjNBanpOYk5Cdmx4clYxczNHOGRiNFNoSU9MeHREdjl4OGtS?=
 =?utf-8?B?N05SZEFLN1hwb2V3NVBFM2liMng4bXFUb1ZQakRSeXNQMElvRW1BelQzTUwz?=
 =?utf-8?B?QTErUHRqSVowQnRIbmZFcnhLSUxmMmdXVlBIVmo3NldqZytjQzRiV1dEYUxM?=
 =?utf-8?B?aWQxdHFSWWVraUN0RTJyZSsvQXI5SUR5TDZGK0lNWHNkWURNT3UzQS92Z0Jl?=
 =?utf-8?B?SmhBZHhVMVFad3Eyc0ZxTWJJK2xwUURYZ0dzU3R6R0lyVjRPdm5GdXVTQlRZ?=
 =?utf-8?B?TXJjYi82bnJvamNJa01iS2JnNUduM05xUDRNOFJBM1FNN2tobE9DRjgrd3o3?=
 =?utf-8?B?YVRmNU1XYnlCV2cvcmZpdVBwb2txbEQ0RFBJdDhNYTYwaWl5NnltbytzdldC?=
 =?utf-8?B?aEl2K0t3bmxYSVovTng2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBtZFdDaTBQUitHQXF5T1JKa1owV1NMNHROMzArb0tZMjdSZytxTjdidHlD?=
 =?utf-8?B?MzhhcUFqL0IyeHppNmd1QjJJSzlIZjg4K0gzUy9DV1p0MHJISVJCWGtZRFlV?=
 =?utf-8?B?Y2JMRjdzWkZpV2QwSlN6aUdFSm1ZU1J2K1IzMStJM3NEeG1peGNQeWhoamRD?=
 =?utf-8?B?STk1eW5ydytodVd5QS9YV3cyRGJUSzF1NUJjaC9XMjdhdk1SejIvOHZpWkNO?=
 =?utf-8?B?S1BVaTJQdGtlQVVuaXYveW5NK2FFdjBoeG5aTERKcCs0a2dvejFRMmJpcGxD?=
 =?utf-8?B?TmNrQlk1QmFzaFE5bDJXUlNzb0czMk0xZ3JrUVhWTTZpZG8xVGhFS1FFZHNU?=
 =?utf-8?B?WGIrYm5VSms3VlBYeTZiN1VPOGU4K05iRSt2cWVacWVRN1JwMnVSRHo1UWFt?=
 =?utf-8?B?cnVRNHpOQ2lML0FNYkR5UkpHQVpXN3o1TWtUK2tybTNvS29td2lNcDdmd2xJ?=
 =?utf-8?B?czhWQ0NuTTFCYXEzMHhNNHcrN2dRMnRHMk5LN0VjL3RzaC9pWmc0RWtVcWJm?=
 =?utf-8?B?TVFUL2dXSHJ3L3hybyt5bGNXOEFoS3FrM2VQdFd0RC9oV0xSQTh4VGorY3Fh?=
 =?utf-8?B?K3hKd2NPYlFDRGJhdEVmb3ErNjVnOUM0OVQrVG05RmYxd1NCcTI4bEN0a2lz?=
 =?utf-8?B?R2lYZnFDeWtwZzcweHA3RjhTSThGZEIySm8xSU5ubXJ2WlhySTlCeWtwOCt6?=
 =?utf-8?B?R3dXTHMrVDVQQUpIQmRKR1pLcXoxc3FIMHdtcTFlZnprTkdoWjVVSitVMGtR?=
 =?utf-8?B?bHVaKzNpSzhiRVFXMEsycFJxazRSbEJIeGwwQ0xmamFnNlUwWFdTYmZBNDZQ?=
 =?utf-8?B?SzhuVEtsdkxEOGdGemExNnVQK3VOOHAvUk9rV0JTNkJRTTFQVXFzRFpVbXpC?=
 =?utf-8?B?aDdJY29HN3FIQmRCbndhMlpTUjF3dTNjakFWcFNKVzRmcFRoS29aaG5VM3N1?=
 =?utf-8?B?aHFhdjdjMTFpekI5WGF3TjVmbGdRaDc1a3IxeHdEd3NXUFhoTGVXcWtubzB2?=
 =?utf-8?B?Y3dFS2ltNHg4dTMveEpyYjMyZlJhNjlRM0dtV1ByM1VQcWQxTDg1clAvcndC?=
 =?utf-8?B?R0VXZ3pTdkc3V3VjUEZqUVpjU0l1eEdXMDc2WHp5VzVnV1l6ZHRjZmNHLzYy?=
 =?utf-8?B?NUs1V00wVlFEd05GK1ZQY2dVK0M1am9QVWw4elliTzNlQk43YXllREF5KzBa?=
 =?utf-8?B?cmRjT2d5ckp6K245ZjNNNXVOQ1hIMFVNd1A1ZTRmdytOb1ZZUzBnQklsbVM5?=
 =?utf-8?B?M0JFVC9kQzAyK3lvL2tpallQMWlvM3VQRm9DbU01OEwxK1YwelJCbWl3NHBE?=
 =?utf-8?B?cVNmMHpjenRuZDRCT3laZ1NxcWdtWG1Oc3R2VVRpUDZXN0tiZTZmQnlMbHFY?=
 =?utf-8?B?SERWS0Y1dzMwREl4Qzh2SGZ1enhpeWdKeld0Ry9OMzVPcWdPWElCRkNEeXIr?=
 =?utf-8?B?K2ZycXlTeGdRR2VGRTh3aEZEMEtOdW1sTTVkQlZObDJRRnhtWTEvOVpGQ3dB?=
 =?utf-8?B?eVhLUVZHVzh3YklvQSt2QzkvMWduREp4bmFHNVBNeENaVmUzekJNcmZDL29a?=
 =?utf-8?B?VWc0K0dXeHl2eks5em5RS295RnJmQ2gyOXBXUkxqSHNZNmpRa0NPOEwrTEFI?=
 =?utf-8?B?SGxTTzdZZDZTOFJ1S1RiczNLQS9qeUxXWnBIRUNxbktxMmtnajUvQ05wZ3pq?=
 =?utf-8?B?ZDBlRUdkcHNJTDFrVnhWZ0x3QzEvdVRuNlJDWXlleDVERlpodFd4TUhYMTRJ?=
 =?utf-8?B?ZmwxRjh0cEJORmh0cjZwWlZiaDFTMUxwOCtBMXBRNjFlMEQyNDhnNXBzeERC?=
 =?utf-8?B?am9naGc1QUNQUmZOYm1rYlN6QlQxRHhBTEJvSERHMkJOSTlEbzdTTUl4aVhC?=
 =?utf-8?B?dGRoU3RaRENRbG1MY0wrVHdCMVZqRnZqUVhRMXRocGJSTHlHYUdIWHZwakwv?=
 =?utf-8?B?SnZpOGtUdGFsQ1lUR3hVWUpUOGQ3K1pqbzRTZHhEbTJyWldKZ1VyRDRINSts?=
 =?utf-8?B?Vit5RmJ6N3dLZWdHejFsYnpOczJ6U29UcHBNN2xoMzZKTzNVdmN3VDYwaEY3?=
 =?utf-8?B?WExwWUVEV2tLZE1MWWhFMEsxRE1uN2RhTDZjbGdoWWhvTmQremJBSCtpaGpK?=
 =?utf-8?Q?YABAcUm6YmsIX+neXw2rUmE9n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439e1c43-98aa-4ea8-de73-08dcccc3ae8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 09:26:40.2245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb5h1bbYKZ77SsNk3JIeULDkTU5yf0kaaUEo+l2A8LC4ZCJeXyDHC/AwELMl5xxb+apmUIYcH+CzfgY9SGVKQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944
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

On 09/04/2024, Greg KH wrote:
> On Wed, Sep 04, 2024 at 04:48:51PM +0800, Liu Ying wrote:
>> On 09/04/2024, Paul Pu wrote:
>>> Cc: stable@vger.kernel.org # 5.15+
>>
>> Why 5.15+ ?
> 
> Because the commit referenced in Fixes: was backported there.

Sorry, really?  It doesn't seem to be backported.

> 
> If you want to be picky, just drop the "# 5.15+" and our tools will rely
> on the Fixes: tag and everyone will be happy.

Great, thanks for pointing this out.

With the "# 5.15+" dropped,
Acked-by: Liu Ying <victor.liu@nxp.com>

> 
> thanks,
> 
> greg k-h

-- 
Regards,
Liu Ying

