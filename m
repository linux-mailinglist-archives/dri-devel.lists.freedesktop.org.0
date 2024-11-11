Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F89C44BA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F55710E2F7;
	Mon, 11 Nov 2024 18:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hk2o/rXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293810E2F7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 18:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0YhieuVt02p2Kk2UPVn0awXaHW8AUONT4qOLnohtO6wAmxUJtQcZLGxR6cbOk9i7A6i8Gn+Z42Z3C/AaVL0MI52SooWb5G4wdcdJqSdLQP8aSdakXSMoj/ovSjJN8gcY/mnAFxvVpxzTbaz7REdSMFJYGBNRtweQMppomTAMwr7F5sONd7G+EwE15Q6MRyU6WOXjDufVFA8XQdkP9k6T5OccAWKviyst7T+bCq+Q54KTwlMHzJ/Xl7cIVFVBnO+M+i3TXxx7wCR5JEpVoqdBrqb9GsTqYFM0D94K79/PoK2waEJvVd+hzLuWxXNouEV7ja1rlOdQNKyvPwaWZSzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eerAP/564TI/9CUxUE8luy22uO0XW7XfEAx457C+Pxg=;
 b=Hi+VNQ0x3KxvtANSrokEX40yJ6TOfk2xN2PceaBJXKL+RsSZF/VRUGiPnoggBmcA2fCcQHLDHOc+xBffZtcoaYALy/0tGMl9GMGEeQ3L5z9p5EaHBQG89B0c+lfj+naEPT1/GHTY7rUgFcOuIuQfjgrR6knS/F1YaDqUeYzlI0UTkv4mztaeMoAfe8niFWwpLwUGhxu5/QvDMZKfVtSJEK3LDFSZesiDLcRnqLj80TEbLRRH94clNt9elO4KAcHWvbN/fzl7MhYcnr3kZNpN+ScVIw0Rww59S8BSUf5/imBMbZ2QdvqOYEGzZjc7dxDzabIBaIJP0B5zzoxe2769Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eerAP/564TI/9CUxUE8luy22uO0XW7XfEAx457C+Pxg=;
 b=Hk2o/rXDQ6zYTgO4Buzo2Kd84WoAd4iVb1rW+GtDWdAHASkFRLpC1sWuacS6MrvvKSBRUUDZUa/25f8piElBhtirulkJzdEGYJff9BtcmgggIK15FRlHa7fdFmtf3BiMHn8MwZ7PB9vA98EOp/TAtfY3UA86n0uFZlHg7gsYfBE=
