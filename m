Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D998C9A48D6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65F510E9B5;
	Fri, 18 Oct 2024 21:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BuJQ5tcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D2510E9B4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjpadzG49RF2lg0l816Yq7iiczfQKd6eGkDW46q1rY3rTqmW3xYjo3xtrxsKumJAK3WBhQl6UuknAhd3Y/iuB59Kmdr95HyHzp9GJzYHQZ5bY06qikkP9BQjHGhe7AyPz/a1xRLuIXrQbIizb5jT8VM+z+mJSIBXvEImP3ZZkb3WoPXTtz9eK0zC3np5LJRYfUDCvenh8P+uauaNPMFKwSzduBcSADbYLGyj5xHfJ8j82iBozt74HQUbsRhfHXeLMjVXiPlD3dnN5mq3lld/+elYOwJLV735Tr1zdPcz7DqsswS7b4UneJ2+Zo8uCFjn0KTKFItPddTKag1FZ3M4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH28H5z84fKExMNKuFkiddNeNXjTo8a0qeWWOlBDBNY=;
 b=ruPlL2ZjzLPONvBNzhSu2ReJC4bL78Z7GOcWfyl3ELn/pokw7tuzAABIDRLfTa5leP0CVRyjGufbpDykEIG42xb+0BOozVuXtl1IJloHJeiCyILG4/8DKes5+JBNDaHYYA5lmLzBoHVj8fZgrq4MopeArriOWTl/qzd/3PFpDf8TPC1YT6nzjY3ZQHhP8W7oRyW9lzbdldeg+9rQEqWynO+HyzRJli8y0W7V8nNnMu1DxpCA4XgHs+cSTAAv5SkRIbkCfRuLBdAbGwJupyLfTQMXrSZ377ZHwwYS49LiQ8p/CqJhN7g5b/xVZGDMcD5+T26gcjaZhboDYiIbYmQfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH28H5z84fKExMNKuFkiddNeNXjTo8a0qeWWOlBDBNY=;
 b=BuJQ5tcVYCJeEFuX4ou2B81QtFa6OJHrON+ovCaxAQm8VOteNRvw0csJmCsa6Ao9mW9OrbYQ3abUBXrDtGIaM4QsWZY6DbW35nmtotJN9wNIIiO1LXHWlpldtdFOkGbtk6n6+VXiVc75LrJic0IAS7VnsirkJIRyHzRDDNyrAtM=
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Fri, 18 Oct
 2024 21:19:13 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::49) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Fri, 18 Oct 2024 21:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 21:19:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 16:19:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 16:19:11 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 16:19:10 -0500
