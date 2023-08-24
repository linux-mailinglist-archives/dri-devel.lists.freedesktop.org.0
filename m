Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE55786E34
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603DA10E533;
	Thu, 24 Aug 2023 11:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95C910E533;
 Thu, 24 Aug 2023 11:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks6iL6ILspE+/mWx44nZXLXZs6HpYSIwUGkP6DObUa0zgdN6tkICa6ckPX4WMdhVaPJ05oblB24DAd1Ip3vSLU53yOPgHD/UQhc4+qhX905hZzHm17FqongdHtik4yW6/wkZjc5S+isF1mv1fZFD34Z4BKiGYgiZTjw1Mb0CvHKJPAdTOzVklOMy+aHHbaJJ5a0T85Q9QzJmJKd2Z4iEXD2ctKygyCQfRfOwLDLQP4AZe+/uiEHxpaxjzKAKyEWb8QAbrvrDUKyHbslxbVNihGGKgQCqVym5mtNdSQYH+sPw3wKLERT+eKqnXkTSrKyVw/naMoQMJBQkD3Vf/ZnZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY6qnT4Y+uxKDt/SvRglKUQiG73NgAXaWM0Hs6SQjE8=;
 b=iEB7XNADegeGivBcZolVuDD/g2/7dtxC73i3hrHJ3XJ9ykXfXkb11Er0y9aTqV0Od3MrolhOJKFidkjTHYTSVWEfTeUVdcZkJey3ybZhTK1ihS4gvgPF3crrWWliC3xYcSKqcRUucW9GRTFKN3K7GPw7BghlbCHswYx85ULM2JJdgkj2RE4q889iPz7KPJP2aJnO7/swuw3S64Wl6+ISh4ogIIh9TSexGUxiwsClg47tpjFY9K1iwB/MOhnqatoRjMLspg0DYh60gmWxxruHCpH2urdFNBjs2jIDt9ZcTZZirC81aFarBNBqNebwhic/faxZRBLe/qb9j2eRShghpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6qnT4Y+uxKDt/SvRglKUQiG73NgAXaWM0Hs6SQjE8=;
 b=4FEjUJNUmOROUfC2/cNGkklp2vNowDuCWaJgDXaw7+vNO/mfboA+aoYx8LXRF4Ix2al3ACK4T/qIScfehxD75EHkCilQJtpyZiKnXM+h1nv+gEbJDEOfzAWhL0r7f5yclOvOV8PKTomgay5dLITNjkJ66rZKjAY8p47OIHWbAeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB9242.namprd12.prod.outlook.com (2603:10b6:a03:56f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 11:44:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:44:49 +0000
Message-ID: <fcf1cbe2-4a90-7ed2-b950-36d03cb78ca7@amd.com>
Date: Thu, 24 Aug 2023 13:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [PATCH v2 4/9] drm/sched: Split free_job into own work
 item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
 <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
 <eb95b02f-7ffa-0cff-eac4-2bd8d12da730@amd.com>
 <ZOYkmAbzRFZzzQKK@DUT025-TGLU.fm.intel.com>
 <CADnq5_N9tn+iBbeGDBu5GMVEzrBA5zzZfEKizp=T21OvowtNhw@mail.gmail.com>
 <ZOZBMcP/TW5mSbwj@intel.com> <ZOaSaKA+LrEglY+G@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZOaSaKA+LrEglY+G@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 17521bd9-0169-4e25-8268-08dba4978467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QODC0Za8usFch8Zl0BcFmHp9iL6dk3d5yeTzqvc1tleNwQioF9D1xUqcEftq1sMJrJe6BvVs4yXFb3V+isoFHR8ByKJSTPgQbGta2vxxWWcT/MDOw9IuMFXF2+KoT5v8rCA50nBwQiSuRWArq45uvbc5Honl8s165gpxCiuc3QKm+0DvixFWKfOHc+21ZKgD1pgNwG1Khao58h42UqTYSvbJzp+9I2gz+v4aYW16PncgfTxk1/aK5NNnRtZ6in/31UiKCXMsg2Y5QMH2FH/tb3k0SrpKQSpHWC6+861It0IfOzUqE2VE2HEbphyHPspVShJNEuQmzyWs8Ot+c9qwtmJ3cnovMDCRf++7VrmjvDqG68xnuuPcH2SIeyPrxIC/U+QazF431U+Vvh12TJVMWkapqigTNpjfG6yNT6qttQXnLV7k4wIWky7F0fXzrPuA/Ohf7ei54qTXaoO9FPJ0RPWXVAv9nHzoTRXowoDFsGRlt5/bYeN8xdu31OcM974zEnAEGHNcrb7KXqxWK/xeczMcFXyWEoTb/lxf99LykZ5+v5lTQ4gImbCZw+6pddYF5XNWZifu+pG4qh3YsF0DBsnGKSaVogX6xvhGI/CKvcYbjgWIZbIezvaQjUqjDMHSCkvB+gI9Zw5EIT6ibUZEAlmscqZOmv5Z7Ketrdf+h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(1800799009)(186009)(451199024)(83380400001)(30864003)(66574015)(2906002)(36756003)(31696002)(38100700002)(86362001)(41300700001)(6512007)(110136005)(66476007)(66556008)(66946007)(316002)(6506007)(6486002)(53546011)(2616005)(4326008)(8936002)(8676002)(478600001)(966005)(6666004)(31686004)(26005)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUt4dVF2anVpT0JYd002cGV2UjFzaXJaS3dsQ3ZvZkRxQ1lKTFZ2RVc5NmN4?=
 =?utf-8?B?UmNSWk0vQ2RKUVpCK3cvTzJ4Q3VZUXRsOElJNTZ1b3QwZmxFZ1hQWGlDY3pL?=
 =?utf-8?B?M3lYSkkzT1JxaXJMWFZUZkV5dldKNmFoNmJJa3B0V200c3VrcTVSQUJOV2dF?=
 =?utf-8?B?WDl4RGdGSTJwcTlHdGJnRFdDOHJsYUsrblAvOEtPbDZLcXBkWEo2amFkcE5t?=
 =?utf-8?B?Q3RqZy9zRm5VaUJLZTB0ZGd2MWxyOGZTa2tUcVovM041c1RNczRNcFJsK05v?=
 =?utf-8?B?Qmp0alA3dlprQTh2UlJNaW1YbnRZYWJuNmQwSm5wNEY3aVZRaTBiZnRoMmhu?=
 =?utf-8?B?NlJYU21kRTdCblBlYmRzZEZ3S2NsT2hhZ1BZR2hyZi82YTVkeVhMNmJxdVJC?=
 =?utf-8?B?UHhKdGlxZ2VFSEJtN3htV212SXZTKytKQlc0b1EyZi8vSmNnQTBIM3pTcWlV?=
 =?utf-8?B?Z0xpUTBZR2tJRTVvazBrdmxseFNJZVFVZXRRaEMxUnlGVVV5SHQwdVp3Qita?=
 =?utf-8?B?NXlwekVzajlTR09MODhWdElsSjk5T0Y2MzZHZGZqVHJneStmSStzVGpLSWRt?=
 =?utf-8?B?QjFXMS9PY3E2VlpnSVB5STgxTlJnajY3aUZGVFdkcVdGYXJJT2FIT3lsS1l4?=
 =?utf-8?B?OUF4b253aEpGMVFGN3o0cFB0eTM5UlNjWkZJV2RrVUZvcGJKS0czQ045Qlhl?=
 =?utf-8?B?dDlyODUxRzV1ajE0QW16c3lBWTFUYnNsYzFNRStNaUhsUk1GOGZ4MjNTZlY2?=
 =?utf-8?B?WDFJSm5rMlVpcFJyUHlCQjEvNEw0clN4cHdra2ppdW5kY2JxNFRlQ2UzTGZz?=
 =?utf-8?B?WERpQ2t1WVptdkpacHBLM3VndGdNci9YaGRQWHBwZDE2a283YUZCN0hoTHRj?=
 =?utf-8?B?dEVkZEZxSWFZMEVudC9KVHc4Zzl3SUJmU3E0ZDhaOHc5T0NQYWhUMjE0a3I2?=
 =?utf-8?B?VjkzU0g0WittNVhENjRPN0lVdEZLeExQMVN0dm5YVnhQU21tVnRUM0hSTFB0?=
 =?utf-8?B?SXhQRFNtNzJJUkpoR09iaXZ6eGN5ajYvcER0TGpOaktVVTk1ZkU5YW9JUThu?=
 =?utf-8?B?SWdJTnNzeFc5a01BMGRxVTEvTXhXbzZUaGIvcGh1bXRVMG5TZmY2VVVyQmRW?=
 =?utf-8?B?Sk13YlB2V2RJTEEvYXp2Vm03czhQczZNdk1aRjNxVXZQbnlueFJMOHpzZ2Rz?=
 =?utf-8?B?ZlY3OTBIZW4wbittQlZVbWZkRktTaExjTE8zY2xFTk5ONUFSVUhyQTRVZTRP?=
 =?utf-8?B?N1RBcXdHcjdFQ0J6OXk5akFRcWNsRis4R3RwK3kvTlM1ajVDY3RNUWhNSy9m?=
 =?utf-8?B?UlJnZFV0T285bWR3WkUwMU5ucEpRVmdTOEg4aTNuaElhd1dsRnJqcmc1d1Fz?=
 =?utf-8?B?LzdkNklXWTBwZDdOU3p4alpiY21qcEQrekZvazErSllqZU9SWDB5Wnc0NlBK?=
 =?utf-8?B?Y0lEOVJ1Qmo3QXVrclJZNEJmUFd5WFZhQUh1Qlh0U0pFQURyMGt3MkFkNTFm?=
 =?utf-8?B?SVM0TDFyendOOFQwZEdMdG5TQmtoNkI4T2M0aCtYNlAvUU9NVjhWYnYvbXF5?=
 =?utf-8?B?Rzg0ZmxWOXBiVkVyWUdnYXV3ZEt3dFhQZjd2YklaQktFOFIxZkh5SHRXTlpw?=
 =?utf-8?B?bkJIUzgwaXVFbmRTYmJTUi95VTdiRDJ3RjBSc0tYcEVrTUdyUTgwYktOQTJa?=
 =?utf-8?B?OE9GMzJlZCtkdkNDTmkwQm1xNWhJYU1jbWhzTi9SNkxYYjdDY28zWXI1blJJ?=
 =?utf-8?B?b2liTS9mSmg2N3R5SXh1eTJwZS9KajdabDAvckltenJVUDFSOTVhSWxnRUEx?=
 =?utf-8?B?TjVzOWNZajBEQVBkNzVsU1JVSm4ydS9rWW4wMUJOeW1meE56aXJGbkd2VGM1?=
 =?utf-8?B?Um4vQ0hZcC8rU2pWV0lxMEJFcGdzaFpZMm02bjRjQ3RhaDJDUGNnQjJJNHlF?=
 =?utf-8?B?TlIrajdOTFdYVElhSktWWnhsY3htL1RYZFNWYnViNXZOVXloV1ROeTZrTmg4?=
 =?utf-8?B?VGlQcHdhSU1Fck9RYlBZU3QxM1JyR3dyQ2NVMm5LMW16QXZNemlaaHZwWSt3?=
 =?utf-8?B?NUdZWXJ6M2E2akNGMFRwRDdFSW1aUWVRUnhLMU9XR0FRZWhRcmtXdUluWmhQ?=
 =?utf-8?Q?hPUw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17521bd9-0169-4e25-8268-08dba4978467
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:44:49.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOuUGPnPpjSvtekFXQ0uMOzhsX7Wn8fc74hfmb9EqjJVoFwMKS3Gaou6rte41hVL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9242
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.23 um 01:12 schrieb Matthew Brost:
> On Wed, Aug 23, 2023 at 01:26:09PM -0400, Rodrigo Vivi wrote:
>> On Wed, Aug 23, 2023 at 11:41:19AM -0400, Alex Deucher wrote:
>>> On Wed, Aug 23, 2023 at 11:26 AM Matthew Brost <matthew.brost@intel.com> wrote:
>>>> On Wed, Aug 23, 2023 at 09:10:51AM +0200, Christian König wrote:
>>>>> Am 23.08.23 um 05:27 schrieb Matthew Brost:
>>>>>> [SNIP]
>>>>>>> That is exactly what I want to avoid, tying the TDR to the job is what some
>>>>>>> AMD engineers pushed for because it looked like a simple solution and made
>>>>>>> the whole thing similar to what Windows does.
>>>>>>>
>>>>>>> This turned the previous relatively clean scheduler and TDR design into a
>>>>>>> complete nightmare. The job contains quite a bunch of things which are not
>>>>>>> necessarily available after the application which submitted the job is torn
>>>>>>> down.
>>>>>>>
>>>>>> Agree the TDR shouldn't be accessing anything application specific
>>>>>> rather just internal job state required to tear the job down on the
>>>>>> hardware.
>>>>>>> So what happens is that you either have stale pointers in the TDR which can
>>>>>>> go boom extremely easily or we somehow find a way to keep the necessary
>>>>>> I have not experenced the TDR going boom in Xe.
>>>>>>
>>>>>>> structures (which include struct thread_info and struct file for this driver
>>>>>>> connection) alive until all submissions are completed.
>>>>>>>
>>>>>> In Xe we keep everything alive until all submissions are completed. By
>>>>>> everything I mean the drm job, entity, scheduler, and VM via a reference
>>>>>> counting scheme. All of these structures are just kernel state which can
>>>>>> safely be accessed even if the application has been killed.
>>>>> Yeah, but that might just not be such a good idea from memory management
>>>>> point of view.
>>>>>
>>>>> When you (for example) kill a process all resource from that progress should
>>>>> at least be queued to be freed more or less immediately.
>>>>>
>>>> We do this, the TDR kicks jobs off the hardware as fast as the hw
>>>> interface allows and signals all pending hw fences immediately after.
>>>> Free jobs then is immediately called and the reference count goes to
>>>> zero. I think max time for all of this to occur is a handful of ms.
>>>>
>>>>> What Linux is doing for other I/O operations is to keep the relevant pages
>>>>> alive until the I/O operation is completed, but for GPUs that usually means
>>>>> keeping most of the memory of the process alive and that in turn is really
>>>>> not something you can do.
>>>>>
>>>>> You can of course do this if your driver has a reliable way of killing your
>>>>> submissions and freeing resources in a reasonable amount of time. This
>>>>> should then be done in the flush callback.
>>>>>
>>>> 'flush callback' - Do you mean drm_sched_entity_flush? I looked at that
>>>> and think that function doesn't even work for what I tell. It flushes
>>>> the spsc queue but what about jobs on the hardware, how do those get
>>>> killed?
>>>>
>>>> As stated we do via the TDR which is rather clean design and fits with
>>>> our reference couting scheme.
>>>>
>>>>>> If we need to teardown on demand we just set the TDR to a minimum value and
>>>>>> it kicks the jobs off the hardware, gracefully cleans everything up and
>>>>>> drops all references. This is a benefit of the 1 to 1 relationship, not
>>>>>> sure if this works with how AMDGPU uses the scheduler.
>>>>>>
>>>>>>> Delaying application tear down is also not an option because then you run
>>>>>>> into massive trouble with the OOM killer (or more generally OOM handling).
>>>>>>> See what we do in drm_sched_entity_flush() as well.
>>>>>>>
>>>>>> Not an issue for Xe, we never call drm_sched_entity_flush as our
>>>>>> referencing counting scheme is all jobs are finished before we attempt
>>>>>> to tear down entity / scheduler.
>>>>> I don't think you can do that upstream. Calling drm_sched_entity_flush() is
>>>>> a must have from your flush callback for the file descriptor.
>>>>>
>>>> Again 'flush callback'? What are you refering too.
>>>>
>>>> And why does drm_sched_entity_flush need to be called, doesn't seem to
>>>> do anything useful.
>>>>
>>>>> Unless you have some other method for killing your submissions this would
>>>>> give a path for a deny of service attack vector when the Xe driver is in
>>>>> use.
>>>>>
>>>> Yes, once th TDR fires is disallows all new submissions at the exec
>>>> IOCTL plus flushes any pending submissions as fast as possible.
>>>>
>>>>>>> Since adding the TDR support we completely exercised this through in the
>>>>>>> last two or three years or so. And to sum it up I would really like to get
>>>>>>> away from this mess again.
>>>>>>>
>>>>>>> Compared to that what i915 does is actually rather clean I think.
>>>>>>>
>>>>>> Not even close, resets where a nightmare in the i915 (I spend years
>>>>>> trying to get this right and probably still completely work) and in Xe
>>>>>> basically got it right on the attempt.
>>>>>>
>>>>>>>>     Also in Xe some of
>>>>>>>> things done in free_job cannot be from an IRQ context, hence calling
>>>>>>>> this from the scheduler worker is rather helpful.
>>>>>>> Well putting things for cleanup into a workitem doesn't sounds like
>>>>>>> something hard.
>>>>>>>
>>>>>> That is exactly what we doing in the scheduler with the free_job
>>>>>> workitem.
>>>>> Yeah, but I think that we do it in the scheduler and not the driver is
>>>>> problematic.
>> Christian, I do see your point on simply get rid of free job callbacks here
>> then use fence with own-driver workqueue and house cleaning. But I wonder if
>> starting with this patch as a clear separation of that is not a step forward
>> and that could be cleaned up on a follow up!?
>>
>> Matt, why exactly do we need the separation in this patch? Commit message tells
>> what it is doing and that it is aligned with design, but is not clear on why
>> exactly we need this right now. Specially if in the end what we want is exactly
>> keeping the submit_wq to ensure the serialization of the operations you mentioned.
>> I mean, could we simply drop this patch and then work on a follow-up later and
>> investigate the Christian suggestion when we are in-tree?
>>
> I believe Christian suggested this change in a previous rev (free_job,
> proccess_msg) in there own workitem [1].
>
> Dropping free_job / calling run_job again is really a completely
> different topic than this patch.

Yeah, agree. I just wanted to bring this up before we put even more 
effort in the free_job based approach.

Rodrigos point is a really good one, no matter if the driver or the 
scheduler frees the job. Doing that in a separate work item sounds like 
the right thing to do.

Regards,
Christian.

>
> [1] https://patchwork.freedesktop.org/patch/550722/?series=121745&rev=1
>
>>>> Disagree, a common clean callback from a non-irq contexts IMO is a good
>>>> design rather than each driver possibly having its own worker for
>>>> cleanup.
>>>>
>>>>> For the scheduler it shouldn't care about the job any more as soon as the
>>>>> driver takes over.
>>>>>
>>>> This a massive rewrite for all users of the DRM scheduler, I'm saying
>>>> for Xe what you are suggesting makes little to no sense.
>>>>
>>>> I'd like other users of the DRM scheduler to chime in on what you
>>>> purposing. The scope of this change affects 8ish drivers that would
>>>> require buy in each of the stakeholders. I certainly can't change of
>>>> these drivers as I don't feel comfortable in all of those code bases nor
>>>> do I have hardware to test all of these drivers.
>>>>
>>>>>>> Question is what do you really need for TDR which is not inside the hardware
>>>>>>> fence?
>>>>>>>
>>>>>> A reference to the entity to be able to kick the job off the hardware.
>>>>>> A reference to the entity, job, and VM for error capture.
>>>>>>
>>>>>> We also need a reference to the job for recovery after a GPU reset so
>>>>>> run_job can be called again for innocent jobs.
>>>>> Well exactly that's what I'm massively pushing back. Letting the scheduler
>>>>> call run_job() for the same job again is *NOT* something you can actually
>>>>> do.
>>>>>
>>>> But lots of drivers do this already and the DRM scheduler documents
>>>> this.
>>>>
>>>>> This pretty clearly violates some of the dma_fence constrains and has cause
>>>>> massively headaches for me already.
>>>>>
>>>> Seems to work fine in Xe.
>>>>
>>>>> What you can do is to do this inside your driver, e.g. take the jobs and
>>>>> push them again to the hw ring or just tell the hw to start executing again
>>>>> from a previous position.
>>>>>
>>>> Again this now is massive rewrite of many drivers.
>>>>
>>>>> BTW that re-submitting of jobs seems to be a no-go from userspace
>>>>> perspective as well. Take a look at the Vulkan spec for that, at least Marek
>>>>> pretty much pointed out that we should absolutely not do this inside the
>>>>> kernel.
>>>>>
>>>> Yes if the job causes the hang, we ban the queue. Typcially only per
>>>> entity (queue) resets are done in Xe but occasionally device level
>>>> resets are done (issues with hardware) and innocent jobs / entities call
>>>> run_job again.
>>> If the engine is reset and the job was already executing, how can you
>>> determine that it's in a good state to resubmit?  What if some
> If a job has started but not completed we ban the queue during device
> reset. If a queue have jobs submitted but not started we resubmit all
> jobs on the queue during device reset.
>
> The started / completed state can be determined by looking at a seqno in
> memory.
>
>>> internal fence or semaphore in memory used by the logic in the command
>>> buffer has been signaled already and then you resubmit the job and it
>>> now starts executing with different input state?
>> I believe we could set some more rules in the new robustness documentation:
>> https://lore.kernel.org/all/20230818200642.276735-1-andrealmeid@igalia.com/
>>
>> For this robustness implementation i915 pin point the exact context that
>> was in execution when the gpu hang and only blame that, although the
>> ressubmission is up to the user space. While on Xe we are blaming every
>> single context that was in the queue. So I'm actually confused on what
>> are the innocent jobs and who are calling for resubmission, if all of
>> them got banned and blamed.
> See above, innocent job == submited job but not started (i.e. a job
> stuck in the FW queue not yet been put on the hardware). Because we have
> a FW scheduler we could have 1000s of innocent jobs that don't need to
> get banned. This is very different from drivers without FW schedulers as
> typically when run_job is called the job hits the hardware immediately.
>
> Matt
>
>>> Alex
>>>
>>>>> The generally right approach seems to be to cleanly signal to userspace that
>>>>> something bad happened and that userspace then needs to submit things again
>>>>> even for innocent jobs.
>>>>>
>>>> I disagree that innocent jobs should be banned. What you are suggesting
>>>> is if a device reset needs to be done we kill / ban every user space queue.
>>>> Thats seems like overkill. Not seeing where that is stated in this doc
>>>> [1], it seems to imply that only jobs that are stuck results in bans.
>>>>
>>>> Matt
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/553465/?series=119883&rev=3
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> All of this leads to believe we need to stick with the design.
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> The HW fence can live for longer as it can be installed in dma-resv
>>>>>>>> slots, syncobjs, etc... If the job and hw fence are combined now we
>>>>>>>> holding on the memory for the longer and perhaps at the mercy of the
>>>>>>>> user. We also run the risk of the final put being done from an IRQ
>>>>>>>> context which again wont work in Xe as it is currently coded. Lastly 2
>>>>>>>> jobs from the same scheduler could do the final put in parallel, so
>>>>>>>> rather than having free_job serialized by the worker now multiple jobs
>>>>>>>> are freeing themselves at the same time. This might not be an issue but
>>>>>>>> adds another level of raceyness that needs to be accounted for. None of
>>>>>>>> this sounds desirable to me.
>>>>>>>>
>>>>>>>> FWIW what you suggesting sounds like how the i915 did things
>>>>>>>> (i915_request and hw fence in 1 memory alloc) and that turned out to be
>>>>>>>> a huge mess. As rule of thumb I generally do the opposite of whatever
>>>>>>>> the i915 did.
>>>>>>>>
>>>>>>>> Matt
>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Matt
>>>>>>>>>>
>>>>>>>>>>> All the lifetime issues we had came from ignoring this fact and I think we
>>>>>>>>>>> should push for fixing this design up again.
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>>>>>>>>>>       include/drm/gpu_scheduler.h            |   8 +-
>>>>>>>>>>>>       2 files changed, 106 insertions(+), 39 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> index cede47afc800..b67469eac179 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>>>>>>>        * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * @rq: scheduler run queue to check.
>>>>>>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * Try to find a ready entity, returns NULL if none found.
>>>>>>>>>>>>        */
>>>>>>>>>>>>       static struct drm_sched_entity *
>>>>>>>>>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          struct drm_sched_entity *entity;
>>>>>>>>>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>>>>>          if (entity) {
>>>>>>>>>>>>                  list_for_each_entry_continue(entity, &rq->entities, list) {
>>>>>>>>>>>>                          if (drm_sched_entity_is_ready(entity)) {
>>>>>>>>>>>> -                               rq->current_entity = entity;
>>>>>>>>>>>> -                               reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                               if (dequeue) {
>>>>>>>>>>>> +                                       rq->current_entity = entity;
>>>>>>>>>>>> +                                       reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                               }
>>>>>>>>>>>>                                  spin_unlock(&rq->lock);
>>>>>>>>>>>>                                  return entity;
>>>>>>>>>>>>                          }
>>>>>>>>>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>>>>>          list_for_each_entry(entity, &rq->entities, list) {
>>>>>>>>>>>>                  if (drm_sched_entity_is_ready(entity)) {
>>>>>>>>>>>> -                       rq->current_entity = entity;
>>>>>>>>>>>> -                       reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                       if (dequeue) {
>>>>>>>>>>>> +                               rq->current_entity = entity;
>>>>>>>>>>>> +                               reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                       }
>>>>>>>>>>>>                          spin_unlock(&rq->lock);
>>>>>>>>>>>>                          return entity;
>>>>>>>>>>>>                  }
>>>>>>>>>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>>>>>        * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * @rq: scheduler run queue to check.
>>>>>>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * Find oldest waiting ready entity, returns NULL if none found.
>>>>>>>>>>>>        */
>>>>>>>>>>>>       static struct drm_sched_entity *
>>>>>>>>>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          struct rb_node *rb;
>>>>>>>>>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>>>>>>                  entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>>>>>>>>>                  if (drm_sched_entity_is_ready(entity)) {
>>>>>>>>>>>> -                       rq->current_entity = entity;
>>>>>>>>>>>> -                       reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                       if (dequeue) {
>>>>>>>>>>>> +                               rq->current_entity = entity;
>>>>>>>>>>>> +                               reinit_completion(&entity->entity_idle);
>>>>>>>>>>>> +                       }
>>>>>>>>>>>>                          break;
>>>>>>>>>>>>                  }
>>>>>>>>>>>>          }
>>>>>>>>>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>>>>>>       }
>>>>>>>>>>>>       /**
>>>>>>>>>>>> - * drm_sched_submit_queue - scheduler queue submission
>>>>>>>>>>>> + * drm_sched_run_job_queue - queue job submission
>>>>>>>>>>>>        * @sched: scheduler instance
>>>>>>>>>>>>        */
>>>>>>>>>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          if (!READ_ONCE(sched->pause_submit))
>>>>>>>>>>>> -               queue_work(sched->submit_wq, &sched->work_submit);
>>>>>>>>>>>> +               queue_work(sched->submit_wq, &sched->work_run_job);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +static struct drm_sched_entity *
>>>>>>>>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
>>>>>>>>>>>> +
>>>>>>>>>>>> +/**
>>>>>>>>>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>>>>>>>>>>> + * @sched: scheduler instance
>>>>>>>>>>>> + */
>>>>>>>>>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +       if (drm_sched_select_entity(sched, false))
>>>>>>>>>>>> +               drm_sched_run_job_queue(sched);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +/**
>>>>>>>>>>>> + * drm_sched_free_job_queue - queue free job
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * @sched: scheduler instance to queue free job
>>>>>>>>>>>> + */
>>>>>>>>>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +       if (!READ_ONCE(sched->pause_submit))
>>>>>>>>>>>> +               queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +/**
>>>>>>>>>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * @sched: scheduler instance to queue free job
>>>>>>>>>>>> + */
>>>>>>>>>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +       struct drm_sched_job *job;
>>>>>>>>>>>> +
>>>>>>>>>>>> +       spin_lock(&sched->job_list_lock);
>>>>>>>>>>>> +       job = list_first_entry_or_null(&sched->pending_list,
>>>>>>>>>>>> +                                      struct drm_sched_job, list);
>>>>>>>>>>>> +       if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>>>>>>>>> +               drm_sched_free_job_queue(sched);
>>>>>>>>>>>> +       spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       /**
>>>>>>>>>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>>>>>>>>>>          dma_fence_get(&s_fence->finished);
>>>>>>>>>>>>          drm_sched_fence_finished(s_fence, result);
>>>>>>>>>>>>          dma_fence_put(&s_fence->finished);
>>>>>>>>>>>> -       drm_sched_submit_queue(sched);
>>>>>>>>>>>> +       drm_sched_free_job_queue(sched);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       /**
>>>>>>>>>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>       void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          if (drm_sched_can_queue(sched))
>>>>>>>>>>>> -               drm_sched_submit_queue(sched);
>>>>>>>>>>>> +               drm_sched_run_job_queue(sched);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       /**
>>>>>>>>>>>>        * drm_sched_select_entity - Select next entity to process
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * @sched: scheduler instance
>>>>>>>>>>>> + * @dequeue: dequeue selected entity
>>>>>>>>>>>>        *
>>>>>>>>>>>>        * Returns the entity to process or NULL if none are found.
>>>>>>>>>>>>        */
>>>>>>>>>>>>       static struct drm_sched_entity *
>>>>>>>>>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          struct drm_sched_entity *entity;
>>>>>>>>>>>>          int i;
>>>>>>>>>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>          /* Kernel run queue has higher priority than normal run queue*/
>>>>>>>>>>>>          for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>>>>>>                  entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>>>>>>>>>>> -                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>>>>>>>>>>> -                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>>>>>>>>>>> +                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>>>>>>>>>>> +                                                       dequeue) :
>>>>>>>>>>>> +                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>>>>>>>>>>> +                                                     dequeue);
>>>>>>>>>>>>                  if (entity)
>>>>>>>>>>>>                          break;
>>>>>>>>>>>>          }
>>>>>>>>>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>>>>>>>       EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>>>>>>>>       /**
>>>>>>>>>>>> - * drm_sched_main - main scheduler thread
>>>>>>>>>>>> + * drm_sched_free_job_work - worker to call free_job
>>>>>>>>>>>>        *
>>>>>>>>>>>> - * @param: scheduler instance
>>>>>>>>>>>> + * @w: free job work
>>>>>>>>>>>>        */
>>>>>>>>>>>> -static void drm_sched_main(struct work_struct *w)
>>>>>>>>>>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          struct drm_gpu_scheduler *sched =
>>>>>>>>>>>> -               container_of(w, struct drm_gpu_scheduler, work_submit);
>>>>>>>>>>>> -       struct drm_sched_entity *entity;
>>>>>>>>>>>> +               container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>>>>>>>>          struct drm_sched_job *cleanup_job;
>>>>>>>>>>>> -       int r;
>>>>>>>>>>>>          if (READ_ONCE(sched->pause_submit))
>>>>>>>>>>>>                  return;
>>>>>>>>>>>>          cleanup_job = drm_sched_get_cleanup_job(sched);
>>>>>>>>>>>> -       entity = drm_sched_select_entity(sched);
>>>>>>>>>>>> +       if (cleanup_job) {
>>>>>>>>>>>> +               sched->ops->free_job(cleanup_job);
>>>>>>>>>>>> +
>>>>>>>>>>>> +               drm_sched_free_job_queue_if_ready(sched);
>>>>>>>>>>>> +               drm_sched_run_job_queue_if_ready(sched);
>>>>>>>>>>>> +       }
>>>>>>>>>>>> +}
>>>>>>>>>>>> -       if (!entity && !cleanup_job)
>>>>>>>>>>>> -               return; /* No more work */
>>>>>>>>>>>> +/**
>>>>>>>>>>>> + * drm_sched_run_job_work - worker to call run_job
>>>>>>>>>>>> + *
>>>>>>>>>>>> + * @w: run job work
>>>>>>>>>>>> + */
>>>>>>>>>>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +       struct drm_gpu_scheduler *sched =
>>>>>>>>>>>> +               container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>>>>>>>>>> +       struct drm_sched_entity *entity;
>>>>>>>>>>>> +       int r;
>>>>>>>>>>>> -       if (cleanup_job)
>>>>>>>>>>>> -               sched->ops->free_job(cleanup_job);
>>>>>>>>>>>> +       if (READ_ONCE(sched->pause_submit))
>>>>>>>>>>>> +               return;
>>>>>>>>>>>> +       entity = drm_sched_select_entity(sched, true);
>>>>>>>>>>>>          if (entity) {
>>>>>>>>>>>>                  struct dma_fence *fence;
>>>>>>>>>>>>                  struct drm_sched_fence *s_fence;
>>>>>>>>>>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>>>>>>                  sched_job = drm_sched_entity_pop_job(entity);
>>>>>>>>>>>>                  if (!sched_job) {
>>>>>>>>>>>>                          complete_all(&entity->entity_idle);
>>>>>>>>>>>> -                       if (!cleanup_job)
>>>>>>>>>>>> -                               return; /* No more work */
>>>>>>>>>>>> -                       goto again;
>>>>>>>>>>>> +                       return; /* No more work */
>>>>>>>>>>>>                  }
>>>>>>>>>>>>                  s_fence = sched_job->s_fence;
>>>>>>>>>>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>>>>>>                  }
>>>>>>>>>>>>                  wake_up(&sched->job_scheduled);
>>>>>>>>>>>> +               drm_sched_run_job_queue_if_ready(sched);
>>>>>>>>>>>>          }
>>>>>>>>>>>> -
>>>>>>>>>>>> -again:
>>>>>>>>>>>> -       drm_sched_submit_queue(sched);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       /**
>>>>>>>>>>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>>>>>>>>          spin_lock_init(&sched->job_list_lock);
>>>>>>>>>>>>          atomic_set(&sched->hw_rq_count, 0);
>>>>>>>>>>>>          INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>>>>>>>>> -       INIT_WORK(&sched->work_submit, drm_sched_main);
>>>>>>>>>>>> +       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>>>>>>>>>> +       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>>>>>>>>>>          atomic_set(&sched->_score, 0);
>>>>>>>>>>>>          atomic64_set(&sched->job_id_count, 0);
>>>>>>>>>>>>          sched->pause_submit = false;
>>>>>>>>>>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>>>>>>>>>>       void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          WRITE_ONCE(sched->pause_submit, true);
>>>>>>>>>>>> -       cancel_work_sync(&sched->work_submit);
>>>>>>>>>>>> +       cancel_work_sync(&sched->work_run_job);
>>>>>>>>>>>> +       cancel_work_sync(&sched->work_free_job);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>>>>>>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>>>>>>>>       void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>>>>>>>>>>       {
>>>>>>>>>>>>          WRITE_ONCE(sched->pause_submit, false);
>>>>>>>>>>>> -       queue_work(sched->submit_wq, &sched->work_submit);
>>>>>>>>>>>> +       queue_work(sched->submit_wq, &sched->work_run_job);
>>>>>>>>>>>> +       queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       EXPORT_SYMBOL(drm_sched_submit_start);
>>>>>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>>>>>> index 04eec2d7635f..fbc083a92757 100644
>>>>>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>>>>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>>>>>>>>>>        *                 finished.
>>>>>>>>>>>>        * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>>>>>>>>>>        * @job_id_count: used to assign unique id to the each job.
>>>>>>>>>>>> - * @submit_wq: workqueue used to queue @work_submit
>>>>>>>>>>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>>>>>>>>>>        * @timeout_wq: workqueue used to queue @work_tdr
>>>>>>>>>>>> - * @work_submit: schedules jobs and cleans up entities
>>>>>>>>>>>> + * @work_run_job: schedules jobs
>>>>>>>>>>>> + * @work_free_job: cleans up jobs
>>>>>>>>>>>>        * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>>>>>>>>        *            timeout interval is over.
>>>>>>>>>>>>        * @pending_list: the list of jobs which are currently in the job queue.
>>>>>>>>>>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>>>>>>>>>>          atomic64_t                      job_id_count;
>>>>>>>>>>>>          struct workqueue_struct         *submit_wq;
>>>>>>>>>>>>          struct workqueue_struct         *timeout_wq;
>>>>>>>>>>>> -       struct work_struct              work_submit;
>>>>>>>>>>>> +       struct work_struct              work_run_job;
>>>>>>>>>>>> +       struct work_struct              work_free_job;
>>>>>>>>>>>>          struct delayed_work             work_tdr;
>>>>>>>>>>>>          struct list_head                pending_list;
>>>>>>>>>>>>          spinlock_t                      job_list_lock;

