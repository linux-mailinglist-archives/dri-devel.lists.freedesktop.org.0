Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08917FBAE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229610E510;
	Tue, 28 Nov 2023 13:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FBF10E066;
 Tue, 28 Nov 2023 13:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY0tMip/KH/on+PG+taZKPiIjRO/nP6iIwCiwFTdlGQSE8YenxGEQoyulMyMdYEMdt/N1JPitA2mTDKco3YTWrjlKJtnZ6Ny/YvhX0bSKVdoGIbYGCC8AOkbxPU9QidKbydBieDH/AFC965mQKgnrjehXxdSZXabrdurn7cajM8I81XXWtxSBegNVjwfGq2EdPRpYhjMTdVnDeKwEVnEAXZw4WsWdNhoh8BBK9HhQukkm5rDR3PbxaP1Fem9vYNJY8CO5i1h7cU0z7JG+Uq4f8e7q0+/BvZumuR8PvofYEBeJKPe98DUDxtc36sj6B0/dI/6MTKJTY6j6txDJY3HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvEyeM57us/CBk18WML3kCwE8JlbwY+Ltl9SlSVRweY=;
 b=M9WRNkXMnw1s6fkKjYApM/cASMF9HDiwlPD31OOaW5RNyiQ0PjWsWnrxavd2GNUL56srokFkCnTGXiw98sa5C+kC+1dyzxsinF0OoWmxAAXXbLYwPbNMOW58WwxY1dlVHslAL8nfOP387JzN00hB/KHoYyiulvGB04A4/RCjgrxQ0vsGxWBWdp2OUSMPplbO/m9lIos2ByoK4eSef7oSm6vDQSSuMOPyXhAxo9MUZGQNz00PBm6MvxGIcQT9Hwt9GjbOgFO7sbfQ8l7G7k2FQ8pDAg0IQF+vJtH0h4GuZfxq9kf2iO80r5PTwqdhJ/4e5PKRQgXFGBO2Wz/EnJqyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvEyeM57us/CBk18WML3kCwE8JlbwY+Ltl9SlSVRweY=;
 b=5FRQqSH6ZAB070CiGI2HpG3XYDzCcZboVnLHHI9Y4z1SSCfCC6lwmmsK26CZEPAplMH36UTl+VmxnvKhxvSuG4oN57S8/XHryqF6cLAO6i62SASUOi7ZaCv4JrtFSGPD07YSEn4W7n7b7NFGZ0hH5LHqygN+LwIXKv5ouKPL6Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 13:06:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:06:37 +0000
