Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C165695C5A3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 08:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F335A10EBB9;
	Fri, 23 Aug 2024 06:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zU9HNNmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765C310EB54;
 Fri, 23 Aug 2024 06:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x63kiYIIDF2tEvm7TTRCwCuqgWdN74oy9xHf372OoEEmA5utkW0l5GHhmqZbD4/LHdpCEmfSl0zQxPo6T9eW2N8FmfB1DxsPVnqklaNeeC/Ppneo2zaprhGPiX4CY50UL72KVNoq24wBJZCIO5mfzsevoKotBV8lYMf2kjIhaYx4WxAOjoLhfqV2OtmFhJD7hadsi5rbu0yZ69LVaIR819BBh1YE64YrEEimiEMS7D6aIZPbmrqaGVQr/Gvm+nMeCPY7k7gtcLTBEs8L9qJkkizuoHosA6xerhCZ9+nff/C3nmKG7Dg210YxOJxSNJVFdIY8IjNPLAfhBcyx4vEGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTQZEWTTcpgL8oU7EAwVQ3Crp9aw1nVNzZVj2j8QkXc=;
 b=LGoMdlTWFt1P49wWCiStMzCjQ7qYK4PRjbEwpnZ6gokRSbekI1IxWMITD6tEoY/IcRCd08LGsESAi9WIC2DlLTEwCGxdFzg0hugxvDL3xPDy1c6y9vVQ6HcXafp86QHjWEywt5GVihGR/Untzc/RmOQ5rSX3ZF2wXkDhHSw0jntYewAzP70PfVtCOS18msjZ9/nsxi971aj7kO8sy/9VukbtfFHJySsWXDVRrR5Huv38zpaS9I3vsckWYzR9AQWkR6f9jMvdncYRsnxEbtc/kCJWZJbGv/L8KTQqeqY0aImjzKZ1s8KnjQrhV309wT/7T5iv5sFbfqg5BSXfQtd9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTQZEWTTcpgL8oU7EAwVQ3Crp9aw1nVNzZVj2j8QkXc=;
 b=zU9HNNmhH6IErgc0RPM5cSSxNW/daGGz7lHhb7TEQeKgm1olL2BolAJlAEeWWkzNZwV3jTWe08+ZPD5udXUZEMsjC2mRdvQ5HIFuL5BkZd7YQU/wJxW/KLNwXsvNzbxC122Q8eSxTrlWXRYbdMJB1HM+zZsnd4Z3vc9fYBsNQvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 06:40:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 06:40:46 +0000
