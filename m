Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6B7D930D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2408810E954;
	Fri, 27 Oct 2023 09:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A3310E954
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiX7ak0YljxLydtAyZWyBaedg1B1DXyamFqUPld03y8vCjWUg24Gv3CqAd15OJV0plZZFdrsx8eVN3CZgPi9/2vjILd9P0C/ds2Et4MPVtRuPiEcsq1uGwAxQJTiaN0dy7QPTx0bbtnQzC3KhLSbWXQ4hTJCb3C02rZCTSAXv4QTBdys3Qmrfc0xMCP4bcfKG6rPMsY2kI0gSYugfC3sUdg7Ixz7UlRXIF7qy1SMbBd/o5kAfV0cTmu1m0hHttKmMOBNAsXGcLmm5wX40Bmf573yqzLquyP/4KDrLblqsj0NxDe/yMlTL8Ul9lN2JwjiZZVtx43WU9IKKg3+9GxFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7yX5lpQE0w4eDwPsOWTFO8eXF6UkWsBI6c9J/ClJYs=;
 b=R/wKzsLAm3qUkCXtXYM2tE1oSOi045rSUFLXwv2XVNjicbdQyDWGRZMwfhumtI8zbGjigyJkCB+y8qmC6q/LbNGKZ8vpiGPbXKV6hoaqmH4U3EEV+38CA9qPPTD3AEtDiiazf/TkWWqlfqAfdtTFRAmiWzfrLfXhiBkr8FTb0rm/toPzdLfP5V6OPqKmgZ7O9+H+BwXQ2N+hQpzNCYfj1EdlXDk1eZA5QqvmWppqhmcJUiw1wCX5CK//xBSx3VcV0pbpSuVHoSzI97blq65dwS6RQRsqzmCQe5B+ELRuBLH6npCX2jG0BrzyvHWzRwV85tP5BN1IIHLIjeJUHfd97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7yX5lpQE0w4eDwPsOWTFO8eXF6UkWsBI6c9J/ClJYs=;
 b=E939gCMghSozay21nTaLfPA0DllRqwzFqKgZHVfYJJG6t9ow24dhoYlJqFlS9/e0T7HX16Ik/3qdte5iL0HunBHmxz2iVHzfgvWnisiHQd6BmBT1STLiMZ+pl43fqLrHeZDHRAwq/CD3/b+ftkDrh0KGXFd0oDMalQNFSRnDUbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 09:06:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 09:06:49 +0000
Content-Type: multipart/alternative;
 boundary="------------zHvOwDJ3w0LptFPcsuBV0F7b"