Message-ID: <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
Date: Tue, 28 Nov 2023 14:06:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: Weixi Zhu <weixi.zhu@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231128125025.4449-1-weixi.zhu@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d735ad-ca51-4051-399e-08dbf012daa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M0QR+3E8lsCVQT+230LwLh1oS39IQgbGVku82e+6MTPjcxIwN5CYvGKIjFa/yrs14RrV2EJ/fYY7/dtJC0riNvslHY+BidIzdvUNh4WB507pRu2RkaEuOnQjgozRmKlQZG5j8DCcp7lt6FT/iSRBsvQxfMDfKq0I1ZAApiUDpz6HAhZBn6Y2GD9Q9JpCg8kZNrRwpoXbMqpi5HkmEoHbS9MIQEP7Az8vtKk1SZhsYsh9bQ0+sbPj5RuVS2XcOkz4s0JUWjjQXvvTVmiQIxXfhWMLcPB51oVA1axgX7T2PP7PjJfxJAhSxnnxD2YQe+KS7C9PIIKIZFP/YX1tKGMVf4AziLUT7CXl0dtJGvjhdu/iAmWUT3bO7T2CVU02MpXb4wIfdoxi1ZVXG0hRa9UqNULQBzyjjtuXaO+MAB8aT9yyr91iqmGd5dcvy51FVnWYLedbMohYZRCRrVF7mO6J4cVkzZyLgKzEJ8ssSGu8zRzHZPykqLABPy5RuXPL3v8V60XMUofu+k4RHUWgdgk90Stfggc+C/DkSE1bAFr9iAdhwQOET+bJnnaYqd7hjQq1hBN/+SsMynbn1l1KaSVM56pZ2zW/L+mh/X9oQSAoPJVVaiJdQzhK/M2gaeDgFc1AEM4qzCebSZjPp/GLkFa7WXJ0dDp65KB6z0eZjiWYLb+t2r3miLHXVtH15aK/TDAK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(66899024)(2616005)(26005)(45080400002)(6506007)(6512007)(6666004)(86362001)(8676002)(8936002)(5660300002)(66556008)(4326008)(6486002)(31696002)(966005)(478600001)(316002)(66946007)(66476007)(7416002)(38100700002)(83380400001)(31686004)(41300700001)(36756003)(30864003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnRBVHQ4RjJncFY0cjB1VjJDRlJHWkRjZ2VhUGE0Q3R5SFpGS05EQlNhUGg2?=
 =?utf-8?B?SVJmKy9obFRhYjYzY01uOWxteWI4M1hjMnA2MGJhcHNwRXNKbThiZStLaU82?=
 =?utf-8?B?em9hd05FUzFyd3Q0WmFHeUVxMlpRakNPQVRjbERPVmJtR252cU5TeUlxZlUw?=
 =?utf-8?B?S3dNY2RHdFRwcW85U0RpcHY2alBJeWc1dGtrc09oYmZVL2VaZEpXOWZHNW5m?=
 =?utf-8?B?QTU5MUgrM2I3VENjZmNNOVdobWlnU2hSSUVkUGJ2REt6Y3NIeWd5Q2lVZWhI?=
 =?utf-8?B?Sk5yTjJMWkZTTGVZMDlKQ214TE1IYXlvTjdkTis0a0czN2FpQU9XV3BxY1RN?=
 =?utf-8?B?WFB4VzluY2xnTFk4U2dYRG9aS3gzV3l5VCs5YmthZERrUGpmT2NSWEhxUDJw?=
 =?utf-8?B?TXpJRjBtb3g2RjZtcXJJK2tXM1loRWtVOUhrU2swU2NUWStmcnZ0YWxhNDRj?=
 =?utf-8?B?MjZKLzZBRE16SWdvOXFKNUZOck5GcGM5UFhMSWljSCtNZGZjMHAwVlozandK?=
 =?utf-8?B?Ym4rUXJkeEtSMzZMWXFtUlYrZ1F2RXl3aG9hS2I2UFNLWDlORFJmTGdvaXNn?=
 =?utf-8?B?a0JxK21rWHppUENRZmVlM3hYTXJWbmRqUUFwRVB1MFdSYXhsU1ZmanQzMWs4?=
 =?utf-8?B?RWJPNUFSZVJWZVBiMWZoaFZUcWpSRFVvdEpoNmsxeWV1bWZwejZUWlpsVnJN?=
 =?utf-8?B?blNQalFsSFJweVlZYkZUK0s0NGZya2lra0M2enNZK2VXRnpxYnpEQmNMTytn?=
 =?utf-8?B?S2R6TXdZVUtDd0ROby9rUzV6L1NxSGtDMm1UVVJHaXh3aGloSFp3Z0NScmVu?=
 =?utf-8?B?L1VEaGtHa081aFljQnd3ZWJmZGx4Mk1kUm9tK3YvY05ZS016TjB0TkljQVF1?=
 =?utf-8?B?aWtaeEErMWdNQVl3VnJpVGk0czU0ZngrTGNweDEra0J4Z3lkeXNlVk5UNURC?=
 =?utf-8?B?OGtZOXhNWStLNnE0YU52YVNPVjl2MnYxQS92Qm5OMTJyZ3cyVUEwMXJiS2pk?=
 =?utf-8?B?ekc1STBja0t1OEF1WlFSL2U0V2lKUE1qcFlNSWVFb1NCdGhPN2ZqRlJOTm9M?=
 =?utf-8?B?Sk9HUkJURnlZTGxlZC82TjJRV3BlVy9BWlBicWpUcWJMcFdwK1JxYXRyeGxj?=
 =?utf-8?B?THoxSTVzZjBPenlzUXRJV1J3eDhDMzhmdlZuMXlRaXVCUkhKWWwwWVpRWmw1?=
 =?utf-8?B?d05aenRoRElHL2l6aWsvN1lMRVJwSzRGdlYzMlNIelJsMGNHdTFTVTNVdWRm?=
 =?utf-8?B?WTVkZzFpTGhRSW1RaFMzcVhRRTVrYzFTbEN4QmFoWGdzeWdwUnl2QkFVMGNJ?=
 =?utf-8?B?UjBkZnFWRHpJYkFFbENLZHdqcnQ5S0Erdjh2OTgvUEZFT1JYZThrbnFPQlJv?=
 =?utf-8?B?NnUzZCtHbDlxeHNTbklKVWlyTEJrRlpibS9GZXJiaHJTV3l3bVF0czMydDVt?=
 =?utf-8?B?NTVWbjFRTWZSd05jaytrY1cwRTVoK0V2MldLb0R6NVprR0I5ZDBEajNyUkNQ?=
 =?utf-8?B?N2JWK3JOWXdDRktwMkZFTmNNSTI5N0VsSkxHWnVlK1AzOTBFZzBobE1XcWto?=
 =?utf-8?B?NVVvY0RJOGZwam5ZbDRHMkdCZkpuOE91dzNlRHZmczZHUTFFQ0xncmREanI2?=
 =?utf-8?B?TEpsOWphY1dHaVlxeCt5WFliSm5vRjZFVmFwLyt1bVdhbFVQbm11T2U3ekdZ?=
 =?utf-8?B?OUlvZW5uYnp5NnhZZk9SVUNKRXBFdDRrVkNIZ0R1VDlad0lQNWJxOG80cFZa?=
 =?utf-8?B?dEwyYlFiVFgveW1KbG9lS0RJMnNwZU5jaU93SUFqblRpWDVnVXNTdldTN3Jm?=
 =?utf-8?B?akw3SVhoMXFrVm5wRDZsT0tBc1R3K1dON1J0UUxkWG1DZE5Rdmt0by96c1NF?=
 =?utf-8?B?UW5KMWlNamh2dnphSXlDT0JNSFU0VnNqNE5Vd0Y3MUZ4aEZkSjc1Y0N5bmlI?=
 =?utf-8?B?UDFFcm15Nzh4RWJ1NWo2clk2VVRVdGtKbFhIWUFMZGFNUzFBcjV2eThndWxi?=
 =?utf-8?B?RGVyZHhxODgvWGpubEVzNTlvNWNyNUtucmNxVktEOWJhbWU2WG12aVoxQTg4?=
 =?utf-8?B?NkVUZjhXbktwMzJXa0NENW5vdWlaYW5Ta0lKS0FZZjArVU1uRnRhWXlTcExQ?=
 =?utf-8?Q?fB5E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d735ad-ca51-4051-399e-08dbf012daa2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:06:37.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8krkSVgw4To/nddwnjE94jNWedDKv5kWmpDmoU1Q7ZD/gAx8Yw3bTJedojWq+fj
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

Well that is pretty much exactly what AMD has already proposed with KFD 
and was rejected for rather good reasons.

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

Well to be honest all of this sounds like history to me. We have already 
seen the same basic approach in KFD, HMM and to some extend in TTM as well.

And all of them more or less failed. Why should this here be different?

Regards,
Christian.


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

