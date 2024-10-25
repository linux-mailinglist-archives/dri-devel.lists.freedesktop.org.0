Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4E9B1198
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627AA10E102;
	Fri, 25 Oct 2024 21:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4jdz+sfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7894E10E102
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 21:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl1x1Ka1JbAN/nARhUG4v+tSUn57EWOanHejCwbtwnw5/Y6nDQpDdaEjb1PCY2WrxL7oji6oORZixPqJQxq3IwOPAN0dnXg7boNv/PCXbfhQXcipfuHAKsnyuaWAPRUPWa0jgkHejfbzwjygHR4iSvgyhj7fj/izaY6fhdiSg6paeoRnB+FuJ9A1KGKtTSt26EZgyOKKAqIL1klWvXFVnaByJOmJSZavWnnYCY0mLSicR0DkLx71EbT68METubHdazq27G6Gi2OCCGNCZaJVWai1or+xOY6LlQbZADHY5n/pGo5R5hf1iFyo2hFolh34lUC1v6eo474INZNCY+Uuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+jZdF1fNH+uVcYEXEAz7tqclsWY/Rc+NlOwEyUBK4w=;
 b=OqoP7LEVg//PspAZlEE2VzHEzatpqm9vbyjaZYEuCe7d+TENg2WcIy+cIBWdrq4rFNz3RJFy8cBq9yyP9FDQCgMQizexhSnGUBKi42bC9T5ZRIb0j85f1T4XKelzzHQHJPZ1ecZHZcfKdT8NjXJhEU4745BRcnmkl6HGSkeRF07/stypsjV1uH9DU9gnUbiIoWIXlL0HnYanKNK5gW38SC0/HKrhNfKSNmKJuc4AWK2EiXzpM8a/4fy4kMZek+RhIUC5SzHmRItKZ1iLmjV4Q1CYGEUBZoSCayLoQ5rFj6y2EiL5uf64I/weA/KrcWxf212BPT9Tm6Ik4TsbKKVYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+jZdF1fNH+uVcYEXEAz7tqclsWY/Rc+NlOwEyUBK4w=;
 b=4jdz+sflEPj9G9yJWJhpay7WXrOZ5RVX0WCwBQ/rvKwYT5DdFlaavYHk3afvL9MVzwMvTURmEL3V/D9qQzRvilEoMU8JNuaSimgW/ztGpWZqbrhmnsbCHXYWa87qav/02Zmg1mtkYmrM3ssslmQqA4j8WcdxRIU5HwAOdMgyM+E=
