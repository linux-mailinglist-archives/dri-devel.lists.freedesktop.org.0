Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72778F391
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9CF10E6D4;
	Thu, 31 Aug 2023 19:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098D10E6D3;
 Thu, 31 Aug 2023 19:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1tSuBVw6PfiWNxP20ACctzNWRObftMdS3TxCVVNa98Fl8lQrpXPU035O3o7ZLfOg6VKaykOUUN3EXoMQ8Tz4Cf0TnSZGXAcXnGMpOUNMVI58JeZY8kCHfUuM8SYqwi6XB46USVxVNMV9LqT7Rz0BL9pVKlW3Jf5MW5kk0sjRBW1hfBLmDCGwW8B2Z2IBAHE6HRpRky3WhoEoCYNNzo0IzJldTupWfxnheiY3lkkTy7KQgmh0+UKEwJMNOqfMFgpwhIAAhyF7GbzgFPBmtTRupCgNnCQgm5dNdyr1BhsUharikNk2WGuBr/GxWlh0Sxbz+XdnZtFKIDZusmjnkNdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY67sf31lOQWwjU8T2YXLgSyQchNMvqLejLlRuGniuo=;
 b=kplWKErBrX95LiS9dyaoT99FCJnsNpx+kC7NsgCQYHErKs38vFmjwl9kTFZI0We2I3hq+0BP5jZJFrqyIGpUfcx+B9ASVSaKWKX8MMg6fgFjGdYg6fELPfg4HntZCOuOPcaQVLyY86M60XftjqwwEzomvxWHhurSQBcKxNEwYLH7rN3ispQXCT4D/LH3hi5Jx/50VdTUEd7k9HH7vW9k8cveHSlu9tQD4JmcDzxRXdtF9j6YlWMEpc5RMQqA170JgKh6QADBqGS1zYfirl8RVfPdYL5ORbehQB739s6bwQrzxsYB8TLaVPQiemJAJvgAtx2CYYGTk4RyH8NMwW5cNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY67sf31lOQWwjU8T2YXLgSyQchNMvqLejLlRuGniuo=;
 b=poORrnoLN9Xg/3W32Eelq1Ur08QfeE7GSH+MSQiv60N09w6OoHRsW4GUxkJ9QtOdNyH2ETA767bJ9/+1MW42jFulGqd2teA0uNo0pemUvYHsKN8HF/FGwJIr/ChPJATs4/+yyka142AefsTYW9bXf7PPJJuCLQRgwjSzPImmJ58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Thu, 31 Aug 2023 19:48:28 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 19:48:28 +0000
