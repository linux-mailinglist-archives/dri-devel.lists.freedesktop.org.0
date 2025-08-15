Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3339B276E8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2843E10E134;
	Fri, 15 Aug 2025 03:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JiJmgiJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7210E134
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK8/Nmm+3CYxqLejIOfHnepJDLjjlHTTl+5HhEPam2kgOJxd9GG728AkyQE33ABRM/2KS5beIveS/FZzkj8x4Io/f6LZGfPqBfLuaxViJLr2BRdUCxQnIQ0laqxsxzRXJJLChL1tmBSQqM7Dz72T5jRENCchZQ9dB/RjuMmWCQXB3jC2GX1Hg4m2hP+atMcyovYUOOHUu5IXltcOomnOHq1tBa4TjsCR3IfAgx/W7UL3Gwpwp0G97Rrw3A0XCnYmNHf1vqC03eAwkEigKJzX70Ympo68dTDzKQyEyHSR3sG4uCzEElYk1bBVDBsvNeLwRjYlk8N4R+UseLj6iTtTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vV0N8UPqpEf/SfyUcV88qmehZc/FWVM6TOVeFaeBWo=;
 b=SqdLHvjq9TJ7/KCsvVfRC8lBtdpVXfLL/1ff0o6Z84MDSw6nbWqu9WkKpbi6xtCdB0OpDSmwPFk/WxHUhUyM4OypPuBEeZ1vHYB/jF+ATaYY/Z3JXF/uxkTLX1o1TyDTPEGn0rAQWp6jUFxCRkC253QTVz8dvFvRsW3RunMwG8ohYgmy9ibEmDT8DO22JfeeWPt7u/TFstkRss4mSpRGMkGRAnAFI1q1GIUrbCMYlbCLRei7DD26dUpBf+dD1Xhz+kFzS/N+FmRt46M2nTa3iqYi78kEFyRmvJBbIoFabs9CcOWHf62uJ0Zduj6gDvOYcTIGjtlICwVn/eW3WJA/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vV0N8UPqpEf/SfyUcV88qmehZc/FWVM6TOVeFaeBWo=;
 b=JiJmgiJx7WId+QnwiPCeFWN9rv9jwXZ2e23k21V+JbTyCh7fYiVkocwnDY1U+gWDJneRVf1KSqUwU8hp1MsdYudq/pFmN/SydhWYtdbJITE4qyfTsjtdsg6jFbrVEsLC2AfwMqZXrTRy/Mhlhn5XLpdJ1yXoCjweTBcfR5Fge0HOr8b3vEk7QyLEaOyvfAdD0L/rG55zgtpMjW8NPm9ZUWMlUr4BIK+DnPiXCWoJTua2XldBNWCfzk50YSZTx1KR8jSQzpcqjCQEiPVFrubMMJSr0ogTGW/VMYD8th0xTogN6GRM74GUY5yVc10bMso4tB9BoWKLE3fNkxcgtYyrjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB11435.eurprd04.prod.outlook.com (2603:10a6:10:5ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 03:41:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.006; Fri, 15 Aug 2025
 03:41:11 +0000
Message-ID: <980a05f3-42dc-4767-82be-42f181e9ae8e@nxp.com>
Date: Fri, 15 Aug 2025 11:42:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com
References: <20250806095224.527938-1-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250806095224.527938-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB11435:EE_
X-MS-Office365-Filtering-Correlation-Id: 71214515-ba06-444a-5c69-08dddbad9391
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|19092799006|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTh0T2RYdnlFNnNPUlozMnAxOUQ3elZMV3p5R2doUzlIKzRYeFQwNVRWeWJ6?=
 =?utf-8?B?TnlzZk9UdjFuR2svTElVWHpERXZEU25aa0Q1SUErYklITEdKeXgxdW9sQS9K?=
 =?utf-8?B?bXFURzY1R1R1b3l4dC9CUnpoLzRjUUQwbTNBMFlObzk5RWdpOTd5RTQ0bkxX?=
 =?utf-8?B?bGt6N3kyd2RHSExxbXArTUt4YzhFYVNPNS9hUk1lSDBackJkcFdZcTJwRHl1?=
 =?utf-8?B?Ri9ma2JNR05ZSEpDZnBHa1puVzBGK2tGUDJ4NS9jVGk3QlBiTy9sOEMyZGVF?=
 =?utf-8?B?NHJ5M0h2VjA0ZWt1OXJzd21URFU3WlNjblBVT01NdmpySVhUSlVDTVB1QmR5?=
 =?utf-8?B?L1d6UStUVTd1NG5NSDNyMjdNeE54UWFHSUlXYm1qRmUxdHhXWXVweXI4NlBC?=
 =?utf-8?B?em9GZ01KSUdUOW4yTjNIS3FjWE5HMy9lZ3RzTTB5enRncVUyazNqTDdDMkVm?=
 =?utf-8?B?K050Q2ZSNmZnTHphWWIrRHREUVNXTEpxV3JCZUYvY2Y3aGdGbG1ON1ZKYSs0?=
 =?utf-8?B?SHpKWTc5TU1aZGV1OWRPV3pVUy9qcDIxOWdGZmF3OHFrbGtLTE0xUkRObWZR?=
 =?utf-8?B?SHg3MUpYdy9ZOUFydWFrZ01jNnAxMnRrc1pLNUxZVEtGSExTYURiQ3RIVUdu?=
 =?utf-8?B?QUlpcDUrcGRuY2dXUjNZdGR2aEo1VDdlVFcyLy9oN1VwT0duNnZIclpDeWI4?=
 =?utf-8?B?QTdldFExWGw5TkQ2V0JLdFdoS1BxcE93QVZxR3VQRjhVckcyNFlGSktyRVpK?=
 =?utf-8?B?K0ZwbjhDSXF0akxuK3lrM3F0SUNQUzNBejU4dGFCYUVKc0hJUHRGdmE2eC9s?=
 =?utf-8?B?SVo3QmRBazJKTXV2WlpKZC9HUHhRWllFWEhSMnE1OHZYdTNYTHcxTStQS1lh?=
 =?utf-8?B?ZElkdE03SEo1aExUREkwM05XWE45aEtmaGgwT25KZXNIa1B0clQ1SDEwdTdn?=
 =?utf-8?B?aDNIYmxQdjdKdnRrYXJWcHEwT1pnbHN3WnV5elo3YkZ2TDd4aTN3bzU2M1BY?=
 =?utf-8?B?OU5vUmtsMUtKWUU5NElrbmpQL3lEa1NMcThZamw3NkRJN01weTMvVHduNVZJ?=
 =?utf-8?B?VDNra2JXR2V5UzRWQWV0aHRpcTgxQUJtYW1nWlpmK0F6aDBoaGRYaG5CR2Ny?=
 =?utf-8?B?T0UrR3h5Ti93TGVIaU9kei9JWGxqTnFtTGpoNXBnQTRzOXkrSXVOem4zNVdY?=
 =?utf-8?B?ZlgxckIvQU1PeDlyWFNxVHRUbE93dUh4ekZsbmp2Wi9SOGxYbUZpOEorWVN2?=
 =?utf-8?B?eWJuZnlpbklTVUd4dWNLOWYzZG4rNjBFMFpTS1pLb052WmtvazBERUZReVF1?=
 =?utf-8?B?M1VtT3V0TEphdEhva3hyVk15Y2xsK3hKZ1kvNUptYnlHMWRSY0ZiK3hPRU9I?=
 =?utf-8?B?Nkt4Z09uTkxBWk42UnlRL0R5M09SRk5aWEYxL1dwWDFOak9GNTF0b1RMWjZq?=
 =?utf-8?B?NkhCOVhvQ084amU2U0V3bFZQUnlIcEdXNDZFNHJON0ZuTUVYWmR6RHEzeHNO?=
 =?utf-8?B?Ui9RUDl4eEI5ZExaYmVZQjZ0aE1oTnZhdnBaNjVaNGlBSHRlM2U1QnVsMjZ6?=
 =?utf-8?B?d3NzOFhWZTU2aTU2blVMSEZhd3JTYk1Fa1puTmIzS0FVb3N6OGZFUGZsVFgr?=
 =?utf-8?B?VU9keW9JNkI2aEJpeHEzOWluRExKTnVQMituSDloRG92YldZWkpsZnFCUmtR?=
 =?utf-8?B?UUdiWFRsMG1YZUp3MWpYdk5LdnlseVI2UEhNdXZpdDNkM3RaSi9rNHBQMFpt?=
 =?utf-8?B?WmRHMUpuUGI2K1l0Y05KWWx0czdrakRNdk82K1NJNmtLaUhLbXFMdHJQVmRC?=
 =?utf-8?B?YTRjWkQ2d1ZJa1FZN0JOa2JibjgwTTdNNW8rY29RdXZqNGpJM0NPNXlEMGdB?=
 =?utf-8?B?TXFYR2pSU0NuVTRBa2NqUHlIcytacUx5MDBNVnY4VnN6dnphamFacGMvc0Fn?=
 =?utf-8?Q?sdzvTE6R2hw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpmQ0hUYUZXalJEdkZaL2gvcFBoVVdVeGVtWG50RmcvMWlWZ0liNzdaZXBh?=
 =?utf-8?B?SWtTVEhhc1NjTm9ZdDZBL3B4LytBMUFSNyszNTRWenNrcG9VU2pMV25xdlo3?=
 =?utf-8?B?NzF6bmNRT094RVlxaW1XckIzZUg1M2xxZE5MRnhIejdKekVXQ0R1SnlsSFV2?=
 =?utf-8?B?Q0tyWFRlUUhlc1UvODFwb1phQ2YrNC81dTJQUWRSUllrc0xxSVNId2R3RCtL?=
 =?utf-8?B?cVpzcDR4RVFTZUo5bE9EL2kzSTdOUy9vRzkwMzB1ZmZ3K2VXTXllOTd3VEJn?=
 =?utf-8?B?bmxmSERPbUxFdks0a0NYeHdoZ3hLTmsvZFNWT3pKRms5U1BsUWpFcDVIMlZR?=
 =?utf-8?B?WnhzWkpKWEhXZ09Zb1YvOERLbE1QMlgzekhLQnNEMkwwWlVvdnlYa2g2TmU2?=
 =?utf-8?B?UlNxZnMwbE5aY25IcFlYcDZhYS9qYnpQcmpXZHN4bjlnTlRXVngvRG5Udndw?=
 =?utf-8?B?Z0E0S1pzc1dFcEo2Y0YvN0FJWU4zOWc1QnlvZzZwVno1QjlZaHZDWitPc25v?=
 =?utf-8?B?NXZNODdJa3pkcUlmRUxjdjhNMTBRS28xelYxdnVJdmdBblhPUnROSjVEUWg3?=
 =?utf-8?B?cFRwQ29BZ2hIVzdkVk9CNUxaYlkxWjVtSlVEMzVud3ZKYWdUcVFsc0ZPSFg3?=
 =?utf-8?B?Q2xDZGRmSVE3enBGUElQeFlZc2hTZkNINFh4N2t4NHY4empvOVdOV1ZjaDdE?=
 =?utf-8?B?MXoxZCtYU3l3QXlKeXJmKzdaMVRLcDBYeG5SQlZJWUZYSnIxdko4L1VJTTB3?=
 =?utf-8?B?eUp6NUgycVVjNGhDT0pvMllUM2YyREFuWHFaVjQ3aWt6NXRuOUNRdDA1MGJB?=
 =?utf-8?B?T1F3di9VUUhkcTVEbEZUVVgxcUZrNWpwR3dBMnptaDNtZzNnK2NubStjRDdt?=
 =?utf-8?B?R0FlRW5oY3pFZm9WMjdUT2hSeW05S092c2lybnkvQWM2UTZubExNTW9UU0w0?=
 =?utf-8?B?TWFsMjFNcVJ4OElnVlkra3QwaUFpTkQ1RmJLR3Q1alMraVI3ckkrQXM1bng5?=
 =?utf-8?B?cHQ2aHh3a3djU0g1NlJJeFlCb3IzSTJNWUFQRTJtRkZkLy9vTGUyQzF2NUh0?=
 =?utf-8?B?Y2VoT0pYNXFKQmYzbVhacG1BUmZLNVJicllMdDBNMFplV0xlLzkxaTRWOUpO?=
 =?utf-8?B?UENvbjFFYXlYSjU5bVVuZS9mV2hGNUNUQmo4Y3UwZ205MzI1dDZNc1oyRk8x?=
 =?utf-8?B?N0YzbGxJaU1TK1hEVTRRM0dJTEZXbWJLSDdYb1gzQ2F2T1VTTjgvUVJhQmFj?=
 =?utf-8?B?SHN5Y3VtU2NYeW83Q3l3L050eW1TYSt6c24yWmtZZ3JwZkNNbm15UHpzOXgr?=
 =?utf-8?B?eENCOHF6WWdIRnF5bXZ6cVA5S3NYL1d5Y2JscGljM3o4YXpOYjJ6SE1vNndH?=
 =?utf-8?B?bVRQWEhQakQ5cHRNZVIxRkpIaS80eGZYZHo5S2xHMUplK1Q3aG8zemtLamhL?=
 =?utf-8?B?VjlLbW5xOFVsN1lUVEU4QnpKMmcxMXA2R0RMbnlYSmZJQjJDQ1hvZW5vU0FP?=
 =?utf-8?B?UGx2WHAwelBMMENmQUVINFFORHJZZGVpU1dIWlBTL0kzU0huSDBVYThzbzN6?=
 =?utf-8?B?K1l5UUxxbGd0U1p6SjJnb1BKS1I4dW5SUXFTSjVZbDVmUll2dnJuWE9aMGdt?=
 =?utf-8?B?eldCUkpzK3RJdUczL2o1eXg2ZGFxUkJLcWtPVFdGS0FVZStrM1ROVDh3b3Vs?=
 =?utf-8?B?VE1WemJzcVZlSkZIbDZ0MEtEeGZLQ0dtRkJld3ptbjN1blpUeHlIVEsyVHRs?=
 =?utf-8?B?Um5RMUovNmNOQ0FSKy9hWWFtYW1VWHZpSTRlYklPRUozU1BrbHlWRjdHaWRN?=
 =?utf-8?B?NkhCa0RWZlRRSGcyVWtRQm1vZk9DTldxL1pURlNSU3VmUmJEcHp4cTJIbEVU?=
 =?utf-8?B?TDZTZ0w5ZTc3SDZVZis1dkYvQ25pMGVqSFBIVWwvaWxwZVlOaU5MSWdlR013?=
 =?utf-8?B?NWhpcTFGNndkWk9UVUhkM3ZTNzFiL0tBRjdJRnNLUmpYcUdjLzdEQzZaeHJZ?=
 =?utf-8?B?WmlqTDlrSmVFUjBnN1ZGRXBRMzhnOU1Vdm10SnA0R3loeGNzYytSL3VidDli?=
 =?utf-8?B?UDJBRVRVWnVTeHp2OFB2d3pQd0VraHVacWh3RHN1OXcyVmVMb2RGV3NOa2VF?=
 =?utf-8?Q?l+Ezc0NQDHuuSWrqNfJMPW4wX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71214515-ba06-444a-5c69-08dddbad9391
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:41:11.2371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojs2nPoBk6v5w8SNE0Am7kM+moi5bCZFPwMK3dn0705dJaOlS6f4z12vHIcXupE1pRglVFPjJCOgTh+mVQfraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11435
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

On 8/6/25 17:52, Liu Ying wrote:
> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
> NULL pointer, so use IS_ERR() to check the returned pointer.
> While at it, on failure, return ERR_CAST(dp) instead of
> ERR_PTR(-ENOMEM) in order not to depend on devm_drm_bridge_alloc()
> error code implementation.
> 
> Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> - Return ERR_CAST(dp) on failure.  (Luca)
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to misc/kernel.git (drm-misc-fixes).

-- 
Regards,
Liu Ying
