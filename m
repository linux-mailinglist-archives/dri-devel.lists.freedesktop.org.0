Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2041A6A352
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4310E5AF;
	Thu, 20 Mar 2025 10:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pjMw7T4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C4C10E5AF;
 Thu, 20 Mar 2025 10:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ6Lh5JohaX45ycUby21DFYiAcAxyg0wkCtlUwDMizNqWiKLReu0HdcJs813Fh9hYoB7GKDJpgjc2n31UpYDHaYf9IUo1RIH8uB7FZpIHyX5Qu3s3HSFwYJrrhd22V71+3lB3GbrcAmXy44BRiUkItxbP6cbSQ9/U3XCmmGF0aW+mSvz7unRIddxsZAkHlSshp8VUXzpyT7MdqVe769LbD8cKZfjJFpzCOqQ2nCXDanh6hk/SztXdNe4Hrtpvfh52/xbo8y6gsHdttspDXyM32/+NHpK78PtTGbGtXJ+5nXz35jiyLlq3pRuXaP2zQnjrP9kN/QGApMddvQgH2WZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCqp5XzVV0MtfoOMlDE5hySIseCbOcOcCXzmbzK8Tto=;
 b=ZdopOb8sMtCm4SPkDYhdjDeJW4n6Pr7qmC95X37dogGUG0lp03aLS4VGbFtjOwA0LzvD9/q0BhahlB3VlPxBGdnj5R3QGet/9Z2yvjMTLJiJhKZ8u7x+jTWq0eiz3tMoagxeBtNQ2YC34KayhmcHH4b7nr50Whtchr8Bu7jpK8flrp6VUKfJ4PIGpFklUfczhU/Efjh98n8n2HEqD89Ze3NZdq/NM7u2/O1YKIR1nHZFnshPkI66CszToet3Lcd+wtuZVFkQS//pXgHQhjaU3NKQbxFTs1INlUoCE4VimMzy4PSdEEbhgfEbv68Q6Ji/TsaI/EsMvgxm4F0svUC6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCqp5XzVV0MtfoOMlDE5hySIseCbOcOcCXzmbzK8Tto=;
 b=pjMw7T4yUhcBjGwJRhn0Uh6V7XhfgHzrrAiZK8LKyXoKf84d1ZHGor5NS5bX1aPz9PV2TIE6KOwtvg3E70CsXV2LbwIjnn8LzF/D2D6t8FrBNSzJ1vNXDKROWFbXph3C3seLCWaysGGS7WDCaZGirMf26iaincEQ5CBrDRrU13U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 10:09:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 10:09:24 +0000
