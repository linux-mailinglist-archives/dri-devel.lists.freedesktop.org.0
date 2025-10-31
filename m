Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86AC25CAC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDD210E2D9;
	Fri, 31 Oct 2025 15:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fm5FV345";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C5A10E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/Kf/rm62MOzMvs1L1Y8uU1DWf6HoxzvCAVzGOy2OewDoAoeav2vBGljHYN+ita7bZlV7J2WKg4Z22U3WMiNmwA5w/B0GeMycNhpNRfGq2zlkR9q0UBFlHCFAQ+Da1CCc8hiIFY0t4UuFXRGgRJGvch35HbU/Kr00LxsHJ0Tzxa8lCNlwSCxUcPQDzlmLVmQ9gpyhMgfL50K5bQ736FutqFR6snDGwmXni8E+xynK19xTxHqEEW5ca0fSzNVOcrjqEfGFi79hDFQfdKy721L/ualC2GHDLAbb5kQ+G2HIBZsgRe5Vt3Ts87chVgvWjPu6vAc3Lb4ier2ZgUuO/6ApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIMyjb770ZvV7GuuIJtuUHtzNXT+iZzJnbOBVAnIhG8=;
 b=IFJMQkKrPvFpWXN12fJPYcX6WunnmIQF44wVehXf2F76DPAWtVX0t6P6SUpHjPchvO6btwh+ZjDs76EHBZLLs3YY7nrWti4F1fzxQ2kIJnw/uYDv3mSlBx4OocGzpKuHWQTZgvXh4HqNsvO2JYpwNVzBghG7lyMWYH5LRhTHXVDQZcCNV2GbvQqUUJ+WXZVfREKBw2GUxhFI7nnVbclVynFdSxEop5/gAqlKGD2Z99oPmGp0MT/ImIbV0K0RDhm7ur9RBpIddEWZZCgK/zYes2jAnM2nl8WsztXlVnYExVNIP5Rmzln7vAzrq4IfZIpxiUvbOu67rrOT4yDIw73Q1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIMyjb770ZvV7GuuIJtuUHtzNXT+iZzJnbOBVAnIhG8=;
 b=Fm5FV3458z4DeHZoINd/AjM1A9+5LrXzIrSmmxT7xkEbsmgRWtrWQlKZ20igARUrKd2YFWKGj5w8aZ5zeBU2ljhjRdOc7v0fq4Cy386a/BZh67Rz+tgg5MhjgRCQSojrFCKixrNoT4tKfJFqerDTJPGg5OyqHSHCwBxjcqIc6io=
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by DS2PR12MB9661.namprd12.prod.outlook.com (2603:10b6:8:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 15:15:17 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::a) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 15:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 15:15:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 31 Oct
 2025 08:15:14 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 31 Oct
 2025 08:15:14 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 31 Oct 2025 08:15:13 -0700
