Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1576ED4F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44410E60C;
	Thu,  3 Aug 2023 14:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B4010E1FD;
 Thu,  3 Aug 2023 14:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUK6eVBDJuukU9Kup0ZbLLfKQkK0hUkuLVUl9IqYlhkGPesqE5Pee7tJmBU8X7CW1radseHG39F1Hp28aYCdYM5d+BroAY8XR9c5aNljjMRctMpJbLn6StIHAM9okM1YkuNqhzntR1OT1NPE3vnEKrwOag2kVfqCZrk9kszbWy0P+PHpdnGx+BhPrABIPpe2Lfdne9/qSgx4Tiyhzv346ONtLVbdypnb6RmfJGbSuZrSw0rxIh0RR9P3mmA6FJG1JUF+81vN/hcGUl/ElSGdDhE5PwEtSfdPampx1/StiblVdheEkUMwBeikx62xYrPzSVpbhGczvZ6T1K/NIoOy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swMldPqiFZxqXMI1Dr6NAnzfF64HeCDiQ9F2Yent2zk=;
 b=COzv8yBHXUYNIr7E1lkOXiA+m08oIa+G52nVVzE7Ty/hZUo5Fj8cSpLHfSb2m/2lnuhLoio5qyFrcblykEOmYhK9UnBshLMXD1sxM2kunhjsbYV7/DFeisSuj+Idn1Spys2RKJr9OqaAKFDpRhTHSoXdD8a539F/C/TvQYcTgjB9OAqB12HxzS8CyAxYwA4DTnSAHYf6OXur4IufXBSF/bU978z7K6WcoPvH8hD5kG9SHvxcooQUM03zky4iyQXFbPHNlbAzAN9ACFuSfJljRh5LESshhMQAPYs+sRA3/5eAcGlmoXtpEP5qCaqu//oAS9ONY/M8Tiql2Awd1Ol93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swMldPqiFZxqXMI1Dr6NAnzfF64HeCDiQ9F2Yent2zk=;
 b=l4gecqXn/NTDbuXslNFO6JWgDLQ4qMytFYcfyb9UDXoxaEOR1qtB6aN9/foQfk5WuK31USFFMx+PTzSIAakBtWS8ioNKJq1KWa1SbaAkc0DsakrcTKGSTnDeLWuZ7CBXoj/8F3VFKcAxa3v2ybkL2ZD+lUPooWdON1JFjOMub60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 14:56:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:56:14 +0000
