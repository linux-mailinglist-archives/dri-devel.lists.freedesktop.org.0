Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68322952310
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 22:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C749410E0BD;
	Wed, 14 Aug 2024 20:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nzZUlLDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360D310E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 20:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJTunrBtXfa+4V5mAXshW5ojQqDqeqxZKRHP35YMSbr65ypUQ7sEoyFVIe1nJGipvM62R4x3GCDX2l/dEWn7HsW11EfGNJhEAeu58tVb0U61qzR2Na5oLEJ4nXx43J5PLjdbu2PTxYsjQGSGULh/hmOvVD9nDktpRTpQ9mvuMvqeMnbD7xBMhpFEt1USiiKgkJqR+gX/dGZtle84zt/NM2+k4QgrLUX1A7/gLUP9SvpdemdU0pfX5r0X2jQN3w4Z/CuQt+d/PiolgJsR52xgcWVVGPxuTzke4mug/7mRWRKILhT1LORGAuCxQuVymLoobLgGcdpDRX8egkneFR/Qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdBDATBVe751VwRjOllojzrOCPxt+DGde7hRH8dOuto=;
 b=xlwjEmdch5Q3InGoZ9md45CdP1A1OBPJuC7L4LhZeFZhLcK4tH+LuNoYDLSdwcEhYOiLwYQWOM+42F+yb71Ks0yObyIwJ6rNfKbORB1t+MdREv8yg8GXMjnuK7urnhj2CPRxIrRTUZZ48j75Ti71fkXGtAxQcEServ5u4plW9wKwiZQKoQzOHPHyRadSKLFk8BEAiSFk1kuwjtLKDK9hh4pF/3ndgG6OlVnPbCyAWb3jo7EdHT+2ARjiWXTJC2EegYIPqlNEIyd6Hq/CuYTM/QNMkfqMs3zdZdbqMB1mw7jXxU1SNcZ7BcAOxRnbW8TJWuU1N5+lvGmYeRjI4E6gWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdBDATBVe751VwRjOllojzrOCPxt+DGde7hRH8dOuto=;
 b=nzZUlLDX8HYrwzsU8e6T01LI10QlExuoQSBvm9On+c6xApv4WTaCvG0UK8L7BXJ/F313GsL1wN5LOD9QJN6HogRvtCL7JypFdXDd99zzPb1HMVRVx/usVCPaUdi9rGCj0zgs2bL1NE2kAjeQ1AQgAgUuK1TleqDFID1WCyvF6Ro=
Received: from BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Wed, 14 Aug
 2024 20:06:51 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::91) by BYAPR02CA0053.outlook.office365.com
 (2603:10b6:a03:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Wed, 14 Aug 2024 20:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 14 Aug 2024 20:06:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 15:06:50 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 15:06:49 -0500
Message-ID: <c0a66ae8-43ec-257f-92c5-6ecbfcd45c1a@amd.com>
Date: Wed, 14 Aug 2024 13:06:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 00/10] AMD XDNA driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <292c06d0-b96a-b5b5-5d82-e74b82bbb6de@quicinc.com>
 <d7f757e9-ed6e-7be6-89db-3ec9ddbb8050@amd.com>
 <1aadcb3d-75e2-285c-2244-e472cc21bb97@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1aadcb3d-75e2-285c-2244-e472cc21bb97@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|BY5PR12MB4163:EE_