Received: from BN9PR03CA0408.namprd03.prod.outlook.com (2603:10b6:408:111::23)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 21:28:05 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::76) by BN9PR03CA0408.outlook.office365.com
 (2603:10b6:408:111::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 21:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 21:28:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 16:28:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 16:28:04 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 16:28:03 -0500
Message-ID: <28047f7a-ee20-0b5b-5bdc-5dea8e0bd412@amd.com>
Date: Fri, 25 Oct 2024 14:28:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V5 00/10] AMD XDNA driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
 <de895a18-e40f-4996-b799-0a957bd3ca48@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <de895a18-e40f-4996-b799-0a957bd3ca48@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e3116b-92f4-4a8f-8fb4-08dcf53be99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0czL25NcktKQ2h4aWhKZExSekhSRExISXpKelZmR3ErdjFqU3BETnFPQlAz?=
 =?utf-8?B?cDZNQkxCZjMyZlVyenNsTzFyMDBXWEkvYjJhRThnRnFhMUFVV003SG1tMTh1?=
 =?utf-8?B?M0tzaEpKMmNRKzhCcEZwUjNDc0Q3dDMrM2FXTnBvY0RRTXFMS053N1g1RU10?=
 =?utf-8?B?TnltL3J3WTJnUzFDelViY3c1azJOVUNjeUY4OWtHWlJONy9HTDVtTVJVdzNq?=
 =?utf-8?B?bytpRkhCak5DNTI3ZmMwQTdqejJnWDV1ZFJPWCs4VVRrZ1RVV21mZ0o4NklF?=
 =?utf-8?B?OFZZL01yV3duOVo0b2tpV1NYODVWeHN5eVo2Unh4TnIzaXZoZ1lGdXZyV1Ri?=
 =?utf-8?B?ZW8xODVkU0JPby9QVXh4bVBpTE5CN0xUNEVMbzRPcnl6SzlhSFNURzFWaysz?=
 =?utf-8?B?cmRRbXdRbGNmbGljQlNxY3hWMmZrTlZpempvNDZZL3JEUDdCSlA4UHFXVHVi?=
 =?utf-8?B?WU01SjNtdktHQjlKdlR4RU52WER4L09uZG55MkZ0WG9BUmE2eXFHWlNYNEtu?=
 =?utf-8?B?eGc5Vm8vUkdNUE9UQ2RyUlk4S1NTWmtuYS8vMWlHTTczT0JNN3BtUDVHYm4w?=
 =?utf-8?B?UlVrNDZSalNndG5XMktEMFZRRjRmcEJoRmxlVE9yZE9HRjVTMFdEcm8wNkpG?=
 =?utf-8?B?YVpseWdKUHVhSks1aE5HSUZRSjlWekZaTHByM2xHYnBWemRDcENBYW5WS2Uz?=
 =?utf-8?B?RTI2Ty9hbFU3TDlOMFlQOWcrUkZqWUZRWEZBVS9ZdUVubmZCRHg5cE5tS0Jn?=
 =?utf-8?B?UVd4SG1OY0lEakNRUWV6UXNvUlNlbWYyMkR5R0UrRERwM0FkRmdDdHo5ZjdK?=
 =?utf-8?B?L2JWaGdVWGltZ0V6bVlFU3pBVmtFT01rTzQ4aHdWNjIwTTVUamdpL0k5R1ZJ?=
 =?utf-8?B?WDFsd1pRdEowMlp2WS9EZWR1eVV4akFIOHBFWDVFbncvOFc2Z0d3MzI0bkhH?=
 =?utf-8?B?U3NjZFNXS0xSd29DbEwxZGV3SHB5RW9kaWxTVXJQdkNGaEdYQlFUWEpWWTVw?=
 =?utf-8?B?VzUrTTR0MDVrT1ozTE5ROFJKQysweFRsaDZFQXdhaFhhc3V0K3dTWmJUWkZE?=
 =?utf-8?B?M3NmTlZnd0U5R2RBN3ZSWWc5Y3ozNjNHclRBdlcybzFqWElZbml2TGRvYmp2?=
 =?utf-8?B?TW1UVURqbmZKMnhlVFpQdDcxZFBhWDdyU3pFakJnblkzWGtHNGdFR3hMTVVp?=
 =?utf-8?B?L3FzQ0h6TDNDN3pFSVYwaldPZXJQekRDb2hnNzM5cDJhQW5jeEdvYmd1dFIz?=
 =?utf-8?B?a01uTzFrd2FCOFYxQ1JmQnZ3dXhjQTlwd3ErOEpVMWtXWnZKQTJzVE1IbHR5?=
 =?utf-8?B?ZmFkVzdoTDQxdGt4TjJ2L2g2bWdTSFc4WlFOVmxpZzMzOTNYU0d0M0R1bFRL?=
 =?utf-8?B?SXpYd0I0T3NSWGxQbGRDVFk5eEdTdW5QV2ZMWllXc2ZqSnJqSWRONHRZczlk?=
 =?utf-8?B?K0Q5NVZNUlM0RWEvUmJ6WjA3bGVhSStiWEFZNW00TXp6WHIyNTdNcG0ycEdR?=
 =?utf-8?B?VHltSjhzMUN4MEplQmR1R3AyTlhVUUtUeCsvOTBoZ0xwMmdZQ0Z6eU95OW05?=
 =?utf-8?B?U21FS0l0WlYwWHRwY2Y5MVN3RWlDUlpiMmZKU0UxcVpGanNXd3BodnJRaElX?=
 =?utf-8?B?cVBORENBRnkzalh5NVlRdHF4aDBsaEtoYXIrcEYyOU13NkpuRmh4NFFVbUpr?=
 =?utf-8?B?SUxHc2didEdiT3k1YmxwcjlrMzRNZDc5dCtxMHgwRkpOMHJ6QXhMck1RMlZa?=
 =?utf-8?B?UFNzMFFYRzV4aEl4ZGordHcxeGcrZW9BdEoyY016dGc5dUU0SDU1TldselZs?=
 =?utf-8?Q?Nb7pdQ353EnFfi5mfsfPlmptrXks66OXcAFqU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:28:05.0148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e3116b-92f4-4a8f-8fb4-08dcf53be99b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424
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


