Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB79F3AF7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 21:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53B410E79B;
	Mon, 16 Dec 2024 20:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SGC5VK+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FB310E79B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 20:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvNHica7IxOTpimXLgoikdRTk760S18BeYtiWF1f2fawXcyy5dcVFH06C87qf6SKKFBFoi0rE8VhMlOYbMi0KzZ7a3duIzy8HlwnHGutDCKBdnd+A0ZvBKMIYgD2Y7XcJiTsxemtweJ1J96NiD4rf/2FbQCKfWbJmrPR0EMyVeSDjxZuEUwOdEil6SDoYspmxX7bMJefCmvsjLgwxdLjK679qB9GCM48Jljk6sj4ObwDXtd4sil0jSMa4QpFGoEbEHIZqzf6GRgNZJ02dltNgQIc7RGNLLWDQOvro8TSm6g9s8gnipgr3pwD3/hMWc9B7YbDSTe+IHGEjGs72lT+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDz1mifVGA8ZVqIvERai9aNE49Jv550lMZr/tHefoDE=;
 b=o9CIixOnq4RjrzftUNCmSr5yEdpSOPlZjD8ZaC3QIpLFKo486dwu4IFxW9HTXJbVQ9iMgvKxDhfpwll2GdloDYkFVxO+OZkcrO4YNG9pj8hoahBqiun0rQBnmbyXfKjoOZV566VPr6BaxeIM1AFiXfLOdzols4C/lQmtkFDCCtvNcaV/izI/5RbclyLoJGFxb49lolTVDlc8oWxXdBo0h7q39bJKxtyRo+bZUqjGhEwg6xjGaU2nUY6MFqJEE/+6miqCFO8syTG9sw4EpV82ZSLM1ICSFhD30uhHKSlMe1Fdp1BGKjnK07accBLW+vyoziCVeMG+deSdK98kbawaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDz1mifVGA8ZVqIvERai9aNE49Jv550lMZr/tHefoDE=;
 b=SGC5VK+O9ggZh/NSDfOF8TILOfLUXQw25j+BHlklxPHA+TasNOFG672VI3WAqdYBfEfsnVj6ZUFVG2KrD9IkqV8QBeYi4K+piYswQoJLdFByv50Lgd9ASzFzO/H3BRak1PuUIBkwgl0bJBrnkI3g2jtsTIYgUX0q1OG77lT6EaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 20:38:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 20:38:38 +0000