Message-ID: <0fe13309-b0bb-6868-e1d2-2fa59f329b7b@amd.com>
Date: Fri, 18 Oct 2024 14:19:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 09/10] accel/amdxdna: Add error handling
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241011231244.3182625-1-lizhi.hou@amd.com>
 <20241011231244.3182625-10-lizhi.hou@amd.com>
 <1c16640f-0bc3-2692-910f-09ea5869a5b6@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1c16640f-0bc3-2692-910f-09ea5869a5b6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd7ccf5-41be-4a6c-4886-08dcefba834d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmhFODdxeDV5d1FKTGI0dUdicXkwUWdYQmxxeXdiNzU1K1d6OUZIVnlvRkFT?=
 =?utf-8?B?d2d5MVh6Wit1eEQrcm1aY01TRHlQaHVBNDRVL05UcmtibGhKSTA5U0o5NE5T?=
 =?utf-8?B?U2c2NnBLL203M1BoVW5KTEltOUc3a29EaVdRL2xhZDZXV2t5N3BUTU1iNXho?=
 =?utf-8?B?WjVtMkZmM012V2tUeFVJWGNaVExRVEFVZnZ6bGFSeXJSMDhtTVdHK0grVlFX?=
 =?utf-8?B?dDZGZHdlYnF3Rm5RMUE3OE9DZnl6amJPVmJTSFN3Z242VmNRN2ZQekJUbHNO?=
 =?utf-8?B?anVjMFhOOTVWQm43SlQ1VWlCbldxYkNZQ0ZHeUJVZXo0eHJuVElMcTEyeE1F?=
 =?utf-8?B?THJydi91bHBqemozM0Z1cnlYQ2J2dDhLK2hCU2wvYmFjUDRVQ3NrVVJHUnI2?=
 =?utf-8?B?dmc5ODAxOWxtRStZaUZzZnVIeWJHaGpoSzBXTmkzSmZrU01vb1RHWTU4bzNU?=
 =?utf-8?B?THk1aVRaL0JsVkdFUVp6WHhXOFR4ckZKaVpBOUltSGNPVC9ZTDhSSFp2R080?=
 =?utf-8?B?M2pmZG1vL1BwWGpUQ05UNVlwY3RTT0ZMdCtqSWU1cllVQllCbGFXUHlTNXVC?=
 =?utf-8?B?TE1nZmtkQm5rTVNxWFdXTGU1SDVSblRqWG00aHJHT2hpeWNhQmhpY1B3cjhK?=
 =?utf-8?B?cXlDak5OVFd3aDd0cG9mWlhLRVdSaXplZ3NOQUE2RzdzOTVxY21qSEtxNTBW?=
 =?utf-8?B?Y0tpc0FFZGhJOGZ5YjhsY2lja0lmYXZEekRnWnRESG52WCtsVFQyTmlORTQy?=
 =?utf-8?B?M2FyZXV0V0FxTGRCZC9HUVJNSHN5SmY3dVZjQTBkUlNVY3Q5aXJHbUtKblp5?=
 =?utf-8?B?K0VkU3FkR0dNUG9hbXhUQW1TTDNDK2NMZmhXU1VHYXA5aEY2Y01KVEh1OWdx?=
 =?utf-8?B?K1RmTEt5VnljMjMvNTZrbmFSdFhEcTk5bTlnMmtwV1A5YjhwRHFuTWgxcFlJ?=
 =?utf-8?B?bXJQL3RvZmxLLzBUMC80MERkRy9aSHVkNWhXUDZmOUlNWFVjR2tDUk00TjNL?=
 =?utf-8?B?QTVWYWhjZnAwbWg2QTlYcWozbHF1YldLN2kyejlKY2tKalhHWEVUVWhEeG1u?=
 =?utf-8?B?QjBjbWJ0WC8vVFl2cXZwb1ZoT0hnbWo5YkVRUmk0TU55S2tDb3ZHYTFkSGtP?=
 =?utf-8?B?ODlRbzEvRDMrNThHa0YxUXVEb3YzSlZwK3Z3SDdMNzA2Q0tKd1VQUTNXQ08x?=
 =?utf-8?B?bFdEYS9PVldtczJqRFdXczhGVlljMkFOWFlBbiswb0tqeHFNc2NVZGI0Y0M5?=
 =?utf-8?B?Q01xdjBKS0dkQnhvL2p0K2lyOXEzWHFva0xMOXVEaWd0cHdBWjZnVG9MbWVM?=
 =?utf-8?B?cHJycnJHcC8xUTlOMjUyQ0ZYeXkxZFNXbU9mUDZDVDFoaWwvYklYWnVRbXM2?=
 =?utf-8?B?aEVuQTRoUzNjSlhtak9RVkJBem5sZ0dwb3VxSjFXdXQwVlk4a1doZ0hMb3dz?=
 =?utf-8?B?UlAvU1lhOXpBU0x6TFZaU3poWWJMenpJcjJWczcwZlZXWGpoZVlzVGxQMTdy?=
 =?utf-8?B?S0pia2NNL2hreVJPUEttNnlwdzFFZ2lYMStWMjZDTGRBeDhqakxuK3loWkpJ?=
 =?utf-8?B?Mnh3RXRUSVIydC8xWWVnQkN1QVdyN0hpZFdOcGVLT3Y2TzhOWW5iaG5iNXA4?=
 =?utf-8?B?NGtUc3dlS1ZhZ2FnaFpVV0YvRlB1Wm8xVW5oUC9HUllBdGorZjlNbWtiaWNL?=
 =?utf-8?B?RHhiUk45dm14TjloUkRNMENyNGR1SlB2cG9abUhzYUtMYU51VHp4NHNrdUIx?=
 =?utf-8?B?R3h6QW5mZlBNWW1XSXcrV0RGdU80UEcwRGZVOUxjWVFYV0Nua1NpZms5T2Jj?=
 =?utf-8?B?QzZ3bVFBL3g3UGZ1QkFDNkw1cEV1Q3lGRG5rWXRURUdSUzhtREpNMll5SjY4?=
 =?utf-8?B?eUpBTnJNN2hKT3NzN2gxaEpPa0FJY1FzT3M2aVBZZjczQWc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 21:19:12.4978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd7ccf5-41be-4a6c-4886-08dcefba834d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207
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


