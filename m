Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB0B30C6F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 05:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4B210E1A3;
	Fri, 22 Aug 2025 03:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f/273XrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67F10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL6DR4gKQM8+3uampO7UXc+IWIQEINeUB94tUCqiUeaT5RPArEFs/cGnE+yr25AVOIEMj0FmL1XIUA0gq1cnNE3BrLEHe8EVw+KQ1dyVb7DNyEGPQe+rlTIKX32AXkzZJhyf/yJ4cLE8ZCATPr6G1qrbpdnIR54ZwlxSiAesTCRNaewdrP2yiyslVwRW8ie5V0ESD384mG/ZT/hjLtsC61AiarRXhQLZoa9dVp7tYCBP0qnuUucYFy2B+0D6vIRby6Sr9nFShpiSZeGTtjK8ybR311KIqLCOK4FMDxDehsPdmrp02yNgMMQSg6E3iGUvk/8+1pyIaeZnLA9hgkfN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa/NY6wNGXmRII34AlZzMTSevDV68lHFeV/2jJSRcGg=;
 b=J/aWUAul5eEURC4VtNpsgMJQ7TeBJ87Yv7NCQ7x3KruQIWGcClboD/mY2+SSA/4sLpwhKkkwlFL++VcpLoVZLhBb4EHFMUnl+Lzde9lWVNWc3SdMAt5K1fdLdw7jqeO4ksCPIqgsstfzjv7BDV4qHs6cM0h/o9gQMlqI1ZLVPycDTcQNub8Ge4BBEy6W15Hb0NNgUViyi4QJSJJNz41K55oBDAWbONmItlP0oTpFVkzrJPuJodbNf/ayWr2KdyzlSZDO5CwL73tAA3K2dsR1Wno6Zd2HhpIveDTGISPvYshK+1ijqtGz8mbuIaQfaeAdTUejJEZyvmbeeVoYFCKDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa/NY6wNGXmRII34AlZzMTSevDV68lHFeV/2jJSRcGg=;
 b=f/273XrPayNlP1vF0l2r+Xq96fEtngZNSGeTnusYTlQHBy5ZiOEHTrY6FbNiwyhHxPo3aXa18f58viIo51THl+L6Y/VnadU+y1DDTITbIYo4iSkPGCxst8mxXCpTQN+hPYgyJcdrgEMyO0G8AjQeNmAKTJVU44vtWthfAFxp4zdVfbqkBDi/Ero+LN8x5XnNKka8rR6Rdw3ELu7oXsKqE++Hw9PvSTivB418hsUavYoZabE0TnOsW0dSWv9ebK2k1Qs1qfai1/qqPT6T/mYTbvZtR239N/cuPhfOJvGQonLYe3YM3uKJmwjxzZvH6ia79V2JjgbQ4YAE8Ow2T0L4RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) by
 CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 03:18:42 +0000
Received: from DM4PR12MB6496.namprd12.prod.outlook.com
 ([fe80::bede:bc2a:5e14:e393]) by DM4PR12MB6496.namprd12.prod.outlook.com
 ([fe80::bede:bc2a:5e14:e393%7]) with mapi id 15.20.9009.013; Fri, 22 Aug 2025
 03:18:42 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] gpu: host1x: use dev_err_probe() in probe path