Message-ID: <8affdff3-ead5-391e-72f1-f19581a0bdbf@amd.com>
Date: Fri, 31 Oct 2025 08:15:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251031014700.2919349-1-lizhi.hou@amd.com>
 <493fe039-a9af-4b4c-b9c3-f61c8b46d678@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <493fe039-a9af-4b4c-b9c3-f61c8b46d678@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|DS2PR12MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c4f24e-9003-439a-0f2d-08de18904ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTgwVVc1Q3dTL01PNWRtUDVXYkQzdEhhVGRYVzZRalh4WUwxQkJtMVNOaXlN?=
 =?utf-8?B?aDFTZkFSYXNUVGxPVGN6VU10Y3AzMklidTJJVXluUzNnQm1ScFhrQUxXUFlq?=
 =?utf-8?B?a0JPOFZUc0IzQXdiOHpxSk0wTDZxVDRaOHY2ZVlCNDZJRkRNVE9iQzNSaVBZ?=
 =?utf-8?B?L280KysrVWEzNDRXRnVMOEcydDNrREh4c2ltVWhmQ3crMjRJTlAxcEhKUWl5?=
 =?utf-8?B?RHNCaVpzcU14akt0R3JNclpVTTlJZVA4bXJqc1VDUjF3OWNUY1pKVGVBQkZ5?=
 =?utf-8?B?SnkwQ2VTM1BOQktuaFV3M1pTZHdkYlg3UWRRaXVyem5DZnhVWjBPc25iZmdC?=
 =?utf-8?B?aUkyMTNldUlpQW5NcXBHSWN3YTYvSWZleFRkdk4rclg3L2x2TkhCN3I3RFRK?=
 =?utf-8?B?eG5makdCSWpwVm9LZ0x0NjNQVWFwbExJa2tNVDVCZDIxSnNMR3VIY3NENnlC?=
 =?utf-8?B?MVJkYUt5cXh0TmgxWllsQmVOd0dHNmtGby9EOUZJM2NMMWFSZE9kTWFHTU5S?=
 =?utf-8?B?MEtOQ2gzUzI3VzY4bXRWN3V6UXpwNG9GK2RVQk5Ba3JpVkRERUo1UkdzVmRD?=
 =?utf-8?B?VERuQ3MyazRuWkRjRGtLaW4xUG0zd0dSTFgxL0xIdi9Lc0dnbTZOcXZSdjBF?=
 =?utf-8?B?R2xCTDdpZ3lSeTdjMGtmeEVXSFpxZW0yb05EQW5uY1Z5MzNuYXQ1WExrQVlo?=
 =?utf-8?B?eFBpNGNISGZMM01PbmlMc3RWTFEwZGc4MnVFa0kvSlR2b1NhK1NScnpJZFdh?=
 =?utf-8?B?UFkrYS95d3FHOTdaYXhYcWx4c254Z3dCZmsyVzFFeVlSNEhtK214cE4vc1d0?=
 =?utf-8?B?V25jc0VJOVl3TGJzM095Nzl6YWFyQ3NqV2Rza1VqNHB2ZkVydGU3eVphbjh6?=
 =?utf-8?B?ejNnSGtLdExiZFhWVFo1UXkrT1BRcDRjSXAraThzV0ZzeEVVWlBpZnlFY2Ix?=
 =?utf-8?B?d2NsRUhDWDFRb1hlanV3OGp6b2JnMnBKWnAzTHZ0MDg3cjFlZEh1ZDBvRjlI?=
 =?utf-8?B?R2QwMVJ2RStlQTBEcUdJZk12MHV0eEVxbWkxQlNyL0dNU1VRNzVQWGo1dEFx?=
 =?utf-8?B?cG9wWmtBMFoyVU50S3FVVzRvMlZnSkRTcGlZQThhaE5tblJsTk83L1hJcHlo?=
 =?utf-8?B?Sk9meER3T2o3cWhnaHliQ0V2OEtrSGprMFFhQ3RlU2hEWjZwdEpLd2plUU0w?=
 =?utf-8?B?ZDFjdFViL0p5OVRNUnppRUhSMndFL3MwV1QyckM2MzRJbk5aMzVBRVluMjNp?=
 =?utf-8?B?a2pGZ3doN0xZYnhoZHNPaExzQnQ1SEsvcXh3OWlINW9URFJxT2dNbEJ4Zk5Q?=
 =?utf-8?B?U2N2RXQ3MXFGVnowRlVaMWdkQlMyQ2NkYUNHb0QwOUN1U0trQlRjSzF2RFN3?=
 =?utf-8?B?WkNRU3JCK3Q3dy9wOGVhVGRHdmJaaXZvVzB2Mk5aU3dRekNLMTdPcXFwUUlI?=
 =?utf-8?B?cjVhK2FCU01ER1ZCZ3ZSYU1naHVWbjBITWZ2TG5FVEl3bW9ST0xndktBU0lP?=
 =?utf-8?B?N3A0bkRPdkFiaExkemFoWjJNbXhCK0JSYllheDdpWmhSSW9kVkNFbmNGd1pS?=
 =?utf-8?B?a3lmaUJuR3p2VmYvZWpWbUpmRjRjMTQ4UkswaTdJTzhQczRvT3oxWGt2bW5k?=
 =?utf-8?B?b09BOHVhU0llQ0dKUDQ0TXk2dGNORDRpeWFITUNiaC94U3N3ODJKTmZYbmxK?=
 =?utf-8?B?S0c3Zksxa0VLRHlkNTQvbmlvbmxNWnR4OGZ5WkhCSlB2ZzdvYXB4QThEbnZ3?=
 =?utf-8?B?U3JBV3YvTGpjQllEM2k0VFhDZW02ekpCZWIxTEtsWm1jcE5ldkg1ZmMwSzVQ?=
 =?utf-8?B?c2FBWWh1TzZTaE53NW44YldhOEoxM1VBdVhCNEgvZnFUOU9hTFlkNENqaER6?=
 =?utf-8?B?OEprdFJNZnh5bGc0SnNQMUQ4Mkg4SkRxU0I2TktYUDdWd1JJSk5uZG1TL1Ev?=
 =?utf-8?B?RlFsaHNKQ0xXbjZVL0ZuN08wUUtTakIxNXRkQVhveHpPckVjdFYzV01XSDJy?=
 =?utf-8?B?ckxvNkhQeFdjUjhNYnRFcnJRdEZNTnhuc0d3SzkzQU9DTUxqWjZmVHBjNmc5?=
 =?utf-8?B?MHdqcWdlTjZmd1JFN0RoQmNoMGUrdVRaak8xOHJSekpvWWlSNmt4S0JRNzQ4?=
 =?utf-8?Q?qYq4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 15:15:17.4575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c4f24e-9003-439a-0f2d-08de18904ccc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9661
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


