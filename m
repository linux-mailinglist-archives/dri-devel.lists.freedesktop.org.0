Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4487D7BB3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449810E757;
	Thu, 26 Oct 2023 04:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FE10E753;
 Thu, 26 Oct 2023 04:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvVrSTQ+8jFMf9ZBd7v2kZiU+0QxANElhb3IN/EH9zNpwhu8qEv33eZBevz30mOnu8QZpsq1syKFCGnzsOH8sCFNxPIYZPAFFcCaFyR9pas6r/+rq+nK7dJcexMfKD6JsTSLstwZ0TCcsnHeFFSvoc8Sc97aLJ/GAgCCPBokjppIPfZPOnrkzIiJz4zWFYyJsEVOsLFI2E1vOz2zzs+ItZSm7W4O1CdTIdtJDCRriOE+P9lv9DoQfFEZgwT147W593ENgRhYWI5MveAkzH3/I93fVolgdvoW/EQDq9psnkwSlHp77uGEMTGN0XT0p7acm5FcJLlsBFp31QOqi+VXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2LrJTEd25eMnBopfJ0QNoaj83oVKrspUsu92ZISjw8=;
 b=GpUO/4yVpxLV3Y8NN3MPbxd3R5jt2dLJDd87accph2UDkIu5++mkhQlL3uVrtLAg5WzbiRqChl/u9DilDNM8cvfw3j2tL/a2VhJ9JyI9HpAfIV4kEELpHgccDTGIrLYBZpDzTyJY5BPNjS6K4p5ZAzE1y0uYVJ5YwpO51fqanFVmuiH58I005MXdhig6PcsuDb1m+GJlJb61t8L/sdN9xqoi4Mk80pGveKEd9Vprg11uNekJSTOwyPgZSKJ+DNwApstgJvW7YqL2EqDHmUMzjeGfOHcgaptxC2Udv2LnwEcD0qTfg/tkpFFRBdbN+NvRiSmP5IoXwAZBrz+A8c8x+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2LrJTEd25eMnBopfJ0QNoaj83oVKrspUsu92ZISjw8=;
 b=pVeTkhhGeesQ4KkPpLZsXZe/CxMdJ3PJQnJkLKg/ZaS7E7rmtXdOlOE9q3iWb3iznkT/a6zjQhwbhNH8fGcTg1IwgQi8cjZB4MC122H/+M+YzOvP3IIg9JuLkVWzxv1a5orZ9HtlzxG0Cp+80DXCRu3+vb/5E8qAB6CDhabzlHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Thu, 26 Oct 2023 04:41:11 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 04:41:10 +0000