Message-ID: <2657940b-90b3-4abc-9f56-f6c6b70563ec@amd.com>
Date: Fri, 23 Aug 2024 08:40:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Use dma-fence array for media GT TLB
 invalidations in PT code
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org, daniel@ffwll.ch
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-3-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240823045443.2132118-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 89453b3c-7f05-4bba-89e4-08dcc33e8494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFlyWlRoeHNjanNTajdqM05UdUNEWnlyc0NaeHVnRUNiWCs5d0JZZTlnUmVD?=
 =?utf-8?B?bWpOQWRqM0MyVmFVYUpWWmpNeUxvRnMrS3NHL1lUeDNJVnlUTnM3dUFobTdm?=
 =?utf-8?B?NHhSQ2Z0dU1iTlFZZHMyS0hRUFVRRDc3dW94VFRuYnR5RDJwekdSd2ZnUW9o?=
 =?utf-8?B?N1dvaTVNRjJOWWVIMEpWOUxNZ1FpdFVzTDdndTBBOXBEcEx6dGhLNW9mdjd0?=
 =?utf-8?B?UDRUU2tob1Y1UDRtemt0SGxPamNxSW1ueGtnTmZiVjlKcXlNa3hMZVRwaHpX?=
 =?utf-8?B?WXUyYkN2UzU3UUh6WjV1YjgybzRIVWZnMG9jWk9wZEsrcjVldllETzM1UnAz?=
 =?utf-8?B?eVYwbkh2dWhWcG9ib2JkVVhjdzhiYitEY0IxMkdLbW15dTV0b3VwQUhIL1BG?=
 =?utf-8?B?eHh4RElNTUdqZllySkx6WGVpS2w1aDNXUktmMW5wWklLcmNuckZnUXZKZ0R2?=
 =?utf-8?B?R2g3LytlekxnSVcvWGhHejFic2ZZemlLN2FLUHFWbjNzcGhXRll0c1l4VDI3?=
 =?utf-8?B?TkFlQzBkL016ZXpXd0llT0pmNVlFb0F5SnpXR0hLSC9YREQveitEbUIybzhn?=
 =?utf-8?B?ZUFhckVGZElhc1RpaCtvVDRWd1Q5WWdVdWNwYnBRWHBqbFpEOW5mODdTMVdU?=
 =?utf-8?B?M3NabjZ6aWFxV25DMXFwc1ZhNnhWUWpQSEl6MlRUanpRS3lkSm1qd0dzSlph?=
 =?utf-8?B?SWZ1UUdPMzN5a25oS0dwMCtTV3VyRFBRdDRTZ2FwY3M0cE5yRFhYTDdvWUhM?=
 =?utf-8?B?R2pWdUhaK3B5NmthMGc5eVNZYXFPb1dncDF0M3QwOEI0M0ZMSjFFa2tMN1NY?=
 =?utf-8?B?dVY3OTJxMUlOMEhncEFhSVNyWitWR09VRlZCcEhudHBrMEc5OTc2aVhVU0JV?=
 =?utf-8?B?RG5mQ0sxeUFwOTRlalN1V2lTVUZTV0x5YTZDL3lLQWJyUGJ2UERXSGNodGh0?=
 =?utf-8?B?bVRyQVBnYW9QUDBNckUvM1hVRUV4UVhSTFlZQVRweHpMS0ZRTDhjWkwyMmgw?=
 =?utf-8?B?dUw2dVVTTW9zS3JKSHljV0JBNFBHTzRNNHZNWFNtM1F5RXo3TVkzeGYwdTFy?=
 =?utf-8?B?aTQwQjBWZ3lsQzNuNkM5UGFPMXBCOVFwMWVpeGVLRGpETjFKdFlPRVRQckkv?=
 =?utf-8?B?OEhTbUo3bk1uRllIUGJSRnFYSVdsWmsxSDF5RzUyN2lMNzZFUzRDWndQeDls?=
 =?utf-8?B?NXgzYWpmSjRnZlcwYTgzbXNvZHBKL3h4UmNjM2U5Qllob0xLeUJIRGZ2bWtr?=
 =?utf-8?B?WlFtdG8zWWVJWmd2aG94VW94UHRuazhkb1MvUUJTbTcraFRzMFhjVGs3NGwz?=
 =?utf-8?B?ZWpKN2ZxSmt0N05DV2xGdzczWCtoZWpIVDlHM2ZqeU9DWEltQjJaSExTRGNQ?=
 =?utf-8?B?TUlJU1VIb01lankyOFJHU3JxckVCTGNDOHJ4eTVKelhTOEI2cEhyT0g4VVVl?=
 =?utf-8?B?end2Mm9udVJVaVNjU09OTTJ3WHVGWkh0TG1hTE1FR3NGcXhGRVhKYkVJNFdI?=
 =?utf-8?B?blYzekloTzk3UXo4ODZody9sbE5VM1Y3dmNUZDU3YVlYQ0psaHpTRkJSQ3g3?=
 =?utf-8?B?L01XcEZva3prVG9ZS0JEeTlmL2hhaWZwdW9oL1ZaUWRISkZsZkhjYlU4ZUhC?=
 =?utf-8?B?MTFyZEtvWFdLUXEyMXBXVm9KWEpEMU81dXN3ZFdsV1hjR0w5QTBNck9KSldn?=
 =?utf-8?B?Yktob0FUYkREN3dGeEpUcmVPRVppVHFRMzVRNmlQeS84V0txTDNiQlN6U3l3?=
 =?utf-8?B?QkREQjlGaGZvcnFyZUsrSlRZYVp3SDJJQ1diU3VFc2NlM0VqV0NoYzlFSHpR?=
 =?utf-8?B?YlJJaW40aStUVzlSbW55QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUg5Y0Yvbms5SUlKOFZnaVh6cXVuS1NDOVFPam1peGRVb0VCdVhIYitlQXZt?=
 =?utf-8?B?SDVBZmJzcmlNNTYwKzdjQ2VVS09yK28vTkRrYTQ1cS9rTS8rWnd5a1VDbjFZ?=
 =?utf-8?B?YjYyNUxGRjNBR3Bydzk2SU13NUFTdWJKZmNWU2NCTW80a05tNVZWNVVBUnN3?=
 =?utf-8?B?cERTT1pMVlM5ZVIzUVFMUzl2djVhaDNiK29sQ1BpdmxzL2Z5SE5JK3pSbmZM?=
 =?utf-8?B?STNUVnBFYXpnQm9XL2ZGTXF6TWlGTTZrMnpBc1JqUHU3b3ZlREcvTDFCTERh?=
 =?utf-8?B?YjIrZmcyenpGN3RmT2tHbi9oaWttanA4R0pTdWtrNEUvMjUrSVZPbW8wMWt6?=
 =?utf-8?B?RkdzdVJZZU53bE1Hd0xIWEk4KzdIdGdtbmJuT1AzUUpMYzF0VXZTOGZYUDdt?=
 =?utf-8?B?bUMwKzA3NENWQS9BcUxyYUVjSjhhNUtwZWg1YlFsR0pvT3pKT0l4eWJ2VHZ1?=
 =?utf-8?B?UWVwT2hBNWF0MXg2VWtmUTE2MG5nRDZHRHJnc0ovZXRUVXNRbnBXUXZWQ1F6?=
 =?utf-8?B?Y1E1L2Vld3FBS2U2UjJZbDMyRTI5c1BiQnJmUVNQaC81M1VuSFVPTTgyOWRv?=
 =?utf-8?B?dFNkQXk5elF2SnJnc1g3SUpLbXNFN2VpcU5QUDVIRTUxZ3prM09wZVF1LzYv?=
 =?utf-8?B?NG5XT0E4aVdnUU1xaUJPWXExTUdwWC80RUdqMFB1aityVzR5Zk44MzZvQlR5?=
 =?utf-8?B?OVV3dnRXZS85RGNnOE1CWk9UN1cva2ordVhGSGxteE1mNGZWK3hRblZWWUw1?=
 =?utf-8?B?bmMyQ2dsWk1CaGwxRkFFZGdBSjdSN3NlRkxreDltVGtEdEhpd3VpMG1NSmFU?=
 =?utf-8?B?cjJxTzhXRzB1TEQzYmxrcjc2WW5CZEx6WUFkMDVmODY3QjFTUU12WWN3V0Zu?=
 =?utf-8?B?Qyt5aGJNK0JUM3A4encrSGxhL2k1V1p0ZFVkUEp0WUd6SXV2L0lIVjhvNm9s?=
 =?utf-8?B?YkZBeWlxS080SkF0ZTRoREpjRXJNSEh3N3V6bENZeWZHK3RxUUNPMzYxYm9L?=
 =?utf-8?B?bTMvTGxWQTNMYkdIcmlKWk16eGZGSVZZQ0YyUE5NWU0zcTlrR09TMGZZU3o2?=
 =?utf-8?B?SVkwOUgxb0ZPbXJYQnZGb1FQT3dzSlFhN01ON0lwTysyUENPY3hwaXUvTEU2?=
 =?utf-8?B?N0t6Q3lKdGh1U1VJdDJJb21WMGdkbFhVdlQ5c01nc0tHQkppc2dxK2RJSWlF?=
 =?utf-8?B?M0Jlc2hHRUoybHZScDRsNEh2anc2b2NPRDJ6cTNIbU1GTWlKdFhQRlZqaDVj?=
 =?utf-8?B?K0grTEpWRjdLNmdhZE5BVzl2d0o1Tk5MYmQyUUFXUTcwNVhRZ1l5L0dRT2hv?=
 =?utf-8?B?YlRMM3hRbS9LbUNJdjVhWDJJYzJsWGR6MUR6dE5JV1ZGeDdTNllUeWZmSGZa?=
 =?utf-8?B?OGRJeTBXdjFQbDBmVThNSTU3Y24zb2dTZjg2MDJFMjdWMzlKV2RxTzM4VDdt?=
 =?utf-8?B?NERLR2dwbkJjNVVtMi85WjcwR1NoUDFiSEw4dENlNzFHMmgzUFJCSStXUUh1?=
 =?utf-8?B?UzdZa1pxQTYvYVRIL0lQTXYyOWRzMGgzZU9SOE4zbGFHNjdsMjNpQ0ZlcXRo?=
 =?utf-8?B?dWtYb3pXS2t3UTM2SjN2SkdVQXpRRlJFUGRnN0hYaC8wZk0xaDZWNGJ1YzJa?=
 =?utf-8?B?YUx4M0RMclRadDlnQTJkcjFzWDdxdE9MWVdJVzQ1RDZLZm5jQlMwcFpJMGFW?=
 =?utf-8?B?eFhoeXUxVDZiNnB1MFZJYXkyRW9vTFFSMWpjQm9HNlNWc2ZpYTFpbXhCc1ZX?=
 =?utf-8?B?eU8xUlM2aVh4dTlyWVJaL1hNZVF2dTd2UGRiYmpjUDZWWENLVDRRcno4UHY0?=
 =?utf-8?B?MTFTTmZKQldRYUxwaFNrR1NBcjRKN0p6ZVVpMUVVdzkvNytQRVVWUXdNY09U?=
 =?utf-8?B?UFFTWEdtdml0NVRSOFI1MXc1T1pQQzdSNFlJdEpLN2lnbExmeUhOTk5Edzdy?=
 =?utf-8?B?STBaS1FIU3VydkJ0dENzMkNyNHlZUDZLYmN1Y21rRGRrcGE1S0pMR2k1VXE5?=
 =?utf-8?B?NXpOZ1BWaklRK3dXaWo5d2pwVnEzaWpwd2U2ZUNQNlFJMWpTZE00cGljSHpZ?=
 =?utf-8?B?TjJXQlV0R1ROWVVOTStNM0l4RFJ0czdvYmpjTnpsODdUemk0M1REd29Ma3R5?=
 =?utf-8?Q?jyUT7N0VLpzlSsc9dXVmHPWlo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89453b3c-7f05-4bba-89e4-08dcc33e8494
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 06:40:46.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: On4Hll+QQPlH0GGZoWS8iKwTuuVPfD6PStAu3dNADrHaeQtTSYHZN5pPMDxKxBU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
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