Message-ID: <721956d0-cf17-4b48-a523-0596e67a35c2@amd.com>
Date: Thu, 31 Aug 2023 15:48:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.0
Subject: Re: [RFC PATCH 06/10] drm/sched: Submit job before starting TDR
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-7-matthew.brost@intel.com>
 <de3c70a2-1831-be00-0df3-4b8d6c593373@amd.com>
 <ZMcHy4I/KNyZ2Q8k@DUT025-TGLU.fm.intel.com>
 <20230731092645.4faf7048@collabora.com>
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
In-Reply-To: <20230731092645.4faf7048@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: f68be76d-4daf-473d-9dd0-08dbaa5b3ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEOnJrfpQbNXx8WjBUFS0+TZY/5gMjfSOqUr1i0mbHQWxMZ+7+Va81jPJU/UBoM4oesBg36Ux4GyovmjJAQHGcj0wd4sGn3xair8iAW9SzBeus+q9ztbayt2pegf6TsKpy0sz4mhJtmZm5bL79muo8Qic+z7ZiqxqdeYpvRMl3BvSpJZmzkxXPJ0do9PPN6R1OdvYVPKhgeoolcMuD2QzGyYboMFt2YW4505ZdYc+TtMOIPEB7YYkM5GmaC/53dLlXBH5Qd/K2I44yFcHutCisFbBvwxXQPIBSi1Bg+9CBKmwf0XsWlxkYkIpmRmdV+EVspnf4gCZDJ2uF/62aX09rLsIoRAI5wrloBn3k24b5Qg0PERJK7iWBqDjcVkrgWkQu76FTH1uR6PH4iuNT7V/nY0v3A914a4d+llEvR+zJPN9JK3S6b7NIhGEgfshnbBmP4UOj9n8ujvBf4CrfaSZvS5wH1mIfthecrYLCBOCbpP/qpbeSOf+/4yMdtvhY9SgrGmp50RItCmYa3za/y4JIFSXUDEgE5SA0p6mU/acmRBwxv7aFIdPtSo/b0l92l0oz6rVtiyIM5z2Ufk9z3XPKRikbCJ6XvYBAsA6SDXBRno3ox5x2NVxa464f9R6sYz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199024)(1800799009)(186009)(31686004)(66899024)(6506007)(6512007)(6486002)(6666004)(36756003)(38100700002)(31696002)(86362001)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(110136005)(66946007)(8676002)(66556008)(8936002)(4326008)(5660300002)(316002)(54906003)(41300700001)(7416002)(44832011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dFblFGZVA0RG94YklydERnT3M0a3dKVE02THZOeFUrdW5sWnFHOE53UnRv?=
 =?utf-8?B?VS9JeDJmQkVBenNvaDhyVThaUG5seWxNMUtlMC9wdW5oUzY5dkVtZmlGcUx0?=
 =?utf-8?B?RXkyM3owMXJkL0s1OU1ZRFE1UnBPTzRpRExVcVR2SVJ3Ym5TRFRWOERYNDhw?=
 =?utf-8?B?UnFxZzlaWlNheUZMaXA1MlN4ekxBNXlydklWa2dYQnh4bkJnbUZ3a0VlTjBj?=
 =?utf-8?B?MWh4NVgzdDE2TTh1K21jSENxUmYwRTZOeEdmc0NSUlEvVnZFYjJOb09KcmNy?=
 =?utf-8?B?MU1ZYWRuZm9aT2c5TnVIdzB4M1dNNTBGSVo0TCtrakdnRE84d1pVVEMzaWtR?=
 =?utf-8?B?dzdRcDJnVGZzelcxeW9NVDQwellBcS9oQ3o3S3VBazBOT3Y3NVVNdTd6ck1B?=
 =?utf-8?B?MHZvYkxLTWxQRENUVDVFYnpEc1BIdWRnRERkWWFkVDRjL1B2VllhTktyTkZo?=
 =?utf-8?B?REI1bU4zVmJONFhPSnlkQVhramhINzNXSmZIZHN2WnQ2OE5VVVJ2cGlHVENF?=
 =?utf-8?B?cDhjSGduV1phWUwzZTNuQlc1Mjd5THFqRjZlZWhDL3ZYR2dmRWRRK3dFci9X?=
 =?utf-8?B?d1BseDlTUW1mb2RjeU5iMHI0QWx3UWNNUW1idXdtaS9sV0tYbGd5OHNLT0xT?=
 =?utf-8?B?UFhwNVRJR3kzUExMSjM1clA0bi9VZFJjL21EbU5WaTZCNGh5WitucUhZZjFu?=
 =?utf-8?B?NElyczV0LzR4OWdZMGJFZnNHREYxRUJmeGFzcWJHanBnYzhid0poRjcvdEpZ?=
 =?utf-8?B?TzRZQjdHMUpPajczazdqUTRPWU5IWGU5YXVSbEFvc2tpUWNKaE5GSEZlOVAv?=
 =?utf-8?B?UEdOMlplME5Da3MwTmJVSVVLTWdpYXpUOFlJRzhvdVdtUDRabXpNNk55WjFN?=
 =?utf-8?B?eTBENi9heGVoeTlqYTJCais2aVZJTnlQS2MvQzd1ZDF0TnYxUkZxRVFxR2do?=
 =?utf-8?B?UFlWYVdNNEpvRU5xdnh5WC9UTXNVcmQveXZ0RkpHZ25qdFR3K1dXaGg0Zmwr?=
 =?utf-8?B?TWdXSi80cDg0ak4wNzBHak9TZGRVQW56bkd0ZHJ3dnV5MDNJZ3FIelhxenBp?=
 =?utf-8?B?bHB6b0JEcnpWWkxhK240UlBTcHRmTW9nMVp2WE93T3kyY3dGTnEzWXF1UXg1?=
 =?utf-8?B?RVVmU2N2Y0d5V21qNVRqVXNZZEJzVU1laDhucytWR01PbGNweFExaTJreHhZ?=
 =?utf-8?B?QnlmMnE1Q0FWRUtKeUxxT2JWVExXY0ZCYTVGZHgzT0RwS3pCV3RxRERyNGRo?=
 =?utf-8?B?QjBJcU94dFE0V3ppOEVMNDA0VmxNczhwbWxzRjcxQWJINnVqb1RMSUt0bHVr?=
 =?utf-8?B?bHdKaCsyRzU4YXAxS3dJQ2FXaGFEZzdOcGhLZnlQTHFlbklMWE1tUGtNSjlZ?=
 =?utf-8?B?eVJTNWhKMmRyYUMzOU1lQWtlQStlMEZwY2RqOHM5cXNOMm1vaXVHUHcvNllN?=
 =?utf-8?B?NGk2WU1WRUNHLzFiMWtKYjBJeHROdCs4Q0x6SW5SMVVBS3phTlFNMzFEaU5n?=
 =?utf-8?B?VTJ1LzJ6c05ndjNtVy82ZUFKTWN2STJCeEtBT0ZqUVkwS0dub1gwVk5IQ20w?=
 =?utf-8?B?cnNUcWMxM242QTRNbVBRbDZVUk5yN3UrNVd2R3pJNlRKWWdVclBSaHpQZkF4?=
 =?utf-8?B?QWNPVUgwVDVNdUQ1TGUvQUtDbXVTQmppN1dZaGNYL1JaRjVvRHU5VEtuRDV6?=
 =?utf-8?B?UktncHhDRDdGLzE4VXlxV0N5L3YySFdyNHBleDNNMW5qb1owdGVpMnRmTkxv?=
 =?utf-8?B?VUk4bzcrcjdHZU5OZDNvVFNqbXZpaHpMc053ckRKcHpCYTVHVXA3RDdkd0lq?=
 =?utf-8?B?dkFhVXp2RyswbnFxVnFxVjdzS2JjbGM5eUNjMzdKdFM4c29CRUgrcGMybkN2?=
 =?utf-8?B?YzRNbWpBMHRWZG44QnpUMWN0UzdsdUc3L0xoUGJHK3Y3MDlZRWFPNE4vejcz?=
 =?utf-8?B?L3hibThwVWZEWHcxMXFLMFZiN1hWTkdycEhKWk1vdHFsdFBadUN1SGI0dlZ3?=
 =?utf-8?B?U2J1Unlaa3NzVXZoRCt4V0JwRVg3cTFaMHF6dk0rcDJHZ3BwMTN4Ynhlb3lR?=
 =?utf-8?B?eDdmT09Bb3ZGNGcvNmdpaFQvcWpscWJBNVJiNGZBR3kwMmFmazRzN3FIZ1FW?=
 =?utf-8?Q?inFeTC0MxFYZACzBiK9WrVv0e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68be76d-4daf-473d-9dd0-08dbaa5b3ee3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:48:27.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScDExJRBnNpyhx6Kv3eDapa2ERmdfDzNx9C1+lowewo95yFmaWkNyc0jNZpIqe4e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
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
 Sarah Walker <sarah.walker@imgtec.com>, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Donald Robson <Donald.Robson@imgtec.com>, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-31 03:26, Boris Brezillon wrote:
> +the PVR devs
> 
> On Mon, 31 Jul 2023 01:00:59 +0000
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
>> On Thu, May 04, 2023 at 01:23:05AM -0400, Luben Tuikov wrote:
>>> On 2023-04-03 20:22, Matthew Brost wrote:  
>>>> If the TDR is set to a value, it can fire before a job is submitted in
>>>> drm_sched_main. The job should be always be submitted before the TDR
>>>> fires, fix this ordering.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 6ae710017024..4eac02d212c1 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1150,10 +1150,10 @@ static void drm_sched_main(struct work_struct *w)
>>>>  		s_fence = sched_job->s_fence;
>>>>  
>>>>  		atomic_inc(&sched->hw_rq_count);
>>>> -		drm_sched_job_begin(sched_job);
>>>>  
>>>>  		trace_drm_run_job(sched_job, entity);
>>>>  		fence = sched->ops->run_job(sched_job);
>>>> +		drm_sched_job_begin(sched_job);
>>>>  		complete_all(&entity->entity_idle);
>>>>  		drm_sched_fence_scheduled(s_fence);
>>>>    
>>>
>>> Not sure if this is correct. In drm_sched_job_begin() we add the job to the "pending_list"
>>> (meaning it is pending execution in the hardware) and we also start a timeout timer. Both
>>> of those should be started before the job is given to the hardware.
>>>   
>>
>> The correct solution is probably add to pending list before run_job()
>> and kick TDR after run_job().
> 
> This would make the PVR driver simpler too. Right now, the driver
> iterates over the pending job list to signal jobs done_fences, but
> there's a race between the interrupt handler (that's iterating over
> this list to signal fences) and the drm_sched logic (that's inserting
> the job in the pending_list after run_job() returns). The race is taken
> care of with an addition field that's pointing to the last submitted
> job [1], but if we can get rid of that logic, that's for the best.
> 
> [1]https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/powervr-next/drivers/gpu/drm/imagination/pvr_queue.h#L119

(Caching up, chronologically, after vacation...)

I agree on both emails above. I'm aware of this race in the DRM scheduler
but am careful not to open a can of worms if fixed.

But, yes, indeed, the classic way (which would avoid races) is indeed
to add to "pending list" before run_job, as we cannot guarantee the state
of the job after "run_job". Also, ideally we want to stop all submissions
and then call TDR, recover/reset/etc., and then resume incoming submissions.
-- 
Regards,
Luben

