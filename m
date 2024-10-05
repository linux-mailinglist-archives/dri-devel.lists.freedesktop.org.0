Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D201599137E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 02:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845CF10E24D;
	Sat,  5 Oct 2024 00:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mKIy6jCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98A810E24D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 00:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgpXXsGMZ1A2nbG0go/7SHr7dOG6L/FU6OZN6PwlY/MyIaqToV6W3EXLTnv6Km6U2YdCMEKuAjIKyzcrJsxT5LHugZV/QwJW1a0k1aSDxd1RTKq03t99R9XD+KRsZo8E3YGTsSDqJQQDi7z6xBoEuXgfGThZTv6c2SLPrg9K+12pRQ28Iyl7Iten7pe5GC0TkPY/GiJo8HJsivHNJ3y2i/y2NcngWJzgX6TkYSOrqaTU8+2U1Ik750wIrWjmZNPG2PUXKesYWfSH3Kl0C4nsocvgcP3Z7xkEICj21K+39VCGRcAxkXnvrNG4TNd1CeSMLeezkxFA1L31Uzf+xkleHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n69YFxVLhS4sd7kGq6Z5bOGmR/ija8mAe2OdNBTqnA0=;
 b=BxHkWUDnhuOs+OCiXMaRIK/Uk1oV4RRU32XwyVusAld8JozTCgnFEujSs3z0rKIuwNQ7iec6V1XtXyS19jW57veR5o1SUEiOrLw/pYy6r4zURc/1aF4cT96W5zdqLFVH2DGjEW+tqoQNmvB5WVH3W50OdsWWHjKuf99/L+AAMunUbemfCMdEVus7ELCytLfvvUv/G8rjxz2xhXcP+0elyyOHK/HpYsjKLIjkrJeDNlcjBdT7aOTlzpMFgwbIl2TjO9bQnSK/aja+0ugneu8u5UFIe4ypLQ5299CETGNQnuxrAPp8RdnUzelsDd/UqSCHtgu4QoFqQ1QHyeoLgCd29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n69YFxVLhS4sd7kGq6Z5bOGmR/ija8mAe2OdNBTqnA0=;
 b=mKIy6jCkmTR4wvVavZD8ujMwVo8kalLsbSzSKGVk2HeHX3nnaKB4NYFsvLYol61iUkQMu1AlfIt5RVzAvGuBMOrv/oIF90FF/FAJ3Enin2B3I6XRPVNYEdF+J3Wm0hOK89pi0V+7Lt66ACXiKgIqLnxibMtKAGUDKtnDFVBtAe8=
