Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F74ADEED1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A999F10E1EB;
	Wed, 18 Jun 2025 14:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qDbzp6iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C403D10E856;
 Wed, 18 Jun 2025 14:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLVEWtkUXPk+IvCmejsUdcqJh81zKX1MdgAngHpbQw8A6fToNrjKI03NvEBuo9VGTSJT/kbq0p3twVp7980mRl6pE4txy36tJJGbDRLbc3D+AGjruAQGy1LLi1zThDkFiUaSUfRLxVHuzCcyz4KmU3qUkCc4tLNifnkfxBOTyUMve3WjzQ2boXU15vCNqMa5bVn3kVxasn6BvZjDqhK3K6JmDRo9zik07KfLWOR8U6ln2BGkPoBw4s4V9+kv3EZiZ4WfzfGEZb4iRG4BC7SM/MSg/LtO9KJJqPnv/yIMfFzh14ltiH2dOv5ycxUF8BN/8mDQHpVIQw0dVRebIpKELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPRmus5jO8nrt/MZEQ42oxNCtuUONqlHMlrPUUQA17c=;
 b=LrfH8ozYkEyWTI84i1nNhaNGY3DAitdodDjDG7cvSCAqljHJ+fIAobgNHxM9EadAHBDFql2tVyxSv71yVyUtB1+1FBScX0dgtSSk8KVf1NNbHGFgqhQ/c0Ieg656eho/y5LnJgIWZzsGXIWA0waA0UmGDTpZF1Q90uh1dUKP58LyHGaaztCowEzeVTxyiTs/6QVBk0JYvE7mJf03oVivtEBGYtg5i3mRDYVlyCibGKEhMLFy0v4q142rY6PyXvR98/RDNM0lOZl4ISHsQHBsyotBXych+yl+HmhaGsZmR/1SwAW9EKEKJR047a8BmErZDL/I73cXQizijge7GfBOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPRmus5jO8nrt/MZEQ42oxNCtuUONqlHMlrPUUQA17c=;
 b=qDbzp6iVsZHdxzQzJvZXul5WqfUNStlckQaF5fd4ofq4LU5mkG28+UbGAwVuMlKElCdpuLgl/8XR1Rx8gJNN8uv0C9GJ80aaOvqfz/c42ZZp6zCh1AGgD7CRJFZnzv7R8mYA/+wdkjlhM4IlR5qcMnxlxDE3OzfArb3KG56g01g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 14:08:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 18 Jun 2025
 14:08:05 +0000
