Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2160992380
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 06:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50B110E00B;
	Mon,  7 Oct 2024 04:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLU6BONI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13410E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 04:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgG9b0LYCwNcgBMAtbHQukwLLt3ZUU4tGGD1Vqzk7j5cAl72ptuToSplmANfEAkZykZYgGlmqllzkpyZHcOlYpT9eqTjizD/wzM4cz+s3COU0YUHsLAhSuqEKRKznOViWNw8XvgCyvUIEdJT/Aou2CNYLpKYwGa/WG7d1h0pdx0t4CEeLjvzbEoHXFdWqi25IjU2kTWiYaAy3VLDEevdgAUN76lRKga27gLKbI6OGoquWjix5rW9WuQn6Wf5L1FbGFqWpbh1ejXHTOb52i0KZ9sqKbBWnQ7UseqSx7dx0A2XVYvHnnVh6OL52ys6H5ZhXk5kEX3qrnGU8QjHQKNLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N1kyP9LKjY2S0Dw9VM3O4D5XkVa154h8xVQDpCROko=;
 b=mVDMRr6xtmRDQctbbdN68j771uqn7oKPV4TxOsE+wNzk8jLHt3/Y1u9EC0KCvgdZCrPj5Yzp3MxAA4pEHMDPpODdmr3BN8B12B8guQs3SVnjO75C989pO+UyC8EjZovTBNviuQ67T6/ki0fRxYRd4D54H4n4wDGHKtFSs/ooREGvGg+jrPkNXrsEG1PBhnHg8soV10RrWwKtWeP7aTsiGXs6w9LbLTd1M1wSwro0yoQ0LKPoixxq7R6sNHRZTskLKw0tfcfCjD+S1CInPy9XbAZfpepJImn6bB5CRdEYqcpDBninuWxrNT5LUp5BmsuuegzwjrWZkgmH5Hh7icDwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N1kyP9LKjY2S0Dw9VM3O4D5XkVa154h8xVQDpCROko=;
 b=VLU6BONIr8kbNEjvh04TdEs1yJWH3cHghyAvdBgjDaweaAWo+eJORu7Ti2kMVXt7upwVZMrKyHFpdGogM86HxmvanGMKl1w7LDHFvUYpEn8UMy+09707o8wsY1T38gmR0fLGKfNvGoiQmuA4ApCNycTqkETBVFWNu9VyjHjeFPU=