Received: from CY5PR15CA0233.namprd15.prod.outlook.com (2603:10b6:930:88::29)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.19; Sat, 5 Oct 2024 00:27:07 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com (2603:10b6:930:88::4)
 by CY5PR15CA0233.outlook.office365.com (2603:10b6:930:88::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.19 via Frontend Transport; Sat, 5 Oct 2024 00:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Sat, 5 Oct 2024 00:27:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 19:27:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 19:27:03 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Oct 2024 19:27:03 -0500
Message-ID: <1a36698c-a0dc-49d0-39fa-8c6823b4a9ed@amd.com>
Date: Fri, 4 Oct 2024 17:27:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 01/11] accel/amdxdna: Add documentation for AMD NPU
 accelerator driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-2-lizhi.hou@amd.com>
 <71e97cd0-f224-7c0e-f1f3-87ca7c3889ce@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <71e97cd0-f224-7c0e-f1f3-87ca7c3889ce@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DM4PR12MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0d5787-d844-423f-dbc6-08dce4d471a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGRjUGFpam5Kc0lVNmNYRDZmQldYejlkM3lQL0FxTHN0dGZCMk8xc2pLVFlv?=
 =?utf-8?B?aHRVdndnNE9JOUV0ZFdCVVB0Z1N5Vzg1aWRnampwaXVOUzI4azFTWGJHWGVn?=
 =?utf-8?B?UFJPY1BXdk1kUTRsOWlCS3poaFppMDlmNG5xMFh0bktHZG8wYlRoT0pwSyts?=
 =?utf-8?B?V2RNazJXZVpBOUpKMHErbmVlUWJ3dHludkVSWTBFQ2dGaUt4Z1BSbFZjeFZI?=
 =?utf-8?B?akFWSzRLbkptaUtpN0RWR3RKVWEvajVodXpNSWZJcndjYnpIQzFQRUNKZmxt?=
 =?utf-8?B?a2RlbEZ3dXpJQ2dleGw0SjIybmQyREowVVdjZFdyTWphN29tSFVRRWg2Q3pk?=
 =?utf-8?B?TGZxOWN0aHBlZ3RneXkzcGlNWUNPVDhleEVLQWIvNDdUNmZiWktvbFo2R1Ni?=
 =?utf-8?B?elpZOW5ERG9KNGR1alhhcGRKZ0JoUVdWMFJ4aHlRWlVndjRua3ZoZmUrWkpv?=
 =?utf-8?B?WE9zTUNqTjljVkF4UUhVQWwySDBBY1RyMUFHU3UzNUJtM2NEUHVaMktlV1Fn?=
 =?utf-8?B?cDlQZXFHUVV4UFVRZytBRnM4Smxsd3FqMzRtei80S04zVGVxbk5URVgrUnQv?=
 =?utf-8?B?c1VvU3BZanQrVzRiakR3U2lzeUxlOEd1UmhHSFoyN3NLMnNjUFZjbFFhNTdp?=
 =?utf-8?B?SVUxNUZEemhWU2c1YmEwd3RpQXV1KzZFLzdtM0dlZVFTaEpLamtzWUxwTXZL?=
 =?utf-8?B?K1J6MCtzZWZUdVlPTUZzK094UjZjaTJEbE84UXlSZEJwUG9MRUpuNXY1dnhX?=
 =?utf-8?B?TnM4dkZHcHNvaTdKZ1oyUW9YQTBhazBRSjl6N3VXVzJWVmpzelBPM1ZpNmxP?=
 =?utf-8?B?d1Mvc0xUdWl4UXBDUVUxcWdIc1BCeFFpdXpBY3lDUmR6S2l2R3RGcUJJV3du?=
 =?utf-8?B?VUVmbk13U1RnTVM4Q0dmcXdNbHRDMVhOZVNiTWYvYzBjMElEQ1l2ckFMdXhD?=
 =?utf-8?B?TWhzZmd5aEFKSzUzR3FjZ1RnYzVqV3RPOGRTUVlzTVBVdytsQU8zVVBSWWti?=
 =?utf-8?B?M2ZTeVZoSGN3SUpNMktJZVp0blEwUksrYzdocjN3MU9VYmFhZVRVL0l0NzRI?=
 =?utf-8?B?MGZGSzJxam5JUDZnMDdmVkxuSk1DN3NMclJQN1NvcWk5Y1lEMHpsYmo1VklL?=
 =?utf-8?B?UkswN1VVTG1UZWtkMmswdEhyOEthQWhVQm52VVN5ZmZiM2JLY3cxWXZkVmhG?=
 =?utf-8?B?dWRkMm40aXo2U3ZrYy8vSFNoTk5odGNEZDZPRXRYYW1qR1BsSUloUVFMTXow?=
 =?utf-8?B?TzVqLzhIV2FmWklObXZDMWsrQVhvRDF0cndPVVpaMDVLVUdQYUk2NERlc291?=
 =?utf-8?B?aUdDdXFSank2WDZVK0w4ejErdkk0UnpuaXUrOE9vMUsrbldhY3FSaStqZkho?=
 =?utf-8?B?K2V3enBFeVF0OHlpUVRNdjBEeEhNZmVtWklhSjJUTThRYm5PZVV2aHdMQ21U?=
 =?utf-8?B?dXBtZnNKK1pPSGdDeTB1QkwxcU9aK1hxWGpDc0s5RmxIYWY1c1NGczArWFd0?=
 =?utf-8?B?NUJmZ2M3d3k3Nm9TODdSTlh1K3EyV1B4UkhIMk1iWDFJU0xZb1RwbjE3YUVy?=
 =?utf-8?B?WGZKcXhKUm5YSkUyVkkyNmtSVGR0cFR3NGRnM1pyNldpMkVWVVJXbjREZmpS?=
 =?utf-8?B?WE5ybmNHeGZWUUQwOFNOckxvSUVhc2NtVmhhUXBaeWw1NWZyZHNTZGtKRGwy?=
 =?utf-8?B?TnB6VVpkS3BqV1lmYzcyNmZPcTQyZW9kR2NUeHllQmt3ekhKQmNiS0k1WGpi?=
 =?utf-8?B?eUlPV0NlREJyd0pITEVsT0FGMXpUcmRwZ1p5TFoxOWJLZlowWnR0QnNSamdL?=
 =?utf-8?B?Y2E0aHhnaE5vT1V6RmRJRy9GaEI2N2NGQ2NtWEE3YVRXbmgycnl3T2drS3dV?=
 =?utf-8?Q?XXcjkgoTY8xcj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2024 00:27:06.8459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0d5787-d844-423f-dbc6-08dce4d471a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135
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


