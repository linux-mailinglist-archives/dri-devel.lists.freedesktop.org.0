Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353617B3CAE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 00:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9110E0D7;
	Fri, 29 Sep 2023 22:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F079510E0D7;
 Fri, 29 Sep 2023 22:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekphg/BPoXlK+bnTDbkC1k9Zo1V2uXrENuC8slcreaPFIAPlDI5gcRH2aUQ0aSoXt3mkd0WR1NpdKX32ejfFdRrV3seJrnZn8zBZhDeEsKJRlNQC5WQ9sI0HgT1Z1Fir9kwJNn4CbzhAWEC9zMT4AnoXudOewdvj0xquz9TiN9Nh2c+HfHlSw/6EAXXqZFSE6+cJT63+Kxk/Ak3fI3M3Yn/fi399ocbfB4FlTXwYMeqylOjSZSYPsza5aVWO/A+lAEbQiWXEpt0Jg6DoQ0fzyrSBt4ipKAmaQxJTbDk/7eBFSFZ0c3ynOeaBKBWsQfNjJPDfBJ8tJCjAFk49VxX1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxFOYFM9erZ6oXXUxIwfNi38YTBFYWc7rcyfJYpHhlg=;
 b=jWf38WaFtgH73Xo6kiyvmdoOQ4SEUyozXJtbW8bTdcpjCMmZtbB6oOeZhP0lrnDstvSxptDmChNq38Q7O/uzY9ivPOzdrxdkU5/EUYxJrKoxevxbKe7MvjnYOLd516G0c9jtuw9HtNHpcJvD+k5wUFZaml1Olp5Kcocovm7HDS798krUBGTK2VV2HBIUnz9sRsnR2Eo874IbXpgnbknj9MliO+6GLPcdrLs2QyFBy9B2YWN7U2Z9lLJi8ZNRzs5GRf/nM4htnxloiiU+nNtFzsWZAqdBZQkJ5u4TvRPUEntMyJbX856u9+eclAYX2jBNfu2QPXK1Bul3c0VvIZKTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxFOYFM9erZ6oXXUxIwfNi38YTBFYWc7rcyfJYpHhlg=;
 b=P53A+Zf7leq5dtndtB8IdAIoYsErMm07qAWXPHqKLKCfd6FLDIJhGAUy7GaM1OW55e/hI0dcxG9OmKEYcpv5hJ07Aolz2xbSW8dbVMnWFdLJ0qnfeqOmRs7POADtisVLnvKvlqG2mJCm+kQmoQQzplme9vVQwSr+BStdqF5GIJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25; Fri, 29 Sep 2023 22:44:57 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Fri, 29 Sep 2023
 22:44:57 +0000