Message-ID: <6abbb3fe-04fd-466d-b8fb-90a59226e259@amd.com>
Date: Thu, 26 Oct 2023 00:41:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 6/6] drm/sched: Add a helper to queue TDR immediately
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231026041236.1273694-1-matthew.brost@intel.com>
 <20231026041236.1273694-7-matthew.brost@intel.com>
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
In-Reply-To: <20231026041236.1273694-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::37)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: ecff5e86-91cd-4e62-7f5a-08dbd5ddc6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: haz67V/4T5HghK+BHzEp3geuoNXd/EQ4nFSq4pLQ+E6KSJ0OmqKgQvk1WK5BX2c0L/3nR4ETwmYgmnr9RY0nMVLHeEkU2EMf4byoti71PvBXW+2a+HXeJ8ko8QhsoNAeT0ZDZc4jJhmaA2wTtLrt5lOdWW4zF/Oy3HsmJCPmz7Y6oY1RwDAVzAfjSKDAgMT8h77RG7qNFDLLS7zWP8bKF0pJ6St7i0rlUBQmAoYf6OqinofhBStALn6y/2GmAHtoIufVmnWpY70pYTU+SNIjJmGp8HXNuNNKdFI5K5bz52PlBcWhVnbCfGyXFDnCmd96GhUPIzIFi0BF11Zr8xZ2F45NM/BMqlmTf/q/oK+LEww5q5VtcFeIFFelKIK0slu+7QWmfJl6f0+3uT0fvWw6qCKLGSIbvqkt2wbBFnett4D3HeWg1QKua+kgKbq7PTxYJtFxvdzEsMlQ1892jVkYO8JHKl+bh3VKxjbWqt5rhzeauTYFhpfxitEUlLSKRPioxcOBGKxSIfS3pzkc+odzelbF2RcWELk87OK37sNyO+FNgOHTEr/9TlOYJ2JI8nYzLAwqPq8tEICE/awXfAtiuMQRcX4vgxVQcSBTs086paLgyONxM5hLOllIcgyYQAXcMbN5psB9CfvV6K9uCknYNJBymCiCTAUK/Cm7FmamZIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(44832011)(53546011)(6666004)(478600001)(6506007)(66476007)(2616005)(66556008)(66946007)(6512007)(36756003)(31696002)(86362001)(6486002)(26005)(38100700002)(41300700001)(8676002)(8936002)(83380400001)(4326008)(14773004)(316002)(7416002)(5660300002)(31686004)(2906002)(4001150100001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHNETzBQb0ZJUU8yWlFKdVkwT2Q2cUpSVWFoeS8xa0QxR3QwVzR0cGpvRVN1?=
 =?utf-8?B?K0pqNWdPZFdRa1lrVERDOHdyMVlTcUZyOTFBc2tvMlhDT0JPUlZIS3BveFJH?=
 =?utf-8?B?MVBjUFNnQ1M2enRvYnlpM2src3Y3dUJFWjFwdFljQTQ5NHYrYmI1SXFCOUZE?=
 =?utf-8?B?V2g4SkpiYWk3TjVsZlQzUTUxWmtJZnpFQUYxdjRuM0RWMUU3RU5KOTV1L2Er?=
 =?utf-8?B?b2tCWmcyUUNXa0habWNydTRDZW5FMXQzaFJ3SWgyQzQvZHU0bzVFZUlxU1M1?=
 =?utf-8?B?TmwwYTJ5NS90VXJLY256TUlzSEVsWFdxOVAya2kvamorQjloT2V6TXExUzBo?=
 =?utf-8?B?TXVkNUtPK2lqZEl2OW9oWlJUcWttZUpQK1lQM2xudW1lMXFKdEVscWUxd0RH?=
 =?utf-8?B?VmNJQXpxbE56WXFzOHRIVFNGVTNaNlZ3ZDBrMDdGK201SzJMdk5SNUk2V2xP?=
 =?utf-8?B?b1pJbTRDdFBqT1VPRVE0Q3NJb0xrSG42TFJjTzFJS2J6cFpzT0JSMUZBaFky?=
 =?utf-8?B?Q2N3eEcvTGZOclFqc0I1QzlKTXMyMHphanJpcHNpZkxKdTlsSytFR051NWNl?=
 =?utf-8?B?OTBmckRmbmZsQy9nMVZOS0VvdFFZQVE1K0JvazFXQWYxSmJKOEN0OEJyajFx?=
 =?utf-8?B?T0ZrS08wL2Nwa3FpMEd3MmlSaUFSRlBLcU5JRGw1OW12dmpadEFpcG8yekhr?=
 =?utf-8?B?U1Jya3RrVmQ2YmVJWTNoUUJuL3FBb1BOMXJyUUZORUwzQjgxeTBoc0ZvdExu?=
 =?utf-8?B?aWRxZVBlRmVGcE5EaUZuV1NPYjM3Y0ZFOUdyd0dOcmYwYXg2Sm5KZ0lOR25n?=
 =?utf-8?B?eUFYUUNTelZMNllvM2hSNDdlVzNFZHJ2U1lCUGlwczNkOXcxQ214NXZ0dmE5?=
 =?utf-8?B?Nk1qQVNLSWpZaE5ZaVJnRi9xS0l1UUxqemp2VldVUkZubHAxclpJclR4MlJC?=
 =?utf-8?B?RHRQVkczcCtHVElUbXpXWXBZZk4yd3NpRzJXTVh4UjlYSWo5cUMyUG4rSExY?=
 =?utf-8?B?eWpIcmt0ZUtiRWV1dmpKZXQ5dW42RCt0WlRLcmsrMzcxSVlaZmVoNTBET3ds?=
 =?utf-8?B?UDhLUWxKYW9iUk1QbUFZRElmckYwWVhaODd2bjUyQ2xXemhaN1Q4UHlwU3Z2?=
 =?utf-8?B?aGNURmFMaWVuQ0RvUUcxMFBoL3dnTitRcnFvb1JkR0NVK2djNEl2RnlPMGJq?=
 =?utf-8?B?WUdqS0RGb3pZNHNaU1BDYk00WlhWUVJaK2x3bUo0TkJBWlJwd1kvSnZIclls?=
 =?utf-8?B?OVZIZjUwbS9Ca29ydnlaYlF1ZzhHSVRLRzBZd0xlS2V5UG1tY09yWk85RnRk?=
 =?utf-8?B?UWRHbXB2OG9VQVhrSWdpWXd0Nk9NdU5XVXN5Ky9LU1V5dnBxUVhSbXREZkZX?=
 =?utf-8?B?NE9CNGFQYnRndS9wdXV2a0E4dUFrVjZlVFovRkJTQ0YyTmJYaVZDNjdvZ1J2?=
 =?utf-8?B?dGtRbGppcThISTF6UEVPaTFZS21BZWRDYTRFdWlMRndCZ1VKU2NkSGpJT1Ji?=
 =?utf-8?B?aUZLWEVDRVEwckxGWWdXdEVtSVlLdVIzWXNqV0FWek9TVVNCTjFQazBoSngw?=
 =?utf-8?B?QXIvZGJkbWhkSW5KYkp2YnBoMmxmcXdURk1EZTJGR09DdU9jTGk1YlpUcnlB?=
 =?utf-8?B?Ym16N004VjREcGpCMkkyc2ppNjlwWndjNjFSSlFhbnNzL3Yzb2FwbjNyTWtz?=
 =?utf-8?B?Q3JXRXVXWCtqZTdNN2dPV05KbVpaam5GVitkMW5WSHJTTGxnSnFHRUN2S2pz?=
 =?utf-8?B?ek12MXRnNitDQUxFSWkxaTFVcG1USHg1THpJelp5blBIMXVOUURyWEVmWGU1?=
 =?utf-8?B?R2VuNXpNSHBTWko2TnJBMlR0L2FPU0ZMMjBNWHJ3VEtZa3ZtdDZkMkJ5RExQ?=
 =?utf-8?B?V3loWjRkSUJub1BPWFdmRHJBblRGNEZQVlFOZ2gyQ2NjSWUxWVhYWXFtVmxt?=
 =?utf-8?B?UTEyRWpDTUd2dUZYMzBWbG9QenVXZVE2TXZGVE1rKzhya2xhcGh5VmJWNkYr?=
 =?utf-8?B?NVRBZFlvVU9BbWZUR1JvaHJHa0l3M0hZS0c0bUlwczhKMnJQTHprTXFQZ1lz?=
 =?utf-8?B?VlphQkY1K0pJbHZ0L2N5SjllTWE0aDZNaDhiZkxnWERzbFB6djRUd3lwK2Vy?=
 =?utf-8?Q?9T5s2FnkagQejk/tiYnN3/DTW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecff5e86-91cd-4e62-7f5a-08dbd5ddc6ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:41:10.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz+xa07Oncl61+yB+yrRTPI+fCg4Jculacu7QYiegakxJGQj5y0t7NGs1nVjB5t5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222
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

On 2023-10-26 00:12, Matthew Brost wrote:
> Add a helper whereby a driver can invoke TDR immediately.
> 
> v2:
>  - Drop timeout args, rename function, use mod delayed work (Luben)
> v3:
>  - s/XE/Xe (Luben)
>  - present tense in commit message (Luben)
>  - Adjust comment for drm_sched_tdr_queue_imm (Luben)
> v4:
>  - Adjust commit message (Luben)
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ae66cabc3162..246213963928 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -389,7 +389,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  
>  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>  	    !list_empty(&sched->pending_list))
> -		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
>  static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> @@ -399,6 +399,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> +/**
> + * drm_sched_tdr_queue_imm: - immediately start job timeout handler

No need for a colon char (:) after the name.

Regards,
Luben

> + *
> + * @sched: scheduler for which the timeout handling should be started.
> + *
> + * Start timeout handling immediately for the named scheduler.
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
> index 37749f561866..e5a6166eb152 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -557,6 +557,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
>  
> +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);

