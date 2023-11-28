Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230227FBAEE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5956A10E518;
	Tue, 28 Nov 2023 13:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258FC10E518;
 Tue, 28 Nov 2023 13:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBc6e7qP0lPc/CQa7Gg+uXD8lF5epyBzGD4Kfe+Lz1fkrSDxYX9ZnXXNuesA4eJJcWtazj3IJhSW0pV0zrZTN6eGDdMD3ss0ioNrPETsfrSOInSRlqYQY8Roy2oxmySLN3jptJqyZC2Xzs2brjxgqjCOsJgntz4vnF1xoE9g6yddsqdyhHaBqJM+qESTZ9Titz5fK8CHnxQEepWYLAp3aRT2Xw5QWsiL8/9xXX4sUwidukNFog0fEaUxPzz5yCOsG9Mbz3DfL4VPhQEYvLrBzUQmqP/BkbtoMPnNGWcyxbfOk75dHMFRNJvKO0sDMrg8hdbnuZEBKcWYXFZUsCjAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNmvnLMS79dBwftPGP7Ai2jEh51UjdmWOQbXZ4iQAmQ=;
 b=GXM6MTZR6AT86Jhpnv0+IPTFho5aHT7e9qRrPTYPU/e0LRbbf6tFp7xIey+3NTpfC+E1koCEqUuhPLaHjIb3nap376G0Tw2ovxQ/htyLSxjBXILOszukSR9f2Wm4yQlxCAutZDPKr7NfVieMKbxco3EsUVW6+NtJVh1+sCDiaf4soRrVnxFDib4u3ep7/7F+g8kJOup5J+h+muw1xdbrlb2RKjqJpEZ+H70vKyYFfqEz7VLJIUQsAVKQ7jGfKI9U+D3f7wtZwmMAjCIqHlfyfc2tPpaTl9oWYLe7w8u8bnL2mTSi3OmsDOhB3pV+GEGPd1IXXUbcLDrZFc5IvvQmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNmvnLMS79dBwftPGP7Ai2jEh51UjdmWOQbXZ4iQAmQ=;
 b=Dov75i7Corbd4sYj54wpSblkQUqX+/Jv8I5FPQAi9JlCcSyf0Pf7TuUUpTiR1L94o14qbxdBBLEokCCppH4bO8SW2UxFuYTRH60eh88HzdcfjgvPOdKNr4B6PkwSSiPdpYWE7T1jSKyYJMD++o3O11iwoeaFbTML9WKZGjBBUI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 13:09:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:09:25 +0000