Received: from BL1PR13CA0364.namprd13.prod.outlook.com (2603:10b6:208:2c0::9)
 by DS0PR12MB7746.namprd12.prod.outlook.com (2603:10b6:8:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 04:15:46 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::e7) by BL1PR13CA0364.outlook.office365.com
 (2603:10b6:208:2c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.12 via Frontend
 Transport; Mon, 7 Oct 2024 04:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 04:15:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 6 Oct
 2024 23:15:29 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 6 Oct 2024 23:15:28 -0500
Message-ID: <7e337655-a0ff-0c9f-f074-35ca61b0d934@amd.com>
Date: Sun, 6 Oct 2024 21:15:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 03/11] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, George Yang <George.Yang@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-4-lizhi.hou@amd.com>
 <86c8f688-eea3-ff95-5ae5-2e4da32b7edb@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <86c8f688-eea3-ff95-5ae5-2e4da32b7edb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS0PR12MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e0c267-2bd3-44e2-00ae-08dce686b773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnowNnJmam9zNHc5VGpYNGNxaDA0OVYwdGlndVo5REtSbXV5Sk5mK1RqeGhw?=
 =?utf-8?B?VS9SQmJFcTZTZmNBYWJXSkZXQXQwSzU0R09oc3FCWjlsSENQR2xqUFBRaVFZ?=
 =?utf-8?B?L0tvL2IzWGtDVDlqdUwyWEFZYm5MaSt6bDBhYUdZbEwxY1JzcVppMURuSDl3?=
 =?utf-8?B?UGxSWTJXbTlCUDZUbSs1TXVwd3RRMlJIMURQdys4MnRuMm0waTFNQ2dHVkdy?=
 =?utf-8?B?ZnF0ZjkvczJXMWJRWExhUDRVYWF0VlI5TlFBYXB2djd3ellKVXNqdWZ3ck5r?=
 =?utf-8?B?MzZhaUo4S1EvYjBVL20waVN4cXljWXdTTjhYU1lhMFRTVnJ6bk1tYkRjb1U4?=
 =?utf-8?B?N1ozZEUySGlOODlBV3RFU3gxNGpWN3dHRkxEcEg4Wk9XdXU1eWNUQkFlY3RK?=
 =?utf-8?B?bVBGTFRlUklPQVlDSlA4c3BRZmM1bXc0VVFvWlZYQXNpclBxRzR5ZVh0K3dG?=
 =?utf-8?B?d2tKdjlmc21IdHV1T05KckllUFBzYnp5Y1BaSkNrdGZBbzAxMGM0NXh0cXVu?=
 =?utf-8?B?aW1SWUFrS1RpVkJWNllIK0h0dWJHcmxGWUFQM21UZVRpTldiYlpucDY1RzRO?=
 =?utf-8?B?blBMTktzeS8wWlAxT21kN2QxR0VpZ29ka1NubUh1N29EdkRqRjNwNE1BVjZS?=
 =?utf-8?B?Z2l2UGM2K0FoaHhoQVZLSUJUYzcxb1hMWnliOGNqOXc2SXdYcFMrZzlpOVRq?=
 =?utf-8?B?QzhpRDFSTm0vMm1zL3FnbHlQbU1hZHQ5b2pGaHhzeHhUYjNQL3FKVkg1WHg4?=
 =?utf-8?B?TEp4YitRVU85eEwvNWY3NExZZS9NcllYMmpWOWpmTXRxVGl5MTZSUVRqQUJx?=
 =?utf-8?B?bm9xZzEybTN4S2JXTGJFbzNGelZBU3JzcUxsQ2MxOWpSVE90dkFyRHlzblBU?=
 =?utf-8?B?Uk5LUjZtZUR5djZmeTJqWFJsTzZFdGRZR3BtQ3J0TkNPa0pUelNLYlpHVmN3?=
 =?utf-8?B?ZjNDYTlPRGg1VlcxdGRXU2wxRFdrSERuejN6bWlDUjU3VVJoTGZWNSs1dU9w?=
 =?utf-8?B?Q21pY05YbmdibTZsOUgzbjNzSTlubkxzSzZWNEZhc3ZPdXROdGx3dHRXZW5G?=
 =?utf-8?B?Zjc3TE5QajlOdVhGaGNDTUhvcUZEV3JPdnVKVGY5ZGNNY28zZHlLQ1dQL1Rs?=
 =?utf-8?B?MWpWYnVCSnJQamhJZnBOaXkrOGpyVjU2WUx3Z1FvZWJLb2NOdTNjbkVoMWdj?=
 =?utf-8?B?cXdFcDRiSk4rbC93TGxrTU5oWlBreXJ5V0l0dHI2SGNmTU1NRktjbTI1UFVz?=
 =?utf-8?B?VmIwb0Zpbkxld0FuSXp6SlBDZy9iZVBlZW13QzA0L1AxWFR4MHljUmlPTzUx?=
 =?utf-8?B?VEY2LzBjVlNEY2pyMFloNm5lMkx1djNtM3Ztd0pCRjJPTHhPeE1YSDBQVjZQ?=
 =?utf-8?B?dnJqVnlvS01xREdIYXRSbDVUa3VrVHY2RjBNUUZTSUZSZXBrQ0lFU0orRWsw?=
 =?utf-8?B?L3JMcEpkS01HTTNvdmRLV2pYOVhNQXBuMUpBZWVrNEdQZ3FGYWU2NFlraE9Y?=
 =?utf-8?B?eTA3N2JGNWNTR0lTQjk5U1BDeTFGWmphMFNrdjNhb0dOVEwrMGRVUlZwaWor?=
 =?utf-8?B?L1NEb0kxYjdLZTFZREt4VGlaaitxbHROZjVjU3BlUGdSNE01QTBjYTJlQ3RP?=
 =?utf-8?B?Nld0TkMzeGRqQWtvMWJTUzlCWFFVVk5VMHBhWEk2bzZlNEFybFU3dGNGVUpl?=
 =?utf-8?B?aWd0N1c5QUFnUmh5M3NKTDRjcUNMSUlqUDdsaGxFUmc2UzN6SVJmZmVZajFj?=
 =?utf-8?B?dGFYSDNwcTlSQVIrQkhZUzVaRmVwUkNoR20wZFRPQzByek0xL0c1YzNiSTFt?=
 =?utf-8?B?NzQ3RyswV2luclhBbytrWnJjWVZMb2dTZ2V2ZWNRZkxBRis4MFgrSEhlQlR4?=
 =?utf-8?Q?XZpOrrbNTid9q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 04:15:45.6760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e0c267-2bd3-44e2-00ae-08dce686b773
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7746
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


