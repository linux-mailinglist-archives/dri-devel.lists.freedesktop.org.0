Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101EBA45087
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534A810E813;
	Tue, 25 Feb 2025 22:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GGRyYNPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F810E812;
 Tue, 25 Feb 2025 22:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ptri7EfJWajnyZF0yhFBC2uJ4hsfXWVxLoL2VtbvW1AyYF4JV64WWQ6jklaRqaSWuznzbwIM2W7C+3iw7w+as6VI2DnoNKPKx29E2mGt7MbG7hllruSC1997pgmdJJUfPj3ce/Hty4ag+j4zdr5M9uGObeo6zhn+jtiv94v4jrIYP6ChKDj7G7hURhSjj5Zi/0MCgLTjIyYpGZihLbvRR+fufG1uxfvpaNqR/AZaWkwSbgLAaZ0foccu7Zht0dw7AwJ6o4Wj2JVGIMN2BM+/97DItawAxn/nHvSfNyckxhMA9tGUrvXy5FkkV+HQB7mp31jqulkpFfdDdMPZkHggkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpqbh9PSDDceGJUbLdPU4aqqlEy9oxTx2MTwOknxdPs=;
 b=Dt6atbKINY0R8p2kFE2tGP0NcjA7LL9jatW2Qt6vBSaKKz6mCn3BS6/UJbu9Y68OcxeLCWj93VQn2F6+pVFOMJPQ11V7CW5qen9/Xsmmn/ny/zbVh6R/RJOZvDOMTYeM0UcfWbb5ckdtaGJsyWVgfN88C76NtPIuUtG+kObwfIG0igxF2SNtqSnactMmfEqUGXFckNpu9V/f0n+n072a+e8AeZbUpi2jyUEZoy8aEbV3iA5kjBoggEkc4xfZp1vBwB4ZkDIPiQKASeO8Zu5nMDXSHmrf60CF38VLMVB9L+TwijpFlmYISs+GY/OzBnV+08H8OIHPurYKZ1wFLB/Ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpqbh9PSDDceGJUbLdPU4aqqlEy9oxTx2MTwOknxdPs=;
 b=GGRyYNPX7DkPiBJh1Mq/yc6GziUMMuQXVnQNQ2eVFo8w2eUizyt21kdC/NeWQoUMHZws04/cdTuP3ySntqlwUTZySH+7a9qDcSMFu0ZT7Wu1Grx3Z87pZPRHIKCVXP35Y7urlZ1Y7GAecljs8caZBQJSMpfQPz+zq+pOpgz7SsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 22:53:43 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:53:43 +0000
Message-ID: <14852987-a774-4952-a166-b84880566564@amd.com>
Date: Tue, 25 Feb 2025 15:53:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix null check for pipe_ctx->plane_state
 in resource_build_scaling_params
