Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAC7DB47A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 08:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090FE10E220;
	Mon, 30 Oct 2023 07:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E4310E220
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 07:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acByIXPGUFV2DCBoYKoiLi1cG8RLut4ZcSIz0Nc7V45KvOpVkVtrrs6y0lHBgh2zAtgxXbBPcPY0HF2rH+H1AkqLPBxRSU11JkgypOxgPls/GzDQdsgx8ptl8RjQ4BHanUvwcjvBVotaf+GO9EqjLpAZLDIrDVzcF4uAMMi0LejP0R/JY1t14qHDhRMiTF5jBGRH3dJk5EJhe+3X6TgB+olyhsEopkAmph/rVTgyYRtO1WxRahsVxrKmWRDCgDwuRYg+am/VGXv0NCVXCLMzdO9ts8Gb/z5ufoUTZSrwSnZ5GGCgN15/HZU2UF/WS4QF24jI7zY+cThcUTn3n1Dj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDgIUeyibxRSIRYzFCfkM/erZlKhIdTxlKeQmrVzpUU=;
 b=BP6OSPNwq8BxCvC66CAO2VJCVrsyiUUgnT+9HhdmuUMRUiRP6c9IFTf/fpjn2KyyXXhu5pwHy965yS1X40rt8bmK1ROirQB7A86VQVQjg8M7f7K3ew6FxhjGscY3yJx6cPRtDMc9NBgv1kxY2Om/pyu+RSH6pJn6xZC92IvMswrNe8ikCG4aQ6JDH4J13bLsL6ke7JhsX71+r/N44Te9HtSWbNBDGVTXLI1oV5wBf5MV/ljxC3GVjUOv5SKkrY7UYTbkDUigftZRbLO2rDXxkLmZiefZoOrAc8HEqazhVx3Ayfv6HYBwInCyXe3m6jo5JyC4ABz8vcUVai9sUvuV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDgIUeyibxRSIRYzFCfkM/erZlKhIdTxlKeQmrVzpUU=;
 b=Rp3dquYmigoJGax2FxA+epgFPhAx5XtP06PONtJFHdGLRN2nWZvoKwStyUiXBdIhfkiVEqzOhrAKb7qHvu0WY2ExkS01brlPGR2esWe9tryRJnyn4A0eChngTX8TWg2kyOZL2y+K9CbcMkMuPIKCX+EkZQVnTVqtkn0OtOfYqQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7724.namprd12.prod.outlook.com (2603:10b6:208:430::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 07:38:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 07:38:50 +0000
Message-ID: <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com>
Date: Mon, 30 Oct 2023 08:38:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
 <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
 <20231027121707.414810d6@collabora.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231027121707.414810d6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb9305b-c725-4604-3e48-08dbd91b4242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJlCCyVxglIibieUrY2dpDG1xsgKj0S/Wp3SAhEg8I3JbX9r291PYBf4TijHA7eY2OigxQUBebkkgOqzuMg7qtMZHI/G6zMk4P9T89RZPI6cs/8PuOCyUfUV0RDnjeem+TIzaQZ86BL1OBsI76zhFISrEMczdE39SgK56Jv3sOYgtZdkXYgFoI7hiiNj36uCiWdHTWivj9jtGDiRB3TaAj1d28vkuBiJChzAaYDTt763KxLQbkZzlqpRmA9qU1TmVO+IpHndEQVuKuR8juQuWLBkUII8f9xbCL9q1YMHJO3u0e5hbv9L/vW6k173we46QvXADHjmnAQJqGK70nbd7pWsfw6o7tfEopec2XRn6/TMizRVZD+YC6K7jPhjYdftvP78+068ddoYm+TSH4XtgtX8LqT+INSxit2XS7X2blncOyYA+WsihNgPtdMExuqHBbbp+VP+/jZbMlc+3Y3RDQl9hyPbUy50aOOX+JAIDQ/KrcxNhvvbuw/q/ViPprKoDgme/Nzc8McoZzfcWFpyqEAzxAKRb4XVucqSNdw5SpsvEastXeggwYzycJhleJlAox557X70E7SHyTYr/ngcC3jmUk4y9E1LYoqtep66+8PfCFEyyZ5nWBDFVvXX5EAGBJ/mFJKe+Zalk6CsD88Atw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(6916009)(66556008)(66476007)(66946007)(316002)(6512007)(6506007)(26005)(6486002)(6666004)(478600001)(66574015)(83380400001)(2616005)(41300700001)(5660300002)(8936002)(8676002)(4326008)(86362001)(31696002)(36756003)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MklXNmlJUVRaTjVuK1k0aUQ4SFJWSEJGdGZwUUxxMTFzVUlGYy9vcHN6UTlC?=
 =?utf-8?B?Q0FDejBHYm1QTnB4TTlzUytYZmNhRXZUMWtoam1pTzllN29UaWVrSEhqRy9O?=
 =?utf-8?B?eWxDYVJnNDlMR1U2dGpFMGh4NDZ6RCtheTg0aGpXM1A1eWY2TG1SLzhLUFpM?=
 =?utf-8?B?S3YvZFdtSitGenk5ZXlCZTdMcVJnSEszVHY0eXlaUG4xeWZmdUxRaWx4eDh0?=
 =?utf-8?B?SmJWajNCbE50Z1E0TStHQmJ2amducXBnditoc0lPTnFRK1RqMUFPU0pERDFN?=
 =?utf-8?B?WkdjZkI1WjZrZThMQ3FrMWxrTXV0R1lXTDdaQmpySzFZM1NJOW5YS2NHcWUy?=
 =?utf-8?B?bnhUSW82Z3djS0ZJTWpITWdNOGlHV3dKbERvUUFPV1hROUlTNjc2MXRXOVhM?=
 =?utf-8?B?TjhuaFR4WjQrNWNDc3NyUWI1T2RXakFiYmZENndKK3hOYTB4amhGS3M2UU5y?=
 =?utf-8?B?Y0pyaHFLMEtldFBFUmxnZlBETUtOeG5EbUJyeENYWVg5QnNXTE5aTkJYaTBv?=
 =?utf-8?B?WkFJQ0VFY215ZmpOb1huM0V1SFgybzJ5NDJ4VHRWZEpDSEVaTnRFTHkxTDRI?=
 =?utf-8?B?M2xsWVYrRDBuUzRxeU1sTEdNeHZGekRTejBJbGlpeVNyZTZrOWVVZDViZFpz?=
 =?utf-8?B?SHFBaEEvL2JiZ2lidnp5S1dDR3dCWkU1YS9oTVpYS05HVlRJMnd3MGRJSllx?=
 =?utf-8?B?VzhEbUxHalcrZk5wTURmMVk3SHQ4ZFhvbllSRFVQYVczNGhxMk5rTmlNTmVC?=
 =?utf-8?B?WHR0azczOU92dEFyN0ppdklHZDF0K0FxYWZLMzU1ak1jWFJGVVBpM0ZXbE1u?=
 =?utf-8?B?V08rSjdsZTRSdXhzamh3elAzYnR5dEV4NmpqL1dXMXJTYVhONlluZFBjRTZH?=
 =?utf-8?B?U0hzVEhMcVN4OWhLNGFXblF3YzB0bWhHTGFBbDUyWnNOUkZZbnp6MHVtbUZy?=
 =?utf-8?B?ZGZLUUhIbmR5enpvT2N2ZkFZa3JKNHl2VnZzTmVnMVJmbnZRSnFiWjBLTFdQ?=
 =?utf-8?B?RnZzUXB0QTRkOGxUWTBqdjV1ZVZRVVlsVUFFd3FOM0hPazVCVEI5dEZEa09l?=
 =?utf-8?B?ci9uVzd2dk1kSnZJUTF4K041QXJoMHBIZ0RjODVBMzNvSVF3ZFNFamFCSlpX?=
 =?utf-8?B?SmQybHlYZEdWZ3FrTzlENEE1RjE2ZnRzL1dyNEZkdnQrSkp3ay92K0liQVJJ?=
 =?utf-8?B?R0ZqTUZuU3ppOGhyWUJZVmFLVnp0WWRDdTQ0MlgzKzJyenNmemdvWTUraldx?=
 =?utf-8?B?eHZHQlJQTVJPV2VVTjFYZU5TZlgzUTR1b3FwRVo0K1NxSGJUdnJtUGFrZ0Rm?=
 =?utf-8?B?Wlk5QTh0Z0RCZXZsY0tIY1JFOFRodURwY2ZCcEpPTlBqcG91U1ZZdVAzMUlL?=
 =?utf-8?B?bThjZjdXM2hENks5SWZMc1Y2YTN2dzhTQUk3ZDhRdUtWRDlBMkFzMHRNZnRm?=
 =?utf-8?B?dG5aMmhNMWtsSUVXL1RzNkp2OW9mZk5TSDhGNG45VGdRcFA1b1FUSXp0Wm5m?=
 =?utf-8?B?YTNCNGUwNS9VclE0S2RBRTQwUnBSVSt6SU5nSjJSQWVqSGNJNnhUMXBhYTlH?=
 =?utf-8?B?Ky9uWUpHUWIxQ004TU9IRXpJRGtpWXFQTzJXRDdUS0pkWkE3MTU5OHBSbmJZ?=
 =?utf-8?B?QXhRTjg0WXdYbFBjS3B6SVdoNlN2a2VEQ01wR3RWejNSVVZ6MGRWRk9sampj?=
 =?utf-8?B?UmsrRU5td2EzWW10WUVkYWhQRUxSb0xmMXE0TjZBVCtFT09lYzBaV21odEtu?=
 =?utf-8?B?VWR5aWRXTVVIOGpPNkNkTEs3SExQMkxueGFUNmlyWlpiQk15RmtUSDhKUXc5?=
 =?utf-8?B?ZWVveE00a3dWODR4eWpFUXZlaS9TVVVGZUExSW0rZ1BtMmxJbEV0bGVYZUtL?=
 =?utf-8?B?Z0hEMGlMdTNsSmRhRWg4eHJ6anNzYmVTT2lZMkEwRU1sWkY1YmVvcEcvN1Bq?=
 =?utf-8?B?VFVFdnRlRkkrRkRuOWsxbnVqWSt1di95ZTRkUWd4LytHdW8wM2xlUEFlTkIz?=
 =?utf-8?B?V1U2SWwxSzJzUUFTSDhPUzNZdXlqdkwzRnlzbk5UZzZWcnh5ZVhFbkwxM29m?=
 =?utf-8?B?V2lZWjRIMkVHSzMvcnMvOEdsL1QrdGFqeDN2WWdRZzZCQ2t2S2RkZGJZcmU3?=
 =?utf-8?Q?QxM4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb9305b-c725-4604-3e48-08dbd91b4242
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 07:38:50.3383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3u7TpSq2/dzzvj7HnDxa9pOVFAPkvT61yg7fhvDRVvTJNOuoesWuEn1JxMDNpUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7724
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Am 27.10.23 um 12:17 schrieb Boris Brezillon:
> Hi Christian,
>
> On Fri, 27 Oct 2023 11:06:44 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 27.10.23 um 10:22 schrieb Boris Brezillon:
>>> On Fri, 27 Oct 2023 09:44:13 +0200
>>> Christian König<christian.koenig@amd.com>  wrote:
>>>   
>>>> Am 27.10.23 um 09:39 schrieb Boris Brezillon:
>>>>> On Fri, 27 Oct 2023 09:35:01 +0200
>>>>> Christian König<christian.koenig@amd.com>   wrote:
>>>>>      
>>>>>> Am 27.10.23 um 09:32 schrieb Boris Brezillon:
>>>>>>> On Fri, 27 Oct 2023 09:22:12 +0200
>>>>>>> Christian König<christian.koenig@amd.com>   wrote:
>>>>>>>         
>>>>>>>>> +
>>>>>>>>> +	/**
>>>>>>>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>>>>>>>> +	 * job for execution.
>>>>>>>>> +	 *
>>>>>>>>> +	 * Drivers may use this to update the job's submission credits, which is
>>>>>>>>> +	 * useful to e.g. deduct the number of native fences which have been
>>>>>>>>> +	 * signaled meanwhile.
>>>>>>>>> +	 *
>>>>>>>>> +	 * The callback must either return the new number of submission credits
>>>>>>>>> +	 * for the given job, or zero if no update is required.
>>>>>>>>> +	 *
>>>>>>>>> +	 * This callback is optional.
>>>>>>>>> +	 */
>>>>>>>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>>>>>>> Why do we need an extra callback for this?
>>>>>>>>
>>>>>>>> Just document that prepare_job() is allowed to reduce the number of
>>>>>>>> credits the job might need.
>>>>>>> ->prepare_job() is called only once if the returned fence is NULL, but
>>>>>>> we need this credit-update to happen every time a job is considered for
>>>>>>> execution by the scheduler.
>>>>>> But the job is only considered for execution once. How do you see that
>>>>>> this is called multiple times?
>>>>> Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
>>>>> will go look for another entity that has a job ready for execution, and
>>>>> get back to this entity later, and test drm_sched_can_queue() again.
>>>>> Basically, any time drm_sched_can_queue() is called, the job credits
>>>>> update should happen, so we have an accurate view of how many credits
>>>>> this job needs.
>>>> Well, that is the handling which I already rejected because it creates
>>>> unfairness between processes. When you consider the credits needed
>>>> *before* scheduling jobs with a lower credit count are always preferred
>>>> over jobs with a higher credit count.
>>> My bad, it doesn't pick another entity when an entity with a
>>> ready job that doesn't fit the queue is found, it just bails out from
>>> drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
>>> found). But we still want to update the job credits before checking if
>>> the job fits or not (next time this entity is tested).
>> Why? I only see a few possibility here:
>>
>> 1. You need to wait for submissions to the same scheduler to finish
>> before the one you want to push to the ring.
>>       This case can be avoided by trying to cast the dependency fences to
>> drm_sched_fences and looking if they are already scheduled.
>>
>> 2. You need to wait for submissions to a different scheduler instance
>> and in this case you should probably return that as dependency instead.
> It's already described as a dependency, but native dependency waits are
> deferred to the FW (we wait on scheduled to run the job, not finished).
> The thing is, after ->prepare_job() returned NULL (no non-native deps
> remaining), and before ->run_job() gets called, there might be several
> of these native deps that get signaled, and we're still considering
> job->submission_credits as unchanged, when each of these signalled
> fence could have reduced the job credits, potentially allowing it to be
> submitted sooner.

