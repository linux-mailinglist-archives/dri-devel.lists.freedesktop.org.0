Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2383D770
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 11:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA62310F7B8;
	Fri, 26 Jan 2024 10:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD910F4D8;
 Fri, 26 Jan 2024 10:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkRhVGmzFE747NBhAewrWwA069bSVyp2eaBrwY2BF5M0SIqV6xlvqK8bD170Rn9X06QsJjGRba76BcMHvn0wym8o8jRFdv1pFKSj5Eln4mVeT6E+pz5d/8AI90tnEIyfEo50tnIV7ADkgiNn94X0qdapGyTvriKH6eiCGoCLU5hLtSgP3aL1tQlUAGcuPaSNp/0BKtMtSq32HaTK7KRgSjdrtbHt82XKtLrnng4rvNFRcoyRcjGptBV3Mm6ynp4jNtVm2UDil5PCQRsh6uTPA2oYxwoNDtUDlZ+feFDn5zypV1D74fjJb43AJ6kK+KR4X+s2Bb/cLhUMCdyTREKuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHQiDI+hZyqI9KiRNkYFyAoTKcfb/ZMjCf7ToJjB648=;
 b=DtH1YKFoDgiyeciJHAH/WkoJksWUY2hi8f+LjW4SKajoChX2i37EhYPNO0TdxfE7g7hZEJoF8ZWiDuqqBMTL9x40mcb6lb56V3kaeN6LbDT3xk0f8Y/ngmJD1b7eGfnuYWSf0kzeEOP74ooPT5Exa26rJMlwXnjgxe5iJDC0pxqx/T6e2KuFi8vzstW4r6grjro2V2+L0jdxa3JVmEfEto7tSX7Ke5yg2gUhdM020M1SqvyTHh1bcULozkJx9lqkUKdu4zWmoMyAVI/eJHuHe8O7K5Y85RYv8CL4rOiGsEh4I/uhskaQ2J8XdKyNU+1Ubocu6A/iDtPOseLDqBXLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHQiDI+hZyqI9KiRNkYFyAoTKcfb/ZMjCf7ToJjB648=;
 b=vMqVhdajftDTeR+GY6FVQB4ZLPVP/1oslMMarPj5Y83DXZyqic7sj8/NvqZjdBgYtrdNQgy5zSJHd1lislefuTXzCHsISuPwSsWkPAB0pMyNJ7ulK5muUPCxk7AdrJ+xnDAe9SOHMs8O5JkHhflQ3ScTVoOyK4aE6QpG4rID7Os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB5332.namprd12.prod.outlook.com (2603:10b6:610:d7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 10:10:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 10:10:00 +0000
Message-ID: <95970cff-2d51-4e97-9d2f-3756de6f6c04@amd.com>
Date: Fri, 26 Jan 2024 11:09:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, David Airlie <airlied@redhat.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
 <SA1PR11MB69918735BCF8BE99182BA3E8927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69918735BCF8BE99182BA3E8927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB5332:EE_
X-MS-Office365-Filtering-Correlation-Id: f23aa0f9-0fbd-495a-4be0-08dc1e56f514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hQXkZIL/VeSz0NwGuJlJ30kNWYh9KMF0wRsB/3sU3A3f4+ZFFAzgHIpe3Y+Z0FoO1O+OvXn033oaSQE4xm0pHXMhfaOtrlwROCFfhmVOaEDQq/QtX303Wg5uwQrz0rNtvNwNmA4q3cZ0UlHz0UtkxlGn6rMYYwtavR/7FBmF8BiOPx/eevZybjRsZOexJ5zJ0GJTPkO6ujt+5PMQqSkBJKio20Qze2aO2QYB+BdR4pxVJ/D5IvjyCY0zQGkDWWrpS2x/RB2RGgrrBriQ96TXaSldo5J0vzQjW61bkEmqnFD1T6t20f/PGzsY5qmV3wcaTyUf4KQGgLhEGtuTh2M7NzRJ921frNzWn1BXhl2LHXcGri1XcNp9o6s28S1wVmf6pHckQxkUaTzUDoGnjjSE95q5eOS6HIPxzatyEgiBo2IhCLkMhl/TWXrpIt/7pIZ1tt0mWtfKDZkUKlIORIf0G4EyH3VfP13Ff4jiLjNhj1FdQY97i3R1LsjjQorb6eh7dcaBeiYE1H01B/9XkKwbkqqbSffwfuH2TG6deHJ7cKjMsDmBBGRbe0hekTX7H14qD2T3cJi+v2qKh3YEUSxThHa4nXTjrgoPmtzrqFVqNHiZHtCGgQxha7R6LJaCMJQppyrC0BePboAzu4/1E7PYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(966005)(2616005)(6486002)(66574015)(478600001)(26005)(6506007)(31686004)(6512007)(53546011)(83380400001)(316002)(54906003)(66946007)(66476007)(110136005)(66556008)(4326008)(86362001)(2906002)(8936002)(36756003)(38100700002)(7416002)(31696002)(8676002)(41300700001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5QTCs0b0xUQlY2WXloek9HQlMxemxLOW9nMVN3V2dLTzJ3UFZFclFBdGpy?=
 =?utf-8?B?UTVvT2tYbXpjNU5sQmVXcnZtYXV6YXpqVUpJWm1hbW10RDgwN0l5TTRlelJF?=
 =?utf-8?B?bU5tcEVjUm15S211VWVnN3lhbC83NEpwczRTRWsxSnJIbmlEQXR0ZDRZWmk2?=
 =?utf-8?B?MUJZUE5Pa2c0cm02RFZzTFlYUDZPOVpJNXNOTEJnSDBWK2NPNHVQYWZDSmVD?=
 =?utf-8?B?MGMrUS96dG45cG1TNEZoV3JrY0Z5K05jQ01UaDYrL3UyMG5McmFWbVg2YUs4?=
 =?utf-8?B?SFA0RitPVS9mR0hnRzIrK1lKTHY3RHBrWkxHQWZmNG9ZcUN0NXVmdTV5OGZ4?=
 =?utf-8?B?UTg5NXhVS0RPUmlQdGJvOVYrYVpyWHNVaitqTjJ0SlpNVUREZXlrN0YreGdM?=
 =?utf-8?B?YkJBWXJMcFBFd0dEYXJLdmo1ZXpENHRBWVB5M2JZTWsvcmIrRkNLc0UxZm82?=
 =?utf-8?B?VHdNMUNSb1p1MEdQSmVVKzJuN3owbVJ0MzZhNkI4S3pSSkFhMGs5dm54M0Nn?=
 =?utf-8?B?SWRKWk5sc0RxaTMzbWp6b21DOW1rZ1lQSTNiTzk5M3Vob3FNcm1YSmhlOGQy?=
 =?utf-8?B?ZzBMUDFhUGpoeVVNajZZejc3MnZLbnRhNUFMb3F1RnZFeGhraFE2S201dUhq?=
 =?utf-8?B?ZVVxNCs2dWtOQnB1RjF4UGFmamRRREVhemZTR1p5emFJWHF0clpPMEo0OUxn?=
 =?utf-8?B?Rk1pM1ZxQ0dUaFlZL0d4c0kxK2lGU2VFcWxwL3o3K3JuYmM2aTF1bFJjRmF6?=
 =?utf-8?B?QTZIUERIdjlWZTBJRFhIQmx3VE9sejNMeHFoSW1hQnhuUVBKY1VmTGpmendj?=
 =?utf-8?B?ejhIcTk1eWFkVGVLc2NENlN4azJkQzI0dVFoR281NjZzT0dWNWV0OXNoWWhu?=
 =?utf-8?B?aTJxSGRjQlJxQ1Bxa1Evd0ZMUFJnZEJOTmV6dnZiVENhZDhueUtzK2RVajZa?=
 =?utf-8?B?c1pJeGJpSWV0aXFiNmQzYTM4cEhLOFVsbjRWRWQvWVpDN25pTG9RTGxRVHpL?=
 =?utf-8?B?aEFxMGtQYUwrWW5wUVRtWmcrTkxSaVFzVHprdzcveHhjNVNXajRmV0ZMcFpm?=
 =?utf-8?B?TW16aVEyQURaSzhMdVZvaTFGc3d2dXdWZ2NRSm1ZN05PRTVKSWNqdDEwUnM2?=
 =?utf-8?B?UGpDcXZaOE9HL1AwTWJldkNFMHVWa0tBNTAwUlZWUHpiN3BnZVIwazVoQlRM?=
 =?utf-8?B?amRHL2tkVUJxb1J1bGwyRG5tek9IOFFHblJHSTR2aC96dThpV0pUQU01aFVE?=
 =?utf-8?B?bnpPTWVIb0Y5eW9wZzI5Z1RDNXRwRmsvN3BaVCtaaVE1bjBUcFBxQ2Q3VmZl?=
 =?utf-8?B?REpuNGVxb1FjQ1MyRzcxenQzdUFFK3BQTWhqQU9qZlBydTMzcS8yd2U1VlZS?=
 =?utf-8?B?eloxb1BwSGd6NXU5aWlzVGdYSE03KzRZSlpQVkRpU25DcStLVUJ2M3BxS0xk?=
 =?utf-8?B?ckFuN0Z5dWVWMXlCWVpSUkJwOUIzSXBHb1YwUmhjRzFMakZnNlBpcTVNMlZm?=
 =?utf-8?B?SWxjcHd1ZlJ0WlBmSGs5QWo4ZzhVOXBtNHZFZGxHSXlpa0F0Q0krNUZyQVFB?=
 =?utf-8?B?TkswYTJUai9pWU5PcUFueEpXWmh6cFBHYlBHclZ4ZitIVEs5amh2azJ3d1Fk?=
 =?utf-8?B?M200ZlIyK3BHK3h4d2hPdmpsQWNTMGFCUkNvVnBYanRpdGozWjJwQWVqSDhH?=
 =?utf-8?B?SmVldWpEWUNGRXhKdnkvWHNoL05DVUJ6ZVVqR251akx0dUFaMHRibXhtazBm?=
 =?utf-8?B?YUxCTzNyYWhyOFNrRmxDTDZDdFowMnR6aWczQ2h1a3dqNXpQcTlGcVUvVHRk?=
 =?utf-8?B?bWtUUTBIMjM3U01KK1VQTnZCWk5VdHNYT2U3YTVINkVsVzNyUnBBVklpVU9P?=
 =?utf-8?B?aXI1ZlhDY24yaUR3dnNweHVSMnNhWTEvTXlMUTJIZnNWVVg2SnRibldGQ1Fz?=
 =?utf-8?B?L0NzUFhoS0NCOFk0bUZUSHQ1NGhFeFE2Y3VTVWN4cmhvem1oRFZNTVFobW1h?=
 =?utf-8?B?MHQ1RXZnNUZOM2xzQ3doM3FHaDQ2TXZpNklGV2NuNVEvNTNHSGV0TzdKZ1Zn?=
 =?utf-8?B?VGpGNTlMNnlRM1YzWG9IcjZFbkhvWUFSTFpRR3AzcldCcmgwdVZPUXlyQUdH?=
 =?utf-8?Q?rAj2SNUfSNHMHlbYkubA17oNG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23aa0f9-0fbd-495a-4be0-08dc1e56f514
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 10:10:00.8811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltbBCN7fyBU//RXdmIIjWcDlEXFALoOEetiw8n8hecgz3Qrh6TAHPd2T7i+YL9Hx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5332
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak,

you can still use SVM, but it should not be a design criteria for the 
kernel UAPI. In other words the UAPI should be designed in such a way 
that the GPU virtual address can be equal to the CPU virtual address of 
a buffer, but can also be different to support use cases where this 
isn't the case.

Additionally to what Dave wrote I can summarize a few things I have 
learned while working on the AMD GPU drivers in the last decade or so:

1. Userspace requirements are *not* relevant for UAPI or even more 
general kernel driver design.

2. What should be done is to look at the hardware capabilities and try 
to expose those in a save manner to userspace.

3. The userspace requirements are then used to validate the kernel 
driver and especially the UAPI design to ensure that nothing was missed.

The consequence of this is that nobody should ever use things like Cuda, 
Vulkan, OpenCL, OpenGL etc.. as argument to propose a certain UAPI design.

What should be done instead is to say: My hardware works in this and 
that way -> we want to expose it like this -> because that enables us to 
implement the high level API in this and that way.

Only this gives then a complete picture of how things interact together 
and allows the kernel community to influence and validate the design.

This doesn't mean that you need to throw away everything, but it gives a 
clear restriction that designs are not nailed in stone and for example 
you can't use something like a waterfall model.

Going to answer on your other questions separately.

Regards,
Christian.

Am 25.01.24 um 06:25 schrieb Zeng, Oak:
> Hi Dave,
>
> Let me step back. When I wrote " shared virtual address space b/t cpu and all gpu devices is a hard requirement for our system allocator design", I meant this is not only Intel's design requirement. Rather this is a common requirement for both Intel, AMD and Nvidia. Take a look at cuda driver API definition of cuMemAllocManaged (search this API on https://docs.nvidia.com/cuda/cuda-driver-api/group__CUDA__MEM.html#group__CUDA__MEM), it said:
>
> "The pointer is valid on the CPU and on all GPUs in the system that support managed memory."
>
> This means the program virtual address space is shared b/t CPU and all GPU devices on the system. The system allocator we are discussing is just one step advanced than cuMemAllocManaged: it allows malloc'ed memory to be shared b/t CPU and all GPU devices.
>
> I hope we all agree with this point.
>
> With that, I agree with Christian that in kmd we should make driver code per-device based instead of managing all devices in one driver instance. Our system allocator (and generally xekmd)design follows this rule: we make xe_vm per device based - one device is *not* aware of other device's address space, as I explained in previous email. I started this email seeking a one drm_gpuvm instance to cover all GPU devices. I gave up this approach (at least for now) per Danilo and Christian's feedback: We will continue to have per device based drm_gpuvm. I hope this is aligned with Christian but I will have to wait for Christian's reply to my previous email.
>
> I hope this clarify thing a little.
>
> Regards,
> Oak
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of David
>> Airlie
>> Sent: Wednesday, January 24, 2024 8:25 PM
>> To: Zeng, Oak <oak.zeng@intel.com>
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Winiarski, Michal
>> <michal.winiarski@intel.com>; Felix Kuehling <felix.kuehling@amd.com>; Welty,
>> Brian <brian.welty@intel.com>; Shah, Ankur N <ankur.n.shah@intel.com>; dri-
>> devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Gupta, saurabhg
>> <saurabhg.gupta@intel.com>; Danilo Krummrich <dakr@redhat.com>; Daniel
>> Vetter <daniel@ffwll.ch>; Brost, Matthew <matthew.brost@intel.com>; Bommu,
>> Krishnaiah <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Christian König
>> <christian.koenig@amd.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>>>
>>> For us, Xekmd doesn't need to know it is running under bare metal or
>> virtualized environment. Xekmd is always a guest driver. All the virtual address
>> used in xekmd is guest virtual address. For SVM, we require all the VF devices
>> share one single shared address space with guest CPU program. So all the design
>> works in bare metal environment can automatically work under virtualized
>> environment. +@Shah, Ankur N +@Winiarski, Michal to backup me if I am wrong.
>>>
>>>
>>> Again, shared virtual address space b/t cpu and all gpu devices is a hard
>> requirement for our system allocator design (which means malloc’ed memory,
>> cpu stack variables, globals can be directly used in gpu program. Same
>> requirement as kfd SVM design). This was aligned with our user space software
>> stack.
>>
>> Just to make a very general point here (I'm hoping you listen to
>> Christian a bit more and hoping he replies in more detail), but just
>> because you have a system allocator design done, it doesn't in any way
>> enforce the requirements on the kernel driver to accept that design.
>> Bad system design should be pushed back on, not enforced in
>> implementation stages. It's a trap Intel falls into regularly since
>> they say well we already agreed this design with the userspace team
>> and we can't change it now. This isn't acceptable. Design includes
>> upstream discussion and feedback, if you say misdesigned the system
>> allocator (and I'm not saying you definitely have), and this is
>> pushing back on that, then you have to go fix your system
>> architecture.
>>
>> KFD was an experiment like this, I pushed back on AMD at the start
>> saying it was likely a bad plan, we let it go and got a lot of
>> experience in why it was a bad design.
>>
>> Dave.