On 10/18/24 14:01, Jeffrey Hugo wrote:
> On 10/11/2024 5:12 PM, Lizhi Hou wrote:
>> When there is a hardware error, the NPU firmware notifies the host 
>> through
>> a mailbox message. The message includes details of the error, such as 
>> the
>> tile and column indexes where the error occurred.
>>
>> The driver starts a thread to handle the NPU error message. The thread
>> stops the clients which are using the column where error occurred. Then
>> the driver resets that column.
>>
>> Co-developed-by: Min Ma<min.ma@amd.com>
>> Signed-off-by: Min Ma<min.ma@amd.com>
>> Signed-off-by: Lizhi Hou<lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/Makefile       |   1 +
>>   drivers/accel/amdxdna/aie2_error.c   | 356 +++++++++++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_message.c |  19 ++
>>   drivers/accel/amdxdna/aie2_pci.c     |  32 +++
>>   drivers/accel/amdxdna/aie2_pci.h     |   9 +
>>   5 files changed, 417 insertions(+)
>>   create mode 100644 drivers/accel/amdxdna/aie2_error.c
>>
>> diff --git a/drivers/accel/amdxdna/Makefile 
>> b/drivers/accel/amdxdna/Makefile
>> index a688c378761f..ed6f87910880 100644
>> --- a/drivers/accel/amdxdna/Makefile
>> +++ b/drivers/accel/amdxdna/Makefile
>> @@ -2,6 +2,7 @@
>>     amdxdna-y := \
>>       aie2_ctx.o \
>> +    aie2_error.o \
>>       aie2_message.o \
>>       aie2_pci.o \
>>       aie2_psp.o \
>> diff --git a/drivers/accel/amdxdna/aie2_error.c 
>> b/drivers/accel/amdxdna/aie2_error.c
>> new file mode 100644
>> index 000000000000..d2787549f3b7
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_error.c
>> @@ -0,0 +1,356 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/drm_cache.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/gpu_scheduler.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/kthread.h>
>> +#include <linux/kernel.h>
>> +
>> +#include "aie2_msg_priv.h"
>> +#include "aie2_pci.h"
>> +#include "amdxdna_mailbox.h"
>> +#include "amdxdna_pci_drv.h"
>> +
>> +struct async_event {
>> +    struct amdxdna_dev_hdl        *ndev;
>> +    struct async_event_msg_resp    resp;
>> +    struct workqueue_struct        *wq;
>> +    struct work_struct        work;
>> +    u8                *buf;
>> +    dma_addr_t            addr;
>> +    u32                size;
>> +};
>> +
>> +struct async_events {
>> +    struct workqueue_struct        *wq;
>> +    u8                *buf;
>> +    dma_addr_t            addr;
>> +    u32                size;
>> +    u32                event_cnt;
>> +    struct async_event        event[] __counted_by(event_cnt);
>> +};
>> +
>> +/*
>> + * Below enum, struct and lookup tables are porting from XAIE util 
>> header file.
>> + *
>> + * Below data is defined by AIE device and it is used for decode 
>> error message
>> + * from the device.
>> + */
>> +
>> +enum aie_module_type {
>> +    AIE_MEM_MOD = 0,
>> +    AIE_CORE_MOD,
>> +    AIE_PL_MOD,
>> +};
>> +
>> +enum aie_error_category {
>> +    AIE_ERROR_SATURATION = 0,
>> +    AIE_ERROR_FP,
>> +    AIE_ERROR_STREAM,
>> +    AIE_ERROR_ACCESS,
>> +    AIE_ERROR_BUS,
>> +    AIE_ERROR_INSTRUCTION,
>> +    AIE_ERROR_ECC,
>> +    AIE_ERROR_LOCK,
>> +    AIE_ERROR_DMA,
>> +    AIE_ERROR_MEM_PARITY,
>> +    /* Unknown is not from XAIE, added for better category */
>> +    AIE_ERROR_UNKNOWN,
>> +};
>> +
>> +/* Don't pack, unless XAIE side changed */
>> +struct aie_error {
>> +    u8            row;
>> +    u8            col;
>> +    u32            mod_type;
>> +    u8            event_id;
>> +};
>
> This looks like it is a structure to decode data from an external 
> device.  Assuming that is so, the wrong types are used here. Should be 
> the "__" types like "__u8", no?  Normal u8, etc are kernel internal 
> only types.

Yes, you are correct. I will fix this.


Thanks,

Lizhi

>
>> +
>> +struct aie_err_info {
>> +    u32            err_cnt;
>> +    u32            ret_code;
>> +    u32            rsvd;
>> +    struct aie_error    payload[] __counted_by(err_cnt);
>> +};
>> +
>> +struct aie_event_category {
>> +    u8            event_id;
>> +    enum aie_error_category category;
>> +};
>
