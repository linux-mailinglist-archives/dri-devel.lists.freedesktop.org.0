Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC5C2D9A1
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300D210E45D;
	Mon,  3 Nov 2025 18:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vhDAoRUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3C010E201
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 18:10:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8llzF3MmZLOGmWJEH2IQ27jFPRrKU+nW4h+5Nr/Q79LjFC4TZVuJ3/rlGLgUOwV1C67PbgIOBM18luDwZpDH1OnrLt2uHwAwanBXlNB9bhijsHsqmXvMo/Gg5D0lzVn1eomiu9C4WejhXBC31Anh/Ol3D+1lYmyo88rCQjL+KEhRRtZu4ZJc7v40E7bAcMJ3f9cYTlnP3bb2Oe2NhPx8QDtoMrhbnRaUoO0LrfkfLma7eBtZBkSTNGKQNPuJhyc6iFnOImLUZO5B0I31Ie76RR8p0c8O1DO9/eoeD2p/tqIFwLxmV/C0IP80uZEYjHI99dmK0+hfqIy8SMb4b3bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYo1Kbhwjmt+yiCLZzJZfyhaSghjfGtGDkTWgWNX3RI=;
 b=vVUvaRtADWAS6oT70fJgvvXyCEkn+9N8wLlNCJozE4wi2AphGpYw0qiFVGRBtoe+ep2XbHz0XigF5JB59IxzIH2o9FZXkx6Wx2yo7gRfDWRi8p3eiTkmxnILZT2986cUDQjIQebdRD9FFdQ/LdI40kF0abtdMZo+CGX4bm4nIgN+wZcPgALsVcpdHmEU7NOTFJrohLODzroKnqAes9alKBjOaFdUt2gsEJ69agwqf/VZUDqUOim4ec7d8xhhtfyAE/6ANbCYnyqSNobbTcACpZ963lc7EnRSKZGzGEhroMybnP0q/RkgS0OZWPikgeM18bOrPsThazPLz7+3VmZMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYo1Kbhwjmt+yiCLZzJZfyhaSghjfGtGDkTWgWNX3RI=;
 b=vhDAoRUlITzT3vj7At6DQnCEcCVXpQ6+7TLzLwixlGywAcvOUIoMqABVtM6WFg9I5EsE/4LCZVpJ3p7Fg0mNAu8pP/aOWL+SdsXR3Mlv6nmFpweLaJUhM5IwsRAPwtm5Z3UVzQKrSgb8TWTcO+5JZTZxyo+ay5XV3rpa0gfr0uU=