On 10/25/24 10:55, Jeffrey Hugo wrote:
> On 10/21/2024 10:19 AM, Lizhi Hou wrote:
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
>>
>> The firmware for the NPU is distributed as a closed source binary, 
>> and has
>> already been pushed to the DRM firmware repository [4].
>>
>> [1]https://www.amd.com/en/technologies/xdna.html
>> [2]https://github.com/Xilinx/XRT
>> [3]https://github.com/nod-ai/iree-amd-aie
>> [4]https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>
>>
>> Changes since v4:
>> - Fix lockdep errors
>> - Use __u* structure for struct aie_error
>
> One nit, when you send the next version would you please either To: or 
> Cc: me on the entire series?  I only get pieces in my inbox which is 
> mildly annoying on my end.
Sure.
>
> Looks like we are getting close here.  One procedural question I have, 
> do you have commit permissions to drm-misc?
No, I do not have commit permissions yet.
>
> I applied the series to drm-misc-next and tried to build.  Got the 
> following errors -

Could you share the build command line? So I can reproduce and verify my 
fix.

I used "make M=drivers/accel/amdxdna" and did not reproduce the error 
with drm-misc-next. It looks build robot did not complain with the patch 
neither.

$ git branch
* drm-misc-next
$ make M=drivers/accel/amdxdna
   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
   CC [M]  drivers/accel/amdxdna/aie2_error.o
   CC [M]  drivers/accel/amdxdna/aie2_message.o
   CC [M]  drivers/accel/amdxdna/aie2_pci.o
   CC [M]  drivers/accel/amdxdna/aie2_psp.o
   CC [M]  drivers/accel/amdxdna/aie2_smu.o
   CC [M]  drivers/accel/amdxdna/aie2_solver.o
   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
   CC [M]  drivers/accel/amdxdna/npu1_regs.o
   CC [M]  drivers/accel/amdxdna/npu2_regs.o
   CC [M]  drivers/accel/amdxdna/npu4_regs.o
   CC [M]  drivers/accel/amdxdna/npu5_regs.o
   LD [M]  drivers/accel/amdxdna/amdxdna.o
   MODPOST drivers/accel/amdxdna/Module.symvers
   CC [M]  drivers/accel/amdxdna/amdxdna.mod.o
   CC [M]  drivers/accel/amdxdna/.module-common.o
   LD [M]  drivers/accel/amdxdna/amdxdna.ko
$

>
>   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>   CC [M]  drivers/accel/amdxdna/aie2_error.o
>   CC [M]  drivers/accel/amdxdna/aie2_message.o
>   CC [M]  drivers/accel/amdxdna/aie2_pci.o
>   CC [M]  drivers/accel/amdxdna/aie2_psp.o
>   CC [M]  drivers/accel/amdxdna/aie2_smu.o
>   CC [M]  drivers/accel/amdxdna/aie2_solver.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>   CC [M]  drivers/accel/amdxdna/npu1_regs.o
>   CC [M]  drivers/accel/amdxdna/npu2_regs.o
>   CC [M]  drivers/accel/amdxdna/npu4_regs.o
>   CC [M]  drivers/accel/amdxdna/npu5_regs.o
>   AR      drivers/base/firmware_loader/built-in.a
>   AR      drivers/base/built-in.a
> In file included from drivers/accel/amdxdna/aie2_message.c:19:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> In file included from drivers/accel/amdxdna/amdxdna_gem.c:15:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> In file included from drivers/accel/amdxdna/aie2_psp.c:11:
> drivers/accel/amdxdna/aie2_psp.c: In function ‘psp_exec’:
> drivers/accel/amdxdna/aie2_psp.c:62:34: error: implicit declaration of 
> function ‘FIELD_GET’ [-Werror=implicit-function-declaration]
>    62 | FIELD_GET(PSP_STATUS_READY, ready),
>       |                                  ^~~~~~~~~
> ./include/linux/iopoll.h:47:21: note: in definition of macro 
> ‘read_poll_timeout’
>    47 |                 if (cond) \
>       |                     ^~~~
> drivers/accel/amdxdna/aie2_psp.c:61:15: note: in expansion of macro 
> ‘readx_poll_timeout’
>    61 |         ret = readx_poll_timeout(readl, PSP_REG(psp, 
> PSP_STATUS_REG), ready,
>       |               ^~~~~~~~~~~~~~~~~~
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> In file included from drivers/accel/amdxdna/aie2_pci.c:22:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> In file included from drivers/accel/amdxdna/aie2_ctx.c:18:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> In file included from drivers/accel/amdxdna/amdxdna_ctx.c:16:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> cc1: all warnings being treated as errors
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
> drivers/accel/amdxdna/aie2_ctx.c:114:9: error: too few arguments to 
> function ‘drm_sched_start’
>   114 |         drm_sched_start(&hwctx->priv->sched);
>       |         ^~~~~~~~~~~~~~~
> In file included from ./include/trace/events/amdxdna.h:12,
>                  from drivers/accel/amdxdna/aie2_ctx.c:13:
> ./include/drm/gpu_scheduler.h:593:6: note: declared here
>   593 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>       |      ^~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:229: 
> drivers/accel/amdxdna/aie2_psp.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> In file included from drivers/accel/amdxdna/amdxdna_pci_drv.c:18:
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
> declaration of function ‘FIELD_GET’ 
> [-Werror=implicit-function-declaration]
>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>       |                ^~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:229: 
> drivers/accel/amdxdna/aie2_ctx.o] Error 1
> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_set_state’:
> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>       |                        ^~~~~~~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function 
> ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:444:26: error: implicit 
> declaration of function ‘FIELD_PREP’ 
> [-Werror=implicit-function-declaration]
>   444 |         header->sz_ver = FIELD_PREP(MSG_BODY_SZ, 
> msg->send_size) |
>       |                          ^~~~~~~~~~
>
>
> You also have the following checkpatch issues -