On 10/4/24 10:06, Jeffrey Hugo wrote:
> On 9/11/2024 12:05 PM, Lizhi Hou wrote:
>> AMD NPU (Neural Processing Unit) is a multi-user AI inference 
>> accelerator
>> integrated into AMD client APU. NPU enables efficient execution of 
>> Machine
>> Learning applications like CNN, LLM, etc. NPU is based on AMD XDNA
>> Architecture. NPU is managed by amdxdna driver.
>>
>> Co-developed-by: Sonal Santan <sonal.santan@amd.com>
>> Signed-off-by: Sonal Santan <sonal.santan@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   Documentation/accel/amdxdna/amdnpu.rst | 283 +++++++++++++++++++++++++
>>   Documentation/accel/amdxdna/index.rst  |  11 +
>>   Documentation/accel/index.rst          |   1 +
>>   3 files changed, 295 insertions(+)
>>   create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
>>   create mode 100644 Documentation/accel/amdxdna/index.rst
>>
>> diff --git a/Documentation/accel/amdxdna/amdnpu.rst 
>> b/Documentation/accel/amdxdna/amdnpu.rst
>> new file mode 100644
>> index 000000000000..2af3bc5b2a9e
>> --- /dev/null
>> +++ b/Documentation/accel/amdxdna/amdnpu.rst
>> @@ -0,0 +1,283 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +.. include:: <isonum.txt>
>> +
>> +.. SPDX-License-Identifier: GPL-2.0-only
>
> SPDX twice?
I will remove one.
>
>> +
>> +=========
>> + AMD NPU
>> +=========
>> +
>> +:Copyright: |copy| 2024 Advanced Micro Devices, Inc.
>> +:Author: Sonal Santan <sonal.santan@amd.com>
>> +
>> +Overview
>> +========
>> +
>> +AMD NPU (Neural Processing Unit) is a multi-user AI inference 
>> accelerator
>> +integrated into AMD client APU. NPU enables efficient execution of 
>> Machine
>> +Learning applications like CNN, LLM, etc. NPU is based on
>> +`AMD XDNA Architecture`_. NPU is managed by **amdxdna** driver.
>> +
>> +
>> +Hardware Description
>> +====================
>> +
>> +AMD NPU consists of the following hardware components:
>> +
>> +AMD XDNA Array
>> +--------------
>> +
>> +AMD XDNA Array comprises of 2D array of compute and memory tiles 
>> built with
>> +`AMD AI Engine Technology`_. Each column has 4 rows of compute tiles 
>> and 1
>> +row of memory tile. Each compute tile contains a VLIW processor with 
>> its own
>> +dedicated program and data memory. The memory tile acts as L2 
>> memory. The 2D
>> +array can be partitioned at a column boundary creating a spatially 
>> isolated
>> +partition which can be bound to a workload context.
>> +
>> +Each column also has dedicated DMA engines to move data between host 
>> DDR and
>> +memory tile.
>> +
>> +AMD Phoenix and AMD Hawk Point client NPU have a 4x5 topology, i.e., 
>> 4 rows of
>> +compute tiles arranged into 5 columns. AMD Strix Point client APU 
>> have 4x8
>> +topology, i.e., 4 rows of compute tiles arranged into 8 columns.
>> +
>> +Shared L2 Memory
>> +................
>
> Why a line of "." instead of "-" likse elsewhere?
I will fix it.
>
>> +
>> +The single row of memory tiles create a pool of software managed on 
>> chip L2
>> +memory. DMA engines are used to move data between host DDR and 
>> memory tiles.
>> +AMD Phoenix and AMD Hawk Point NPUs have a total of 2560 KB of L2 
>> memory.
>> +AMD Strix Point NPU has a total of 4096 KB of L2 memory.
>> +
>> +Microcontroller
>> +---------------
>> +
>> +A microcontroller runs NPU Firmware which is responsible for command 
>> processing,
>> +XDNA Array partition setup, XDNA Array configuration, workload context
>> +management and workload orchestration.
>> +
>> +NPU Firmware uses a dedicated instance of an isolated non-privileged 
>> context
>> +called ERT to service each workload context. ERT is also used to 
>> execute user
>> +provided ``ctrlcode`` associated with the workload context.
>> +
>> +NPU Firmware uses a single isolated privileged context called MERT 
>> to service
>> +management commands from the amdxdna driver.
>> +
>> +Mailboxes
>> +.........
>
> Again, odd delimiter
>
>> +
>> +The microcontroller and amdxdna driver use a privileged channel for 
>> management
>> +tasks like setting up of contexts, telemetry, query, error handling, 
>> setting up
>> +user channel, etc. As mentioned before, privileged channel requests are
>> +serviced by MERT. The privileged channel is bound to a single mailbox.
>> +
>> +The microcontroller and amdxdna driver use a dedicated user channel per
>> +workload context. The user channel is primarily used for submitting 
>> work to
>> +the NPU. As mentioned before, a user channel requests are serviced 
>> by an
>> +instance of ERT. Each user channel is bound to its own dedicated 
>> mailbox.
>> +
>> +PCIe EP
>> +-------
>> +
>> +NPU is visible to the x86 as a PCIe device with multiple BARs and 
>> some MSI-X
>
> "to the x86" - feels like something is missing here.  Maybe "x86 host 
> CPU"?
Yes. I will change to "to the x86 host CPU".
>
>> +interrupt vectors. NPU uses a dedicated high bandwidth SoC level 
>> fabric for
>> +reading or writing into host memory. Each instance of ERT gets its 
>> own dedicated
>> +MSI-X interrupt. MERT gets a single instance of MSI-X interrupt.
>
> <snip>
>
>> diff --git a/Documentation/accel/amdxdna/index.rst 
>> b/Documentation/accel/amdxdna/index.rst
>> new file mode 100644
>> index 000000000000..38c16939f1fc
>> --- /dev/null
>> +++ b/Documentation/accel/amdxdna/index.rst
>> @@ -0,0 +1,11 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +=====================================
>> + accel/amdxdna NPU driver
>> +=====================================
>> +
>> +The accel/amdxdna driver supports the AMD NPU (Neural Processing Unit).
>> +
>> +.. toctree::
>> +
>> +   amdnpu
>> diff --git a/Documentation/accel/index.rst 
>> b/Documentation/accel/index.rst
>> index e94a0160b6a0..0a94b6766263 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -9,6 +9,7 @@ Compute Accelerators
>>        introduction
>>      qaic/index
>> +   amdxdna/index
>
> I think alphabetical order makes sense to me, considering there 
> probably should be more entries added over time. This would suggest 
> that your addition should occur one line up. What do you think?

I will fix it.


Thanks,

Lizhi

>
>>     .. only::  subproject and html
>