Message-ID: <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
Date: Fri, 27 Oct 2023 11:06:44 +0200
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
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231027102237.0cdb85af@collabora.com>
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abb35b4-9ec0-4c83-92de-08dbd6cc0d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNvVHUJRKLRurdYFAhGJq0+Daejwr0VfVvN1aZ1etIcGmH86KCdv34pokzZRT9KNblH7n7cby0X0RAHjwNfFV2O5Q7o6/yK/N13EM0TxNgGEG0XhvNf4usF0ChjLSw6B0pDlZUPOVrJuZXuZzdZ2OyUI5i+Va2/GkDNYupiqU87xHkzwGqBjJkY7niBG7+rH3nKQruo0tAm3VW1w1hign+LqK9dz+WPTf58IrV+yK9V66of+SioBnsdiCym9a7B/b9mLQrKLHdQJai0xEJ4sDKmAkdhcmIf8xZrOGm1ikaGgVR1krieDjXNXnnI3lgzzM8LlFIKJ6wdbFiKA+v/Rsy/DwmlJM7RjJk2+tL42M58Aw+2uB3dCY3JBMPJiEAWPrWfBE0BxW5nweJF9WAbgzQgW1ySiw1Cpvc5vdz7Utr7a7hyUJzPLZ6y87O3+4jhkYOQhAYM/mjKSS1q19ri8GGMFk0YpEQ8sYqeJaEAG7kiE8MUUDz3bpmNt26w0y6Jxy5DGAZ8qPu4ziHtF1pY1WuBMqt5CSs0fxB3hXYjoZlHejlGblIr1gQX64m4actqE7WyJxLvrDi9iJ1H3T9h2EP2ef+aOIzrdfYe0/MrXSJ6v3xYyAMslmXNKGdcbWUO9p6fV97c4xhfkxHKhhiN6jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6666004)(66476007)(66946007)(6916009)(316002)(38100700002)(66556008)(31686004)(478600001)(6486002)(41300700001)(86362001)(8676002)(4326008)(8936002)(5660300002)(6512007)(6506007)(33964004)(31696002)(36756003)(2616005)(2906002)(66574015)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEJ6SENpS005cWlXRlZDL2JtcVlZVVB0Sk9vL0ZBRDcyS2J6VXNnVjhGMlpW?=
 =?utf-8?B?THJ1b2ZyeXdmdzJUQmx1b3ZjKzB4Z2s4QWN5cjFESnZ1L09aMEprVDFVSFQv?=
 =?utf-8?B?ZDlUYUFGMXp4UmxIbFk3RDQrZjhsaS91czJ5VDRUWkY5amdhQnVURjh1NkRG?=
 =?utf-8?B?Y0lISzRZYmM4Z0RVTXc1aSt3Vm50dGlMWDBRQlhValJGNGJZUE9uNC94V3dC?=
 =?utf-8?B?b0cybGN1b2pQWXJ6VDVTZGk4ZTJHZVM5Yy85THVuZUxRTDgzdmx4ZnpIVGNr?=
 =?utf-8?B?U3BUS29uRitaK2xpN0VqUVJlQnZRU3R5UWM4aFZTSVdtNlJ5d1ZVbUZlMHpx?=
 =?utf-8?B?N2Z1REhZUGNpcWZJMUI0TTRScXY3MXVyeGNJNzJlMEJFNHhrWEFkZ0xUemxl?=
 =?utf-8?B?WUF6ekRBc0hINXdyenAzRGozMXZRL1cxMkN1OEhPRUJyOTZTc0hhRE1xQlNq?=
 =?utf-8?B?WVNXeDZ5VTBYSjF4WkpIMVNYY1pYY21lejJ0N3BYN3FpWnhseWJzODNQNldi?=
 =?utf-8?B?T3FzblRPOW9FbHRCRzJDQU9UWnFBdHdCV3ArNUNyc2xBZG15Znl2L2hXdXhi?=
 =?utf-8?B?ZjRsZDhsYWRicmlsN29pNlpRSWprVFVCeTVrM0xKcU9oZUo5aXIwUFdPRTNM?=
 =?utf-8?B?Vlh2MURpcERrWkhmTVlkT0dyeTArd1lFUUZiQktEbzFvSVlIc2llVFYvajdZ?=
 =?utf-8?B?WWw3Njc4ZGpnaEJ5dlRaeVMyUWc5NGUzWTJYOUVaazRMWGo5NWwwdVhUREtH?=
 =?utf-8?B?VU1KWmYvM2tWWlRITzZjNk1wejVTcjRLcExGZUUrZ0VuMHdzcjVUSG1zcWhM?=
 =?utf-8?B?VGkxY0VPUVlXcnVaUVBiVDlCcmk1WDdhRGdsS1E2RXhTMTRCY3BaQmlPc21N?=
 =?utf-8?B?NEpVK1hDMFovTXFRakhBZ2xiY3R5dDA0QnZ2NjhBS1hOeXZRNFBkT3QrNnlK?=
 =?utf-8?B?a1FmbGYwaXE2S1ZrQWJDTzhWYWtZend1STBTNk5oZW9BMFVvamdYMmpKYjlp?=
 =?utf-8?B?RnUvZGJ6L0N3cDFTRlZVMU5MWlp5RmZtNktQUHkxRW5uT0FrbE9OVmVDa3Y0?=
 =?utf-8?B?ZzRBTFhTNWEwWFdCWXY0akpNdndCVXczdlpBSmwrcjFwV1R4OW9mSUYrN0Uv?=
 =?utf-8?B?ZkhOSTM3K1NoZzNOSGM1MTBITGlNYzViYkVBVDNFR1BHU1NhaGNjQng2Yzkr?=
 =?utf-8?B?YmVoUzFtK1E0MlQ3LzBkMUUzY00rSTZoVU9zaXlaNFBjQ2k1aXlaV004aXdm?=
 =?utf-8?B?QkxtL0xJRWppOTlkVmtxaGNiK09vMDNEc1RRMEVtMERkVlQrNFVVejZwWWV1?=
 =?utf-8?B?cTU1MnFCOFphbWNOSER2TXBHSGdqeDBabVdjdGx3OE1VcUxUSGdhVk0ySjBE?=
 =?utf-8?B?Q0YzSDhNQU91UWZyaHBzSEFaU1JzZmhiSk83VVovQVg2dmV0T0FjOVhFTjVx?=
 =?utf-8?B?SUc1eDBtbjlTUmJSc0xtTmN4TUp5UDBxckk1cHMyWVpsYUhxNzR3M1Z1U0NP?=
 =?utf-8?B?ajJiN2U5c3Jqd0g3c0MwQ25LQmhadnNnRms1T0pQM2xBNCtZOEFLN3pVZ3Zr?=
 =?utf-8?B?dFRZV1pSd2ZjOXM5Ulk3TVhMWnY3WTlnOS9rQW1LTnprNTAxWHp0TjMxN1Jx?=
 =?utf-8?B?QlpxalRXWTN6T0kvb2NNVGxLa3V3ZW04ZkYxZUF2Q2g5TFZ5WkhUZTI0eXhC?=
 =?utf-8?B?TmJRdHExNGx6SEQ3aGtVNEltNlFpVHlFWlR1dE5KbUJpUlpRd2pUZm0zM0sw?=
 =?utf-8?B?dk5DeHE0L3FUUzltajdOb3NLZEp6TWREbXMxcSs0czUzaTBUQlVXbEdtWm5R?=
 =?utf-8?B?UGtMcWJaNGxIWHRSd3kwcnlsenZqai90QzNJYXFRYld2SmNjdjAwampxOWxr?=
 =?utf-8?B?MTVURngvNnVqbk9GTENGTUp2TU14Nmt2WkQ2R0NlTEMrWXZXL0tXd2h0ejhL?=
 =?utf-8?B?OERLQ2hsT0ZDOEFzT2wybUE0SnpzempYcVZqVjM0NG1rUloyU3hqSVJ6cDlo?=
 =?utf-8?B?UEZLak1EWTVjdnFRM0tNa0VrbTFBb1Jid1N4N0V5bEdhRnNOWG1OeTFuQnVt?=
 =?utf-8?B?K1VOYkhZdkppRy9tY0tJNEVLVmY4Y1JwTlB1Zm1MOUpzdVNuTzNiRUFxS3FO?=
 =?utf-8?Q?jNFeZy3OQ+UXL9wXizeY9GvLq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abb35b4-9ec0-4c83-92de-08dbd6cc0d6c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 09:06:49.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOU4QPtbHMExdsluST0jVSllY581JRgB7RgSTMgjS4WGjkeqNpNazzUWA36nz3AC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
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