Message-ID: <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
Date: Tue, 28 Nov 2023 14:09:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: Weixi Zhu <weixi.zhu@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231128125025.4449-1-weixi.zhu@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0329.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 897c9512-da80-46ea-0b51-08dbf0133ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehkJzBi/e84ow3/TNBS28QGXivdV0/Y/R0tBtWooDziC6Xl6nUayBtZtU0yUa57Eu0ScEcjY8JJjMVeSG1BsWxrWMmJPaS+MYUmgSCcRfZBA8BU0c81TceVDq6pr/DcdpuMMz9UR+ts/oDwiwNwjxZb8LSRQGu+InJiEUVW+BqDjTHCJ5QVUne0kmkDtHFzlmxRD6Ln8cIVgv/hzzomWHq/Yvvx7h61we5kMNDtpS0ug5dK6466JGl/dyQ1MHjcF0R28oNWs7zN+X5zkHtxLd9cq65c4UvPkXaERr+j05V2+u8qYD45YZF6XI46wPnGs9aesDTmRfzXd7VSTDEvBP3sODdudMdvxXmlS+STWgb5c1cZh955ynyUDgbjBnjbIXq9VaQLyHmo4djlhaL1399ofzkbNcCev6MexFMZftkXgXm2UPGEvhrYasEjWetcwhSi7nYMMXUgfvkqGDpejQ5YqXnr84WRkxJpuQyRIeBVNGCyk0lGlTn/4TqbdOiz4HNkcKxt5S200HelK8WT4SrMZyE1L3bwgjhTimivU6L9DXTtl/LQq7YgBc86OFkLwvz49PcnUAUFfV1wac9NDYnXTz9rfmJzrlCbk5MIXvVpbQkGAadb/ieY3+Ls6YLmP5E3UArXvLs5vcIfAEWbsdDDhyY5+r8OZnZDL1lLJoFbGSMPaL5HGv2ZR0GEt5VTC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(66899024)(2616005)(26005)(45080400002)(6506007)(6512007)(6666004)(86362001)(8676002)(8936002)(5660300002)(66556008)(4326008)(6486002)(31696002)(966005)(478600001)(316002)(66946007)(110136005)(66476007)(7416002)(38100700002)(83380400001)(31686004)(41300700001)(36756003)(30864003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHlFbkt0aFpSMmFWbzI0UWtJL3VCbWx4ZzhjbkdHakxXYS9QNlluaThlT05v?=
 =?utf-8?B?aFF0V0hQME9CVmlsbUM1OC9ZbVpxWEwwSWJxU2dHOEF5N0paQkpTUUpraWFJ?=
 =?utf-8?B?S1JvWWVWYVpidHp2WTBBQWJsaUpUSmpGWENMZU1qZDhSNm96VXNNNmpOb1dT?=
 =?utf-8?B?UWU4cTdkbHZkckx1TUhjOXp1NCttSE44bzE5TStMM2JFbzdiL21YTXR4S0xy?=
 =?utf-8?B?YkdBTExaTXdPYWVBNEJVM0JST3FLVGttYkxjWHFVMm0wSUNkM2h3WXBVK2t1?=
 =?utf-8?B?dTkrQ3EwV1FvOWQ3ZDVpZkIrdFNYUlhDQ2NGU0FYZkFmYk9tWmh3bjJmSndx?=
 =?utf-8?B?QVpUWVdYNVVMYTY4cXJCeVF0ZUhrcGVVTnl3MkxDV3pTaDdRYkhNeE9VM01V?=
 =?utf-8?B?V0I0OUdHS01BTmVXVWJKWDJTTWttSWIwVU83dHZSVmMyQWNCdFRUTnVSSXNk?=
 =?utf-8?B?OGRreE5vSmhmZURiZlpxNW52MEpaNStwc05RNEtBNnZrdTFGTUtmVS9ja1F4?=
 =?utf-8?B?QWNiakxab3ordnludVV6d3hpWkdudnVicG44RWpCeHdNN2tzZ1lmQ0QxdU80?=
 =?utf-8?B?cnl1UEo5OXQ0RS9lOXJNMnQxQVRnbXhyVWc2MC9xOGdvdndQSUc2RFRMUFkx?=
 =?utf-8?B?RWxIci93Z21sOENRY24rTm94VjNYQUY0VkM4RjZvVE1hdHk2KzJJSzR5eTNl?=
 =?utf-8?B?U0plL0dvUlFjSjhWMUw3SXFtcGRjelZLNHlPVE5uWkFNTUZiMWQ3WERHMWgr?=
 =?utf-8?B?Y1Z4WGZXR1hKMXFuNDd1dHB5azZqWkx6MExGajIwL0dpc3pGaWRTUmlsSngz?=
 =?utf-8?B?V1VJZzl3eHl3bHcwaUM0Z0N0TlRscVVQSlFTVWpmZDYrcjJjOVI3dHZyajEr?=
 =?utf-8?B?c2ZQeVB2SXlkTW9TcW9xcFJHOGFyaUlXVGZEQWRvUmVXa3M5cm1YRGxSZEFz?=
 =?utf-8?B?TzhhdUVOWU4yckVzbVR6dUg4L3gvaU9OcVhtc1RNWXJqQ1ZyenlybDd5bk1S?=
 =?utf-8?B?S2JlSCtIVHpld0VqZmZNaVRRWnVVNzJleWNYS05KS2t5RW5tRHNlYmpQL1kv?=
 =?utf-8?B?UG9GQ3c4aHVNQ094aGhHSFQ4MGhjdEVqZUR1TklGSnBFdXpTR2llbWdLM2xm?=
 =?utf-8?B?eklKV09FYy9UYmZGVldrRWoyNThiZFNMVm8vTTBXSXFhRVhqNG5mQjZzSlJo?=
 =?utf-8?B?Q3N4UXJ0aFY5L0tqYWlEMmNPYnlGVytkajBTSGtRdFNMQUdoa1ZJdHZ4L1gr?=
 =?utf-8?B?L00wTytiSzVYUGtNS2VLZ3hKUHdrZGYzR0hHbnNVUWpGQ1BUbjMrRU0ydGlj?=
 =?utf-8?B?TkdvS0JCdnlCNytsY1ZiQlFsNmpYQnBMUUYydDRqaFJPajVJZGpKVXlVUk5D?=
 =?utf-8?B?NGR2WHpYTjR3WUNmS0dSUFIzclNUMFAvZ3pnOHFtbmhYUjBRb2dSTHNmaFl3?=
 =?utf-8?B?b3VIWnNWTm9OUUplMGhjbDBiTjJvSzUya0toOGNJU0pJSmdzN1NhMlZNMzNa?=
 =?utf-8?B?aTkrOURFSXRwYldtQkgrNWMyZkYwSHVuenl4Z29UT2FiLytoSHhHczZnYzh5?=
 =?utf-8?B?OUtvenhBdzR0MEU2VTFNTndUYXhlQlhhaTdaZnhSS2R1YVJGY3FhcHNVazN1?=
 =?utf-8?B?aEpOUEdqZ1RFV0loL0s4dUJxODhwMllwSjFWdHAvMFEvcWY4dEFkazdiNndG?=
 =?utf-8?B?VE1vZG4vMHRvbEo1UVZ4UHVyMmhwUlBMbnlXdWpaRFk1bTk5Tm1RcXVXbThW?=
 =?utf-8?B?dWp4RkRpU1hKM1ZZOFJvRjgyVlQvQTJvVGkxSGd5T3d6OXZuRzRIN2FGV29w?=
 =?utf-8?B?aU5hMnM3N3NvVlR6QWZqU1hjVldNc1gyZEh0Sm1vdlZyWTZaUDZPYm9LV2xK?=
 =?utf-8?B?SThYSkd2OUhCV25lc2hDL1BOL3ZNZEhEc0NWbTUrcHQ1OFNrYjZVOHRKdjZQ?=
 =?utf-8?B?WFN4VTdORGlkR295MEYyQitaOU15cVNPSUs3SkFHZmNKdmtXK0Y4UGlzWUV5?=
 =?utf-8?B?MlhLTGpkRG5nR0w0dEF2b2t2dkk1TnlpQ0pzSGhhTDVvcHdsVS9LU0VHaFBF?=
 =?utf-8?B?aSsxV21NMloyNUVNRG5aSnFrMXdwZ1BPdk51ZFpqa0lxc2o2SEU5b3FFWFVr?=
 =?utf-8?Q?S1zVTet119bT6KicPVOTN22kQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897c9512-da80-46ea-0b51-08dbf0133ec2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:09:25.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSMBUsYl36GFPh1Wm+pR3BawOBo2InMtYaB0AKe02qcnhsBKImFevtWpVGZ3HGYk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
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
Cc: dri-devel@lists.freedesktop.org, leonro@nvidia.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, mgorman@suse.de, ziy@nvidia.com,
 zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding a few missing important people to the explicit to list.

Am 28.11.23 um 13:50 schrieb Weixi Zhu:
> The problem:
>
> Accelerator driver developers are forced to reinvent external MM subsystems
> case by case, because Linux core MM only considers host memory resources.
> These reinvented MM subsystems have similar orders of magnitude of LoC as
> Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and Huawei NPU has
> 30K. Meanwhile, more and more vendors are implementing their own
> accelerators, e.g. Microsoft's Maia 100. At the same time,
> application-level developers suffer from poor programmability -- they must
> consider parallel address spaces and be careful about the limited device
> DRAM capacity. This can be alleviated if a malloc()-ed virtual address can
> be shared by the accelerator, or the abundant host DRAM can further
> transparently backup the device local memory.
>
> These external MM systems share similar mechanisms except for the
> hardware-dependent part, so reinventing them is effectively introducing
> redundant code (14K~70K for each case). Such developing/maintaining is not
> cheap. Furthermore, to share a malloc()-ed virtual address, device drivers
> need to deeply interact with Linux MM via low-level MM APIs, e.g. MMU
> notifiers/HMM. This raises the bar for driver development, since developers
> must understand how Linux MM works. Further, it creates code maintenance
> problems -- any changes to Linux MM potentially require coordinated changes
> to accelerator drivers using low-level MM APIs.
>
> Putting a cache-coherent bus between host and device will not make these
> external MM subsystems disappear. For example, a throughput-oriented
> accelerator will not tolerate executing heavy memory access workload with
> a host MMU/IOMMU via a remote bus. Therefore, devices will still have
> their own MMU and pick a simpler page table format for lower address
> translation overhead, requiring external MM subsystems.
>
> --------------------
>
> What GMEM (Generalized Memory Management [1]) does:
>
> GMEM extends Linux MM to share its machine-independent MM code. Only
> high-level interface is provided for device drivers. This prevents
> accelerator drivers from reinventing the wheel, but relies on drivers to
> implement their hardware-dependent functions declared by GMEM. GMEM's key
> interface include gm_dev_create(), gm_as_create(), gm_as_attach() and
> gm_dev_register_physmem(). Here briefly describe how a device driver
> utilizes them:
> 1. At boot time, call gm_dev_create() and registers the implementation of
>     hardware-dependent functions as declared in struct gm_mmu.
>       - If the device has local DRAM, call gm_dev_register_physmem() to
>         register available physical addresses.
> 2. When a device context is initialized (e.g. triggered by ioctl), check if
>     the current CPU process has been attached to a gmem address space
>     (struct gm_as). If not, call gm_as_create() and point current->mm->gm_as
>     to it.
> 3. Call gm_as_attach() to attach the device context to a gmem address space.
> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
>     device computation happens.
>
> GMEM has changed the following assumptions in Linux MM:
>    1. An mm_struct not only handle a single CPU context, but may also handle
>       external memory contexts encapsulated as gm_context listed in
>       mm->gm_as. An external memory context can include a few or all of the
>       following parts: an external MMU (that requires TLB invalidation), an
>       external page table (that requires PTE manipulation) and external DRAM
>       (that requires physical memory management).
>    2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not necessarily
>       mean that a zero-filled physical page should be mapped. The virtual
>       page may have been mapped to an external memory device.
>    3. Unmapping a page may include sending device TLB invalidation (even if
>       its MMU shares CPU page table) and manipulating device PTEs.
>
> --------------------
>
> Semantics of new syscalls:
>
> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>      Allocate virtual address that is shared between the CPU and all
>      attached devices. Data is guaranteed to be coherent whenever the
>      address is accessed by either CPU or any attached device. If the device
>      does not support page fault, then device driver is responsible for
>      faulting memory before data gets accessed. By default, the CPU DRAM is
>      can be used as a swap backup for the device local memory.
> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>      Issuing memory hint for a given VMA. This extends traditional madvise()
>      syscall with an extra argument so that programmers have better control
>      with heterogeneous devices registered as NUMA nodes. One useful memory
>      hint could be MADV_PREFETCH, which guarantees that the physical data of
>      the given VMA [VA, VA+size) is migrated to NUMA node #id. Another
>      useful memory hint is MADV_DONTNEED. This is helpful to increase device
>      memory utilization. It is worth considering extending the existing
>      madvise() syscall with one additional argument.
>
> --------------------
>
> Implementation details
>
> 1. New VMA flag: MAP_PEER_SHARED
>
> This new flag helps isolate GMEM feature, so that common processes with
> no device attached does not need to maintain any logical page table. It
> can be deleted if the extra overhead from GMEM is acceptable.
>
> 2. MMU functions
> The device driver must implement the MMU functions declared in struct
> gm_mmu.
>
> VA functions: peer_va_alloc_fixed(), peer_va_free()
>
> They are used to negotiate a common available VMA between a host
> process and a device process at the mmap() time. This is because some
> accelerators like Intel Xeon Phi or Huawei's Ascend NPU have their
> acceleration tasks executed within a device CPU process context. Some
> accelerators may also choose a different format of virtual address
> space.
>
> PA functions: alloc_page(), free_page(), prepare_page()
>
> Alloc_page() and free_page() are used to allocate and free device physical
> pages. Prepare_page() is used to zero-fill or DMA the data of a physical
> page. These functions were removed from the submitted patch, since GMEM
> does not need to invoke them when testing Huawei's NPU accelerator. The NPU
> accelerator has an OS running in the device that manages the device
> physical memory. However, even for such a device it is better for the host
> to directly manage device physical memory, which saves device HBM and
> avoids synchronizing management status between the host and device.
>
> Page-table functions: pmap_create()/destroy()/enter()/release()/protect()
>
> They are used to create and destroy device page tables, install and
> uninstall page table entries and to change the protection of page table
> entries.
>
> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>
> They are used to invalidate the TLB entries of a given range of VA or
> invalidate a given list of VMAs.
>
> Wrapper functions: peer_map() and peer_unmap()
>
> These two functions are used to create or destroy a device mapping which
> could include allocating physical memory and copying data. They effectively
> wraps the PA functions, Page-table functions and TLB-invalidation
> functions. Implementing these steps together allows devices to optimize the
> communication cost between host and device. However, it requires the device
> driver to correctly order these steps.
>
> 3. Tracking logical mappings:
>
> Each process starts maintaining an xarray in mm->vm_obj->logical_page_table
> at the first time a host process calls mmap(MAP_PRIVATE | MAP_PEER_SHARED).
> When a virtual page gets touched, its mapping status is created and stored
> in struct gm_mapping. The logical page table is utilized to query the
> struct gm_mapping given a virtual address. GMEM extends Linux MM to update
> and lookup these logical mappings. For example, in the patch set we modify
> the page fault path of to additionally check the logical mapping of
> MAP_PEER_SHARED VMAs and identify if a device page should be migrated.
> Similarly, if the device driver wants to resolve a device page fault or
> prefetch data, the driver should call gm_dev_fault(). This function
> examines the mapping status and determines whether the device driver should
> migrate a CPU page to device or install a zero-filled device page.
>
> The logical mapping abstraction enhances the extensibility of Linux core MM
> (a virtual page may be mapped to a device physical page without any CPU PTE
> installed). The current implementation is not complete, since it only
> focused on anonymous VMAs with MAP_PEER_SHARED flag. The future plan of
> logical page table is to provide a generic abstraction layer that support
> common anonymous memory (I am looking at you, transparent huge pages) and
> file-backed memory.
>
> --------------------
>
> Use cases
>
> GMEM has been tested over Huawei's NPU (neural process unit) device driver.
> The original NPU device driver has approximately 30,000 lines of code for
> memory management. On the contrary, the GMEM-based one has less than 30
> lines of code calling GMEM API, with approximately 3,700 lines of code
> implementing the MMU functions. This effectively saves over 26,200 lines
> of MM code for one driver. Therefore, developers from accelerator vendors,
> including Nvidia, AMD, Intel and other companies are welcome to discuss if
> GMEM could be helpful.
>
> Using GMEM-based driver, it is possible to write a C-style accelerator code
> with malloc(), whose underlying mmap() syscall should include
> MAP_PEER_SHARED according to current GMEM implementation. Importantly, GMEM
> guarantees a coherent view of memory between the host and all attached
> devices. This means that any data written by the CPU or any attached
> accelerator can be seen by the next memory load instruction issued by any
> attached accelerator or the CPU. Furthermore, the NPU device was able to
> oversubscribe memory by swapping memory to host DDR. Note that this memory
> oversubscription mechanism can be universal if the physical memory
> management is provided by GMEM. Other potential use cases of GMEM could
> include the IOMMU driver, KVM and RDMA drivers, as long as the device needs
> to manage external memory resources like VMAs, MMUs or local DRAMs.
>
> --------------------
>
> Discussion
>
> Physical memory management
> Most accelerators require the host OS to manage device DRAM. Even
> accelerators capable of running an OS inside the driver can benefit from
> it, since it helps avoid synchronizing management status between the host
> and device. In Linux OSS EU summit 2023, Hannes Reinecke from SUSE Labs
> suggested that people are concerned with the memory consumption of struct
> page (which considers all generic scenarios for the kernel). This leads to
> a possible solution that, instead of reusing Linux struct page and
> ZONE_DEVICE mechanism, GMEM can implement an isolated buddy allocator for
> the device to instantiate and register. The isolation is useful because
> device DRAM physical address space is independent. Furthermore, the
> isolated buddy allocator can utilize a customized struct page that consumes
> less memory. It is worth discussing if accelerator vendors desire this
> solution.
>
> MMU functions
> The MMU functions peer_map() and peer_unmap() overlap other functions,
> leaving a question if the MMU functions should be decoupled as more basic
> operations. Decoupling them could potentially prevent device drivers
> coalescing these basic steps within a single host-device communication
> operation, while coupling them makes it more difficult for device drivers
> to utilize GMEM interface.
>
> The idea of GMEM was originated from Weixi's PhD study with
> Prof. Scott Rixner and Prof. Alan L. Cox at Rice University.
>
> [1] https://arxiv.org/abs/2310.12554.
>
> Weixi Zhu (6):
>    mm/gmem: add heterogeneous NUMA node
>    mm/gmem: add arch-independent abstraction to track address mapping
>      status
>    mm/gmem: add GMEM (Generalized Memory Management) interface for
>      external accelerators
>    mm/gmem: add new syscall hmadvise() to issue memory hints for
>      heterogeneous NUMA nodes
>    mm/gmem: resolve VMA conflicts for attached peer devices
>    mm/gmem: extending Linux core MM to support unified virtual address
>      space
>
>   arch/arm64/include/asm/unistd.h         |   2 +-
>   arch/arm64/include/asm/unistd32.h       |   2 +
>   drivers/base/node.c                     |   6 +
>   fs/proc/task_mmu.c                      |   3 +
>   include/linux/gmem.h                    | 368 ++++++++++++
>   include/linux/mm.h                      |   8 +
>   include/linux/mm_types.h                |   5 +
>   include/linux/nodemask.h                |  10 +
>   include/uapi/asm-generic/mman-common.h  |   4 +
>   include/uapi/asm-generic/unistd.h       |   5 +-
>   init/main.c                             |   2 +
>   kernel/fork.c                           |   5 +
>   kernel/sys_ni.c                         |   2 +
>   mm/Kconfig                              |  14 +
>   mm/Makefile                             |   1 +
>   mm/gmem.c                               | 746 ++++++++++++++++++++++++
>   mm/huge_memory.c                        |  85 ++-
>   mm/memory.c                             |  42 +-
>   mm/mempolicy.c                          |   4 +
>   mm/mmap.c                               |  40 +-
>   mm/oom_kill.c                           |   2 +
>   mm/page_alloc.c                         |   3 +
>   mm/vm_object.c                          | 309 ++++++++++
>   tools/include/uapi/asm-generic/unistd.h |   5 +-
>   24 files changed, 1654 insertions(+), 19 deletions(-)
>   create mode 100644 include/linux/gmem.h
>   create mode 100644 mm/gmem.c
>   create mode 100644 mm/vm_object.c
>