Message-ID: <050b7fac-1ebd-46a0-840e-2df8c82136ae@amd.com>
Date: Mon, 16 Dec 2024 14:38:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] accel/amdxdna: Add zero check for pad in ioctl
 input structures
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
 <20241213232933.1545388-6-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241213232933.1545388-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a8f3c6-daca-41e4-089f-08dd1e119ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TURoaWlqWnNmWWgvU0Nhb21aMHBqbm1DNjRLeFgvL1l3RWFhcFNoZXFWRG5t?=
 =?utf-8?B?SmhVRkZ2Q1NBU1Fyd3RCQmN6dlpWSkIvWEd3L3lNY0o2YktFcWNLVHdtRnZO?=
 =?utf-8?B?aDB2V09ZcWdUaWZGdFlJTGtiUWZqQjNvQklQQ0x5V1o1elduempxS3dFbGtP?=
 =?utf-8?B?V2YxaXk3a2hiZCtLSEFkNDhrTHRUUDBocy9yMDhobjNTVldGYVAyVE1PdTVC?=
 =?utf-8?B?NWt3WnIrMGFLTm4xS2RNb1pKbHRQcDhiRFZ1RUxRQ1ErWG1NQWNKc3Y1dWpz?=
 =?utf-8?B?dy9valdZNE9GdEd1Vnk1RDdkeWxaMkowMFNyTmFWL1c1T0VnYUEvcE04QUJn?=
 =?utf-8?B?MmNwbDIweVc2ckw1ZVIxclFPdERxeVhWV09mRkRvTmliV25SV0psY3hPK0Vy?=
 =?utf-8?B?bmM3bHZ6RmlkZWw5UXVZMmswZFl4NERycU93aWdCL0JjY0Q0djE1STRudEcx?=
 =?utf-8?B?QTdRY3B1WDJ3OS9HZXFJLzN5NTdPYStvdkNNVmhzTENHQmptQUMyWGZvdWRG?=
 =?utf-8?B?amtOZlJHQUJQbmlVUFVUQzdIcklZOWtlM3daRkZ6L2JscS9VSFZCZTZ1dTFR?=
 =?utf-8?B?bFdyd1Z1WUFLQzAwMDNyenE0bHB2cCtGVk1wamVEaUU3NCs1WGZzMFNONHl0?=
 =?utf-8?B?VEhUVVU1bHI5ZFdISUZrYks1OGV5TkE0ZHlrdzFKYk8yRWQwUk1FVzd4L1o5?=
 =?utf-8?B?WCtWL2x0Ukw1cGsyaTNjaEFyYnczVmlnSlI5QUdjdlZFaEdSSXcyUXp6YmNP?=
 =?utf-8?B?QjRweFo1QzBnQUcyMzR0djVoZXdKcmFXRmFCYlJYN3VGRzM3VWZjRGx2WWJW?=
 =?utf-8?B?QXlKQ1JOaXpwUEgzbTRaaW5NcmNoTDZpeGhVeXhwRTJEdVRLa0IvNUNFKzhF?=
 =?utf-8?B?d2pVWEN1OEprbTNwU0dvdS95WXBjbHpWTHphdTJocDhrNkpEWkd2MmtZOVAx?=
 =?utf-8?B?SGdiYVZnZGMva3NwTTFkaG1ZaWNIaXB2REpCK3NyRm42TWJNQnNWd2xiN242?=
 =?utf-8?B?bjgwRWNWVlQ0S1lZK0N6VFhIaE0wYWs1a2VHbWVkMkltNzRnZ2cyTURlWHBU?=
 =?utf-8?B?ZCtjekxLUmIrZFp5Q1l1YnliM1dTekw5VHAwZUZrMGp1THFyZjZWbllRWVFO?=
 =?utf-8?B?cFE3UmVJanU4U0VRTldDand2RUlGTDNKbityWG1lK01UT0lmSXlkck1OM05L?=
 =?utf-8?B?OW15SGR6QU8xZ2o0UnU1NDZmWjJrU0xZV3FvOVVYVFc1YXp5dGZXOGIwZm9x?=
 =?utf-8?B?bFRtTVU4TXpVZk9pRGNLdWoxYUlSQW9kaHJBYzl2dVFMM3JHdFhVbEVqKy8w?=
 =?utf-8?B?SHRVZU1xb2g1SkdiRVpMUXJlZjB6b0JUNDdEUjNwYzUvM3U5Rzhkcm5iU2pC?=
 =?utf-8?B?RmpFU0wzNEJFY1ZNZVVnZS9XZVJuMWZ3UlJZNXk3WFRLcHEyaUpJeE5BdmJw?=
 =?utf-8?B?ZzhWanNLWmxjR3N5MVJBb3lHdkZCKzYxdXA0QlZ4ZFJYcC9paUthN25kZ3Bn?=
 =?utf-8?B?Z2IrejVIaXp4S3YyeElmRVFuSE9sUzgycXZMVTNmS01vVnc5R1dVY3RUU3Vq?=
 =?utf-8?B?M2pMRmE1NFBqZkh6bGF0bFJOc3RZVitZOC9ZSjFiSnlzNWg4QVQ5T0RZS1lX?=
 =?utf-8?B?WVMwNWloWlJmQzBqVWo2cDIxc0tTbmdWNDJOZnQxRFZSeThjazNRUWlTQjFR?=
 =?utf-8?B?bjhyRnI0ZmNhY3A0MnNXQlYzc2t3MDllMXY0VHdzR3l0R1VvL1FMU21Zcnpy?=
 =?utf-8?B?VU5yY1pzMjF2aElMbk8wVEdORkhyZWFSbVpnTDJFWU1WYlJJWHluU2VqV25Y?=
 =?utf-8?B?OFY4QzVpYytYMHY5dnNIRmNBV3k5Q29mc0NMRU5DRG54N01XRlRQZVRrUzI5?=
 =?utf-8?Q?upbjngeiupWBc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1R2NWxZUndmWThQa2dKVHlmWm03M1pzb3BwVkFTTSt3Z24yZmJ0ZkE5Nm9j?=
 =?utf-8?B?RUQvQi9GUE42WXFaK2FWMTEvVmVqL3p3UmhhNG9oKzY3L0ovMEUwQjNoVldO?=
 =?utf-8?B?ZGRYcUk0M3pVa1VtTTd3UG9Pbm1Ud0l0L05sRm8zTEpMYmlTL1hrTkhNRTlx?=
 =?utf-8?B?aDV0Wk55VURzWjU1MVN2cEJOZUJST0dnclBqbThQNUZ3a2dwR0lYRTdyNjBP?=
 =?utf-8?B?S243VXFMcDNkYmhlTllZR2Nkd3F6NEhkVE41cEo2bis0bHF1bi8veVZpcGhO?=
 =?utf-8?B?SXF6bEp1eFdRTjNFeVo1V0srQTVZNXhGV1JQQzNJVmNBMGMzRkF1WWQydkpk?=
 =?utf-8?B?cDAyZXNrWDNPWk9MMXFvbDg1cmZWTEdzVkd3OXB3YkhrQzBveVNrUGlRbERz?=
 =?utf-8?B?dm0zR2ZsOWxYZWdwaWtrSXF1S1IydmZ1STBsZlNpOFg3cHRrNnJHcW5kZzdZ?=
 =?utf-8?B?TjZCcC9qRXdGR2hNeEJFQm9qQlB3Nnp2MlpJK2dYU0JIcmFkZFZzdjZCWWtM?=
 =?utf-8?B?NnUxRSsxYkUvMHhHb1oxbjlmZWcwSGM2K3RQamQzRXBrOVdBbm04bWkwTFNo?=
 =?utf-8?B?aWtoQzl5ZUVIQUZ4OTJjSi9ocE5jNFQyUTRnMGVSWjJ4TDl4T1pBVk1tTmpH?=
 =?utf-8?B?VzVMMlhwUTFMMURCbCt5Vk5yZ1FqRnBRM0ZxdDlsbkJ4QmttYXFWaSs2UFdu?=
 =?utf-8?B?akFJcTVzQktQZ2I5L3NQTnh2S0hVMGdGYmY4aW92SzNvRTlUY3N4dDdPR2pv?=
 =?utf-8?B?dWdmdHU0RE9zNTNkSFl5S1ZsZzgzZEZwZzRBOHhNM1AvZUtzVWFDT3M0d1hq?=
 =?utf-8?B?YTVic1haRVlBQUEybWlFM2twR1BjQXl3RWs3UTc2anFSa25LRlRXMnNka1hl?=
 =?utf-8?B?UkdXeXRZcGVlM081N0w3UmhLa3VRVUdYZWdSemJBckZsbXdseGlhNUVWOFZH?=
 =?utf-8?B?djB5Yy9saVVnOHUvVEcwVTh1MjUvbFZ3RFRURTRRdk5xK2dYVnZpVmFrNzdE?=
 =?utf-8?B?R0Vxbi96VnB2WkpTbmtTN09QalZYcE1CMUc5UlJ3THh2dGNIK1dWSUJpV203?=
 =?utf-8?B?bi9JYUJlTmhaYTJrMXdVbEdjdE9LcW9HcSt6MThUd3pXMHJyVXZUeUwzNW15?=
 =?utf-8?B?c3YrbHRvTVNyVmRkSlFxYUNuRVFHV0s2UnkyWHpQbTNSdENadDRmMnhTRVUv?=
 =?utf-8?B?QWxJZzc4bm03Y284d3ZCNVBVZnN1enUyazhyemlaZWVNeUpqVHB6RVRkcGRk?=
 =?utf-8?B?VG40ZkQ0d3ArUEtJNE5lVzZySzhCMitoYzczeWpVWXFES1dVb1FIWXV6SnUv?=
 =?utf-8?B?VEl2L0NiSTgwZFRld2M2SUltUlhpcjE0OCtYbGI4aGlSVkdlRUNjWWNCbHJv?=
 =?utf-8?B?UURsQ2lML2VNR3krbkU3T2lZUElsQ2hvbWNKUkRxNHg5SlZId3dMVG14RHpy?=
 =?utf-8?B?MTR3KzVNUFJJcHZwME01L3ducVN4b0ZQUGx6bGtGSlZKVE04M2R1ZUcyakJu?=
 =?utf-8?B?dTRsUWZ4dy94TXNWMmhhNFc5ZXl1cUI1SFZIT1A1eTkyeUdBdDY0bS9LVW0w?=
 =?utf-8?B?TkFZamlFb21YTHE3TFJwb05hZ0hXbUpjUHZybnhKcGR0aUJDR0FlY21yWUlq?=
 =?utf-8?B?MDJ0STFmYUpxd0hTVUhHQ2NJLzg5aEdYc3BhRzlWdDcvMmFPa3JhalJUcmR2?=
 =?utf-8?B?blc5eVN3NzlBc2dBVVBCMkRBU3hmbDNTbDlpdHgrRVZ1TE14WGRaalVEd0pa?=
 =?utf-8?B?czJJOTI0R1RkTm92RG5oNUVxNGVHTDJzOTFtNi9JYWx0VkpTQUloQk9nVnM4?=
 =?utf-8?B?VkxyS2FBemU5WVhoRGJZV2l5bE1SVStDYkNnSm9yWTZwcTFMcCt2a1N2bWdI?=
 =?utf-8?B?YUpyYmV5Z0lCZHVKWlhUcEVtcmxZSldXY1hnZEZYYVU4WU01UWFGSlROcjZq?=
 =?utf-8?B?bkhsRHhZK2tiVkxQN1pzaSt6c3o1SFMyb1Vnd0RMUGwyNFhyRTBIaTR6RE9O?=
 =?utf-8?B?ZjY4RTNMWGdkUFdxVzl5ZkNCbllZVHI0WE4vWDdORFZIT1FDYjNYRi9zSk85?=
 =?utf-8?B?d1NPRUhmeGR2MGpaSUVtaURCNm0ycUp4UDIwSjh1ODB3M05BNFJ2UGFkWTl5?=
 =?utf-8?Q?SBByNaF22gk6dkpU92g8t4g3M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a8f3c6-daca-41e4-089f-08dd1e119ec4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 20:38:38.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qkcc3FOuiMPKv7VuMAL9lSOqowUqLEG2xG3xZVOOAf6C5iyhBwXBTjnKUBEYvzvH2+EUO8W/jgVL087ZBZFpiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180
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