Am 23.08.24 um 06:54 schrieb Matthew Brost:
> Using a chain fence is problematic as these cannot be installed in
> timeout drm sync objects. Use a dma-fence-array instead at the cost of
> an extra failure point.

Mhm, IIRC we converted chain objects into dma-fence-arrays while 
installing them into a timeline.

Doesn't that work any more?

Regards,
Christian.

>
> Also fixup reserve fence count to include media GT invalidation fence.
>
> v2:
>   - Fix reserve fence count (Casey Bowman)
> v3:
>   - Prealloc dma fence array (CI)
>
> Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 34 ++++++++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6c6714af3d5d..2e35444a85b0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3,7 +3,7 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> -#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-array.h>
>   
>   #include "xe_pt.h"
>   
> @@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
>   
>   static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>   {
> +	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
> +
>   	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
>   		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
> -					       xe->info.tile_count);
> +					       xe->info.tile_count << shift);
>   
>   	return 0;
>   }
> @@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
>   	struct xe_vma_op *op;
> +	int shift = tile->media_gt ? 1 : 0;
>   	int err;
>   
>   	lockdep_assert_held(&vops->vm->lock);
> @@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	xe_pt_update_ops_init(pt_update_ops);
>   
>   	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> -				      tile_to_xe(tile)->info.tile_count);
> +				      tile_to_xe(tile)->info.tile_count << shift);
>   	if (err)
>   		return err;
>   
> @@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   		&vops->pt_update_ops[tile->id];
>   	struct dma_fence *fence;
>   	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> -	struct dma_fence_chain *chain_fence = NULL;
> +	struct dma_fence **fences = NULL;
> +	struct dma_fence_array *cf = NULL;
>   	struct xe_range_fence *rfence;
>   	struct xe_vma_op *op;
>   	int err = 0, i;
> @@ -2022,8 +2026,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   				err = -ENOMEM;
>   				goto free_ifence;
>   			}
> -			chain_fence = dma_fence_chain_alloc();
> -			if (!chain_fence) {
> +			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
> +			if (!fences) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +			cf = dma_fence_array_alloc(2);
> +			if (!cf) {
>   				err = -ENOMEM;
>   				goto free_ifence;
>   			}
> @@ -2068,9 +2077,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   			invalidation_fence_init(tile->media_gt, mfence, fence,
>   						pt_update_ops->start,
>   						pt_update_ops->last, vm->usm.asid);
> -			dma_fence_chain_init(chain_fence, &ifence->base.base,
> -					     &mfence->base.base, 0);
> -			fence = &chain_fence->base;
> +			fences[0] = &ifence->base.base;
> +			fences[1] = &mfence->base.base;
> +			dma_fence_array_arm(cf, 2, fences,
> +					    vm->composite_fence_ctx,
> +					    vm->composite_fence_seqno++,
> +					    false);
> +			fence = &cf->base;
>   		} else {
>   			fence = &ifence->base.base;
>   		}
> @@ -2108,7 +2121,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   free_rfence:
>   	kfree(rfence);
>   free_ifence:
> -	dma_fence_chain_free(chain_fence);
> +	kfree(cf);
> +	kfree(fences);
>   	kfree(mfence);
>   	kfree(ifence);
>   kill_vm_tile1:

