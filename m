Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E189923C3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 07:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D085510E0E5;
	Mon,  7 Oct 2024 05:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hJPpaRt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BC410E0E5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 05:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SO6IAPmYKV0XYaOxGFIHIFGXNx8jQ4Wp6+40gEQqmC147wagWE3tOvJTkVNvxzJ1qxpeP7cw6zI8/Se3cGfiD0r5SoYr2lrKrr6w4ZSkmh1xhDcBf3DZq8/6AN8TvDl7EMF6YiBgknBGsvT1e8UvqBFTXkWOu5UDAEUVdWPfjinrh5AhEv9B2aanYnAMd2sS7W7cStCc4LLcrHxxEYp1bGSg4XZ2r4FvoixRuSjQ87ppaSLBZYGkiH6jUz5+UpgO61Nvbz8cMcN5tvDVbjwcIqGtQlkOqUVn5olIB2dsbMhO83C2YK6X31Yj0oTuYUtZbwmMxlts4Wi/Wnxoc76BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE9691sSOo450XbTsuvt/W24suWrMy5aD0R2TTZiv+g=;
 b=g/dzrurKfmKt67GA0/mMqi76IzBd4LS5iZEhLfUJAfspDe01xTZUhqKe8El+Bg20Ee5ag2ALbFOH0uDWBzz3H/5FsM1QaXZ0M76gKq7ek7C8tGh06qIDSnzB2rl/GNkVb86PHP2A1X1020y/tf/U53c3xPYFIqmw4I+Kq/DJhz3hHVX9usM8nY55LjwdPN7F+JKQ4szwbIe+lDc1f82VfSEBJV6aPX1Hyy5dGozZ5kEOYGj73YIupbRj268TNbzS4tKAWTmNRh9OYidquwBRCjuqkl/MABjZGgjdN5nWglslB473HDWjqy5EOeViZiODbaOPiqRNOaVA8zCNUxiKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zE9691sSOo450XbTsuvt/W24suWrMy5aD0R2TTZiv+g=;
 b=hJPpaRt6x92/AfSdqSPHVTgxuihkzzShSvJQqiKNJ2bGCFZcSP1Jnk7RD98BFBvxQbk6k7ZlYX3M1hYcy4DqcZyqg3WTtOtxpk36KhTGX365tf1FcLBoXqu0L5FZdOIl0SnRISLxXy0zcM21AmmSfZpzPlKTmGfNtEGcYvXkfZI=
Received: from MN0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:52c::9)
 by PH8PR12MB6819.namprd12.prod.outlook.com (2603:10b6:510:1ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Mon, 7 Oct
 2024 05:04:15 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::16) by MN0PR05CA0007.outlook.office365.com
 (2603:10b6:208:52c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Mon, 7 Oct 2024 05:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 05:04:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 00:02:53 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 00:02:53 -0500
Message-ID: <8347abb4-7c9a-416c-4837-29e78fd715f0@amd.com>
Date: Sun, 6 Oct 2024 22:02:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 05/11] accel/amdxdna: Add hardware context
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-6-lizhi.hou@amd.com>
 <c1f92388-bd94-ebc2-dd59-0434a3fa63a6@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c1f92388-bd94-ebc2-dd59-0434a3fa63a6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|PH8PR12MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b0ddef-f882-4f51-1392-08dce68d7db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVBXNGtXOGVnNmlabnFSUjZTdHMzYm9VaVpmbHpDa0ZET1JTektUTVlWNVRI?=
 =?utf-8?B?amNLTjFnNklncUFEb0U0ZjdpSnhVcW9JcWptRlhwbFdna2RGQnVNbDJzVzRi?=
 =?utf-8?B?ejVKREdBaGYwS3lZc3NHcnR1MWVkZW04Y3ZMd29MOXhQMEdxSU5iWGJWalNS?=
 =?utf-8?B?M0k4dlp3YlN3amZrUFFNWmNkTDJKcUFuS2l0eEhwWStJa0NMUTROQXorWmdH?=
 =?utf-8?B?dE80ZTdISTN2YjNpYjFFMFNGb1NrMXNzQXNpYzVIT2pQWkNMZUNTZVdFaitO?=
 =?utf-8?B?MGZoNVBFQU1TZW1SOFA4OXhWYzU5ZWJGWkhoVENDRTJieVlnVDdNNGJwcHZK?=
 =?utf-8?B?Uy8zWnFlS0RmVnZjWFg3anJQdkZVSnBiK0E0ZGFXZEFGeUdSUjIrTThzY1ZV?=
 =?utf-8?B?d05heXFGWEpOMnppV2V4d0p6cjFqR3RnckJ5K01DcmNOZUJuOWxoNmprRCtk?=
 =?utf-8?B?WUw3dEhkb3E4bW93MzVRUjJ4by9ZWW1kQXVzcmcxeHA5bG5FUnFyRkRtWDRM?=
 =?utf-8?B?dFVZMFpLdGo1TmRRdlBrWWRUeXhyU2dESHVIUEprRnJBQmNOWm5LM0IyNC9R?=
 =?utf-8?B?K29YMzZiTURFeHZkTGRNMlV5RkdBakxjeElJWjZJRlZVbysvc1JVNDlWMkYv?=
 =?utf-8?B?Q0c4dVRtck5QcXhMRGIwVU9QZHVXQWFQU1A2ZzNPNXdZVVd6RHZISUpNUVph?=
 =?utf-8?B?c2liMlJSd3VJeElmVVROWXlyUE0vTW02SXEwUTVZVWxsbmdpejVTbHk3MlVk?=
 =?utf-8?B?RFJlck4zK3BjS2tJYlEyallxRS9rMmFENStpOGliOGpTV3BqRi85eW0zQTJu?=
 =?utf-8?B?cnhQWTl4bUU3REFSYVE4OGNYR2tVNTR4R1lHYVdzY0JkdU5sNUJwcjFwbjNT?=
 =?utf-8?B?US94TUVnbmg2R0JSYXNOVmxWbm9Ua05qNklxSDlyMWFrRmxrQk9CcEZ4dmhZ?=
 =?utf-8?B?czZvUDRmbzlLcDBBM1liWWNva2xTL2xuYlRueXRLMEhkWHFmMURmaVJqbUFD?=
 =?utf-8?B?NExSc0tOWVNLdyswWkM0WXZKMmIyTm9sMWMyY1doM211YmM0S0hEVUh5SWxG?=
 =?utf-8?B?OHpvZXgvOTQrRitFMmZOVFpnNjBpcTdBeURBdzJBUTBNb3h4bGw3Z3RkOUlI?=
 =?utf-8?B?c2pvTEsyckl3OElhbVFHZlF0S2hWdjNyMDRUSzdSbmR0TjUwRzVUeWJwL1dM?=
 =?utf-8?B?UG0xTUd6V1lNcUxrbmdBeWNwVm5sRnFtaFc4a3JmdFlpVUxEamZQVnRSMmpZ?=
 =?utf-8?B?ckgxYW95Qm1Wcm5tcTNnR21PVGJVMy9aWmI3MjF0RkhLNHNETGdKVWd3L0Iw?=
 =?utf-8?B?RVowbnVnTzNjS1c4R0dWV0k3cHpZaDZJSjBYOUVHRVRvVW5KUDBmT3ZYS0dQ?=
 =?utf-8?B?RjN2bWg3L3ZIeFV1diswd3J3VWJxS0pGbnVlZ3dGbTM5d3F2Q0xMN1liM0I3?=
 =?utf-8?B?dHI1UFl4aDBIeVZUZy9vRFpoc2FrMkdxamU0Qys3NVVnUmF6SE94TnNTZmIz?=
 =?utf-8?B?WmpPTjh4dkdyQmwrRmUvQ3JuK3hraG5JWWpUUUJkMVNsM2M0M3dsci9Mckla?=
 =?utf-8?B?akg3ZDlSR0ZwMGlIbTR4YnNQQTBGQXZNWTZESFROcG9hS2pBY3FyWFZtT1cv?=
 =?utf-8?B?UHdrLzRIZk1ka00vcWhkTzFTNlVrdHRnRnJrVWZEUXhpR3Nwc1JsbTBZTWRJ?=
 =?utf-8?B?VE11NmFEdGdxaE9YK1M5UWtEd3BvTlkvcXZ6Z0h6b2t5OVU3Rm5XV2t0ZkQ4?=
 =?utf-8?B?OWxUU2hHcGNjam8zVXB1YUEwalNVczk4VXNuYnRkd1hiYlB4b3p4QWdDSkdT?=
 =?utf-8?Q?hJ+Ri0qtKw/NoZrViOY7+7uL8fe4tagYj9AKc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 05:04:15.2742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b0ddef-f882-4f51-1392-08dce68d7db2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6819
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


On 10/4/24 10:50, Jeffrey Hugo wrote:
> On 9/11/2024 12:05 PM, Lizhi Hou wrote:
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> new file mode 100644
>> index 000000000000..52a71661f887
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -0,0 +1,186 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/amdxdna_accel.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include <linux/types.h>
>> +
>> +#include "amdxdna_ctx.h"
>> +#include "amdxdna_mailbox.h"
>> +#include "amdxdna_pci_drv.h"
>> +#include "aie2_pci.h"
>> +#include "aie2_solver.h"
>
> Alphabetical order?
>
> <snip>
>> +/**
>> + * struct amdxdna_drm_create_hwctx - Create hardware context.
>> + * @ext: MBZ.
>> + * @ext_flags: MBZ.
>> + * @qos_p: Address of QoS info.
>> + * @umq_bo: BO handle for user mode queue(UMQ).
>> + * @log_buf_bo: BO handle for log buffer.
>> + * @max_opc: Maximum operations per cycle.
>> + * @num_tiles: Number of AIE tiles.
>> + * @mem_size: Size of AIE tile memory.
>> + * @umq_doorbell: Returned offset of doorbell associated with UMQ.
>> + * @handle: Returned hardware context handle.
>> + * @pad: MBZ.
>
> You specify must be zero, but I don't see that checked anywhere.

Ok. I did not see any driver checks structure pad. And pad should not be 
used. I will remove MBZ for pad.


Thanks,

Lizhi

>
>> + */
>> +struct amdxdna_drm_create_hwctx {
>> +    __u64 ext;
>> +    __u64 ext_flags;
>> +    __u64 qos_p;
>> +    __u32 umq_bo;
>> +    __u32 log_buf_bo;
>> +    __u32 max_opc;
>> +    __u32 num_tiles;
>> +    __u32 mem_size;
>> +    __u32 umq_doorbell;
>> +    __u32 handle;
>> +    __u32 pad;
>> +};
