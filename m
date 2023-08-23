Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028EC785129
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 09:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101BD10E354;
	Wed, 23 Aug 2023 07:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B610E2C5;
 Wed, 23 Aug 2023 07:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUhD+Lecw9RhhsTFEEDGsNq3q7FUqpu3T6XH9mJrbg3hv9KFDGRIxEC0HhcaJI0i9yyT4R6cvm32qucS31/dPJG7CGZmrMxKV0ZtQdA2DNlZAp8MIiSz5ovfVHB/6efTTzWVahz2fkp8tY3KeP+sEYGcuTfOhzWaGNR+9nDibyL7fHLu92lDjoXSlDwzw2gZV7oVWaVHfDI9Z1+T7Cp9Du3dUo6P93yU7ERF7s27xw2yWR4f87jhOYc5P1xnK8VIV6sOwy28W2qQWKFBbcTH31Xg1s6tDfOQLz1eWD3VncuhvVnIMykTTS7bzFn7fQdTfpkB69mMSuxQ6KcD9+oC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igZvQE/6ho0Rxw6i7kQaC2Wh5nl/jKjDw9WcW26Oi88=;
 b=QSsRCdkzOUjgNUtNmn89jhC0bovw5iq0EgHZpAKekYR0a6a+lazi8FBYISS0KCvfVmFKuNUFBJZO15ogoemF2EO9LOHQQymE5NQUBHnIasQyAC91f9TlnEtdpTMH173xMsia4u5tz8LWdqmx90iPlJBfCNI+vrKMTu2cDFdE5A14rWrCxAMT5PHVB6EVTk13nVqPj4NmXfafkHROeCq43ky1sN8QOSplJdg/ZEGrkLWgUfKOGfoaxtsRZgrxlPgCT/gvmsCgXG0BOg1IRI5068fAbJ8Z8wK4xXqVfdX3/fLa6/utnb83a9dGzaNvW+KC25M35ow2NKQHA0yeedRbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igZvQE/6ho0Rxw6i7kQaC2Wh5nl/jKjDw9WcW26Oi88=;
 b=AhiPK/1DMrZ46tldIMNegd4AQsN0JdS9FWuT4MBNre2wqc8DGMjykO/Bgq8W6xXRXGWg5UU8Mu+fQrhaK3sWPpKoya3k3AJcZta2G+IFLaP6SeiB7KyPfesy80ahPK0c8cUw8ryNyOGt5L3VJ7OkYIbBRu4lDSDNgLx8WlIB1/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:10:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:10:58 +0000
Message-ID: <eb95b02f-7ffa-0cff-eac4-2bd8d12da730@amd.com>
Date: Wed, 23 Aug 2023 09:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
 <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1936fda6-3dd9-4c9a-e876-08dba3a8192c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SvSGr1KlFNG66Wczbi1ZD93K8kf3SQBWAW6Ve98opYnculZyqOzYIH7evPh2Zc8KNW4E/5nq+DuIpqKaYa00nW5tuRLakSxQR2bnTlUg75vzF6LXcQxwPQxtcRbwH/EoCEFLxAeyIeuHsnm+CCPAZQVkssig3oMhRLtgf+fNUn9fIPmNIcORccoqkirWIHbalp1OG9/hEG/piMzhCLWyCjDRXI/LUqIfx4CHWi0LSkzosGeSDzTpFn9YVHLgg4CwdX4r0EGRUVapFoEPj+zZnrmdJgQWNXL+NljW7fQfoa8zp7B1Vogpe6v5TFwKuBlHTBfav25Ng8aw7J+wOsFUCTUpYk+zfyHIPhz7hpFMWmXRN3TMEOB0vOaBV8bvcPkL/pPOZWqW/EhKdSSX9nivIqsExLNjW+E5mLBBkkDtH1Jt4VFlh0fop2uUylbB6O6PA8VPLl2qGzxgPAfr/9IHZhFTYhEIRy8vnQt/0Nw+u9kJ/4MSf2tnCwIq7Rg2yQlRUybA5LFDi1NxqTrgTEbfyLiBA2JhKeqRxpdl3QQcJZX8rwgNVPXmnYG6uPznR3PjeuSw+S7X0qZTP9zJ70/n8THZm6i0eo8qfiQxY60e5GG8vPLAk/SFzaPN+IUsp0Qqmmv5DIW/qrSv6sEi16jLAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66556008)(66946007)(66476007)(6916009)(316002)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(6486002)(6506007)(38100700002)(2906002)(30864003)(83380400001)(7416002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRhY0FFWE9pOGdYVkFxbTBicmpadm9jNmJhZEJsWHZiMHkwUkZwZTN6R2xx?=
 =?utf-8?B?SnpxYmpDallLaUQyUXpqZ2c0Q1NWbWZQc28yT3RVVmRCZHU1dm1MbWU0MHEv?=
 =?utf-8?B?cjBtbU51V2Q0ZDRSYWgwalA0OXJUTGFsNEwrK0toeTVWTm9iZTN0bVhJMmta?=
 =?utf-8?B?aytjNzRsUlpnOWtZVlNUMVlNaDFNeXFoQkQ1b1d6U3ZpRFBMenF2NkZrMXdx?=
 =?utf-8?B?ejlOdCtxUlZzQnZnemo4SmJGZTV6K2hvaS8vKytETWkrck1uNENITzF3bDVw?=
 =?utf-8?B?VHBpMldZeFlVckk5dnZXV2JBZE8wdUlMYnJxd2RyZVUyRWRlOXZGVitzM0pF?=
 =?utf-8?B?S083d3ZxQzRKbXN4S1RLcTlXVzZsOXc3S3A3L256cmZlTTE2Sjd1dFVHemlN?=
 =?utf-8?B?RnBINkh3dFBqbkNMdWYzWERad2hkYmNyZER1QkQ1UFpYdFBWQ0d1STNFUDdj?=
 =?utf-8?B?SStoSG9jeGNpT2Q3aGd2U0lxcGRVQTFrTkdCZDBYSmpPU2VHUWZBL3c5ak5l?=
 =?utf-8?B?MXJMMnpoUkc3VmZ1dzVwSUFFWVllczM1MUl0ZmRIVHNoTWJOajBIVGRxT0s2?=
 =?utf-8?B?dVZiVVVVaFFLVTFvWWt5WGozTXA2RldaZmVuQjlBSlNVWVBVMWZYNXE1L09V?=
 =?utf-8?B?Ny9ONmJIbkNuRkQrUHRxdW9BTENPclNlQlhkQWwyQTBaczVjTTFPdmVGTGcy?=
 =?utf-8?B?bnhDd2MzTTMzYmxtNm9ndFQ2WWQ1T2VqTjlGRm5RYXk0WjBVK2tWWloyVWJz?=
 =?utf-8?B?d1QxUW5pcEo0ejNEQXpwbU5jbm5wMUpUZ1BDTm5pSE11WUFjTldhaXNFR2pk?=
 =?utf-8?B?L2tYRjZQRDFkczdCSWtDK3licWYrTnhZcWlGWGRJNEs5enF3Q1I3S3E4WkZp?=
 =?utf-8?B?K2pIMW85ZW9oZ0VzOVhCM3JNWkp0SW82ZUpUSFRtazZ6b1hMQzJyTXZuMUFG?=
 =?utf-8?B?eERHa25admJFanhFdDJwUmpiTlFpOEM2Nk41R0ZScDk5TEhVUVNQclZHK25O?=
 =?utf-8?B?U21BQUJzVlpnclZDTWdaSStjM1dQbVZMRG1DMmVGRnJ5cG41ZkJOYzBGRkZt?=
 =?utf-8?B?ck15TlUxWGFpV1dNM2F2NS9mNFJ5Y3IyNjl3OFNDbGNUWjR1N1VsNDkwRWtV?=
 =?utf-8?B?YSs3UzgzQUhJbkJkZ0d4SGJqQnN5VGVEOThOdmlpWitvb0UzM0t1YkJqK3Z1?=
 =?utf-8?B?ais1eU9iRUNYanFYcE9QMGsrSkR5ODhrZ0VZcnJGd01EZ09Pc0w2QXprRHlr?=
 =?utf-8?B?R3pkUGZhNDZ2WndVY3dGTW5sQ2VBTno4Q0RlSm9nOWR4V2xYZ0tvN2NCOEsz?=
 =?utf-8?B?QmZaanJiM3ZRNjN4OWFBUm9QQm9qYzNOV09xOTl1OVFxeDQ3N3JtY3JHU2pj?=
 =?utf-8?B?bWpJWkQwTUpCbnczRmhlN253VlZmU3NGTDdueS9DeGpibFd3VlErY3NaenVU?=
 =?utf-8?B?RWdDVzFnTHpaZU90VDFsUEhEMnpsQm5lSjhsSHp4U3FzWUIvb0FUTmNjUHdK?=
 =?utf-8?B?Rm53QjA1bVVKVTVRZDdydnFxL08vUXFFczRJeklaZWhNZmczVkJORFpROHdB?=
 =?utf-8?B?KzdoZGRlZkdQSlhCRjY0Rm5zOEQzaVJ2YUdKYnp4R3ZFRDRRK0swbTFaaGFH?=
 =?utf-8?B?ZE1QQW5EMm1ZRUJTcDhhN0ROVnB1SGlnY0srRmFmQ0t3eUZUMGttNlU0L2lq?=
 =?utf-8?B?bUsvM1EvSUk2b1lMdG9FY0daN2FMbGdRS3FEalN5L1ZKWHdNZmYwcDFPd2c2?=
 =?utf-8?B?N2I2NENaN05RM0tIZkgrb1RXRnplUU90UjJWOGF6amxKS1lFRWNBdmhVSjVC?=
 =?utf-8?B?cmlvVUZQVThJNFJoci9ER2lkcXpwTW5nSHIrT1FkM2JyWjBrVlI3TzBXc2Ew?=
 =?utf-8?B?TWNJMHBFazJrdFdrVTMzcVpETGpibFRma09ZM0xoOTRIc2F3czd3OExyRko3?=
 =?utf-8?B?WmhtbFFseHNsbDRMUXJRaEdLcDVlL21vTXlGLzNSTGVDbFNidHUrOGJCVzNF?=
 =?utf-8?B?MXNZTVdtRC9lNUQ4dGpzNGdnUHozdWJYMGFNbFNBa0crOHlOTy9hdy9Mc2tM?=
 =?utf-8?B?V3hoVk5YT1Q3RTVBa0hEOGtVbFdseXZQUjFndVN2NDNISFBweXJJemdvMlFy?=
 =?utf-8?Q?nizhNNWIMur2EPuQSPRIPDIRn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936fda6-3dd9-4c9a-e876-08dba3a8192c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:10:57.7410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/M4xfZC+Y2mxd9luKOCLtfuJE+PGvce986jgLZIilD/4hQvcCfynAJZcpG15nfJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.08.23 um 05:27 schrieb Matthew Brost:
> [SNIP]
>> That is exactly what I want to avoid, tying the TDR to the job is what some
>> AMD engineers pushed for because it looked like a simple solution and made
>> the whole thing similar to what Windows does.
>>
>> This turned the previous relatively clean scheduler and TDR design into a
>> complete nightmare. The job contains quite a bunch of things which are not
>> necessarily available after the application which submitted the job is torn
>> down.
>>
> Agree the TDR shouldn't be accessing anything application specific
> rather just internal job state required to tear the job down on the
> hardware.
>   
>> So what happens is that you either have stale pointers in the TDR which can
>> go boom extremely easily or we somehow find a way to keep the necessary
> I have not experenced the TDR going boom in Xe.
>
>> structures (which include struct thread_info and struct file for this driver
>> connection) alive until all submissions are completed.
>>
> In Xe we keep everything alive until all submissions are completed. By
> everything I mean the drm job, entity, scheduler, and VM via a reference
> counting scheme. All of these structures are just kernel state which can
> safely be accessed even if the application has been killed.

Yeah, but that might just not be such a good idea from memory management 
point of view.

When you (for example) kill a process all resource from that progress 
should at least be queued to be freed more or less immediately.

What Linux is doing for other I/O operations is to keep the relevant 
pages alive until the I/O operation is completed, but for GPUs that 
usually means keeping most of the memory of the process alive and that 
in turn is really not something you can do.

You can of course do this if your driver has a reliable way of killing 
your submissions and freeing resources in a reasonable amount of time. 
This should then be done in the flush callback.

> If we need to teardown on demand we just set the TDR to a minimum value and
> it kicks the jobs off the hardware, gracefully cleans everything up and
> drops all references. This is a benefit of the 1 to 1 relationship, not
> sure if this works with how AMDGPU uses the scheduler.
>
>> Delaying application tear down is also not an option because then you run
>> into massive trouble with the OOM killer (or more generally OOM handling).
>> See what we do in drm_sched_entity_flush() as well.
>>
> Not an issue for Xe, we never call drm_sched_entity_flush as our
> referencing counting scheme is all jobs are finished before we attempt
> to tear down entity / scheduler.

I don't think you can do that upstream. Calling drm_sched_entity_flush() 
is a must have from your flush callback for the file descriptor.

Unless you have some other method for killing your submissions this 
would give a path for a deny of service attack vector when the Xe driver 
is in use.

>> Since adding the TDR support we completely exercised this through in the
>> last two or three years or so. And to sum it up I would really like to get
>> away from this mess again.
>>
>> Compared to that what i915 does is actually rather clean I think.
>>
> Not even close, resets where a nightmare in the i915 (I spend years
> trying to get this right and probably still completely work) and in Xe
> basically got it right on the attempt.
>
>>>    Also in Xe some of
>>> things done in free_job cannot be from an IRQ context, hence calling
>>> this from the scheduler worker is rather helpful.
>> Well putting things for cleanup into a workitem doesn't sounds like
>> something hard.
>>
> That is exactly what we doing in the scheduler with the free_job
> workitem.

Yeah, but I think that we do it in the scheduler and not the driver is 
problematic.

For the scheduler it shouldn't care about the job any more as soon as 
the driver takes over.

>
>> Question is what do you really need for TDR which is not inside the hardware
>> fence?
>>
> A reference to the entity to be able to kick the job off the hardware.
> A reference to the entity, job, and VM for error capture.
>
> We also need a reference to the job for recovery after a GPU reset so
> run_job can be called again for innocent jobs.

Well exactly that's what I'm massively pushing back. Letting the 
scheduler call run_job() for the same job again is *NOT* something you 
can actually do.

This pretty clearly violates some of the dma_fence constrains and has 
cause massively headaches for me already.

What you can do is to do this inside your driver, e.g. take the jobs and 
push them again to the hw ring or just tell the hw to start executing 
again from a previous position.

BTW that re-submitting of jobs seems to be a no-go from userspace 
perspective as well. Take a look at the Vulkan spec for that, at least 
Marek pretty much pointed out that we should absolutely not do this 
inside the kernel.

The generally right approach seems to be to cleanly signal to userspace 
that something bad happened and that userspace then needs to submit 
things again even for innocent jobs.

Regards,
Christian.

>
> All of this leads to believe we need to stick with the design.
>
> Matt
>
>> Regards,
>> Christian.
>>
>>> The HW fence can live for longer as it can be installed in dma-resv
>>> slots, syncobjs, etc... If the job and hw fence are combined now we
>>> holding on the memory for the longer and perhaps at the mercy of the
>>> user. We also run the risk of the final put being done from an IRQ
>>> context which again wont work in Xe as it is currently coded. Lastly 2
>>> jobs from the same scheduler could do the final put in parallel, so
>>> rather than having free_job serialized by the worker now multiple jobs
>>> are freeing themselves at the same time. This might not be an issue but
>>> adds another level of raceyness that needs to be accounted for. None of
>>> this sounds desirable to me.
>>>
>>> FWIW what you suggesting sounds like how the i915 did things
>>> (i915_request and hw fence in 1 memory alloc) and that turned out to be
>>> a huge mess. As rule of thumb I generally do the opposite of whatever
>>> the i915 did.
>>>
>>> Matt
>>>
>>>> Christian.
>>>>
>>>>> Matt
>>>>>
>>>>>> All the lifetime issues we had came from ignoring this fact and I think we
>>>>>> should push for fixing this design up again.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>>>>>      include/drm/gpu_scheduler.h            |   8 +-
>>>>>>>      2 files changed, 106 insertions(+), 39 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index cede47afc800..b67469eac179 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>>       * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>>       *
>>>>>>>       * @rq: scheduler run queue to check.
>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>       *
>>>>>>>       * Try to find a ready entity, returns NULL if none found.
>>>>>>>       */
>>>>>>>      static struct drm_sched_entity *
>>>>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>>>>>      {
>>>>>>>      	struct drm_sched_entity *entity;
>>>>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>      	if (entity) {
>>>>>>>      		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>>>>>      			if (drm_sched_entity_is_ready(entity)) {
>>>>>>> -				rq->current_entity = entity;
>>>>>>> -				reinit_completion(&entity->entity_idle);
>>>>>>> +				if (dequeue) {
>>>>>>> +					rq->current_entity = entity;
>>>>>>> +					reinit_completion(&entity->entity_idle);
>>>>>>> +				}
>>>>>>>      				spin_unlock(&rq->lock);
>>>>>>>      				return entity;
>>>>>>>      			}
>>>>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>      	list_for_each_entry(entity, &rq->entities, list) {
>>>>>>>      		if (drm_sched_entity_is_ready(entity)) {
>>>>>>> -			rq->current_entity = entity;
>>>>>>> -			reinit_completion(&entity->entity_idle);
>>>>>>> +			if (dequeue) {
>>>>>>> +				rq->current_entity = entity;
>>>>>>> +				reinit_completion(&entity->entity_idle);
>>>>>>> +			}
>>>>>>>      			spin_unlock(&rq->lock);
>>>>>>>      			return entity;
>>>>>>>      		}
>>>>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>       * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>>>>>       *
>>>>>>>       * @rq: scheduler run queue to check.
>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>       *
>>>>>>>       * Find oldest waiting ready entity, returns NULL if none found.
>>>>>>>       */
>>>>>>>      static struct drm_sched_entity *
>>>>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>>>>>      {
>>>>>>>      	struct rb_node *rb;
>>>>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>      		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>>>>      		if (drm_sched_entity_is_ready(entity)) {
>>>>>>> -			rq->current_entity = entity;
>>>>>>> -			reinit_completion(&entity->entity_idle);
>>>>>>> +			if (dequeue) {
>>>>>>> +				rq->current_entity = entity;
>>>>>>> +				reinit_completion(&entity->entity_idle);
>>>>>>> +			}
>>>>>>>      			break;
>>>>>>>      		}
>>>>>>>      	}
>>>>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>      }
>>>>>>>      /**
>>>>>>> - * drm_sched_submit_queue - scheduler queue submission
>>>>>>> + * drm_sched_run_job_queue - queue job submission
>>>>>>>       * @sched: scheduler instance
>>>>>>>       */
>>>>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>>>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>>>>      {
>>>>>>>      	if (!READ_ONCE(sched->pause_submit))
>>>>>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>>>>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static struct drm_sched_entity *
>>>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>>>>>> + * @sched: scheduler instance
>>>>>>> + */
>>>>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>>>> +{
>>>>>>> +	if (drm_sched_select_entity(sched, false))
>>>>>>> +		drm_sched_run_job_queue(sched);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_sched_free_job_queue - queue free job
>>>>>>> + *
>>>>>>> + * @sched: scheduler instance to queue free job
>>>>>>> + */
>>>>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>>>>> +{
>>>>>>> +	if (!READ_ONCE(sched->pause_submit))
>>>>>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>>>>>> + *
>>>>>>> + * @sched: scheduler instance to queue free job
>>>>>>> + */
>>>>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>>>> +{
>>>>>>> +	struct drm_sched_job *job;
>>>>>>> +
>>>>>>> +	spin_lock(&sched->job_list_lock);
>>>>>>> +	job = list_first_entry_or_null(&sched->pending_list,
>>>>>>> +				       struct drm_sched_job, list);
>>>>>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>>>> +		drm_sched_free_job_queue(sched);
>>>>>>> +	spin_unlock(&sched->job_list_lock);
>>>>>>>      }
>>>>>>>      /**
>>>>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>>>>>      	dma_fence_get(&s_fence->finished);
>>>>>>>      	drm_sched_fence_finished(s_fence, result);
>>>>>>>      	dma_fence_put(&s_fence->finished);
>>>>>>> -	drm_sched_submit_queue(sched);
>>>>>>> +	drm_sched_free_job_queue(sched);
>>>>>>>      }
>>>>>>>      /**
>>>>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>>>>>      void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>>>>>      {
>>>>>>>      	if (drm_sched_can_queue(sched))
>>>>>>> -		drm_sched_submit_queue(sched);
>>>>>>> +		drm_sched_run_job_queue(sched);
>>>>>>>      }
>>>>>>>      /**
>>>>>>>       * drm_sched_select_entity - Select next entity to process
>>>>>>>       *
>>>>>>>       * @sched: scheduler instance
>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>       *
>>>>>>>       * Returns the entity to process or NULL if none are found.
>>>>>>>       */
>>>>>>>      static struct drm_sched_entity *
>>>>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>>>>>      {
>>>>>>>      	struct drm_sched_entity *entity;
>>>>>>>      	int i;
>>>>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>      	/* Kernel run queue has higher priority than normal run queue*/
>>>>>>>      	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>      		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>>>>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>>>>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>>>>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>>>>>> +							dequeue) :
>>>>>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>>>>>> +						      dequeue);
>>>>>>>      		if (entity)
>>>>>>>      			break;
>>>>>>>      	}
>>>>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>>      EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>>>      /**
>>>>>>> - * drm_sched_main - main scheduler thread
>>>>>>> + * drm_sched_free_job_work - worker to call free_job
>>>>>>>       *
>>>>>>> - * @param: scheduler instance
>>>>>>> + * @w: free job work
>>>>>>>       */
>>>>>>> -static void drm_sched_main(struct work_struct *w)
>>>>>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>>>>>      {
>>>>>>>      	struct drm_gpu_scheduler *sched =
>>>>>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>>>>>> -	struct drm_sched_entity *entity;
>>>>>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>>>      	struct drm_sched_job *cleanup_job;
>>>>>>> -	int r;
>>>>>>>      	if (READ_ONCE(sched->pause_submit))
>>>>>>>      		return;
>>>>>>>      	cleanup_job = drm_sched_get_cleanup_job(sched);
>>>>>>> -	entity = drm_sched_select_entity(sched);
>>>>>>> +	if (cleanup_job) {
>>>>>>> +		sched->ops->free_job(cleanup_job);
>>>>>>> +
>>>>>>> +		drm_sched_free_job_queue_if_ready(sched);
>>>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>>>> +	}
>>>>>>> +}
>>>>>>> -	if (!entity && !cleanup_job)
>>>>>>> -		return;	/* No more work */
>>>>>>> +/**
>>>>>>> + * drm_sched_run_job_work - worker to call run_job
>>>>>>> + *
>>>>>>> + * @w: run job work
>>>>>>> + */
>>>>>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>>>>>> +{
>>>>>>> +	struct drm_gpu_scheduler *sched =
>>>>>>> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>>>>> +	struct drm_sched_entity *entity;
>>>>>>> +	int r;
>>>>>>> -	if (cleanup_job)
>>>>>>> -		sched->ops->free_job(cleanup_job);
>>>>>>> +	if (READ_ONCE(sched->pause_submit))
>>>>>>> +		return;
>>>>>>> +	entity = drm_sched_select_entity(sched, true);
>>>>>>>      	if (entity) {
>>>>>>>      		struct dma_fence *fence;
>>>>>>>      		struct drm_sched_fence *s_fence;
>>>>>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>      		sched_job = drm_sched_entity_pop_job(entity);
>>>>>>>      		if (!sched_job) {
>>>>>>>      			complete_all(&entity->entity_idle);
>>>>>>> -			if (!cleanup_job)
>>>>>>> -				return;	/* No more work */
>>>>>>> -			goto again;
>>>>>>> +			return;	/* No more work */
>>>>>>>      		}
>>>>>>>      		s_fence = sched_job->s_fence;
>>>>>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>      		}
>>>>>>>      		wake_up(&sched->job_scheduled);
>>>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>>>>      	}
>>>>>>> -
>>>>>>> -again:
>>>>>>> -	drm_sched_submit_queue(sched);
>>>>>>>      }
>>>>>>>      /**
>>>>>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>>>      	spin_lock_init(&sched->job_list_lock);
>>>>>>>      	atomic_set(&sched->hw_rq_count, 0);
>>>>>>>      	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>>>>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>>>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>>>>>      	atomic_set(&sched->_score, 0);
>>>>>>>      	atomic64_set(&sched->job_id_count, 0);
>>>>>>>      	sched->pause_submit = false;
>>>>>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>>>>>      void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>>>>>      {
>>>>>>>      	WRITE_ONCE(sched->pause_submit, true);
>>>>>>> -	cancel_work_sync(&sched->work_submit);
>>>>>>> +	cancel_work_sync(&sched->work_run_job);
>>>>>>> +	cancel_work_sync(&sched->work_free_job);
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>>>      void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>>>>>      {
>>>>>>>      	WRITE_ONCE(sched->pause_submit, false);
>>>>>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>>>>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>>>>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL(drm_sched_submit_start);
>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>> index 04eec2d7635f..fbc083a92757 100644
>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>>>>>       *                 finished.
>>>>>>>       * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>>>>>       * @job_id_count: used to assign unique id to the each job.
>>>>>>> - * @submit_wq: workqueue used to queue @work_submit
>>>>>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>>>>>       * @timeout_wq: workqueue used to queue @work_tdr
>>>>>>> - * @work_submit: schedules jobs and cleans up entities
>>>>>>> + * @work_run_job: schedules jobs
>>>>>>> + * @work_free_job: cleans up jobs
>>>>>>>       * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>>>       *            timeout interval is over.
>>>>>>>       * @pending_list: the list of jobs which are currently in the job queue.
>>>>>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>>>>>      	atomic64_t			job_id_count;
>>>>>>>      	struct workqueue_struct		*submit_wq;
>>>>>>>      	struct workqueue_struct		*timeout_wq;
>>>>>>> -	struct work_struct		work_submit;
>>>>>>> +	struct work_struct		work_run_job;
>>>>>>> +	struct work_struct		work_free_job;
>>>>>>>      	struct delayed_work		work_tdr;
>>>>>>>      	struct list_head		pending_list;
>>>>>>>      	spinlock_t			job_list_lock;