Message-ID: <d0f8d5a9-4ee9-4f65-bb09-c88d814f2acb@amd.com>
Date: Thu, 20 Mar 2025 11:09:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-11-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250320095818.40622-11-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fae479-085f-41d4-fc86-08dd67974a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFNXSlBpQWhNUU9iMnJFaDlUdjNDN1lHbnNtRFZpNjJOMkkxT1AydGxrcU0w?=
 =?utf-8?B?OElSTkF3NlVCbXJaWUE5OWVldk8zeDc5ZzQ1WWhmR2o1dnRaODg4azFaejBX?=
 =?utf-8?B?QktHVlZFbkZzWEUwUnl1ZXVpOWFpaWxWWFB1V1BQb3RvTCtqWHJsMHZJTWxO?=
 =?utf-8?B?WHVHM3h4V25LNHRiNS9lZW01aVYvOUsvdzZZK3RlNUZObzdzaTAxRW1SUE5J?=
 =?utf-8?B?NXdkVERFcXZDbld1MXNsZGJ0cGFVbk9tdUszVGl0NDRTTE5UR3ZncGt5bUN1?=
 =?utf-8?B?Z2crZXM1b29ZbG92TFdmYXFyWEhZT3hmaXBzb25kTDk2WWNFa3BPeXFCNnpH?=
 =?utf-8?B?OUJzNUt1K0krM2s1dzJxZ0xUaVlXU2c5b25IY01LKytNQ0xYaUtZZEdyNDdV?=
 =?utf-8?B?MGhhZHV6d2hpUWs4cDBlTmZRdHlUdFNFbnlSbTJBZFFDTXdSZjZIaDlzdzhW?=
 =?utf-8?B?MERGTkdVSTlTVnJ5MVlLL3VUWHo1U1hYZlVZbGxteElhZk95TUd5R0RWV0cy?=
 =?utf-8?B?OGE3cndRNEF4QTM0YlFLWnNyODRnbUNYWjN4T3hVdDlYVVhFRGg4Vy83bnFL?=
 =?utf-8?B?V2RRVWFOVXN0Z2w1ZkVlNFRUTlhFdDFtNndJUDhOdTQzaWxNUVh6Mjl1MjBM?=
 =?utf-8?B?TE0vQXM3Yzh6NmdkY1NPbzNJVU80N09kSDFlVDd1dTVjdmtvcnhCZWtZVHc1?=
 =?utf-8?B?b2l6S2FiQW40OW92NWVZTnNBRHpyS0huQTZLMlhnYjJuYVVrZEVXUXBLR2dt?=
 =?utf-8?B?c0Rja05BdTloRjZHMC9PWkw3M2N0VWJEVjBRWjJpK1E4cjhaZnhpS29WeW1N?=
 =?utf-8?B?M1FlSG5zRjR0SWNiWmw3d29IbWl1bHBzYVFid2xrVlIyaW5VY0lzb1g4MVlI?=
 =?utf-8?B?MTlna2sySnhaejZYL3pFbFBJc09sZXFxcjB3VzJqS0cycUFiUWJ1V2lXQlow?=
 =?utf-8?B?QW1MQnFsK3NoQmN0dzUzQU1hbHJkRzhrRGFldE90QTY4ZS8xYjNyRXd2aHd4?=
 =?utf-8?B?MU4wQnVSQ243Y2Y2T01QTGVjRHZTTnNCQzJaSFZTQUR6L25oR1g1cjhTTFRD?=
 =?utf-8?B?Nnc1S3JxdEZPUGNWcnE1aTY2M0ltM2gyQjlYNGpJcjFMSFVsR0NGZW1VSko4?=
 =?utf-8?B?MStiQk1GVDJBZjMzRHpHcFU3SUsxWEJhSGM3N3IrWlZEaFJhZTZteWdMb2c0?=
 =?utf-8?B?TnlCNDRUT2QwU3NzdnhXamJHc3hEejNFa2VYeGZWL1FJb1VZUkVkbzNBUjdy?=
 =?utf-8?B?ZzFSVGplTzNTUVJuTCtNcnpLc2VLWHZneXdBd1QxQkxmT2dWSnBwV1A4WjV2?=
 =?utf-8?B?RXg1TDJzZHJnR1dvSDR3dmlETXJuNGM4RDJkNGZVdU1Ycld0ZE1KNHlFOVdB?=
 =?utf-8?B?NlNuT2t5cXMyeGRHUzBkMjdPWVVGSnE2Q0JSUnZRYlB1bk1hamdxSXRRdW5Q?=
 =?utf-8?B?azZnamc2K3phQWlRekVDQ0hoTTZCNmFkWDB3b1dlcC96bjdKZ1ZVN0NwTlVJ?=
 =?utf-8?B?ejlCRVltTWMwRENMdFdFdFprQS9TbGxUYXpTNHJkUnVLbVJQT2ZBYVMwSmdI?=
 =?utf-8?B?U0t0MUFjVVp0c3VLbFRzMWtOSjJnNThsUXFKTmFDTVVMYWFDZkFxUUtUaGZ5?=
 =?utf-8?B?alBuWFNka0tjRzMvU2ozaENDSWtCSWROblFHWXhmTFNWU3hqTGZIMjlyZTR5?=
 =?utf-8?B?K2RxYURma3crREJjcExtMjBrYkZabXlMVnQ5eVptQWVYMzF6cUpEelVKMkFy?=
 =?utf-8?B?TlN1bm9TQkw1RDYzdWJtaFNxWkYzMytURVFTOG9ERzdkQkcvbmVzc2paYVFq?=
 =?utf-8?B?em5Db29qd0p3S0h3aDduNWNjd1lmTXdCT0NhN2c4UGxpZ3JKc25CM2Z0SDNK?=
 =?utf-8?Q?UPFZhMAT1G/F8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzdaNVBJZ040UkIyRzdkSU81TDQwR3NSQnhDZUpjOExCS1hoMVhpU1RHSUto?=
 =?utf-8?B?VkRmSnA0d29wbisyaVZ6VFQ1ZVFNcXJiR0pBK0ZVQkF6Q2pyeG9PSHFhaDQy?=
 =?utf-8?B?akRrWVAxL0hCWmJzZ0NrNnQ2UzZlMDAwSTh4c0lqNUtQSVNmSjFiazAySzAz?=
 =?utf-8?B?Tzd3L0hxVENKd0xwUXo0Z3ZjYnVjVndWaUxzM1hwalc0VldEbitPRkRVRVc5?=
 =?utf-8?B?dzFHcWdJL2FkUm81WG9xRVhsZGtSd0JRVktoTGVndVZTM1ZMVmpWcFcrZzMv?=
 =?utf-8?B?TlMyMC9wUzVNR2NvdCtaVkNqWEVyNUhpd3BEejQ4V3VvQy9BUXN2OHlUTWZa?=
 =?utf-8?B?QTFjTDJEVjZsVkZqaVpLM3pzMDdTMVV0SmxMMnBoSzhDTWJtdXBrVllMeDNR?=
 =?utf-8?B?TmJEZHJYaUtBdEs4K1hzZFdWdWhuQXk5aEJ0UWdVRnhYekloaUlJVW9TTVBy?=
 =?utf-8?B?ZEFMTFNyOEhVQ0RVTWVjb1c0QlhjVm1qSU9MRU01aU9BejlGNHJXTGxmZ1lh?=
 =?utf-8?B?cVJEWU1yUFR5bTVFa2w5WnJtcGZBOUltT1duampQZnlNT1JRQUdzOXphNnJr?=
 =?utf-8?B?VzVFSWNVSkdCWWU5VHA3YThLcmZLd2h6QWxXaUNCVzA2K09DTTFCRTY2cUdD?=
 =?utf-8?B?ZURoNW4xSjBMeGFaNmQ4QnYraE5yQnBlZ1NDanhROG1Oam5ZOElyVDg5bU1E?=
 =?utf-8?B?azRtMU1lZ1NXelZoYkgwYkxlYkJBSFF3QmJzZGVkOWFUbkoxaHR3amZLUUIv?=
 =?utf-8?B?OUxHZXA3bXJ3akliY2Z0Tm0rVmQxdHRZeWE4VER0Tll0aUlxWndhN0VSeXpF?=
 =?utf-8?B?TU9HN01nOHhTZWlTM01wc25HVy82WEFCaWYvRld4ZG9mOFFCcVAvWWpBQ0ps?=
 =?utf-8?B?M0hhRDVSUDhxcE5BcFRld3VTLytzMXZ0SDdXNm5VejY1NDlnZFdVQnBZcXR4?=
 =?utf-8?B?aGora2M1OVEwTFA4YjZYVmx1UjB2V1ZYUzVhL1VwdTZMeXRHWmdCbUpXKzU0?=
 =?utf-8?B?RUVLMjNrUjczRHNCZHdRUUNzMUFKR0lSRTdoRGlxVlVYQThVampXYWZiOU9w?=
 =?utf-8?B?M0tWcHQ3SDZXT3BGeVExMysvajNZdklSeVY0SmIyYkZSOW80ZERscStiVHNi?=
 =?utf-8?B?Z0RwZGRSRVVESFovV3RqV0k5RWRHOWJOQUdNcFB1RFNuczlTbXQvOHBLUXMy?=
 =?utf-8?B?L09iVE5Tb2ZLblVkc2tQd005amJyWko3RThnY3VzRVhDQjhVeTJTQ2d3NEx3?=
 =?utf-8?B?bHQzZzZSYXhkbEQxQTlMMEwvbmszdi93NGdTZURlS1pMaENacVpFdUZDbEpU?=
 =?utf-8?B?WE9ZbjRLYndBbzE0WlNwWHBRb1dGSWppYVU0bW5sNFB6b2xJdzc5ZW1JZGdi?=
 =?utf-8?B?U1N6T3RKZ0VYcHVkQnY4RXVTUUVZaFpLQ1pDOFlyeXJWM1hkR2ZYeExkSXhU?=
 =?utf-8?B?VnJVUmhodGsybnpBRVBQbUZKQ2YySkYvSjVvSHB1VFdDTVdIMzdVdWVFVVF4?=
 =?utf-8?B?b3p5RkhGVWtXOW1KUVM3bU9UNm9QNVZBdFpHVEVYVnBQYmJOZWJXQ0IyVlR2?=
 =?utf-8?B?ZjNSRTNZbHdMa1k3Sy8vKytNeGFIWGhjbzU5MHJ6QitBb0U1UkoxMktPWEZi?=
 =?utf-8?B?SUNwdW9VV00zRHZrWk9GTFNBMUlPT2FZN0ZYSTM3VkpROWgzaGt4OE4zeWJs?=
 =?utf-8?B?NTY0dlh6RW1CRVdkTDJpYUxISXRjT0pVZXBaM0FnY0NWVnpjNzEzTUl3b1RI?=
 =?utf-8?B?ZmtYTTY4aGRvRDlaT1hTRFpiQmdQYVduV2RHTEU4dmNjM0VyOHBNTENUdVM4?=
 =?utf-8?B?bWRxR2lpMVF4K3YzV3RERHgwcmw1YUN6VEZLbDFFVUJyakdwSkMxREVoQU5U?=
 =?utf-8?B?SlFtcW5naCszVERVUlpkVDFsNGFUTW1FU1d4Lzc5NVlHRHdyVDRQWk9mRWxS?=
 =?utf-8?B?OVNnNmN3Wk5Ja2tTYjhBWE9LY2RLZlJhZU1LT3l4bHk5eWNPd0NQMlgvUkFx?=
 =?utf-8?B?cHlqOXhGVE9UdXljSGszcWlNclhyVDFlc050LzFubE9qQk5LN2JJNGdlTTFQ?=
 =?utf-8?B?ZGMwUit6dGt1VlFDZWc1aE9IeXNnTWQ3ZFlWMzhZTENSNm5NMTFKRVQwdEU1?=
 =?utf-8?Q?/tIt9seVFVz5CE4TjPkFsZxw6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fae479-085f-41d4-fc86-08dd67974a8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:09:24.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LB4IY1IEFgB+GINlOmgLwSo/v2aKrBY/VSXGXfDZUaBtE76JiK9PWDcBDBgC9Rss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
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

