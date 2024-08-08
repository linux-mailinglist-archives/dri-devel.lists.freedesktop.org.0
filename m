Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB494C6E0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 00:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E5810E828;
	Thu,  8 Aug 2024 22:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HmMfZEKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044A310E825
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 22:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzyZoaddDY+2lnLPNmq+vbimi2hr6fGJWKYcKxscKeaFK/ISfVG+GrJzqJh9VABaMO9O3S1OGmH4Ab6c589y1aYMYFEt4mv8TQSAOtzCNrusdfAgy74duCr8NfU2LuG0ZPYxrSaxo8LzCgKPT5rOHZTocpbUyVPIs207GrhB4rm/kzOhp1Ie/sD1mvrrgSgeoOqiRK821/j6GLzB+UN63HMk2Cny2X55/v+sYi9OwxsyPYDawVpGSjsr79D2gSXKEmaFx7nGUyWNYRtd9tiXcOWC0/5Xu9+jUjlNBvc0DJ1UZfjBSzzpBOTCKDq+jYn8fHvhxXyZ49sigFz1DfTUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEAmBOPfE/xpPb4YehvAWIa6Onn3G8sPu8d/RVZy3T4=;
 b=dX6IrF+YEktZrDgfWzXqKfDfJaLDvhX++na5LHiDvmoGB1lnaLsXgtEYygAY6v09pi0nDzf0x4+uvj4Jv8y8tHZXYTXOJjChO1kvZgRBUhbmnkSVw1vEsrYKUkELc7QXg77w5AIoWLVQXXcl9qqwyiDumdL7i/lxg6C+Xo/4ZQMnLp6nop0KLFaXte3Q1dP3adcdSa2+9Wa/0Bo+RofRCzsw5gGMLt3bgnomLM4jU4OdM40GPWjVFdx83tAQR4HKJOsOoVahh6Sj36/+DPlme3rCMi5iekmH7SjJieDQBH7wrRMQg6tS8LNrSg4cUdHCdS7KIaPa7dBFv0Sax90SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEAmBOPfE/xpPb4YehvAWIa6Onn3G8sPu8d/RVZy3T4=;
 b=HmMfZEKK/Naitk2tJJSAOX+J4b7EtUm8cbPyc87gA2fb2lHztVkNEHkA/I4hjwWZYefi2pXBoLaIPV5oUnIh1/nqcfwaaCK3mWhjV3kGZyxQ6x3laBKiuTmwfELascUC9YoZUDcRCCfbLEOEh5SS33Gt11bFQTaD+SABEKwGDEc=
Received: from PH8PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:2cf::12)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 22:15:24 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::21) by PH8PR07CA0044.outlook.office365.com
 (2603:10b6:510:2cf::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 22:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 22:15:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 17:15:23 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 17:15:22 -0500
Message-ID: <004f2113-d9c2-13d3-56b8-7fbfb7853d92@amd.com>
Date: Thu, 8 Aug 2024 15:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 04/10] accel/amdxdna: Add hardware context
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-5-lizhi.hou@amd.com>
 <CADnq5_NjrhE2z1+gvYmYqa36QHhjvVR9d=iCDOzVNMKODQ7c9w@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_NjrhE2z1+gvYmYqa36QHhjvVR9d=iCDOzVNMKODQ7c9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: a49ba762-c561-4033-1006-08dcb7f799ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T09FTThua2ozaldVa0x4b0xCL0ZxdkVoa0Z4LzhQS2NMeXNjMUNPMTduTFUw?=
 =?utf-8?B?aGVxNlJmRFF3SU1QTE9kR1BHMkYrYjR4RzV0SVJvc1VVazAzWmFBdVFrTDFE?=
 =?utf-8?B?NktKWFlqNTNSVTBpY1JoeXJUMTBsZ1pycWtPVFArWVhHMlZQYUNwTCtiWncv?=
 =?utf-8?B?eFVHR3BsR2tsQ2lrNnYvd0lUWWhQT2E4NTIxdGxjSVdSdG1ZbkVRc1NraElo?=
 =?utf-8?B?cmJjT1U1VlpGSzRUR3hIbk15czg3TFphMUtDck9qcE0vYzNzMGIzM1VLbVdt?=
 =?utf-8?B?N3ZHYXFqZ2RWbFQrZXF2MHNISmh3VDB2OU9hWDRtQlR2Nm1aRlpLWlFIZ0t2?=
 =?utf-8?B?ODg5cTFiOGRBSytRR2pwRjlQSXRlNkZBYnRUVURXNXhSYUlvNG1UMnpmczJj?=
 =?utf-8?B?anpaNHYwM1dkMHlsWUp2RG1xQVN2OGJhL0lmeUl2Ylh4bWRHYVNGb0J0Y0Ez?=
 =?utf-8?B?TGh1cmYzVTFoaWEva05Oa0ZuWEZmRWIxVEhYSkZNcUFTdkIrWkdpbDIyUjZB?=
 =?utf-8?B?OHA3dmhsczdVU1hNbmFOa0N6RWFMVTBCUE1GdTlZQ0RqV1FQK3UvZVcrTTVq?=
 =?utf-8?B?Q2hFYU1GZm1ZOFlxZURtRFRGbTUzS2p2bzcwWjliVVRpc21vTXRwbXdqSER4?=
 =?utf-8?B?ZE5uaUhzRTQ4YWppdWwwbzJvTjZBMXJtQUtvY3JzMngxSVNiZnlGbkw0SHNk?=
 =?utf-8?B?U2lRUFBkZlNIb1VsWkp5UG10OGROUWREYnEzdU5Kb2JqZ2pVRndwUGJvUmZT?=
 =?utf-8?B?dlVVV3ZvNjB6THpzaWU3NnY4VmlnQStQblB0UXFleHBlZnlnZkZjZncxV245?=
 =?utf-8?B?RjJTUlVKNlloRnRHa2ZJTFJCaGRiNVdjQi8yRStLZko3eWZYeDlhN2h1djJ3?=
 =?utf-8?B?aExaZDhnUTRQMkFDc3ZaYnJkZmhMaFhCdGtkZlZHZnJBbTBtYzFkb2VnM0kx?=
 =?utf-8?B?RTF5QXc3bFIxYmtFeWdLVjc0R2s5K2JkWE5qMFJaQ3BJc1V6b05qZmlyUkFI?=
 =?utf-8?B?ZlUvTXpSc0p4QmZCVEJ2OWcyQm5EM2NROUJUdm8rbXptamtPcXVwbHEwSlRS?=
 =?utf-8?B?UUU0U2FQV21yZ1lIZHV3YThEQmw5K0s4T2Z2Q3p2NW82UjJqQXh5SHdZclhM?=
 =?utf-8?B?ZmR4S2tsdFpDcEtxV2Q2akttZ1dPemxXbUg0MTR1S2lBYUtCOXdOZHFTRU5i?=
 =?utf-8?B?MXQ0blNFRzU0UGFUSDRZQzNoZWpOUzZlSmY5K0pJbldIUkRaWjAxdlFyTWhR?=
 =?utf-8?B?TTVFRzlnQWlHUkNpRjZZRTNjVmJ0NlNyRWdLU2FqdEJNVkJwRndTSmVObDRw?=
 =?utf-8?B?ZjlPbnZQSGM0bHZGK0dkd01QYkJzYjFwR0lNSE1uWEE1VFVJTWhyTmxJdzRs?=
 =?utf-8?B?VXFCa21xN25YejR2OG5JTTRyRWxjL0RJRmh5L0M3K1B1Q3p1RUtMWmRkdlNK?=
 =?utf-8?B?Wktuang1RkRvTWJrMTlKR01IdHZXMGo5VzZsUGEzTjgwa3RneHNSMG9YVXFU?=
 =?utf-8?B?S2lsMnEzV1Yva2o0d1JsaTY5RjFxMXZwYTRVWVdIN3dHR3JOYUQ5M2krSnVX?=
 =?utf-8?B?bTNETlc1dFFLeDlzT1gxcFpack11NlFZcUtJVFgwWnFJMkdXM2ZTUVlnSGht?=
 =?utf-8?B?ZHRTRmlVVTBkSlJEQWlleW1vdnArZkpTYUVHUS83eHcvTzZjbURSalJLL3JI?=
 =?utf-8?B?Sm5GMkEyNHJ4RkY5em1XdVROZlpVa1RuUzU4SC9ab3U2eFVrVS9wRllSV0Fm?=
 =?utf-8?B?RjRzOWlPbUZ4Zi9XSXpxcFphSFFGaDcwTnI4eGNzeTliTDRQcU5GYnRGYUNJ?=
 =?utf-8?B?aGFKcWZ3RExobEplcitEd1VEQWllODZ4dUVFUFhyYmJTbTNUQ0pXKzkxQjF2?=
 =?utf-8?B?bUFtNTFpczFIN0h0YXIvQUIzNWZvVVM1L2JVKzN2VXJkc2ZLRkZtYjg5Wkx6?=
 =?utf-8?Q?PATKlX85Ae4Q6oIM5u4FpTcvNVspixKA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 22:15:24.2854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a49ba762-c561-4033-1006-08dcb7f799ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
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


On 8/8/24 14:34, Alex Deucher wrote:
> On Mon, Aug 5, 2024 at 1:50 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>> The hardware can be shared among multiple user applications. The
>> hardware resources are allocated/freed based on the request from
>> user application via driver IOCTLs.
>>
>> DRM_IOCTL_AMDXDNA_CREATE_HWCTX
>> Allocate tile columns and create a hardware context structure to track the
>> usage and status of the resources. A hardware context ID is returned for
>> XDNA command execution.
>>
>> DRM_IOCTL_AMDXDNA_DESTROY_HWCTX
>> Release hardware context based on its ID. The tile columns belong to
>> this hardware context will be reclaimed.
>>
>> DRM_IOCTL_AMDXDNA_CONFIG_HWCTX
>> Config hardware context. Bind the hardware context to the required
>> resources.
>>
>> Co-developed-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/Makefile          |   2 +
>>   drivers/accel/amdxdna/aie2_ctx.c        | 178 ++++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_message.c    |  87 ++++++++++
>>   drivers/accel/amdxdna/aie2_pci.c        |  41 +++++
>>   drivers/accel/amdxdna/aie2_pci.h        |  12 ++
>>   drivers/accel/amdxdna/amdxdna_ctx.c     | 210 ++++++++++++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_ctx.h     |  41 +++++
>>   drivers/accel/amdxdna/amdxdna_drm.c     | 107 +++++++++++-
>>   drivers/accel/amdxdna/amdxdna_drm.h     |  21 +++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  15 ++
>>   include/uapi/drm/amdxdna_accel.h        | 128 +++++++++++++++
>>   11 files changed, 841 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>>
>> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
>> index b44de7fe0c9e..9cf90e92564d 100644
>> --- a/drivers/accel/amdxdna/Makefile
>> +++ b/drivers/accel/amdxdna/Makefile
>> @@ -1,11 +1,13 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>
>>   amdxdna-y := \
>> +       aie2_ctx.o \
>>          aie2_message.o \
>>          aie2_pci.o \
>>          aie2_psp.o \
>>          aie2_smu.o \
>>          aie2_solver.o \
>> +       amdxdna_ctx.o \
>>          amdxdna_drm.o \
>>          amdxdna_mailbox.o \
>>          amdxdna_mailbox_helper.o \
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
>> new file mode 100644
>> index 000000000000..2cfcf9d571f6
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -0,0 +1,178 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include "aie2_pci.h"
>> +#include "aie2_solver.h"
>> +
>> +static int aie2_hwctx_col_list(struct amdxdna_hwctx *hwctx)
>> +{
>> +       struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +       struct amdxdna_dev_hdl *ndev;
>> +       int start, end, first, last;
>> +       u32 width = 1, entries = 0;
>> +       int i;
>> +
>> +       if (!hwctx->num_tiles) {
>> +               XDNA_ERR(xdna, "Number of tiles is zero");
>> +               return -EINVAL;
>> +       }
>> +
>> +       ndev = xdna->dev_handle;
>> +       if (unlikely(!ndev->metadata.core.row_count)) {
>> +               XDNA_WARN(xdna, "Core tile row count is zero");
>> +               return -EINVAL;
>> +       }
>> +
>> +       hwctx->num_col = hwctx->num_tiles / ndev->metadata.core.row_count;
>> +       if (!hwctx->num_col || hwctx->num_col > ndev->total_col) {
>> +               XDNA_ERR(xdna, "Invalid num_col %d", hwctx->num_col);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (ndev->priv->col_align == COL_ALIGN_NATURE)
>> +               width = hwctx->num_col;
>> +
>> +       /*
>> +        * In range [start, end], find out columns that is multiple of width.
>> +        *      'first' is the first column,
>> +        *      'last' is the last column,
>> +        *      'entries' is the total number of columns.
>> +        */
>> +       start =  xdna->dev_info->first_col;
>> +       end =  ndev->total_col - hwctx->num_col;
>> +       if (start > 0 && end == 0) {
>> +               XDNA_DBG(xdna, "Force start from col 0");
>> +               start = 0;
>> +       }
>> +       first = start + (width - start % width) % width;
>> +       last = end - end % width;
>> +       if (last >= first)
>> +               entries = (last - first) / width + 1;
>> +       XDNA_DBG(xdna, "start %d end %d first %d last %d",
>> +                start, end, first, last);
>> +
>> +       if (unlikely(!entries)) {
>> +               XDNA_ERR(xdna, "Start %d end %d width %d",
>> +                        start, end, width);
>> +               return -EINVAL;
>> +       }
>> +
>> +       hwctx->col_list = kmalloc_array(entries, sizeof(*hwctx->col_list), GFP_KERNEL);
>> +       if (!hwctx->col_list)
>> +               return -ENOMEM;
>> +
>> +       hwctx->col_list_len = entries;
>> +       hwctx->col_list[0] = first;
>> +       for (i = 1; i < entries; i++)
>> +               hwctx->col_list[i] = hwctx->col_list[i - 1] + width;
>> +
>> +       print_hex_dump_debug("col_list: ", DUMP_PREFIX_OFFSET, 16, 4, hwctx->col_list,
>> +                            entries * sizeof(*hwctx->col_list), false);
>> +       return 0;
>> +}
>> +
>> +static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
>> +{
>> +       struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +       struct alloc_requests *xrs_req;
>> +       int ret;
>> +
>> +       xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
>> +       if (!xrs_req)
>> +               return -ENOMEM;
>> +
>> +       xrs_req->cdo.start_cols = hwctx->col_list;
>> +       xrs_req->cdo.cols_len = hwctx->col_list_len;
>> +       xrs_req->cdo.ncols = hwctx->num_col;
>> +       xrs_req->cdo.qos_cap.opc = hwctx->max_opc;
>> +
>> +       xrs_req->rqos.gops = hwctx->qos.gops;
>> +       xrs_req->rqos.fps = hwctx->qos.fps;
>> +       xrs_req->rqos.dma_bw = hwctx->qos.dma_bandwidth;
>> +       xrs_req->rqos.latency = hwctx->qos.latency;
>> +       xrs_req->rqos.exec_time = hwctx->qos.frame_exec_time;
>> +       xrs_req->rqos.priority = hwctx->qos.priority;
>> +
>> +       xrs_req->rid = (uintptr_t)hwctx;
>> +
>> +       ret = xrs_allocate_resource(xdna->xrs_hdl, xrs_req, hwctx);
>> +       if (ret)
>> +               XDNA_ERR(xdna, "Allocate AIE resource failed, ret %d", ret);
>> +
>> +       kfree(xrs_req);
>> +       return ret;
>> +}
>> +
>> +static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>> +{
>> +       struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +       int ret;
>> +
>> +       ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>> +       if (ret)
>> +               XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>> +}
>> +
>> +int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>> +{
>> +       struct amdxdna_client *client = hwctx->client;
>> +       struct amdxdna_dev *xdna = client->xdna;
>> +       struct amdxdna_hwctx_priv *priv;
>> +       int ret;
>> +
>> +       priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +       hwctx->priv = priv;
>> +
>> +       ret = aie2_hwctx_col_list(hwctx);
>> +       if (ret) {
>> +               XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
>> +               goto free_priv;
>> +       }
>> +
>> +       ret = aie2_alloc_resource(hwctx);
>> +       if (ret) {
>> +               XDNA_ERR(xdna, "Alloc hw resource failed, ret %d", ret);
>> +               goto free_col_list;
>> +       }
>> +
>> +       hwctx->status = HWCTX_STAT_INIT;
>> +
>> +       XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
>> +
>> +       return 0;
>> +
>> +free_col_list:
>> +       kfree(hwctx->col_list);
>> +free_priv:
>> +       kfree(priv);
>> +       return ret;
>> +}
>> +
>> +void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>> +{
>> +       aie2_release_resource(hwctx);
>> +
>> +       kfree(hwctx->col_list);
>> +       kfree(hwctx->priv);
>> +       kfree(hwctx->cus);
>> +}
>> +
>> +int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size)
>> +{
>> +       struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +
>> +       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +       switch (type) {
>> +       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
>> +       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
>> +       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
>> +               return -EOPNOTSUPP;
>> +       default:
>> +               XDNA_DBG(xdna, "Not supported type %d", type);
>> +               return -EOPNOTSUPP;
>> +       }
>> +}
>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
>> index 71df005b7408..54fb0f68587a 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -185,3 +185,90 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
>>
>>          return 0;
>>   }
>> +
>> +int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>> +{
>> +       DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
>> +       struct amdxdna_dev *xdna = ndev->xdna;
>> +       struct xdna_mailbox_chann_res x2i;
>> +       struct xdna_mailbox_chann_res i2x;
>> +       struct cq_pair *cq_pair;
>> +       u32 intr_reg;
>> +       int ret;
>> +
>> +       req.aie_type = 1;
>> +       req.start_col = hwctx->start_col;
>> +       req.num_col = hwctx->num_col;
>> +       req.num_cq_pairs_requested = 1;
>> +       req.pasid = hwctx->client->pasid;
>> +       req.context_priority = 2;
>> +
>> +       ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> +       if (ret)
>> +               return ret;
>> +
>> +       hwctx->fw_ctx_id = resp.context_id;
>> +       WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>> +
>> +       cq_pair = &resp.cq_pair[0];
>> +       x2i.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.head_addr);
>> +       x2i.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.tail_addr);
>> +       x2i.rb_start_addr   = AIE2_SRAM_OFF(ndev, cq_pair->x2i_q.buf_addr);
>> +       x2i.rb_size         = cq_pair->x2i_q.buf_size;
>> +
>> +       i2x.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->i2x_q.head_addr);
>> +       i2x.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->i2x_q.tail_addr);
>> +       i2x.rb_start_addr   = AIE2_SRAM_OFF(ndev, cq_pair->i2x_q.buf_addr);
>> +       i2x.rb_size         = cq_pair->i2x_q.buf_size;
>> +
>> +       ret = pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
>> +       if (ret == -EINVAL) {
>> +               XDNA_ERR(xdna, "not able to create channel");
>> +               goto out_destroy_context;
>> +       }
>> +
>> +       intr_reg = i2x.mb_head_ptr_reg + 4;
>> +       hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
>> +                                                             intr_reg, ret);
>> +       if (!hwctx->priv->mbox_chann) {
>> +               XDNA_ERR(xdna, "not able to create channel");
>> +               ret = -EINVAL;
>> +               goto out_destroy_context;
>> +       }
>> +
>> +       XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
>> +                hwctx->name, ret, resp.msix_id);
>> +       XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
>> +                hwctx->fw_ctx_id, hwctx->client->pasid);
>> +
>> +       return 0;
>> +
>> +out_destroy_context:
>> +       aie2_destroy_context(ndev, hwctx);
>> +       return ret;
>> +}
>> +
>> +int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>> +{
>> +       DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
>> +       struct amdxdna_dev *xdna = ndev->xdna;
>> +       int ret;
>> +
>> +       if (hwctx->fw_ctx_id == -1)
>> +               return 0;
>> +
>> +       xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
>> +
>> +       req.context_id = hwctx->fw_ctx_id;
>> +       ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> +       if (ret)
>> +               XDNA_WARN(xdna, "%s destroy context failed, ret %d", hwctx->name, ret);
>> +
>> +       xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
>> +       XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
>> +                hwctx->fw_ctx_id);
>> +       hwctx->priv->mbox_chann = NULL;
>> +       hwctx->fw_ctx_id = -1;
>> +
>> +       return ret;
>> +}
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>> index 8fb7ecbf35c1..f60934ae21e0 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -204,6 +204,43 @@ static void aie2_mgmt_fw_fini(struct amdxdna_dev_hdl *ndev)
>>          XDNA_DBG(ndev->xdna, "Firmware suspended");
>>   }
>>
>> +static int aie2_xrs_load(void *cb_arg, struct xrs_action_load *action)
>> +{
>> +       struct amdxdna_hwctx *hwctx = cb_arg;
>> +       struct amdxdna_dev *xdna;
>> +       int ret;
>> +
>> +       xdna = hwctx->client->xdna;
>> +
>> +       hwctx->start_col = action->part.start_col;
>> +       hwctx->num_col = action->part.ncols;
>> +       ret = aie2_create_context(xdna->dev_handle, hwctx);
>> +       if (ret)
>> +               XDNA_ERR(xdna, "create context failed, ret %d", ret);
>> +
>> +       return ret;
>> +}
>> +
>> +static int aie2_xrs_unload(void *cb_arg)
>> +{
>> +       struct amdxdna_hwctx *hwctx = cb_arg;
>> +       struct amdxdna_dev *xdna;
>> +       int ret;
>> +
>> +       xdna = hwctx->client->xdna;
>> +
>> +       ret = aie2_destroy_context(xdna->dev_handle, hwctx);
>> +       if (ret)
>> +               XDNA_ERR(xdna, "destroy context failed, ret %d", ret);
>> +
>> +       return ret;
>> +}
>> +
>> +static struct xrs_action_ops aie2_xrs_actions = {
>> +       .load = aie2_xrs_load,
>> +       .unload = aie2_xrs_unload,
>> +};
>> +
>>   static void aie2_hw_stop(struct amdxdna_dev *xdna)
>>   {
>>          struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> @@ -416,6 +453,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>          xrs_cfg.clk_list.cu_clk_list[2] = 1000;
>>          xrs_cfg.sys_eff_factor = 1;
>>          xrs_cfg.dev = xdna->ddev.dev;
>> +       xrs_cfg.actions = &aie2_xrs_actions;
>>          xrs_cfg.total_col = ndev->total_col;
>>
>>          xdna->xrs_hdl = xrsm_init(&xrs_cfg);
>> @@ -452,4 +490,7 @@ static void aie2_fini(struct amdxdna_dev *xdna)
>>   const struct amdxdna_dev_ops aie2_ops = {
>>          .init           = aie2_init,
>>          .fini           = aie2_fini,
>> +       .hwctx_init     = aie2_hwctx_init,
>> +       .hwctx_fini     = aie2_hwctx_fini,
>> +       .hwctx_config   = aie2_hwctx_config,
>>   };
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
>> index a6b734f24955..818fc52dabbf 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -128,6 +128,10 @@ struct rt_config {
>>          u32     value;
>>   };
>>
>> +struct amdxdna_hwctx_priv {
>> +       void                            *mbox_chann;
>> +};
>> +
>>   struct amdxdna_dev_hdl {
>>          struct amdxdna_dev              *xdna;
>>          const struct amdxdna_dev_priv   *priv;
>> @@ -200,4 +204,12 @@ int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct aie_version *ver
>>   int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_metadata *metadata);
>>   int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
>>                                  struct amdxdna_fw_ver *fw_ver);
>> +int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
>> +int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
>> +
>> +/* aie2_hwctx.c */
>> +int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>> +void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>> +int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
>> +
>>   #endif /* _AIE2_PCI_H_ */
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
>> new file mode 100644
>> index 000000000000..3daf7065acf4
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -0,0 +1,210 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +#include "amdxdna_drm.h"
>> +
>> +#define MAX_HWCTX_ID           255
>> +
>> +static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
>> +{
>> +       struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +
>> +       /* At this point, user is not able to submit new commands */
>> +       mutex_lock(&xdna->dev_lock);
>> +       xdna->dev_info->ops->hwctx_fini(hwctx);
>> +       mutex_unlock(&xdna->dev_lock);
>> +
>> +       kfree(hwctx->name);
>> +       kfree(hwctx);
>> +}
>> +
>> +/*
>> + * This should be called in close() and remove(). DO NOT call in other syscalls.
>> + * This guarantee that when hwctx and resources will be released, if user
>> + * doesn't call amdxdna_drm_destroy_hwctx_ioctl.
>> + */
>> +void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
>> +{
>> +       struct amdxdna_hwctx *hwctx;
>> +       int next = 0;
>> +
>> +       mutex_lock(&client->hwctx_lock);
>> +       idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
>> +               XDNA_DBG(client->xdna, "PID %d close HW context %d",
>> +                        client->pid, hwctx->id);
>> +               idr_remove(&client->hwctx_idr, hwctx->id);
>> +               mutex_unlock(&client->hwctx_lock);
>> +               amdxdna_hwctx_destroy(hwctx);
>> +               mutex_lock(&client->hwctx_lock);
>> +       }
>> +       mutex_unlock(&client->hwctx_lock);
>> +}
>> +
>> +int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>> +{
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_drm_create_hwctx *args = data;
>> +       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +       struct amdxdna_hwctx *hwctx;
>> +       int ret, idx;
>> +
>> +       if (args->ext_flags)
>> +               return -EINVAL;
>> +
>> +       if (!drm_dev_enter(dev, &idx))
>> +               return -ENODEV;
>> +
>> +       hwctx = kzalloc(sizeof(*hwctx), GFP_KERNEL);
>> +       if (!hwctx) {
>> +               ret = -ENOMEM;
>> +               goto exit;
>> +       }
>> +
>> +       if (copy_from_user(&hwctx->qos, u64_to_user_ptr(args->qos_p), sizeof(hwctx->qos))) {
>> +               XDNA_ERR(xdna, "Access QoS info failed");
>> +               ret = -EFAULT;
>> +               goto free_hwctx;
>> +       }
>> +
>> +       hwctx->client = client;
>> +       hwctx->fw_ctx_id = -1;
>> +       hwctx->num_tiles = args->num_tiles;
>> +       hwctx->mem_size = args->mem_size;
>> +       hwctx->max_opc = args->max_opc;
>> +       mutex_lock(&client->hwctx_lock);
>> +       ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
>> +       if (ret < 0) {
>> +               mutex_unlock(&client->hwctx_lock);
>> +               XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
>> +               goto free_hwctx;
>> +       }
>> +       hwctx->id = ret;
>> +       mutex_unlock(&client->hwctx_lock);
>> +
>> +       hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid, hwctx->id);
>> +       if (!hwctx->name) {
>> +               ret = -ENOMEM;
>> +               goto rm_id;
>> +       }
>> +
>> +       mutex_lock(&xdna->dev_lock);
>> +       ret = xdna->dev_info->ops->hwctx_init(hwctx);
>> +       if (ret) {
>> +               mutex_unlock(&xdna->dev_lock);
>> +               XDNA_ERR(xdna, "Init hwctx failed, ret %d", ret);
>> +               goto free_name;
>> +       }
>> +       args->handle = hwctx->id;
>> +       mutex_unlock(&xdna->dev_lock);
>> +
>> +       XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid, args->handle, ret);
>> +       drm_dev_exit(idx);
>> +       return 0;
>> +
>> +free_name:
>> +       kfree(hwctx->name);
>> +rm_id:
>> +       mutex_lock(&client->hwctx_lock);
>> +       idr_remove(&client->hwctx_idr, hwctx->id);
>> +       mutex_unlock(&client->hwctx_lock);
>> +free_hwctx:
>> +       kfree(hwctx);
>> +exit:
>> +       drm_dev_exit(idx);
>> +       return ret;
>> +}
>> +
>> +int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>> +{
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_drm_destroy_hwctx *args = data;
>> +       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +       struct amdxdna_hwctx *hwctx;
>> +       int ret = 0, idx;
>> +
>> +       if (!drm_dev_enter(dev, &idx))
>> +               return -ENODEV;
>> +
>> +       mutex_lock(&client->hwctx_lock);
>> +       hwctx = idr_find(&client->hwctx_idr, args->handle);
>> +       if (!hwctx) {
>> +               mutex_unlock(&client->hwctx_lock);
>> +               ret = -EINVAL;
>> +               XDNA_DBG(xdna, "PID %d HW context %d not exist",
>> +                        client->pid, args->handle);
>> +               goto out;
>> +       }
>> +       idr_remove(&client->hwctx_idr, hwctx->id);
>> +       mutex_unlock(&client->hwctx_lock);
>> +
>> +       amdxdna_hwctx_destroy(hwctx);
>> +
>> +       XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
>> +out:
>> +       drm_dev_exit(idx);
>> +       return ret;
>> +}
>> +
>> +int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>> +{
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_drm_config_hwctx *args = data;
>> +       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +       struct amdxdna_hwctx *hwctx;
>> +       u32 buf_size;
>> +       void *buf;
>> +       u64 val;
>> +       int ret;
>> +
>> +       if (!xdna->dev_info->ops->hwctx_config)
>> +               return -EOPNOTSUPP;
>> +
>> +       val = args->param_val;
>> +       buf_size = args->param_val_size;
>> +
>> +       switch (args->param_type) {
>> +       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
>> +               /* For those types that param_val is pointer */
>> +               if (buf_size > PAGE_SIZE) {
>> +                       XDNA_ERR(xdna, "Config CU param buffer too large");
>> +                       return -E2BIG;
>> +               }
>> +
>> +               /* Hwctx needs to keep buf */
>> +               buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
>> +               if (!buf)
>> +                       return -ENOMEM;
>> +
>> +               if (copy_from_user(buf, u64_to_user_ptr(val), buf_size)) {
>> +                       kfree(buf);
>> +                       return -EFAULT;
>> +               }
>> +
>> +               break;
>> +       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
>> +       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
>> +               /* For those types that param_val is a value */
>> +               buf = NULL;
>> +               buf_size = 0;
>> +               break;
>> +       default:
>> +               XDNA_DBG(xdna, "Unknown HW context config type %d", args->param_type);
>> +               return -EINVAL;
>> +       }
>> +
>> +       mutex_lock(&xdna->dev_lock);
>> +       hwctx = idr_find(&client->hwctx_idr, args->handle);
>> +       if (!hwctx) {
>> +               XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
>> +               ret = -EINVAL;
>> +               goto unlock;
>> +       }
>> +
>> +       ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
>> +
>> +unlock:
>> +       mutex_unlock(&xdna->dev_lock);
>> +       kfree(buf);
>> +       return ret;
>> +}
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
>> new file mode 100644
>> index 000000000000..ceaebe3daa03
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _AMDXDNA_CTX_H_
>> +#define _AMDXDNA_CTX_H_
>> +
>> +#include <drm/drm_drv.h>
>> +#include <linux/kref.h>
>> +
>> +struct amdxdna_hwctx {
>> +       struct amdxdna_client           *client;
>> +       struct amdxdna_hwctx_priv       *priv;
>> +       char                            *name;
>> +
>> +       u32                             id;
>> +       u32                             max_opc;
>> +       u32                             num_tiles;
>> +       u32                             mem_size;
>> +       u32                             fw_ctx_id;
>> +       u32                             col_list_len;
>> +       u32                             *col_list;
>> +       u32                             start_col;
>> +       u32                             num_col;
>> +#define HWCTX_STAT_INIT  0
>> +#define HWCTX_STAT_READY 1
>> +#define HWCTX_STAT_STOP  2
>> +       u32                             status;
>> +       u32                             old_status;
>> +
>> +       struct amdxdna_qos_info              qos;
>> +       struct amdxdna_hwctx_param_config_cu *cus;
>> +};
>> +
>> +void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>> +int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>> +int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>> +int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>> +
>> +#endif /* _AMDXDNA_CTX_H_ */
>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c b/drivers/accel/amdxdna/amdxdna_drm.c
>> index 91e4f9c9dac9..2365c064bad6 100644
>> --- a/drivers/accel/amdxdna/amdxdna_drm.c
>> +++ b/drivers/accel/amdxdna/amdxdna_drm.c
>> @@ -3,12 +3,113 @@
>>    * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>>    */
>>
>> +#include <linux/iommu.h>
>>   #include <drm/drm_ioctl.h>
>>   #include <drm/drm_accel.h>
>>
>>   #include "amdxdna_drm.h"
>>
>> -DEFINE_DRM_ACCEL_FOPS(amdxdna_fops);
>> +static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>> +{
>> +       struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>> +       struct amdxdna_client *client;
>> +       int ret;
>> +
>> +       client = kzalloc(sizeof(*client), GFP_KERNEL);
>> +       if (!client)
>> +               return -ENOMEM;
>> +
>> +       client->pid = pid_nr(filp->pid);
>> +       client->xdna = xdna;
>> +
>> +       client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
>> +       if (IS_ERR(client->sva)) {
>> +               ret = PTR_ERR(client->sva);
>> +               XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
>> +               goto failed;
>> +       }
>> +       client->pasid = iommu_sva_get_pasid(client->sva);
>> +       if (client->pasid == IOMMU_PASID_INVALID) {
>> +               XDNA_ERR(xdna, "SVA get pasid failed");
>> +               ret = -ENODEV;
>> +               goto unbind_sva;
>> +       }
>> +       mutex_init(&client->hwctx_lock);
>> +       idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
>> +
>> +       mutex_lock(&xdna->dev_lock);
>> +       list_add_tail(&client->node, &xdna->client_list);
>> +       mutex_unlock(&xdna->dev_lock);
>> +
>> +       filp->driver_priv = client;
>> +       client->filp = filp;
>> +
>> +       XDNA_DBG(xdna, "pid %d opened", client->pid);
>> +       return 0;
>> +
>> +unbind_sva:
>> +       iommu_sva_unbind_device(client->sva);
>> +failed:
>> +       kfree(client);
>> +
>> +       return ret;
>> +}
>> +
>> +static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>> +{
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>> +
>> +       XDNA_DBG(xdna, "closing pid %d", client->pid);
>> +
>> +       idr_destroy(&client->hwctx_idr);
>> +       mutex_destroy(&client->hwctx_lock);
>> +
>> +       iommu_sva_unbind_device(client->sva);
>> +
>> +       XDNA_DBG(xdna, "pid %d closed", client->pid);
>> +       kfree(client);
>> +}
>> +
>> +static int amdxdna_flush(struct file *f, fl_owner_t id)
>> +{
>> +       struct drm_file *filp = f->private_data;
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_dev *xdna = client->xdna;
>> +       int idx;
>> +
>> +       XDNA_DBG(xdna, "PID %d flushing...", client->pid);
>> +       if (!drm_dev_enter(&xdna->ddev, &idx))
>> +               return 0;
>> +
>> +       mutex_lock(&xdna->dev_lock);
>> +       list_del_init(&client->node);
>> +       mutex_unlock(&xdna->dev_lock);
>> +       amdxdna_hwctx_remove_all(client);
>> +
>> +       drm_dev_exit(idx);
>> +       return 0;
>> +}
>> +
>> +static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>> +       /* Context */
>> +       DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(AMDXDNA_DESTROY_HWCTX, amdxdna_drm_destroy_hwctx_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(AMDXDNA_CONFIG_HWCTX, amdxdna_drm_config_hwctx_ioctl, 0),
>> +};
>> +
>> +static const struct file_operations amdxdna_fops = {
>> +       .owner          = THIS_MODULE,
>> +       .open           = accel_open,
>> +       .release        = drm_release,
>> +       .flush          = amdxdna_flush,
>> +       .unlocked_ioctl = drm_ioctl,
>> +       .compat_ioctl   = drm_compat_ioctl,
>> +       .poll           = drm_poll,
>> +       .read           = drm_read,
>> +       .llseek         = noop_llseek,
>> +       .mmap           = drm_gem_mmap,
>> +};
>>
>>   const struct drm_driver amdxdna_drm_drv = {
>>          .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>> @@ -17,4 +118,8 @@ const struct drm_driver amdxdna_drm_drv = {
>>          .desc = "AMD XDNA DRM implementation",
>>          .major = AMDXDNA_DRIVER_MAJOR,
>>          .minor = AMDXDNA_DRIVER_MINOR,
>> +       .open = amdxdna_drm_open,
>> +       .postclose = amdxdna_drm_close,
>> +       .ioctls = amdxdna_drm_ioctls,
>> +       .num_ioctls = ARRAY_SIZE(amdxdna_drm_ioctls),
>>   };
>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
>> index bf4b0b786606..08331c51a130 100644
>> --- a/drivers/accel/amdxdna/amdxdna_drm.h
>> +++ b/drivers/accel/amdxdna/amdxdna_drm.h
>> @@ -13,6 +13,8 @@
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_file.h>
>>
>> +#include "amdxdna_ctx.h"
>> +
>>   #define XDNA_INFO(xdna, fmt, args...)  drm_info(&(xdna)->ddev, fmt, ##args)
>>   #define XDNA_WARN(xdna, fmt, args...)  drm_warn(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
>>   #define XDNA_ERR(xdna, fmt, args...)   drm_err(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
>> @@ -32,6 +34,9 @@ struct amdxdna_dev;
>>   struct amdxdna_dev_ops {
>>          int (*init)(struct amdxdna_dev *xdna);
>>          void (*fini)(struct amdxdna_dev *xdna);
>> +       int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>> +       void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>> +       int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
>>   };
>>
>>   /*
>> @@ -68,7 +73,23 @@ struct amdxdna_dev {
>>          void                            *xrs_hdl;
>>
>>          struct mutex                    dev_lock; /* per device lock */
>> +       struct list_head                client_list;
>>          struct amdxdna_fw_ver           fw_ver;
>>   };
>>
>> +/*
>> + * struct amdxdna_client - amdxdna client
>> + * A per fd data structure for managing context and other user process stuffs.
>> + */
>> +struct amdxdna_client {
>> +       struct list_head                node;
>> +       pid_t                           pid;
>> +       struct mutex                    hwctx_lock; /* protect hwctx */
>> +       struct idr                      hwctx_idr;
>> +       struct amdxdna_dev              *xdna;
>> +       struct drm_file                 *filp;
>> +       struct iommu_sva                *sva;
>> +       int                             pasid;
>> +};
>> +
>>   #endif /* _AMDXDNA_DRM_H_ */
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 7d0cfd918b0e..924ee8b96ebb 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -58,6 +58,7 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>                  return -ENODEV;
>>
>>          drmm_mutex_init(&xdna->ddev, &xdna->dev_lock);
>> +       INIT_LIST_HEAD(&xdna->client_list);
>>          pci_set_drvdata(pdev, xdna);
>>
>>          mutex_lock(&xdna->dev_lock);
>> @@ -94,11 +95,25 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   static void amdxdna_remove(struct pci_dev *pdev)
>>   {
>>          struct amdxdna_dev *xdna = pci_get_drvdata(pdev);
>> +       struct amdxdna_client *client;
>>
>>          drm_dev_unplug(&xdna->ddev);
>>          amdxdna_sysfs_fini(xdna);
>>
>>          mutex_lock(&xdna->dev_lock);
>> +       client = list_first_entry_or_null(&xdna->client_list,
>> +                                         struct amdxdna_client, node);
>> +       while (client) {
>> +               list_del_init(&client->node);
>> +               mutex_unlock(&xdna->dev_lock);
>> +
>> +               amdxdna_hwctx_remove_all(client);
>> +
>> +               mutex_lock(&xdna->dev_lock);
>> +               client = list_first_entry_or_null(&xdna->client_list,
>> +                                                 struct amdxdna_client, node);
>> +       }
>> +
>>          xdna->dev_info->ops->fini(xdna);
>>          mutex_unlock(&xdna->dev_lock);
>>   }
>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
>> index 1b699464150e..5c1d9707d6da 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _UAPI_AMDXDNA_ACCEL_H_
>>   #define _UAPI_AMDXDNA_ACCEL_H_
>>
>> +#include <linux/stddef.h>
>>   #include "drm.h"
>>
>>   #if defined(__cplusplus)
>> @@ -15,11 +16,138 @@ extern "C" {
>>   #define AMDXDNA_DRIVER_MAJOR   1
>>   #define AMDXDNA_DRIVER_MINOR   0
>>
>> +#define AMDXDNA_INVALID_CTX_HANDLE     0
>> +
>>   enum amdxdna_device_type {
>>          AMDXDNA_DEV_TYPE_UNKNOWN = -1,
>>          AMDXDNA_DEV_TYPE_KMQ,
>>   };
>>
>> +enum amdxdna_drm_ioctl_id {
>> +       DRM_AMDXDNA_CREATE_HWCTX,
>> +       DRM_AMDXDNA_DESTROY_HWCTX,
>> +       DRM_AMDXDNA_CONFIG_HWCTX,
>> +};
>> +
>> +/**
>> + * struct qos_info - QoS information for driver.
>> + * @gops: Giga operations per second.
>> + * @fps: Frames per second.
>> + * @dma_bandwidth: DMA bandwidtha.
>> + * @latency: Frame response latency.
>> + * @frame_exec_time: Frame execution time.
>> + * @priority: Request priority.
>> + *
>> + * User program can provide QoS hints to driver.
>> + */
>> +struct amdxdna_qos_info {
>> +       __u32 gops;
>> +       __u32 fps;
>> +       __u32 dma_bandwidth;
>> +       __u32 latency;
>> +       __u32 frame_exec_time;
>> +       __u32 priority;
>> +};
>> +
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
>> + */
>> +struct amdxdna_drm_create_hwctx {
>> +       __u64 ext;
>> +       __u64 ext_flags;
>> +       __u64 qos_p;
>> +       __u32 umq_bo;
>> +       __u32 log_buf_bo;
>> +       __u32 max_opc;
>> +       __u32 num_tiles;
>> +       __u32 mem_size;
>> +       __u32 umq_doorbell;
>> +       __u32 handle;
> You should align this structure to 64 bits for 32 bit compatibility.
> I.e., add a __u32 pad;

Thanks. I will fix this.


Lizhi

>
> Alex
>
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
>> + * @handle: Hardware context handle.
>> + * @pad: MBZ.
>> + */
>> +struct amdxdna_drm_destroy_hwctx {
>> +       __u32 handle;
>> +       __u32 pad;
>> +};
>> +
>> +/**
>> + * struct amdxdna_cu_config - configuration for one CU
>> + * @cu_bo: CU configuration buffer bo handle
>> + * @cu_func: Functional of a CU
>> + * @pad: MBZ
>> + */
>> +struct amdxdna_cu_config {
>> +       __u32 cu_bo;
>> +       __u8  cu_func;
>> +       __u8  pad[3];
>> +};
>> +
>> +/**
>> + * struct amdxdna_hwctx_param_config_cu - configuration for CUs in hardware context
>> + * @num_cus: Number of CUs to configure
>> + * @pad: MBZ
>> + * @cu_configs: Array of CU configurations of struct amdxdna_cu_config
>> + */
>> +struct amdxdna_hwctx_param_config_cu {
>> +       __u16 num_cus;
>> +       __u16 pad[3];
>> +       struct amdxdna_cu_config cu_configs[] __counted_by(num_cus);
>> +};
>> +
>> +enum amdxdna_drm_config_hwctx_param {
>> +       DRM_AMDXDNA_HWCTX_CONFIG_CU,
>> +       DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
>> +       DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
>> +       DRM_AMDXDNA_HWCTX_CONFIG_NUM
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_config_hwctx - Configure hardware context.
>> + * @handle: hardware context handle.
>> + * @param_type: Value in enum amdxdna_drm_config_hwctx_param. Specifies the
>> + *              structure passed in via param_val.
>> + * @param_val: A structure specified by the param_type struct member.
>> + * @param_val_size: Size of the parameter buffer pointed to by the param_val.
>> + *                 If param_val is not a pointer, driver can ignore this.
>> + *
>> + * Note: if the param_val is a pointer pointing to a buffer, the maximum size
>> + * of the buffer is 4KiB(PAGE_SIZE).
>> + */
>> +struct amdxdna_drm_config_hwctx {
>> +       __u32 handle;
>> +       __u32 param_type;
>> +       __u64 param_val;
>> +       __u32 param_val_size;
>> +       __u32 pad;
>> +};
>> +
>> +#define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
>> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
>> +                struct amdxdna_drm_create_hwctx)
>> +
>> +#define DRM_IOCTL_AMDXDNA_DESTROY_HWCTX \
>> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_DESTROY_HWCTX, \
>> +                struct amdxdna_drm_destroy_hwctx)
>> +
>> +#define DRM_IOCTL_AMDXDNA_CONFIG_HWCTX \
>> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CONFIG_HWCTX, \
>> +                struct amdxdna_drm_config_hwctx)
>> +
>>   #if defined(__cplusplus)
>>   } /* extern c end */
>>   #endif
>> --
>> 2.34.1
>>