Message-ID: <53828798-3c37-46cb-a280-cb7c3efa1c24@amd.com>
Date: Fri, 29 Sep 2023 18:44:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 09/10] drm/sched: Add helper to queue TDR immediately
 for current and future jobs
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-10-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230919050155.2647172-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0216.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: b25f8760-07f1-4e9c-12db-08dbc13db44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +N6wePS4KrPJ/adZPBsCJl+Zrfb73BSi8XU7PMzWEFHryEMU3VAwA8T97iAKn5aIwVKNpehW5c30w1aiFLjFklcaZV1ikwIBrSWbzPwD+PTdPq4jLP/Xj7f3pN3NFdm9gMpeUOyeCgrMpwCbADbjgVDsBPMXUAmhhv8c658kYLirFazE/P2C4EsT2rHmch276b8pSLzpugMzERh0ONbtKHcAJ7KmkiQ3fJqMgpJpr9FwcjXcMv/+lnQ8KH5srW0Gq+1vm8FRWTsElLPOphd6L3868s76ds2GetXfOgYiE6ATJTz+VBOpJx1YtvGEH6sHcGHvqXFeyF+t1wdMOtd7nWI1Q0QhkDLGIgmcISEzwJjt3280cDByr1YpTMLRakdX0UpopM6Y+l24eLwujnShOSA9EgmJAVtkogJ6txBLuLC79B8kKS0m+ZCXYN9/bfCeSzemOr0dzY3GVRc1LVEvKOKofEUDIP+dD8rlQoJOEv4GBvZhXPI9jF7FIlt5g7d6mZhZGbY0LCFw5IG6hYYvX4Yuc2IFz3yNXo4MS/1y4yz9CHuEIYgmWXL4o9ZLP6VS2S+2qZVops/bYItsNTTNyHEK6gxPtc3IsgAAf/Eg5Z8YNFqvykXXkMyeqeSbNK87sFdmflwj62I3ulVIM0YoeQ3qq6Zl+JSW4Nn6gM+KWKJzSJ8p5z2ewYgwqZh80wFgYpj9JN1JQpLRX2ecbwTYROEZq1bIrNMLFYKSnDCu2NY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(7416002)(83380400001)(2906002)(316002)(14773004)(41300700001)(44832011)(5660300002)(36756003)(4326008)(8936002)(8676002)(66946007)(66476007)(66556008)(86362001)(31696002)(6486002)(53546011)(6506007)(6512007)(6666004)(26005)(2616005)(38100700002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm45NWpqczVwcEdtdmxzVkZYS2d0N1V2bW5PMnNBNktjbjkza2xDMncvZFRw?=
 =?utf-8?B?MG8wMzNpNzBwQ2szcFVzeWI4WWo2cHdtVDJPTldNQVVpU3cvakdyMVJpbzV5?=
 =?utf-8?B?N0dhdmJWWXZHWmJmeXR4aktiK2IwR0RCcFlNYmFzdVVlemczSDhDR01UdjVa?=
 =?utf-8?B?NWZrTmErTEZqQ3dDdmwvWDZ2OGMyZFBPWFljUXlzWFpYdEF3YVhwd0l4Z0g3?=
 =?utf-8?B?SkpLMkxYWGhIQnVGcWVMU3d1Vm5aKyszeG9CMmlpQ2loL244MytGb3VWUC9i?=
 =?utf-8?B?amNtMHNrQlZWZjVzenYyNnkzdXZDcHV4VUxoUUtQdXFMcE1FUGMyeUhvM2Y0?=
 =?utf-8?B?QWNZMFkvYlZWc0pBd0cydVJ6Z0Yyb2ppMWVKVHo0dTR5K3o4V1B3ZXNlb2Q2?=
 =?utf-8?B?MTlFYUU0b1YreGFPcGdqcnRXRlptYXhEMVJybHNyRXB4V2ZDWXViUFBiLzlQ?=
 =?utf-8?B?cXBVV25FcUZ2VklJeUU5b2xEMmZIbE9vS0Z4Nk1XZ28vZVp4N2c0UnFkL255?=
 =?utf-8?B?UnNQNVJmOTMvMnNablU0aVV3UmxaZURWaFV6SEZIU2Q0UWtQaERiREJoV3JG?=
 =?utf-8?B?eC9Rd2ZVZlcrNGYramZaMjM5UVJvSkg2QzBxdDBDR2xTVTJpL2RMeFk4OXMv?=
 =?utf-8?B?ME5VblR2RE1YaVNMZTJ0WXRNam10M1AyUnR1eE5ITXJYckNNcVB2cHFoeThD?=
 =?utf-8?B?STdIdSt6MlVFMU1EZ2xON3V4MkZZYjcwSHJqRDI2R1VCQ3hneEZIRE1BejFH?=
 =?utf-8?B?eXlpMG5TRDZQOWNQQW56YnQ1RzJzMEZvV2MzRjBUV3ZyU3hJcXRRcnVLOFcv?=
 =?utf-8?B?aGM3bUY3L25yditXNnZNUThrQ2JRRnIxK0VVRjZrd3QwUm1DOTRZTjcvYmdL?=
 =?utf-8?B?Vm1WQjJDS0M5TkRDZFA3ZlZXd2xOMmdXNUQ5WTRRMkZmTDNyYWEvWHlCaWhB?=
 =?utf-8?B?anZYWThoVTZ4UFZDbUdJNG1sMVhNZkVGYSt3Yk4yRzU0WWNvTGYzT2NUVlpo?=
 =?utf-8?B?Z1RCcUFxY2pjRHRuR2pMRzFxYjVsVHMwcXgxQ3dSaXpROTZOZlNsNHNPK2tk?=
 =?utf-8?B?RXVxWU1VTENBa2JuTzQybXp3dlg1Z2lZVWdaaXFIUDM3UVJGaUZPU3hQUDZV?=
 =?utf-8?B?ZDZkdS9nSUZRZFl4MkhYQ0lxNC9OSHFHNlRjZUFQdy93OTZJVmU0MmdCVTRk?=
 =?utf-8?B?Q1dQNEc1NjRwYWVPTE1iSGZ2S1hnTk9zSzczTWlUQkU1OHpWWXd3ZWhrUXZu?=
 =?utf-8?B?bk9tbE1SVEd6cmNjMWJ1K3NicjhzY0NzSGJNbDdkam9IMGoreFVmb3FRTWd2?=
 =?utf-8?B?MUdRcUphZUpYNE1FOEZJQmVNRmNNcDNvdGJGWmVzbTh0L1Q5TDZkeFlyTGRp?=
 =?utf-8?B?a0s1bFBHU1Jrdy8xVDBxNzRwdGNWdEN2ZGRDMzBmeUlEcG5nVWoxMHEzTGZ6?=
 =?utf-8?B?bDhOYjdyVXFpT1FjZVNyNVF6ZmZEVXNOUVo2SkhEQmhYMkVKL1JSdFJQWFly?=
 =?utf-8?B?Z1VTUW4zdHJzYitCWGJ6NEZyYWx6WENrcnljcnpHUkt2dU5MOGwvVTNQWVU4?=
 =?utf-8?B?OFhWUlRGTWloM3o1ZEJMdkQvNjFRMitva0JZL3lBeGIzMFNsNm5lNmJvbVZu?=
 =?utf-8?B?QW9SZUY0d0dyWngrdi90WklyaFFkcXVvMGp4VDQ0ZmtydXVJSnI0azlrNlIr?=
 =?utf-8?B?TVgvYTA5Mnhrak1zbjg0RWN4L1pZVjV6ZkpFZTMzRk5zNVlhWEFraVB3aWtW?=
 =?utf-8?B?VFA1K2Y2dVhHUzBLU1plSnNOMUFTRFY2WGw3SzNGOU13b3pOeXVTK0MzV3ZR?=
 =?utf-8?B?UlpucThudGc4YnF4ZisxTHQ0c2RKT1l6UjMxSTZsU3FEMXIwZXdySjc5WG1l?=
 =?utf-8?B?bE44dkFFMUQ4cGpleTB0elhVQU5lV3Qzcm4vK0RMTklvTGVic3NjVDg0SmFx?=
 =?utf-8?B?S0hNUVdjMktScWo5VTNZUytFbXArNWR1NmxxeXB5RWZwelA2Tyt0VERlTG1n?=
 =?utf-8?B?NGdXUGVKamdRNit5VUpuL0FOU0VkRWtsMkx1MHl6ekNGS25MZUlMeWFXWTlW?=
 =?utf-8?B?UnpXNnIxbWxhMHU5dE91ZnFqRnEwYnREMnlpRnpxNHZBblRMT2ExcTBlU2ho?=
 =?utf-8?Q?ECWKOeGxgEsU/DIUVyMDfkn3F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25f8760-07f1-4e9c-12db-08dbc13db44b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 22:44:56.8631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FQBbBttZqcwb4zT/KSdUhxeBHm4ROq/JdiRQM9Nc8nDlgxbcWonOYsrx/gm3+25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-19 01:01, Matthew Brost wrote:
> Add helper to queue TDR immediately for current and future jobs. This
> will be used in XE, new Intel GPU driver, to trigger the TDR to cleanup

Please use present tense, "is", in code, comments, commits, etc.

Is it "XE" or is it "Xe"? I always thought it was "Xe".

	This is used in Xe, a new Intel GPU driver, to trigger a TDR to clean up

Code, comments, commits, etc., immediately become history, and it's a bit
ambitious to use future tense in something which immediately becomes
history. It's much better to describe what is happening now, including the patch
in question (any patch, ftm) is considered "now"/"current state" as well.

> a drm_scheduler that encounter error[.]> 
> v2:
>  - Drop timeout args, rename function, use mod delayed work (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e8a3e6033f66..88ef8be2d3c7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -435,7 +435,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  
>  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>  	    !list_empty(&sched->pending_list))
> -		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
>  static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> @@ -445,6 +445,23 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> +/**
> + * drm_sched_tdr_queue_imm: - immediately start timeout handler including future
> + * jobs

Let's not mention "including future jobs", since we don't know the future.
But we can sneak "jobs" into the description like this:

 * drm_sched_tdr_queue_imm - immediately start job timeout handler

:-)

> + *
> + * @sched: scheduler where the timeout handling should be started.

"where" --> "for which"
The former denotes a location, like in space-time, and the latter
denotes an object, like a scheduler, a spaceship, a bicycle, etc.

> + *
> + * Start timeout handling immediately for current and future jobs

 * Start timeout handling immediately for the named scheduler.

> + */
> +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	sched->timeout = 0;
> +	drm_sched_start_timeout(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> +
>  /**
>   * drm_sched_fault - immediately start timeout handler
>   *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7e6c121003ca..27f5778bbd6d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
>  
> +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);

Looks good!

Fix the above, for an immediate R-B. :-)
-- 
Regards,
Luben