X-MS-Office365-Filtering-Correlation-Id: a46c13f0-8b54-4d3f-e86d-08dcbc9ca2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGQ2Mmk4UmhnKzEyZERUQzkzb0o1OG1aLzFDRUh4TitwLzI1Mnk0d0kraG5n?=
 =?utf-8?B?djViREtOc1JWTlRodUhWVkJ6RFlMT0ZVMjFkSkQwM1lUa3FlaVVPTTVGYXdJ?=
 =?utf-8?B?ZHdpMmJhUHZiOFJDRGRtZTNzZmxqRlcxQ0NpN1d5eDNIVk9qNWkvQnFqYTBH?=
 =?utf-8?B?Q3dvcG5YWUlnY0h2R0pmbUtXdHNVdmc1YWx1T3kzeWk0elBUL3c5WkNwN3pU?=
 =?utf-8?B?eTlRYWQxRHMyb0FIZWdzNis4NnYxRHl6c3B2TStBbHBNRlh4dUVEY2w3dzh6?=
 =?utf-8?B?MCthM0xpdGdLZkFJTUdaWk1GMjM5d3k4T1IzUVJRcWhlcnR2dm1LRFJ6SHhI?=
 =?utf-8?B?c1RjNms2MXJHYUphbGJWaXU0V1JBNmN5WGRXaGpNeks1SGxJSTZUU1NWOEc3?=
 =?utf-8?B?ODhSWDVHamp3bEZYVU5YaGZMVEQyeDBuaS8xR2xRaUxtaGtGaUlBN2xPczMv?=
 =?utf-8?B?eDd3SUxoK1lPbGI3cHdtZjdLM2hnUU81VGtWcUZpRUtYNTE1QkZ3YzBpb3c5?=
 =?utf-8?B?MU54UWV3RnZPVHgwdDcxSEhXejIzVWNvZXlra05iN21PVEV6bm9uNVdUdFdq?=
 =?utf-8?B?R0RwYWNNMnIydVhQUnJCcjBYTjFhNUgvQXEvcy9EM1JuSlVXVTd5cjE2WHRX?=
 =?utf-8?B?eTFJRGxLRE5Ra1Vnb05XZTdPY0MzUndpOHNhSVBtdlVnU2xkU1kxK0orOVlT?=
 =?utf-8?B?c3dBeUs2TTRBMy8vYis5bGowdDk1NW1vdmhic1oyMTVXZjgraEcybks5VlpJ?=
 =?utf-8?B?RHRqWE5MNTNVbGhqaExEOGRUU2Fady9sVEFNdHp0eDNmSndoTzAvVEdZVmdp?=
 =?utf-8?B?VFRxVEhCbUx2SEVqV0JpeDE2VEZ4c1pFNDNDeFpPUk1SanJ2Nk1FblpwYnJW?=
 =?utf-8?B?QWNIL0JUQ2U3TThQSFQ3TU5iMWQrbnpveUZhNmkrRzJ1T1I1cEw0NTdlNGFF?=
 =?utf-8?B?QmtvWFl6TVYycERHS09NUUJ2K3hUUk95NjFVUHUra0Q5OERjdmMydnpwQm5s?=
 =?utf-8?B?d1pYSlJhU0U5MDFqZ0hxSTVUK1hCdXBnMnR3SkNwVWRiZXdJMWUrUCtmb1Y5?=
 =?utf-8?B?M0hUQXdzTVZ2RDYxanJmN1o5MkJRYzNnazhqMGNsbmN5U0xsbUMvMkVmT0Zv?=
 =?utf-8?B?bjZ5SnZLSXQ1Q0pZajBQVHc3a3M5c0o2bXRrcXRncUFKbTVxUnE3cy9waWlU?=
 =?utf-8?B?SHZMbDJQR2F2SUJGbWdtKzlzYkRsQkQ0RFJraHVkNkRHN1daTGsrSDlKWkJM?=
 =?utf-8?B?Y3FXZFFPYlR0dStKY3BBOFNKUUhCMHpReENXR0NOWkdvQm9NMHV4a0NFVk96?=
 =?utf-8?B?enl4OTJHeW1paEhhWncxY05hcVprcW5rN1dvT2pwaHYvRzhnMFBWTG10bFZC?=
 =?utf-8?B?MTgvM0wvanNxV0RqeExjYlI0eUZPUjRGSVhKWFhlazBNT25uOVhubGFGbDlO?=
 =?utf-8?B?bkI5NmdGV1phM0NqcFlxcEp1UjNuQlcxY2tFem5Fb1VwYi85M1czczNnSDJo?=
 =?utf-8?B?YzNtdW9STmI4QmkvSWI2dDA0eWtraUVTRDhUNnkwUU5BeTJNRVR4aWhxRWp0?=
 =?utf-8?B?a3dHYXZNZ1pxcko4aEo5SGFxNzRhTGdXeDhWY2QyMHArRU1CTlZnbndLM213?=
 =?utf-8?B?NzZZa0Jnd0RUN0VNRTBERGdxc0xJcW1lSXRubEMrSXptaFM5aStmSU1TWlBD?=
 =?utf-8?B?TE1YcTR3RFBpWFpTYXBFT3o3MHBRYTJZa1RjK1ZxV3djWERKa0ZNbnVqakpp?=
 =?utf-8?B?aUFOcURkVFUxd1FZajgrUTNaUElGZXVQU1RZMTNpWDZvN21rNFR1cEFCaEdN?=
 =?utf-8?B?cmFSMVRVT3NiZ1pQRXQ5dkFxaXdxQXRaUGkwaVdJdHFMSUpqS3pndWFLaTRC?=
 =?utf-8?B?ZTc3Vnh2WXp0cXpETWpGaUJGejA4OWRZdlJHQXljaTg1bnc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 20:06:50.8557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46c13f0-8b54-4d3f-e86d-08dcbc9ca2a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
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


