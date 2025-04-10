Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90874A84952
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8328B10EA00;
	Thu, 10 Apr 2025 16:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZDUFBh0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D64B10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du0js0giqW7dwWO1ep8LmQxs7FdW+nETiN1ZyeYsbMDgwDc8RaYyGZFp233lwq6SbstL6lNNIETkOa/dRsKzUJWHmilqpz/tbq7N8T6JDTTMmTvrhP/XxrchtUKgDxjp6zZoCTSgCa99U2Pvpf690kAGHUVXASvI7ZrOzZ7yhA/fJvcSB5PvjqKT9LQJhUzd+uH/HGgl5NS3mMDjjnORCd87RmshUQcI4YTf6GGE1dW9uZAlWmxtLV3Y80hLHO7l+NwcojvIYImq62TpQsYdAaXNi0Z7/VcALy4xPljT6ykjpZemZejY937SNgCLG87qAiiENL0rQg0DvWKl2FIqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJZhR9maullOjrnAsg197NTkIwWYmGntP7Hu7HLKkdw=;
 b=IQPx1bnnY/ipQyjKmtq1bRhwiSyS2rWhIirrDEgOY28sEKMOxmUD+yNh73f6cf4Jj+NRIbizBUB4Jyhfl37s7Iok6r0THO5u7MK48QejSlopO4UixzrXczFrVcufVbFUK7B7ZuCD5JxXfQdt5g+ILDNqP4cJ2UU5b5yMTd/EzAo+BsibhovivKY3+495pIL9GqOQ+PBDDy5G+gskHBDWPy365d7dWyt+wueMBWEnv5cf5r/ZbJPQI9ppprjmndncJWzdlGHFYCICtdliMqAZEpEMjm/FELdTKEFKGtyVUUZ3O0J/tPSjV1vN2C8ZTE/PRr9OfQUY86XPH1tfiUvPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJZhR9maullOjrnAsg197NTkIwWYmGntP7Hu7HLKkdw=;
 b=ZDUFBh0xANMbnhGMv4T1aqw100kGk+OBZnDCTLBd0yjiy21XzmjOmHYexcKuvm1LuPb2IP6owU9s3R8raJHJ19i7U5x7OYmVDDcngl8gg/sfkt3gQ9mase2JnZ1JhsgbtZCjZY5jw1+m/ybxsxy6sS7G04OE2VGPY137f88le4w=