--------------zHvOwDJ3w0LptFPcsuBV0F7b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.10.23 um 10:22 schrieb Boris Brezillon:
> On Fri, 27 Oct 2023 09:44:13 +0200
> Christian König<christian.koenig@amd.com>  wrote:
>
>> Am 27.10.23 um 09:39 schrieb Boris Brezillon:
>>> On Fri, 27 Oct 2023 09:35:01 +0200
>>> Christian König<christian.koenig@amd.com>   wrote:
>>>   
>>>> Am 27.10.23 um 09:32 schrieb Boris Brezillon:
>>>>> On Fri, 27 Oct 2023 09:22:12 +0200
>>>>> Christian König<christian.koenig@amd.com>   wrote:
>>>>>      
>>>>>>> +
>>>>>>> +	/**
>>>>>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>>>>>> +	 * job for execution.
>>>>>>> +	 *
>>>>>>> +	 * Drivers may use this to update the job's submission credits, which is
>>>>>>> +	 * useful to e.g. deduct the number of native fences which have been
>>>>>>> +	 * signaled meanwhile.
>>>>>>> +	 *
>>>>>>> +	 * The callback must either return the new number of submission credits
>>>>>>> +	 * for the given job, or zero if no update is required.
>>>>>>> +	 *
>>>>>>> +	 * This callback is optional.
>>>>>>> +	 */
>>>>>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>>>>> Why do we need an extra callback for this?
>>>>>>
>>>>>> Just document that prepare_job() is allowed to reduce the number of
>>>>>> credits the job might need.
>>>>> ->prepare_job() is called only once if the returned fence is NULL, but
>>>>> we need this credit-update to happen every time a job is considered for
>>>>> execution by the scheduler.
>>>> But the job is only considered for execution once. How do you see that
>>>> this is called multiple times?
>>> Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
>>> will go look for another entity that has a job ready for execution, and
>>> get back to this entity later, and test drm_sched_can_queue() again.
>>> Basically, any time drm_sched_can_queue() is called, the job credits
>>> update should happen, so we have an accurate view of how many credits
>>> this job needs.
>> Well, that is the handling which I already rejected because it creates
>> unfairness between processes. When you consider the credits needed
>> *before* scheduling jobs with a lower credit count are always preferred
>> over jobs with a higher credit count.
> My bad, it doesn't pick another entity when an entity with a
> ready job that doesn't fit the queue is found, it just bails out from
> drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
> found). But we still want to update the job credits before checking if
> the job fits or not (next time this entity is tested).

Why? I only see a few possibility here:

1. You need to wait for submissions to the same scheduler to finish 
before the one you want to push to the ring.
     This case can be avoided by trying to cast the dependency fences to 
drm_sched_fences and looking if they are already scheduled.

2. You need to wait for submissions to a different scheduler instance 
and in this case you should probably return that as dependency instead.

