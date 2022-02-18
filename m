Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357714BBF93
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FB410E2F3;
	Fri, 18 Feb 2022 18:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283910E2F3;
 Fri, 18 Feb 2022 18:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvJnQuHSIaTbKv4mGRvrbwZfoUOPYsozwnCqlf9jdyZ08f7txnoImcImu+C6TAqQMN1Dss/nppFGFJLaj46vfqLV3UDjS7HJ5z68xanvXApaAlf1JUMuxHVzlLVcSAYQioJq3G+oQssWGaHTvAkXFCnyBLyIcrhpOxuQar/eOIPiMIFspbdyHQwuXYfxgDId8XbzazO2KOWeV9gg8UhSNk+n1avGxpQbZ+1vCvCHWInxe4hJKWDjKt3v5/JA9i7y1k4wJ+DkhWzouvRmuFazXHPMY93HDzOqWWyGw/6l4wRTTPPH0Mfa9rzGI5jgPHYwK9Knh2eyru8ziOxrZIr9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWAptDzvTxJ0HtKqQGyReV04pwqw0dAROryPBkH7a5Q=;
 b=cR2n/2b0SgG+dvt5mA+gpEr5h50v7qZeMi4H8mKUxmyGlF0MHSzaqF1zgMu/7Y3gImK9xBkr8X/iSvTk2YFQDbHB7sgfsU6Ys2ijIdPkBzP5QvBYI9m4DpXkl/P4wgODYjvh8mObVw474A+UuV2kNPEeMKgguvgMlAfV6wdqxwIQw6G1K7hCtMR2xY6gYfgV4ISJ3lGvpsg+OsJB0yEccDoUsJwEDEQF21no8q6jfix/Kecr+3iFh/F8gq5haeWDT6EU2TvyWRqqZjFEQEV7mEOh8qXRX6rb9NSbStN10GzBMJjuGyqcSw8ECdh64MBmCVJHI6cTElM2+JdUy76vVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWAptDzvTxJ0HtKqQGyReV04pwqw0dAROryPBkH7a5Q=;
 b=KgpO5ZYFrknLh1tEfQgPzEdXbUmeDr341ihQy9JrnUWKqYvZOQ8y5FyZnSp5PmVjCZ8s65+VeS/qAtic9PuUqHn2cligWQ7A+6cGYNaFzH1DMrfT2ExaMUflB696EFpvGI/ph04u8adVbwyVc7Qlj1TG9Vzod/wsc4HpwGX5zXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Fri, 18 Feb
 2022 18:35:44 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 18:35:44 +0000
