Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64E94F67D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 20:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C046010E26F;
	Mon, 12 Aug 2024 18:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O9eY7RYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6D810E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 18:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXfHWYGByZ8mjBG2ecMR7i+B+xS8U04Wh1chMB26SKxyE2g/MvKvZx1Ocb7ZLX0RM/AMhmptge9+XbSLLObP8v39S2qBnHsoqndoOKfwIjaT+qzcENuM7rRJI7Kv0iCjWYxCqNpit16T2yQxQUbITrigtx4LmoObSr6RIg5yXhuFZWd7hglslN8r3HnelVy+PVvI8MuFL/b2dTWOm+/UvenhUiYteh+S/QNRA/7YWbSxNZKbZn+AdzvVw93DkRH8HrMUWim2g0GLwfWyt2Pk88bfmctrZfA5MBs+stm8qO4UqcKqEt7zmkFXm3Wm7TUwisqDZ8wYj75Ke1YJQ57DXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI0kpLumx+Yf652RDfMSMXUz/HytFWUr301cQxU2aQg=;
 b=TFKoEQpnyHdHbYMsjhZX6/QWe/f2IATxhuDXgM/jJxtDYVyk2Gip34T+c1FJWZksDndtv0hsaVzi9+xxrra5Rp+eCEUIOHCNcQ7VXrnkS19C2XpSDuLVbLVYq/FRPN+tQJXx/FEQS/RvmjSwx9rpvKb/+RxetfyIAzB2T0OvWN7mGAZKHN3ZyjoCCrJxp6vrgpAjmxCd30I12UgSyTa8I8qL31l03w9Tgih5KfugsP93XLzDwm2VK1JcJyMr07SxHbi+D/V0J60O90WC+E71+b0RX0F26uYMup6azaBbinGkQQA9f8jK8gVAMZ0MHxEQjIvl62d0uQ10g+Jwnk9TcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI0kpLumx+Yf652RDfMSMXUz/HytFWUr301cQxU2aQg=;
 b=O9eY7RYJBpEMeYasxNa3UmmIxY6txbM0cQMFRKTbUFeWY7D1dFG/HdIggvCOYFaRYWZtRwWmENRpwI/N7ez3/BDodYk3lRtZf+VMzxMHnMvp6weGUfMuC6bitR1yzpQPc3tRTGqi/w1U9pwJ4niK6GVqCMaE75oBdjRkO7+FVzw=