To: Ma Ke <make24@iscas.ac.cn>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wenjing.liu@amd.com, dillon.varone@amd.com,
 Samson.Tam@amd.com, yi-lchen@amd.com, chris.park@amd.com,
 aurabindo.pillai@amd.com, george.shen@amd.com, gabe.teeger@amd.com,
 Yihan.Zhu@amd.com, Tony.Cheng@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250224063218.2953217-1-make24@iscas.ac.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250224063218.2953217-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1cfba9-64d8-4b7f-a89d-08dd55ef40aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2xESjVEc2NWNFFlb0hqbWtWV2ZWOE5NNGVWKzV3UUlKaks1UklIaWIvYSt2?=
 =?utf-8?B?b1hlSEpybHpOSXpTM0M4NEwxU1dhSVh6cDBnWFZEek8wdnRDWUhxS0I0NDYw?=
 =?utf-8?B?MUVuV0E0R1JDUU1jeEZlbERiY2dLaURwYVRLR2lyYS9hbHpNTDJsSE1HcGZ6?=
 =?utf-8?B?cU9Xbkt0dmZNWHp6dndheXdYVnFXS1k2bDdIL1NVR1BHdng5RkFGeW10SWN4?=
 =?utf-8?B?ZWpBWE5jS1luQmlRNk1pM3Q4WXZTNXVoaDY3VGlkUHFRTk9CeW9jdjhxbmNF?=
 =?utf-8?B?WU5iSlFiQmJxZTZIcjVoM3MwcEJVaXVaVTZMTXlOSFZPeVJGWVJMbHhhQzhF?=
 =?utf-8?B?RmNpYmpkZGZ1b01ieDVvOFRVYnF0R3JYRFQ1dzJkc0E3TlQvYVE3WlVvKzNO?=
 =?utf-8?B?bm1nWFFqc0ErTHUyQW4wWWdvMUZhci9HT1pqbW1RRzNobS9GY1R5YVJUV0hD?=
 =?utf-8?B?cVdYdEFBWGFackc0REZXNjd4M2NYU05kTEpQV1c0UzBZNGdzVFIzYUFvdVdr?=
 =?utf-8?B?VVdla1FoRUwyQWx2cnNRM0R3SjJLNjRWTmFRdnJDSG5iWnQyREhXYmN2Z0dF?=
 =?utf-8?B?Ky9IUTRIQ2l5d0VKb1orWHdrdUlRVzRtL21jNExMdGtVOWwxRWYyQ3h0RkFi?=
 =?utf-8?B?UmM0dS82QWM2L2xNeTUwcHhnRmhXTVEyYnRYd1E1OFVya04xOGQxK2ZaTENL?=
 =?utf-8?B?OElCRFAwV3ZKa0YrTmhXclRvdXViSE0vbmJZa1BWWHF6UUt3TTAyVU5xZmwr?=
 =?utf-8?B?SUlCeTVVUm5iTnlTc1QweGt5emhSVkpmdFdKSFdFU21reWc5NEw4S3U2cHNj?=
 =?utf-8?B?c0J6b3p1TG9INlJTVjhmdnk4RXlpVEl0OXYvTHpBOWUwVnlBNG96SHc5dHlu?=
 =?utf-8?B?dGNucXlBb2VyT2t4YmwzUlZVbmhleXNoWnlyaGd6eE5TRlJobThubStnd3pB?=
 =?utf-8?B?NC9yOEJDZVVsdy9zY2tMVFEyYVBISmhaZEdnKzlXSXlaQjlEOHpVVWc5NzQ2?=
 =?utf-8?B?MVAvVWczWVhhd0JHVmI0cW90a1E1Sk9sOXk5SXlwdWhscERCWEM2RFlZV3VJ?=
 =?utf-8?B?NXA3cGFKU05peE5mQnVKUUd6RlRxVmFPcjBOYUtQOTNWMEQwWFdoaU95clBo?=
 =?utf-8?B?MExXaDFtRk9ETWptSWxKbW8yRmxIMUVubEMyTjJQUEhVS2hpcjFLMTZvdFEy?=
 =?utf-8?B?aXJIRE5nMVM5Ly94TFVGZC9lK0d4TjJUcERqd3dPdU40KytsT05nZFZ5Z3dy?=
 =?utf-8?B?bUpLeUV5c0lhbWZJcWZBT3JBT2dYZmlUbWFLTjI1ekVvYkJ0SGhMRWJwcExG?=
 =?utf-8?B?MFp2QVdmNE9YL1YveHJxR3BFby9qd3ZaSGZCVE9wYWtvdk04SWVsMVVwTlNz?=
 =?utf-8?B?NCswMkdTTlBOS2E1OXBxckUrdlk1d0RZQTVkcDhOdEZLSDFBNkFPc0JjTm11?=
 =?utf-8?B?QlZLTkZmblVIWkxYTk1ldnBycUtKMkFJeDVUNGt2SnkvWTlOY3BWZzUyYW1o?=
 =?utf-8?B?RndMMnorUnN6UUtQS2kvZngxMWxKSlpJNlZJRGJQaDRGUnJtbTZWSWQ4TUJz?=
 =?utf-8?B?REM3UmFLR0VLR0xWaThNa2ZBYS8yYmtrZW44VHhDUndqU3p5SEFmUGRwbWhN?=
 =?utf-8?B?YlptT21lWVZkc2UxbVphbHhSY3lVZmhxcmYrT2ltVU5ZSTJVSHgvdllOeWsx?=
 =?utf-8?B?c1dzRXkrWi9HZ2lXZ0pSZm5MUzZ1ZldxNlhCUVpESTlYTFVTVGU3WDY1TXhZ?=
 =?utf-8?B?cEpNbFF5TmlBRlg1M2pwTEtsUyt1dEx0aTRsVkdXeWZjTmZzbjRBYjF2S1JL?=
 =?utf-8?B?dHE3WXZ2WHZ5ZGlRNWFLdkkyZGxvcGtSVXRkWnFkY0RZVDlRTGwyUkJXOUQ1?=
 =?utf-8?B?T2Z2SkpmT1pIejJCRUZYTnhwUnpiendQcGdhbDZYcnZEbEVuNEhaTjJsZ0tU?=
 =?utf-8?Q?L4fqDJdw/gI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wnd1SUNzSTRVaTVhdndXRGdsaHRmSWJiQVZPSVFETjdaZXc3TzVYZTJCVlVk?=
 =?utf-8?B?bVNQbEVDVmV1YjhTMFFLMG5DMy83QThQQUpYK0pjNVBlZjdxUmZSUkprbC9L?=
 =?utf-8?B?L3VOUURUVVAzSGRKZ2VOdVBZTlNsNmgyT3lHL1ZtbGo2cUtHQkRSc3Q5ZWkv?=
 =?utf-8?B?ZkIwOFBnYXlpcnR2N09aSVloc2ttOU5VQ1lBVGNRdmN4YjJKbDFIbHhPbC9B?=
 =?utf-8?B?a1g2YXYwZEJ5cTJpeWRFYW0zUXBBRER3RGVnOXA3RnUzUW5QanM0U2VVQ1ZK?=
 =?utf-8?B?dHd0KzAwc2JJUjlweUh0NXZaM0xIOTVoOUNmSUJleFF0OG84ZlFzc28ySFhZ?=
 =?utf-8?B?aUgwVXZwMkRSdzV6OUVGbTVVVUJwOVQ0WGFzUmptdTJ6V3RqL3pVWDV4ZXF0?=
 =?utf-8?B?MDNsYXlpbEdYaWhQK0VVQXBWcmlXMW5Ta01ScXdiN1VDN0NtMEo2NTZ0WXhJ?=
 =?utf-8?B?MVRoZUcwaFRlc0lPdmtaZTBZQ0VxOVJHSzFLNkcyY1AreE03ZEY4TE13UWRW?=
 =?utf-8?B?RGpMRzlZb01reTlVL3NUbGlwVnMrcGF1dFM3bVFodEVOM0ZhYms5eDVneC94?=
 =?utf-8?B?QkN4OWFqaGROejI0NzhDNkxwU2hKOWc3dWJpbmxXQnpjVVpBa2pqaHlOT0NL?=
 =?utf-8?B?WVkvRHdlNGgrWWdyc3BUdzJvQmphZzFjYUNPSXMvSUZhd1k1WDFibDFuWndF?=
 =?utf-8?B?OFk2VlhENkE1bGlRNTc2RmdSWnRtb0VrV2d6MkhtcTdPSGRwN2o2dGtzSU5M?=
 =?utf-8?B?NWtBYmhTclA0czRYR0FFb3ppV2NVdG9HS3daRTl5R2d1UnhMRUt0NW5SdVJo?=
 =?utf-8?B?RFN4Ujd5YU5TcjZwMTFjVXdHTFhUMm9Bak91cng0Zkk1OXUzdnZLTml5MHFn?=
 =?utf-8?B?QWhEUVdhRzh0M3lGMUhwYjhkN3ZuSlJqbjZyclA3L0VIUnpxR1BKRFRzTGQ3?=
 =?utf-8?B?ZTR5RjRuVlRPSHlWdXhGd0pQWS92OW55UjY1cWdZck8wdXROQy9BbDIwTURF?=
 =?utf-8?B?dUluUUdLRlBPcG5aSlp4U0ZSMDBaZmpQYWhySWN3cWhTaE1aVThjeDUySUNm?=
 =?utf-8?B?UHAvMDRSYUFjbXNRYUd2eExONm5hbm1WTUdrN1liNVFNMWtUeklxNVllTFdG?=
 =?utf-8?B?aGRyWm9vc2pmOWhSUG5OUFQ2a0Fld3hGMkhML0tDYlU2OFhKR2tVNkp1UEI0?=
 =?utf-8?B?SldGeENnSlNhTCtpbmZEMUFxcThSWDFxSDdUYkFhaTlMVWdKS1BSUmZHY0Rk?=
 =?utf-8?B?eXlzR1JvWkRlK1BlLzNpbXRnVGR2a0kvQ3l1aDFSQi9HbTFvU3BESGwxdW9U?=
 =?utf-8?B?U2MvZWtsdmFpYU5QVlZRcDZFTVBDQSsrV2R0SmRsRGNUVnRmVURUQ3MxODVL?=
 =?utf-8?B?UFBtY3RTY0hUaWZLTnpwQlpRSVJMMWtTem5RWG0wdUl6eDBJdFZrejErZmVD?=
 =?utf-8?B?RURVVDJTZ3o5c1pVa05EUkY3MkVSWXV2YjBONkQ1QUIvamsxSHZGM0FCQzZR?=
 =?utf-8?B?czN3Q3JucVBaVXVkYVg2WmwvamJEaTZTVVNJUEdyZ25nSEVtWU9IVGQ5Smlt?=
 =?utf-8?B?RWRPWTd1WkRnd0RWWmdvbHUwWm8wMk44Y3RUVGFXZWhHV09rZFNzczJxT09l?=
 =?utf-8?B?Mnc2UUdyZlFRLzloSDZsMXRxK0tTUGJWMzVWV3dHNUEwMkNNWFl6VTQ4VmZV?=
 =?utf-8?B?Y1I5VkxUZkt1NDZjK0NxNDd3OGNYb0U2TzJzUWl5VldMZkkvbDhPQ2s2V0NJ?=
 =?utf-8?B?dWhsaVBaQ1ZyZzVEbE84TVQ0QWlEckJEMGk0NUJjVk44VUppSzFjeS9MaDNz?=
 =?utf-8?B?anZIUHJZQm1BLzlxMnlBV0VROGJlL1VPLzBWTG1mZktNWmE1WlVldjlrL0h0?=
 =?utf-8?B?S3orRGVRanFHZ0lvaFpFWExnNzhWeHhpMDdpSXJRK2VwUXdWL1MvZWd2dnYr?=
 =?utf-8?B?cUV1RXBiZWRxbHRtbVJ1R0ozT0MvNUNxWnRpTGNMK0tyZ1BGd3psREFFZUlO?=
 =?utf-8?B?Y2FwdWptRE8vRjc4ektmQU9ydHpMams0V0R0cDV2ODhOdThKUHFKdGxTcy9z?=
 =?utf-8?B?Y3kzeU9nazMyMVhXVVlxRzc1OXU0emhGc0plblFRRG1ueUc0VDVyZ0svVFJy?=
 =?utf-8?Q?XroDmDwuoZJ+zbB7jFFhL2y3M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1cfba9-64d8-4b7f-a89d-08dd55ef40aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:53:42.8971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWEgAXdZGGg/FHY0Ck117H0PZWuRraoqt3oP9kVwmzHmMKoKlwMg87W6A2GwLEQEWXfV/p5LD/Ed1+Lg07hPFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
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



On 2/23/25 23:32, Ma Ke wrote:
> Null pointer dereference issue could occur when pipe_ctx->plane_state
> is null. The fix adds a check to ensure 'pipe_ctx->plane_state' is not
> null before accessing. This prevents a null pointer dereference.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3be5262e353b ("drm/amd/display: Rename more dc_surface stuff to plane_state")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 520a34a42827..88e8ae63a07f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -1452,6 +1452,9 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
>   	struct scaling_taps temp = {0};
>   	bool res = false;
>   
> +	if (!plane_state)
> +		return false;
> +

This if statement can be merged with the following one such as below, 
and it also allows ASSERT to kick in instead of failing silently.


         DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);

         /* Invalid input */
-       if (!plane_state->dst_rect.width ||
-                       !plane_state->dst_rect.height ||
-                       !plane_state->src_rect.width ||
-                       !plane_state->src_rect.height) {
+       if (!plane_state ||
+           !plane_state->dst_rect.width ||
+           !plane_state->dst_rect.height ||
+           !plane_state->src_rect.width ||
+           !plane_state->src_rect.height) {
                 ASSERT(0);


>   	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
>   
>   	/* Invalid input */