So to me it looks like when prepare_job() is called because it is 
selected as next job for submission you should already know how many 
credits it needs.

>> What you can do is to look at the credits of a job *after* it was picked
>> up for scheduling so that you can scheduler more jobs.
> Sure, but then you might further delay your job if something made it
> smaller (ie. native fences got signaled) between ->prepare_job() and
> drm_sched_can_queue(). And any new drm_sched_can_queue() test would
> just see the old credits value.
>
> Out of curiosity, what are you worried about with this optional
> ->update_job_credits() call in the drm_sched_can_queue() path? Is the
> if (sched->update_job_credits) overhead considered too high for drivers
> that don't need it?

Since the dma_fences are also used for resource management the scheduler 
is vital for correct system operation.

We had massively problems because people tried to over-optimize the 
dma_fence handling which lead to very hard to narrow down memory 
corruptions.

So for every change you come up here you need to have a very very good 
justification. And just saving a bit size of your ring buffer is 
certainly not one of them.

Regards,
Christian.
--------------zHvOwDJ3w0LptFPcsuBV0F7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 27.10.23 um 10:22 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20231027102237.0cdb85af@collabora.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 27 Oct 2023 09:44:13 +0200
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 27.10.23 um 09:39 schrieb Boris Brezillon:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, 27 Oct 2023 09:35:01 +0200
Christian König<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>  wrote:
 
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 27.10.23 um 09:32 schrieb Boris Brezillon:  
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Fri, 27 Oct 2023 09:22:12 +0200
Christian König<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>  wrote:
    
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">+
+	/**
+	 * @update_job_credits: Called once the scheduler is considering this
+	 * job for execution.
+	 *
+	 * Drivers may use this to update the job's submission credits, which is
+	 * useful to e.g. deduct the number of native fences which have been
+	 * signaled meanwhile.
+	 *
+	 * The callback must either return the new number of submission credits
+	 * for the given job, or zero if no update is required.
+	 *
+	 * This callback is optional.
+	 */
+	u32 (*update_job_credits)(struct drm_sched_job *sched_job);  
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Why do we need an extra callback for this?

Just document that prepare_job() is allowed to reduce the number of
credits the job might need.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">-&gt;prepare_job() is called only once if the returned fence is NULL, but  
we need this credit-update to happen every time a job is considered for
execution by the scheduler.  
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">But the job is only considered for execution once. How do you see that
this is called multiple times?  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
will go look for another entity that has a job ready for execution, and
get back to this entity later, and test drm_sched_can_queue() again.
Basically, any time drm_sched_can_queue() is called, the job credits
update should happen, so we have an accurate view of how many credits
this job needs.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well, that is the handling which I already rejected because it creates 
unfairness between processes. When you consider the credits needed 
*before* scheduling jobs with a lower credit count are always preferred 
over jobs with a higher credit count.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My bad, it doesn't pick another entity when an entity with a
ready job that doesn't fit the queue is found, it just bails out from
drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
found). But we still want to update the job credits before checking if
the job fits or not (next time this entity is tested).</pre>
    </blockquote>
    <br>
    Why? I only see a few possibility here:<br>
    <br>
    1. You need to wait for submissions to the same scheduler to finish
    before the one you want to push to the ring.<br>
    &nbsp;&nbsp;&nbsp; This case can be avoided by trying to cast the dependency fences
    to drm_sched_fences and looking if they are already scheduled.<br>
    <br>
    2. You need to wait for submissions to a different scheduler
    instance and in this case you should probably return that as
    dependency instead.<br>
    <br>
    So to me it looks like when prepare_job() is called because it is
    selected as next job for submission you should already know how many
    credits it needs.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20231027102237.0cdb85af@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What you can do is to look at the credits of a job *after* it was picked 
up for scheduling so that you can scheduler more jobs.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sure, but then you might further delay your job if something made it
smaller (ie. native fences got signaled) between -&gt;prepare_job() and
drm_sched_can_queue(). And any new drm_sched_can_queue() test would
just see the old credits value.

Out of curiosity, what are you worried about with this optional
-&gt;update_job_credits() call in the drm_sched_can_queue() path? Is the
if (sched-&gt;update_job_credits) overhead considered too high for drivers
that don't need it?</pre>
    </blockquote>
    <br>
    Since the dma_fences are also used for resource management the
    scheduler is vital for correct system operation.<br>
    <br>
    We had massively problems because people tried to over-optimize the
    dma_fence handling which lead to very hard to narrow down memory
    corruptions.<br>
    <br>
    So for every change you come up here you need to have a very very
    good justification. And just saving a bit size of your ring buffer
    is certainly not one of them.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------zHvOwDJ3w0LptFPcsuBV0F7b--
