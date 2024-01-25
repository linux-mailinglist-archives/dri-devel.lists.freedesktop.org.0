Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72983C9A6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22410F93F;
	Thu, 25 Jan 2024 17:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CA710F93F;
 Thu, 25 Jan 2024 17:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy/gjJ9aWfZWUW+tK82LErdCp86Bk+TjfxFzO99VmSvWjP5NEw7wP4TVf6Y6bnxaKN5jUsEOQbAQ6g3lEZaoOaVmrfeXOuChwJaOmudsQ+bo4B/OumGG+lN5y0BXh1KXh6yPitupcP1Lgtb9AQg02ocYxk17ojpDyi7W0wUWTzRB6GeTOkb//D9s4FNfopInGsQmUls1Kf00HZCLiuR+5B0S1L4fIgcVmvph0cGkqlU04eRPc/cN8bRTAQae/wQYdmih+O3CWHOKLI2klZDaBsfmyCk3gtp0OveRDJ9lklmILp63K29BXU4IqIN//iRyKCaX7CQeNRp3wD5KncsHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1hUMe6+/NeQi+PoM0lxJn0cN1HrqFVEEUUvNUCFlg4=;
 b=WxcNMDAbmokXeGuVRBO3WV9OTyOr98niDWolHsc67fAwFNqJOtG67DLX1wDOwjD16pa7Dr5oYN1PxWfrrTmcJr1NlJwW9JS689I2e0XV9cYorWubeF9mgea9OtSAGHf8DurXjDe83FMpnYriE9jS2yxtQI1jc1RKvvrpsbHwWjxE4lBmzlQMY7GDKaS9IqMLIztqrIFh1pe7xQiet3HgD2CScwbxTSHicTZYZfJCROaY5wBK6huaFYbC6OVbRyFVJFgu6bOt2yAuc38jjZ9vxHpEjtob+wFRdBG7qCwdKTpu+/o1TtOQKAFs3AiTv3772Igte7fLl735UyzxoldAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1hUMe6+/NeQi+PoM0lxJn0cN1HrqFVEEUUvNUCFlg4=;
 b=zNlWjHmAvPRithqoXvT44L6eJHYuMzzYL2QDoz5IVMdN4LUosYzseGiVKmZ7yZNaNu69Xn0byJZa23Q3Fy90Sh/GSedRZoNLhCFeVIXmLW203vlkYBzBaipdg58hpWtur+qm7zy8iIx2Set0xSUQehLnR0jUDTwgAtrFcr5VEQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 17:15:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%5]) with mapi id 15.20.7228.027; Thu, 25 Jan 2024
 17:15:45 +0000
