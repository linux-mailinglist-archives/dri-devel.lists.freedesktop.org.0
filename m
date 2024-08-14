Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE339521E4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 20:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CED10E05F;
	Wed, 14 Aug 2024 18:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3XhLyHlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3D910E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 18:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yes8QTSVGCo9aUJIY1+vxfSI1zrlTYIl9j0ncvn4Ab5+HodCveuhb/nGXEPpkq6i2ehkMJOrEhCrXoT+GBVGUnCtdh3tVzL1WcewKiAOLXxC/LmUHjQKYNHQU4GG75RQ7mxl4FTcDYu0xxVPTXe0sa2NVBe3tcTEO/BJ1zcrbCKUGdVdskH0sTP5HJvfedrMRVE0HHIEah0KotLxo22Wx8F76ZI7B+z0ai0fCrG+qAUz+0ueR9AQd0n0d4sunF0XS8Mymu8HY80jfc4RyFIFQEYOAjZtbPzXIqdIpgfG1OdYUQAieXsy1SP2635PWrkwfPDyjCijkHdZAqGAjwY+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOo1i0y8KnUOkKSNRpg/2M1HkZRW0MHG0dfAnDdbnOE=;
 b=x1A19AO0jK1awW/OwLFRDbI+QtXhO+qibl4BF6wEHnRdQ8Hb/Pz6vubp0XPJIGv6ZHhjTAa0mE9X0OyyVCoYSci6zRE/gMDLXq5GlcdiOMnz1lQ27x/QT3ro6lMFQ/CTiMGGG/Zd8R1WtVvpN/40CbATT+2hhmtn8ABvbLboKJow8Bss7+Kx9xJUl4prjh7fcM29YtiiV4kveDLeQb65UP6s5nmG0dsuuAPsTHARQZZhRN1S4CbaYs4Le8RQMs7XY7SxdircjPhKn5Pjmp1hTXEXCdDW/mIzmDHoUcs531N4H1cw+nRfQq+Xwz5yZBB7tmaYeeez3CpDyl2093mM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOo1i0y8KnUOkKSNRpg/2M1HkZRW0MHG0dfAnDdbnOE=;
 b=3XhLyHlc4rWpquiS5cQvHurVKU82IWi2YsMdnO75gBqkZeyw3EYkQgnIUDUMZis+pYZ0h2LQvHOsqr5o38ZkZo3tLSndeRwgBpxhFVLzvbJKYDWweAR8VAIKgxPp1QKZO5PBB0ETCxuO+Jytdm2kc46KYDyOHiOFzEUVYfVAyHs=