Received: from DM6PR05CA0039.namprd05.prod.outlook.com (2603:10b6:5:335::8) by
 CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.33; Thu, 10 Apr 2025 16:11:33 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::f8) by DM6PR05CA0039.outlook.office365.com
 (2603:10b6:5:335::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Thu,
 10 Apr 2025 16:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 16:11:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 11:11:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 11:11:30 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 11:11:28 -0500
Message-ID: <2beea319-0a2d-8e29-0a57-6b43a85a00f4@amd.com>
Date: Thu, 10 Apr 2025 09:11:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU
 commands
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250409210013.10854-1-lizhi.hou@amd.com>
 <c55d3198-0fcc-4104-936d-f1ffd140ae14@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c55d3198-0fcc-4104-936d-f1ffd140ae14@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: dac0a79c-2456-444c-1032-08dd784a5c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3A5czdBUDdZSGdUKzVVUEVJMFkweFlGNGp3VEdyaVlvVUtCdWxRUTV1MjRl?=
 =?utf-8?B?YmV2Tzlpbm5IN2o0NGtTcVBSUC8vbEVFa0VIcFRHS1pBSDQxaStUWTkvdjAr?=
 =?utf-8?B?SU9TNTViSjBubEVSS3JzZVQwZ2RvVHNZOGk2dmVaQjkwSGVjelZNSy9MKzd1?=
 =?utf-8?B?U3dwV1R3Z2l5Zjdza3JPajRHMDV3RnZ6Sko3YUh3WFBMYUx6YzZQZThyenls?=
 =?utf-8?B?NHF2UEZYL0pvcDc1N01oK3hyQVNVRUxoZ3N1bkh6TitqSGZxNm90V0FYeXBI?=
 =?utf-8?B?elBvZzNGZXJlSHZZNkVGbzNFQmtEQnQzeVVhUWVOYXVkUWRQbmxtVjVwM0tD?=
 =?utf-8?B?UjBkNkM2TjhjWWptbHpKS0RCbkh6S21PZU5DN1pZMXlYSlp2SHB6K3VZUndI?=
 =?utf-8?B?VXB2UU9VZzlQUHdhSk0yWWd0a2pYTHZ3RXg4Yk1nTFNaSUl1ZjBrOEJqQXFQ?=
 =?utf-8?B?R0NJaElhMlVlWEVoMDlCZDR1VWFhUVlSV2pkd1Y2Z0FTTFNocHkwcElwa09D?=
 =?utf-8?B?WVBxNWFNWU1MMFd2UFd4bTU1Yjhzd2Y0N3I2YjA1ZDEvOWFnTmRiNStaRHRK?=
 =?utf-8?B?NDNqdEt2RWtpL2gxaTVUbXNHeWVCRVdrYW8wVWtWWkhwUVNwRGJ6SE15Z2Nr?=
 =?utf-8?B?eXQzendVd0Ixd05lQ3RlUTdGSEZuWnQrWng5MEFDTnJxaWRSaTY2ZDM0RVhH?=
 =?utf-8?B?N0xGQkVaMmpvc21wVnJDT0w0WkY3MXlUb3MweURhZGpORldja3R1bXRHY25Y?=
 =?utf-8?B?ZWh1LzZsVHZvK3JXT1V5Tzdadmt0UEJJYnVzUTdGbElCTVJ3cEp0dVhOTnRO?=
 =?utf-8?B?NS84Z0VUY3ZDQk45WGZMbmRndXBXMnJqZHEwUWJGTTUxSlNTRzZ0MkpaRndS?=
 =?utf-8?B?czk2b1Q1bW5yMVZOL2pqTXJUSWllcjlDZHhyazgvMXhuT2JwY1RXSGJhanRr?=
 =?utf-8?B?V2NYTVRCRFBQbWNodDBmanM5L2k1TzNFbUdPMVlBV3FnODVUcDExVXI5Z0o0?=
 =?utf-8?B?R0ZRM0UreCtBRW5tWXo0ODJuKzVPWW51Y0ppMnh6VFphM0VqdEUvMXIwalNF?=
 =?utf-8?B?QUdHdy9PcndjUDgwZkM2eVBJSE8vemZrcndUMkt0QXdwdmh3RDdUOG5kRjUy?=
 =?utf-8?B?RHFkL2ozbXpCRm5hbjdqSzkydHVFZXJSR0VEQ0ZtMHR6bHJ4cW5lVE1lWjQy?=
 =?utf-8?B?N3R0M0h5ZnREQ1Y4ckVxdDNOSjNvcWV5bTFXbHJRTHFwSkZXS3IxTDU2NDcv?=
 =?utf-8?B?SmpnQUpoaHZOWFFPMGlNM0JPdUx2amVidk1JTXZQaWozSkFKK1JETzd5Mmh5?=
 =?utf-8?B?Y1FhY3dGM2thM1JoU3hNR29NWW5keVd3RWtuY2JOZWw4b1ZtRmR3OXdUai9N?=
 =?utf-8?B?MGpJM3ZISExSSEdNMzQ3dksrMG5IRXgrcDcraXBMNzc4eFJvZWNqcFJQd2tv?=
 =?utf-8?B?RXpkdUZRL0EvazZ4UGM0ajhhVXY5dmpKblpGUmNDVDlDS3UvQjFDTGdPS3Rl?=
 =?utf-8?B?dHM1bGhYczZKcXlmYjR4ZlFQbXE4bElZemhqRTVXVWkxK1dFb3F0NnZzNEdB?=
 =?utf-8?B?UmsvOHlPYTVONUhBemRDNTNVU2RqZ0NoOU1DUlNGTlNxenBEaWo4c0ZvbUZr?=
 =?utf-8?B?K1FMUEZaYlVEWUt6WUVhNWZoZGUwZERKWjVYM3YybkI3NkJVaDZXbVhLRlFM?=
 =?utf-8?B?bUFZQU90elA0RXZGTUVwN0VEZlNJdWlmZGhSQmthTW5qMzV4QjVweXdhUDZ4?=
 =?utf-8?B?R1ZwVGFXU0FSZ2NOZEZvQm1EamZoR0lmaUlWQVY0Y01QQVZqdmxaeHlSOXQ0?=
 =?utf-8?B?ZDRicll6RDlIOCtrUHAyNFBRSEZoMS9XTjYrcCtERWREOXF3SFNvY0pYbThS?=
 =?utf-8?B?enBKS2FMVlNudkNhenBtdTQwblJVRzlicTNNU25TUjhKUDI1Wnp3VFR2Ym03?=
 =?utf-8?B?NEQ1YUVYbVdhR1c3cmdaVTB3ZmJPbmtyMHdOS3RiWCs4T1NLWllPeThlUVEx?=
 =?utf-8?Q?dEETn7oCzzAc2lmTeVt5nUrYOKAT80=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:11:32.8868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac0a79c-2456-444c-1032-08dd784a5c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
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


On 4/10/25 00:27, Falkowski, Maciej wrote:
> On 4/9/2025 11:00 PM, Lizhi Hou wrote:
>
>> When multiple ERT_START_NPU commands are combined in one buffer, the
>> buffer size calculation is incorrect. Also, the condition to make sure
>> the buffer size is not beyond 4K is also fixed.
>>
>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c  |  6 +++---
>>   drivers/accel/amdxdna/aie2_msg_priv.h | 10 ++++------
>>   2 files changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index bf4219e32cc1..82412eec9a4b 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -525,7 +525,7 @@ aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 
>> offset,
>>       if (!payload)
>>           return -EINVAL;
>>   -    if (!slot_cf_has_space(offset, payload_len))
>> +    if (!slot_has_space(*buf, offset, payload_len))
>>           return -ENOSPC;
>>         buf->cu_idx = cu_idx;
>> @@ -558,7 +558,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 
>> offset,
>>       if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>>           return -EINVAL;
>>   -    if (!slot_dpu_has_space(offset, arg_sz))
>> +    if (!slot_has_space(*buf, offset, arg_sz))
>>           return -ENOSPC;
>>         buf->inst_buf_addr = sn->buffer;
>> @@ -569,7 +569,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 
>> offset,
>>       memcpy(buf->args, sn->prop_args, arg_sz);
>>         /* Accurate buf size to hint firmware to do necessary copy */
>> -    *size += sizeof(*buf) + arg_sz;
>> +    *size = sizeof(*buf) + arg_sz;
>>       return 0;
>>   }
>>   diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>> index 4e02e744b470..6df9065b13f6 100644
>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>> @@ -319,18 +319,16 @@ struct async_event_msg_resp {
>>   } __packed;
>>     #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
>> -#define slot_cf_has_space(offset, payload_size) \
>> -    (MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
>> -     offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))
>
> Could this macro be rewritten as static inline function?
> That would provide additional typecheck.

Thanks for your suggestion. slot_cf_has_space and slot_dpu_has_space are 
merged into one macro to reduce duplicate code.

The new macro has slot parameter which could be either cf slot or dpu 
slot type. Thus, it may not use inline function.


Lizhi

>
>> +#define slot_has_space(slot, offset, payload_size)        \
>> +    (MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) + \
>> +     sizeof(typeof(slot)))
>> +
>>   struct cmd_chain_slot_execbuf_cf {
>>       __u32 cu_idx;
>>       __u32 arg_cnt;
>>       __u32 args[] __counted_by(arg_cnt);
>>   };
>>   -#define slot_dpu_has_space(offset, payload_size) \
>> -    (MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
>> -     offsetof(struct cmd_chain_slot_dpu, args[0]))
>>   struct cmd_chain_slot_dpu {
>>       __u64 inst_buf_addr;
>>       __u32 inst_size;
>
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> Best regards,
> Maciej