On 10/4/24 10:34, Jeffrey Hugo wrote:
> On 9/11/2024 12:05 PM, Lizhi Hou wrote:
>> +struct create_ctx_req {
>> +    __u32    aie_type;
>> +    __u8    start_col;
>> +    __u8    num_col;
>> +    __u16    reserved;
>> +    __u8    num_cq_pairs_requested;
>> +    __u8    reserved1;
>> +    __u16    pasid;
>> +    __u32    pad[2];
>> +    __u32    sec_comm_target_type;
>> +    __u32     context_priority;
>
> Alignment
Will fix it.
>
>> +} __packed;
>> +
>> +struct create_ctx_resp {
>> +    enum aie2_msg_status    status;
>> +    __u32            context_id;
>> +    __u16            msix_id;
>> +    __u8            num_cq_pairs_allocated;
>> +    __u8            reserved;
>> +    struct cq_pair        cq_pair[MAX_CQ_PAIRS];
>> +} __packed;
>> +
>> +struct destroy_ctx_req {
>> +    __u32    context_id;
>> +} __packed;
>> +
>> +struct destroy_ctx_resp {
>> +    enum aie2_msg_status    status;
>> +} __packed;
>> +
>> +struct execute_buffer_req {
>> +    __u32    cu_idx;
>> +    __u32    payload[19];
>> +} __packed;
>> +
>> +struct exec_dpu_req {
>> +    __u64    inst_buf_addr;
>> +    __u32     inst_size;
>> +    __u32     inst_prop_cnt;
>> +    __u32     cu_idx;
>
> Alignment
will fix it.
>
>> +    __u32    payload[35];
>> +} __packed;
>> +
>> diff --git a/drivers/accel/amdxdna/aie2_psp.c 
>> b/drivers/accel/amdxdna/aie2_psp.c
>> index c87ca322e206..ac5296f4f2ae 100644
>> --- a/drivers/accel/amdxdna/aie2_psp.c
>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>> @@ -8,6 +8,8 @@
>>   #include <drm/drm_print.h>
>>   #include <linux/iopoll.h>
>>   +#include "amdxdna_mailbox.h"
>> +#include "amdxdna_pci_drv.h"
>>   #include "aie2_pci.h"
>
> Doesn't look like alphabetical order to me.  Also similar instances in 
> the *_regs.c files below

aie2 is one type of amdxdna hw platform. I would put amdxdna_*.h ahead 
of aie_*.h. Otherwise I probably need to add include in aie2_*.h.  Is it 
acceptable reason? Or I must use alphabetical for #include?


Thanks,

Lizhi

>
>>     #define PSP_STATUS_READY    BIT(31)
>
>
