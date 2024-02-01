Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD1845327
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 09:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C746E10E69D;
	Thu,  1 Feb 2024 08:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43010E69D;
 Thu,  1 Feb 2024 08:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwiaOjWNDy0C5Ng90vW2iRS2RtVF5b+E4m+hPLqiIjPfqNI2gxKUdbOLryisrPKtRW4HM3t09YtVefku8joF75SeU5ji9wU8GYk4P8kPuiideha4p1yvo2+4UWJP3xsT5umbAehYnmLxlbxe2EACYKZ1Ipc12ZUFVQV5eTmgRETlGD/EY2jaPW2dbMZo7Ou5DqVOTHyomj3IpQxE69o5nRjyHDz/aXraaBgTrlwdvfdnbT8Xv3TeEoMp1vB+GjyUbt9xeTZT7/FnwCztbP4qE4Cf2WOXlZ8UfoSH+v7UlRJY1BOvga0A8JiWyns1omDOgQmDPi+gppSkm8iVsRMy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEmz1V2Vr54d2womezyFBbfes+Un3pbFwa4SXYM1HXE=;
 b=j6ow+eWrmAUphKCb+beDUIzlEzhr5BoSkRVFzYXUiCRpYpjQ6pzWErO1bhMkiS2ANAfr6/+9X+c2kRaNxMEe6iTVtNq5WfbDgjFOnOh5hSke/teii1vjZVFxSsGb02IfRmZnz1hZiuH/5f6GbpRKR4TnJFYm1hj4qBu4t5mW85EB3SkH6MxMofcqlklWPYnJh1BgTYFtNOc+f2wTJmU0F/DnViaYkpJkcy0CnEEQ3GamJo9bfLlHw0PoAxTJfw6VxDDthI7e52gl78NzEaQy/KzaGIbAbltBVVv9qEL4Mxiroj/m7TABwT4mu8UzGy87BE+gXbncAx7pMLlSCPjnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEmz1V2Vr54d2womezyFBbfes+Un3pbFwa4SXYM1HXE=;
 b=E6gBEBA3pwF1dkf9SasbutyKLDF/GgDiJHGV/jprLQgv60ONsGHmlprp6HdHivqULd591HfpewU7HII3FbuBIoEsxeC91na+yzhZIk/PXlSwwTTASyQGlYYVpRKAT2ROnuL9IS031//BR+oE35d9m0h+vSOlIoGpKybAGMfyjIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Thu, 1 Feb
 2024 08:52:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.009; Thu, 1 Feb 2024
 08:52:29 +0000