Could you share the command you used?  I tried to use 'dim checkpatch' 
and it did not find out the misspelling issue.


Thanks,

Lizhi

>
>
> WARNING: 'Disalbe' may be misspelled - perhaps 'Disable'?
> #1646: FILE: drivers/accel/amdxdna/amdxdna_mailbox.c:553:
> +       /* Disalbe an irq and wait. This might sleep. */
>            ^^^^^^^
>
> WARNING: 'splite' may be misspelled - perhaps 'split'?
> #1695: FILE: drivers/accel/amdxdna/amdxdna_mailbox.h:21:
> + * The mailbox will splite the sending data in to multiple firmware 
> message if
>                      ^^^^^^
>
> WARNING: 'miliseconds' may be misspelled - perhaps 'milliseconds'?
> #1875: FILE: drivers/accel/amdxdna/amdxdna_mailbox_helper.h:9:
> +#define TX_TIMEOUT 2000 /* miliseconds */
>                             ^^^^^^^^^^^
>
> WARNING: 'miliseconds' may be misspelled - perhaps 'milliseconds'?
> #1876: FILE: drivers/accel/amdxdna/amdxdna_mailbox_helper.h:10:
> +#define RX_TIMEOUT 5000 /* miliseconds */
>                             ^^^^^^^^^^^
>
> total: 0 errors, 4 warnings, 0 checks, 1916 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or 
> --fix-inplace.
>
> 0003-accel-amdxdna-Support-hardware-mailbox.patch has style problems, 
> please review.
>
>
>
> 0007-accel-amdxdna-Add-command-execution.patch
> ----------------------------------------------
> WARNING: 'miliseconds' may be misspelled - perhaps 'milliseconds'?
> #59: FILE: drivers/accel/amdxdna/aie2_ctx.c:27:
> +#define HWCTX_MAX_TIMEOUT      60000 /* miliseconds */
>                                          ^^^^^^^^^^^
>
> WARNING: 'reverve' may be misspelled - perhaps 'reserve'?
> #612: FILE: drivers/accel/amdxdna/aie2_ctx.c:779:
> +               XDNA_WARN(xdna, "Failed to reverve fence, ret %d", ret);
>                                            ^^^^^^^
>
> WARNING: 'Exectuion' may be misspelled - perhaps 'Execution'?
> #1899: FILE: drivers/accel/amdxdna/amdxdna_pci_drv.c:139:
> +       /* Exectuion */
>            ^^^^^^^^^
>
> WARNING: 'exectuion' may be misspelled - perhaps 'execution'?
> #2113: FILE: include/uapi/drm/amdxdna_accel.h:239:
> + * struct amdxdna_drm_wait_cmd - Wait exectuion command.
>                                        ^^^^^^^^^
>
> total: 0 errors, 10 warnings, 0 checks, 1983 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or 
> --fix-inplace.
>
> 0007-accel-amdxdna-Add-command-execution.patch has style problems, 
> please review.
>
>
> 0008-accel-amdxdna-Add-suspend-and-resume.patch
> -----------------------------------------------
> WARNING: 'miliseconds' may be misspelled - perhaps 'milliseconds'?
> #163: FILE: drivers/accel/amdxdna/amdxdna_pci_drv.c:22:
> +#define AMDXDNA_AUTOSUSPEND_DELAY      5000 /* miliseconds */
>                                                 ^^^^^^^^^^^
>
> total: 0 errors, 1 warnings, 0 checks, 302 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or 
> --fix-inplace.
>
> 0008-accel-amdxdna-Add-suspend-and-resume.patch has style problems, 
> please review.
>
>
> -Jeff
