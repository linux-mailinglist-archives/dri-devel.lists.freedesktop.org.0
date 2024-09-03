Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AF96A5D3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112D10E1B5;
	Tue,  3 Sep 2024 17:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2sfcFG2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1664610E1B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRHaC3KDexMmW+I/K3VD/GQauBvVS6SuBQEZFavJuPMZUnKu4W2f/m/fNtSUrLpxA1GNSJ5CNWkmBTjohql3IDXIwPqHvV1GQESR97mnO93kmOpJwg8svgCNpRDhF6d+BHt4YNaJ65+aiQ8Mbri10T/HdGgHMGJo/wvnXBf/gTkiWXLp6Vpo08WO87JMRkZpcCM+z9Y93Tdh4agB8CeId0vSCl6RKi0NzVv/Rr+9Citbm3yMplnAWpAWidt5GoAK5Diizt0cioDVly33qIsbrRl/RSLFA0BkJaprDUOzZDsHmxNoS85nuqeOBrDzgWSvJMyNDbe/MVpcJEPYt9nFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ3mCaxOi/Voyr7L9OshYsjl6FPLpa+mu5HknDY5pq4=;
 b=XCvUXZ/OmVJa0M6suOm5gL5vRVflU01hPz+ZBjg+fOXiEgj6AhkkzINdVmHhE7R5JHaQm2+dxMKXNV1lCA3+AlNcNmF8KGcuPQ3vHTmAQwS448c9SBMOxgs3+FIq/KX9A/hboQGoj00IAKr/tZHGLqsFQAP23JQOp5iyUZIEeipX5eAY3jhJnK97mpZG7234yDEPdXe46dM/hfMBA/9JLNfD5ZOq2/meMnFNRFc8ZElU9iG+pUQFSpLtxau1Ib0iNf8yFeDNZkfXc+1+dkYC/aeU3xvWbY6G/bU020x0Ac9LIKFeYoLR4Pio+dvU3yCotJro8mq5QBy6JgaIb/Gttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ3mCaxOi/Voyr7L9OshYsjl6FPLpa+mu5HknDY5pq4=;
 b=2sfcFG2yVp67WtG1TEY4TZPf8bD9ruNOCWrfB46rpMVk1QAtF6J04duGiFzaycn7Pl1fk9HA0VEclEVv4dmY8ASSsoP6dKRMv0rtc9N6wKS6zccrQqSnuo7Ho9zWutVXFj078Iyo6Rp8bK2XQ9lWEtNbS1W+A0+g4Y+jfFaAenk=
Received: from BN0PR04CA0197.namprd04.prod.outlook.com (2603:10b6:408:e9::22)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 17:50:13 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::a7) by BN0PR04CA0197.outlook.office365.com
 (2603:10b6:408:e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 17:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7962.2 via Frontend Transport; Tue, 3 Sep 2024 17:50:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 12:50:13 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 12:50:12 -0500
Message-ID: <7a8c001b-a535-0845-1679-0c1eccb6a082@amd.com>
Date: Tue, 3 Sep 2024 10:50:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 00/10] AMD XDNA driver
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <292c06d0-b96a-b5b5-5d82-e74b82bbb6de@quicinc.com>
 <d7f757e9-ed6e-7be6-89db-3ec9ddbb8050@amd.com>
 <1aadcb3d-75e2-285c-2244-e472cc21bb97@quicinc.com>
 <c0a66ae8-43ec-257f-92c5-6ecbfcd45c1a@amd.com>
