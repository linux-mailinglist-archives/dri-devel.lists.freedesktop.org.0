Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF0A558B4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 22:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC6C10E28F;
	Thu,  6 Mar 2025 21:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PV5EdqM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF6D10E28F;
 Thu,  6 Mar 2025 21:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDMTxKbYxZ7vEen8ejjKgHWO94pIspZRxLLUrjIeYzZkAN2iBkys0Ds8tHm4xnHtw9ZvVTG/Fbr7kq68uTGs9+8Db7nNeeW20LrTqtnnQI60FPyFUs8wYa8FUGewTiNEKSLkZWHUyEXmGjkZNoR/wxQ5OhRKq22CjTLpr1NuX28fcaTbrmqiMEsdYxXCM/qS9tEko+cmKNxtLKp5OVJlXIlu7XB0GzrQb3kdLRXRJTM55kP2MXEGcLhxLYykhGweHKy91Il8HcmjbmGTYcD3M1Vil9jscHSulmkiCBeshvNTpwFgF8sGemm4zQAeSQszTfWmzEegEf6TNVl2kmRwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42ADgpribZWOJmF4hh3zuJB7dbIkN58G1/P57Ag1n/w=;
 b=NgOCpCqTW9UECfQ0SuUpAFPBexbELjfm+7WM9wFvihx14c5DXBAr8znVfmBNgQDd+Z9XLkyBSCTR6PmL12bS2pRtlcymii9hUh5Zw1rp1+1s5EMh6xX4urH4ifXdpfrwTn/TtNyipDD5mvxEmjCsW0+7zrcwyhODzMS5ZF/4KopLcOlY3R+A5JILOw1vTrps5GcBu3dpViohoBocG5S2yv3b7qt6ARsOcGfS5cpeRx41xRcHlm8QrEKD4GQ8yy+1g7KjL/IjzH4MQ4ePjRCEJazbQpio8o1QDXJE2to5pu2oDm1BJ9pCgfoxSdCbuUMQ7xoNqP1BCI9rBEDPBcvjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42ADgpribZWOJmF4hh3zuJB7dbIkN58G1/P57Ag1n/w=;
 b=PV5EdqM5CGCo+S09/H96Nb1pdMb4EysdffiREKxeGSN563GRyMVIbel8f2yo3DWyrg4rFvkKGYBfUQ+z3KpRqfV+R3ezTGfWR9V0pcIsuy0EYaJTguINVo8+Qk8eDK+8YOirPkRLyKS2cRPV3EZD8OfKijCbd3Nfmx4KTl2elmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 21:24:58 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:24:58 +0000