On 12/13/2024 17:29, Lizhi Hou wrote:
> For input structures, it is better to check if the pad is zero.
> Thus, the pad bytes might be usable in the future.
> 

IIRC you should pick up:
Suggested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c     |  3 +++
>   drivers/accel/amdxdna/aie2_message.c |  3 +++
>   drivers/accel/amdxdna/amdxdna_ctx.c  |  6 ++++++
>   drivers/accel/amdxdna/amdxdna_gem.c  |  2 +-
>   include/uapi/drm/amdxdna_accel.h     | 11 +++++------
>   5 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index cdeead75c6f5..9facf45818f9 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -690,6 +690,9 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	int ret;
>   
>   	XDNA_DBG(xdna, "Config %d CU to %s", config->num_cus, hwctx->name);
> +	if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
> +		return -EINVAL;
> +
>   	if (hwctx->status != HWCTX_STAT_INIT) {
>   		XDNA_ERR(xdna, "Not support re-config CU");
>   		return -EINVAL;
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index b2ca78cfd0a7..9e2c9a44f76a 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -395,6 +395,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>   	for (i = 0; i < hwctx->cus->num_cus; i++) {
>   		struct amdxdna_cu_config *cu = &hwctx->cus->cu_configs[i];
>   
> +		if (XDNA_MBZ_DBG(xdna, cu->pad, sizeof(cu->pad)))
> +			return -EINVAL;
> +
>   		gobj = drm_gem_object_lookup(hwctx->client->filp, cu->cu_bo);
>   		if (!gobj) {
>   			XDNA_ERR(xdna, "Lookup GEM object failed");
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 324f35c43f6c..d11b1c83d9c3 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -243,6 +243,9 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>   	struct amdxdna_hwctx *hwctx;
>   	int ret = 0, idx;
>   
> +	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
>   	if (!drm_dev_enter(dev, &idx))
>   		return -ENODEV;
>   
> @@ -277,6 +280,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	void *buf;
>   	u64 val;
>   
> +	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
>   	if (!xdna->dev_info->ops->hwctx_config)
>   		return -EOPNOTSUPP;
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 4dfeca306d98..606433d73236 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -552,7 +552,7 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
>   	struct drm_gem_object *gobj;
>   	int ret = 0;
>   
> -	if (args->ext || args->ext_flags)
> +	if (args->ext || args->ext_flags || args->pad)
>   		return -EINVAL;
>   
>   	gobj = drm_gem_object_lookup(filp, args->handle);
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index e4edb52bc27b..a706ead39082 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -87,7 +87,7 @@ struct amdxdna_drm_create_hwctx {
>   /**
>    * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
>    * @handle: Hardware context handle.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    */
>   struct amdxdna_drm_destroy_hwctx {
>   	__u32 handle;
> @@ -98,7 +98,7 @@ struct amdxdna_drm_destroy_hwctx {
>    * struct amdxdna_cu_config - configuration for one CU
>    * @cu_bo: CU configuration buffer bo handle.
>    * @cu_func: Function of a CU.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    */
>   struct amdxdna_cu_config {
>   	__u32 cu_bo;
> @@ -109,7 +109,7 @@ struct amdxdna_cu_config {
>   /**
>    * struct amdxdna_hwctx_param_config_cu - configuration for CUs in hardware context
>    * @num_cus: Number of CUs to configure.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    * @cu_configs: Array of CU configurations of struct amdxdna_cu_config.
>    */
>   struct amdxdna_hwctx_param_config_cu {
> @@ -122,7 +122,6 @@ enum amdxdna_drm_config_hwctx_param {
>   	DRM_AMDXDNA_HWCTX_CONFIG_CU,
>   	DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
>   	DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
> -	DRM_AMDXDNA_HWCTX_CONFIG_NUM

This change actually meant here?  It seems like it should be it's own 
change.

>   };
>   
>   /**
> @@ -133,7 +132,7 @@ enum amdxdna_drm_config_hwctx_param {
>    * @param_val: A structure specified by the param_type struct member.
>    * @param_val_size: Size of the parameter buffer pointed to by the param_val.
>    *		    If param_val is not a pointer, driver can ignore this.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    *
>    * Note: if the param_val is a pointer pointing to a buffer, the maximum size
>    * of the buffer is 4KiB(PAGE_SIZE).
> @@ -175,7 +174,7 @@ struct amdxdna_drm_create_bo {
>    * @ext: MBZ.
>    * @ext_flags: MBZ.
>    * @handle: DRM buffer object handle.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    * @map_offset: Returned DRM fake offset for mmap().
>    * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
>    * @xdna_addr: Returned XDNA device virtual address.