Received: from SJ0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:a03:39e::21)
 by SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Wed, 14 Aug
 2024 18:17:23 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::e8) by SJ0PR03CA0286.outlook.office365.com
 (2603:10b6:a03:39e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 18:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 18:17:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 13:16:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 13:16:47 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 13:16:46 -0500
Message-ID: <172cde68-930f-381e-df9f-da2a48955828@amd.com>
Date: Wed, 14 Aug 2024 11:16:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
 <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SJ2PR12MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e37ec0-9040-4fa5-4c47-08dcbc8d4ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1Q1T0pCb0ZIeXdhWk1sQmpxY1hxQnBZZTc1UGRLQVMySFBjeWVhMzRRc1FR?=
 =?utf-8?B?dUsvZXBnYjE0ajRseHhYZ3g0ai92Q3loalJqNmJJMTBsM29jaHk2TXZNNHdk?=
 =?utf-8?B?TUtFRmZ3RnNjK2tSdW91VzQ2cmtGc3U1cjVkSjFUK3p6RkxXdTZDME5QWEFJ?=
 =?utf-8?B?ZWN5VHJEa3hIRkpzZGppZEE3QmgxR09uSlUvMWpmYVA0MFNrRmIrdXgxYUo5?=
 =?utf-8?B?SytOU2R2MUI3MFZtbkJTaG1STXJMODVPYVI1TkExL0JVb3dndll5YUZHcFIz?=
 =?utf-8?B?d2xPelgwVmF4OE93YlJiY3d2STdzdnJETkpFZTRRSmZTNlh5eVU1RWhnc2FM?=
 =?utf-8?B?b3VjaGVzaVQ5OWdocWh3QzI1djNJeFBOeGxFeThLRGx2YXVwYTg2MHp2eEsx?=
 =?utf-8?B?Y2w0dVEzMmlvUlRNNy9SbndVSGxDT2F2YTFSa2MvcldXVUZiRVpHVUFwVlho?=
 =?utf-8?B?UmdUc2VIL01GOVFIeEIzUGVJazV3ZVdrYjNneS9oUTR4c3R4YjdSL0xOZXpN?=
 =?utf-8?B?UHF1Q3B5WVF4c1EwZTJxRHl0dE8va3RQK0tEcGxwZFBBZ0w1N2pjR2c2Y29n?=
 =?utf-8?B?Vk90TDUxei8xQS83ckU0eHdJTmpRQ3FVQkl4M1JmV0RhT3ZYNFpycllUcngy?=
 =?utf-8?B?c1F2ODVoN1RQN1JXTDYrL0Y4YzRCTWtpSXg0SjY5MHA3MlBYVko4ajZqRDFC?=
 =?utf-8?B?cEdLSmdQOVdtaEo2YzhwQnZaaTFVSW5JaVBOSVI3eFZDanFYMkEwT2hkSnhC?=
 =?utf-8?B?ZGM1UUQ4OEpQdUUxd1UwQ2QxdmJOWUpRa3V1MTNxL0lVRzRSSnhxbktxZXVa?=
 =?utf-8?B?b0FkT3BLZGFyR01nbjR0MmtydnB0aVBOUUdyVU9RNGJpV2pwMGNXVmlJYmpq?=
 =?utf-8?B?dmhsNVk2N1BkRjVoNGI1cFZkcllDUXRhUzl5eC94My9WdnBINWpDRXJXbzFM?=
 =?utf-8?B?WDN6bEFtbzdsbnpBWGRCeFg0MzdJbTV5VWIvTmVzODVKNWNocjVEaWpDb0Zn?=
 =?utf-8?B?bnVzTm5pc0JTRmIvbml1ak5oM0JHcTZqZG9oTy9mYy9vZFlvNWFLT2Y3d3px?=
 =?utf-8?B?T0JvZ0xOaWxGbWVQclkzeVgrMWRNTHFSQnBFWXc2UEFGVnZ1K3BEcC9IN09T?=
 =?utf-8?B?VlJSQ2ZzdGVqT1RWU0lZckhJdTJ6MmtwWFcwaUFQNUJRdk9ubFkrWEhUTStH?=
 =?utf-8?B?LytnVHdkVDNDaEl6S1l1WDIxTkZYcTA2SlNKbzUvMCtLWTZYMyt5SFE0ZFpw?=
 =?utf-8?B?Q21DWU56UmRHMEtTek10aXY1ZjczQno4VFBRcXlKZ3pCZ3NrbDlpUndIVzdF?=
 =?utf-8?B?T3g5dE9taG44OS91YTh1bnlpNFpRZlVmSTAzdVBYSS8zcWwrWVhOZ0Q1ZC8z?=
 =?utf-8?B?aFFuTHByS3I0QzdJRk5Wa0Rkdk9vK1phT1ZYRTF4WEhoNSt6dk9PbHFDRjY1?=
 =?utf-8?B?S1g0QWYrWFQ5R3J3dkdKdkNhViszNGp6a2dSQjdyelJ3NWtXbWVlaytDWWFy?=
 =?utf-8?B?QU03VDVYS2V1UlUyQUVZMFovUzdMaTdSa2NhcndUa3plVXNyV1dPdEZoWkJG?=
 =?utf-8?B?K1RadDdadlRYc0liTWlITWxCQTEyU0FaS2QvZWRmd2dpVVlNYUNhT2lWOTl4?=
 =?utf-8?B?MTNhOE1rbUZFUTJVT2ljY09DbU81Yk1rTU5jaFBySjd6SEdpQ3hBWmk1L2JQ?=
 =?utf-8?B?MFMrL3llOHYwa1UwVUlFckZOSXNUZ2F3SldWVzBiNHhZS3pvdHo2UFFPOXlt?=
 =?utf-8?B?S3Jjc0NRbUpNOUl5Yjc5RWF2TGVBZXd6UmlDQTBzbkpUaGF0THl4YXhFYmxI?=
 =?utf-8?B?RFd3SUIrOG1lRVRMQmZ3K3A2eHdvZEk5WGpLU3RKRDhNTWRNcUdMSHBlR0hR?=
 =?utf-8?B?V2EwbjRhTm14RXNsVXlhRk5MbHkycG54OGZESnUvL2NkaHBieGVodHdBRDRM?=
 =?utf-8?Q?KKqBny1ld3p6rnbZz235XtqqVmckBc//?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 18:17:07.1702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e37ec0-9040-4fa5-4c47-08dcbc8d4ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8953
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


On 8/9/24 09:11, Jeffrey Hugo wrote:
> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>> AMD AI Engine forms the core of AMD NPU and can be used for accelerating
>> machine learning applications.
>>
>> Add the driver to support AI Engine integrated to AMD CPU.
>> Only very basic functionalities are added.
>>    - module and PCI device initialization
>>    - firmware load
>>    - power up
>>    - low level hardware initialization
>>
>> Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
>> Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
>> Co-developed-by: George Yang <George.Yang@amd.com>
>> Signed-off-by: George Yang <George.Yang@amd.com>
>> Co-developed-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   MAINTAINERS                             |   8 ++
>>   drivers/accel/Kconfig                   |   1 +
>>   drivers/accel/Makefile                  |   1 +
>>   drivers/accel/amdxdna/Kconfig           |  15 ++
>>   drivers/accel/amdxdna/Makefile          |  14 ++
>>   drivers/accel/amdxdna/TODO              |   4 +
>>   drivers/accel/amdxdna/aie2_pci.c        | 182 ++++++++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h        | 144 +++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_psp.c        | 137 ++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_smu.c        | 112 +++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_drm.c     |  20 +++
>>   drivers/accel/amdxdna/amdxdna_drm.h     |  65 +++++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 118 +++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  31 ++++
>>   drivers/accel/amdxdna/amdxdna_sysfs.c   |  47 ++++++
>>   drivers/accel/amdxdna/npu1_regs.c       |  94 ++++++++++++
>>   drivers/accel/amdxdna/npu2_regs.c       | 111 +++++++++++++++
>>   drivers/accel/amdxdna/npu4_regs.c       | 111 +++++++++++++++
>>   drivers/accel/amdxdna/npu5_regs.c       | 111 +++++++++++++++
>>   include/uapi/drm/amdxdna_accel.h        |  27 ++++
>>   20 files changed, 1353 insertions(+)
>>   create mode 100644 drivers/accel/amdxdna/Kconfig
>>   create mode 100644 drivers/accel/amdxdna/Makefile
>>   create mode 100644 drivers/accel/amdxdna/TODO
>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>>   create mode 100644 include/uapi/drm/amdxdna_accel.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36d66b141352..3d2b9f1f1a07 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1146,6 +1146,14 @@ M:    Sanjay R Mehta <sanju.mehta@amd.com>
>>   S:    Maintained
>>   F:    drivers/spi/spi-amd.c
>>   +AMD XDNA DRIVER
>> +M:    Min Ma <min.ma@amd.com>
>> +M:    Lizhi Hou <lizhi.hou@amd.com>
>> +L:    dri-devel@lists.freedesktop.org
>> +S:    Supported
>> +F:    drivers/accel/amdxdna
>
> Trailing "/"?
>
>> +F:    include/uapi/drm/amdxdna_accel.h
>
> T: ?
Sure. I will fix above two.
>
>> +
>>   AMD XGBE DRIVER
>>   M:    "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
>>   L:    netdev@vger.kernel.org
>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> new file mode 100644
>> index 000000000000..3660967c00e6
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -0,0 +1,182 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/amd-iommu.h>
>> +#include <linux/errno.h>
>> +#include <linux/firmware.h>
>> +#include <linux/iommu.h>
>
> You are clearly missing linux/pci.h and I suspect many more.
Other headers are indirectly included by "aie2_pci.h" underneath.
>
>> +
>> +#include "aie2_pci.h"
>> +
>> +static void aie2_hw_stop(struct amdxdna_dev *xdna)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> +    struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>> +
>> +    aie2_psp_stop(ndev->psp_hdl);
>> +    aie2_smu_fini(ndev);
>> +    pci_clear_master(pdev);
>> +    pci_disable_device(pdev);
>
> pci_clear_master() is redundant with pci_disable_device(), no?
You are right. I will remove it.
>
>> +}
>> +
>> +static int aie2_hw_start(struct amdxdna_dev *xdna)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> +    struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>> +    int ret;
>> +
>> +    ret = pci_enable_device(pdev);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
>> +        return ret;
>> +    }
>> +    pci_set_master(pdev);
>> +
>> +    ret = aie2_smu_init(ndev);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
>> +        goto disable_dev;
>> +    }
>> +
>> +    ret = aie2_psp_start(ndev->psp_hdl);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "failed to start psp, ret %d", ret);
>> +        goto fini_smu;
>> +    }
>> +
>> +    return 0;
>> +
>> +fini_smu:
>> +    aie2_smu_fini(ndev);
>> +disable_dev:
>> +    pci_disable_device(pdev);
>> +    pci_clear_master(pdev);
>
> Again, clear_master appears redundant
>
>> +
>> +    return ret;
>> +}
>> +
>> +static int aie2_init(struct amdxdna_dev *xdna)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> +    struct amdxdna_dev_hdl *ndev;
>> +    struct psp_config psp_conf;
>> +    const struct firmware *fw;
>> +    void __iomem * const *tbl;
>
> Is there an extra "*" here?
It looks a match with pcim_iomap_table() return type.
>
>> +    int i, bars, nvec, ret;
>> +
>> +    ndev = devm_kzalloc(&pdev->dev, sizeof(*ndev), GFP_KERNEL);
>> +    if (!ndev)
>> +        return -ENOMEM;
>> +
>> +    ndev->priv = xdna->dev_info->dev_priv;
>> +    ndev->xdna = xdna;
>> +
>> +    ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
>> +             ndev->priv->fw_path, ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = pcim_enable_device(pdev);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "pcim enable device failed, ret %d", ret);
>> +        goto release_fw;
>> +    }
>> +
>> +    bars = pci_select_bars(pdev, IORESOURCE_MEM);
>> +    for (i = 0; i < PSP_MAX_REGS; i++) {
>> +        if (!(BIT(PSP_REG_BAR(ndev, i)) && bars)) {
>> +            XDNA_ERR(xdna, "does not get pci bar%d",
>> +                 PSP_REG_BAR(ndev, i));
>> +            ret = -EINVAL;
>> +            goto release_fw;
>> +        }
>> +    }
>> +
>> +    ret = pcim_iomap_regions(pdev, bars, "amdxdna-npu");
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "map regions failed, ret %d", ret);
>> +        goto release_fw;
>> +    }
>> +
>> +    tbl = pcim_iomap_table(pdev);
>> +    if (!tbl) {
>> +        XDNA_ERR(xdna, "Cannot get iomap table");
>> +        ret = -ENOMEM;
>> +        goto release_fw;
>> +    }
>> +    ndev->sram_base = tbl[xdna->dev_info->sram_bar];
>> +    ndev->smu_base = tbl[xdna->dev_info->smu_bar];
>
> Doesn't this throw a sparse error from directly accessing memory 
> marked iomem?