Message-ID: <42afed03-ab5d-dad7-52ca-a07f238593a2@amd.com>
Date: Thu, 3 Aug 2023 16:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] drm/sched: Convert drm scheduler to use a work queue
 rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-2-matthew.brost@intel.com>
 <1ac4423c-42cd-490d-245b-bf81ef26900d@linux.intel.com>
 <ZMu9AIygJb7U9IXr@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZMu9AIygJb7U9IXr@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f7df82-dac1-4aad-d90f-08db9431c828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtK0V0lwjwlNGbyYd+CLwuxFeMlL5/jtnFmtG4B+3LM46eUgeu9SbxEHFoAHDUs9RUrsHphVUKMDtExMFf2D0s49PRw9gMTuJ5jmmQbeZdkWnst0n1SeJjp44X5ndCZCQRiEvWXI/T8K+N782BhyfJIXbd07oI1HZIzJYxqAmcPgQ2jey82qargaRGWRv/OWCRXUdp4BRk+kfo88yJx0k7+4JQqYT+q5oNJ74qizE3DgMbSj554HOUr7fZUz0/jxGMAjq33dcSCFAydL8JeRRXXppds7jdmfXS0AZ+YvEVHTCaIsQjkMYO1mp4sAG+8VhZ6joUP5FrGTyYEYDuXOtLNjSS6UzzOv++uwyyrl/2zdr5NA0W2R2QSBxIW1lNZ8aL89gdWvWczYVQym4rKAUOV9QKFcOXUlTPja8QPAbR9yqUCNThp1x/AM3LSJsGbkDX1cwWBEr4iq8eRuqAJvgCXSGwiBdPCKCIUxlticLc5J6V/LOa0HrZyn2fo/XOYTsAp+9WBwr8T+97BWrwt18QeuGsuhXn4y3S/x2qwmLMuPinbPwOIWAQGCek5UbIlzJe8Pp67irg6lteTICvMdMxprizJxt4uDA+RWTr2wR/ah5SjK3L0FfL9JWoJ31Q8Ur1HgwYokGFFXZAVawxweew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(2616005)(53546011)(6506007)(186003)(83380400001)(8676002)(66476007)(316002)(66556008)(2906002)(4326008)(66946007)(5660300002)(7416002)(8936002)(41300700001)(6486002)(6666004)(6512007)(110136005)(478600001)(38100700002)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3JFOTVqUENGekhTMlF4RmVDeGZuUGI0YjUwaE8wa1RLMFNTbTgrQ250Qkhx?=
 =?utf-8?B?Ukp5YkdYeTFRaFdNQUEyaTlISlRDd2lnSmhiYnFLcVRjb0tGdUJLTmFlMFJY?=
 =?utf-8?B?NjRzOG9WOW5WYXNwTG1abEFoNHNpVERzU3Vnd3ZLc2l4dnB0YWtMcTlDUnRQ?=
 =?utf-8?B?VStMeXFSSENSL3FZTGVwWis5eFU3SW82NG5leTRQMnFFeWw0Ry9JVWFETGh0?=
 =?utf-8?B?OXVvcDk1elQxQnF1UWt6alVGa25ocDk2R0FWdnFYRlR1RE4xd3dBR0J4WFQr?=
 =?utf-8?B?bGlMM2Y4bElCcFBDZG0vTzJOZS9XZnNubUlUNnoyUU1OenRISVlzNnJEUHdQ?=
 =?utf-8?B?bWc4clR4Qi85dExRN2hWUEIvd2p0QnhRWUdlcHpaajRvSTdoeXFMSjZLQURE?=
 =?utf-8?B?ODI2dlZkczNkVFNWcWZtdG12UGI3Vnlwc0NEZ3pwcE9oVzB5NlRyaDM2cjFQ?=
 =?utf-8?B?ZVRza3FBTzNrdUxFWklkNHFZOGUzRWNlZkZXbHN4bzZYS0FrYWIveEZkeTkz?=
 =?utf-8?B?N0EraGY0aHp5NjlOUm5GL1drbWxxcHVCMUR6cDRUWmxTMzFxU2pLUHZwckw5?=
 =?utf-8?B?ZnpWdnpiQjF3djFPV0x0SllkWE00WXhLdHhxSE9iRFc4WTJsWWVheDBqZVdl?=
 =?utf-8?B?eUN4SjFocFB5Q1NrTzM1dE9GMjNOcUZQTWFEMVZ4cnhBMEdlZCtScmRzaWZ3?=
 =?utf-8?B?Qk5mUXpreFNnL3hqU2pBQWRHZ040cUFMZ1dNekN2Q0NELzY5R010YUNBUm0w?=
 =?utf-8?B?TERqNmRRZUtrcVZhKzRNK1FLMkF6cmRpNFBZTi9lNFBoKzBZWmdwZlZPWUdn?=
 =?utf-8?B?ZTNhSEVPeHgxY0s0QW9veEp4aVlnRERvUzZRRmF6TUoyR3B5S1hHMFE0UHho?=
 =?utf-8?B?OW9TRm11QnFSOWZMYjlrcUh0cU1oZVpEOVpKUm1UYlJnY1Z6Uk9kekRHMFR1?=
 =?utf-8?B?U3NlTUFWYzBEd3Frem1WMGJBRDZIbTJtRit2bVdpRkRVLzl5cDc1UmFsZHly?=
 =?utf-8?B?Y3MxWWM0bVZ6dDBNWitJeTFYclI2eE1DcjdhVjAzbld4OHh6a3pTMlN4SFA0?=
 =?utf-8?B?d3dQSjJRRGtmV2E1SGFRcFo5emVxSVMzemxVTkpEbTdtOFJMeTRUalY3cDY5?=
 =?utf-8?B?RlhyVnVFdDdGc0dYdU83QmxpV241TG9qUWpxWDVydUw4eHp0c2V2QllnZXVu?=
 =?utf-8?B?dndmM2xRSUQrZ0hWSDMwM0dpQWJpSWhYUnlrK0JDS3RhSlpJSisyN0tXV0da?=
 =?utf-8?B?NGdxdmZQSkd3RFRPSjZ5ZHNWbTdiWjJvWmVzNlRobm1ldFJSNVpYWTJDcmFD?=
 =?utf-8?B?RlFwT25iVEFINjc0b2hERjRDTXV3MDlCeGR5cjN4bW1PUHJFYlFsbVl3ckkr?=
 =?utf-8?B?MFJodERGaWY0TFZuVTJTY0k5QUd3ejgyREFPQ3BPbW53T3VZd2I1VTF2aDFp?=
 =?utf-8?B?OHhwKzhpMlpnTFdBeEE4bGRKM0xLSjZBVmVYWXVINk1IYkEwdElQVzNPWVk3?=
 =?utf-8?B?dlZFQWpvckVTSDR0dHRleWRhYXV3WkNwaksvYVJKV3kzeEM4RytZQjFMYlNq?=
 =?utf-8?B?MUI2L0swMmpIM0VBZVdRY2pMZmJqN01HV1daTGFzRkJMRWNXUW1wc0REamcz?=
 =?utf-8?B?NlBwTlJyM21YU0NhR0QzZVlhdFFLVjYrSUs0a3hzV3A4Umw2ZlNPOTQvUFpa?=
 =?utf-8?B?MTE0VTVOOEZmbHk4c3ErbTkvVzI1QmlVdXUrSUtUNHZYRUlPWmtLWTk1blhp?=
 =?utf-8?B?TlE2TVV1WTRMZ05WMlUrUTZISC9jbU5QVFNPbGNOOG9PeE1LaVZPR1BGVWE1?=
 =?utf-8?B?NUJwS2lEUE5NZlBFS2o4TlR2cmJPMmlqTEhOS012NFV3cTZuVHZwMUJ1ZnpB?=
 =?utf-8?B?dUplSmxIVFlDUW43V0hLTGZaUTh5YjlhNnk1NytLZlRJRm15VkNuWnljSElU?=
 =?utf-8?B?YzBLanpUcnFoWENQRWRSbUVCN3JTZ0t1bVZyeHNJbWlNQ1hOSHdqb1V6Z2J4?=
 =?utf-8?B?endoMlZzNXhtcW95c0tNSE9DeHc4R1c2VTFxMXgzbURGRG5BOWNTNERUL0xE?=
 =?utf-8?B?eDJQbTNrWERxbllIZEtPcXVxeGN5Zk82Uis3VWtjNkhEK1NEQU1IMStzSWFN?=
 =?utf-8?B?SW5JNFV4TTZLNHVCd3o2YmxzTFdDTjlydUdJMjA3NjA3bVdMLzFnS251clRW?=
 =?utf-8?Q?6wyXV/sQRgplSaflcrWOZjFK0RTkcYKJg/piTCuLYs9j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f7df82-dac1-4aad-d90f-08db9431c828
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:56:13.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX2nB85DfAE4lXZrblW9pv0s0j/9zS3rPiKKv8/kyWwNG6XxbMOI7xFjXjih605C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.08.23 um 16:43 schrieb Matthew Brost:
> On Thu, Aug 03, 2023 at 11:11:13AM +0100, Tvrtko Ursulin wrote:
>> On 01/08/2023 21:50, Matthew Brost wrote:
>> [SNIP]
>>>    	sched->ops = ops;
>>>    	sched->hw_submission_limit = hw_submission;
>>>    	sched->name = name;
>>> +	sched->run_wq = run_wq ? : system_wq;
>> I still think it is not nice to implicitly move everyone over to the shared
>> system wq. Maybe even more so with now one at a time execution, since effect
>> on latency can be even greater.
>>
> No one that has a stake in this has pushed back that I can recall. Open
> to feedback stakeholders (maintainers of drivers that use the drm
> scheduler).