Received: from SJ0PR03CA0146.namprd03.prod.outlook.com (2603:10b6:a03:33c::31)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Mon, 3 Nov
 2025 18:10:07 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::e7) by SJ0PR03CA0146.outlook.office365.com
 (2603:10b6:a03:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 18:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 18:10:06 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 10:10:06 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 10:10:05 -0800
Message-ID: <84aa358f-e719-7a38-6680-fa10f2114ae3@amd.com>
Date: Mon, 3 Nov 2025 10:10:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251031014700.2919349-1-lizhi.hou@amd.com>
 <493fe039-a9af-4b4c-b9c3-f61c8b46d678@kernel.org>
 <8affdff3-ead5-391e-72f1-f19581a0bdbf@amd.com>
In-Reply-To: <8affdff3-ead5-391e-72f1-f19581a0bdbf@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 2247d041-462b-4f8b-2425-08de1b043841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0ZtNWY0TStuOVJSZkZXclZ1b3JZdWpSZC9Ob0tSRkVFWTVVNGI0NmZzWjd6?=
 =?utf-8?B?WDBCV1FRaUUyWVd0MGJyRld5UE42Zkl0eTcrTlJjODJROGR0V1luRFJoOFZO?=
 =?utf-8?B?RG9CNVZzWlVUS2xjVHRZTHYvcngxWU4wUERXcGE5b1hyUERTY2l3azc0ZVpN?=
 =?utf-8?B?ZHpwbkkxTTltT3QzcWlOeU91SkdLOWc0WGFseTM0a2FIZG94dStkL2xiUnEz?=
 =?utf-8?B?WjF3dXRJSkFTbVRKdEdHL1V0N24rbGJlVjBwTmVFVXZPMURaZzZjZDgxR0FO?=
 =?utf-8?B?bXNDdkpSL0hYT252Sm1zSlBsWG9pSTM2ZVlMWG1BUjFqN3lBbXVnWFhWWjVT?=
 =?utf-8?B?clZ1eWpuWEVxZ1BqRzlkLy9tZytxcjZnejhLRC9UekNGKy93OXgwN0ZsTmVy?=
 =?utf-8?B?emRpVFIzcXl4V1AvU01NV3R4LytSL1VLOXhXanFtajJRVHJhZ3VJN0h4TlAr?=
 =?utf-8?B?cCtiSnhIVmRKOFdrMDdFOU5TOER2cksya2ZFSHdYcDJVZEljUWY3U2xNZUtz?=
 =?utf-8?B?T2NLZGRWUWcvRGZCVHdYRS8ySnBqeFRxRm5uWkoraGFSZUVON0hHS292d2FI?=
 =?utf-8?B?SDFmVFVYTXNvNDhUQklPdUhDd214dHoxNDluV0pQQ3QwUTdEblBmNW4vZy9m?=
 =?utf-8?B?NnVtYzdYMWphcUg1SHVNbkhBU3R6ZFFSOVZKWm55R24rZEdINzZzdkpwZGhq?=
 =?utf-8?B?cUxha3lSM0FyY29yYmN2K3l6SWRBakh0NkZlRzVRY1Y4ejdiUk9Pa3RDTWgr?=
 =?utf-8?B?UGxZT01Gbjk5TG5zWTI1YVpJaFo0QzIxS1EzVGcwRVFaclBuYzlwY3lXWDhn?=
 =?utf-8?B?OUF3bkRuRVo2eC9YenBkTkVtUkRJc053eUthTXBBaWNyRm4wYWxqeDkvZzVm?=
 =?utf-8?B?ZnBYOW9hWXQramxYVzlURFltLzJQR0hqdGRnMEF4K0sva3BodXpVTG95bG5W?=
 =?utf-8?B?ZzZDTlM1TVdGZEp1VFVmVE9WTHlITFNMWWV1amF2ZzNGNjRieU43MjFYSW5r?=
 =?utf-8?B?RGVTZHNmRTRBV0lGMjNZZmtqQWFBRlZES1ZtUWZXZXRwN2ZmRTgwZUZJSW1H?=
 =?utf-8?B?Uk9qWHdLOHdndi9TTlRFUG05R0JQR2NSRTlIM3Jvc0NLanlBL29KM0hIV1VH?=
 =?utf-8?B?bEJvMmdFQnBuUElWbUtyNytzd1Z5emZjR2xIbVkxeldYaUV1bTkyU09tWlpF?=
 =?utf-8?B?Y25lU2RkSUd1VDZQa3VIUDdodTY3a25aVHB2UU0xYktJOUtzSUZiYThlSkgz?=
 =?utf-8?B?cndmQjlOaVRFMUNPQm9nQzZ1c3pJTm9aK21vMG1vZ1FvR1Q4Y1lITWl3NVpp?=
 =?utf-8?B?OUtpK3ZvcHN3cDFSMS8vVUtPeFF1ME1QOCt4a1lteUVHaUNMQ21pdk1tR2Mr?=
 =?utf-8?B?d2h3VDVrM2ZhYU9aNEozblNjMWt6SUtiZlVSZFM4R3VWcnp2by82ZmpuSXFE?=
 =?utf-8?B?eldoRWU1TlF5dnJwQ0Z4d1ZXQUVuWm9ZTTFZVEFhaUtmemxxRHRtdGxaSFNL?=
 =?utf-8?B?V1ZTYmN1VjB6OVlnZ291YThGODhxTEROQUhIU3g2S0ROUzhuK1puaXZWQ1NK?=
 =?utf-8?B?WVpGY25PdkxnLy9lWXdRTVFQd2xjSm1waWUvN3BYd2VKK2hVRlFTS1lWYW9x?=
 =?utf-8?B?VHN0bXNUNlIwWHF0YlJEZ1ducG1zcFpxY3ZkK0JFY203M2g1ZEp0VnBENGFs?=
 =?utf-8?B?U1ZvN01temF4YUhRWnpHZStaQWl3YTd3ZXJRUkdmc3dxaHB4SmJLdU1qWGQ3?=
 =?utf-8?B?c2haWEtTT3ZEY0FSMXR0cUlISUVMZ2ZtU1dleDVtdlc4NG9mbGhQMDNZWWk4?=
 =?utf-8?B?cXcvUTJjNHNZN3NvUkZzdk40TlRyVDdTWWhJN1V0aXVGL0c0d3I1UlFQRVFw?=
 =?utf-8?B?QzgwUUV5M1NqcGZHT3UrdVlacWttbUZZRXhlYzZWTGxsbHpEeXhhQVd2eDZO?=
 =?utf-8?B?THNLVkcrSjVYSTZtVk1DUVNTZjZ5em9CMElLVytQWmowQ203c1BDSXJ2WnNy?=
 =?utf-8?B?VGpPdFNtVDZHemNIK1VRekhReWpOYk83UFZDZkQwT1ViS0F6dzhldHZwZEly?=
 =?utf-8?B?NmRvcjI4ZFR3T1QxMlpmcDJlSjhIYlBCZExKTVdlbENkaGhOSU1KRGFYaVlj?=
 =?utf-8?Q?HBBI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:10:06.9450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2247d041-462b-4f8b-2425-08de1b043841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435
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

Applied to drm-misc-next.

On 10/31/25 08:15, Lizhi Hou wrote:
>
> On 10/30/25 22:10, Mario Limonciello (AMD) (kernel.org) wrote:
>>
>>
>> On 10/30/2025 8:47 PM, Lizhi Hou wrote:
>>> MSG_OP_CHAIN_EXEC_NPU is a unified mailbox message that replaces
>>> MSG_OP_CHAIN_EXEC_BUFFER_CF and MSG_OP_CHAIN_EXEC_DPU.
>>>
>>> Add driver logic to check firmware version, and if 
>>> MSG_OP_CHAIN_EXEC_NPU
>>> is supported, uses it to submit firmware commands.
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>> Two small nits below to me.  Otherwise
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
> Thanks a lot. And I will fix the nits when I merge.
>
>
> Lizhi
>
>>
>>> ---
>>>   drivers/accel/amdxdna/aie2_message.c  | 443 
>>> +++++++++++++++++---------
>>>   drivers/accel/amdxdna/aie2_msg_priv.h |  42 ++-
>>>   drivers/accel/amdxdna/aie2_pci.c      |  13 +
>>>   drivers/accel/amdxdna/aie2_pci.h      |  29 ++
>>>   drivers/accel/amdxdna/amdxdna_ctx.c   |   6 +-
>>>   drivers/accel/amdxdna/amdxdna_ctx.h   |  11 +-
>>>   drivers/accel/amdxdna/npu1_regs.c     |   6 +
>>>   drivers/accel/amdxdna/npu2_regs.c     |   1 +
>>>   drivers/accel/amdxdna/npu4_regs.c     |   6 +
>>>   drivers/accel/amdxdna/npu5_regs.c     |   1 +
>>>   drivers/accel/amdxdna/npu6_regs.c     |   1 +
>>>   11 files changed, 392 insertions(+), 167 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>>> b/drivers/accel/amdxdna/aie2_message.c
>>> index 3a4c845d783a..4751a8aff0f7 100644
>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>> @@ -27,6 +27,8 @@
>>>   #define DECLARE_AIE2_MSG(name, op) \
>>>       DECLARE_XDNA_MSG_COMMON(name, op, MAX_AIE2_STATUS_CODE)
>>>   +#define EXEC_MSG_OPS(xdna) ((xdna)->dev_handle->exec_msg_ops)
>>> +
>>>   static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>>>                      struct xdna_mailbox_msg *msg)
>>>   {
>>> @@ -479,177 +481,291 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>>>       return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>>   }
>>>   -int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>>> amdxdna_sched_job *job,
>>> -         int (*notify_cb)(void *, void __iomem *, size_t))
>>> +static int aie2_init_exec_cu_req(struct amdxdna_gem_obj *cmd_bo, 
>>> void *req,
>>> +                 size_t *size, u32 *msg_op)
>>>   {
>>> -    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>> -    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>> -    struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>>> -    union {
>>> -        struct execute_buffer_req ebuf;
>>> -        struct exec_dpu_req dpu;
>>> -    } req;
>>> -    struct xdna_mailbox_msg msg;
>>> -    u32 payload_len;
>>> -    void *payload;
>>> -    int cu_idx;
>>> -    int ret;
>>> -    u32 op;
>>> +    struct execute_buffer_req *cu_req = req;
>>> +    u32 cmd_len;
>>> +    void *cmd;
>>>   -    if (!chann)
>>> -        return -ENODEV;
>>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    if (cmd_len > sizeof(cu_req->payload))
>>> +        return -EINVAL;
>>>   -    payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
>>> -    if (!payload) {
>>> -        XDNA_ERR(xdna, "Invalid command, cannot get payload");
>>> +    cu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (cu_req->cu_idx == INVALID_CU_IDX)
>>>           return -EINVAL;
>>> -    }
>>>   -    cu_idx = amdxdna_cmd_get_cu_idx(cmd_abo);
>>> -    if (cu_idx < 0) {
>>> -        XDNA_DBG(xdna, "Invalid cu idx");
>>> +    memcpy(cu_req->payload, cmd, cmd_len);
>>> +
>>> +    *size = sizeof(*cu_req);
>>> +    *msg_op = MSG_OP_EXECUTE_BUFFER_CF;
>>> +    return 0;
>>> +}
>>> +
>>> +static int aie2_init_exec_dpu_req(struct amdxdna_gem_obj *cmd_bo, 
>>> void *req,
>>> +                  size_t *size, u32 *msg_op)
>>> +{
>>> +    struct exec_dpu_req *dpu_req = req;
>>> +    struct amdxdna_cmd_start_npu *sn;
>>> +    u32 cmd_len;
>>> +
>>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
>>>           return -EINVAL;
>>> -    }
>>>   -    op = amdxdna_cmd_get_op(cmd_abo);
>>> -    switch (op) {
>>> -    case ERT_START_CU:
>>> -        if (unlikely(payload_len > sizeof(req.ebuf.payload)))
>>> -            XDNA_DBG(xdna, "Invalid ebuf payload len: %d", 
>>> payload_len);
>>> -        req.ebuf.cu_idx = cu_idx;
>>> -        memcpy(req.ebuf.payload, payload, sizeof(req.ebuf.payload));
>>> -        msg.send_size = sizeof(req.ebuf);
>>> -        msg.opcode = MSG_OP_EXECUTE_BUFFER_CF;
>>> -        break;
>>> -    case ERT_START_NPU: {
>>> -        struct amdxdna_cmd_start_npu *sn = payload;
>>> -
>>> -        if (unlikely(payload_len - sizeof(*sn) > 
>>> sizeof(req.dpu.payload)))
>>> -            XDNA_DBG(xdna, "Invalid dpu payload len: %d", 
>>> payload_len);
>>> -        req.dpu.inst_buf_addr = sn->buffer;
>>> -        req.dpu.inst_size = sn->buffer_size;
>>> -        req.dpu.inst_prop_cnt = sn->prop_count;
>>> -        req.dpu.cu_idx = cu_idx;
>>> -        memcpy(req.dpu.payload, sn->prop_args, 
>>> sizeof(req.dpu.payload));
>>> -        msg.send_size = sizeof(req.dpu);
>>> -        msg.opcode = MSG_OP_EXEC_DPU;
>>> -        break;
>>> -    }
>>> -    default:
>>> -        XDNA_DBG(xdna, "Invalid ERT cmd op code: %d", op);
>>> +    dpu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (dpu_req->cu_idx == INVALID_CU_IDX)
>>>           return -EINVAL;
>>> -    }
>>> -    msg.handle = job;
>>> -    msg.notify_cb = notify_cb;
>>> -    msg.send_data = (u8 *)&req;
>>> -    print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
>>> -                 0x40, false);
>>>   -    ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>> -    if (ret) {
>>> -        XDNA_ERR(xdna, "Send message failed");
>>> -        return ret;
>>> -    }
>>> +    dpu_req->inst_buf_addr = sn->buffer;
>>> +    dpu_req->inst_size = sn->buffer_size;
>>> +    dpu_req->inst_prop_cnt = sn->prop_count;
>>> +    memcpy(dpu_req->payload, sn->prop_args, cmd_len - sizeof(*sn));
>>>   +    *size = sizeof(*dpu_req);
>>> +    *msg_op = MSG_OP_EXEC_DPU;
>>>       return 0;
>>>   }
>>>   +static void aie2_init_exec_chain_req(void *req, u64 slot_addr, 
>>> size_t size, u32 cmd_cnt)
>>> +{
>>> +    struct cmd_chain_req *chain_req = req;
>>> +
>>> +    chain_req->buf_addr = slot_addr;
>>> +    chain_req->buf_size = size;
>>> +    chain_req->count = cmd_cnt;
>>> +}
>>> +
>>> +static void aie2_init_npu_chain_req(void *req, u64 slot_addr, 
>>> size_t size, u32 cmd_cnt)
>>> +{
>>> +    struct cmd_chain_npu_req *npu_chain_req = req;
>>> +
>>> +    npu_chain_req->flags = 0;
>>> +    npu_chain_req->reserved = 0;
>>> +    npu_chain_req->buf_addr = slot_addr;
>>> +    npu_chain_req->buf_size = size;
>>> +    npu_chain_req->count = cmd_cnt;
>>> +}
>>> +
>>>   static int
>>> -aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
>>> -                  struct amdxdna_gem_obj *abo, u32 *size)
>>> +aie2_cmdlist_fill_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>>> size_t *size)
>>>   {
>>> -    struct cmd_chain_slot_execbuf_cf *buf = cmd_buf + offset;
>>> -    int cu_idx = amdxdna_cmd_get_cu_idx(abo);
>>> -    u32 payload_len;
>>> -    void *payload;
>>> +    struct cmd_chain_slot_execbuf_cf *cf_slot = slot;
>>> +    u32 cmd_len;
>>> +    void *cmd;
>>>   -    if (cu_idx < 0)
>>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    if (*size < sizeof(*cf_slot) + cmd_len)
>>>           return -EINVAL;
>>>   -    payload = amdxdna_cmd_get_payload(abo, &payload_len);
>>> -    if (!payload)
>>> +    cf_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (cf_slot->cu_idx == INVALID_CU_IDX)
>>>           return -EINVAL;
>>>   -    if (!slot_has_space(*buf, offset, payload_len))
>>> -        return -ENOSPC;
>>> -
>>> -    buf->cu_idx = cu_idx;
>>> -    buf->arg_cnt = payload_len / sizeof(u32);
>>> -    memcpy(buf->args, payload, payload_len);
>>> -    /* Accurate buf size to hint firmware to do necessary copy */
>>> -    *size = sizeof(*buf) + payload_len;
>>> +    cf_slot->arg_cnt = cmd_len / sizeof(u32);
>>> +    memcpy(cf_slot->args, cmd, cmd_len);
>>> +    /* Accurate slot size to hint firmware to do necessary copy */
>>> +    *size = sizeof(*cf_slot) + cmd_len;
>>>       return 0;
>>>   }
>>>     static int
>>> -aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>>> -                   struct amdxdna_gem_obj *abo, u32 *size)
>>> +aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>>> size_t *size)
>>>   {
>>> -    struct cmd_chain_slot_dpu *buf = cmd_buf + offset;
>>> -    int cu_idx = amdxdna_cmd_get_cu_idx(abo);
>>> +    struct cmd_chain_slot_dpu *dpu_slot = slot;
>>>       struct amdxdna_cmd_start_npu *sn;
>>> -    u32 payload_len;
>>> -    void *payload;
>>> +    u32 cmd_len;
>>>       u32 arg_sz;
>>>   -    if (cu_idx < 0)
>>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    arg_sz = cmd_len - sizeof(*sn);
>>> +    if (cmd_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>>>           return -EINVAL;
>>>   -    payload = amdxdna_cmd_get_payload(abo, &payload_len);
>>> -    if (!payload)
>>> +    if (*size < sizeof(*dpu_slot) + arg_sz)
>>>           return -EINVAL;
>>> -    sn = payload;
>>> -    arg_sz = payload_len - sizeof(*sn);
>>> -    if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>>> +
>>> +    dpu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (dpu_slot->cu_idx == INVALID_CU_IDX)
>>>           return -EINVAL;
>>>   -    if (!slot_has_space(*buf, offset, arg_sz))
>>> -        return -ENOSPC;
>>> +    dpu_slot->inst_buf_addr = sn->buffer;
>>> +    dpu_slot->inst_size = sn->buffer_size;
>>> +    dpu_slot->inst_prop_cnt = sn->prop_count;
>>> +    dpu_slot->arg_cnt = arg_sz / sizeof(u32);
>>> +    memcpy(dpu_slot->args, sn->prop_args, arg_sz);
>>> +
>>> +    /* Accurate slot size to hint firmware to do necessary copy */
>>> +    *size = sizeof(*dpu_slot) + arg_sz;
>>> +    return 0;
>>> +}
>>> +
>>> +static u32 aie2_get_chain_msg_op(u32 cmd_op)
>>> +{
>>> +    switch (cmd_op) {
>>> +    case ERT_START_CU:
>>> +        return MSG_OP_CHAIN_EXEC_BUFFER_CF;
>>> +    case ERT_START_NPU:
>>> +        return MSG_OP_CHAIN_EXEC_DPU;
>>> +    default:
>>> +        break;
>>> +    }
>>>   -    buf->inst_buf_addr = sn->buffer;
>>> -    buf->inst_size = sn->buffer_size;
>>> -    buf->inst_prop_cnt = sn->prop_count;
>>> -    buf->cu_idx = cu_idx;
>>> -    buf->arg_cnt = arg_sz / sizeof(u32);
>>> -    memcpy(buf->args, sn->prop_args, arg_sz);
>>> +    return MSG_OP_MAX_OPCODE;
>>> +}
>>>   -    /* Accurate buf size to hint firmware to do necessary copy */
>>> -    *size = sizeof(*buf) + arg_sz;
>>> +static struct aie2_exec_msg_ops legacy_exec_message_ops = {
>>> +    .init_cu_req = aie2_init_exec_cu_req,
>>> +    .init_dpu_req = aie2_init_exec_dpu_req,
>>> +    .init_chain_req = aie2_init_exec_chain_req,
>>> +    .fill_cf_slot = aie2_cmdlist_fill_cf,
>>> +    .fill_dpu_slot = aie2_cmdlist_fill_dpu,
>>> +    .get_chain_msg_op = aie2_get_chain_msg_op,
>>> +};
>>> +
>>> +static int
>>> +aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void 
>>> *slot, size_t *size)
>>> +{
>>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>>> +    u32 cmd_len;
>>> +    void *cmd;
>>> +
>>> +    cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    if (*size < sizeof(*npu_slot) + cmd_len)
>>> +        return -EINVAL;
>>> +
>>> +    npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (npu_slot->cu_idx == INVALID_CU_IDX)
>>> +        return -EINVAL;
>>> +
>>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>>> +    npu_slot->type = EXEC_NPU_TYPE_NON_ELF;
>>> +    npu_slot->arg_cnt = cmd_len / sizeof(u32);
>>> +    memcpy(npu_slot->args, cmd, cmd_len);
>>> +
>>> +    *size = sizeof(*npu_slot) + cmd_len;
>>>       return 0;
>>>   }
>>>     static int
>>> -aie2_cmdlist_fill_one_slot(u32 op, struct amdxdna_gem_obj 
>>> *cmdbuf_abo, u32 offset,
>>> -               struct amdxdna_gem_obj *abo, u32 *size)
>>> +aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void 
>>> *slot, size_t *size)
>>> +{
>>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>>> +    struct amdxdna_cmd_start_npu *sn;
>>> +    u32 cmd_len;
>>> +    u32 arg_sz;
>>> +
>>> +    sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>> +    arg_sz = cmd_len - sizeof(*sn);
>>> +    if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
>>> +        return -EINVAL;
>>> +
>>> +    if (*size < sizeof(*npu_slot) + arg_sz)
>>> +        return -EINVAL;
>>> +
>>> +    npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>> +    if (npu_slot->cu_idx == INVALID_CU_IDX)
>>> +        return -EINVAL;
>>> +
>>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>>> +    npu_slot->type = EXEC_NPU_TYPE_PARTIAL_ELF;
>>> +    npu_slot->inst_buf_addr = sn->buffer;
>>> +    npu_slot->inst_size = sn->buffer_size;
>>> +    npu_slot->inst_prop_cnt = sn->prop_count;
>>> +    npu_slot->arg_cnt = arg_sz / sizeof(u32);
>>> +    memcpy(npu_slot->args, sn->prop_args, arg_sz);
>>> +
>>> +    *size = sizeof(*npu_slot) + arg_sz;
>>> +    return 0;
>>> +}
>>> +
>>> +static u32 aie2_get_npu_chain_msg_op(u32 cmd_op)
>>> +{
>>> +    return MSG_OP_CHAIN_EXEC_NPU;
>>> +}
>>> +
>>> +static struct aie2_exec_msg_ops npu_exec_message_ops = {
>>> +    .init_cu_req = aie2_init_exec_cu_req,
>>> +    .init_dpu_req = aie2_init_exec_dpu_req,
>>> +    .init_chain_req = aie2_init_npu_chain_req,
>>> +    .fill_cf_slot = aie2_cmdlist_fill_npu_cf,
>>> +    .fill_dpu_slot = aie2_cmdlist_fill_npu_dpu,
>>> +    .get_chain_msg_op = aie2_get_npu_chain_msg_op,
>>> +};
>>> +
>>> +static int aie2_init_exec_req(void *req, struct amdxdna_gem_obj 
>>> *cmd_abo,
>>> +                  size_t *size, u32 *msg_op)
>>>   {
>>> -    u32 this_op = amdxdna_cmd_get_op(abo);
>>> -    void *cmd_buf = cmdbuf_abo->mem.kva;
>>> +    struct amdxdna_dev *xdna = cmd_abo->client->xdna;
>>>       int ret;
>>> +    u32 op;
>>>   -    if (this_op != op) {
>>> -        ret = -EINVAL;
>>> -        goto done;
>>> -    }
>>>   +    op = amdxdna_cmd_get_op(cmd_abo);
>>>       switch (op) {
>>>       case ERT_START_CU:
>>> -        ret = aie2_cmdlist_fill_one_slot_cf(cmd_buf, offset, abo, 
>>> size);
>>> +        ret = EXEC_MSG_OPS(xdna)->init_cu_req(cmd_abo, req, size, 
>>> msg_op);
>>> +        if (ret) {
>>> +            XDNA_DBG(xdna, "Init CU req failed ret %d", ret);
>>> +            return ret;
>>> +        }
>>>           break;
>>>       case ERT_START_NPU:
>>> -        ret = aie2_cmdlist_fill_one_slot_dpu(cmd_buf, offset, abo, 
>>> size);
>>> +        ret = EXEC_MSG_OPS(xdna)->init_dpu_req(cmd_abo, req, size, 
>>> msg_op);
>>> +        if (ret) {
>>> +            XDNA_DBG(xdna, "Init DPU req failed ret %d", ret);
>>> +            return ret;
>>> +        }
>>> +
>>>           break;
>>>       default:
>>> +        XDNA_INFO(xdna, "Unsupported op %d", op);
>>
>> Shouldn't this be XDNA_ERR()?
>>
>>>           ret = -EOPNOTSUPP;
>>> +        break;
>>>       }
>>>   -done:
>>> -    if (ret) {
>>> -        XDNA_ERR(abo->client->xdna, "Can't fill slot for cmd op %d 
>>> ret %d",
>>> -             op, ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static int
>>> +aie2_cmdlist_fill_slot(void *slot, struct amdxdna_gem_obj *cmd_abo,
>>> +               size_t *size, u32 *cmd_op)
>>> +{
>>> +    struct amdxdna_dev *xdna = cmd_abo->client->xdna;
>>> +    int ret;
>>> +    u32 op;
>>> +
>>> +    op = amdxdna_cmd_get_op(cmd_abo);
>>> +    if (*cmd_op == ERT_INVALID_CMD)
>>> +        *cmd_op = op;
>>> +    else if (op != *cmd_op)
>>> +        return -EINVAL;
>>> +
>>> +    switch (op) {
>>> +    case ERT_START_CU:
>>> +        ret = EXEC_MSG_OPS(xdna)->fill_cf_slot(cmd_abo, slot, size);
>>> +        break;
>>> +    case ERT_START_NPU:
>>> +        ret = EXEC_MSG_OPS(xdna)->fill_dpu_slot(cmd_abo, slot, size);
>>> +        break;
>>> +    default:
>>> +        XDNA_INFO(xdna, "Unsupported op %d", op);
>>> +        ret = -EOPNOTSUPP;
>>> +        break;
>>>       }
>>> +
>>>       return ret;
>>>   }
>>>   +void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>>> +{
>>> +    if (AIE2_FEATURE_ON(ndev, AIE2_NPU_COMMAND))
>>> +        ndev->exec_msg_ops = &npu_exec_message_ops;
>>> +    else
>>> +        ndev->exec_msg_ops = &legacy_exec_message_ops;
>>> +}
>>> +
>>>   static inline struct amdxdna_gem_obj *
>>>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>>>   {
>>> @@ -658,29 +774,36 @@ aie2_cmdlist_get_cmd_buf(struct 
>>> amdxdna_sched_job *job)
>>>       return job->hwctx->priv->cmd_buf[idx];
>>>   }
>>>   -static void
>>> -aie2_cmdlist_prepare_request(struct cmd_chain_req *req,
>>> -                 struct amdxdna_gem_obj *cmdbuf_abo, u32 size, u32 
>>> cnt)
>>> +int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>>> amdxdna_sched_job *job,
>>> +         int (*notify_cb)(void *, void __iomem *, size_t))
>>>   {
>>> -    req->buf_addr = cmdbuf_abo->mem.dev_addr;
>>> -    req->buf_size = size;
>>> -    req->count = cnt;
>>> -    drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
>>> -    XDNA_DBG(cmdbuf_abo->client->xdna, "Command buf addr 0x%llx 
>>> size 0x%x count %d",
>>> -         req->buf_addr, size, cnt);
>>> -}
>>> +    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>> +    struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>>> +    struct xdna_mailbox_msg msg;
>>> +    union exec_req req;
>>> +    int ret;
>>>   -static inline u32
>>> -aie2_cmd_op_to_msg_op(u32 op)
>>> -{
>>> -    switch (op) {
>>> -    case ERT_START_CU:
>>> -        return MSG_OP_CHAIN_EXEC_BUFFER_CF;
>>> -    case ERT_START_NPU:
>>> -        return MSG_OP_CHAIN_EXEC_DPU;
>>> -    default:
>>> -        return MSG_OP_MAX_OPCODE;
>>> +    if (!chann)
>>> +        return -ENODEV;
>>> +
>>> +    ret = aie2_init_exec_req(&req, cmd_abo, &msg.send_size, 
>>> &msg.opcode);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    msg.handle = job;
>>> +    msg.notify_cb = notify_cb;
>>> +    msg.send_data = (u8 *)&req;
>>> +    print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
>>> +                 0x40, false);
>>> +
>>> +    ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>> +    if (ret) {
>>> +        XDNA_ERR(xdna, "Send message failed");
>>> +        return ret;
>>>       }
>>> +
>>> +    return 0;
>>>   }
>>>     int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>>> @@ -691,12 +814,13 @@ int aie2_cmdlist_multi_execbuf(struct 
>>> amdxdna_hwctx *hwctx,
>>>       struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>>       struct amdxdna_client *client = hwctx->client;
>>>       struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>       struct amdxdna_cmd_chain *payload;
>>>       struct xdna_mailbox_msg msg;
>>> -    struct cmd_chain_req req;
>>> +    union exec_chain_req req;
>>>       u32 payload_len;
>>>       u32 offset = 0;
>>> -    u32 size;
>>> +    size_t size;
>>>       int ret;
>>>       u32 op;
>>>       u32 i;
>>> @@ -707,41 +831,42 @@ int aie2_cmdlist_multi_execbuf(struct 
>>> amdxdna_hwctx *hwctx,
>>>           payload_len < struct_size(payload, data, 
>>> payload->command_count))
>>>           return -EINVAL;
>>>   +    op = ERT_INVALID_CMD;
>>>       for (i = 0; i < payload->command_count; i++) {
>>>           u32 boh = (u32)(payload->data[i]);
>>>           struct amdxdna_gem_obj *abo;
>>>             abo = amdxdna_gem_get_obj(client, boh, AMDXDNA_BO_CMD);
>>>           if (!abo) {
>>> -            XDNA_ERR(client->xdna, "Failed to find cmd BO %d", boh);
>>> +            XDNA_ERR(xdna, "Failed to find cmd BO %d", boh);
>>>               return -ENOENT;
>>>           }
>>>   -        /* All sub-cmd should have same op, use the first one. */
>>> -        if (i == 0)
>>> -            op = amdxdna_cmd_get_op(abo);
>>> -
>>> -        ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, offset, 
>>> abo, &size);
>>> +        size = cmdbuf_abo->mem.size - offset;
>>> +        ret = aie2_cmdlist_fill_slot(cmdbuf_abo->mem.kva + offset,
>>> +                         abo, &size, &op);
>>>           amdxdna_gem_put_obj(abo);
>>>           if (ret)
>>> -            return -EINVAL;
>>> +            return ret;
>>>             offset += size;
>>>       }
>>> +    msg.opcode = EXEC_MSG_OPS(xdna)->get_chain_msg_op(op);
>>> +    if (msg.opcode == MSG_OP_MAX_OPCODE)
>>> +        return -EOPNOTSUPP;
>>>         /* The offset is the accumulated total size of the cmd 
>>> buffer */
>>> -    aie2_cmdlist_prepare_request(&req, cmdbuf_abo, offset, 
>>> payload->command_count);
>>> +    EXEC_MSG_OPS(xdna)->init_chain_req(&req, cmdbuf_abo->mem.dev_addr,
>>> +                       offset, payload->command_count);
>>> +    drm_clflush_virt_range(cmdbuf_abo->mem.kva, offset);
>>>   -    msg.opcode = aie2_cmd_op_to_msg_op(op);
>>> -    if (msg.opcode == MSG_OP_MAX_OPCODE)
>>> -        return -EOPNOTSUPP;
>>>       msg.handle = job;
>>>       msg.notify_cb = notify_cb;
>>>       msg.send_data = (u8 *)&req;
>>>       msg.send_size = sizeof(req);
>>>       ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>>       if (ret) {
>>> -        XDNA_ERR(hwctx->client->xdna, "Send message failed");
>>> +        XDNA_ERR(xdna, "Send message failed");
>>>           return ret;
>>>       }
>>>   @@ -754,23 +879,27 @@ int aie2_cmdlist_single_execbuf(struct 
>>> amdxdna_hwctx *hwctx,
>>>   {
>>>       struct amdxdna_gem_obj *cmdbuf_abo = 
>>> aie2_cmdlist_get_cmd_buf(job);
>>>       struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>       struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>>>       struct xdna_mailbox_msg msg;
>>> -    struct cmd_chain_req req;
>>> -    u32 size;
>>> +    union exec_chain_req req;
>>> +    u32 op = ERT_INVALID_CMD;
>>> +    size_t size;
>>>       int ret;
>>> -    u32 op;
>>>   -    op = amdxdna_cmd_get_op(cmd_abo);
>>> -    ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, 0, cmd_abo, 
>>> &size);
>>> +    size = cmdbuf_abo->mem.size;
>>> +    ret = aie2_cmdlist_fill_slot(cmdbuf_abo->mem.kva, cmd_abo, 
>>> &size, &op);
>>>       if (ret)
>>>           return ret;
>>>   -    aie2_cmdlist_prepare_request(&req, cmdbuf_abo, size, 1);
>>> -
>>> -    msg.opcode = aie2_cmd_op_to_msg_op(op);
>>> +    msg.opcode = EXEC_MSG_OPS(xdna)->get_chain_msg_op(op);
>>>       if (msg.opcode == MSG_OP_MAX_OPCODE)
>>>           return -EOPNOTSUPP;
>>> +
>>> +    EXEC_MSG_OPS(xdna)->init_chain_req(&req, cmdbuf_abo->mem.dev_addr,
>>> +                       size, 1);
>>> +    drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
>>> +
>>>       msg.handle = job;
>>>       msg.notify_cb = notify_cb;
>>>       msg.send_data = (u8 *)&req;
>>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>>> index 2dbea1d09980..947daa63f064 100644
>>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>>> @@ -20,6 +20,7 @@ enum aie2_msg_opcode {
>>>       MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
>>>       MSG_OP_CHAIN_EXEC_DPU              = 0x13,
>>>       MSG_OP_CONFIG_DEBUG_BO             = 0x14,
>>> +    MSG_OP_CHAIN_EXEC_NPU              = 0x18,
>>>       MSG_OP_MAX_XRT_OPCODE,
>>>       MSG_OP_SUSPEND                     = 0x101,
>>>       MSG_OP_RESUME                      = 0x102,
>>> @@ -172,6 +173,16 @@ struct exec_dpu_req {
>>>       __u32    payload[35];
>>>   } __packed;
>>>   +enum exec_npu_type {
>>> +    EXEC_NPU_TYPE_NON_ELF        = 0x1,
>>> +    EXEC_NPU_TYPE_PARTIAL_ELF    = 0x2,
>>> +};
>>> +
>>> +union exec_req {
>>> +    struct execute_buffer_req ebuf;
>>> +    struct exec_dpu_req dpu_req;
>>> +};
>>> +
>>>   struct execute_buffer_resp {
>>>       enum aie2_msg_status    status;
>>>   } __packed;
>>> @@ -343,9 +354,6 @@ struct async_event_msg_resp {
>>>   } __packed;
>>>     #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
>>> -#define slot_has_space(slot, offset, payload_size)        \
>>> -    (MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) + \
>>> -     sizeof(typeof(slot)))
>>>     struct cmd_chain_slot_execbuf_cf {
>>>       __u32 cu_idx;
>>> @@ -363,12 +371,40 @@ struct cmd_chain_slot_dpu {
>>>       __u32 args[] __counted_by(arg_cnt);
>>>   };
>>>   +#define MAX_NPU_ARGS_SIZE (26 * sizeof(__u32))
>>> +struct cmd_chain_slot_npu {
>>> +    enum exec_npu_type type;
>>> +    u64 inst_buf_addr;
>>> +    u64 save_buf_addr;
>>> +    u64 restore_buf_addr;
>>> +    u32 inst_size;
>>> +    u32 save_size;
>>> +    u32 restore_size;
>>> +    u32 inst_prop_cnt;
>>> +    u32 cu_idx;
>>> +    u32 arg_cnt;
>>> +    u32 args[] __counted_by(arg_cnt);
>>> +} __packed;
>>> +
>>>   struct cmd_chain_req {
>>>       __u64 buf_addr;
>>>       __u32 buf_size;
>>>       __u32 count;
>>>   } __packed;
>>>   +struct cmd_chain_npu_req {
>>> +    u32 flags;
>>> +    u32 reserved;
>>> +    u64 buf_addr;
>>> +    u32 buf_size;
>>> +    u32 count;
>>> +} __packed;
>>> +
>>> +union exec_chain_req {
>>> +    struct cmd_chain_npu_req npu_req;
>>> +    struct cmd_chain_req req;
>>> +};
>>> +
>>>   struct cmd_chain_resp {
>>>       enum aie2_msg_status    status;
>>>       __u32            fail_cmd_idx;
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>>> b/drivers/accel/amdxdna/aie2_pci.c
>>> index 80313a2a98d4..d7ccbdaf47f5 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -55,6 +55,7 @@ struct mgmt_mbox_chann_info {
>>>     static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>>> fw_major, u32 fw_minor)
>>>   {
>>> +    const struct aie2_fw_feature_tbl *feature;
>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>         /*
>>> @@ -78,6 +79,17 @@ static int aie2_check_protocol(struct 
>>> amdxdna_dev_hdl *ndev, u32 fw_major, u32 f
>>>           XDNA_ERR(xdna, "Firmware minor version smaller than 
>>> supported");
>>>           return -EINVAL;
>>>       }
>>> +
>>> +    for (feature = ndev->priv->fw_feature_tbl; feature && 
>>> feature->min_minor;
>>> +         feature++) {
>>> +        if (fw_minor < feature->min_minor)
>>> +            continue;
>>> +        if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>>> +            continue;
>>> +
>>> +        set_bit(feature->feature, &ndev->feature_mask);
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>>   @@ -587,6 +599,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>>       }
>>>         release_firmware(fw);
>>> +    aie2_msg_init(ndev);
>>>       amdxdna_pm_init(xdna);
>>>       return 0;
>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>>> b/drivers/accel/amdxdna/aie2_pci.h
>>> index cfe42b0d4242..d0a3cb1fe8be 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>> @@ -156,6 +156,17 @@ enum aie2_dev_status {
>>>       AIE2_DEV_START,
>>>   };
>>>   +struct aie2_exec_msg_ops {
>>> +    int (*init_cu_req)(struct amdxdna_gem_obj *cmd_bo, void *req,
>>> +               size_t *size, u32 *msg_op);
>>> +    int (*init_dpu_req)(struct amdxdna_gem_obj *cmd_bo, void *req,
>>> +                size_t *size, u32 *msg_op);
>>> +    void (*init_chain_req)(void *req, u64 slot_addr, size_t size, 
>>> u32 cmd_cnt);
>>> +    int (*fill_cf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>>> size_t *size);
>>> +    int (*fill_dpu_slot)(struct amdxdna_gem_obj *cmd_bo, void 
>>> *slot, size_t *size);
>>> +    u32 (*get_chain_msg_op)(u32 cmd_op);
>>> +};
>>> +
>>>   struct amdxdna_dev_hdl {
>>>       struct amdxdna_dev        *xdna;
>>>       const struct amdxdna_dev_priv    *priv;
>>> @@ -173,6 +184,8 @@ struct amdxdna_dev_hdl {
>>>       u32                total_col;
>>>       struct aie_version        version;
>>>       struct aie_metadata        metadata;
>>> +    unsigned long            feature_mask;
>>> +    struct aie2_exec_msg_ops    *exec_msg_ops;
>>>         /* power management and clock*/
>>>       enum amdxdna_power_mode_type    pw_mode;
>>> @@ -208,12 +221,26 @@ struct aie2_hw_ops {
>>>       int (*set_dpm)(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>>   };
>>>   +enum aie2_fw_feature {
>>> +    AIE2_NPU_COMMAND,
>>> +    AIE2_FEATURE_MAX
>>> +};
>>> +
>>> +struct aie2_fw_feature_tbl {
>>> +    enum aie2_fw_feature feature;
>>> +    u32 max_minor;
>>> +    u32 min_minor;
>>> +};
>>> +
>>> +#define AIE2_FEATURE_ON(ndev, feature)    test_bit(feature, 
>>> &(ndev)->feature_mask)
>>> +
>>>   struct amdxdna_dev_priv {
>>>       const char            *fw_path;
>>>       u64                protocol_major;
>>>       u64                protocol_minor;
>>>       const struct rt_config        *rt_config;
>>>       const struct dpm_clk_freq    *dpm_clk_tbl;
>>> +    const struct aie2_fw_feature_tbl *fw_feature_tbl;
>>>     #define COL_ALIGN_NONE   0
>>>   #define COL_ALIGN_NATURE 1
>>> @@ -239,6 +266,7 @@ extern const struct dpm_clk_freq 
>>> npu1_dpm_clk_table[];
>>>   extern const struct dpm_clk_freq npu4_dpm_clk_table[];
>>>   extern const struct rt_config npu1_default_rt_cfg[];
>>>   extern const struct rt_config npu4_default_rt_cfg[];
>>> +extern const struct aie2_fw_feature_tbl npu4_fw_feature_table[];
>>>     /* aie2_smu.c */
>>>   int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>>> @@ -263,6 +291,7 @@ int aie2_get_array_async_error(struct 
>>> amdxdna_dev_hdl *ndev,
>>>                      struct amdxdna_drm_get_array *args);
>>>     /* aie2_message.c */
>>> +void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>>> u64 value);
>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>>> index d18182c59668..878cc955f56d 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>> @@ -113,14 +113,14 @@ void *amdxdna_cmd_get_payload(struct 
>>> amdxdna_gem_obj *abo, u32 *size)
>>>       return &cmd->data[num_masks];
>>>   }
>>>   -int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>>> +u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>>>   {
>>>       struct amdxdna_cmd *cmd = abo->mem.kva;
>>>       u32 num_masks, i;
>>>       u32 *cu_mask;
>>>         if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
>>> -        return -1;
>>> +        return INVALID_CU_IDX;
>>>         num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, 
>>> cmd->header);
>>>       cu_mask = cmd->data;
>>> @@ -129,7 +129,7 @@ int amdxdna_cmd_get_cu_idx(struct 
>>> amdxdna_gem_obj *abo)
>>>               return ffs(cu_mask[i]) - 1;
>>>       }
>>>   -    return -1;
>>> +    return INVALID_CU_IDX;
>>>   }
>>>     /*
>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>>> index 919c654dfea6..1aa2b938e07b 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>>> @@ -13,9 +13,10 @@
>>>   struct amdxdna_hwctx_priv;
>>>     enum ert_cmd_opcode {
>>> -    ERT_START_CU      = 0,
>>> -    ERT_CMD_CHAIN     = 19,
>>> -    ERT_START_NPU     = 20,
>>> +    ERT_INVALID_CMD    = ~0U,
>> ~0U > 20, shouldn't this be at the end of the enum?> + ERT_START_CU = 0,
>>> +    ERT_CMD_CHAIN = 19,
>>> +    ERT_START_NPU = 20,
>>>   };
>>>     enum ert_cmd_state {
>>> @@ -64,6 +65,8 @@ struct amdxdna_cmd {
>>>       u32 data[];
>>>   };
>>>   +#define INVALID_CU_IDX        (~0U)
>>> +
>>>   struct amdxdna_hwctx {
>>>       struct amdxdna_client        *client;
>>>       struct amdxdna_hwctx_priv    *priv;
>>> @@ -150,7 +153,7 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
>>>   }
>>>     void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 
>>> *size);
>>> -int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>>> +u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>>>     void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>>> b/drivers/accel/amdxdna/npu1_regs.c
>>> index 23feb5f6fad3..ffc2e7c7b523 100644
>>> --- a/drivers/accel/amdxdna/npu1_regs.c
>>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>>> @@ -63,12 +63,18 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>>       { 0 }
>>>   };
>>>   +static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>>> +    { .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
>>> +    { 0 }
>>> +};
>>> +
>>>   static const struct amdxdna_dev_priv npu1_dev_priv = {
>>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>>>       .protocol_major = 0x5,
>>>       .protocol_minor = 0x7,
>>>       .rt_config    = npu1_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>> +    .fw_feature_tbl = npu1_fw_feature_table,
>>>       .col_align    = COL_ALIGN_NONE,
>>>       .mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
>>>       .mbox_size      = 0, /* Use BAR size */
>>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>>> b/drivers/accel/amdxdna/npu2_regs.c
>>> index 67c2ae931c62..5fbfdcc3762d 100644
>>> --- a/drivers/accel/amdxdna/npu2_regs.c
>>> +++ b/drivers/accel/amdxdna/npu2_regs.c
>>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv 
>>> = {
>>>       .protocol_minor = 0x6,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>>       .col_align    = COL_ALIGN_NATURE,
>>>       .mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
>>>       .mbox_size      = 0, /* Use BAR size */
>>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>>> b/drivers/accel/amdxdna/npu4_regs.c
>>> index fac6c1b0b74b..79aba12acfde 100644
>>> --- a/drivers/accel/amdxdna/npu4_regs.c
>>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>>> @@ -83,12 +83,18 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>>       { 0 }
>>>   };
>>>   +const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>>> +    { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>>> +    { 0 }
>>> +};
>>> +
>>>   static const struct amdxdna_dev_priv npu4_dev_priv = {
>>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>>       .protocol_major = 0x6,
>>>       .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>>       .col_align    = COL_ALIGN_NATURE,
>>>       .mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
>>>       .mbox_size      = 0, /* Use BAR size */
>>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>>> b/drivers/accel/amdxdna/npu5_regs.c
>>> index c91e1fa76ff5..c5e259ab9f49 100644
>>> --- a/drivers/accel/amdxdna/npu5_regs.c
>>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv 
>>> = {
>>>       .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>>       .col_align    = COL_ALIGN_NATURE,
>>>       .mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
>>>       .mbox_size      = 0, /* Use BAR size */
>>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>>> b/drivers/accel/amdxdna/npu6_regs.c
>>> index 773f738915a7..2de63b44d6e7 100644
>>> --- a/drivers/accel/amdxdna/npu6_regs.c
>>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>>> @@ -67,6 +67,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv 
>>> = {
>>>       .protocol_minor = 12,
>>>       .rt_config    = npu4_default_rt_cfg,
>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>> +    .fw_feature_tbl = npu4_fw_feature_table,
>>>       .col_align    = COL_ALIGN_NATURE,
>>>       .mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
>>>       .mbox_size      = 0, /* Use BAR size */
>>