Am 20.03.25 um 10:58 schrieb Pierre-Eric Pelloux-Prayer:
> Log fences using the same format for coherency.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Oh, good catch! It's like a decade or so that we switched to 64bit sequence numbers :)

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index a4f394d827bc..d302c68c1258 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -168,8 +168,8 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
>  			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> -			     __field(unsigned int, context)
> -			     __field(unsigned int, seqno)
> +			     __field(u64, context)
> +			     __field(u64, seqno)
>  			     __field(struct dma_fence *, fence)
>  			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
>  			     __field(u32, num_ibs)
> @@ -182,7 +182,7 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>  			   __assign_str(ring);
>  			   __entry->num_ibs = job->num_ibs;
>  			   ),
> -	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
>  		      __get_str(timeline), __entry->context,
>  		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>  );
> @@ -192,8 +192,8 @@ TRACE_EVENT(amdgpu_sched_run_job,
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
>  			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
> -			     __field(unsigned int, context)
> -			     __field(unsigned int, seqno)
> +			     __field(u64, context)
> +			     __field(u64, seqno)
>  			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
>  			     __field(u32, num_ibs)
>  			     ),
> @@ -205,7 +205,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
>  			   __assign_str(ring);
>  			   __entry->num_ibs = job->num_ibs;
>  			   ),
> -	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
>  		      __get_str(timeline), __entry->context,
>  		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>  );
> @@ -516,8 +516,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>  	    TP_STRUCT__entry(
>  			     __string(ring, sched_job->base.sched->name)
>  			     __field(struct dma_fence *, fence)
> -			     __field(uint64_t, ctx)
> -			     __field(unsigned, seqno)
> +			     __field(u64, ctx)
> +			     __field(u64, seqno)
>  			     ),
>  
>  	    TP_fast_assign(
> @@ -526,10 +526,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>  			   __entry->ctx = fence->context;
>  			   __entry->seqno = fence->seqno;
>  			   ),
> -	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
> -		      __get_str(ring),
> -		      __entry->fence, __entry->ctx,
> -		      __entry->seqno)
> +	    TP_printk("job ring=%s need pipe sync to fence=%llu:%llu",
> +		      __get_str(ring), __entry->ctx, __entry->seqno)
>  );
>  
>  TRACE_EVENT(amdgpu_reset_reg_dumps,