It does not. tbl[] returns the iomem pointer and the driver uses 
writel/readl to access.

e.g. writel(0, SMU_REG(ndev, SMU_RESP_REG));

>
>> +
>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
>> +        goto release_fw;
>> +    }
>> +
>> +    nvec = pci_msix_vec_count(pdev);
>
> This feels weird.  Can your device advertise variable number of MSI-X 
> vectors?  It only works if all of the vectors are used?
That is possible. the driver supports different hardware. And the fw 
assigns vector for hardware context dynamically. So the driver needs to 
allocate all vectors ahead.
>
>> +    if (nvec <= 0) {
>> +        XDNA_ERR(xdna, "does not get number of interrupt vector");
>> +        ret = -EINVAL;
>> +        goto release_fw;
>> +    }
>> +
>> +    ret = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSIX);
>> +    if (ret < 0) {
>> +        XDNA_ERR(xdna, "failed to alloc irq vectors, ret %d", ret);
>> +        goto release_fw;
>> +    }
>> +
>> +    ret = iommu_dev_enable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "Enable PASID failed, ret %d", ret);
>> +        goto free_irq;
>> +    }
>> +
>> +    psp_conf.fw_size = fw->size;
>> +    psp_conf.fw_buf = fw->data;
>> +    for (i = 0; i < PSP_MAX_REGS; i++)
>> +        psp_conf.psp_regs[i] = tbl[PSP_REG_BAR(ndev, i)] + 
>> PSP_REG_OFF(ndev, i);
>> +    ndev->psp_hdl = aie2m_psp_create(&pdev->dev, &psp_conf);
>> +    if (!ndev->psp_hdl) {
>> +        XDNA_ERR(xdna, "failed to create psp");
>> +        ret = -ENOMEM;
>> +        goto disable_sva;
>> +    }
>> +    xdna->dev_handle = ndev;
>> +
>> +    ret = aie2_hw_start(xdna);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "start npu failed, ret %d", ret);
>> +        goto disable_sva;
>> +    }
>> +
>> +    release_firmware(fw);
>> +    return 0;
>> +
>> +disable_sva:
>> +    iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
>> +free_irq:
>> +    pci_free_irq_vectors(pdev);
>> +release_fw:
>> +    release_firmware(fw);
>> +
>> +    return ret;
>> +}
>> +
>> +static void aie2_fini(struct amdxdna_dev *xdna)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> +
>> +    aie2_hw_stop(xdna);
>> +    iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
>> +    pci_free_irq_vectors(pdev);
>> +}
>> +
>> +const struct amdxdna_dev_ops aie2_ops = {
>> +    .init           = aie2_init,
>> +    .fini           = aie2_fini,
>> +};
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> new file mode 100644
>> index 000000000000..984bf65b7a2b
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -0,0 +1,144 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _AIE2_PCI_H_
>> +#define _AIE2_PCI_H_
>> +
>> +#include <linux/device.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/io.h>
>> +
>> +#include "amdxdna_pci_drv.h"
>> +
>> +#define AIE2_INTERVAL    20000    /* us */
>> +#define AIE2_TIMEOUT    1000000    /* us */
>> +
>> +/* Firmware determines device memory base address and size */
>> +#define AIE2_DEVM_BASE    0x4000000
>> +#define AIE2_DEVM_SIZE    (48 * 1024 * 1024)
>
> I'd expect to see some SZ_ macros used here
Sure.
>
>> +
>> +#define NDEV2PDEV(ndev) \
>> +    (to_pci_dev((ndev)->xdna->ddev.dev))
>> +
>> +#define AIE2_SRAM_OFF(ndev, addr) \
>> +    ((addr) - (ndev)->priv->sram_dev_addr)
>> +#define AIE2_MBOX_OFF(ndev, addr) \
>> +    ((addr) - (ndev)->priv->mbox_dev_addr)
>> +
>> +#define PSP_REG_BAR(ndev, idx) \
>> +    ((ndev)->priv->psp_regs_off[(idx)].bar_idx)
>> +#define PSP_REG_OFF(ndev, idx) \
>> +    ((ndev)->priv->psp_regs_off[(idx)].offset)
>> +#define SRAM_REG_OFF(ndev, idx) \
>> +    ((ndev)->priv->sram_offs[(idx)].offset)
>
> Really looks like these 6 macros can all fit on a single line, why 
> split them up?
I will fix these. and other places.
>
>> +
>> +#define SMU_REG(ndev, idx) \
>> +({ \
>> +    typeof(ndev) _ndev = ndev; \
>> +    ((_ndev)->smu_base + (_ndev)->priv->smu_regs_off[(idx)].offset); \
>> +})
>> +#define SRAM_GET_ADDR(ndev, idx) \
>> +({ \
>> +    typeof(ndev) _ndev = ndev; \
>> +    ((_ndev)->sram_base + SRAM_REG_OFF((_ndev), (idx))); \
>> +})
>> +
>> +#define SMU_MPNPUCLK_FREQ_MAX(ndev) \
>> +    ((ndev)->priv->smu_mpnpuclk_freq_max)
>> +#define SMU_HCLK_FREQ_MAX(ndev) \
>> +    ((ndev)->priv->smu_hclk_freq_max)
>> +
>> +enum aie2_smu_reg_idx {
>> +    SMU_CMD_REG = 0,
>> +    SMU_ARG_REG,
>> +    SMU_INTR_REG,
>> +    SMU_RESP_REG,
>> +    SMU_OUT_REG,
>> +    SMU_MAX_REGS /* Kepp this at the end */
>
> "keep"
Got it. Thanks.
>
>> diff --git a/drivers/accel/amdxdna/aie2_psp.c 
>> b/drivers/accel/amdxdna/aie2_psp.c
>> new file mode 100644
>> index 000000000000..c24207c252a1
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>> @@ -0,0 +1,137 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/firmware.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/slab.h>
>> +#include "aie2_pci.h"
>> +
>> +#define PSP_STATUS_READY    BIT(31)
>> +
>> +/* PSP commands */
>> +#define PSP_VALIDATE        1
>> +#define PSP_START        2
>> +#define PSP_RELEASE_TMR        3
>> +
>> +/* PSP special arguments */
>> +#define PSP_START_COPY_FW    1
>> +
>> +/* PSP response error code */
>> +#define PSP_ERROR_CANCEL    0xFFFF0002
>> +#define PSP_ERROR_BAD_STATE    0xFFFF0007
>> +
>> +#define PSP_FW_ALIGN        0x10000
>> +#define PSP_POLL_INTERVAL    20000    /* us */
>> +#define PSP_POLL_TIMEOUT    1000000    /* us */
>> +
>> +#define PSP_REG(p, reg) \
>> +    ((p)->psp_regs[reg])
>
> This is not valid with __iomem
Sorry, I am not fully understand the comment.

Each element of ->psp_regs[] is a void __iomem *. And readl/writel are 
used with it.

e.g. writel(reg_vals[i], PSP_REG(psp, i));

>
>> +struct psp_device *aie2m_psp_create(struct device *dev, struct 
>> psp_config *conf)
>> +{
>> +    struct psp_device *psp;
>> +    u64 offset;
>> +
>> +    psp = devm_kzalloc(dev, sizeof(*psp), GFP_KERNEL);
>> +    if (!psp)
>> +        return NULL;
>> +
>> +    psp->dev = dev;
>> +    memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>> +
>> +    psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
>> +    psp->fw_buffer = devm_kmalloc(psp->dev, psp->fw_buf_sz, 
>> GFP_KERNEL);
>
> Feels like this (and a bunch of other instances I haven't commented 
> on) should be drmm_* allocs.

The PSP code is kind of low level and directly interact with hardware. 
All the PSP interfaces use struct device * instead of drm_device. I 
think it is kind make sense because PSP is not related to drm.

I will scan all other allocs and change them to drmm_* allocs for the 
code related to drm_device. Does this sound ok to you?

>
>> +    if (!psp->fw_buffer) {
>> +        dev_err(psp->dev, "no memory for fw buffer");
>> +        return NULL;
>> +    }
>> +
>> +    psp->fw_paddr = virt_to_phys(psp->fw_buffer);
>
> I'm pretty sure virt_to_phys() is always wrong

The hardware exposes several registers to communicate with platform PSP 
(AMD Platform Security Processor) to load NPU firmware. And PSP only 
accept host physical address with current hardware.

I understand usually virt_to_phys() should not be needed for device 
driver. And maybe it is ok to use if there is hardware requirement? I 
can see some drivers use it as well.

>
>> +    offset = ALIGN(psp->fw_paddr, PSP_FW_ALIGN) - psp->fw_paddr;
>> +    psp->fw_paddr += offset;
>> +    memcpy(psp->fw_buffer + offset, conf->fw_buf, conf->fw_size);
>> +
>> +    return psp;
>> +}
>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c 
>> b/drivers/accel/amdxdna/amdxdna_drm.c
>> new file mode 100644
>> index 000000000000..91e4f9c9dac9
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_drm.c
>
> What is the point of this file?  Seems like all of this could just be 
> in amdxdna_pci_drv.c
The future product may have NPU with non-pci device. So it might be a 
amdxdna_plat_drv.c and share the same amdxdna_drm.c in the future.
>
>> @@ -0,0 +1,20 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_accel.h>
>> +
>> +#include "amdxdna_drm.h"
>> +
>> +DEFINE_DRM_ACCEL_FOPS(amdxdna_fops);
>> +
>> +const struct drm_driver amdxdna_drm_drv = {
>> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>> +    .fops = &amdxdna_fops,
>> +    .name = "amdxdna_accel_driver",
>> +    .desc = "AMD XDNA DRM implementation",
>> +    .major = AMDXDNA_DRIVER_MAJOR,
>> +    .minor = AMDXDNA_DRIVER_MINOR,
>
> These are deprecated.  You should drop them
Sure. I will remove them.
>
>> +};
>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.h 
>> b/drivers/accel/amdxdna/amdxdna_drm.h
>> new file mode 100644
>> index 000000000000..2b18bcbdc23e
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_drm.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _AMDXDNA_DRM_H_
>> +#define _AMDXDNA_DRM_H_
>> +
>> +#include <drm/amdxdna_accel.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_file.h>
>> +
>> +#define XDNA_INFO(xdna, fmt, args...) drm_info(&(xdna)->ddev, fmt, 
>> ##args)
>> +#define XDNA_WARN(xdna, fmt, args...) drm_warn(&(xdna)->ddev, "%s: 
>> "fmt, __func__, ##args)
>> +#define XDNA_ERR(xdna, fmt, args...) drm_err(&(xdna)->ddev, "%s: 
>> "fmt, __func__, ##args)
>> +#define XDNA_DBG(xdna, fmt, args...) drm_dbg(&(xdna)->ddev, fmt, 
>> ##args)
>> +#define XDNA_INFO_ONCE(xdna, fmt, args...) 
>> drm_info_once(&(xdna)->ddev, fmt, ##args)
>> +
>> +#define to_xdna_dev(drm_dev) \
>> +    ((struct amdxdna_dev *)container_of(drm_dev, struct amdxdna_dev, 
>> ddev))
>> +
>> +extern const struct drm_driver amdxdna_drm_drv;
>> +
>> +struct amdxdna_dev;
>> +
>> +/*
>> + * struct amdxdna_dev_ops - Device hardware operation callbacks
>> + */
>> +struct amdxdna_dev_ops {
>> +    int (*init)(struct amdxdna_dev *xdna);
>> +    void (*fini)(struct amdxdna_dev *xdna);
>> +};
>> +
>> +/*
>> + * struct amdxdna_dev_info - Device hardware information
>> + * Record device static information, like reg, mbox, PSP, SMU bar 
>> index,
>
> The last "," is weird
Will fix it. Thanks.
>
>> + */
>> +struct amdxdna_dev_info {
>> +    int                reg_bar;
>> +    int                mbox_bar;
>> +    int                sram_bar;
>> +    int                psp_bar;
>> +    int                smu_bar;
>> +    int                device_type;
>> +    int                first_col;
>> +    u32                dev_mem_buf_shift;
>> +    u64                dev_mem_base;
>> +    size_t                dev_mem_size;
>> +    char                *vbnv;
>> +    const struct amdxdna_dev_priv    *dev_priv;
>> +    const struct amdxdna_dev_ops    *ops;
>> +};
>> +
>> +struct amdxdna_dev {
>> +    struct drm_device        ddev;
>> +    struct amdxdna_dev_hdl        *dev_handle;
>> +    const struct amdxdna_dev_info    *dev_info;
>> +
>> +    struct mutex            dev_lock; /* per device lock */
>> +};
>> +
>> +#endif /* _AMDXDNA_DRM_H_ */
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> new file mode 100644
>> index 000000000000..7d0cfd918b0e
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/module.h>
>> +
>> +#include "amdxdna_pci_drv.h"
>> +
>> +/*
>> + *  There are platforms which share the same PCI device ID
>> + *  but have different PCI revision IDs. So, let the PCI class
>> + *  determine the probe and later use the (device_id, rev_id)
>> + *  pair as a key to select the devices.
>> + */
>
> Huh?  So, VID == AMD, DID == 0x17f0, rev == 0x1 is a completely 
> different device?  That feels like a PCIe spec violation...
Maybe the comment is misleading. The hardware with same device id 0x17f0 
uses the same commands, registers etc. And they are same device with 
different revisions.
>
>> +static const struct pci_device_id pci_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_ANY_ID),
>> +        .class = PCI_CLASS_SP_OTHER << 8,
>
> Weird.  I would have expected the Accelerator class to be used
We contacted our hardware team to figure out why accelerator class is 
not used here. Some of hardware is already released. Hopefully hardware 
team may consider to use accelerator class with new products.
>
>> +        .class_mask = 0xFFFF00,
>> +    },
>> +    {0}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(pci, pci_ids);
>> +
>> +static const struct amdxdna_device_id amdxdna_ids[] = {
>> +    { 0x1502, 0x0,  &dev_npu1_info },
>> +    { 0x17f0, 0x0,  &dev_npu2_info },
>> +    { 0x17f0, 0x10, &dev_npu4_info },
>> +    { 0x17f0, 0x11, &dev_npu5_info },
>> +    {0}
>> +};
>> +
>
>> +module_pci_driver(amdxdna_pci_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
>> +MODULE_VERSION("0.1");
>
> This is redundant with the kernel version, no?  How are you going to 
> have different module versions for the same kernel version?
This is used in out of tree driver. It is meaningless for upstream. I 
will remove it.
>
>> +MODULE_DESCRIPTION("amdxdna driver");
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> new file mode 100644
>> index 000000000000..1b699464150e
>> --- /dev/null
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _UAPI_AMDXDNA_ACCEL_H_
>> +#define _UAPI_AMDXDNA_ACCEL_H_
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +#define AMDXDNA_DRIVER_MAJOR    1
>> +#define AMDXDNA_DRIVER_MINOR    0
>
> Drop these.

Sure.


Thanks,

Lizhi

>
>> +
>> +enum amdxdna_device_type {
>> +    AMDXDNA_DEV_TYPE_UNKNOWN = -1,
>> +    AMDXDNA_DEV_TYPE_KMQ,
>> +};
>> +
>> +#if defined(__cplusplus)
>> +} /* extern c end */
>> +#endif
>> +
>> +#endif /* _UAPI_AMDXDNA_ACCEL_H_ */
>
