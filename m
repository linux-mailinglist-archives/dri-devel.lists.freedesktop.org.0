Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC254D2334
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 22:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2C410E6CD;
	Tue,  8 Mar 2022 21:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F1A10E6CA;
 Tue,  8 Mar 2022 21:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbAbbg6mTC4LtM7NVFA20Y8gV4fuGs1+DJ5ttb3c9xgwhryZgZCGZ9+Ise/Hil6ELriRaPLUBwpYDP8MfTA0OPnBzFsBop5MtodrQhHRxFLL65jXHo3Bz3hwqgizNmx82jAd0a35TuKk3XttwuiWNvqqHT1SCqS2vw987hQX3hS4VFW579VKUCPrF3gqTis4Id7whWsIuIs/cIhLkcx4VILYDT8l0kN8mnU4aix8AyXTJk97zyiMENiu9F0YHwMqCJYAj0B2j00i7o6JN6mIYSspQsqqsbnQm+wF5cXx7HBewvEfDkeePhoKXoDzYIwpw/AK+pZrmxuaXKWPXTca8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mskRvpMEotQqJnlqqEa4cSmp14KmWZy9zWA731T2LcQ=;
 b=WG9hyHMCle1lgW2AHppBW6Ddlmg/xkPGqDx05KEYLiroJgbFk3G8/9oWDi/DJ6btxdSce4BKJEUiZrMZlF+IghCDEZFUHNuE3mpk8VQlMs5xWQc6bO1LrGleM/8hoqJ2sx2QYuS4ezAp/4IfFMMgF/9vTESll/ijRtKFizUBpOWPzDPYMPCDsYAECnrb3dYUIsMfleMxcfZGq9Zvdd/jwCY8ASQDPCikuSD0ltygbDG6NGZQ3d86tvuT/ZCAaJCWrtJZvfdimhM08J8VVu+gfUBzYFmjPkt880rr2DuCmnRBwTShc57dWyedsl9BXRF9+JPe4XYWIOXhE9IG0P0yeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mskRvpMEotQqJnlqqEa4cSmp14KmWZy9zWA731T2LcQ=;
 b=wLUz+egTGgOd/KRHL3EIt/BjSrcl+4x9JwETmqQTqMAHWP1pNGnvgZhfH2C222rlFH6solGnQ5GdruN6pdG4k0LPjeZYoMoc0/ddKY2vJOfsd5w57UV8CiYi8+dFeEBv3zEUlnidXSrPflJ8ioQ21+KKlPf7igVrag72mYYqd2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB2958.namprd12.prod.outlook.com (2603:10b6:208:aa::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 21:20:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 21:20:13 +0000
Message-ID: <97b16cd7-48f3-dab2-945a-f6fe5cb37955@amd.com>
Date: Tue, 8 Mar 2022 16:20:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220308210818.2864-1-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220308210818.2864-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c41e789-9041-4607-2096-08da01496ece
X-MS-TrafficTypeDiagnostic: MN2PR12MB2958:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2958ABBC49BB0ED3819CA43292099@MN2PR12MB2958.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PN3FrSpXlUFLA6dKdiPnpQaNKy1Y6pTeX7pwKQL/ZNjDhnntSiCXN1Iw6+RnDAR5v3gwAytEjHESFQBH6FigiBWW1+eF2jaRPOz+eUJUae8Melf7nRTTTZUC3MS/oWePFsSo8FgCxMQ3oHJCNGBxFpOydiDSZoK0G3OPwSqkYs4+i3PtXnMavCkwFx44paQq7U3A0+fBiQA99FU4p4sDiBPcIYctpac8wPSgx3gvqEzuefF/UF7LBJzUvygcqBfo6d3KwkDvn0pe74u4REQt/BGXXgC4zzP18I1IEbeKc5TqILF55Ay6Es1M31hKkQABNq1mRQJD+5nPZITx4vXkIdJUnhkpHINKU+n07GhPMHq7xPQEA2YfRjAErJgawiAy7pfcfFeAUOPzeXnD34QdyYpwGI7lHamq2qs9nZPbgM9K6EJ1bDPy6S6gvvJZmmQD39RyTK31trTZ5Lok9sCWp+U0ZCQ/IOm8gHejIAcqQCaZneYCn2mYrT9cnRXEtOUpc4/rGL/iAyUPhKwj8LpQR6/4FuHDpU028kCrnQXtiRjuzsnDt64ZNgakbHSj4ZA5uDrOs9Jx13ysa4tzOI1R8Ogz0euCvhoVOJobVieYs1VZKVv+Pe0NADp9nGAznZ4PrN9C81DVsBFF9j4ePbKJOj5mBcF5XM8bN005FQ8uK9m6saUKVrQtxqKZkw57fytuRvWL6tRMHcH+4MhKN77L6gUOgLXmQa1NY1hc0cDJObK5op2CTEV4UMc4ANBA3I7O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(38100700002)(8936002)(44832011)(26005)(31696002)(186003)(86362001)(2906002)(6506007)(36756003)(508600001)(6512007)(66476007)(450100002)(66946007)(66556008)(316002)(6486002)(83380400001)(8676002)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZoSFBGYlZJNHNBUDk2Tlk0YWhPS1IyMGFLTjEzeHdrcGJQcnFRaVJKajZk?=
 =?utf-8?B?NHBOOWFvSHNIWmpWcHlVNWVLUUhGNWg0VUxMT1d2VXAzS2dwU1NsL0VYbENB?=
 =?utf-8?B?eDBNTW1HZ2Ftek83dWM4Z0dySlBremJoY1JwaVVpR3R6K0FNcno5eSt5enkw?=
 =?utf-8?B?OFp1YkI4bDF2RDZ3bDUyWnJ6aFpZQ3lSdnZoWEFJcW9tQWM0QTFpSjlOK3lp?=
 =?utf-8?B?ME50Rk9EOG15cWMwNnRNcENSSWp0d29WV0ZOTWtpVDNGRkIyRXJ0SExlaDFF?=
 =?utf-8?B?MHMxRjlFSzBaL0RyWEgxUXptZHI4L1JCQkVpeFNpeHVjTmNLckgvK1FRWC9G?=
 =?utf-8?B?MkxyUjRwRkhWSkdTTXNDeERBMHNWayttbXdhVlF5TVhRNVcrTU5ySFJaN2xC?=
 =?utf-8?B?RHpHMEo1bjNPb2dDYUFnMExOVmkycGcwTHc3UHJFaVowdkZzSjVFR0ozY1Qy?=
 =?utf-8?B?N0ZoSFRpWWJHTlFJUkdjTXdDTmJjMkpoSUdiNDh1dVdDNUN2aWlsdkxRTE5F?=
 =?utf-8?B?QkZOMUJaWkhFeG5DWTVESHpSRnJvTVRrcFBVWFpLMk5oN3NKREg3SmUveGNn?=
 =?utf-8?B?dmoxd2E3TU9iTXppS0dtMElCem1wbmE2ZXNCcTVWRG1aeTNENEhCbldjVklz?=
 =?utf-8?B?MjZISkhUOTBpYmxnRUtZaXFoZlZwajM3bVpXbWIzV3l1WkJ5VXYzZE41amxk?=
 =?utf-8?B?aXNHRVdON25SMmlXWUJkZHowT0VoR3M5L2poVmlSVStLTS9QZ2FBUTRSQXRW?=
 =?utf-8?B?WWdCbDVaSVFuUWRRZzRmNy91NTQzMFBDVmtWYlZndy9KMEREd1RLMEgwSkNP?=
 =?utf-8?B?b1N1eDhyWVZOYUc5VVdvT1YvbEQ2Y2NReWxYSVBTbGtwT0RDaUduOFJyUEIy?=
 =?utf-8?B?eHAyM2lhZE5ENEpKQ0ZuZ3NWR2pvbUxPMEZ3OFpmcXBycXpEcjQ1c0lvM0wr?=
 =?utf-8?B?a1JxWjlGRm5GQUkwT04rbnN3bHIwYitjZjlBV0JyZlBZTTZmckRFNUhUOVFO?=
 =?utf-8?B?SGs4a2JlR1pMenJZRFpLRS9EbUJCL1drbHVOYUF4RzRiWUlQQ1hiZlBhTEFB?=
 =?utf-8?B?RklreSs1UHorTFV6KzlIeWlPVWN2VVUwTnFrL3FwaEJIbktPcjZkWHEvbVhH?=
 =?utf-8?B?czUwOFZCUmcxZTBYTTNldlFmekpUTGVoOEdqMmlnVU9LQWIxNVQzcHVqb0lv?=
 =?utf-8?B?bHhTQ2dUSGhHUWp0SzByR3RaRWFZT1QwTXVHSTdYWlRMRXVCbXZOYkwycGhI?=
 =?utf-8?B?UjlObW9xRiswVkErTm5SSHhjM2lmM3Rmc05xM3BpNjJXdFE3NWtmenEybUhY?=
 =?utf-8?B?NVh1VXl6NG44OTlqbVA2NUFyUGZYTHlIWFJoU2UrYVdzY0NSeUZVVVptNHVY?=
 =?utf-8?B?L1ArWWgxRmpGN1hURHdOWnJXU2lMUTRJMWJHS1BjRUhpMmRkN1YzQ0g2VWJB?=
 =?utf-8?B?bitJd21LckZJVFB4SmlYOGE1bGppbmNKUTBwYndDU1FST1p6MkRhNXpoT3Jr?=
 =?utf-8?B?aEY3bzNxeUNleWd5TEIxdDZNaURPcXpaNU12V0lTdHNMMHBSbytOQ1MyeE0y?=
 =?utf-8?B?NWw5dDdYVHk5UGZyNkQ3VVk4U1Q3SWw4MytjaGhISzlIOGlrZXhsSUxHTE5I?=
 =?utf-8?B?SVMxMVlSVHBHMVlXVStEb3FWcmFReFlsV0tVU1dVUys0d25haTZEeFl1eGtp?=
 =?utf-8?B?aVJJR2lLeXN0R2tpbU41VllzQ1hFYzdGdENpMVlkSm10SE85blRUcGxmOEYv?=
 =?utf-8?B?YVRoVDlxQ0VjcHF4SzI1NDNYOGNFZ1lHRGV1VWZNTmdLWGt6ZXZMaEJjYWJr?=
 =?utf-8?B?MU9RVXdoMmU1eTJmNGhKTmdyTEJKK1RvLy9oWHlreGx1RjZMMEJERXh5UUdZ?=
 =?utf-8?B?Nnd3UXFNWjJzUUhiRjNZRlVMemp5Y1hoc0hleUlFS2w5akZ2R2h2K3Mwd291?=
 =?utf-8?B?Z2txL0FUcElyMGQ2dnlpamIveVZ3b2ZmNStIcnlXbmttcjdGY0ZJSVErSlVZ?=
 =?utf-8?B?Ym40eFNvaUVvQmphb3pueTFheVRhdTRFSGpOSWhxQ21XY0pUUFAxU24xL2hj?=
 =?utf-8?B?ZXFPZU5iYUQzSGxNQ1Zvbm1LRGY4eTVEMGd5RGhmK1NjWk9ka2t3cklKa2pn?=
 =?utf-8?B?WS9QUVdtdHgxOVpQKzNxSThQeDV3V3hiSEJsTDRNdzN6UStIZ1o4bW1uMUYw?=
 =?utf-8?Q?wEoLepl1VhSAk4ECfI4nPmo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c41e789-9041-4607-2096-08da01496ece
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 21:20:13.0839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAPH467bAshkMrju1Er+J+EXgT20ymyfV4m9TM130zp9acwMAV1FX7MHop9MpU+L8X5JYvpFuMxwm3r8Pb2i7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
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


Am 2022-03-08 um 16:08 schrieb David Yat Sin:
> Export dmabuf handles for GTT BOs so that their contents can be accessed
> using SDMA during checkpoint/restore.
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>

Looks good to me. Please also post a link to the user mode change for this.

Note that the user mode code has not been merged upstream yet. I think 
this should be the final cleanup before the user mode CRIU plugin can be 
merged with the updated KFD version dependency.

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
>   include/uapi/linux/kfd_ioctl.h           |  3 ++-
>   2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 2c7d76e67ddb..e1e2362841f8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1759,7 +1759,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   					goto exit;
>   				}
>   			}
> -			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +			if (bo_bucket->alloc_flags
> +			    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
>   				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
>   						bo_bucket->alloc_flags &
>   						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
> @@ -1812,7 +1813,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   
>   exit:
>   	while (ret && bo_index--) {
> -		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
> +		if (bo_buckets[bo_index].alloc_flags
> +		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
>   			close_fd(bo_buckets[bo_index].dmabuf_fd);
>   	}
>   
> @@ -2211,7 +2213,8 @@ static int criu_restore_bo(struct kfd_process *p,
>   
>   	pr_debug("map memory was successful for the BO\n");
>   	/* create the dmabuf object and export the bo */
> -	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +	if (bo_bucket->alloc_flags
> +	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
>   		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
>   					    &bo_bucket->dmabuf_fd);
>   		if (ret)
> @@ -2281,7 +2284,8 @@ static int criu_restore_bos(struct kfd_process *p,
>   
>   exit:
>   	while (ret && i--) {
> -		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
> +		if (bo_buckets[i].alloc_flags
> +		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
>   			close_fd(bo_buckets[i].dmabuf_fd);
>   	}
>   	kvfree(bo_buckets);
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index b40687bf1014..eb9ff85f8556 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -33,9 +33,10 @@
>    * - 1.5 - Add SVM API
>    * - 1.6 - Query clear flags in SVM get_attr API
>    * - 1.7 - Checkpoint Restore (CRIU) API
> + * - 1.8 - CRIU - Support for SDMA transfers with GTT BOs
>    */
>   #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 7
> +#define KFD_IOCTL_MINOR_VERSION 8
>   
>   struct kfd_ioctl_get_version_args {
>   	__u32 major_version;	/* from KFD */