Received: from BYAPR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:40::29)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:15:26 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::b4) by BYAPR04CA0016.outlook.office365.com
 (2603:10b6:a03:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 18:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 18:15:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:15:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:15:24 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 12:15:23 -0600
Message-ID: <82a0ed11-df10-3525-85c4-dd5a85d17a57@amd.com>
Date: Mon, 11 Nov 2024 10:15:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 00/10] AMD XDNA driver
Content-Language: en-US
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241111173230.655325-1-lizhi.hou@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241111173230.655325-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: afa45531-338e-4a43-9987-08dd027cd0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTFYSzM3M0QzbnVuUWdveFNmbDZkdUFGMzRDTDYwV1paUmdQNGxocmhKQlRR?=
 =?utf-8?B?WHVQbGhvdzVhUFlFbnJtOGhtblg3S1d3ZXRkK0xhZ213dEtrQXhkTzM4cFVw?=
 =?utf-8?B?VmF4cUtNYVoxdlBHNUlEZW5aeHNobjFIMzJsMHVXN3Y3Uk56OTVHUUF5dWR4?=
 =?utf-8?B?RjJXM0xweXFpTWxCQmtueDdKR2RYcGFpUWprM1poOEpuTzFiVGw0MGZ0ZnZC?=
 =?utf-8?B?Y2NRT2lXVWlYaHpYMUF3UFpZTzNqVktRWnRIUkpJd0Nmcnh4VmtvMGxLQmth?=
 =?utf-8?B?Q0t6VU5EY3pkYnBDSlNod2JxNmRCNTkwK0tGQWNHb3FPaVNFSE9LcEdjY2hQ?=
 =?utf-8?B?MnRIb3I1ZmdldkE3R3hsK3ZjVDZsZzJnWVM3OEt4UzdNeDBodEZwK0tldTBv?=
 =?utf-8?B?WVFCZExJRW8rQU56R2tnbm1Ya21vWXBCT2hpaFF1WTZiUThpTEc5bXBPeFRz?=
 =?utf-8?B?V0hLMjJxVGkwYmFiM2ZNbzgxQmJOblBLYkdubjdFaHltYWVVQ1o5Z1hxSDQ0?=
 =?utf-8?B?VXh5SEdRV01mc1JhSzUzN2R5U2h2bkppSTF5SWZ4T01LcUI3SXhmN2QwR3p2?=
 =?utf-8?B?TkM3SkNacVJMMTNBRmdyNjVUYXRWSEpWcGE5M1NJc3Q5dUlSem5lKzQvOTRG?=
 =?utf-8?B?NUNXR0xRMFZHRzYveE5nTFhsdUtWdFJvYTZXcGlCRUhRaDlwUm9ISHEwZlo5?=
 =?utf-8?B?aGVjV05yZjJITVRKd0pKRWxOTzJWQ3RKMXkzRWRRUDNPWHNLUWtxOEREQ1Ni?=
 =?utf-8?B?Sm8wWWxhSVNYa0MzemloN3h5cnJ3NzVPa2FtU0lSQk5NYzk1TGl6TzYyQWR6?=
 =?utf-8?B?ZXl2eG9CaGhUdWdiWFA4OUdCaFdtZGJKL0cwK2UxU0M1eWY3cjZRd0RhRGlM?=
 =?utf-8?B?VEhhZDFrVGM2VVp5cmtkMkdGOHZXR0o5WWJYZ1lMS0o0cEk5QTZqUWxsUlpp?=
 =?utf-8?B?VjYyekR3L1JaNlh6cGxRaktvZ3JKalVWaU9QUE5IZ05uNWEzbEtWaE1VdzVm?=
 =?utf-8?B?cE55VlpJUXRCUlVqWnBSSjIvWkY1cDZWcjc2bFo4SGx3U1I4dlYzbzBPSGpH?=
 =?utf-8?B?NjFUSmFkTnFXRjI0V0ZUMnUzdUlzcnlVd0RGRENKWlpVRkE1NHRWSi9BZzVG?=
 =?utf-8?B?bVZ4UUR5aVp0ODBOdGhMWmkwclRwbzRIbGNUV2tBK3NXejdHejhHdXJabzYy?=
 =?utf-8?B?Q2NNUnM0OE5aN2YrR05XSEF1a29kTXBBWUVxNTRFMFJRUFhQbWVHeTg3Q3BN?=
 =?utf-8?B?ZHFnNXdvU29UQXpNTHdSci9lb0M2TC9MK1RzUElydXNvb3JjYnk2dVJlZnZ5?=
 =?utf-8?B?RGJsQWFGdW5xbUc3Tnp0R2dwM2IvMkdsNUh3NnJvWVFVRnFlUkVzbndvd0hL?=
 =?utf-8?B?R2ZxMmxoVDVSS0ROcWt2aFZmMG90YzRxUXRtMlNvS3RXRmZhZ2E0WG43Tmpz?=
 =?utf-8?B?NDZuanFJR0N5VHJaWG4rQi9udC9VYVVMR0JiczlJR2FnRmo0bWx6WDNHc3BK?=
 =?utf-8?B?NGVmUm1pT0lieGJKejBYc1FORFI0Q0R1ZnV6azBlTUpEMjkva2JSQlJYbzhq?=
 =?utf-8?B?azZJc1RBNWNoeGRKZkpFNGJkbnpnVlVPRHk4WmtCakczb3UwOE4zMWlMdWIy?=
 =?utf-8?B?dlNTYnVRUzY1UkN2NGhEc0NBQnRXZDU5d2dYMDFOaFNqT0xVelpaZEtZekNa?=
 =?utf-8?B?VU5ZRXFpKzI5VjFRQmxuM0N2YStnaG5EZGo3RWRhZUVMei9CTldCV0VTRnBt?=
 =?utf-8?B?cldPcjhWdnU3MlFLeFRvdmZqdEpVYlNFZ2t1NUdlUGJYa1lXQ3l2UkM4U2F0?=
 =?utf-8?Q?Xc4Uutdi9EMKKtnhU8aZna59OmHrJZ66lT+nc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:15:25.8602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa45531-338e-4a43-9987-08dd027cd0e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032
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

Sorry, just noticed that I miss merged one line. Please ignore this V8 
set. I will send out V9 instead.


Lizhi

