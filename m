Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1DC36EA3
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FE010E2DE;
	Wed,  5 Nov 2025 17:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xIxyWjtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013067.outbound.protection.outlook.com
 [40.107.201.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FD810E2DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgoM04zjzd0xcRoqU34x5QQjBjBQJPBIQxIhBFKdXE7V6sivF7IIYbHOcSimMRycGKcDoM/SEAWG+jsNWMkTiQvG3oY/HXccdjCMobqBvqgM7RkKfIFaXCZ6E87CkNCuBqUOvsjJvoWluvjl8qnMfjacdlv43Nhh5kHliExgI4kFHnmn8mct4JEfoDrq1iQt+kiO6QliU0CSpVTo3+R1zu4eHUR1M46vMKD4qKCQnEmk+MSNwXTLKGBpGCG1qur/fEASRGhF9+Kw0q7jrduXnpjN6FHUlUbsKPrC8nH8jMiMjkNSsa/bt5b9sq85CZhW+93It2M6F6+97tPcs+medQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YDr7ho636c+K1EMNIPd/uhYFqEg8ViRIdekMUjNeys=;
 b=FF/wfETD4OE+ApfEAMgC7vMw6PIn7DmjG/lg7Ba+1mjz7E8hmwiZZokvIPgkl0X5GzxRjDSLgUeSUG8SriummNropgqt/Tvns2VVl6HDQdpMt4m+rJQDU6CFn5JbzPMp9hPsXGH3OfnX+V8nVKBErjT7paN3Ngt1j7XFm5t2QrgtzWMztsq+uMpvh4Fw9FbAthTJMNN5hiD+4QZvwcLMNkXPFhbLx6SKXFpROS5CyCcuhU6pFMAVT+igJ+QOqaff/8CGOGvoB8i7WQ5rzhnhDxoxnbQpHkjt7k6TDflF6a5Iami8fTwD8jO2b7dOxRPO1WC3LcxPzNjaUBlWdvKESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YDr7ho636c+K1EMNIPd/uhYFqEg8ViRIdekMUjNeys=;
 b=xIxyWjtHbYYJ0EfsO2h2/TKGl0ivlOC7Ptd9B0Hfe3O8TwJ5+pKfntHqTEmxNDP2ES5tklugsYK6rKupj0cDzEMDqWOrQ2uBh/7hnsv1gdVGLb7igxjj7Tiu1iwDzwCmtcai9ki2VEbzhZQwfiK9bT7dwFELIetuYCo4s2HXjCA=
Received: from DM5PR07CA0070.namprd07.prod.outlook.com (2603:10b6:4:ad::35) by
 DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 17:05:22 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::39) by DM5PR07CA0070.outlook.office365.com
 (2603:10b6:4:ad::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 17:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 17:05:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 5 Nov
 2025 09:05:22 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Nov
 2025 11:05:22 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 09:05:21 -0800
Message-ID: <29234ea6-5cb0-cfed-d9a3-be48a914ab4f@amd.com>
Date: Wed, 5 Nov 2025 09:05:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support preemption requests
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251104185340.897560-1-lizhi.hou@amd.com>
 <6011b225-ac26-4e64-ae35-db35055f7552@amd.com>
 <8c9b2d14-96c4-d917-226e-b1422d1390c8@amd.com>
 <851cd32b-e64e-4e56-bf49-7c8b3336815f@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <851cd32b-e64e-4e56-bf49-7c8b3336815f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DM6PR12MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: a3fd5f02-a9e1-4f35-094e-08de1c8d81c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3JqQzFNTnliMW15M0I4bGEwTGM5ZWY1YnJsSThnMDNpeVhtNjFBVVFmd2l3?=
 =?utf-8?B?eDMwUmZsWFh6ZVROS0poNnNncitMOW4vNW5pS0NpRmFXc3h2U3hoSzNmMjdL?=
 =?utf-8?B?N3M1blpnZjNvVTk1MVJybVZlbzZ6V3c3dytTbDhUVjJ4T1NBczlqTzdwaW1I?=
 =?utf-8?B?M2dhazllS0hsMGU0cW9nUkVYb1dWOExVeXBOUnpSREJ4OGJBVXdRZGRJbVpo?=
 =?utf-8?B?MlFKMS9pQ1d6ZkJnbkZBZEp0cE9uMFk2NnpzRXQ2TTExQnF1TVVTbmpFb3ha?=
 =?utf-8?B?ZnBWZ1ErdUlzYjVIRmJFR3VzM1YyTm9CZ3JtTUdweG1aZ1EzamREaUYxNmU3?=
 =?utf-8?B?QUE3RUZtOHZ0K2xXL0pOZ29oUjUvK2RKaG4yL2RWOWFrckJrVUsrWlpYeDE1?=
 =?utf-8?B?SEp2SC9DRkZmRk94eFk1dmhTeExxVThYYk84L01XQ2tYT0hnVzNkMExJQjlU?=
 =?utf-8?B?Qy9GOHBIVmtvd0FEYW1hdFlMMW1XbWhZeXFoRzlDcTJ4V0RQZkwrU0Y2R0kv?=
 =?utf-8?B?blZBbzZ4WWowcmZ3VkEySENYKzNubzVoeFpuYnVFT0RLYThUOWd6UEhZSTRB?=
 =?utf-8?B?UUlES1lXYkFKN3VHak5aUjhKZGY2QnFOK2lhazN1OEE2MC9DY1FBa3VKeHBZ?=
 =?utf-8?B?K0MvOExtRUM0a2ZuUWp0U3dtK1BtaSsxc2NHT0dKVTdzcmlaV3JEK201clQ2?=
 =?utf-8?B?aFZUUG43S25TSEJJYmZhbDZVUkJhNmw5SFRvd1ZPNDNoRlYwRW9rYW9NeitI?=
 =?utf-8?B?MWFlNFRvNWpsZWErNm1rbWh3MG9kNFRWR3BHQk5yUVkrQXV3bjdUVHpiTGlS?=
 =?utf-8?B?WVc1YzdXQTdmQS9TWWc5OWdQNU5NaWQ3QnRGR0ZzRHh6dVg5T3N3S0p1MlVz?=
 =?utf-8?B?clAzSlhNNWFKSHBvNnZmVjBtSUIxM0tudXl3WnFVNGkzbTBlRVJpMEZqN2dG?=
 =?utf-8?B?R0IwWGlsSWFjTWVSYjQvYVRCZnQ2OGZHQVp6S0ZaMFlrUHpBbTdwUVBVdjJU?=
 =?utf-8?B?ZCtwdHp2QnJMRjBFeWpXL3NQdlpkdmxPWXdBTWVmanE2allXMDUxZVY3L09x?=
 =?utf-8?B?SGR1VEx0c1VCOWFmRE9MK1JreEpqWGJuNUlLRFh5QjcvWENFVnkyWkVFVnZS?=
 =?utf-8?B?SFlCOWFSQS9hbEo3TDFGcHdDMit4eFh3akNnS3hLWlg1bEtSSUZCSU9OKzlt?=
 =?utf-8?B?N2xLZkdSTTQyWWJIbW8xWXVrQWpZbkRWaHhERzNXaEFYR1BPc3NoakhhOURB?=
 =?utf-8?B?L0J0LzEvOG5QbW1HNmpjcHN3SmE5T2pRVnZMK0g2am5SMTZxM0ZpOXJ0K3BO?=
 =?utf-8?B?VU9iZUlUSUt2c0F0MC9wQzllQytUM2Zhb2haZHQ5Z2lBNGdEV0JjZGJyRjg3?=
 =?utf-8?B?VEtEbG81VU90Y0sraXdUTExidGI0d3NSNWNwa1JLVU9HN3RwNGhaN0tZb0kz?=
 =?utf-8?B?VGErS0txRzNKRW9kUEpab0xkMWVudlZPSzQ5Q016YXY5WEowNG85T0U1NmlP?=
 =?utf-8?B?VjZ6QjhlSG4waWVNVXlKajlDT28vb2R4dEtJQ1dSTW5sVThuZ1g3NWpRQUhH?=
 =?utf-8?B?UStiRFhWTU9YUW03OGZDM3NsRXVsV0lOODlIM0RFMkN5MzJua1JDbzVpNmc5?=
 =?utf-8?B?YWp5eHBoOE1pNTRlNG5RNDZaTG9tMytmMjdPRFphdXZKbkI4aE9CV1EvOXBo?=
 =?utf-8?B?ZDVDdUZVM05yV1Yyd25yVWdzeG5oZ2cxcHdldCsrWm1iUGpSeXJsNmpSSFkr?=
 =?utf-8?B?b3Z1TmU1dW9VQlgzNEZyNG5Ub0MyL2EzeHBHcUJUb3IwRlhHR2xnbWhpYW8r?=
 =?utf-8?B?endiY2JjdFhUalJlaXBNVUlDWnR5UWZsS1JaeXRMZk0wWlFqdkdPQU5pNmE2?=
 =?utf-8?B?MjNGR284ZGJ6eUxhclVQa1I2UUtpclM3SXpnSVJGMjVWc1FUQytSMDRIM2h4?=
 =?utf-8?B?WHVSallIZjQ0WloxUXpKbVcySDZoUi9Dc2ZlNnl0YXRNc2U2TUpZMmNLTWtN?=
 =?utf-8?B?UHZQZ2pTbmdIa1loeXcwWGMxUXhJZFZSQmdIWmVjZkw3RTlLdzlNZDFMeEJj?=
 =?utf-8?B?eWphYW4yRU9EeWxtTXZrdHpDeXFxZ29tNFNIVGVuR25oTEd0N3RJQ1FVZk9v?=
 =?utf-8?Q?NT4k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 17:05:22.5607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fd5f02-a9e1-4f35-094e-08de1c8d81c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
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

Applied to drm-misc-next

On 11/4/25 11:30, Mario Limonciello wrote:
> On 11/4/25 1:28 PM, Lizhi Hou wrote:
>>
>> On 11/4/25 10:58, Mario Limonciello wrote:
>>> On 11/4/25 12:53 PM, Lizhi Hou wrote:
>>>> The driver checks the firmware version during initialization.If 
>>>> preemption
>>>> is supported, the driver configures preemption accordingly and handles
>>>> userspace preemption requests. Otherwise, the driver returns an 
>>>> error for
>>>> userspace preemption requests.
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_message.c    | 95 
>>>> +++++++++++++++++++++++++
>>>>   drivers/accel/amdxdna/aie2_msg_priv.h   |  3 +
>>>>   drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++++++++
>>>>   drivers/accel/amdxdna/aie2_pci.h        |  8 +++
>>>>   drivers/accel/amdxdna/amdxdna_ctx.h     | 17 +++++
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>>>>   drivers/accel/amdxdna/npu4_regs.c       |  4 ++
>>>>   include/uapi/drm/amdxdna_accel.h        | 16 ++++-
>>>>   8 files changed, 207 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>> amdxdna/aie2_message.c
>>>> index 69cdce9ff208..d493bb1c3360 100644
>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>> @@ -210,6 +210,14 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>>>> *ndev, struct amdxdna_hwctx *hwct
>>>>       hwctx->fw_ctx_id = resp.context_id;
>>>>       WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>>>>   +    if (ndev->force_preempt_enabled) {
>>>> +        ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, 
>>>> &hwctx->fw_ctx_id);
>>>> +        if (ret) {
>>>> +            XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +
>>>>       cq_pair = &resp.cq_pair[0];
>>>>       x2i.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair- 
>>>> >x2i_q.head_addr);
>>>>       x2i.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair- 
>>>> >x2i_q.tail_addr);
>>>> @@ -601,6 +609,11 @@ aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj 
>>>> *cmd_bo, void *slot, size_t *size)
>>>>       return 0;
>>>>   }
>>>>   +static int aie2_cmdlist_unsupp(struct amdxdna_gem_obj *cmd_bo, 
>>>> void *slot, size_t *size)
>>>> +{
>>>> +    return -EOPNOTSUPP;
>>>> +}
>>>> +
>>>>   static u32 aie2_get_chain_msg_op(u32 cmd_op)
>>>>   {
>>>>       switch (cmd_op) {
>>>> @@ -621,6 +634,8 @@ static struct aie2_exec_msg_ops 
>>>> legacy_exec_message_ops = {
>>>>       .init_chain_req = aie2_init_exec_chain_req,
>>>>       .fill_cf_slot = aie2_cmdlist_fill_cf,
>>>>       .fill_dpu_slot = aie2_cmdlist_fill_dpu,
>>>> +    .fill_preempt_slot = aie2_cmdlist_unsupp,
>>>> +    .fill_elf_slot = aie2_cmdlist_unsupp,
>>>>       .get_chain_msg_op = aie2_get_chain_msg_op,
>>>>   };
>>>>   @@ -680,6 +695,74 @@ aie2_cmdlist_fill_npu_dpu(struct 
>>>> amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>>>>       return 0;
>>>>   }
>>>>   +static int
>>>> +aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void 
>>>> *slot, size_t *size)
>>>> +{
>>>> +    struct cmd_chain_slot_npu *npu_slot = slot;
>>>> +    struct amdxdna_cmd_preempt_data *pd;
>>>> +    u32 cmd_len;
>>>> +    u32 arg_sz;
>>>> +
>>>> +    pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>>> +    arg_sz = cmd_len - sizeof(*pd);
>>>> +    if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (*size < sizeof(*npu_slot) + arg_sz)
>>>> +        return -EINVAL;
>>>> +
>>>> +    npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>>>> +    if (npu_slot->cu_idx == INVALID_CU_IDX)
>>>> +        return -EINVAL;
>>>> +
>>>> +    memset(npu_slot, 0, sizeof(*npu_slot));
>>>> +    npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
>>>> +    npu_slot->inst_buf_addr = pd->inst_buf;
>>>> +    npu_slot->save_buf_addr = pd->save_buf;
>>>> +    npu_slot->restore_buf_addr = pd->restore_buf;
>>>> +    npu_slot->inst_size = pd->inst_size;
>>>> +    npu_slot->save_size = pd->save_size;
>>>> +    npu_slot->restore_size = pd->restore_size;
>>>> +    npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
>>>> +    npu_slot->arg_cnt = arg_sz / sizeof(u32);
>>>> +    memcpy(npu_slot->args, pd->prop_args, arg_sz);
>>>
>>> Am I following this right?  I would think this should be:
>>>
>>> memcpy(npu_slot->args, pd->prop_args, npu_slot->arg_cnt);
>>
>> npu_slot->arg_cnt is the number of u32. So arg_sz is used for memcpy 
>> here.
>>
>>
> Got it thanks.  No other concerns.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