Message-ID: <752cd912-b4d2-4ca1-84f4-70aa95c4e97a@amd.com>
Date: Wed, 18 Jun 2025 16:08:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250618134747.3893138-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0058.prod.exchangelabs.com
 (2603:10b6:208:25::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 01110875-3e0c-43ab-203e-08ddae718bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzNJdTJhbEVXMGt5QlRzTUFGSVdybVl0YitacGJ5NFJNeGtYNTQ0cEwzell1?=
 =?utf-8?B?VFdrckZJS3B2L1ltM1V6YkZLeEw3cmQ1NURMZTNGbkluQnRmYmlQd2lWT0NJ?=
 =?utf-8?B?b2taUWNuWTcycTFUZGlZblZYajVVMnphY2JXQWFDcHhvSm1tdmx0clZvUXYv?=
 =?utf-8?B?cmVyUmsxdWQwdEhpUGl5YURYanNtS0dsK3Y1WUpPV0Jsbkt1OTFKNkVoVFcz?=
 =?utf-8?B?SlFicXQ2cUl0c3NQMVJEVUtaaW51cXJiQTRkWGlacE9NeXlzMStGVVRkUDAv?=
 =?utf-8?B?SjlHQVhuTW5ISEU3VUpLMDlkUjZYMWJiRjVFQVFqS1BsZXhLMUt1aXI1eXRn?=
 =?utf-8?B?cXBuSEphWjJUV0JCRngxZ1RDaUhPb0xjUS9YY0NRWjhlYitndnkwbHI3TlJ2?=
 =?utf-8?B?eTlCRFpvK0NnWW54Q1ZHdFlpZVNOUDRTMEhUcjVFb2x2UVVBbytKU0NKRXJx?=
 =?utf-8?B?bHFKUFJoeVRXR3FUaVBwWE5aMllURXhxQ3FYRE52eGdRaVNrbHVNcHExZ0Rn?=
 =?utf-8?B?b3lpUUY1UDNsNUNNRHV0ejZqOE8wdnlvd3RPUUtxbWU1emVFcW0xeWlEVzNy?=
 =?utf-8?B?Snk3dDJnZElsRlA4Y0MvWFMyWGo2SmhwdGFGZkY3c0xKTzN5ek96eWI5dk1m?=
 =?utf-8?B?TzBMSStmQzNpREdnaVo5cldreXRLWDE5MjhKL1lYKzhVcitFNlcyd2N1L2Ev?=
 =?utf-8?B?c3VJa2hic3A0WWppSzcyNjRVYTBjLy9yVkwvS3RrWitsTWR1QmJVVW52NE1y?=
 =?utf-8?B?bTZ4SzdRRjNoaTRvU2xHeDhFVFVkbFNnY2I0WEJlYUJRTm85MlhVdFFWOHRy?=
 =?utf-8?B?U3JmcDdsUmpmQmU4WmNTUG4rN0NmQlpMbkRXNDZwQ3drTEpXSnF2NDZRL0Y4?=
 =?utf-8?B?SnJvR2EvTDBiZDlWb3JHSUtTSVM1RXdTMEhiUCtrNnZodG96ZzNlbmxWUFpx?=
 =?utf-8?B?cUhPL3JrQUt6RHJseWtXRjFtMlZEL2tHODVLKzdMbTRDVUVQRkRqTXk0UW54?=
 =?utf-8?B?Ym1yUHhSQitYS1Ywa2NGRnQ5dStyZSsvMzVPbVhvNFh5eFdVQnBIdk5yK1Z6?=
 =?utf-8?B?VjNsNDViTDJ2OTVmbXc4MVVlRFVCUEZLUWl0VFJ3R2sxM1dDVmN0NWVZaEp3?=
 =?utf-8?B?NHFrU1U5dmhITEp5QXJKaktvVDVNSTEvNE1SQVFFL1VaRW5mNWI4QjRseS8w?=
 =?utf-8?B?dTJSclRzVWplMzd4dDdXK25rcU1hSW5kMFh3UkNpdTZSdTN2Nmw3K0Zndi9Z?=
 =?utf-8?B?UXo0WEZUQk1mTWViNUt2cUZDUjU0NkZYbGFLaXJmb0ZoSnh2QnRoSWJHY1cy?=
 =?utf-8?B?NjB0amljaFBwN3F2UkF6S3JkZ3ZKb0F3RGlLVWQ1aDJYVWo3ZlZ2NWhKcmpV?=
 =?utf-8?B?ZUwySDU3aWlLV2wrRjllUWVYMVp6THdLOWg0RW15MTVtNm5ON3hKQkViNFlG?=
 =?utf-8?B?T213UW5oTkV0STluOFRVNTVScUZvMGNrT3RFbGJXTmIrVEpTYmVqV0paZlZP?=
 =?utf-8?B?MjZPYXdlT1dmcHJBVTRkUWdEOGpONWUraGVvQnJyVlk0TkZVSmk2cWhWMndi?=
 =?utf-8?B?RTRoVmNZNlJ5WG92QkdQampxc1lOOTNYOTdLb2tHREJBTEN2UjQvZWRJMi84?=
 =?utf-8?B?OE9OeW1ldFVqMjVqdW5LTGhKb0EyZlh0anc0M0w1dnY2RVNkS1M0eVNJZkti?=
 =?utf-8?B?NkpFTjZJK1FaRFdBK1RSVGVqVEpJUEVtcERibTEwc3RKb1l1UC81Wm0zWllO?=
 =?utf-8?B?MEgwR2NHVjkvN1ljTml1dW9qQWRQa3g3L3NtM1hJanV5VHhmZS8vNUxmaklh?=
 =?utf-8?B?UGVEWWZyYmZrWnJqY0tSanFIdEkxaVNVZHc4TzJhT1IzZzJIZVNFV0J3cWNr?=
 =?utf-8?B?WThDR2lyN2htYWUxS2g3YUNrNDlUUVVsa2JPU3NFcVlqU05yUzE2czBZclBP?=
 =?utf-8?Q?k71XUk5WAGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhvN3VCWDhpUzdSTG5ROEhVVkV6WmZmOWluV05LK3g2c2NGODVlZUdGbHFy?=
 =?utf-8?B?Nml1ckE5WmRXeDN3WW5zRUcvQkdsOEs5enlKOEtlaFFYUUsxeU1pNm5jcFN4?=
 =?utf-8?B?QkFUYlljQnRCcTlxbVdSWHArM0ovbXM1K2JCY1Y0cG1kZEVhTmtLRW12WCtz?=
 =?utf-8?B?UmFURytLbEk5NnJ5UldKSEZDRlF4cGtQUHF5aGxKYjhtdjFnbE5zWTFvcjV3?=
 =?utf-8?B?RHhyeVRQV2hFTXFjcEdMbDk3UyszWU5rVW9lQXZsbnNkRUsxbUxoaUJNTXlw?=
 =?utf-8?B?TCtTVjNJcS9hOGoyemhKNWxZbkVpRzF0Wjg2OHU4TXdFVlIxVDJtb2ZiOGVs?=
 =?utf-8?B?NHdzcGQ5Rjk5VWIrbnRLak5jWnJObjBZZVd0UWpTTmlqUjRSOVRpWnhkZXA3?=
 =?utf-8?B?WHY1bFFxL2JkVGJsZmJRR3YrazEyMXhtOTBONGROWUdqMXh0dzZmdTJleVFn?=
 =?utf-8?B?NXJPUWxRdVg4Zlo1V2djcThtem9GVmhvU05zcVpWYU80Zjk3QW93bGhhM2x2?=
 =?utf-8?B?NUttLzBVMVh5NC9YSXNhNHMwOGkvcHBjbmF5V1ozck5ERHY3ZWN1cmNvckpz?=
 =?utf-8?B?RzZ3eVdJNWs5SUp4ODdwMi9LcldqZTRvakJKVkljNVUrK0U4OUZjWDJFczNp?=
 =?utf-8?B?NTVoeDFlYjNsbXc2eFF5T0o2OXhTaHVEK2dWRGdtSWtGNGdjU1pxMlphLy91?=
 =?utf-8?B?MGFxa3RCRzJscFpqOGhrY21xQ3hHdm0yVkY2eHVBcWtOL3ZKSkhHTWlMUUpM?=
 =?utf-8?B?UW9kcDhtUTcvemhXUVM0ZVQ1cWNkQkk3Q094NnIzOFV0a0l4VENQQTZIWnV0?=
 =?utf-8?B?Z294cC9oQ3MwYUxwWnJIaFk5WW1lc0tkM0NoZStpTnROMVdOdmJhdTZ4MmtP?=
 =?utf-8?B?NFB4Nk4rSjB6S0ovSitLN3ZMTEFwMWJxRWxpblMrdVgyTEdSbDRtOHRpb2RI?=
 =?utf-8?B?SWtuTVpROXplbnhCVUtaTjJwdUc0eGYvVlRzRFBsTEJLTnZmZXgvSXRYMjNp?=
 =?utf-8?B?ZnZqVW1nRTl3UmNYVTQwQVFWcDhsKzFYL0kzb01zYVJOcTFIVmZRZlUrSU51?=
 =?utf-8?B?bUNTbGthb09kZG5kamkybWRxS0NyZEF6Z05RdU1OU3dDODByRzk0NHNzR0pN?=
 =?utf-8?B?TVBxMW45NGMwVkU4ZXNQQWY5VVRSbWhOV0Y4VTE2bnhnNmMycDJrVFd4YUpI?=
 =?utf-8?B?TFN0N3lCeTRGaXRleWdJeGlKOEcxVCt1MEN3R0ZMRTFmY2xlbFg3STBZTEJ5?=
 =?utf-8?B?b2taUG00TVRVL2oxWm9SeGdIQWRrSFNDeDhYeTZkT3o1L2htZVdzT0paMldR?=
 =?utf-8?B?cjJiQ1N0L3dzaWQ1dlpORVk4aUx5c1JoRlJQVWpJWjVFYVR2aU4yeFRLVW9l?=
 =?utf-8?B?Z2hmYStKNDdQQ3RUSlVDMllCWHRNYVkyYzF3Z3Yzc1krdEh0aW5CUXR3Vzc3?=
 =?utf-8?B?ZEZLbENuc0tudnVvcXJhNVlCMk9rL0crVTZSSEdCUmJZd1V4YVpLVThWZkhM?=
 =?utf-8?B?MFFsZGdTVE5yeUQ5WG9QYVlvakVjWHZSL21HbEJUZHJjMVdQejRlbHBJTnFH?=
 =?utf-8?B?UkpaMTRralU5Zlp1em5VTFR2d2V5V3d4byswZEQyN2w3cldvMmNrWHdDL2Ur?=
 =?utf-8?B?UEYzYW40bU9wNkhPeEwwRW9wRURlSWkwQ2duZmZoeDFOalhqc2tOM3Urc2s2?=
 =?utf-8?B?QWZnVzRrUGphYU80a2NIUlpDdGIvZGhMeGJ4ZVlEMUNKbjlOK0x6dkVFQW01?=
 =?utf-8?B?Y0ZwWDNDODZZUGhMcEpWSGErRUExTUlaYSszS05VSUdJeXVTNWN5ZFc3a2hY?=
 =?utf-8?B?OWk3SkJlN2hDeSt6a2h4RFRaa2F0VkZoa2VOblRNSHNML0xRMk5xQ1Z1SW5J?=
 =?utf-8?B?VXFxa251VmpVOVNzbUNaMFhUZlo5ejZWZzBLaHZwRkNURmtXZmMreWJNcVZj?=
 =?utf-8?B?U0RmeW5ucTZMenZjL1ZxZ3dtaU1FRnFWc3V3Um1YdDRMRnZpNXZwOWNVL2tT?=
 =?utf-8?B?UENOQTNVQ2FYVkFZM2F1N25oNmtaRko3ZW5TTVB5b2p6bzF0VVAyMXlOOHcw?=
 =?utf-8?B?dnlIaEJJNlJrKzBSWGlMb2FlQjc3TExLbU9uN3NZbDl1dUpPQ2g3UFVia0V2?=
 =?utf-8?Q?fRgPRtGgkEIyeQb55Ha9gRqtr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01110875-3e0c-43ab-203e-08ddae718bd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:08:05.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/GjsXhv4OzNH3po26ciKCM/6h9DE2zIvnULkNsbsYFvMI/EPfTC3lwTu/lFQNds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290
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

On 6/18/25 15:47, Sunil Khatri wrote:
> move the functions from drm_drv.c which uses the static
> drm_debugfs_root as parent node in the debugfs by drm.
> 
> move this root node to the debugfs for easily handling
> of future requirements to add more information in the
> root directory and one of which is planned to have
> directories for each client in the root directory
> which is dri.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 22 ++++++++++++++++++----
>  drivers/gpu/drm/drm_drv.c      | 11 ++++-------
>  drivers/gpu/drm/drm_internal.h |  6 ++----
>  include/drm/drm_drv.h          | 10 ++++++++++
>  4 files changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2d43bda82887..5a33ec299c04 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -44,6 +44,8 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> +static struct dentry *drm_debugfs_root;
> +
>  /***************************************************
>   * Initialization, etc.
>   **************************************************/
> @@ -286,6 +288,16 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_remove_files);
>  
> +void drm_debugfs_create_dir(void)

