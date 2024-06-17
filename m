Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87E90BAB5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487E410E4BE;
	Mon, 17 Jun 2024 19:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rfBsYV2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F84310E4BE;
 Mon, 17 Jun 2024 19:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7gM4haSmryG/i2DQBk01fe+yYYhoeCPS2jS0/erBUT2vTD6HFxFQ+zMXRq2b8HTb9JZsuI435DIEPmIh7J2J9nKyUkCapH1iLc+z/FhWhGA0WfvZ1mPQJVVuFNx+yExNtMR0XF7J7qL3mHXdiJuZv4JMoOUopZNu07J1Ub8tGfTBw8G18Khoy7qS0KpA7ddxxnG7wHLgrMVulXfFz3CMYLXTQTJkyfUSALE7bmWJz4R2m9DVYtjeN6y5CgWRuS7gtaqcxFnXtRQGBlDE3KQkE1PWy9kEBLOkzHT797zyXLJwp+828xPsemp3mMqYn1Mhm10VpHtPQqeDs+fDzMF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=942VZbPat/xT1X+bUKP3E2D33SMAGYD62Le0kcT89d4=;
 b=nN1MrWitAg4A01QmyLxhX/WdfhpRyMBOpcc0IGH5ZbrkfKG/qk6wfhWIjgcxLmrND1bzuxm51mVKYlILvbC7vMPI+l+hlOAnIBdlC68/ShfV96y3p+dJetBcWAB29RAIc0QnSfVKVOc/TSw+tRnUDv/WUJP1nq1DR4juAmIWs2AEXEDkah2JbJ7rHJhPkr6DCaqgoefXqdSOfSytBJs6a+2eX6V9qtbRc3kx1/r8ljtJWUQBSrn3WvF9h0+C54tRPRStgxsp0afng2UovPqc1mZe9fZ78Rl45W9HJVhPZGvUQehSDJZeWyW7QGSz3Yw3Pvd5htELIE/vCN4gc7yLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=942VZbPat/xT1X+bUKP3E2D33SMAGYD62Le0kcT89d4=;
 b=rfBsYV2tstrrH/MFu/aHlKRJ/mUxWSYHDa4MHbrk/R+kJx8XezW2j99kVnE82Ar9Vkcuz+ZXzy6ahz2CyQ/qNDKteDzC0/T+gTgKPi8dj0N5pVlEAkGOkX7tOHsPR5vdCbpjOPor5Y5H2mpM5pCXup0eHOhNaTe8V0fwZ9io+Cp5vjK8anSrkwK+MYlVhFmJxmLJwdYHx6opkWoa5Jn+AXZ3eh7gNn9R0f0A6wvfgJ0O8coLrePlyTc58ZO+Yk1zUOH8SrGHiL6POeeJ9ErJLwdjKeyv9j7va/nrjp4z93m1ySqth4TKvsX0mf6REWs5z0vz2TreXntfl26WP84tnw==