On 11/11/24 09:32, Lizhi Hou wrote:
> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD NPUs.
> The driver is based on Linux accel subsystem.
>
> NPU (Neural Processing Unit) is an AI inference accelerator integrated
> into AMD client CPUs. NPU enables efficient execution of Machine Learning
> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
> architecture [1].
>
> AMD NPU consists of the following components:
>
>    - Tiled array of AMD AI Engine processors.
>    - Micro Controller which runs the NPU Firmware responsible for
>      command processing, AIE array configuration, and execution management.
>    - PCI EP for host control of the NPU device.
>    - Interconnect for connecting the NPU components together.
>    - SRAM for use by the NPU Firmware.
>    - Address translation hardware for protected host memory access by the
>      NPU.
>
> NPU supports multiple concurrent fully isolated contexts. Concurrent
> contexts may be bound to AI Engine array spatially and or temporarily.
>
> The driver is licensed under GPL-2.0 except for UAPI header which is
> licensed GPL-2.0 WITH Linux-syscall-note.
>
> User mode driver stack consists of XRT [2] and AMD AIE Plugin for IREE [3].
>
> The firmware for the NPU is distributed as a closed source binary, and has
> already been pushed to the DRM firmware repository [4].
>
> [1] https://www.amd.com/en/technologies/xdna.html
> [2] https://github.com/Xilinx/XRT
> [3] https://github.com/nod-ai/iree-amd-aie
> [4] https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu
>
> Changes since v7:
> - Prealloc dma fence chain before publishing dma-fence
> - Install the job's finished fence in dma-resv rather than driver fence
>
> Changes since v6:
> - Revise command submission flow
>
> Changes since v5:
> - Remove wait_cmd ioctl and use syncobj instead
> - Cleanup spelling errors
> - Add dependencies in Kconfig
>
> Changes since v4:
> - Fix lockdep errors
> - Use __u* structure for struct aie_error
>
> Changes since v3:
> - Remove debug BO patch
> - Changes based on code review comments
>
> Changes since v2:
> - Add document amdnpu.rst
> - Change AIE2_DEVM_SIZE to 64M due to firmware change
> - Changes based on code review comments
>
> Changes since v1:
> - Remove some inline defines
> - Minor changes based on code review comments
>
> Lizhi Hou (10):
>    accel/amdxdna: Add documentation for AMD NPU accelerator driver
>    accel/amdxdna: Add a new driver for AMD AI Engine
>    accel/amdxdna: Support hardware mailbox
>    accel/amdxdna: Add hardware resource solver
>    accel/amdxdna: Add hardware context
>    accel/amdxdna: Add GEM buffer object management
>    accel/amdxdna: Add command execution
>    accel/amdxdna: Add suspend and resume
>    accel/amdxdna: Add error handling
>    accel/amdxdna: Add query functions
>
>   Documentation/accel/amdxdna/amdnpu.rst        | 281 ++++++
>   Documentation/accel/amdxdna/index.rst         |  11 +
>   Documentation/accel/index.rst                 |   1 +
>   MAINTAINERS                                   |  11 +
>   drivers/accel/Kconfig                         |   1 +
>   drivers/accel/Makefile                        |   1 +
>   drivers/accel/amdxdna/Kconfig                 |  18 +
>   drivers/accel/amdxdna/Makefile                |  21 +
>   drivers/accel/amdxdna/TODO                    |   5 +
>   drivers/accel/amdxdna/aie2_ctx.c              | 900 ++++++++++++++++++
>   drivers/accel/amdxdna/aie2_error.c            | 360 +++++++
>   drivers/accel/amdxdna/aie2_message.c          | 791 +++++++++++++++
>   drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++
>   drivers/accel/amdxdna/aie2_pci.c              | 762 +++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h              | 259 +++++
>   drivers/accel/amdxdna/aie2_psp.c              | 146 +++
>   drivers/accel/amdxdna/aie2_smu.c              | 119 +++
>   drivers/accel/amdxdna/aie2_solver.c           | 330 +++++++
>   drivers/accel/amdxdna/aie2_solver.h           | 154 +++
>   drivers/accel/amdxdna/amdxdna_ctx.c           | 553 +++++++++++
>   drivers/accel/amdxdna/amdxdna_ctx.h           | 162 ++++
>   drivers/accel/amdxdna/amdxdna_gem.c           | 622 ++++++++++++
>   drivers/accel/amdxdna/amdxdna_gem.h           |  65 ++
>   drivers/accel/amdxdna/amdxdna_mailbox.c       | 576 +++++++++++
>   drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  61 ++
>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 +
>   drivers/accel/amdxdna/amdxdna_pci_drv.c       | 409 ++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h       | 123 +++
>   drivers/accel/amdxdna/amdxdna_sysfs.c         |  67 ++
>   drivers/accel/amdxdna/npu1_regs.c             | 101 ++
>   drivers/accel/amdxdna/npu2_regs.c             | 118 +++
>   drivers/accel/amdxdna/npu4_regs.c             | 118 +++
>   drivers/accel/amdxdna/npu5_regs.c             | 118 +++
>   include/trace/events/amdxdna.h                | 101 ++
>   include/uapi/drm/amdxdna_accel.h              | 436 +++++++++
>   36 files changed, 8337 insertions(+)
>   create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
>   create mode 100644 Documentation/accel/amdxdna/index.rst
>   create mode 100644 drivers/accel/amdxdna/Kconfig
>   create mode 100644 drivers/accel/amdxdna/Makefile
>   create mode 100644 drivers/accel/amdxdna/TODO
>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>   create mode 100644 drivers/accel/amdxdna/aie2_message.c
>   create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>   create mode 100644 drivers/accel/amdxdna/aie2_solver.c
>   create mode 100644 drivers/accel/amdxdna/aie2_solver.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>   create mode 100644 include/trace/events/amdxdna.h
>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>