I think we need a better name for this. drm_debugfs_init_root maybe? Ideas welcome.

> +{
> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +}
> +
> +void drm_debugfs_remove_dir(void)
> +{
> +	debugfs_remove(drm_debugfs_root);
> +}
> +
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
>   * @dev: the device which we want to create the directory for
> @@ -295,7 +307,10 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>   */
>  void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>  {
> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
> +	if (!root)
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
> +	else
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, root);

Ah! That is also used from the accel subsystem, isn't it?

Probably best to move accel_debugfs_root into this here as well and distinct based on drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) where to create the debugfs directory.

We probably need the same distinction for other use cases as well, so probably best to create a helper function for that.

Apart from that looks really good to me.

Regards,
Christian.

>  }
>  
>  /**
> @@ -322,14 +337,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>  		drm_atomic_debugfs_init(dev);
>  }
>  
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root)
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	struct drm_device *dev = minor->dev;
>  	char name[64];
>  
>  	sprintf(name, "%d", minor_id);
> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>  							dev->unique);
>  
>  	/* TODO: Only for compatibility with drivers */
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..8abc52eac8f3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -69,8 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>   */
>  static bool drm_core_init_complete;
>  
> -static struct dentry *drm_debugfs_root;
> -
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
>  /*
> @@ -183,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>  		return 0;
>  
>  	if (minor->type != DRM_MINOR_ACCEL) {
> -		ret = drm_debugfs_register(minor, minor->index,
> -					   drm_debugfs_root);
> +		ret = drm_debugfs_register(minor, minor->index);
>  		if (ret) {
>  			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>  			goto err_debugfs;
> @@ -754,7 +751,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>  		accel_debugfs_init(dev);
>  	else
> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
> +		drm_debugfs_dev_init(dev, NULL);
>  
>  	return 0;
>  
> @@ -1168,7 +1165,7 @@ static void drm_core_exit(void)
>  	drm_panic_exit();
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
> -	debugfs_remove(drm_debugfs_root);
> +	drm_debugfs_remove_dir();
>  	drm_sysfs_destroy();
>  	WARN_ON(!xa_empty(&drm_minors_xa));
>  	drm_connector_ida_destroy();
> @@ -1187,7 +1184,7 @@ static int __init drm_core_init(void)
>  		goto error;
>  	}
>  
> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_create_dir();
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..d2d8e72f32d9 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_dev_fini(struct drm_device *dev);
>  void drm_debugfs_dev_register(struct drm_device *dev);
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root);
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>  void drm_debugfs_unregister(struct drm_minor *minor);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>  {
>  }
>  
> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -				       struct dentry *root)
> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	return 0;
>  }
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..4e77a0c4a7f9 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -567,10 +567,20 @@ static inline bool drm_firmware_drivers_only(void)
>  
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
> +void drm_debugfs_create_dir(void);
> +void drm_debugfs_remove_dir(void);
>  #else
>  static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>  {
>  }
> +
> +static inline void drm_debugfs_create_dir(void)
> +{
> +}
> +
> +static inline void drm_debugfs_remove_dir(void)
> +{
> +}
>  #endif
>  
>  #endif