In-Reply-To: <c0a66ae8-43ec-257f-92c5-6ecbfcd45c1a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 65aa66ae-c87b-4a74-83b4-08dccc40dd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2tGVmRqRk5lSjhkSUVIUDNvSVB6N3UyWmlMZmhlYVBWSm1KSnNjQll2aXdz?=
 =?utf-8?B?TFVsYTQrRkNIN00rVUJ3WUNCd21GeHA3U0U1SCtsL2VtU1ZTZ3VQanlGODE2?=
 =?utf-8?B?M3N4bkJ2THA2bDExd2wyU1BTc0Zab0RObEw4RnV2c2tXN0xzempBaGdRUE1J?=
 =?utf-8?B?QWIydFROL21nRHhodEhlL29kRFZCUmIzZUxNWW44TzI4N1QxWGxPa3BITVZD?=
 =?utf-8?B?akQwbmhLUm5Ob2tTcXZRSWFWR0xsM3JpZm02eW1MU091MVZFN2RHMzZJYkJa?=
 =?utf-8?B?VFBJazFGTFBSYlRBc1M0OUs5QTh0M0NqVDlCRkl5dmJDYldTdjVvTGo5QkZq?=
 =?utf-8?B?MzdDLzYyeSthQW1iVzRiYzZjUXZTLzUzVU1KUGNpTmIvb0F0YTczNS94V0FL?=
 =?utf-8?B?SDFISWl3WWMyb3JDcnZZNitaZUk0bU93WUg0am9IUE5jTHNuZ2gwN1hjZWtS?=
 =?utf-8?B?dmxnVS9lQkxHT2k3MGRvZGVYTW1BdVFFVm53eWYxSWlGNzJGelVaMDZ2V0pS?=
 =?utf-8?B?TGtCa2pOU25Uc0Z3UThBa1l2NUxjUGpDRzhJZXYyVXd2ajl3c1ZIdmJMR0lW?=
 =?utf-8?B?OHp0OURmdFNMVnB6V01UdXZRcHRYRElTbmROL0J1N0JyRzlObThzWDdwQlVt?=
 =?utf-8?B?NHNLd09nTjNYYXNkYnBHUGNQeGFVNFZuQWFHaFFlYTlrMXMwQzFNeHNqVzBV?=
 =?utf-8?B?NStoalpXMXpSeTIvMklBWjF6S0ZsWlltMk5oVTh4VldXYXR0S1Z4NVFyb2t4?=
 =?utf-8?B?L09UOURGZ2kzL0tEOUtQc1VsdUFZVjMwZDZSK01BZ0ZWc2laM1RMUWpWaFBt?=
 =?utf-8?B?RW04UzV2YzRKTXZpMzB5MWtiTE0xcWgyUW5QMktqUFk5TVlha2VZcG5mYjdq?=
 =?utf-8?B?TVhqYkdWR0hJcUllMFpLMzAzQ295Z1VFbjhBdmNwQ2hyRnVOV00vZDl2c3Vv?=
 =?utf-8?B?VjdJWlh2YnhzM0RrRVpKNHhXSDNHUXBEZWFRR0ZQUXNhWHhvS3kzVGF2N2ZU?=
 =?utf-8?B?clRTUy9qMG1hQUNVaU50QnJCK25meG8wWEY1SXNwdXByMTh3a3pRSi9PK0Jv?=
 =?utf-8?B?NTFleWZTZFJjRHRmelhLR0lIN3JFUm82djQrQjhPSDlONXFsZFZsSjlSY0Rx?=
 =?utf-8?B?YU9RalZ0OFZkall6KzhYSWM1U0Z3VlFXOWFCUWJkVHk5cEVNQytUMmdvQ2xE?=
 =?utf-8?B?MllmVlgxbkFaVXJOaDdqb1lyRUlqTHlNUkZ0SjYyMzMyS1pncmR4Q2RqSjEv?=
 =?utf-8?B?bmhIUGNmYWpvaFdiUjhOT3ltdmNhdnhtTUcwUlo5YUJ0S0dqSFlvY1N2amxZ?=
 =?utf-8?B?a0paWUE0eTdXWmdQQkw3RHIxK0JXQXZyNVZYejFlZGxsbGxYSWFFU2RMYlJ1?=
 =?utf-8?B?M2FYZG5xRUpFMU9Hc21oaURSeWJVVUFPSHVHVWwxNklwYVAvc09QbVV6d2ts?=
 =?utf-8?B?NzNUTHRZYkxPQmVBZFVNWTlpcVhMeVhJbmJaWjhBQTB6MFJhQzZEaUwzQVJU?=
 =?utf-8?B?OU5QUHNFL21hQ0xxZ0Ntcmo0YzNPSDd0Zng1TmtFNExwY1dXZDkzM0RPbnN1?=
 =?utf-8?B?TTd2M3ZKZXVpeHNjZVVVdktjTlIwZkZRZjVZOGc4NElEa3ArUys2VjFXdkhU?=
 =?utf-8?B?UG92V2dkU3ZJWjBHWDJ4RUswQkNPbGVpMDUrSGdKSnVnOVU0elpGQlpkRXc3?=
 =?utf-8?B?TFdCNC9ITWVnSzhkZEZkSHY5VlN3UnZmcjdBRUppYlJCTG1ET05TSHhhUUlr?=
 =?utf-8?B?aG1pZ0VRTjBRTG9UWDZTR01hSTFrRCs2Qnlzc05yN0ttRU9YMnViVngvc2M2?=
 =?utf-8?B?LzkxdldIQUl5SXd1dFppVTRIRXdzMGFXMHR2UDE4N3p0bHpFMkpuZWZ1SnZF?=
 =?utf-8?B?MXExUXY5VFhSUmlqZW1jZnkycHRrVm84czdUeWdZeitJSlE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:50:13.7085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aa66ae-c87b-4a74-83b4-08dccc40dd05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