Message-ID: <1e9cdcd7-b0a6-4c87-a5bb-b8e637ad8d49@amd.com>
Date: Thu, 6 Mar 2025 14:24:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/amd/display: move from kzalloc(size * nr, ...) to
 kcalloc(nr, size, ...)
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: 84164f0d-c77c-413b-1a3e-08dd5cf558f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2tQS3VxbU15V2ZaQk1Kd05mY2hhNXNrbWVWclYzcHgzTER3Z0Zoc2NLMmEx?=
 =?utf-8?B?VWpSeXN0dGJyUjhRZG9tUHZEL0lQVHZoVWk1ZWFuaVBkK1dkYTJtNElRYlVX?=
 =?utf-8?B?VHY2TWg0Z0Y5eG80TjlLOXc0Wjk0ZkJoZWcyeEhMVmRvOUpmUmxPNStHdFlG?=
 =?utf-8?B?TW9DM0s0bVVSeERQbEZjMGQvcGdYZjJNMUlrZWxERzhMSGtCeU1hYWJlcUJI?=
 =?utf-8?B?dE4yWjRkWm1mbWd2aFFvbWVzc0tacUg3ZWRod1lWQUdYRFdQd3I2VXRsTDFG?=
 =?utf-8?B?RUxHcWdnU2hldFpFUExQMDRyVzBjSDdYWjBnMkhqOXJzUXA3NW9GWlBQenpl?=
 =?utf-8?B?ZWhieVVtYzBmY1EzRDlTYUpqUEY3U1lrTXpFdytJY1orNjExWndqRExIL1lC?=
 =?utf-8?B?eVJqTm5XSzhmSmowREwvU21lU1JybXRNMEZMMExjc29JZ29NQk5WdmdpeExs?=
 =?utf-8?B?eU1zOEErYnRVenYrWFZWRFVIcGMxODdib1JwWGhpZzkyajlCSEpXcUxKaG5n?=
 =?utf-8?B?UURkbzl6WHliSkEzVGpjYWgySFZsancyTTFCVUpiMW5aS01KNi9ON25RTGZk?=
 =?utf-8?B?Q1FIYmNjdVpKSTVCbXBEUmlBbEZ0a0ZEWVcvZGtjTTQyOUhtM2ZKakR3SHpF?=
 =?utf-8?B?cnJRYzZCdlZTMUJuN05MMlUxbjVERjFVWUlkZ25xRHMvK1JYbFVLRC91U3dH?=
 =?utf-8?B?cVY5cm16Nkw3NlhDdGY0UXgyK2U0YUQ4UXFidW5Nb2s0RG1LblNIcDk3OXVn?=
 =?utf-8?B?eWMrMUdqbkJrY3dqVUcydWZucGZnTEloQmlUWlFpOTlFTUVXRExmN2lWNmxr?=
 =?utf-8?B?QTdtdmJGN3plNDA4dStzdDhndDkvYzZaRXhsZmo3d1BFZUh0VUpLZDVsNEU2?=
 =?utf-8?B?bVZmbDE4YndvVHdQQ1VyL2h3eGI2R3ZDY2c0bDgrc1g1aWF1QUFETnZ0dUJo?=
 =?utf-8?B?VGpKY1NKU2pRNGs2ek56QTRwZlpFaW5RTXZLTGNRc2ZqU0pZeGdLN1ZDbWxC?=
 =?utf-8?B?aWV5WER0OEk1THB5QTdiV2tsN3RLOEJMWnVWeFBVSk9NeFB1c0tjQ3ZJRDBP?=
 =?utf-8?B?WlloSkpCSCtXeWthVHFuYWhZbjhDaTcxVndSQk4rZVlvMlJMTkhzUXBSdjJy?=
 =?utf-8?B?SzBaRkRhMmJMSGtkeVFDb25ab0JYSFA3ZmtkSUF5Tk0xS01tejZSMWNVMHc3?=
 =?utf-8?B?akhUUVkvc3hEZld0b0MwWjZnd0svVWI3Q3graHd0S1pobjlJZExRUmtraTEz?=
 =?utf-8?B?VVVzQlVxUExZaVVSMmxobEU3WXU4cmxUS3lRR2x5cjNOU0Yxb0tJNWlNM3Ft?=
 =?utf-8?B?VmRkRk1ydWtidDYzeFA5dysvZXRFcWEzTkxxTFRKUWJ3ZHFmazZLWHlhd0xo?=
 =?utf-8?B?aVpHTDB4Z1JSTnU3UTBhL0ZYeDk2QTREc3pYd1ZteWdhYUoxbTJFVE9nRVpZ?=
 =?utf-8?B?dXBlS1lWcTZDU3RUQXRteVp4dnZDUW9WNDBwckJUV1VaeWk1ZVhaTzVEazQ0?=
 =?utf-8?B?WTVBd29yN3I2TUhsTkJ0azZlYnZmM2JYeHNBb3pvOG9ESW54R01Ia1RrU2sy?=
 =?utf-8?B?d0hreVNWc2pSdGNJUjZjSmxHTVlDUlc1a25NS1ZQM1RzVHlyUlZ6TWJqWUFW?=
 =?utf-8?B?bXUwQlRKTHZ2dHFkenhGZG9KMHlUNVVkR0p0S2RuM0paTkxPRUFhYXRDd2d4?=
 =?utf-8?B?OVNuZ1ZLNWUyNTEyZ2ZNaFZmVnBPZ3M4SkpkbkdYKzBFQ1FqQ09tQWs0THJx?=
 =?utf-8?B?cVJuNTRHNmhGNDV4MVJkcjEzN3NPQm04NC96WkFzVlVFdHJCMU9ZSmVZdkVL?=
 =?utf-8?B?dzJQSkE3L0U2alg2QzV6Y1ZieUFSQzhEYTFXL2QyakNGUFk0cmpCaUd6Wnh6?=
 =?utf-8?B?VmZBWERCdk1pVGxSYnY1Tk9lTnZVZ0hUbzk1dm1sUWhYTmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmc1RUFYdU9TQkw5dERBem5Obm93RUxPdk9rOEdxc2NQR1VyS0VZSnhYRFRT?=
 =?utf-8?B?eU5uUytQQ0h4K3RDV3NrZGRWeUxOYXlhOGt2bFNmOFBKN3dxQjc3RFBad2ZF?=
 =?utf-8?B?bSs0MVpveHZFUXpSM2dLMFVrR1AxbG43Q3crd1dEcTFKUFp3ZmRsNXo5TE5a?=
 =?utf-8?B?V3lqeEFlVXpQa2RXYUN4MU1CM0loSmswTUQySXNwZk43QmFodTBldWFUbW9Q?=
 =?utf-8?B?Q05jRDEvRGMzTUZpMzM3WU9jNFBUS2hJRkRxUXAySXJsbFROSmpYckk2TEFK?=
 =?utf-8?B?VjVXVVNheVZLYThhbFZxdnRsSk03S3RENEdKTFNnVkVhOVozencxem9kVElP?=
 =?utf-8?B?WU9wdjcrSUswVHdrK2YyaVZCRlQ4YURBTmp1eWR5ZUlrNG5PbXVKWXYxbndp?=
 =?utf-8?B?NUc0dDFRcEE4dkNzWk12cGdPdDkzbkpTL1cvUXV0TGFWYmRVR3U5elFnamNy?=
 =?utf-8?B?TzBZMzhsLzBIT1NLaEp4OFV4d2QxNXZIR3ZtYjRNYnJ5QndsYnlkSjdXM29a?=
 =?utf-8?B?US8zSzZsQllYa09UanUxeElCcFNXQWhyUS9SSlNzTFVNeVVmVnlycW5wZHdI?=
 =?utf-8?B?U09ZaDI1Yy9iNzdYT3E0aEZRNExWcUZvM0ZJZTduTVlKOHQrbW5RcG5HWVZy?=
 =?utf-8?B?cVFkbm12bXdMaGxZVXlFbFNjV0xqblFCNWMvNklibnRnNXA2cndnNFlxazc5?=
 =?utf-8?B?YTR1WWhrY2t1eVdUWTluR2t5d282V2d1WGlONXUwamxGQ1QxakI2bGEveXBG?=
 =?utf-8?B?bjVpeU1LUjFyTTBaSWFXSEYxdU4ydURLZWxMOFM4QWdLUDBMQ1dNdTc1Wjlk?=
 =?utf-8?B?OWJjQWdvY1hiamo0YkdQUnNhY3JBMm9yVldCTmdIWHlEYyt3WjFSWWdBZk4x?=
 =?utf-8?B?T2pEckh5UFVvKzZxUk1uUm9RKzl0ZEg4emVnZUtqSG5hWmxSZFMyMWFKS3cw?=
 =?utf-8?B?b05nVUk4V1JkY096SUErTVRPdHBKdTMvTEMrTzNnU0dkVHA4TXBIbi9jdUxO?=
 =?utf-8?B?U3RoSDkrTUt5VWxkWHgzekdiRWpLTmw3RzFOcXdlK0hYekVGYkdKQmw1dm0z?=
 =?utf-8?B?ZXFSa242R0NoTE1WbVJJcHBJN2ZvOThsekJjM0pKRndLUitaalAxMllnU2tT?=
 =?utf-8?B?dnRWRTVGY3loMUUvMkVjRHJqZVBwOWtld015UGZzTU4xWDRoVVBzckQ4OGpa?=
 =?utf-8?B?RnBoazJVSUorWFc3U3p5U1p3bTExQ0d0L1hPS3V5ZnliUDM1V0kvN0lEWUVl?=
 =?utf-8?B?eGVaZnRWUEhVZklRUi90L21iYlIwUERSWlZVek0wQUJianBtUFNTaURoazU3?=
 =?utf-8?B?MVdZS2JiRVl5UHVIMTkvc0tSd3dkZktTNEhPcEpyYmJpOG4vK2VyWktyUFZO?=
 =?utf-8?B?eEJHQjJsdWhWMlowZVNZMHJSQ2VLTklkT1hmQ2h1RmZXdkVGWncwZDJFRUR5?=
 =?utf-8?B?M2t6N0lZYjM0R1F5N3Zib0FRZ1R4TGxodmd4R1NpZWk3UVNJa1d5K2dkdFVS?=
 =?utf-8?B?MzRTZVJBU1JNSWVuMmFBMFd2Ly9EUlJ2WmRmL0k3ajk4Znc3VERYWGlKS21i?=
 =?utf-8?B?YTY3NnFYL0ZtK3dHMVY0Zm9xamxTMFJ1c0VhM0hNYTlvUVZVa1ZoeDl5eXhx?=
 =?utf-8?B?L2hoalNrZFRxc2Q1YzByanVpdndiUkxtSDdkNXVSRlNwOUxEOXNrbklrazg0?=
 =?utf-8?B?ZTFnMi9nYkpCU0I1QjhzcmtXb0NJVGsvdWZYQmdXU2RaVkgxZjJqeTN4OUQz?=
 =?utf-8?B?cFdzRXBKeWk4WDdOaHlnOHRFaHNMWDZFRmVJdE5IVmdUOWhNUnE0YUFLV1po?=
 =?utf-8?B?ZTg1T1UzQVIxTlgzQ20xdGMxaFRDQ2IxY1N3TkRCTDRPRlFzT2EzR1V0TGlQ?=
 =?utf-8?B?MUc5ZWpNWnp2MFdHVUJoZlZhaTNoR3IyVkNOK1VxLzI0SjNSTFNCMXE5Um1D?=
 =?utf-8?B?eExLNE0wK3pOYXowYitRNzFneFg0Q3BGdFJITmRzRHVwRUw0S3NFSjhrbTg1?=
 =?utf-8?B?V3pic1dRSktsbWJOd1kwcnhOR0FCOTBVNkZsTkxSU3Y5c3g1U1ZaMktJdExN?=
 =?utf-8?B?U2lmSHVMSUx4RDQzbDFNZmg3QW14RVF3RlJIVUZ6R2RpL1oxRDZqUUwyRC9r?=
 =?utf-8?Q?ZHeUa9nOmCjOC2NUwFQeIXpkN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84164f0d-c77c-413b-1a3e-08dd5cf558f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:24:58.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qD1ePd0SChZ7M5Mg2KqEO/Y3PDc17FlD23alAFnQPKjizAY81Md6u3TfkoxN9wuXZqpBulBt43LShR4CJKREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034
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

This series LGTM too.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/27/25 16:16, Ethan Carter Edwards wrote:
> We are trying to get rid of all multiplications from allocation
> functions to prevent integer overflows. Here the multiplications are
> probably safe, but using kcalloc() is more appropriate and improves
> readability. It is also safer. This series contains a few patches
> with these fixes.
> 
> Part of the Kernel Self Protection Project efforts. Links below have
> more details.
> 
> Link: https://github.com/KSPP/linux/issues/162
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Ethan Carter Edwards (4):
>        drm/amd/display: change kzalloc to kcalloc in dcn30_validate_bandwidth()
>        drm/amd/display: change kzalloc to kcalloc in dcn31_validate_bandwidth()
>        drm/amd/display: change kzalloc to kcalloc in dcn314_validate_bandwidth()
>        drm/amd/display: change kzalloc to kcalloc in dml1_validate()
> 
>   drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c   | 3 ++-
>   drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c   | 3 ++-
>   drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c | 3 ++-
>   drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c   | 3 ++-
>   4 files changed, 8 insertions(+), 4 deletions(-)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250227-amd-display-a8342c55a9a0
> 
> Best regards,