On 8/14/24 11:49, Jeffrey Hugo wrote:
> On 8/12/2024 12:16 PM, Lizhi Hou wrote:
>>
>> On 8/9/24 08:21, Jeffrey Hugo wrote:
>>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>>> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD 
>>>> NPUs.
>>>> The driver is based on Linux accel subsystem.
>>>>
>>>> NPU (Neural Processing Unit) is an AI inference accelerator integrated
>>>> into AMD client CPUs. NPU enables efficient execution of Machine 
>>>> Learning
>>>> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
>>>> architecture [1].
>>>>
>>>> AMD NPU consists of the following components:
>>>>
>>>>    - Tiled array of AMD AI Engine processors.
>>>>    - Micro Controller which runs the NPU Firmware responsible for
>>>>      command processing, AIE array configuration, and execution 
>>>> management.
>>>>    - PCI EP for host control of the NPU device.
>>>>    - Interconnect for connecting the NPU components together.
>>>>    - SRAM for use by the NPU Firmware.
>>>>    - Address translation hardware for protected host memory access 
>>>> by the
>>>>      NPU.
>>>>
>>>> NPU supports multiple concurrent fully isolated contexts. Concurrent
>>>> contexts may be bound to AI Engine array spatially and or temporarily.
>>>>
>>>> The driver is licensed under GPL-2.0 except for UAPI header which is
>>>> licensed GPL-2.0 WITH Linux-syscall-note.
>>>>
>>>> User mode driver stack consists of XRT [2] and AMD AIE Plugin for 
>>>> IREE [3].
>>>
>>> Is there a special branch with the code?  I don't see any of the 
>>> uAPI in either project when searching for the ioctl codes or ioctl 
>>> structures.
>>
>> Please see git repo: https://github.com/amd/xdna-driver
>>
>> This contains the out tree driver and shim code which interact with 
>> driver. E.g.
>>
>> https://github.com/amd/xdna-driver/blob/main/src/shim/bo.cpp#L18
>
> Ok, I need to have a look at this.  Long term is the plan to move the 
> shim to the XRT repo once the driver is merged upstream?
Yes.
>
>>
>>>
>>>>
>>>> The firmware for the NPU is distributed as a closed source binary, 
>>>> and has
>>>> already been pushed to the DRM firmware repository [4].
>>>>
>>>> [1] https://www.amd.com/en/technologies/xdna.html
>>>> [2] https://github.com/Xilinx/XRT
>>>> [3] https://github.com/nod-ai/iree-amd-aie
>>>> [4] 
>>>> https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>>>
>>>>
>>>> Changes since v1:
>>>> - Remove some inline defines
>>>> - Minor changes based code review comments
>>>>
>>>> Lizhi Hou (10):
>>>>    accel/amdxdna: Add a new driver for AMD AI Engine
>>>>    accel/amdxdna: Support hardware mailbox
>>>>    accel/amdxdna: Add hardware resource solver
>>>>    accel/amdxdna: Add hardware context
>>>>    accel/amdxdna: Add GEM buffer object management
>>>>    accel/amdxdna: Add command execution
>>>>    accel/amdxdna: Add suspend and resume
>>>>    accel/amdxdna: Add error handling
>>>>    accel/amdxdna: Add query functions
>>>>    accel/amdxdna: Add firmware debug buffer support
>>>>
>>>>   MAINTAINERS                                   |   9 +
>>>>   drivers/accel/Kconfig                         |   1 +
>>>>   drivers/accel/Makefile                        |   1 +
>>>>   drivers/accel/amdxdna/Kconfig                 |  15 +
>>>>   drivers/accel/amdxdna/Makefile                |  22 +
>>>>   drivers/accel/amdxdna/TODO                    |   4 +
>>>>   drivers/accel/amdxdna/aie2_ctx.c              | 949 
>>>> ++++++++++++++++++
>>>>   drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
>>>>   drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
>>>>   drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
>>>>   drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
>>>>   drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
>>>>   drivers/accel/amdxdna/aie2_psp.c              | 137 +++
>>>>   drivers/accel/amdxdna/aie2_smu.c              | 112 +++
>>>>   drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
>>>>   drivers/accel/amdxdna/aie2_solver.h           | 156 +++
>>>>   drivers/accel/amdxdna/amdxdna_ctx.c           | 597 +++++++++++
>>>>   drivers/accel/amdxdna/amdxdna_ctx.h           | 165 +++
>>>>   drivers/accel/amdxdna/amdxdna_drm.c           | 172 ++++
>>>>   drivers/accel/amdxdna/amdxdna_drm.h           | 114 +++
>>>>   drivers/accel/amdxdna/amdxdna_gem.c           | 700 +++++++++++++
>>>>   drivers/accel/amdxdna/amdxdna_gem.h           |  73 ++
>>>>   drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 +++++++++++
>>>>   drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
>>>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 +
>>>>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 +
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       | 234 +++++
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h       |  31 +
>>>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |  58 ++
>>>>   drivers/accel/amdxdna/npu1_regs.c             |  94 ++
>>>>   drivers/accel/amdxdna/npu2_regs.c             | 111 ++
>>>>   drivers/accel/amdxdna/npu4_regs.c             | 111 ++
>>>>   drivers/accel/amdxdna/npu5_regs.c             | 111 ++
>>>>   include/trace/events/amdxdna.h                | 101 ++
>>>>   include/uapi/drm/amdxdna_accel.h              | 456 +++++++++
>>>>   35 files changed, 8178 insertions(+)
>>>>   create mode 100644 drivers/accel/amdxdna/Kconfig
>>>>   create mode 100644 drivers/accel/amdxdna/Makefile
>>>>   create mode 100644 drivers/accel/amdxdna/TODO
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_message.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.c
>>>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>>>>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>>>>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>>>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>>>>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>>>>   create mode 100644 include/trace/events/amdxdna.h
>>>>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>>>>
>>>
>>> No Documentation?
>>
>> Is it ok to add a work item to TODO and add documentation in later 
>> patches?
>
> I beleive best practice would be to add Documnetation in the same 
> patch/series that adds the functionality.  I'm not expecting 
> Documentation for items not implemented in this series, however I 
> think describing the product/architecture/other high level topics 
> would help put the code in context during review.
>
> It does seem like the AMD GPU driver had a lot of documentation, which 
> makes the lack of documentation for the AMD Accel driver particularly 
> odd.

Ok.  We will work on the document


Thanks,

Lizhi