Hi Jeffrey,


I have completed the code changes based on your comments. And we are 
still working on the documentation.

Should I send out another patch set with only the code changes for your 
to review? Or you would wait for the documentation to review together?


Thanks,

Lizhi

On 8/14/24 13:06, Lizhi Hou wrote:
>
> On 8/14/24 11:49, Jeffrey Hugo wrote:
>> On 8/12/2024 12:16 PM, Lizhi Hou wrote:
>>>
>>> On 8/9/24 08:21, Jeffrey Hugo wrote:
>>>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>>>> This patchset introduces a new Linux Kernel Driver, amdxdna for 
>>>>> AMD NPUs.
>>>>> The driver is based on Linux accel subsystem.
>>>>>
>>>>> NPU (Neural Processing Unit) is an AI inference accelerator 
>>>>> integrated
>>>>> into AMD client CPUs. NPU enables efficient execution of Machine 
>>>>> Learning
>>>>> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
>>>>> architecture [1].
>>>>>
>>>>> AMD NPU consists of the following components:
>>>>>
>>>>>    - Tiled array of AMD AI Engine processors.
>>>>>    - Micro Controller which runs the NPU Firmware responsible for
>>>>>      command processing, AIE array configuration, and execution 
>>>>> management.
>>>>>    - PCI EP for host control of the NPU device.
>>>>>    - Interconnect for connecting the NPU components together.
>>>>>    - SRAM for use by the NPU Firmware.
>>>>>    - Address translation hardware for protected host memory access 
>>>>> by the
>>>>>      NPU.
>>>>>
>>>>> NPU supports multiple concurrent fully isolated contexts. Concurrent
>>>>> contexts may be bound to AI Engine array spatially and or 
>>>>> temporarily.
>>>>>
>>>>> The driver is licensed under GPL-2.0 except for UAPI header which is
>>>>> licensed GPL-2.0 WITH Linux-syscall-note.
>>>>>
>>>>> User mode driver stack consists of XRT [2] and AMD AIE Plugin for 
>>>>> IREE [3].
>>>>
>>>> Is there a special branch with the code?  I don't see any of the 
>>>> uAPI in either project when searching for the ioctl codes or ioctl 
>>>> structures.
>>>
>>> Please see git repo: https://github.com/amd/xdna-driver
>>>
>>> This contains the out tree driver and shim code which interact with 
>>> driver. E.g.
>>>
>>> https://github.com/amd/xdna-driver/blob/main/src/shim/bo.cpp#L18
>>
>> Ok, I need to have a look at this.  Long term is the plan to move the 
>> shim to the XRT repo once the driver is merged upstream?
> Yes.
>>
>>>
>>>>
>>>>>
>>>>> The firmware for the NPU is distributed as a closed source binary, 
>>>>> and has
>>>>> already been pushed to the DRM firmware repository [4].
>>>>>
>>>>> [1] https://www.amd.com/en/technologies/xdna.html
>>>>> [2] https://github.com/Xilinx/XRT
>>>>> [3] https://github.com/nod-ai/iree-amd-aie
>>>>> [4] 
>>>>> https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>>>>
>>>>>
>>>>> Changes since v1:
>>>>> - Remove some inline defines
>>>>> - Minor changes based code review comments
>>>>>
>>>>> Lizhi Hou (10):
>>>>>    accel/amdxdna: Add a new driver for AMD AI Engine
>>>>>    accel/amdxdna: Support hardware mailbox
>>>>>    accel/amdxdna: Add hardware resource solver
>>>>>    accel/amdxdna: Add hardware context
>>>>>    accel/amdxdna: Add GEM buffer object management
>>>>>    accel/amdxdna: Add command execution
>>>>>    accel/amdxdna: Add suspend and resume
>>>>>    accel/amdxdna: Add error handling
>>>>>    accel/amdxdna: Add query functions
>>>>>    accel/amdxdna: Add firmware debug buffer support
>>>>>
>>>>>   MAINTAINERS                                   |   9 +
>>>>>   drivers/accel/Kconfig                         |   1 +
>>>>>   drivers/accel/Makefile                        |   1 +
>>>>>   drivers/accel/amdxdna/Kconfig                 |  15 +
>>>>>   drivers/accel/amdxdna/Makefile                |  22 +
>>>>>   drivers/accel/amdxdna/TODO                    |   4 +
>>>>>   drivers/accel/amdxdna/aie2_ctx.c              | 949 
>>>>> ++++++++++++++++++
>>>>>   drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
>>>>>   drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
>>>>>   drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
>>>>>   drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
>>>>>   drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
>>>>>   drivers/accel/amdxdna/aie2_psp.c              | 137 +++
>>>>>   drivers/accel/amdxdna/aie2_smu.c              | 112 +++
>>>>>   drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
>>>>>   drivers/accel/amdxdna/aie2_solver.h           | 156 +++
>>>>>   drivers/accel/amdxdna/amdxdna_ctx.c           | 597 +++++++++++
>>>>>   drivers/accel/amdxdna/amdxdna_ctx.h           | 165 +++
>>>>>   drivers/accel/amdxdna/amdxdna_drm.c           | 172 ++++
>>>>>   drivers/accel/amdxdna/amdxdna_drm.h           | 114 +++
>>>>>   drivers/accel/amdxdna/amdxdna_gem.c           | 700 +++++++++++++
>>>>>   drivers/accel/amdxdna/amdxdna_gem.h           |  73 ++
>>>>>   drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 +++++++++++
>>>>>   drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
>>>>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 +
>>>>>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 +
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       | 234 +++++
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h       |  31 +
>>>>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |  58 ++
>>>>>   drivers/accel/amdxdna/npu1_regs.c             |  94 ++
>>>>>   drivers/accel/amdxdna/npu2_regs.c             | 111 ++
>>>>>   drivers/accel/amdxdna/npu4_regs.c             | 111 ++
>>>>>   drivers/accel/amdxdna/npu5_regs.c             | 111 ++
>>>>>   include/trace/events/amdxdna.h                | 101 ++
>>>>>   include/uapi/drm/amdxdna_accel.h              | 456 +++++++++
>>>>>   35 files changed, 8178 insertions(+)
>>>>>   create mode 100644 drivers/accel/amdxdna/Kconfig
>>>>>   create mode 100644 drivers/accel/amdxdna/Makefile
>>>>>   create mode 100644 drivers/accel/amdxdna/TODO
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_message.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.c
>>>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>>>>>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>>>>>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>>>>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>>>>>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>>>>>   create mode 100644 include/trace/events/amdxdna.h
>>>>>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>>>>>
>>>>
>>>> No Documentation?
>>>
>>> Is it ok to add a work item to TODO and add documentation in later 
>>> patches?
>>
>> I beleive best practice would be to add Documnetation in the same 
>> patch/series that adds the functionality.  I'm not expecting 
>> Documentation for items not implemented in this series, however I 
>> think describing the product/architecture/other high level topics 
>> would help put the code in context during review.
>>
>> It does seem like the AMD GPU driver had a lot of documentation, 
>> which makes the lack of documentation for the AMD Accel driver 
>> particularly odd.
>
> Ok.  We will work on the document
>
>
> Thanks,
>
> Lizhi
>