Received: from BN9PR03CA0092.namprd03.prod.outlook.com (2603:10b6:408:fd::7)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 18:16:26 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::54) by BN9PR03CA0092.outlook.office365.com
 (2603:10b6:408:fd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 12 Aug 2024 18:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 18:16:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 13:16:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 13:16:21 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 13:16:20 -0500
Message-ID: <d7f757e9-ed6e-7be6-89db-3ec9ddbb8050@amd.com>
Date: Mon, 12 Aug 2024 11:16:20 -0700
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <292c06d0-b96a-b5b5-5d82-e74b82bbb6de@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: fffebeb0-e0a6-4612-808a-08dcbafae162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azkvbnZueDZxTlJjTnZWODdWUnhnUmNjUFhnN1ZwZm55d3ZvVGtQU2o4QW9a?=
 =?utf-8?B?SWdKZHZrdTVqaXhQV2RCOHJOM1RndEFLcU9UUTNOMERKYW5iSjcxUHZtZlVM?=
 =?utf-8?B?S25LeUpHTVowSGpVcVBqRVZ4eGVPMWlFS1B6MzlBSWswY1lsVERSSlJCNEFE?=
 =?utf-8?B?cHVtS0tSMGR2SHJveU9JY0FtbHVRbjlBZmk4eWFTSU5zTE5JeTJieCtVVU5B?=
 =?utf-8?B?ZEF5ZnJFT2RmZ3gzT3pveU5hN2lDWk1WWldiQ09rTkhLSW5ONmdLRExFL3g0?=
 =?utf-8?B?ZnloMUNoa0tqSVF4M1Nkcm8zSCs1OGU0aDJpWXRHakI4NDBLb2U2emR4R1pn?=
 =?utf-8?B?ZC9xcCtjdU42Q2c2bmtrRWpFcGJBaE5sR1pPY2tvSWV0aGlSYkIyNXVrOGZX?=
 =?utf-8?B?dGV5YmNMRE1XUmJJVXFhV2JYdlc2anZ2M3ZsVWM0OGZETlRGc1BBS215Rlp0?=
 =?utf-8?B?WTZQb0VWaTZwRm51M0RESjNhbWNLc0tIclJQNTJrTTVUQy83S3ltL1lsOGUy?=
 =?utf-8?B?Ull2UTFQNVpkaFY5RUI1TnoxREFyZGM2OXlTRGN3YzQzUjA5YVlEbDFHcHph?=
 =?utf-8?B?ZERsbWxxUDdvNHpOcHZIWkV4VWJ2RzNFSDZ6VWVvSXl1aWVrOXFlMVk3dnRL?=
 =?utf-8?B?QUV2NldISzVsZlowV2RkK3BvamNoMWxERmYzTk1DZW5PMTNnWDVjeEVpUGJ4?=
 =?utf-8?B?TUNHRzhqUUc4d2x2bEtyTmQ3M3luSmllaHJ5S3N1d054Q04za1hCQkdSWi9v?=
 =?utf-8?B?ZkRzVVgyaHdWeXpvOUE5QXJ1TVRseW1YbmxGZklvdEU5TU91N01TS244c2s1?=
 =?utf-8?B?aDdGMEJTTmhmN1FCNXNtcm16SnBEQm5DbEFVVGNjNHpZa004a3YrNi9NRlFT?=
 =?utf-8?B?SGNVU25CdnZTblBBdjZPZjAvaENsNkdhZkRVQ2pKYkhLZHdtSmxqL0NQbTFD?=
 =?utf-8?B?UFdXSDJBU3JBRXlzeWZabWM1TCtQYi9Wbm5ZSXJuTUI3T2N4NHpqcDlwUG9r?=
 =?utf-8?B?TFVKVklUKzh3ZHkzUmR6V29EQ3hXTFIxVUVzQ1dibUQreXk0SldWYjFPemZV?=
 =?utf-8?B?WmNiMnp0QzZyR3NJbG9hb2xsMThZYmtYTGlkZnMvU1JWVHIxeXhYQjJFM1RR?=
 =?utf-8?B?MzNWNGprS2QvT3NianVKR3hTVVA3L3o3OExpRTJETUhMemFpSGlHaG5CWHdw?=
 =?utf-8?B?VDFuQlVtdEIvbm9Da3lxVG5jWjk5ZXU5YklFUEtCeC9uR3RJRmJSVnM5RHN3?=
 =?utf-8?B?bUFDYUIvTG9EREhmeUNWeFd4bnFLSnEwOHFTVy9KR1luR3J5d0V1T1JnNnky?=
 =?utf-8?B?NFNHUnV5VUFhYnM0Y01lUjV4UEhYeFVhVjFsczlySUl4ZDV0WlJnNkRSNHpr?=
 =?utf-8?B?TkxOTWI0clYxMUJXbUxrbDdTelRwSUFZamxaaXJoa0hYOTJEd1VqLzdCY3E5?=
 =?utf-8?B?WVNUV2JuUjVMcnRMMVlWNVVTdjRMd2lNMXFHblRHM0tFSTBtUllHcFhGZVBK?=
 =?utf-8?B?QlBaalp6WHhid1hGdzNTMUNIRSs2KzBDTU1NQ29tdVI4QUlOUDAvNmRaOU1q?=
 =?utf-8?B?VTlrUi96aVFjeWV1eXpVRUoxM0VGeDhvbFl5eHkrSGtjQmJkdTZRVzY1M0dB?=
 =?utf-8?B?Yi9iNFpMcGN1aHNMalU4Y2YvRmpQZEpyOEZIZmNZbHZOS09hc08wNjJpT2lp?=
 =?utf-8?B?VGlzTkxtOEhtUnlhT3Bza2dDOGVzbndLUzk2ZGQ2ZVdHdmNQbHhibU94T1R5?=
 =?utf-8?B?aHhDUjNvNGZCcFRLUlJoM1ppd3BEQ1l4RDZwMVRqOWdhazRDNnV0NlRvQjBp?=
 =?utf-8?Q?CR3oOx/3yXQqb0bPQKaPCESyCrfwulCfr7J24=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 18:16:26.3968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffebeb0-e0a6-4612-808a-08dcbafae162
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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


On 8/9/24 08:21, Jeffrey Hugo wrote:
> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD 
>> NPUs.
>> The driver is based on Linux accel subsystem.
>>
>> NPU (Neural Processing Unit) is an AI inference accelerator integrated
>> into AMD client CPUs. NPU enables efficient execution of Machine 
>> Learning
>> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
>> architecture [1].
>>
>> AMD NPU consists of the following components:
>>
>>    - Tiled array of AMD AI Engine processors.
>>    - Micro Controller which runs the NPU Firmware responsible for
>>      command processing, AIE array configuration, and execution 
>> management.
>>    - PCI EP for host control of the NPU device.
>>    - Interconnect for connecting the NPU components together.
>>    - SRAM for use by the NPU Firmware.
>>    - Address translation hardware for protected host memory access by 
>> the
>>      NPU.
>>
>> NPU supports multiple concurrent fully isolated contexts. Concurrent
>> contexts may be bound to AI Engine array spatially and or temporarily.
>>
>> The driver is licensed under GPL-2.0 except for UAPI header which is
>> licensed GPL-2.0 WITH Linux-syscall-note.
>>
>> User mode driver stack consists of XRT [2] and AMD AIE Plugin for 
>> IREE [3].
>
> Is there a special branch with the code?  I don't see any of the uAPI 
> in either project when searching for the ioctl codes or ioctl structures.

Please see git repo: https://github.com/amd/xdna-driver

This contains the out tree driver and shim code which interact with 
driver. E.g.

https://github.com/amd/xdna-driver/blob/main/src/shim/bo.cpp#L18

>
>>
>> The firmware for the NPU is distributed as a closed source binary, 
>> and has
>> already been pushed to the DRM firmware repository [4].
>>
>> [1] https://www.amd.com/en/technologies/xdna.html
>> [2] https://github.com/Xilinx/XRT
>> [3] https://github.com/nod-ai/iree-amd-aie
>> [4] 
>> https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu
>>
>> Changes since v1:
>> - Remove some inline defines
>> - Minor changes based code review comments
>>
>> Lizhi Hou (10):
>>    accel/amdxdna: Add a new driver for AMD AI Engine
>>    accel/amdxdna: Support hardware mailbox
>>    accel/amdxdna: Add hardware resource solver
>>    accel/amdxdna: Add hardware context
>>    accel/amdxdna: Add GEM buffer object management
>>    accel/amdxdna: Add command execution
>>    accel/amdxdna: Add suspend and resume
>>    accel/amdxdna: Add error handling
>>    accel/amdxdna: Add query functions
>>    accel/amdxdna: Add firmware debug buffer support
>>
>>   MAINTAINERS                                   |   9 +
>>   drivers/accel/Kconfig                         |   1 +
>>   drivers/accel/Makefile                        |   1 +
>>   drivers/accel/amdxdna/Kconfig                 |  15 +
>>   drivers/accel/amdxdna/Makefile                |  22 +
>>   drivers/accel/amdxdna/TODO                    |   4 +
>>   drivers/accel/amdxdna/aie2_ctx.c              | 949 ++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
>>   drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
>>   drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
>>   drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
>>   drivers/accel/amdxdna/aie2_psp.c              | 137 +++
>>   drivers/accel/amdxdna/aie2_smu.c              | 112 +++
>>   drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
>>   drivers/accel/amdxdna/aie2_solver.h           | 156 +++
>>   drivers/accel/amdxdna/amdxdna_ctx.c           | 597 +++++++++++
>>   drivers/accel/amdxdna/amdxdna_ctx.h           | 165 +++
>>   drivers/accel/amdxdna/amdxdna_drm.c           | 172 ++++
>>   drivers/accel/amdxdna/amdxdna_drm.h           | 114 +++
>>   drivers/accel/amdxdna/amdxdna_gem.c           | 700 +++++++++++++
>>   drivers/accel/amdxdna/amdxdna_gem.h           |  73 ++
>>   drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 +++++++++++
>>   drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 +
>>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 +
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       | 234 +++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h       |  31 +
>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |  58 ++
>>   drivers/accel/amdxdna/npu1_regs.c             |  94 ++
>>   drivers/accel/amdxdna/npu2_regs.c             | 111 ++
>>   drivers/accel/amdxdna/npu4_regs.c             | 111 ++
>>   drivers/accel/amdxdna/npu5_regs.c             | 111 ++
>>   include/trace/events/amdxdna.h                | 101 ++
>>   include/uapi/drm/amdxdna_accel.h              | 456 +++++++++
>>   35 files changed, 8178 insertions(+)
>>   create mode 100644 drivers/accel/amdxdna/Kconfig
>>   create mode 100644 drivers/accel/amdxdna/Makefile
>>   create mode 100644 drivers/accel/amdxdna/TODO
>>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_message.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_solver.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>>   create mode 100644 include/trace/events/amdxdna.h
>>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>>
>
> No Documentation?

Is it ok to add a work item to TODO and add documentation in later patches?


Thanks,

Lizhi

