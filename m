Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5FC32C80
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B31110E328;
	Tue,  4 Nov 2025 19:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Eu+lHq81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012017.outbound.protection.outlook.com
 [40.93.195.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A4410E328
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+0SEyB1E/29KUWR4GrCTy5sgVXyS4nUn8yyWrBnsE3BSZ+tHRKL4q6nzJb4ltjAcRvMIIJMW2NOV8zrQCPc56rx6oRaiyuR1cXGoJPUMY735W1QyrhzUMOS193UHUBn8cYtJkRZdpx/wnVe1rXP0+91iBW91dDYlPgGCt6vuqlCthuOGw4/4oS33UjKWc5BM8I/5jeavdu11MQ5n3RhHdPCiyAyBpmFbRbxb9UNF5OD3jPerbYuLEdWQ8OnB8Fg/8/9WUdWwwVmZoSNsYYV4FUy9To7AedfxLrKOYN4W6mJv/vMmkzyWoNpgh9wPL99UEMrUBH5GzMV3mIwwjkO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S3aqNLJm0DmEbTdtUWi4OEJdfLitqjJcmFmAskXtho=;
 b=uFTXfnFIlytCG+0hNWoiiY2rLMj489W9ncBEHmKTdzycHlanU8p+DlX+oMioEmNk6P0CiEFjDvrWXVKF868Y0goZZelaG34QohuTijaEJE0/+3rH0wqHdax0NqHFwdrt3tfmARciIE2v1zBx1VyIC025OJlacI4RBfZy0llvyZhjSPcBMyl+IkYK6zRCoZn38BqUfMAWuZeIaGb2h4kXKuYRaN0RSDICN+EkL/SgGat8KiGVuyoeGggCdHxoZCv5FXFcLDh9fVzyMas4O4QZbzE0obNvEcW42nelvirtzzoPUrftI0iRMPmZdIi8qCRSXpL6gA5sYdL73Le4eMYV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S3aqNLJm0DmEbTdtUWi4OEJdfLitqjJcmFmAskXtho=;
 b=Eu+lHq816UWgOgBFRy1ECI4wD4t5ol/huDS3M4wKiHNOO39XXdupmEYQmOyabWc13Vq5FmBK2bGtEbIJd4Plur+9toGhT9UTfvLmyLSaz+I2Hpr05jz9qUxnPAnlv7NIPFYHh775Pzp/khUO4/tsgQ2h/SyQtmFySt10FKhu7lk=
Received: from SN7PR04CA0109.namprd04.prod.outlook.com (2603:10b6:806:122::24)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Tue, 4 Nov 2025 19:28:30 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:122:cafe::f8) by SN7PR04CA0109.outlook.office365.com
 (2603:10b6:806:122::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 19:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 19:28:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Nov
 2025 11:28:28 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 4 Nov 2025 11:28:28 -0800
Message-ID: <8c9b2d14-96c4-d917-226e-b1422d1390c8@amd.com>
Date: Tue, 4 Nov 2025 11:28:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support preemption requests
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251104185340.897560-1-lizhi.hou@amd.com>
 <6011b225-ac26-4e64-ae35-db35055f7552@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <6011b225-ac26-4e64-ae35-db35055f7552@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 866f02ff-7a84-4822-73cc-08de1bd85577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ty9TL0VScFJNbXU4SzJmUkZvSFY1NkhhaiszdHBaSkJCMnAvY2VaVEFpUW9S?=
 =?utf-8?B?ZGZ2TGRmZVdMbkNjRGtPWGVJTFd4ZUVFZnppcHRRUnJGRW1EVVBmVmQvTEU2?=
 =?utf-8?B?MEI0dU1JVTNLV3ZVMjJVaFZKbnJsczNKWXZhWUxqRGxCbmk4emhvSWp0a1F1?=
 =?utf-8?B?amVvUGplRGxOcEdkSW5aRis3L2tPaVl3ZzExSDJLdnByUDg4dGkwak1hN0U2?=
 =?utf-8?B?YjFlYkZYT1pGMjJ2WVoxSGM2dlREWmVzREVjaGI0dHhaNHZoMTh3QUdhc0tH?=
 =?utf-8?B?Yi84RjdkalRmT2xacktCa2l5ZStHT1hpejVXUlRVQThBQ1g3ZERmMEo1eXpp?=
 =?utf-8?B?YTR5T0VGNE9TUHJsaUFVM3kxYUxmb1poRmpoR24xZ0lyV0R1VEF6eE9NdGl3?=
 =?utf-8?B?S2d5NlM0R0hYKzgzNi9hWVB1OFVSR2xuWkdGMjFyZi8vMDFST2s5amp4VC9v?=
 =?utf-8?B?L1hTUUNEKzM1OHgzQ1BjNDAyVFM4SHNtYkhqNWoxMDRmZTdNTkxobW9KQnJu?=
 =?utf-8?B?M3k3dUMrcTNhR2pGL0phcWRWeUY3MHNZS2hoelM3eStVNEd5SEV3dkJEdUJX?=
 =?utf-8?B?MWpmdnZNeTl2Zit4THJSWEpjekFKYzVBWlp5UCtXcmdHS2RsY3FzT0hzc1pR?=
 =?utf-8?B?dW52Z1RuZlRzSzNmeVZEWHByemZLZXN5REplVDhwU2krd1Z0YmltWkNVMENV?=
 =?utf-8?B?ZVV5cjNFZmRMRjZHRkRrMGFMTXVnck5zZlBTclFXNWw4ZnZ5ZUpXTGZGNEQ4?=
 =?utf-8?B?TTM0NVdwNFR0bE5vSjhrZEc4ZGRjMVRDbDNRTFJwVzBKcldLTEdkc2xiY2sx?=
 =?utf-8?B?TGtXUVFoMGRWL1NxaEo0NzlNRGpUbkFYUkpJVHcvVHhYTXpUb1ZwdGRkOWJK?=
 =?utf-8?B?aFZPeW91ZUZ4L1BkaW9Id3dZWmtQZlJnM0prSjU5YUJZVUcrU0VqMmhFNnkv?=
 =?utf-8?B?WngzM0RYQXZESlFnWmhPS0RBemlJbEczbUM2ZmpiVHFSNU05cUs5aVlUMzhz?=
 =?utf-8?B?RUFlSGVGRGtGTUJpYWJiVkZYcnFXRnNZM2hweUkrc0VpbVBnSVprQkxtMWU3?=
 =?utf-8?B?YndVaHRHWTkxRlZ1WHpsOGZwN2FIRnpVRVo0a0Zia1V4NjlIRkkrb3J2V2xs?=
 =?utf-8?B?Zk14d29IalM3VVBsTzFHNFVBTUtmb2pFR1BMWWwzbXZJMlNvdVZueG45aGty?=
 =?utf-8?B?Tm9aUmVXT3JaR2JvM0phWUJLWFpocTJVZ2ZLS0N5WlVTb0hhMUdLRUFTRzI5?=
 =?utf-8?B?Q1krV1BLZm1rb1M1dnpvWEh4WlRSaE5DbWZEL2k0RHg5d1ZZTjFVMU11VXNS?=
 =?utf-8?B?ZjUrcWVXY0gyK1ZaYWthd01qWHozOThtZWpjSkllci9Lb25QNnBaaEVwMVBv?=
 =?utf-8?B?L0dGc2pOdkhkb0tmWEJTYU5VeXdCYXRSUno3L2I5eWJKcXdaU3BnUE81bTVr?=
 =?utf-8?B?MDZzbWljd3ZSMjVMUFpDanlwWnUxS1I2azNOQnBhdkwwLzdJVDVscWc0VnI4?=
 =?utf-8?B?Wi9EcE9aaW1IZmMzdjBta0drMDdkSDAvVTlzaUtDaHJkTzdSSzFvdHlSaHNw?=
 =?utf-8?B?NytiaUVSMlkyMHh5Nkl2ZjJYMnluanR4TVFrQUVWK1kwOHY2Sm9lbEJjN2tO?=
 =?utf-8?B?SnhvajVjV0lGU0xZZUxUMUttK3F4TG1CeXQ2amEvVGhwVGxRUXpwYnJzQkNl?=
 =?utf-8?B?M2k0Vk4xSTJkVXBZSWxsaFl1WnQxeWc0WFh1QlNQZm9MenNHelNkK2FOTUdQ?=
 =?utf-8?B?RlV2ajZ4czh2QVFYMmI4Qk5TVlNyTjBkWk5TR1Q3NVdmUGs2VStOY3hBTXcz?=
 =?utf-8?B?RHplWkpTQWdNaHNHb2lhSFBWTVhralhRZDNDbFVrWUtvZDVDTDYrV2Z3Tm96?=
 =?utf-8?B?c08rd3BsT3NoaEJTcEtiWEhTOUk4cERYOGNMaUpCU3pXR3ZlK2F5TlVaNlRL?=
 =?utf-8?B?aFg0T2JValVlSzBTUEo5WS9SSnBHRUhPWThaeDk3MktjUGxEa3BUNmlJMy9k?=
 =?utf-8?B?dGsvSW5PL3UvMGRhcm5VZ3RGLzJyaHR5YkFwTkxtNVZGdzR5UVdOdGhWVjJi?=
 =?utf-8?B?OGQ4MEtWVDNvUnVSdEVKVjkveEp6cWdqUURtR1JtMVczRDJRaWpOWE9iTnkv?=
 =?utf-8?Q?+k8w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:28:29.3300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866f02ff-7a84-4822-73cc-08de1bd85577
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
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


On 11/4/25 10:58, Mario Limonciello wrote:
> On 11/4/25 12:53 PM, Lizhi Hou wrote:
>> The driver checks the firmware version during initialization.If 
>> preemption
>> is supported, the driver configures preemption accordingly and handles
>> userspace preemption requests. Otherwise, the driver returns an error 
>> for
>> userspace preemption requests.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c    | 95 +++++++++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_msg_priv.h   |  3 +
>>   drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h        |  8 +++
>>   drivers/accel/amdxdna/amdxdna_ctx.h     | 17 +++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>>   drivers/accel/amdxdna/npu4_regs.c       |  4 ++
>>   include/uapi/drm/amdxdna_accel.h        | 16 ++++-
>>   8 files changed, 207 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 69cdce9ff208..d493bb1c3360 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -210,6 +210,14 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>> *ndev, struct amdxdna_hwctx *hwct
>>       hwctx->fw_ctx_id = resp.context_id;
>>       WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>>   +    if (ndev->force_preempt_enabled) {
>> +        ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, 
>> &hwctx->fw_ctx_id);
>> +        if (ret) {
>> +            XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>>       cq_pair = &resp.cq_pair[0];
>>       x2i.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, 
>> cq_pair->x2i_q.head_addr);
>>       x2i.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, 
>> cq_pair->x2i_q.tail_addr);
>> @@ -601,6 +609,11 @@ aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *size)
>>       return 0;
>>   }
>>   +static int aie2_cmdlist_unsupp(struct amdxdna_gem_obj *cmd_bo, 
>> void *slot, size_t *size)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>>   static u32 aie2_get_chain_msg_op(u32 cmd_op)
>>   {
>>       switch (cmd_op) {
>> @@ -621,6 +634,8 @@ static struct aie2_exec_msg_ops 
>> legacy_exec_message_ops = {
>>       .init_chain_req = aie2_init_exec_chain_req,
>>       .fill_cf_slot = aie2_cmdlist_fill_cf,
>>       .fill_dpu_slot = aie2_cmdlist_fill_dpu,
>> +    .fill_preempt_slot = aie2_cmdlist_unsupp,
>> +    .fill_elf_slot = aie2_cmdlist_unsupp,
>>       .get_chain_msg_op = aie2_get_chain_msg_op,
>>   };
>>   @@ -680,6 +695,74 @@ aie2_cmdlist_fill_npu_dpu(struct 
>> amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>>       return 0;
>>   }
>>   +static int
>> +aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void 
>> *slot, size_t *size)
>> +{
>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>> +    struct amdxdna_cmd_preempt_data *pd;
>> +    u32 cmd_len;
>> +    u32 arg_sz;
>> +
>> +    pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    arg_sz = cmd_len - sizeof(*pd);
>> +    if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
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
>> +    npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
>> +    npu_slot->inst_buf_addr = pd->inst_buf;
>> +    npu_slot->save_buf_addr = pd->save_buf;
>> +    npu_slot->restore_buf_addr = pd->restore_buf;
>> +    npu_slot->inst_size = pd->inst_size;
>> +    npu_slot->save_size = pd->save_size;
>> +    npu_slot->restore_size = pd->restore_size;
>> +    npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
>> +    npu_slot->arg_cnt = arg_sz / sizeof(u32);
>> +    memcpy(npu_slot->args, pd->prop_args, arg_sz);
>
> Am I following this right?  I would think this should be:
>
> memcpy(npu_slot->args, pd->prop_args, npu_slot->arg_cnt);

npu_slot->arg_cnt is the number of u32. So arg_sz is used for memcpy here.


Thanks,

Lizhi

>
>> +
>> +    *size = sizeof(*npu_slot) + arg_sz;
>> +    return 0;
>> +}
>> +
>> +static int
>> +aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void 
>> *slot, size_t *size)
>> +{
>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>> +    struct amdxdna_cmd_preempt_data *pd;
>> +    u32 cmd_len;
>> +    u32 arg_sz;
>> +
>> +    pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>> +    arg_sz = cmd_len - sizeof(*pd);
>> +    if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
>> +        return -EINVAL;
>> +
>> +    if (*size < sizeof(*npu_slot) + arg_sz)
>> +        return -EINVAL;
>> +
>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>> +    npu_slot->type = EXEC_NPU_TYPE_ELF;
>> +    npu_slot->inst_buf_addr = pd->inst_buf;
>> +    npu_slot->save_buf_addr = pd->save_buf;
>> +    npu_slot->restore_buf_addr = pd->restore_buf;
>> +    npu_slot->inst_size = pd->inst_size;
>> +    npu_slot->save_size = pd->save_size;
>> +    npu_slot->restore_size = pd->restore_size;
>> +    npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
>> +    npu_slot->arg_cnt = 1;
>> +    npu_slot->args[0] = AIE2_EXEC_BUFFER_KERNEL_OP_TXN;
>> +
>> +    *size = struct_size(npu_slot, args, npu_slot->arg_cnt);
>> +    return 0;
>> +}
>> +
>>   static u32 aie2_get_npu_chain_msg_op(u32 cmd_op)
>>   {
>>       return MSG_OP_CHAIN_EXEC_NPU;
>> @@ -691,6 +774,8 @@ static struct aie2_exec_msg_ops 
>> npu_exec_message_ops = {
>>       .init_chain_req = aie2_init_npu_chain_req,
>>       .fill_cf_slot = aie2_cmdlist_fill_npu_cf,
>>       .fill_dpu_slot = aie2_cmdlist_fill_npu_dpu,
>> +    .fill_preempt_slot = aie2_cmdlist_fill_npu_preempt,
>> +    .fill_elf_slot = aie2_cmdlist_fill_npu_elf,
>>       .get_chain_msg_op = aie2_get_npu_chain_msg_op,
>>   };
>>   @@ -749,6 +834,16 @@ aie2_cmdlist_fill_slot(void *slot, struct 
>> amdxdna_gem_obj *cmd_abo,
>>       case ERT_START_NPU:
>>           ret = EXEC_MSG_OPS(xdna)->fill_dpu_slot(cmd_abo, slot, size);
>>           break;
>> +    case ERT_START_NPU_PREEMPT:
>> +        if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
>> +            return -EOPNOTSUPP;
>> +        ret = EXEC_MSG_OPS(xdna)->fill_preempt_slot(cmd_abo, slot, 
>> size);
>> +        break;
>> +    case ERT_START_NPU_PREEMPT_ELF:
>> +        if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
>> +            return -EOPNOTSUPP;
>> +        ret = EXEC_MSG_OPS(xdna)->fill_elf_slot(cmd_abo, slot, size);
>> +        break;
>>       default:
>>           XDNA_INFO(xdna, "Unsupported op %d", op);
>>           ret = -EOPNOTSUPP;
>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>> index 947daa63f064..1c957a6298d3 100644
>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>> @@ -176,6 +176,8 @@ struct exec_dpu_req {
>>   enum exec_npu_type {
>>       EXEC_NPU_TYPE_NON_ELF        = 0x1,
>>       EXEC_NPU_TYPE_PARTIAL_ELF    = 0x2,
>> +    EXEC_NPU_TYPE_PREEMPT        = 0x3,
>> +    EXEC_NPU_TYPE_ELF        = 0x4,
>>   };
>>     union exec_req {
>> @@ -372,6 +374,7 @@ struct cmd_chain_slot_dpu {
>>   };
>>     #define MAX_NPU_ARGS_SIZE (26 * sizeof(__u32))
>> +#define AIE2_EXEC_BUFFER_KERNEL_OP_TXN    3
>>   struct cmd_chain_slot_npu {
>>       enum exec_npu_type type;
>>       u64 inst_buf_addr;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index d7ccbdaf47f5..ceef1c502e9e 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -183,6 +183,10 @@ int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
>>           if (cfg->category != category)
>>               continue;
>>   +        if (cfg->feature_mask &&
>> +            bitmap_subset(&cfg->feature_mask, &ndev->feature_mask, 
>> AIE2_FEATURE_MAX))
>> +            continue;
>> +
>>           value = val ? *val : cfg->value;
>>           ret = aie2_set_runtime_cfg(ndev, cfg->type, value);
>>           if (ret) {
>> @@ -932,6 +936,25 @@ static int aie2_get_telemetry(struct 
>> amdxdna_client *client,
>>       return 0;
>>   }
>>   +static int aie2_get_preempt_state(struct amdxdna_client *client,
>> +                  struct amdxdna_drm_get_info *args)
>> +{
>> +    struct amdxdna_drm_attribute_state state = {};
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_dev_hdl *ndev;
>> +
>> +    ndev = xdna->dev_handle;
>> +    if (args->param == DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE)
>> +        state.state = ndev->force_preempt_enabled;
>> +    else if (args->param == 
>> DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE)
>> +        state.state = ndev->frame_boundary_preempt;
>> +
>> +    if (copy_to_user(u64_to_user_ptr(args->buffer), &state, 
>> sizeof(state)))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> +
>>   static int aie2_get_info(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_info *args)
>>   {
>>       struct amdxdna_dev *xdna = client->xdna;
>> @@ -972,6 +995,10 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
>>           ret = aie2_query_resource_info(client, args);
>>           break;
>> +    case DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE:
>> +    case DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE:
>> +        ret = aie2_get_preempt_state(client, args);
>> +        break;
>>       default:
>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>>           ret = -EOPNOTSUPP;
>> @@ -1078,6 +1105,38 @@ static int aie2_set_power_mode(struct 
>> amdxdna_client *client,
>>       return aie2_pm_set_mode(xdna->dev_handle, power_mode);
>>   }
>>   +static int aie2_set_preempt_state(struct amdxdna_client *client,
>> +                  struct amdxdna_drm_set_state *args)
>> +{
>> +    struct amdxdna_dev_hdl *ndev = client->xdna->dev_handle;
>> +    struct amdxdna_drm_attribute_state state;
>> +    u32 val;
>> +    int ret;
>> +
>> +    if (copy_from_user(&state, u64_to_user_ptr(args->buffer), 
>> sizeof(state)))
>> +        return -EFAULT;
>> +
>> +    if (state.state > 1)
>> +        return -EINVAL;
>> +
>> +    if (XDNA_MBZ_DBG(client->xdna, state.pad, sizeof(state.pad)))
>> +        return -EINVAL;
>> +
>> +    if (args->param == DRM_AMDXDNA_SET_FORCE_PREEMPT) {
>> +        ndev->force_preempt_enabled = state.state;
>> +    } else if (args->param == DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT) {
>> +        val = state.state;
>> +        ret = aie2_runtime_cfg(ndev, 
>> AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
>> +                       &val);
>> +        if (ret)
>> +            return ret;
>> +
>> +        ndev->frame_boundary_preempt = state.state;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int aie2_set_state(struct amdxdna_client *client,
>>                 struct amdxdna_drm_set_state *args)
>>   {
>> @@ -1095,6 +1154,10 @@ static int aie2_set_state(struct 
>> amdxdna_client *client,
>>       case DRM_AMDXDNA_SET_POWER_MODE:
>>           ret = aie2_set_power_mode(client, args);
>>           break;
>> +    case DRM_AMDXDNA_SET_FORCE_PREEMPT:
>> +    case DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT:
>> +        ret = aie2_set_preempt_state(client, args);
>> +        break;
>>       default:
>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>>           ret = -EOPNOTSUPP;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 9793cd1e0c55..a5f9c42155d1 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -110,12 +110,15 @@ struct aie_metadata {
>>   enum rt_config_category {
>>       AIE2_RT_CFG_INIT,
>>       AIE2_RT_CFG_CLK_GATING,
>> +    AIE2_RT_CFG_FORCE_PREEMPT,
>> +    AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
>>   };
>>     struct rt_config {
>>       u32    type;
>>       u32    value;
>>       u32    category;
>> +    unsigned long feature_mask;
>>   };
>>     struct dpm_clk_freq {
>> @@ -164,6 +167,8 @@ struct aie2_exec_msg_ops {
>>       void (*init_chain_req)(void *req, u64 slot_addr, size_t size, 
>> u32 cmd_cnt);
>>       int (*fill_cf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size);
>>       int (*fill_dpu_slot)(struct amdxdna_gem_obj *cmd_bo, void 
>> *slot, size_t *size);
>> +    int (*fill_preempt_slot)(struct amdxdna_gem_obj *cmd_bo, void 
>> *slot, size_t *size);
>> +    int (*fill_elf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, 
>> size_t *size);
>>       u32 (*get_chain_msg_op)(u32 cmd_op);
>>   };
>>   @@ -197,6 +202,8 @@ struct amdxdna_dev_hdl {
>>       u32                hclk_freq;
>>       u32                max_tops;
>>       u32                curr_tops;
>> +    u32                force_preempt_enabled;
>> +    u32                frame_boundary_preempt;
>>         /* Mailbox and the management channel */
>>       struct mailbox            *mbox;
>> @@ -223,6 +230,7 @@ struct aie2_hw_ops {
>>     enum aie2_fw_feature {
>>       AIE2_NPU_COMMAND,
>> +    AIE2_PREEMPT,
>>       AIE2_FEATURE_MAX
>>   };
>>   diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index d02fb32499fa..b6151244d64f 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -16,6 +16,8 @@ enum ert_cmd_opcode {
>>       ERT_START_CU = 0,
>>       ERT_CMD_CHAIN = 19,
>>       ERT_START_NPU = 20,
>> +    ERT_START_NPU_PREEMPT = 21,
>> +    ERT_START_NPU_PREEMPT_ELF = 22,
>>       ERT_INVALID_CMD    = ~0U,
>>   };
>>   @@ -55,6 +57,21 @@ struct amdxdna_cmd_chain {
>>       u64 data[] __counted_by(command_count);
>>   };
>>   +/*
>> + * Interpretation of the beginning of data payload for 
>> ERT_START_NPU_PREEMPT in
>> + * amdxdna_cmd. The rest of the payload in amdxdna_cmd is regular 
>> kernel args.
>> + */
>> +struct amdxdna_cmd_preempt_data {
>> +    u64 inst_buf;        /* instruction buffer address */
>> +    u64 save_buf;        /* save buffer address */
>> +    u64 restore_buf;    /* restore buffer address */
>> +    u32 inst_size;        /* size of instruction buffer in bytes */
>> +    u32 save_size;        /* size of save buffer in bytes */
>> +    u32 restore_size;   /* size of restore buffer in bytes */
>> +    u32 inst_prop_cnt;  /* properties count */
>> +    u32 prop_args[];    /* properties and regular kernel arguments */
>> +};
>> +
>>   /* Exec buffer command header format */
>>   #define AMDXDNA_CMD_STATE        GENMASK(3, 0)
>>   #define AMDXDNA_CMD_EXTRA_CU_MASK    GENMASK(11, 10)
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 7590265d4485..1973ab67721b 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -31,9 +31,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>    * 0.3: Support firmware debug buffer
>>    * 0.4: Support getting resource information
>>    * 0.5: Support getting telemetry data
>> + * 0.6: Support preemption
>>    */
>>   #define AMDXDNA_DRIVER_MAJOR        0
>> -#define AMDXDNA_DRIVER_MINOR        5
>> +#define AMDXDNA_DRIVER_MINOR        6
>>     /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>> use the
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index d90777275a9f..986a5f28ba24 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -64,10 +64,13 @@
>>   const struct rt_config npu4_default_rt_cfg[] = {
>>       { 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>>       { 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
>> +    { 14, 0, AIE2_RT_CFG_INIT, BIT_U64(AIE2_PREEMPT) }, /* Frame 
>> boundary preemption */
>>       { 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>       { 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>       { 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>       { 4, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>> +    { 13, 0, AIE2_RT_CFG_FORCE_PREEMPT },
>> +    { 14, 0, AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT },
>>       { 0 },
>>   };
>>   @@ -85,6 +88,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>     const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>>       { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>> +    { .feature = AIE2_PREEMPT, .min_minor = 12 },
>>       { 0 }
>>   };
>>   diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index 8ad254bc35a5..62c917fd4f7b 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -443,7 +443,9 @@ enum amdxdna_drm_get_param {
>>       DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>>       DRM_AMDXDNA_GET_POWER_MODE,
>>       DRM_AMDXDNA_QUERY_TELEMETRY,
>> -    DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
>> +    DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE,
>> +    DRM_AMDXDNA_QUERY_RESOURCE_INFO,
>> +    DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE,
>>   };
>>     /**
>> @@ -462,6 +464,16 @@ struct amdxdna_drm_get_resource_info {
>>       __u64 npu_task_curr;
>>   };
>>   +/**
>> + * struct amdxdna_drm_attribute_state - State of an attribute
>> + */
>> +struct amdxdna_drm_attribute_state {
>> +    /** @state: enabled or disabled */
>> +    __u8 state;
>> +    /** @pad: MBZ */
>> +    __u8 pad[7];
>> +};
>> +
>>   /**
>>    * struct amdxdna_drm_query_telemetry_header - Telemetry data header
>>    */
>> @@ -613,6 +625,8 @@ enum amdxdna_drm_set_param {
>>       DRM_AMDXDNA_SET_POWER_MODE,
>>       DRM_AMDXDNA_WRITE_AIE_MEM,
>>       DRM_AMDXDNA_WRITE_AIE_REG,
>> +    DRM_AMDXDNA_SET_FORCE_PREEMPT,
>> +    DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT,
>>   };
>>     /**
>