Message-ID: <6f9057af-4ec4-4869-957b-b966d9f9f610@amd.com>
Date: Thu, 1 Feb 2024 09:52:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@redhat.com>
References: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
 <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
 <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bca5799-12ea-4c55-cde8-08dc23031f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDerEiibuHUtycdxaw/dp0UJ3Q7FHBrbcVdY+HG4zyHbYVhBudjBtBSPCqXjOZvAB/aPxNzWtfx0BD0ddr9rYPUl5YIujmT0MhYYEChkMaT5MfJRPl/WOuPTwtzRRK2yftYGYkzGkQKNPZkl6/fNQDanmnyZby1CcENCNO8iq+On5DXlL9wJ+lRBj39I8IaOe+vOoGY7XGsaeFx022V2xx1sLtzfpJivseu9eJorspawbE6jQ7i+K0e0BpmIb40r/BN2n3cu4cTFPJDB5C6oVNKCZakgIGMx9gcPrbIKma8fedluknNGxgS58ELmBjw1HslY1q8HG0oPo9TIf6AAWniKtTRtXrqaJk/ZNQMBrEbZAIEiVAuJP1AmB747LO7rkpAVKJfODwY1AH6PoRBzbh5mFi/FeoaLBeLnSoFPgLkuCTW7YXbP5DMqD2ITRhlPDommzjtfnJhNwNSSTsnBwMslkWjZ2fABQU908q64b49dfSlTYzRtI6UgAIy/NzfIALsPD8+8d20AAJtXduxlEqhS6Yxfut/gNSx9DVBQlMheddhxQYriM8vmuD+zlC+AjZIn3HtWCg8izzkIZ+zF2tw8THAdug95sP5+Rr9Q3X21NbpzreZB5y7kn6Vu3dqLeh9qOw9jNouj3tIhlnAZBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(2906002)(2616005)(5660300002)(7416002)(26005)(38100700002)(6486002)(66946007)(66556008)(54906003)(66476007)(31686004)(966005)(6506007)(6666004)(8936002)(4326008)(8676002)(53546011)(6512007)(478600001)(316002)(110136005)(66574015)(86362001)(41300700001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RCbzVoS1dVTVI2cWl2MTJyY0RWMEtDVVFFYUZaZHBCWFFZRUt3a3lIQmQ4?=
 =?utf-8?B?TjZTK0pQN0xMaWlZNVhJazNPUXJWbmMvV085T3h2dnNUZEZ3bzJObGdKNGlw?=
 =?utf-8?B?ZUJWeFE3dHp0MkxBenBia25oZ1BsNDdrZzRtd2pEQWZhVlJ6MHVsVUhrWVlN?=
 =?utf-8?B?SFFwQ21FK3NpM0J5eGJoY0Rpdy90bFZ3d3NzdnNuMjBxQ1pxUXN1ckl2Qkdq?=
 =?utf-8?B?djVZRis5MXlYbmo5bzBYZlNLaks2dXMrRFNHQTk2c2RKblUydENHTG1HUVVl?=
 =?utf-8?B?MHcrOTNSTFhKOTNyNnFEM3lFMkJZUHhuOHRwcG4zODZmV1V2M05UbzlQQy9n?=
 =?utf-8?B?SHZoL2xCUGowS1pQRkZvdDUzaXNSS3plOWZud3ZVZEpHQlV6MDJ2aTJaaFZK?=
 =?utf-8?B?cUhoRktrR2JqdEpxU0RkazFlVXRWN1pMNWNScnZMUGFGNithUnRjUzdKLzJ5?=
 =?utf-8?B?TCtZYkg5Q0p5MEpUYVZmdHI5OUNFdzhFVnJhcGdONFVUL3Y0OFRDTkVtbWJH?=
 =?utf-8?B?dU5mcjFpZzByVFNMd3pKQmdBdHl5cmtOZllpOGI4ZDFqcW5WU08yMWkzN25K?=
 =?utf-8?B?MVB6eVMrM0VBSWVRYnEzSGU3cUJUeUF2ZkxpcU9kRWUrRXpTVlV0aE1uRUtU?=
 =?utf-8?B?Y29Kb0tzRnIvNTlTamRGUXhyQThxMG5HTVZZWks0bkN4L0JISko1T3A2WTZn?=
 =?utf-8?B?cmM0Z2JzNEpmYkI2bDloa3VFTXFwd2lXeHVwMHEva1BmZWZ4YnRUNjBGUDFD?=
 =?utf-8?B?ZDR1eHgvTjBxRS8wNzZzdnE5dS9IWTJaaUxkOFJucHJvSWMrS0lOTmpjZ2NG?=
 =?utf-8?B?VDY1TWZWTkZMRVVZRVRkNUJYWERrQnhDdEVCSGNZYnhISmtqbmwzWXdKWS9z?=
 =?utf-8?B?UnV0TndRSlFvb2Z5UWhCSGpvV05hcUQ4dUJRM29xcm1FeGZYWDRqRFVaNlpW?=
 =?utf-8?B?L3pFWkxicEw1R05jV29mTy9lUnNOWnlFWngrSWVZOGNYcENDTEQ2YTdmV3FK?=
 =?utf-8?B?RjBKYk9aamNjanFrc1lnWFJxaW04WG1pYTA2eXdZYklUSk5ZckZGcWZSanRl?=
 =?utf-8?B?OUxTaW9vbFlGQWpYeHdVamdCM3VRRWR6Z1luby8vNVliTEQ0NnNMT3IxWjJ3?=
 =?utf-8?B?Y04zenJsOFJkYlpYcWdPMXJBZUE4b1JHVWVWbHprTmQ5Y2VOMUJzcEZEUGVF?=
 =?utf-8?B?bnVsSk1qUFNaZjlXRC9QS0I0d0J2emNrSXQ1SWtncExMNndjdXpSMnVJSTVy?=
 =?utf-8?B?eVIxL1FyYzV6T2diYXl2bFJTZVRwRmIzU2l3Zjh6M3A4cnN0KzYrNHY5aGdI?=
 =?utf-8?B?MFh6QmlkQWRDd1czNUE5OFgyY1p5b1FyQjRCWFcyM3ROZWNDY3lDdXFmTDhq?=
 =?utf-8?B?dXl0ZzROOXdvNmFBRlR1WUJpa2RUYzFwbm5PdTA2bkdrTWh1akJ2VDJvYWl2?=
 =?utf-8?B?a0JmOE9xVjlRb0hoMk85MUlkT2EwZ1ZtSS9nSTJNdStBV2IxR1YvaG9oK045?=
 =?utf-8?B?R3pmWmlacWxqTXh5SngzZ2hXbWhpMzhLbksrWGcvWmczVHRETnlYVGR2MHlD?=
 =?utf-8?B?aTY0bGE5bmJSQW1xTWQyVmFMcGtzTks4RDRrMGs0WVNFdi8rOFpxZGU0T2hN?=
 =?utf-8?B?ZkYxYnFFZWhLRTFMZnZEN1RUNmtFS1NzZTZWSWxRcktpMEhhaWVydTNERWZn?=
 =?utf-8?B?SlNvTnRFRUk5WjljTDdvNjYwU2o4R1Y4NXNlZmo1OFpha0cwbkdxVk9ZZTJt?=
 =?utf-8?B?OE1ZYXU2L2lOUlN3dnpkRUJkVFVDR0FKTGEyKzBCWDBkeG4xbnhzeE9iK1dw?=
 =?utf-8?B?ekc1Y3dsVkg2Y1V6dDNTaGFpam1EVnIyTnN4S0RBUlZHeDJOVGZiSVUyS1Bm?=
 =?utf-8?B?b04yMjgyQmtUb2tjV3E4QWRLUklmQ0ZkUk1OVjVzV0I2enVmQTNheUIzdkhR?=
 =?utf-8?B?a1dvQWNlbm12VS9uRW5vL0tkWDkyWVZDZ0RQc2laREphcmV1WFVqZDJCN0hK?=
 =?utf-8?B?QURaRnBYV3lOLzdpSk81eEI2UkhDOHhFS281WkgzTEpFZkt3V2hwbEhGZkMz?=
 =?utf-8?B?SmVGN2p3bjhaM2ZJYUwxN2dPbDBSa3hWRW82ZE5CQlh1cTF6QnBkMG01VUs3?=
 =?utf-8?Q?somM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bca5799-12ea-4c55-cde8-08dc23031f04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 08:52:29.4860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJJUla9/SzS5sAbTlvQlPnQwqsofMBmsu9LnmQO+PlEB/IqTyi6iXKcOMZKuJT1e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak,

Am 31.01.24 um 21:17 schrieb Zeng, Oak:
> Hi Sima, Dave,
>
> I am well aware nouveau driver is not what Nvidia do with their customer. The key argument is, can we move forward with the concept shared virtual address space b/t CPU and GPU? This is the foundation of HMM. We already have split address space support with other driver API. SVM, from its name, it means shared address space. Are we allowed to implement another driver model to allow SVM work, along with other APIs supporting split address space? Those two scheme can co-exist in harmony. We actually have real use cases to use both models in one application.
>
> Hi Christian, Thomas,
>
> In your scheme, GPU VA can != GPU VA. This does introduce some flexibility. But this scheme alone doesn't solve the problem of the proxy process/para-virtualization. You will still need a second mechanism to partition GPU VA space b/t guest process1 and guest process2 because proxy process (or the host hypervisor whatever you call it) use one single gpu page table for all the guest/client processes. GPU VA for different guest process can't overlap. If this second mechanism exist, we of course can use the same mechanism to partition CPU VA space between guest processes as well, then we can still use shared VA b/t CPU and GPU inside one process, but process1 and process2's address space (for both cpu and gpu) doesn't overlap. This second mechanism is the key to solve the proxy process problem, not the flexibility you introduced.

That approach was suggested before, but it doesn't work. First of all 
you create a massive security hole when you give the GPU full access to 
the QEMU CPU process which runs the virtualization.

So even if you say CPU VA == GPU VA you still need some kind of 
flexibility otherwise you can't implement this use case securely.

Additional to this the CPU VAs are usually controlled by the OS and not 
some driver, so to make sure that host and guest VAs don't overlap you 
would need to add some kind of sync between the guest and host OS kernels.

> In practice, your scheme also have a risk of running out of process space because you have to partition whole address space b/t processes. Apparently allowing each guest process to own the whole process space and using separate GPU/CPU page table for different processes is a better solution than using single page table and partition process space b/t processes.

Yeah that you run out of address space is certainly possible. But as I 
said CPUs are switching to 5 level of pages tables and if you look at 
for example a "cat maps | cut -c-4 | sort -u" of process you will find 
that only a handful of 4GiB segments are actually used and thanks to 
recoverable page faults you can map those between host and client on 
demand. This gives you at least enough address space to handle a couple 
of thousand clients.

> For Intel GPU, para-virtualization (xenGT, see https://github.com/intel/XenGT-Preview-kernel. It is similar idea of the proxy process in Flex's email. They are all SW-based GPU virtualization technology) is an old project. It is now replaced with HW accelerated SRIOV/system virtualization. XenGT is abandoned long time ago. So agreed your scheme add some flexibility. The question is, do we have a valid use case to use such flexibility? I don't see a single one ATM.

Yeah, we have SRIOV functionality on AMD hw as well, but for some use 
cases it's just to inflexible.

> I also pictured into how to implement your scheme. You basically rejected the very foundation of hmm design which is shared address space b/t CPU and GPU. In your scheme, GPU VA = CPU VA + offset. In every single place where driver need to call hmm facilities such as hmm_range_fault, migrate_vma_setup and in mmu notifier call back, you need to offset the GPU VA to get a CPU VA. From application writer's perspective, whenever he want to use a CPU pointer in his GPU program, he add to add that offset. Do you think this is awkward?

What? This flexibility is there to prevent the application writer to 
change any offset.

> Finally, to implement SVM, we need to implement some memory hint API which applies to a virtual address range across all GPU devices. For example, user would say, for this virtual address range, I prefer the backing store memory to be on GPU deviceX (because user knows deviceX would use this address range much more than other GPU devices or CPU). It doesn't make sense to me to make such API per device based. For example, if you tell device A that the preferred memory location is device B memory, this doesn't sounds correct to me because in your scheme, device A is not even aware of the existence of device B. right?

Correct and while the additional flexibility is somewhat option I 
strongly think that not having a centralized approach for device driver 
settings is mandatory.

Going away from the well defined file descriptor based handling of 
device driver interfaces was one of the worst ideas I've ever seen in 
roughly thirty years of working with Unixiode operating systems. It 
basically broke everything, from reverse lockup handling for mmap() to 
file system privileges for hardware access.

As far as I can see anything which goes into the direction of opening 
/dev/kfd or /dev/xe_svm or something similar and saying that this then 
results into implicit SVM for your render nodes is an absolutely no-go 
and would required and explicit acknowledgement from Linus on the design 
to do something like that.

What you can do is to have an IOCTL for the render node file descriptor 
which says this device should do SVM with the current CPU address space 
and another IOCTL which says range A..B is preferred to migrate to this 
device for HMM when the device runs into a page fault.

And yes that obviously means shitty performance for device drivers 
because page play ping/pong if userspace gives contradicting information 
for migrations, but that is something supposed to be.

Everything else which works over the boarders of a device driver scope 
should be implemented as system call with the relevant review process 
around it.

Regards,
Christian.

>
> Regards,
> Oak
>> -----Original Message-----
>> From: Daniel Vetter <daniel@ffwll.ch>
>> Sent: Wednesday, January 31, 2024 4:15 AM
>> To: David Airlie <airlied@redhat.com>
>> Cc: Zeng, Oak <oak.zeng@intel.com>; Christian König
>> <christian.koenig@amd.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>; Brost,
>> Matthew <matthew.brost@intel.com>; Felix Kuehling
>> <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; dri-
>> devel@lists.freedesktop.org; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
>> <krishnaiah.bommu@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>;
>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel-
>> xe@lists.freedesktop.org; Danilo Krummrich <dakr@redhat.com>; Shah, Ankur N
>> <ankur.n.shah@intel.com>; jglisse@redhat.com; rcampbell@nvidia.com;
>> apopple@nvidia.com
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> On Wed, Jan 31, 2024 at 09:12:39AM +1000, David Airlie wrote:
>>> On Wed, Jan 31, 2024 at 8:29 AM Zeng, Oak <oak.zeng@intel.com> wrote:
>>>> Hi Christian,
>>>>
>>>>
>>>>
>>>> Nvidia Nouveau driver uses exactly the same concept of SVM with HMM,
>> GPU address in the same process is exactly the same with CPU virtual address. It
>> is already in upstream Linux kernel. We Intel just follow the same direction for
>> our customers. Why we are not allowed?
>>>
>>> Oak, this isn't how upstream works, you don't get to appeal to
>>> customer or internal design. nouveau isn't "NVIDIA"'s and it certainly
>>> isn't something NVIDIA would ever suggest for their customers. We also
>>> likely wouldn't just accept NVIDIA's current solution upstream without
>>> some serious discussions. The implementation in nouveau was more of a
>>> sample HMM use case rather than a serious implementation. I suspect if
>>> we do get down the road of making nouveau an actual compute driver for
>>> SVM etc then it would have to severely change.
>> Yeah on the nouveau hmm code specifically my gut feeling impression is
>> that we didn't really make friends with that among core kernel
>> maintainers. It's a bit too much just a tech demo to be able to merge the
>> hmm core apis for nvidia's out-of-tree driver.
>>
>> Also, a few years of learning and experience gaining happened meanwhile -
>> you always have to look at an api design in the context of when it was
>> designed, and that context changes all the time.
>>
>> Cheers, Sima
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