Message-ID: <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
Date: Fri, 18 Feb 2022 13:35:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: rework criu_restore_bos error handling
Content-Language: en-US
To: trix@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
References: <20220218173913.3376948-1-trix@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220218173913.3376948-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a303859-c004-4d80-29ad-08d9f30d78e2
X-MS-TrafficTypeDiagnostic: BY5PR12MB4034:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB40341BE16BB0ABF258FF631392379@BY5PR12MB4034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SfYITO7OxE31aeKFyhGSCr+MOSQQ2SmGOXw44tWn34N8Hu70CySu0yL26OOjHHuwBVl8JtPJcVftue42fwv65sK6qEJh7IG69nRsCgcy3xeXZz+b7S08PVYWHHEb4YUEdi7qzkH4P357EpPmz+yexUXHlTOst2clFUzOvn+hkxEZTYW73ygC1YhiL6NO6dMfQO7wGR/iHQC8NA2rYcq/N3Oh0FCLGb/IgMvGixotSJLi6BLqqWs5TjJBq2q89bNgt7iZroyc//CCvhJVMqu63J9TOjz0wC3LPAsV2wB9P7GpSn/8VfWMIWIx79qzVYEYNPedfYbKWg6w/cSTh8iSr4P7E8lMPmXDLciK+bCvIN4nT1ktRM/kaWyVtOne9uvaZ0plyAMNEq181cbyHKsw48hcMAtHb5OicC3WA1WQ7tkbAhJgsK/tn8xi4o+VcY9thOe2NCzolNTYS1FWK4LoD862REb1urv+GvRkR8q/OMk5BiLE6KJPaOhPn3XgVpzfTYX2kn3Vf9PiVFX11vOSwAvgMoh0hOVvBY4dagqCLeesvNyzVMEJ1JLAlklRMh1AIRCg//oXgAoFdFKaWxzaMJT5O6EFBboSQ9qgUuSqDynhhH3+bNzFFqQAPuIH8TcgvnGbII/6OaWlxftF2TxYwLd8B4Klku+a4i2QRVMxnx+emmSXD1nVLX8YLf3cfK2yMSmNRyLe0+hr4iUzWv8ar1XXOZI0WSXDUwJqTMEfLLf8WTUktO8wJjKyk9PdO9s7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6636002)(83380400001)(921005)(2906002)(6506007)(6512007)(6486002)(44832011)(508600001)(316002)(5660300002)(6666004)(186003)(26005)(2616005)(86362001)(31686004)(31696002)(8936002)(8676002)(4326008)(66946007)(66556008)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXdpeUJ1eWE3SmlFMDkzVnVZZUtxRFA2bzRFTjFkaW9vejFWWERIb1FGaUQ0?=
 =?utf-8?B?eVk4ZGN6K2FlWGJIUStpeDJTektoWjVxWTFiS1ZyZnhMNHZpMjM0bUc1NjJM?=
 =?utf-8?B?aDdaUXRtOTVJRThmK2Y0cUcycmZhZWpqcjBJMzAxWmd2YW05ZllwdjV4NDRY?=
 =?utf-8?B?WWgrS3JGM094Si9rT0toZjMyQmNhRWJnaHJjekgxbm82dXFGQzVKandsVWRm?=
 =?utf-8?B?Q1dDajBsUmxQMTFGV2xXOVpQM2E3bStRSGU5dEhrWmRmL3h4VzdTTExjdDNJ?=
 =?utf-8?B?QVEvTGVWSTN3ZWt4aXF5SWE2c1k1S1BiWTlPQTBidjdUdlBkTjlnSEpIT0RZ?=
 =?utf-8?B?U0drNjlJSVZKdUs2OTREcVZZOWRyRnJDZ0x6TnZ6NjhMWUFjRVBIRVkyeStF?=
 =?utf-8?B?aERKMGlQZ3lSSkNHa1AvaWdHSXExejVxUkloaGZjeFJoS05FMVI1eENtSXVM?=
 =?utf-8?B?cFlDRGtCb3RlSXluaXRhQ2ZiUE9WUWZWdEEzaWt0LzFyRFRjVTdkdHRpTGp2?=
 =?utf-8?B?WExmQ0l6OWRUMk5mYXJqWmI2Ykp4Y1htazc1aGRVMkx0YWdKTzZvVTlieTNH?=
 =?utf-8?B?Q01zbmJJcDZuREFlZ2I0WXN2Z09tVDZWMmo4b3ErYUVzd2xGOGt3NjN6MHJB?=
 =?utf-8?B?SC83YmJXZHRJS0kwS1ZHV2d2V2ZtU2FiM2NycHJiYkVqenhtSUVpWEswVTdt?=
 =?utf-8?B?VWtScUpqMStiTWxmQmh6RHNrbmtGTGhtQlA4UFU0dkJNVGFDYXk2cXpxcHdv?=
 =?utf-8?B?RlEwQ09kOXBhM3dINkY2eGlXUXloUmVvbVVQTlJ1aEZlRHpIa1FTa21hRWh5?=
 =?utf-8?B?bVdVemVDUm5VSzA2TjFlakRRY25LL1ZtTkZLNk96SXpVZnhOOUwwdXVad1Nu?=
 =?utf-8?B?dHVMSHBlL2xZUUZ3SHk5VVM1ZmhLd0tTZERHUk8zOGRRaEZhUFhyaXVYUTRs?=
 =?utf-8?B?S2o5aTduMUJndkZiMlpIWVZYRm1ZWGpWaFBINTdMNEZUa1N2V2xFVU0zU3Iy?=
 =?utf-8?B?aHlyYzVVVExwSUNjb1l1alN4aDVWZituYmlUdVpsTjBnb1p0T2pxbFlXcGpT?=
 =?utf-8?B?SUtUMjRGN2ZHVVU3YU4xVmRDYlRTN2Vua2t0OHYydDhlVnhVMW1KUGFnV2JQ?=
 =?utf-8?B?TlVGSkpkd0NUc0RSMGhDckYyOE1lbHJkS1Z2Zk1HVnBJVHN6TTRpUnN4VlF3?=
 =?utf-8?B?aFBPdXJYM1owUjhJS3dWRjRSTEtmYktWYkowQng0aldlYWNjVUUyeVIxQWRt?=
 =?utf-8?B?YkJENUNFQUg1cWw1TnhSNWRMenUzdkpHY0pLdDJYeTIzOUJtK3dCczBIc3Y3?=
 =?utf-8?B?aThidEhhWmF0eVllU0haVGpEUVZjK2RtNS8xbzluK0RmMm84RVBDRGVHczI1?=
 =?utf-8?B?T21oekFKbTNUUllpandhUC91dk1PSEJaYVhaL0txOUJDeFRub1NBZEFHb3JW?=
 =?utf-8?B?VXl4L2hVbEFvUXY0THVKekZkbjhWNDZ0UTFEblR2dE9KYWxNNi9sT2NiRE52?=
 =?utf-8?B?UDZ3UFRNVWJSeUpCdU1uc1pET25ldWdwVkczK2t6d3RGNDBMSHQ0TkZ3RC8z?=
 =?utf-8?B?dWlTRitmTVRCdG5uYVV2dFQ3NlpaWU5nNCt0MXVxWGdjazlKcjRaNFp6Wlh3?=
 =?utf-8?B?MkFyMHZIdUxLeHNmaDN5cWZjQXY3SHB2bllLRzhleWgzWFhkdWFkYlZDWGpF?=
 =?utf-8?B?N3hncy9TWXphK3QvcEhOSEg0b1pCczVXaVBYbHc3ZmErbWZjaXQ3NjVZRm5N?=
 =?utf-8?B?NVlrRlp6VUR6WkdlZnFzWHlKYmhsTWI1MlNsdTgxVjh1REdVYzdUQndxdjVv?=
 =?utf-8?B?QW9hamdYOHp0dEozbkllNDBuNDJmUDRqbUdZSG1oMjV5WnFQeTNCR2lHeWJY?=
 =?utf-8?B?YXVWZ2tnNzAzUUtmQzY2S2pENVovZnZ6NHRsSE4wYXU2S2lBb29lTUdOUHhw?=
 =?utf-8?B?Nk9WVmZmMTM1TFdzSzV5N3ZBemF6cVMxVFlYSGtwczlPbEdTekJna2xsUnli?=
 =?utf-8?B?aFBPaXh5aVUyMWZ0L3FnOUNLckVHTTRDOXp4MWlCVmFLQ0Jib05vY0Yxd0dl?=
 =?utf-8?B?OHZKUGNxQktmMDBlOHk3Rlpnb2R2dzBNeTJMc0FuZVV6Y3hJZll0UDgzUWwz?=
 =?utf-8?B?MVRYR1d2WXZ3QXErTzFrMFlkbzVwMU1YUE5ZNWdjYnF6RXNwSHNLWUIvMHIw?=
 =?utf-8?Q?0oZ2QHK1VSjz+0eZm2S9qkI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a303859-c004-4d80-29ad-08d9f30d78e2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 18:35:43.8941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8sDWxjsQFlDm+LHZDMBgpSouYK+Iwylin19GYMD0qaxhedege8LOFni9jMgnxEw29skB1PdyAMrLlkSjf1BPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-18 um 12:39 schrieb trix@redhat.com:
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this problem
> kfd_chardev.c:2327:2: warning: 1st function call argument
>    is an uninitialized value
>    kvfree(bo_privs);
>    ^~~~~~~~~~~~~~~~
>
> If the copy_from_users(bo_buckets, ...) fails, there is a jump to
> the generic error handler at exit:.  The freeing of bo_privs and
> unwinding of the dmabuf_fd loop do not need to be done.
>
> Add some specific labels for the early failures.
> Reorder the frees to be the reverse of their allocs.
>
> Move the initialize of 'i' back to the loop.
> The problem with the early frees predates the loop
> unwinding problem.