Date: Fri, 22 Aug 2025 12:18:38 +0900
Message-ID: <6346652.lOV4Wx5bFT@senjougahara>
In-Reply-To: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>
References: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To IA1PR12MB6484.namprd12.prod.outlook.com
 (2603:10b6:208:3a7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6496:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebd452f-f372-425d-3a10-08dde12a9860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekUyVGFOcS82RTQ1bFZZY2hIQk5XMWNEZlppajZSRWExN1J0RWlRb29LampM?=
 =?utf-8?B?RHlDQk9SaVVabkFuMjlMcU5zaHVVQW5iQ2ZEbGhLTXF6RWlQQ1hqaytaSTFa?=
 =?utf-8?B?ZzluMTFFUXpMVzVnbllyckJsV3VNTk1YOEZEM3BHcUg2N3FZOGNaQ0wwbTg4?=
 =?utf-8?B?NXNDdEllbC9mTThZNFdWN3RSa0luMEJNOHRoblpVK0k1RDMyUlFNOTUrcHlz?=
 =?utf-8?B?aGZtMGFmelFlQ29kM0VBT2pnUE12ZTlVM0lNbm54b1BPVC9UWHNmL2tXMGlU?=
 =?utf-8?B?VUgxMHg4QXBXS2RGVmVXSXc5ZHJRL1VGL011Z3BNd1ZNL2VXLzduN0poWVRp?=
 =?utf-8?B?dnFTdE0yVUZ3K1p3Z1o4dStPTXZUUkpSbkx0Lzd3dWh2M3lYaWhTTGh3N0lS?=
 =?utf-8?B?VlZMZFZhV3VVVEZuL0pNR0lXYU5KRVk1VzUxQnVhSlFaNWR2bVU2MHFoNERr?=
 =?utf-8?B?SXY3RVloWGxiUFh3RDZSeXhUdGc0aVA5RlZjL01CZWQvNDJyUlI0dUFpUFZm?=
 =?utf-8?B?SnpESXdrODBmQk92TGY5ajgvOFhodGlzamhDaDRKdUl4WXRrRWpzbWNyQ2xa?=
 =?utf-8?B?MXNLQnZHalNIa0lUdVZrTnc2cDh3VHp6enYzaFlrdVpzTUVYL2w3UkQ5NGJF?=
 =?utf-8?B?eUlEOXp1SkZ1eTJtL2lnQU5iTVFUdnZmVnBGM09jZ281U0gvaGFhdW5hbUE0?=
 =?utf-8?B?ZHpLOGpOaEhBTE92VTZsOTI4dUxTbkF2eHJ4VTJuOFJGM0JiTjhlTjVPU2U4?=
 =?utf-8?B?V2dEYWgwVFZOL0tkc0JkelhCZlhoT25jTUJ2ck1aNHdFMWxyWTlyV0ZWYmE5?=
 =?utf-8?B?TkVuUFJ3MnNtWW0xakZMTU5LbWM5cVBOcnZQd0ZoaEdVY1B5SGEzaVhvd25Y?=
 =?utf-8?B?VGZaTEZidGN6ZitYZ3NuRnl2L0g1aUZZSjZDSVkxKzRTT2RsdktDdDNkeVVK?=
 =?utf-8?B?VGxBeXZWemxNdXA0UG82ckl5RVFQMUV1QUk4NnN3d0VNWHRMT0VYUk1ieHlu?=
 =?utf-8?B?YjBoc2h3NXBXeHRJWmU4dmoreVdaODk5ckRjZjZpaU9wL1IyZVhhQTNGb0RE?=
 =?utf-8?B?T3dZVXUwaUk3ZFJJOXkweDNQdUcvTWI0MytrRDY3SE4vNEVoa3pLN0RoL3JY?=
 =?utf-8?B?bE5zTTQyK2lzRGhhd3l2eHJUWWYxZHhvek5UanQrcWxEWFl5RjhkSlFtNWhL?=
 =?utf-8?B?cGxNOVA4dDNxUEtoazU0WVQvSTBWQXBwODF2UGxFdnBOUjNWaHlyZHV0eGRs?=
 =?utf-8?B?V2l6dlVuckt5NEtBenlRK1hiTUxSUytBbitXT1ZUbWtQY0t4dlJoUkphdUV6?=
 =?utf-8?B?WXFtNEt3YS9XNWtJa0dPT0lCclRjOE5aZDNuNEsvSXJtT1hqVjkveHAyd2w4?=
 =?utf-8?B?a1M4VnYrMnBjSis4dng1VE9MdzN5cmlyRlFySlgwejg5UEdmbHg1bDN6WjBO?=
 =?utf-8?B?MEUrRTlsVlpXYTNoMEFyTW45NG9jendhejZhd0xIWThhVkVzNk01WGtERGVk?=
 =?utf-8?B?bmFHRExSS04rVC9TczVyc3hLQXN3bStqVURMT2dac0JDVkV0MzNyMHBSaDlX?=
 =?utf-8?B?eGhGU09QT2NTRi9ZWTQyc21tbWJCOTRpNzdGSnpkTmhDL0h6cFZGMkd1TnlY?=
 =?utf-8?B?NlFVNEV0UE9IN2VweitoeVZNajBkMm03ZEVlTFZwamdUQjJjeVFBTFJiUytl?=
 =?utf-8?B?NkYxaHZDRmJqUFF6UENuYWdEd3V2TWxSSHR5Zk1PaElMWVNnOTFNK0xyc0Ew?=
 =?utf-8?B?d3pwOE5yQWs5aDVKSUdMRjFPWGRDT1NEamhveTZNRmdUbGxuZThpZmdRV2kx?=
 =?utf-8?B?R3FxejdZSDUwYjNSbUJJU0NxRWRORnNBUUJGNWhLNmVtRlZEUmExNjNXTzBv?=
 =?utf-8?B?Rk80MiszQnJUcEVHS20vcFozWFBqeHM4Nkp4WFFIVVpyZjczMmYzZ3d1MzNH?=
 =?utf-8?Q?Ykz7k7h2h+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6496.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBwVkFQY2oyeVhWV0ZtbzM4eEVsNitwSUlZMWU4Q3ozcU9Kd0FWaEduRnNn?=
 =?utf-8?B?OE45cUFOcy9Ta2I0NUpiTDJMNjFRM2sxNVdiUjg3NDFvOEcxNDhrOWRXY0tN?=
 =?utf-8?B?eENFeEZ5KzVYbkRVamJMc21lRkU4c21Hem5JaTA1M0o0NGd6YUwwcHQxZkN6?=
 =?utf-8?B?NFVvbnZqSENrQzNIMXVDVXU3cEh0TkFrbVZubkpNcldjTHlBMGoxQVRkenlK?=
 =?utf-8?B?L0cxZXZFWkFCT2t1SGg0bFB4dGZRM0MrYzBhZW1IbVlwVTV5WUlUWWIwbEEy?=
 =?utf-8?B?WFd0TmJheFVsYVhLSnlOSEIvR2tvN0xJQVVRTTZrQnMzUko5SU44cjk3aHlG?=
 =?utf-8?B?WTlFUkt1cEF2MUxIeGVPcGE1eHp5YkxGVnVYcVM1TWRVeDUvbDdOc3I1MStx?=
 =?utf-8?B?eGRKdmVVSUVzdzhvT3BKTzdBRGZSb0FlV3hNNkNWcUpXMW5meXJsUFZHazJU?=
 =?utf-8?B?dmF1N1REYWt1WlpXTWwyL3JYY3AyNjRjRDBCaWNVeTlWajNsL2tUY0FISE1z?=
 =?utf-8?B?cUNCODJTZDRiOUtZc2c3UW5KR3Jsa1Iwb3J3cWk0RFVmSUtEaExSaEVNRjFZ?=
 =?utf-8?B?Rzd0czVZSHdFUm5TY3VJU051ZlZjWVBYaDcvaFpUcFppYkVNdWljZk1UN2g4?=
 =?utf-8?B?cmhEMHJBalBXQlkxT0UrVTRaKzFRMTlHWTNkY3FUR2g5ejQrb0s3OC9LRnJO?=
 =?utf-8?B?NXdmSVRKQ1RlSFFpNmM0RjdMZm5IdmxUU3h4U3dsLzU2MEd3cDRyZU5zMEZO?=
 =?utf-8?B?ck1EMk1rNWk0SWl1SnhmNUtFRjNxc0JtMVJhbHQvQ1FvUFY4bG5UUUw2WVp1?=
 =?utf-8?B?WXBBUmpaZUZveDlWT1JLQ1pSOS9YR2JtNG9VYmJ2eTJDRi9vQWlGb01IWHd6?=
 =?utf-8?B?WFVpNHZXZ1VDU2hoTGdrVU4yVW83UGtheDc5dHdLTHZjdVkza2NwOUxwMXJN?=
 =?utf-8?B?R0ZXL3BVNFBkeS8rbEQza2I3T09iSEk2ck1zYWdIM3k1dDN3ZE90cnViWGhF?=
 =?utf-8?B?ZEZ6R1lqUHhaTHY5bjdNSFJySDNjSWFBaE1NL1NBRVdiMjBFR09HMVRnNEZz?=
 =?utf-8?B?YXdKTFU5V29tWUE3cEVPMVlmUlZpSmZFNUJKNjR2ZGkwUlpPQ29Ubzc2Z281?=
 =?utf-8?B?SXJGWXV6N0JjNm14cE5BVnMyQ09GRUhkUXRlZ0dPWjJmeDJXSms5cXpwYVVG?=
 =?utf-8?B?ZWNoaFdleTdXcW40ak0vT05QTzFFZEJKQnM4dklWWDNramdkaTFyRVdzY1JL?=
 =?utf-8?B?b21SSDhJNk5ZUWlZdXltYlJkZUx1b2JDN01SRk04WjZzTWRDc3E3bmFFaE1x?=
 =?utf-8?B?RTkwQUlCQk12cUJFcUdzMUxKd2tvMUh4MitMVzJUR1c5bnpBbmVnaS9tTHpu?=
 =?utf-8?B?N0p1blBNc281UTNmVUhOdWczYmN2dEJsbUZMaWx6V3VNMGtERkNJUXRlN3ZO?=
 =?utf-8?B?MlZmaEZvZGIxQ2pvL0lnMHZEWXh1SnkxWGFQKzJxMjF5UU45bkVNZjM2RDd4?=
 =?utf-8?B?RytJcnVXeFAzQlRiNEZBOStQN0FrRVk5WER3c2pBajRyU0o3V3NOSnJVVEZv?=
 =?utf-8?B?Sk1uY0VXTjFrRDlBM25Vanc0MG5MMkppY3YwaUZrWnovYzZleXg3WG9QMkMz?=
 =?utf-8?B?Kzk3WHExRnNqdEpmNzc0VjJ5QXg1Zy9YSjVqa1JmNVZya0RGb1FDRndYcDNJ?=
 =?utf-8?B?Uktnek9OZHYwRnQ1dFhOUjVWOVNrN0piM2ZOSWZ6NmlJZkwwY2I2N05xRjll?=
 =?utf-8?B?SmthbVdKa0dxcCs5R0E0LzJNTzhlRE40MG8yazd6Ky9BQkVlZFJnbTl2VW5C?=
 =?utf-8?B?RHk2YXBHOTBMVlRQZ2xSb2tzeGtRbG95RFNZYmFaT2srUWJkWkZWM3Z6VTc4?=
 =?utf-8?B?VHB0eXNPYXJuVEpDUkFCQVJ6NlBJTzlhTkkrY0p3SFVyMkhFalZKRWxaNy91?=
 =?utf-8?B?ZCtDcG00MEdmZjVxdTByQ2lFZTdaRHJkRkc2WVJrc0lld09lMFN2Q2ZNenYr?=
 =?utf-8?B?SHBpZUFJRkcyNURYMzNvQTd4VWVwWmxRc1NKWEdxU1czL0tmbEg0d25vVW5s?=
 =?utf-8?B?VGUwZkE0UWZuZ2ZQS2M0eFNUa1pRbmJkOGh4YzNGdUlvSTlRU1k3S0t4VjBj?=
 =?utf-8?B?eHJ2MXFzTHhUbUgza0sxQU5oU2JyRUpnWEJjK2RhaFVYKzExSldXeWEwN3lh?=
 =?utf-8?B?TUNIZ1RVdXZBYUREbWdhQ2ZOSCtHb21sdGlpUUNLTXArVGRrMTVpVVkzY2V6?=
 =?utf-8?B?Zi9pdlo3ZmYzeEdob3dlU3I4K0FBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebd452f-f372-425d-3a10-08dde12a9860
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6484.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:18:42.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNxwipDeiJJN6hAi11kYC9RlIKfFQlI/AVLKVO4QcdiRb3fxA8hdKirKg323R95ZNLvkmk/P/icJOWb5jdMsHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
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

On Monday, July 28, 2025 9:15=E2=80=AFAM Akhilesh Patil wrote:
> Use dev_err_probe() helper as recommended by core driver model in
> drivers/base/core.c to handle deferred probe error. Improve code
> consistency and debuggability using standard helper.
>=20
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  drivers/gpu/host1x/dev.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 1f93e5e276c0..e6f3cbeb9ae5 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -587,11 +587,7 @@ static int host1x_probe(struct platform_device *pdev=
)
>  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(host->clk)) {
>  		err =3D PTR_ERR(host->clk);
> -
> -		if (err !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "failed to get clock: %d\n",=20
err);
> -
> -		return err;
> +		return dev_err_probe(&pdev->dev, err, "failed to get clock:=20
%d\n", err);

AIUI, dev_err_probe already prints err, so we don't need to repeat it in th=
e=20
message. With that, PTR_ERR(host->clk) can also be inlined into the=20
dev_err_probe call.

Cheers,
Mikko

>  	}
>=20
>  	err =3D host1x_get_resets(host);