No objections to using the system_wq here. Drivers can still pass in 
their own or simply use system_highpri_wq instead.

Additional to that the system_wq isn't single threaded, it will create 
as much threads as needed to fully utilize all CPUs.

>   The i915 doesn't use the DRM scheduler last time I looked.
> Has that changed?
>   
>> Have you considered kthread_work as a backend? Maybe it would work to have
>> callers pass in a kthread_worker they create, or provide a drm_sched helper
>> to create one, which would then be passed to drm_sched_init.
>>
>> That would enable per driver kthread_worker, or per device, or whatever
>> granularity each driver would want/need/desire.
>>
>> driver init:
>> struct drm_sched_worker = drm_sched_create_worker(...);
>>
>> queue/whatever init:
>> drm_sched_init(.., worker, ...);
>>
> This idea doesn't seem to work for varitey of reasons. Will type it out
> if needed but not going to spend time on this unless someone with a
> stake raises this as an issue.

Agree completely. kthread_work is for real time workers IIRC.

>   
>> You could create one inside drm_sched_init if not passed in, which would
>> keep the behaviour for existing drivers more similar - they would still have
>> a 1:1 kthread context for their exclusive use.
>>
> Part of the idea of a work queue is so a user can't directly create a
> kthread via an IOCTL (XE_EXEC_QUEUE_CREATE). What you suggesting exposes
> this issue.

Yeah, prevent that is indeed a very good idea.

>
>> And I *think* self-re-arming would be less problematic latency wise since
>> kthread_worker consumes everything queued without relinquishing control and
>> execution context would be guaranteed not to be shared with random system
>> stuff.
>>
> So this is essentially so we can use a loop? Seems like a lot effort for
> what is pure speculation. Again if a stakeholder raises an issue we can
> address then.

Instead of a loop what you usually do in the worker is to submit one 
item (if possible) and then re-queue yourself if there is more work to do.

This way you give others chance to run as well and/or cancel the work etc...

Christian.

>
> Matt
>
>> Regards,
>>
>> Tvrtko
>>