On 10/30/25 22:10, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 10/30/2025 8:47 PM, Lizhi Hou wrote:
>> MSG_OP_CHAIN_EXEC_NPU is a unified mailbox message that replaces
>> MSG_OP_CHAIN_EXEC_BUFFER_CF and MSG_OP_CHAIN_EXEC_DPU.
>>
>> Add driver logic to check firmware version, and if MSG_OP_CHAIN_EXEC_NPU
>> is supported, uses it to submit firmware commands.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Two small nits below to me.  Otherwise
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Thanks a lot. And I will fix the nits when I merge.


Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c  | 443 +++++++++++++++++---------
>>   drivers/accel/amdxdna/aie2_msg_priv.h |  42 ++-
>>   drivers/accel/amdxdna/aie2_pci.c      |  13 +
>>   drivers/accel/amdxdna/aie2_pci.h      |  29 ++
>>   drivers/accel/amdxdna/amdxdna_ctx.c   |   6 +-
>>   drivers/accel/amdxdna/amdxdna_ctx.h   |  11 +-
>>   drivers/accel/amdxdna/npu1_regs.c     |   6 +
>>   drivers/accel/amdxdna/npu2_regs.c     |   1 +
>>   drivers/accel/amdxdna/npu4_regs.c     |   6 +
>>   drivers/accel/amdxdna/npu5_regs.c     |   1 +
>>   drivers/accel/amdxdna/npu6_regs.c     |   1 +
>>   11 files changed, 392 insertions(+), 167 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 3a4c845d783a..4751a8aff0f7 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -27,6 +27,8 @@
>>   #define DECLARE_AIE2_MSG(name, op) \
>>       DECLARE_XDNA_MSG_COMMON(name, op, MAX_AIE2_STATUS_CODE)
>>   +#define EXEC_MSG_OPS(xdna) ((xdna)->dev_handle->exec_msg_ops)
>> +
>>   static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>>                      struct xdna_mailbox_msg *msg)
>>   {
>> @@ -479,177 +481,291 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>>       return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>   }
>>   -int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job,
>> -         int (*notify_cb)(void *, void __iomem *, size_t))
>> +static int aie2_init_exec_cu_req(struct amdxdna_gem_obj *cmd_bo, 
>> void *req,
>> +                 size_t *size, u32 *msg_op)
>>   {
>> -    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>> -    struct amdxdna_dev *xdna = hwctx->client->xdna;
>> -    struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>> -    union {
>> -        struct execute_buffer_req ebuf;
>> -        struct exec_dpu_req dpu;
>> -    } req;
>> -    struct xdna_mailbox_msg msg;
>> -    u32 payload_len;
>> -    void *payload;
>> -    int cu_idx;
>> -    int ret;
>> -    u32 op;
>> +    struct execute_buffer_req *cu_req = req;
>> +    u32 cmd_len;
>> +    void *cmd;
>>   -    if (!chann)
>> -        return -ENODEV;
>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    if (cmd_len > sizeof(cu_req->payload))
>> +        return -EINVAL;
>>   -    payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
>> -    if (!payload) {
>> -        XDNA_ERR(xdna, "Invalid command, cannot get payload");
>> +    cu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (cu_req->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>> -    }
>>   -    cu_idx = amdxdna_cmd_get_cu_idx(cmd_abo);
>> -    if (cu_idx < 0) {
>> -        XDNA_DBG(xdna, "Invalid cu idx");
>> +    memcpy(cu_req->payload, cmd, cmd_len);
>> +
>> +    *size = sizeof(*cu_req);
>> +    *msg_op = MSG_OP_EXECUTE_BUFFER_CF;
>> +    return 0;
>> +}
>> +
>> +static int aie2_init_exec_dpu_req(struct amdxdna_gem_obj *cmd_bo, 
>> void *req,
>> +                  size_t *size, u32 *msg_op)
>> +{
>> +    struct exec_dpu_req *dpu_req = req;
>> +    struct amdxdna_cmd_start_npu *sn;
>> +    u32 cmd_len;
>> +
>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
>>           return -EINVAL;
>> -    }
>>   -    op = amdxdna_cmd_get_op(cmd_abo);
>> -    switch (op) {
>> -    case ERT_START_CU:
>> -        if (unlikely(payload_len > sizeof(req.ebuf.payload)))
>> -            XDNA_DBG(xdna, "Invalid ebuf payload len: %d", 
>> payload_len);
>> -        req.ebuf.cu_idx = cu_idx;
>> -        memcpy(req.ebuf.payload, payload, sizeof(req.ebuf.payload));
>> -        msg.send_size = sizeof(req.ebuf);
>> -        msg.opcode = MSG_OP_EXECUTE_BUFFER_CF;
>> -        break;
>> -    case ERT_START_NPU: {
>> -        struct amdxdna_cmd_start_npu *sn = payload;
>> -
>> -        if (unlikely(payload_len - sizeof(*sn) > 
>> sizeof(req.dpu.payload)))
>> -            XDNA_DBG(xdna, "Invalid dpu payload len: %d", payload_len);
>> -        req.dpu.inst_buf_addr = sn->buffer;
>> -        req.dpu.inst_size = sn->buffer_size;
>> -        req.dpu.inst_prop_cnt = sn->prop_count;
>> -        req.dpu.cu_idx = cu_idx;
>> -        memcpy(req.dpu.payload, sn->prop_args, 
>> sizeof(req.dpu.payload));
>> -        msg.send_size = sizeof(req.dpu);
>> -        msg.opcode = MSG_OP_EXEC_DPU;
>> -        break;
>> -    }
>> -    default:
>> -        XDNA_DBG(xdna, "Invalid ERT cmd op code: %d", op);
>> +    dpu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (dpu_req->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>> -    }
>> -    msg.handle = job;
>> -    msg.notify_cb = notify_cb;
>> -    msg.send_data = (u8 *)&req;
>> -    print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
>> -                 0x40, false);
>>   -    ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>> -    if (ret) {
>> -        XDNA_ERR(xdna, "Send message failed");
>> -        return ret;
>> -    }
>> +    dpu_req->inst_buf_addr = sn->buffer;
>> +    dpu_req->inst_size = sn->buffer_size;
>> +    dpu_req->inst_prop_cnt = sn->prop_count;
>> +    memcpy(dpu_req->payload, sn->prop_args, cmd_len - sizeof(*sn));
>>   +    *size = sizeof(*dpu_req);
>> +    *msg_op = MSG_OP_EXEC_DPU;
>>       return 0;
>>   }
>>   +static void aie2_init_exec_chain_req(void *req, u64 slot_addr, 
>> size_t size, u32 cmd_cnt)
>> +{
>> +    struct cmd_chain_req *chain_req = req;
>> +
>> +    chain_req->buf_addr = slot_addr;
>> +    chain_req->buf_size = size;
>> +    chain_req->count = cmd_cnt;
>> +}
>> +
>> +static void aie2_init_npu_chain_req(void *req, u64 slot_addr, size_t 
>> size, u32 cmd_cnt)
>> +{
>> +    struct cmd_chain_npu_req *npu_chain_req = req;
>> +
>> +    npu_chain_req->flags = 0;
>> +    npu_chain_req->reserved = 0;
>> +    npu_chain_req->buf_addr = slot_addr;
>> +    npu_chain_req->buf_size = size;
>> +    npu_chain_req->count = cmd_cnt;
>> +}
>> +
>>   static int
>> -aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
>> -                  struct amdxdna_gem_obj *abo, u32 *size)
>> +aie2_cmdlist_fill_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size)
>>   {
>> -    struct cmd_chain_slot_execbuf_cf *buf = cmd_buf + offset;
>> -    int cu_idx = amdxdna_cmd_get_cu_idx(abo);
>> -    u32 payload_len;
>> -    void *payload;
>> +    struct cmd_chain_slot_execbuf_cf *cf_slot = slot;
>> +    u32 cmd_len;
>> +    void *cmd;
>>   -    if (cu_idx < 0)
>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    if (*size < sizeof(*cf_slot) + cmd_len)
>>           return -EINVAL;
>>   -    payload = amdxdna_cmd_get_payload(abo, &payload_len);
>> -    if (!payload)
>> +    cf_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (cf_slot->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>>   -    if (!slot_has_space(*buf, offset, payload_len))
>> -        return -ENOSPC;
>> -
>> -    buf->cu_idx = cu_idx;
>> -    buf->arg_cnt = payload_len / sizeof(u32);
>> -    memcpy(buf->args, payload, payload_len);
>> -    /* Accurate buf size to hint firmware to do necessary copy */
>> -    *size = sizeof(*buf) + payload_len;
>> +    cf_slot->arg_cnt = cmd_len / sizeof(u32);
>> +    memcpy(cf_slot->args, cmd, cmd_len);
>> +    /* Accurate slot size to hint firmware to do necessary copy */
>> +    *size = sizeof(*cf_slot) + cmd_len;
>>       return 0;
>>   }
>>     static int
>> -aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>> -                   struct amdxdna_gem_obj *abo, u32 *size)
>> +aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size)
>>   {
>> -    struct cmd_chain_slot_dpu *buf = cmd_buf + offset;
>> -    int cu_idx = amdxdna_cmd_get_cu_idx(abo);
>> +    struct cmd_chain_slot_dpu *dpu_slot = slot;
>>       struct amdxdna_cmd_start_npu *sn;
>> -    u32 payload_len;
>> -    void *payload;
>> +    u32 cmd_len;
>>       u32 arg_sz;
>>   -    if (cu_idx < 0)
>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    arg_sz = cmd_len - sizeof(*sn);
>> +    if (cmd_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>>           return -EINVAL;
>>   -    payload = amdxdna_cmd_get_payload(abo, &payload_len);
>> -    if (!payload)
>> +    if (*size < sizeof(*dpu_slot) + arg_sz)
>>           return -EINVAL;
>> -    sn = payload;
>> -    arg_sz = payload_len - sizeof(*sn);
>> -    if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>> +
>> +    dpu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (dpu_slot->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>>   -    if (!slot_has_space(*buf, offset, arg_sz))
>> -        return -ENOSPC;
>> +    dpu_slot->inst_buf_addr = sn->buffer;
>> +    dpu_slot->inst_size = sn->buffer_size;
>> +    dpu_slot->inst_prop_cnt = sn->prop_count;
>> +    dpu_slot->arg_cnt = arg_sz / sizeof(u32);
>> +    memcpy(dpu_slot->args, sn->prop_args, arg_sz);
>> +
>> +    /* Accurate slot size to hint firmware to do necessary copy */
>> +    *size = sizeof(*dpu_slot) + arg_sz;
>> +    return 0;
>> +}
>> +
>> +static u32 aie2_get_chain_msg_op(u32 cmd_op)
>> +{
>> +    switch (cmd_op) {
>> +    case ERT_START_CU:
>> +        return MSG_OP_CHAIN_EXEC_BUFFER_CF;
>> +    case ERT_START_NPU:
>> +        return MSG_OP_CHAIN_EXEC_DPU;
>> +    default:
>> +        break;
>> +    }
>>   -    buf->inst_buf_addr = sn->buffer;
>> -    buf->inst_size = sn->buffer_size;
>> -    buf->inst_prop_cnt = sn->prop_count;
>> -    buf->cu_idx = cu_idx;
>> -    buf->arg_cnt = arg_sz / sizeof(u32);
>> -    memcpy(buf->args, sn->prop_args, arg_sz);
>> +    return MSG_OP_MAX_OPCODE;
>> +}
>>   -    /* Accurate buf size to hint firmware to do necessary copy */
>> -    *size = sizeof(*buf) + arg_sz;
>> +static struct aie2_exec_msg_ops legacy_exec_message_ops = {
>> +    .init_cu_req = aie2_init_exec_cu_req,
>> +    .init_dpu_req = aie2_init_exec_dpu_req,
>> +    .init_chain_req = aie2_init_exec_chain_req,
>> +    .fill_cf_slot = aie2_cmdlist_fill_cf,
>> +    .fill_dpu_slot = aie2_cmdlist_fill_dpu,
>> +    .get_chain_msg_op = aie2_get_chain_msg_op,
>> +};
>> +
>> +static int
>> +aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size)
>> +{
>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>> +    u32 cmd_len;
>> +    void *cmd;
>> +
>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    if (*size < sizeof(*npu_slot) + cmd_len)
>> +        return -EINVAL;
>> +
>> +    npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (npu_slot->cu_idx == INVALID_CU_IDX)
>> +        return -EINVAL;
>> +
>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>> +    npu_slot->type = EXEC_NPU_TYPE_NON_ELF;
>> +    npu_slot->arg_cnt = cmd_len / sizeof(u32);
>> +    memcpy(npu_slot->args, cmd, cmd_len);
>> +
>> +    *size = sizeof(*npu_slot) + cmd_len;
>>       return 0;
>>   }
>>     static int
>> -aie2_cmdlist_fill_one_slot(u32 op, struct amdxdna_gem_obj 
>> *cmdbuf_abo, u32 offset,
>> -               struct amdxdna_gem_obj *abo, u32 *size)
>> +aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void 
>> *slot, size_t *size)
>> +{
>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>> +    struct amdxdna_cmd_start_npu *sn;
>> +    u32 cmd_len;
>> +    u32 arg_sz;
>> +
>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    arg_sz = cmd_len - sizeof(*sn);
>> +    if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
>> +        return -EINVAL;
>> +
>> +    if (*size < sizeof(*npu_slot) + arg_sz)
>> +        return -EINVAL;
>> +
>> +    npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>> +    if (npu_slot->cu_idx == INVALID_CU_IDX)
>> +        return -EINVAL;
>> +
>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>> +    npu_slot->type = EXEC_NPU_TYPE_PARTIAL_ELF;
>> +    npu_slot->inst_buf_addr = sn->buffer;
>> +    npu_slot->inst_size = sn->buffer_size;
>> +    npu_slot->inst_prop_cnt = sn->prop_count;
>> +    npu_slot->arg_cnt = arg_sz / sizeof(u32);
>> +    memcpy(npu_slot->args, sn->prop_args, arg_sz);
>> +
>> +    *size = sizeof(*npu_slot) + arg_sz;
>> +    return 0;
>> +}
>> +
>> +static u32 aie2_get_npu_chain_msg_op(u32 cmd_op)
>> +{
>> +    return MSG_OP_CHAIN_EXEC_NPU;
>> +}
>> +
>> +static struct aie2_exec_msg_ops npu_exec_message_ops = {
>> +    .init_cu_req = aie2_init_exec_cu_req,
>> +    .init_dpu_req = aie2_init_exec_dpu_req,
>> +    .init_chain_req = aie2_init_npu_chain_req,
>> +    .fill_cf_slot = aie2_cmdlist_fill_npu_cf,
>> +    .fill_dpu_slot = aie2_cmdlist_fill_npu_dpu,
>> +    .get_chain_msg_op = aie2_get_npu_chain_msg_op,
>> +};
>> +
>> +static int aie2_init_exec_req(void *req, struct amdxdna_gem_obj 
>> *cmd_abo,
>> +                  size_t *size, u32 *msg_op)
>>   {
>> -    u32 this_op = amdxdna_cmd_get_op(abo);
>> -    void *cmd_buf = cmdbuf_abo->mem.kva;
>> +    struct amdxdna_dev *xdna = cmd_abo->client->xdna;
>>       int ret;
>> +    u32 op;
>>   -    if (this_op != op) {
>> -        ret = -EINVAL;
>> -        goto done;
>> -    }
>>   +    op = amdxdna_cmd_get_op(cmd_abo);
>>       switch (op) {
>>       case ERT_START_CU:
>> -        ret = aie2_cmdlist_fill_one_slot_cf(cmd_buf, offset, abo, 
>> size);
>> +        ret = EXEC_MSG_OPS(xdna)->init_cu_req(cmd_abo, req, size, 
>> msg_op);
>> +        if (ret) {
>> +            XDNA_DBG(xdna, "Init CU req failed ret %d", ret);
>> +            return ret;
>> +        }
>>           break;
>>       case ERT_START_NPU:
>> -        ret = aie2_cmdlist_fill_one_slot_dpu(cmd_buf, offset, abo, 
>> size);
>> +        ret = EXEC_MSG_OPS(xdna)->init_dpu_req(cmd_abo, req, size, 
>> msg_op);
>> +        if (ret) {
>> +            XDNA_DBG(xdna, "Init DPU req failed ret %d", ret);
>> +            return ret;
>> +        }
>> +
>>           break;
>>       default:
>> +        XDNA_INFO(xdna, "Unsupported op %d", op);
>
> Shouldn't this be XDNA_ERR()?
>
>>           ret = -EOPNOTSUPP;
>> +        break;
>>       }
>>   -done:
>> -    if (ret) {
>> -        XDNA_ERR(abo->client->xdna, "Can't fill slot for cmd op %d 
>> ret %d",
>> -             op, ret);
>> +    return ret;
>> +}
>> +
>> +static int
>> +aie2_cmdlist_fill_slot(void *slot, struct amdxdna_gem_obj *cmd_abo,
>> +               size_t *size, u32 *cmd_op)
>> +{
>> +    struct amdxdna_dev *xdna = cmd_abo->client->xdna;
>> +    int ret;
>> +    u32 op;
>> +
>> +    op = amdxdna_cmd_get_op(cmd_abo);
>> +    if (*cmd_op == ERT_INVALID_CMD)
>> +        *cmd_op = op;
>> +    else if (op != *cmd_op)
>> +        return -EINVAL;
>> +
>> +    switch (op) {
>> +    case ERT_START_CU:
>> +        ret = EXEC_MSG_OPS(xdna)->fill_cf_slot(cmd_abo, slot, size);
>> +        break;
>> +    case ERT_START_NPU:
>> +        ret = EXEC_MSG_OPS(xdna)->fill_dpu_slot(cmd_abo, slot, size);
>> +        break;
>> +    default:
>> +        XDNA_INFO(xdna, "Unsupported op %d", op);
>> +        ret = -EOPNOTSUPP;
>> +        break;
>>       }
>> +
>>       return ret;
>>   }
>>   +void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>> +{
>> +    if (AIE2_FEATURE_ON(ndev, AIE2_NPU_COMMAND))
>> +        ndev->exec_msg_ops = &npu_exec_message_ops;
>> +    else
>> +        ndev->exec_msg_ops = &legacy_exec_message_ops;
>> +}
>> +
>>   static inline struct amdxdna_gem_obj *
>>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>>   {
>> @@ -658,29 +774,36 @@ aie2_cmdlist_get_cmd_buf(struct 
>> amdxdna_sched_job *job)
>>       return job->hwctx->priv->cmd_buf[idx];
>>   }
>>   -static void
>> -aie2_cmdlist_prepare_request(struct cmd_chain_req *req,
>> -                 struct amdxdna_gem_obj *cmdbuf_abo, u32 size, u32 cnt)
>> +int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job,
>> +         int (*notify_cb)(void *, void __iomem *, size_t))
>>   {
>> -    req->buf_addr = cmdbuf_abo->mem.dev_addr;
>> -    req->buf_size = size;
>> -    req->count = cnt;
>> -    drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
>> -    XDNA_DBG(cmdbuf_abo->client->xdna, "Command buf addr 0x%llx size 
>> 0x%x count %d",
>> -         req->buf_addr, size, cnt);
>> -}
>> +    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +    struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>> +    struct xdna_mailbox_msg msg;
>> +    union exec_req req;
>> +    int ret;
>>   -static inline u32
>> -aie2_cmd_op_to_msg_op(u32 op)
>> -{
>> -    switch (op) {
>> -    case ERT_START_CU:
>> -        return MSG_OP_CHAIN_EXEC_BUFFER_CF;
>> -    case ERT_START_NPU:
>> -        return MSG_OP_CHAIN_EXEC_DPU;
>> -    default:
>> -        return MSG_OP_MAX_OPCODE;
>> +    if (!chann)
>> +        return -ENODEV;
>> +
>> +    ret = aie2_init_exec_req(&req, cmd_abo, &msg.send_size, 
>> &msg.opcode);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msg.handle = job;
>> +    msg.notify_cb = notify_cb;
>> +    msg.send_data = (u8 *)&req;
>> +    print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
>> +                 0x40, false);
>> +
>> +    ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "Send message failed");
>> +        return ret;
>>       }
>> +
>> +    return 0;
>>   }
>>     int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>> @@ -691,12 +814,13 @@ int aie2_cmdlist_multi_execbuf(struct 
>> amdxdna_hwctx *hwctx,
>>       struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>       struct amdxdna_client *client = hwctx->client;
>>       struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>> +    struct amdxdna_dev *xdna = client->xdna;
>>       struct amdxdna_cmd_chain *payload;
>>       struct xdna_mailbox_msg msg;
>> -    struct cmd_chain_req req;
>> +    union exec_chain_req req;
>>       u32 payload_len;
>>       u32 offset = 0;
>> -    u32 size;
>> +    size_t size;
>>       int ret;
>>       u32 op;
>>       u32 i;
>> @@ -707,41 +831,42 @@ int aie2_cmdlist_multi_execbuf(struct 
>> amdxdna_hwctx *hwctx,
>>           payload_len < struct_size(payload, data, 
>> payload->command_count))
>>           return -EINVAL;
>>   +    op = ERT_INVALID_CMD;
>>       for (i = 0; i < payload->command_count; i++) {
>>           u32 boh = (u32)(payload->data[i]);
>>           struct amdxdna_gem_obj *abo;
>>             abo = amdxdna_gem_get_obj(client, boh, AMDXDNA_BO_CMD);
>>           if (!abo) {
>> -            XDNA_ERR(client->xdna, "Failed to find cmd BO %d", boh);
>> +            XDNA_ERR(xdna, "Failed to find cmd BO %d", boh);
>>               return -ENOENT;
>>           }
>>   -        /* All sub-cmd should have same op, use the first one. */
>> -        if (i == 0)
>> -            op = amdxdna_cmd_get_op(abo);
>> -
>> -        ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, offset, 
>> abo, &size);
>> +        size = cmdbuf_abo->mem.size - offset;
>> +        ret = aie2_cmdlist_fill_slot(cmdbuf_abo->mem.kva + offset,
>> +                         abo, &size, &op);
>>           amdxdna_gem_put_obj(abo);
>>           if (ret)
>> -            return -EINVAL;
>> +            return ret;
>>             offset += size;
>>       }
>> +    msg.opcode = EXEC_MSG_OPS(xdna)->get_chain_msg_op(op);
>> +    if (msg.opcode == MSG_OP_MAX_OPCODE)
>> +        return -EOPNOTSUPP;
>>         /* The offset is the accumulated total size of the cmd buffer */
>> -    aie2_cmdlist_prepare_request(&req, cmdbuf_abo, offset, 
>> payload->command_count);
>> +    EXEC_MSG_OPS(xdna)->init_chain_req(&req, cmdbuf_abo->mem.dev_addr,
>> +                       offset, payload->command_count);
>> +    drm_clflush_virt_range(cmdbuf_abo->mem.kva, offset);
>>   -    msg.opcode = aie2_cmd_op_to_msg_op(op);
>> -    if (msg.opcode == MSG_OP_MAX_OPCODE)
>> -        return -EOPNOTSUPP;
>>       msg.handle = job;
>>       msg.notify_cb = notify_cb;
>>       msg.send_data = (u8 *)&req;
>>       msg.send_size = sizeof(req);
>>       ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>       if (ret) {
>> -        XDNA_ERR(hwctx->client->xdna, "Send message failed");
>> +        XDNA_ERR(xdna, "Send message failed");
>>           return ret;
>>       }
>>   @@ -754,23 +879,27 @@ int aie2_cmdlist_single_execbuf(struct 
>> amdxdna_hwctx *hwctx,
>>   {
>>       struct amdxdna_gem_obj *cmdbuf_abo = 
>> aie2_cmdlist_get_cmd_buf(job);
>>       struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>       struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>>       struct xdna_mailbox_msg msg;
>> -    struct cmd_chain_req req;
>> -    u32 size;
>> +    union exec_chain_req req;
>> +    u32 op = ERT_INVALID_CMD;
>> +    size_t size;
>>       int ret;
>> -    u32 op;
>>   -    op = amdxdna_cmd_get_op(cmd_abo);
>> -    ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, 0, cmd_abo, 
>> &size);
>> +    size = cmdbuf_abo->mem.size;
>> +    ret = aie2_cmdlist_fill_slot(cmdbuf_abo->mem.kva, cmd_abo, 
>> &size, &op);
>>       if (ret)
>>           return ret;
>>   -    aie2_cmdlist_prepare_request(&req, cmdbuf_abo, size, 1);
>> -
>> -    msg.opcode = aie2_cmd_op_to_msg_op(op);
>> +    msg.opcode = EXEC_MSG_OPS(xdna)->get_chain_msg_op(op);
>>       if (msg.opcode == MSG_OP_MAX_OPCODE)
>>           return -EOPNOTSUPP;
>> +
>> +    EXEC_MSG_OPS(xdna)->init_chain_req(&req, cmdbuf_abo->mem.dev_addr,
>> +                       size, 1);
>> +    drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
>> +
>>       msg.handle = job;
>>       msg.notify_cb = notify_cb;
>>       msg.send_data = (u8 *)&req;
>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>> index 2dbea1d09980..947daa63f064 100644
>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>> @@ -20,6 +20,7 @@ enum aie2_msg_opcode {
>>       MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
>>       MSG_OP_CHAIN_EXEC_DPU              = 0x13,
>>       MSG_OP_CONFIG_DEBUG_BO             = 0x14,
>> +    MSG_OP_CHAIN_EXEC_NPU              = 0x18,
>>       MSG_OP_MAX_XRT_OPCODE,
>>       MSG_OP_SUSPEND                     = 0x101,
>>       MSG_OP_RESUME                      = 0x102,
>> @@ -172,6 +173,16 @@ struct exec_dpu_req {
>>       __u32    payload[35];
>>   } __packed;
>>   +enum exec_npu_type {
>> +    EXEC_NPU_TYPE_NON_ELF        = 0x1,
>> +    EXEC_NPU_TYPE_PARTIAL_ELF    = 0x2,
>> +};
>> +
>> +union exec_req {
>> +    struct execute_buffer_req ebuf;
>> +    struct exec_dpu_req dpu_req;
>> +};
>> +
>>   struct execute_buffer_resp {
>>       enum aie2_msg_status    status;
>>   } __packed;
>> @@ -343,9 +354,6 @@ struct async_event_msg_resp {
>>   } __packed;
>>     #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
>> -#define slot_has_space(slot, offset, payload_size)        \
>> -    (MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) + \
>> -     sizeof(typeof(slot)))
>>     struct cmd_chain_slot_execbuf_cf {
>>       __u32 cu_idx;
>> @@ -363,12 +371,40 @@ struct cmd_chain_slot_dpu {
>>       __u32 args[] __counted_by(arg_cnt);
>>   };
>>   +#define MAX_NPU_ARGS_SIZE (26 * sizeof(__u32))
>> +struct cmd_chain_slot_npu {
>> +    enum exec_npu_type type;
>> +    u64 inst_buf_addr;
>> +    u64 save_buf_addr;
>> +    u64 restore_buf_addr;
>> +    u32 inst_size;
>> +    u32 save_size;
>> +    u32 restore_size;
>> +    u32 inst_prop_cnt;
>> +    u32 cu_idx;
>> +    u32 arg_cnt;
>> +    u32 args[] __counted_by(arg_cnt);
>> +} __packed;
>> +
>>   struct cmd_chain_req {
>>       __u64 buf_addr;
>>       __u32 buf_size;
>>       __u32 count;
>>   } __packed;
>>   +struct cmd_chain_npu_req {
>> +    u32 flags;
>> +    u32 reserved;
>> +    u64 buf_addr;
>> +    u32 buf_size;
>> +    u32 count;
>> +} __packed;
>> +
>> +union exec_chain_req {
>> +    struct cmd_chain_npu_req npu_req;
>> +    struct cmd_chain_req req;
>> +};
>> +
>>   struct cmd_chain_resp {
>>       enum aie2_msg_status    status;
>>       __u32            fail_cmd_idx;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 80313a2a98d4..d7ccbdaf47f5 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -55,6 +55,7 @@ struct mgmt_mbox_chann_info {
>>     static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>> fw_major, u32 fw_minor)
>>   {
>> +    const struct aie2_fw_feature_tbl *feature;
>>       struct amdxdna_dev *xdna = ndev->xdna;
>>         /*
>> @@ -78,6 +79,17 @@ static int aie2_check_protocol(struct 
>> amdxdna_dev_hdl *ndev, u32 fw_major, u32 f
>>           XDNA_ERR(xdna, "Firmware minor version smaller than 
>> supported");
>>           return -EINVAL;
>>       }
>> +
>> +    for (feature = ndev->priv->fw_feature_tbl; feature && 
>> feature->min_minor;
>> +         feature++) {
>> +        if (fw_minor < feature->min_minor)
>> +            continue;
>> +        if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>> +            continue;
>> +
>> +        set_bit(feature->feature, &ndev->feature_mask);
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -587,6 +599,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>       }
>>         release_firmware(fw);
>> +    aie2_msg_init(ndev);
>>       amdxdna_pm_init(xdna);
>>       return 0;
>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index cfe42b0d4242..d0a3cb1fe8be 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -156,6 +156,17 @@ enum aie2_dev_status {
>>       AIE2_DEV_START,
>>   };
>>   +struct aie2_exec_msg_ops {
>> +    int (*init_cu_req)(struct amdxdna_gem_obj *cmd_bo, void *req,
>> +               size_t *size, u32 *msg_op);
>> +    int (*init_dpu_req)(struct amdxdna_gem_obj *cmd_bo, void *req,
>> +                size_t *size, u32 *msg_op);
>> +    void (*init_chain_req)(void *req, u64 slot_addr, size_t size, 
>> u32 cmd_cnt);
>> +    int (*fill_cf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size);
>> +    int (*fill_dpu_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size);
>> +    u32 (*get_chain_msg_op)(u32 cmd_op);
>> +};
>> +
>>   struct amdxdna_dev_hdl {
>>       struct amdxdna_dev        *xdna;
>>       const struct amdxdna_dev_priv    *priv;
>> @@ -173,6 +184,8 @@ struct amdxdna_dev_hdl {
>>       u32                total_col;
>>       struct aie_version        version;
>>       struct aie_metadata        metadata;
>> +    unsigned long            feature_mask;
>> +    struct aie2_exec_msg_ops    *exec_msg_ops;
>>         /* power management and clock*/
>>       enum amdxdna_power_mode_type    pw_mode;
>> @@ -208,12 +221,26 @@ struct aie2_hw_ops {
>>       int (*set_dpm)(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>   };
>>   +enum aie2_fw_feature {
>> +    AIE2_NPU_COMMAND,
>> +    AIE2_FEATURE_MAX
>> +};
>> +
>> +struct aie2_fw_feature_tbl {
>> +    enum aie2_fw_feature feature;
>> +    u32 max_minor;
>> +    u32 min_minor;
>> +};
>> +
>> +#define AIE2_FEATURE_ON(ndev, feature)    test_bit(feature, 
>> &(ndev)->feature_mask)
>> +
>>   struct amdxdna_dev_priv {
>>       const char            *fw_path;
>>       u64                protocol_major;
>>       u64                protocol_minor;
>>       const struct rt_config        *rt_config;
>>       const struct dpm_clk_freq    *dpm_clk_tbl;
>> +    const struct aie2_fw_feature_tbl *fw_feature_tbl;
>>     #define COL_ALIGN_NONE   0
>>   #define COL_ALIGN_NATURE 1
>> @@ -239,6 +266,7 @@ extern const struct dpm_clk_freq 
>> npu1_dpm_clk_table[];
>>   extern const struct dpm_clk_freq npu4_dpm_clk_table[];
>>   extern const struct rt_config npu1_default_rt_cfg[];
>>   extern const struct rt_config npu4_default_rt_cfg[];
>> +extern const struct aie2_fw_feature_tbl npu4_fw_feature_table[];
>>     /* aie2_smu.c */
>>   int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>> @@ -263,6 +291,7 @@ int aie2_get_array_async_error(struct 
>> amdxdna_dev_hdl *ndev,
>>                      struct amdxdna_drm_get_array *args);
>>     /* aie2_message.c */
>> +void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>> u64 value);
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index d18182c59668..878cc955f56d 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -113,14 +113,14 @@ void *amdxdna_cmd_get_payload(struct 
>> amdxdna_gem_obj *abo, u32 *size)
>>       return &cmd->data[num_masks];
>>   }
>>   -int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>> +u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>>   {
>>       struct amdxdna_cmd *cmd = abo->mem.kva;
>>       u32 num_masks, i;
>>       u32 *cu_mask;
>>         if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
>> -        return -1;
>> +        return INVALID_CU_IDX;
>>         num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, 
>> cmd->header);
>>       cu_mask = cmd->data;
>> @@ -129,7 +129,7 @@ int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj 
>> *abo)
>>               return ffs(cu_mask[i]) - 1;
>>       }
>>   -    return -1;
>> +    return INVALID_CU_IDX;
>>   }
>>     /*
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index 919c654dfea6..1aa2b938e07b 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -13,9 +13,10 @@
>>   struct amdxdna_hwctx_priv;
>>     enum ert_cmd_opcode {
>> -    ERT_START_CU      = 0,
>> -    ERT_CMD_CHAIN     = 19,
>> -    ERT_START_NPU     = 20,
>> +    ERT_INVALID_CMD    = ~0U,
> ~0U > 20, shouldn't this be at the end of the enum?> + ERT_START_CU = 0,
>> +    ERT_CMD_CHAIN = 19,
>> +    ERT_START_NPU = 20,
>>   };
>>     enum ert_cmd_state {
>> @@ -64,6 +65,8 @@ struct amdxdna_cmd {
>>       u32 data[];
>>   };
>>   +#define INVALID_CU_IDX        (~0U)
>> +
>>   struct amdxdna_hwctx {
>>       struct amdxdna_client        *client;
>>       struct amdxdna_hwctx_priv    *priv;
>> @@ -150,7 +153,7 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
>>   }
>>     void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 
>> *size);
>> -int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>> +u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>>     void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index 23feb5f6fad3..ffc2e7c7b523 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -63,12 +63,18 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>       { 0 }
>>   };
>>   +static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>> +    { .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
>> +    { 0 }
>> +};
>> +
>>   static const struct amdxdna_dev_priv npu1_dev_priv = {
>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>>       .protocol_major = 0x5,
>>       .protocol_minor = 0x7,
>>       .rt_config    = npu1_default_rt_cfg,
>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>> +    .fw_feature_tbl = npu1_fw_feature_table,
>>       .col_align    = COL_ALIGN_NONE,
>>       .mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
>>       .mbox_size      = 0, /* Use BAR size */
>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>> b/drivers/accel/amdxdna/npu2_regs.c
>> index 67c2ae931c62..5fbfdcc3762d 100644
>> --- a/drivers/accel/amdxdna/npu2_regs.c
>> +++ b/drivers/accel/amdxdna/npu2_regs.c
>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>>       .protocol_minor = 0x6,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>       .col_align    = COL_ALIGN_NATURE,
>>       .mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
>>       .mbox_size      = 0, /* Use BAR size */
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index fac6c1b0b74b..79aba12acfde 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -83,12 +83,18 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>       { 0 }
>>   };
>>   +const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>> +    { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>> +    { 0 }
>> +};
>> +
>>   static const struct amdxdna_dev_priv npu4_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>       .protocol_major = 0x6,
>>       .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>       .col_align    = COL_ALIGN_NATURE,
>>       .mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
>>       .mbox_size      = 0, /* Use BAR size */
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index c91e1fa76ff5..c5e259ab9f49 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>>       .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>       .col_align    = COL_ALIGN_NATURE,
>>       .mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
>>       .mbox_size      = 0, /* Use BAR size */
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 773f738915a7..2de63b44d6e7 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>>       .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>       .col_align    = COL_ALIGN_NATURE,
>>       .mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
>>       .mbox_size      = 0, /* Use BAR size */
>