Received: from BN9PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:fb::22)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 19:19:45 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::96) by BN9PR03CA0047.outlook.office365.com
 (2603:10b6:408:fb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 19:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.0 via Frontend Transport; Mon, 17 Jun 2024 19:19:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 12:19:29 -0700
Received: from [172.20.75.190] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Jun
 2024 12:19:28 -0700
Message-ID: <c1b1a7ec-7fe2-4bae-a505-320ac978db95@nvidia.com>
Date: Tue, 18 Jun 2024 05:01:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] GPU driver with separate "core" and "DRM" modules
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
 <ZnBy0jOshdyyLmkL@cassiopeiae>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZnBy0jOshdyyLmkL@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|DM6PR12MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3c3a58-0cfb-4af3-6bf0-08dc8f027257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|1800799021|82310400023; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmx5Tys3TlErWE1DWkZOUzdNa0wwS2ZwZFV5Qm4xN2s3VmxFZS9NNTJndVdB?=
 =?utf-8?B?NVFCNTl4alp4c0xQZXNTVG5VYmFmeDdrSklId3pLOFU1TXFva1pkVk9hVUlX?=
 =?utf-8?B?UW9QWnNxV1FqY1A5d0RaVmRGYU1vL0xqdS9EVnlCZzJ0QVNzd2llOGVLY2lj?=
 =?utf-8?B?UWlxU2tuRFh5NkY0SUhKbnhxQUROTEI1Nmg0U09yUDJUYldKcVI1dHlNVTlB?=
 =?utf-8?B?bWZRc3REcDJMT3NtTUFTdG1DUWdvVmZEd1RxTGlWWUlISElDK21mVHJhSzhY?=
 =?utf-8?B?RjZUSnhPa0V6U1pGWUNnQzgyM0NPUUVtYUY1NnE1NjJLNFJnMFBsV01YdXRv?=
 =?utf-8?B?a2FPelVPMUNiUmg3R1ZENjVJZTJhdGlITERiVkZFYTdyMmY1S1YyZ0dWSy9z?=
 =?utf-8?B?MjhvVDV4K09UNVRpaENMcWZadEZSL1RLaVZYRXFGY2o4eXZJNDZoWWg5V1pG?=
 =?utf-8?B?QlVwWlJCWllZSkxibGV3UVBSK2Y0WjBpK3pvUlF0bnJ4OFg5U01PWkQvYStx?=
 =?utf-8?B?UmNielFEaTkxTDQweG5Oclp4RVZ2cGJZdHFLRWZCa1Bwem9jOE9mNHlpUU5F?=
 =?utf-8?B?cXk2bitFeFBQT0RyMTJ1V3VZTURpUUpNMllBQURIZktOc21jNEwzZ3d4bmxW?=
 =?utf-8?B?MHpjZjU0V0kzT1gxOHhDdEhockY2MXg2K25sT3dJL05lUTNTTHBFbU9JUk95?=
 =?utf-8?B?bExwOStwc1ByTHZEMmFKUFZiRlA0U3JoUXpvZDVXQWo4QllUdisvdE9RdjlE?=
 =?utf-8?B?alNZTUNvVG5IclFUcldqSng1ZXJBYitOSDBORzVnbm5DQ3VBQWFJWkxveVEv?=
 =?utf-8?B?cHRZYjMyNEJELzNMVGpuREhlTC9TMWNrV0tNTFJxMTRLTURYcUhNSWxKWTJ1?=
 =?utf-8?B?Q0MxaExtZEtDbng5VXRKUEd0amtORno0eFErMG1xVityMEFab0t2bzlmNjd2?=
 =?utf-8?B?K3BWb0kyQnN1VFJMb0ZvakV3YmJIb0F4dHgzdXBlZ3l6Q3FDdGFNL1VTQkpI?=
 =?utf-8?B?M2RrNlVQeCt6SjhOODBzQVhQYlU1T0xTZEtsd3BiUUVxRHZSUndJbW5mS2h0?=
 =?utf-8?B?YzRnVlZ1cHNiT0YrdGNrZTRxR0xqbEJFbldPSnM3RUJDZzl6MGpwcnRDWmNX?=
 =?utf-8?B?emVQdHRSanlWRjNGUkhqL0QxYU9CZ0FsSjdPYVgraU8zcnQ5K3hxc05oYU0v?=
 =?utf-8?B?d0NnWWVNVEZTbnhOUTZKNEJpZGUvRnZrd3M5a3RUTlpDbjF5VXhxYm1tRXBa?=
 =?utf-8?B?S2RWR3lMNGpvV3Y4aXE4WmJDQk5lcTNzODMxOGFKeWRJdld0SG9LaDNIYVht?=
 =?utf-8?B?WC9aSnpEVTgwcTliRzh2Vk1SdFFzd0xSblBzUmhxREs4T25KazRzRmJNVzZy?=
 =?utf-8?B?eVRHZ1lJRXpjRjlrazZtY3ZxM3lrNEhsTDkyeDZKbWp6MXlMbkZCSXFGUDcz?=
 =?utf-8?B?dDdoaEpHZitQRWU2RWlRQk5nVkQvYzZOcFNiRlZNZDljNUQ1b2dOQTMwR3BS?=
 =?utf-8?B?bS81OXpKYWJsNUFDK1VvQ3JtcEFyNVdIVkVlYjBRbnNTVjJhZGJBZGwzRGZq?=
 =?utf-8?B?ekNVU2RlUG9wQ3hqekJjczlxN09XWXRmMlEyaXFyL2J1TTVuSG02MXVtNmJL?=
 =?utf-8?B?WVFsbTUyd0VBV3JuSlZLQnhBWk95eVdhNnlEd2VOY1lleFByd0ZXLzlod3pY?=
 =?utf-8?B?TVlhTDluRXVuRnptQXdZNUZXdTd5ZWE2ZFM1SWpCdzdOcUhjYUpKa0JVa0xl?=
 =?utf-8?B?UXNZUE43UGZrd2hkYVBpL0pNaUJzMFVVbCtMUVErRGZFQ1l1bjRSeVFkS3Q4?=
 =?utf-8?Q?de8xGXf7gzY7DYouozInrICfoDeTvcpgmaLao=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:19:44.8931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3c3a58-0cfb-4af3-6bf0-08dc8f027257
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/6/24 03:30, Danilo Krummrich wrote:

> On Fri, Jun 14, 2024 at 03:02:09AM +1000, Ben Skeggs wrote:
>> NVIDIA has been exploring ways to better support the effort for an
>> upstream kernel mode driver for GPUs that are capable of running GSP-RM
>> firmware, since the introduction[1] to Nova.
>>
>> Use cases have been identified for which separating the core GPU
>> programming out of the full DRM driver stack is a strong requirement
>> from our key customers.
>>
>> An upstreamed NVIDIA GPU driver should be able to support current and
>> emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
>> to date do not support compute or graphics functionality within the
>> hypervisor host, and have no dependency on the Linux graphics subsystem,
>> instead implementing the minimal functionality required to run vGPU
>> guest VMs.
>>
>> For security-sensitive environments such as cloud infrastructure, it's
>> important to continue support for running a minimal footprint vGPU host
>> driver in a stripped-down / barebones kernel environment.
>>
>> This can be achieved by supporting both VFIO and DRM drivers as clients
>> of a core driver, without requiring a full-fledged DRM driver (or the
>> DRM subsystem itself) to be built into the host kernel.
>>
>> A core driver would be responsible for booting and communicating with
>> GSP-RM, enumeration of HW configuration, shared/partitioned resource
>> management, exception handling, and event dispatch.
>>
>> The DRM driver would do all the standard things a DRM driver does, and
>> implement GPU memory management (TTM/HMM), KMS, command submission etc,
>> as well as providing UAPI for userspace clients.  These features would
>> be implemented using HW resources allocated from a core driver, rather
>> than the DRM driver being directly responsible for HW programming.
>>
>> As Nouveau's KMD is already split (in the logical sense) along similar
>> lines, we're using it here for the purposes of this RFC to demonstrate
>> the feasibility of such an architecture, and open it up for discussion.
> Generally, I think that approach is reasonable and I like it. There's only a few
> concerns I have for now.
>
> We've already had (and still have) quite a few difficulties due to this split in
> Nouveau. Especially when it comes to VMM and handling page tables. There are
> cases where the locking architecture must be closely aligned with the upper
> layers, i.e. the (VM_BIND) uAPI.
>
> Having a separate (local) locking architecture doesn't work out well in this
> case due to the implications of dealing with dma_fences and their signalling
> paths.
>
> Unfortunately, we can't even argue that we solved this problem in Nouveau. I
> think it's fair to say that we found ways (without rewriting / restructuring a
> lot of the VMM code to use a more global locking architecture) to make it work
> in practice, but surely there are still conditions that (at least theoretically)
> can lock things up.
>
> I'm not saying that it's impossible to work this out, but having a strong
> separation is likely to make those things quite a bit more difficult.

Yeah, I think there's a bit of work ahead to determine where exactly all 
the pieces should live.  For VMM specifically, I'd be looking more at an 
architecture where the DRM driver "owns" all the memory remaining after 
GSP has booted (or was allocated to its VFIO partition) etc, and manages 
it however it sees fit.  And, rather than calling into the core driver 
for mapping into a VMM, the DRM driver would allocate its own PDB, 
inform the core driver of its location, and manage its own page tables 
directly from there.

This is similar to how the interface between NVKM and GSP-RM works now 
at least.

I've looked a little bit recently into how to approach fixing this in 
nouveau, but don't have a solid plan yet.

>
> On the other hand this is a problem we might have to deal with either way, it
> shouldn't matter too much having separate modules for VFIO and the GPU core.
>
> Besides that, do we expect semantical changes in the firmware that can
> potentially propagate up in the following sense?
>
> [GSP firmware -> Host GPU core driver -> VFIO driver -> Guest GPU core driver]
>
> If so, how do we deal with those? In the context of ensuring compatibility, can
> we ensure this can't lead to increasing maintainance and testing effort over
> time?

That's a very good question.  I suspect it's inevitable that those type 
of changes could flow through from FW updates, and we'll need to come up 
with a plan for how to deal with them.  In general, it seems like the 
same kind of problem as with maintaining UAPI compatibility, but I'm not 
sure if there's any additional considerations for virt.

Ben.

>
> - Danilo
>
>> A link[2] to a tree containing the patches is below.
>>
>> [1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
>> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module
>>
>> *** BLURB HERE ***
>>
>> Ben Skeggs (2):
>>    drm/nouveau/nvkm: export symbols needed by the drm driver
>>    drm/nouveau/nvkm: separate out into nvkm.ko
>>
>>   drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
>>   drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
>>   drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
>>   drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
>>   drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
>>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
>>   19 files changed, 33 insertions(+), 16 deletions(-)
>>
>> -- 
>> 2.44.0
>>