Message-ID: <61e0c39f-ee4c-460d-99a7-821218f29f8e@amd.com>
Date: Thu, 25 Jan 2024 12:15:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fdbc01d-e82c-4855-30a4-08dc1dc9444d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uRja77dAk6tLyFYOjLavWQXYKfnXVQbbGNMZhBpPPFb0zfrPeDqwwWG3GeQpXTwMRJlYWEkmyl2d/5HiuBgJATs4LSFrDK5vVPYqGo1FyWUtjZvV4gHLVF47is3rzB9oEEMbCxVp5c0toNpNivgiRVlLCur8nsSS0HITD5wCPBFL8dCclShHQ49C6S00F1PtoNKbIReTFELKCKxJtWcoutoVh8QDujiqU5C3sGR2M5rR4P1CO+xH/fH/oFAHU82tITPDr0OnYqtQXTUw36l2XzSFxP0LHZRXUySHF5CHYfa3i35TfE1Q1bQhrimSB/pwRt6o5LOsMN2vAtXQulQBwiPk6y/z9GsLBCPaFpd1a+YCxQ7VruIVHaLKEJU3zlMS+BOq2+90S4uT3py8dBkp/s5xho6qC2CA6wzNHAoAm/2P9IL/RZyHbOxBIe6kV0xu2iCztK4xCltCeG8pcS7gdZ1gecAyJ9TgPE4sWoYLT4oQsHyos4Ik8csTlNJxAt/9eeT7FBok3i0rditOyaYsrW9pdW/TRC12QEvUuvpmRgd1Eo/wRaawiuyZaF+0uI8EugoWJ1nlzH6OxVAwt5ZkeVVsxELZgDU480oh4pM8aGWJ60km+9wOg30yi64IGeuI30vUeDkt3WLyMzjheiIHiEx4L5K5p9nMmsCqYMF9Pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(31696002)(6512007)(86362001)(26005)(478600001)(66574015)(2616005)(8936002)(8676002)(4326008)(41300700001)(38100700002)(36756003)(921011)(53546011)(31686004)(83380400001)(66556008)(66476007)(54906003)(66946007)(6506007)(316002)(44832011)(5660300002)(110136005)(6666004)(6486002)(7416002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dWWGwvNi8veVphL0pRNDFFK1JwYXNkdVFuWCtDQUhsWDQwbWJSMjg3ZEVE?=
 =?utf-8?B?UldmYWlhTWx2Sko3MHlpdnczKzA5MS80NmdtSVUxY085MkJnZTJSRVNVMERS?=
 =?utf-8?B?cGQwcHU0dm1hQ3ZWRlRENzZXSVE5N1Qxblg4VVpicDNhQ29lekFkSnltSmNF?=
 =?utf-8?B?c1dqMG0zT1RSVDZLNzZicUlybnJST2Z5ekZMMEhzVVhDd1g4OGtqcVcvSUg2?=
 =?utf-8?B?aDZCS1dGVjZpcnFTa0taeURZMmd5dlN1bEh4bVN5b012M0o1Z0VFckdYTENj?=
 =?utf-8?B?R1ZZbCs0WFM2SkEyc0l6UmI5SjEzK0xQZi9MMUxlTkJPNkNuTDZiSDE5Tk1P?=
 =?utf-8?B?aFZKcUM1T2xCN1JZNEdvb3dDUnE4L3N4TDN4Rk0rTkhSRzRqUjBQbjh3V0FT?=
 =?utf-8?B?emtIQmZGcUgxN2tmNkp3alV2QXhudmdESkdEU2pQd3hrdEhoeXVIa2QxNGNX?=
 =?utf-8?B?bVFiSSsyd0hQUFJMM0c3eG15MlVyZ29abHFxUmhCb2tMbDZhRCs5TFpNNVNm?=
 =?utf-8?B?T1c1UFRVT0lqUzVaSVArYjlocmJibVhEbjEzQmoxeTQ4RVppM2xxSStFRnNP?=
 =?utf-8?B?VVlNd1ZWR3lndERBZG03dGtEWkZhS1pFTk9xU1VLSTNhaTJUejNGeTcxdFl4?=
 =?utf-8?B?blNtSmpMV2dXNWhZbFJTZHFQSEdNaXh3OXUzV01XY2dQK2Q3WGdScHpxQ3NR?=
 =?utf-8?B?VzZWaERSa2J4ZjRMdlRUWVRyMDBzZUF6Sm14TGRxOStaaGU5M0srWTJNSzlz?=
 =?utf-8?B?enZ0WHRkTkZacnQvdHo4RGJ4RFJTL0NSdlBiTzdpQzhuZjNaVnBxaU4wQk5w?=
 =?utf-8?B?M3hLL1BCUHZTU29Db0hkQTdnV3d0MXBjZGJGNG5MQkUxVVZ2UTl3S2hMRWRB?=
 =?utf-8?B?MThFQWdQUjBHelJyc1JiNzRMRGcrWjR4TlZVcFREa3dsUlZ2VlRZZlZwNGZY?=
 =?utf-8?B?UzlSQlp0Mi9VeGhVd3JDUW9KYVQzU0hmLzA2OFBkZ2RMUzV5YjhOWXliWk91?=
 =?utf-8?B?cnBTeW1rbU90TGk4M3hYaXpMdDVqVTVIUm8zR1FGREZZbG9DWk4rNHZJbVdZ?=
 =?utf-8?B?dFdJZEI1MGUrTGNyMUI5VldKUEI1TUo0LzB1QU1DeXFrS3V4aDFtdzh2Y1Bz?=
 =?utf-8?B?VG9HMDlOTEhTcDlnWDNpeTJ2SlJwOHdmb25wMEpmWTRjL2N3OFBGTXRUU054?=
 =?utf-8?B?RlVKVHkrVStRd2licHcrR05vQXZ1d2NVZURFbE9nUVJKNFJYb3pXVi8rbUR5?=
 =?utf-8?B?L2h6eldsVXZqb1FBOHYxbzl1Y0pzMDJGaDJPUnc4eVZxWGdiamZZY1JFNi9I?=
 =?utf-8?B?Wmk4OVpJZVNlSWJ5Q3g0eWFHZWV3THdxQStjWXJtWGJhZ0F0cjZibjZvNS92?=
 =?utf-8?B?U3BCZ3dmSGxvcnJNaDFPRkV5R2NaTlFQb3Vpa0hQNzJPdyt2RTA0YVMyaTBE?=
 =?utf-8?B?MXArOHV6QzI5a2RXeFZkU01IS3BSQzh5dEFIZTlMdDhFKzF6V1ZHV1djNWRo?=
 =?utf-8?B?WTd2clBIb05NSTBpdStyVFpsRWxaU0kxc09PdWg2MEt1NTBpYzcyMVZ1blJk?=
 =?utf-8?B?N3NCR2dzdUN6NVFNcnZraGczeE1qQkFQZXc5UTlQRkYvS01YUWN1Ym9BQzdU?=
 =?utf-8?B?bHgvRDdRVVF1S05LczhPcjZMb0JEbnJQRHZKbmZKMHZCV000SG1sQm1aZ0xo?=
 =?utf-8?B?cXNvYm1kR0NBRGF2dnR1ZFZmTGsyclJyczI3L3dHdzEzb0o0QmNWQUV3SUla?=
 =?utf-8?B?bGxjN3plTnFxS3lYcnZOTHM2cVdTbE5TdTZmU0d0TU9zU3hQZlNuSUUyY2sr?=
 =?utf-8?B?VjRxOWUrZjU1cklTTlBKSVhMN2FzTlRnRWtHMmZzZ2x3NExWYXdDSE5TZWVB?=
 =?utf-8?B?U2dNdkg0aEt6M3UxMnhicHRUMWJ2QnU5RmRMZVhXSkN4SEJRVlNkcE53bi9U?=
 =?utf-8?B?bERneFEzNTMrenNmYUQ1a0lhaXFKckozWXNSVFl2eXo5VzRrRklLcHdGUWpx?=
 =?utf-8?B?bVd2T1U2Rm1IWDRHQ0h2UVlUdjlVMmE0YjBJNWJzSytYRXN0dlNnZUcwdGgw?=
 =?utf-8?B?cWwxT3RvNWNTSzgwRmQrRlcyRXo5Z3VhK096cDYycHpwa2RNNjQ1TEE1NFU2?=
 =?utf-8?Q?AtH4vfGW2mSKAVKKPT+zdTTtc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdbc01d-e82c-4855-30a4-08dc1dc9444d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 17:15:45.2475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnO53dumwzyQv0vCeu0JGKPtKSEzMVn2+QyBRKxmLi5ooKZQH/SKusqJ8Dml+NAaRheLLyMxs4Zk0B0R56/laQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
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
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2024-01-24 20:17, Zeng, Oak wrote:
>
> Hi Christian,
>
> Even though I mentioned KFD design, I didn’t mean to copy the KFD 
> design. I also had hard time to understand the difficulty of KFD under 
> virtualization environment.
>
The problem with virtualization is related to virtualization design 
choices. There is a single process that proxies requests from multiple 
processes in one (or more?) VMs to the GPU driver. That means, we need a 
single process with multiple contexts (and address spaces). One proxy 
process on the host must support multiple guest address spaces.

I don't know much more than these very high level requirements, and I 
only found out about those a few weeks ago. Due to my own bias I can't 
comment whether there are bad design choices in the proxy architecture 
or in KFD or both. The way we are considering fixing this, is to enable 
creating multiple KFD contexts in the same process. Each of those 
contexts will still represent a shared virtual address space across 
devices (but not the CPU). Because the device address space is not 
shared with the CPU, we cannot support our SVM API in this situation.

I still believe that it makes sense to have the kernel mode driver aware 
of a shared virtual address space at some level. A per-GPU API and an 
API that doesn't require matching CPU and GPU virtual addresses would 
enable more flexibility at the cost duplicate information tracking for 
multiple devices and duplicate overhead for things like MMU notifiers 
and interval tree data structures. Having to coordinate multiple devices 
with potentially different address spaces would probably make it more 
awkward to implement memory migration. The added flexibility would go 
mostly unused, except in some very niche applications.

Regards,
   Felix


> For us, Xekmd doesn't need to know it is running under bare metal or 
> virtualized environment. Xekmd is always a guest driver. All the 
> virtual address used in xekmd is guest virtual address. For SVM, we 
> require all the VF devices share one single shared address space with 
> guest CPU program. So all the design works in bare metal environment 
> can automatically work under virtualized environment. +@Shah, Ankur N 
> <mailto:ankur.n.shah@intel.com> +@Winiarski, Michal 
> <mailto:michal.winiarski@intel.com> to backup me if I am wrong.
>
> Again, shared virtual address space b/t cpu and all gpu devices is a 
> hard requirement for our system allocator design (which means 
> malloc’ed memory, cpu stack variables, globals can be directly used in 
> gpu program. Same requirement as kfd SVM design). This was aligned 
> with our user space software stack.
>
> For anyone who want to implement system allocator, or SVM, this is a 
> hard requirement. I started this thread hoping I can leverage the 
> drm_gpuvm design to manage the shared virtual address space (as the 
> address range split/merge function was scary to me and I didn’t want 
> re-invent). I guess my takeaway from this you and Danilo is this 
> approach is a NAK. Thomas also mentioned to me drm_gpuvm is a overkill 
> for our svm address range split/merge. So I will make things work 
> first by manage address range xekmd internally. I can re-look 
> drm-gpuvm approach in the future.
>
> Maybe a pseudo user program can illustrate our programming model:
>
> Fd0 = open(card0)
>
> Fd1 = open(card1)
>
> Vm0 =xe_vm_create(fd0) //driver create process xe_svm on the process's 
> first vm_create
>
> Vm1 = xe_vm_create(fd1) //driver re-use xe_svm created above if called 
> from same process
>
> Queue0 = xe_exec_queue_create(fd0, vm0)
>
> Queue1 = xe_exec_queue_create(fd1, vm1)
>
> //check p2p capability calling L0 API….
>
> ptr = malloc()//this replace bo_create, vm_bind, dma-import/export
>
> Xe_exec(queue0, ptr)//submit gpu job which use ptr, on card0
>
> Xe_exec(queue1, ptr)//submit gpu job which use ptr, on card1
>
> //Gpu page fault handles memory allocation/migration/mapping to gpu
>
> As you can see, from above model, our design is a little bit different 
> than the KFD design. user need to explicitly create gpuvm (vm0 and vm1 
> above) for each gpu device. Driver internally have a xe_svm represent 
> the shared address space b/t cpu and multiple gpu devices. But end 
> user doesn’t see and no need to create xe_svm. The shared virtual 
> address space is really managed by linux core mm (through the vma 
> struct, mm_struct etc). From each gpu device’s perspective, it just 
> operate under its own gpuvm, not aware of the existence of other 
> gpuvm, even though in reality all those gpuvm shares a same virtual 
> address space.
>
> See one more comment inline
>
> *From:*Christian König <christian.koenig@amd.com>
> *Sent:* Wednesday, January 24, 2024 3:33 AM
> *To:* Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich 
> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter 
> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>
> *Cc:* Welty, Brian <brian.welty@intel.com>; 
> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; 
> Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasad 
> <himal.prasad.ghimiray@intel.com>; Thomas.Hellstrom@linux.intel.com; 
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; 
> Brost, Matthew <matthew.brost@intel.com>; Gupta, saurabhg 
> <saurabhg.gupta@intel.com>
> *Subject:* Re: Making drm_gpuvm work across gpu devices
>
> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>
>     [SNIP]
>
>     Yes most API are per device based.
>
>     One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.
>
>
> Yeah and that was a big mistake in my opinion. We should really not do 
> that ever again.
>
>
>     Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
>
>
> Exactly that thinking is what we have currently found as blocker for a 
> virtualization projects. Having SVM as device independent feature 
> which somehow ties to the process address space turned out to be an 
> extremely bad idea.
>
> The background is that this only works for some use cases but not all 
> of them.
>
> What's working much better is to just have a mirror functionality 
> which says that a range A..B of the process address space is mapped 
> into a range C..D of the GPU address space.
>
> Those ranges can then be used to implement the SVM feature required 
> for higher level APIs and not something you need at the UAPI or even 
> inside the low level kernel memory management.
>
> When you talk about migrating memory to a device you also do this on a 
> per device basis and *not* tied to the process address space. If you 
> then get crappy performance because userspace gave contradicting 
> information where to migrate memory then that's a bug in userspace and 
> not something the kernel should try to prevent somehow.
>
> [SNIP]
>
>         I think if you start using the same drm_gpuvm for multiple devices you
>
>         will sooner or later start to run into the same mess we have seen with
>
>         KFD, where we moved more and more functionality from the KFD to the DRM
>
>         render node because we found that a lot of the stuff simply doesn't work
>
>         correctly with a single object to maintain the state.
>
>     As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.
>
>
> Yes, I'm perfectly aware of that. And I can only repeat myself that I 
> see this design as a rather extreme failure. And I think it's one of 
> the reasons why NVidia is so dominant with Cuda.
>
> This whole approach KFD takes was designed with the idea of extending 
> the CPU process into the GPUs, but this idea only works for a few use 
> cases and is not something we should apply to drivers in general.
>
> A very good example are virtualization use cases where you end up with 
> CPU address != GPU address because the VAs are actually coming from 
> the guest VM and not the host process.
>
> I don’t get the problem here. For us, under virtualization, both the 
> cpu address and gpu virtual address operated in xekmd is guest virtual 
> address. They can still share the same virtual address space (as SVM 
> required)
>
> Oak
>
>
>
> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should 
> not have any influence on the design of the kernel UAPI.
>
> If you want to do something similar as KFD for Xe I think you need to 
> get explicit permission to do this from Dave and Daniel and maybe even 
> Linus.
>
> Regards,
> Christian.
>