Ah, ok that at least clears up your intentions here.

Question is if that is really that important for you? I mean you just 
seem to fill up more of the ring buffer.

>
>> So to me it looks like when prepare_job() is called because it is
>> selected as next job for submission you should already know how many
>> credits it needs.
> You know how many credits it needs when ->prepare_job() is called, but
> if this number is too high, the entity will not be picked, and next
> time it's checked, you'll still consider the job credits at the time
> ->prepare_job() was called, which might differ from the current job
> credits (signalled native fences might have been signalled in the
> meantime, and they could be evicted).
>
>>>> What you can do is to look at the credits of a job *after* it was picked
>>>> up for scheduling so that you can scheduler more jobs.
>>> Sure, but then you might further delay your job if something made it
>>> smaller (ie. native fences got signaled) between ->prepare_job() and
>>> drm_sched_can_queue(). And any new drm_sched_can_queue() test would
>>> just see the old credits value.
>>>
>>> Out of curiosity, what are you worried about with this optional
>>> ->update_job_credits() call in the drm_sched_can_queue() path? Is the
>>> if (sched->update_job_credits) overhead considered too high for drivers
>>> that don't need it?
>> Since the dma_fences are also used for resource management the scheduler
>> is vital for correct system operation.
>>
>> We had massively problems because people tried to over-optimize the
>> dma_fence handling which lead to very hard to narrow down memory
>> corruptions.
>>
>> So for every change you come up here you need to have a very very good
>> justification. And just saving a bit size of your ring buffer is
>> certainly not one of them.
> I fail to see how calling ->update_job_credits() changes the scheduler
> behavior or how it relates to the sort memory corruption you're
> referring to.

Yeah, you are right that's not even remotely related.

> And yes, we can live with the overhead of making jobs
> slightly bigger than they actually are, thus potentially delaying their
> execution. It's just that I don't quite understand the rational behind
> this conservatism, as I don't really see what negative impact this extra
> ->update_job_credits() call in the credit checking path has, other than
> the slight overhead of an if-check for drivers that don't need it.

 From experience it showed that we should not make the scheduler more 
complicated than necessary. And I still think that the ring buffers only 
need to be filled enough to keep the hardware busy.

If this here has some measurable positive effect then yeah we should 
probably do it, but as long as it's only nice to have I have some 
objections to that.

Regards,
Christian.

>
> Regards,
>
> Boris

