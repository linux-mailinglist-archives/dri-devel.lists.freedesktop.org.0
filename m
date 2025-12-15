Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC517CBF563
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 19:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231910E4B1;
	Mon, 15 Dec 2025 18:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E832z3n+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012042.outbound.protection.outlook.com
 [40.107.200.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466E10E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 18:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6I9A7h0B6aYM+3X36I380ROlsa2dtFgFlt17RBe/zAA/ptcm6j5wZ+SihAzjWzijU5XRh9FOW2ZloZHYM/RNXTU0rmVMs+NQsWiPLpbU7S9r/8xS8FPkiWiX/0nuAsi0P5cHRn70i5Ef7POvbU0n/Xh1+jLcZar14gQMkIgu81qqZNGhWrWEhgNK+lSKh1C3wrz4Wot9wAPqQ5GZb4LoPD/eoChxwIjHOuPQMpeo+fU8PK+tHQHXfxP+QuWA81BL5YGrx4RLyPWE9f/ewFO0usemSMRD0Qptsu6nXfHKYFmDG/dSWStnmD7Lpo1UQXSTR4opOg7ZS4O3iw05fEutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYqxtIV1lTePgo4KzncjSg9d0RqfY0WHm5IFfvW8S1s=;
 b=fPy2vAkPF4Yn1k0vnLP/NJbvAzRRk5rqnZZUQ/sgoiFgEd+dMpaBbJzN+pPS4c6GwRX0GvHdCmYxweYVVjfnyT3rW8Te3dvAMHOAg3prAFpBkp76UvkDhQTPEAZoVrislJrfc2vQx5IrowPv1MLo5TVALPILD/8oeHeVss+kKWK0TxVBrn86nBQ6AFFkhFYaQTOLNmYBrgbXcm6wTyM+wMY9zmKICA9fzP5WTyKPqqVG+9DRm/fpVPRxWbyKdB5WcG8nHnsxqujX22VkxsgtITxvqz0lnLAPqrJYPVkJrdbirJK1y/K88zNjFtyQJ4xsAISllS/BX85oyGtSYD842Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYqxtIV1lTePgo4KzncjSg9d0RqfY0WHm5IFfvW8S1s=;
 b=E832z3n+++7xenw9pBZ0TNc5QxU/ekqrW2rXh96c58iXdH/Arui2jiU+pMSjVSSTKcPLv/LAy4II7VLmm49dc1FBNvUEvpjudmi2xhwo+jRhFL9r1ODjVicenehvLlojjZ97bTBO5Tf8hpUeKAKancw4Gi+cuBRxyRVILa2c0DA=
Received: from BL0PR05CA0029.namprd05.prod.outlook.com (2603:10b6:208:91::39)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:01:21 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::dc) by BL0PR05CA0029.outlook.office365.com
 (2603:10b6:208:91::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 18:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 18:01:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 12:01:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 12:01:13 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 12:01:13 -0600
Message-ID: <10c70508-45e2-8b2e-6277-e874f4c5bff4@amd.com>
Date: Mon, 15 Dec 2025 10:01:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Fix potential NULL pointer dereference
 in context cleanup
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251212183244.1826318-1-lizhi.hou@amd.com>
 <71e8ea57-bc12-46b7-8361-c640b0dd65bb@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <71e8ea57-bc12-46b7-8361-c640b0dd65bb@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbeaeaf-9c8f-4a40-f105-08de3c03f408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0JLNHJMUUg1bDRyb09GUUo0MUlSYWVuSFRLcFR5OVA5eFZYa3lwVmx0WDVO?=
 =?utf-8?B?ZTRMVUhYTGNXbkxRS29sN3hhZzU5UEliUjFDVVh3V0RiZG9OYnVjU2dwb2Vr?=
 =?utf-8?B?RXcvWCtyY2xvelcxTmhQb3dZMEtTbm90ODV3T1hsampoY1JtaDQ4aWtsMXhq?=
 =?utf-8?B?WXBLTVplaFRPWUpxOHl5aVlEa1JtTnJYcXRIY0hLZ2FXVWhQMTlyQTRRck9X?=
 =?utf-8?B?eTZIZGQzc1ZEZXkxZ0Y4MW9hejQ0WnEwT1BHZW9xYlM5c1Vkc2trSDVOZ1lR?=
 =?utf-8?B?eWJDRWxTUjBpcmxOeFJKVUtBMHNrazhTc3RTZGZDNjZTNDBvaXo0dEZVZlBl?=
 =?utf-8?B?VWxrWnllWVN5cmNqWmIyUlVzLzVSR1ZpNnA0YlJGNWEwQzlWNmhJbDdBSHdx?=
 =?utf-8?B?Z1NBeVBDYUdNR001WlRqZjVaRmN2bG1ZWHF0eHRoVG5kb1Y4cUJiTjFvbVdr?=
 =?utf-8?B?T1U5eWE0enZYUTd0RXdJNk5ENW02ZE41ZzU0S3RQK2Ezc28rak11Z2E4RHYw?=
 =?utf-8?B?ZnJVb1I5WTA3UmFoL1F3WnJBT2I3MWdzam1MM0hiU3BZamdhZmdGclkzSjJS?=
 =?utf-8?B?by9ZS2pKS0t3c0dlQW5ZOTdNaE52VU5PZ1JMUDJpYWtvMlhjS2ZIRFMzb3Ry?=
 =?utf-8?B?MEV0NWNvZmgwRnN1Ly9lRlB2MnE2ZUpsRi9Zd2RlVFZ2d1hzTmNUdUdrRDhx?=
 =?utf-8?B?NXFxZnNxbGE0QTl2YmdFVWNkdVlrWHFSNGU5azBSZHhScEFVMWMyWFBwbE43?=
 =?utf-8?B?UVRCOTFYajd1Z1UwWlZ1SDlZMnV5elU0MytWN3NjVXI3QmVadSszV1lZL0dU?=
 =?utf-8?B?Y25oQ0xhbWtUOUQzY2ZqNVRwb2dTelZaRmxtcEZpejdyR2ZGV2VGNjc5ZjZr?=
 =?utf-8?B?b1FVcG9JK2dPY2c2VWZTNmJKRUlFY2xRYVBaUkp3NWF0QXpoeWR5YzI1YUdL?=
 =?utf-8?B?WElETHhMYldVMWIyMDVkcVZWYmZNZGFCd0pIdTk2S2s2VEhabjVnN1VEZ1VT?=
 =?utf-8?B?K3lvT1IvdVNhL2xsY1BHaU1RK2FGb0YvSTZMeFdVb2NwUlovYkgrcC9Ka0R3?=
 =?utf-8?B?eG5uclk5TkROLzZDSnRJK0VWR1lpaDBJZW01THAwdWtGUTZnR1AzUHNxWlg0?=
 =?utf-8?B?dHVrRDBhL2lxUFAvdTlNczM0bkxqOTh1WmNJMThaRHdPWlBYTjhuODhQQ0g0?=
 =?utf-8?B?UE9jOGltaHl0QVFXV04xOWVtcTdnV1JyOGF3ZVBObnpnanF3aFA4MWxpK0tN?=
 =?utf-8?B?bFBuMlJkV0lvclc4SzhVSlZRRkNMeTNuS29MM1FwSnhQeE1pTGVXc082WVln?=
 =?utf-8?B?ZFJWdFBMSjZyZ0NzRjdmamhYaWluQnA2SkQxeGtCcklJbGptQTVnS1RrblRW?=
 =?utf-8?B?WTVEQVFnbzdvTUg5SlYrTGhNRG9yWEJZcndlQjBMaHF0NDBYUURPMXd4UDFZ?=
 =?utf-8?B?SFNsc3BOTitaelczaG8wclphTmZPRzhwU3pFMER2aU1VTFFJaU8wcnZoZ2Z3?=
 =?utf-8?B?Q2lWMy9JVWRGdjFYM0VDWVhlQURZS01VNmdYNHBucmphMkxuSVI4bExjaTF0?=
 =?utf-8?B?Tk5oMVNwcFRIQTE0U3BYd0MvV0ZtdjVWeXc1UmM0dVh2aDVwV2dTZmRVZENV?=
 =?utf-8?B?QkxXc3dZbk5MQ3BsTGdhdDd1elVGVDhQRWZuSFRpSzJIYU9wRnZ6RTRiRGFx?=
 =?utf-8?B?a3ZaM0ZBSlZOWGU0ZG9rZXJCNkxXbnhRdDA2WEtucGRlRHB6Si85RlllVzhr?=
 =?utf-8?B?YzlWNHVlaDlaL0Z0dkJTL2lXUGp6NWhBbTN1RnZpTno4V200bUgxc1lMLzI4?=
 =?utf-8?B?ellFczJDUlNIamdCMWJWU2tMdjgrcEY4OVhUUjBiUGVYRi9COXExRHFuNjZY?=
 =?utf-8?B?OTZxbE83dlFaTDJOU2FPbERTTTBnN3VBTDB6NFpDazZnUXFPWXNqUzdsRTQw?=
 =?utf-8?B?TFhLOTQvV3Z2UW9uWTlxaTZOeUNmVWlFL1d3eE5PcVhvcE1hVjExUU0zelhO?=
 =?utf-8?B?VTVTU1Z1OSt2UFpaUXVUU2tiV1R5UlFVdVFVVzUxQW1xUlpmUHcyUXNrQ3ph?=
 =?utf-8?B?WmNGZzhmbVZHZGVwRTVVZjdrdi9oLzloN0lQY2RiYURvT2NkSTZ6aXN2Rkd1?=
 =?utf-8?Q?IBdE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:01:20.9628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbeaeaf-9c8f-4a40-f105-08de3c03f408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469
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

On 12/12/25 10:56, Mario Limonciello wrote:
> On 12/12/25 12:32 PM, Lizhi Hou wrote:
>> aie_destroy_context() is invoked during error handling in
>> aie2_create_context(). However, aie_destroy_context() assumes that the
>> context's mailbox channel pointer is non-NULL. If mailbox channel
>> creation fails, the pointer remains NULL and calling 
>> aie_destroy_context()
>> can lead to a NULL pointer dereference.
>>
>> In aie2_create_context(), replace aie_destroy_context() with a function
>> which request firmware to remove the context created previously.
>>
>> Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/accel/amdxdna/aie2_message.c | 50 +++++++++++++++-------------
>>   1 file changed, 26 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 03b75757a6e6..9ec973028221 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -192,6 +192,19 @@ int aie2_query_firmware_version(struct 
>> amdxdna_dev_hdl *ndev,
>>       return 0;
>>   }
>>   +static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, 
>> u32 id)
>> +{
>> +    DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
>> +    struct amdxdna_dev *xdna = ndev->xdna;
>> +    int ret;
>> +
>> +    req.context_id = id;
>> +    ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> +    if (ret)
>> +        XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
>> +
>> +    return ret;
>> +}
>>   int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct 
>> amdxdna_hwctx *hwctx)
>>   {
>>       DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
>> @@ -214,13 +227,14 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>> *ndev, struct amdxdna_hwctx *hwct
>>           return ret;
>>         hwctx->fw_ctx_id = resp.context_id;
>> -    WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>> +    if (WARN_ON_ONCE(hwctx->fw_ctx_id == -1))
>> +        return -EINVAL;
>>         if (ndev->force_preempt_enabled) {
>>           ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, 
>> &hwctx->fw_ctx_id);
>>           if (ret) {
>>               XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
>> -            return ret;
>> +            goto del_ctx_req;
>>           }
>>       }
>>   @@ -237,51 +251,39 @@ int aie2_create_context(struct 
>> amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>>         ret = pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
>>       if (ret == -EINVAL) {
>> -        XDNA_ERR(xdna, "not able to create channel");
>> -        goto out_destroy_context;
>> +        XDNA_ERR(xdna, "Alloc IRQ failed %d", ret);
>> +        goto del_ctx_req;
>>       }
>>         intr_reg = i2x.mb_head_ptr_reg + 4;
>>       hwctx->priv->mbox_chann = 
>> xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
>>                                     intr_reg, ret);
>>       if (!hwctx->priv->mbox_chann) {
>> -        XDNA_ERR(xdna, "not able to create channel");
>> +        XDNA_ERR(xdna, "Not able to create channel");
>>           ret = -EINVAL;
>> -        goto out_destroy_context;
>> +        goto del_ctx_req;
>>       }
>>       ndev->hwctx_num++;
>>   -    XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
>> -         hwctx->name, ret, resp.msix_id);
>> -    XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
>> -         hwctx->fw_ctx_id, hwctx->client->pasid);
>> +    XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, 
>> resp.msix_id);
>> +    XDNA_DBG(xdna, "Created fw ctx %d pasid %d", hwctx->fw_ctx_id, 
>> hwctx->client->pasid);
>>         return 0;
>>   -out_destroy_context:
>> -    aie2_destroy_context(ndev, hwctx);
>> +del_ctx_req:
>> +    aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>>       return ret;
>>   }
>>     int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct 
>> amdxdna_hwctx *hwctx)
>>   {
>> -    DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
>>       struct amdxdna_dev *xdna = ndev->xdna;
>>       int ret;
>>   -    if (hwctx->fw_ctx_id == -1)
>> -        return 0;
>> -
>>       xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
>> -
>> -    req.context_id = hwctx->fw_ctx_id;
>> -    ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> -    if (ret)
>> -        XDNA_WARN(xdna, "%s destroy context failed, ret %d", 
>> hwctx->name, ret);
>> -
>> +    ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>> xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
>> -    XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
>> -         hwctx->fw_ctx_id);
>> +    XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
>>       hwctx->priv->mbox_chann = NULL;
>>       hwctx->fw_ctx_id = -1;
>>       ndev->hwctx_num--;
>