I think the existing error handling strategy in this function is fine. 
Having only one exit label avoids potential issues when using the wrong 
label. Freeing NULL pointers is not a problem. The loop becomes a noop 
if i==0 (this was fixed by you in a previous patch). The only real 
problem I see is that bo_privs is not initialized. So this should really 
be a one-line or maybe two-line fix:

	struct kfd_criu_bo_bucket *bo_buckets = NULL;
	struct kfd_criu_bo_priv_data *bo_privs = NULL;

Regards,
   Felix


>
> Fixes: 73fa13b6a511 ("drm/amdkfd: CRIU Implement KFD restore ioctl")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 965af2a08bc0..1d5f41ac3832 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2102,7 +2102,7 @@ static int criu_restore_bos(struct kfd_process *p,
>   	const bool criu_resume = true;
>   	bool flush_tlbs = false;
>   	int ret = 0, j = 0;
> -	uint32_t i = 0;
> +	uint32_t i;
>   
>   	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
>   		return -EINVAL;
> @@ -2119,13 +2119,13 @@ static int criu_restore_bos(struct kfd_process *p,
>   	if (ret) {
>   		pr_err("Failed to copy BOs information from user\n");
>   		ret = -EFAULT;
> -		goto exit;
> +		goto free_buckets;
>   	}
>   
>   	bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), GFP_KERNEL);
>   	if (!bo_privs) {
>   		ret = -ENOMEM;
> -		goto exit;
> +		goto free_buckets;
>   	}
>   
>   	ret = copy_from_user(bo_privs, (void __user *)args->priv_data + *priv_offset,
> @@ -2133,12 +2133,12 @@ static int criu_restore_bos(struct kfd_process *p,
>   	if (ret) {
>   		pr_err("Failed to copy BOs information from user\n");
>   		ret = -EFAULT;
> -		goto exit;
> +		goto free_privs;
>   	}
>   	*priv_offset += args->num_bos * sizeof(*bo_privs);
>   
>   	/* Create and map new BOs */
> -	for (; i < args->num_bos; i++) {
> +	for (i = 0; i < args->num_bos; i++) {
>   		struct kfd_criu_bo_bucket *bo_bucket;
>   		struct kfd_criu_bo_priv_data *bo_priv;
>   		struct kfd_dev *dev;
> @@ -2323,8 +2323,11 @@ static int criu_restore_bos(struct kfd_process *p,
>   		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
>   			close_fd(bo_buckets[i].dmabuf_fd);
>   	}
> -	kvfree(bo_buckets);
> +free_privs:
>   	kvfree(bo_privs);
> +free_buckets:
> +	kvfree(bo_buckets);
> +
>   	return ret;
>   }
>   
