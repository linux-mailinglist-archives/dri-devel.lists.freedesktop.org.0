Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED6CB7BE4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 04:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9002E10E328;
	Fri, 12 Dec 2025 03:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xTImyxC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012050.outbound.protection.outlook.com
 [40.93.195.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BF110E2F6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 03:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rv177XIZ5ZGyVUuanBVpTXpV4Dnx2jK2AMjnkm9VLmv5vTW3tinfukWA3WBfY5vMQqThmsI5ZEKWwlT6Bd71nsGwbHixGm9E4gpHVpJTJxqZ9G3HL0TszDioPLCO9maRc0SyQMVt3xE1G6IeV/MeB5ZuP5G9elmUHnyRC3ZAlmA8EnBbz2lq2GDu90UOTpfC27d4rZOJhmz/Gq1VUlm6H0zEJO/BJAyddvrWohgY0AMAYqRN6TouMsylaQATKwBzLc/v8GCxUoC7oMqei6Fbo+hxY6+JwLEiubm8rJ6NEER7UDGH+eDFtOq/OdnGbKRU0yp+pcra3mF5MwWKOLfCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5mpYZN6zwDxE/hw+qYgslpKpFVOEwqFBEoWw6ReCPQ=;
 b=GqOek3fBNA1n6B0rla0vtdrE8Z+AqAOx0KUOeaeT48zPYKZIl3kD85znTJiX/Fsmx3R6upWKJUnveUHO3P6Yas+Ck7j8CEtLbcVU/hK2dovhR+CuSy4shstjyqUJvg1wknwkkNWiPwlYo89d8CrEzDcDvJ0xAU0e+7XH0Z4Ihfr0EcjznLzJKzege9wtoyW581JzayBN5o/PxxkMCbtBP2CEyvQpd4C/s/Uv+9aw5IS8is/TiKSGIprkgXU74DBbl0Rnv+P1GoM1bGyQnKhoU21FUbzahVIuL0bBW3FnEGGx/ggjj3ioYEbbrr9i6LoDMiUeWXT8MXFDriohvTOTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5mpYZN6zwDxE/hw+qYgslpKpFVOEwqFBEoWw6ReCPQ=;
 b=xTImyxC6KUeCCnEWsj5wnDJ3AAXcuXay8WbPASNrKkwbslSzqEtId207pd16qRq7btwZkNZmjJFZ8zHh/oM9FUmDuy2qKPUo188xv0gamqK7Of+WSrol4eVFSfgyKzs+5NC5PLwe6HtpgS2Le9URzG03MLK08WjOzaEEiDnzk7s=
Received: from BN9P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::34)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 03:17:52 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::5) by BN9P221CA0019.outlook.office365.com
 (2603:10b6:408:10a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 03:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 03:17:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 21:17:51 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 19:17:51 -0800
Message-ID: <0be1c23e-a5bc-6bac-8998-2e6ee831d61e@amd.com>
Date: Thu, 11 Dec 2025 19:17:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix potential NULL pointer dereference
 in context cleanup
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251211045647.1725300-1-lizhi.hou@amd.com>
 <36165050-73c0-4ed8-85d3-42a874ae125f@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <36165050-73c0-4ed8-85d3-42a874ae125f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 8daaee00-38ae-493a-4524-08de392d0909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVhHNWpWcWtoc0tVVW5LVCtmYTB2RlZUZmZJY1FiRHhvY0R5aU5CamJ1NUJF?=
 =?utf-8?B?clIvV1dPUkZjbnlVcVY5bzYydGQyS1FkbFEvbWg3TDhQWDkvWThzTEN6V2Vh?=
 =?utf-8?B?eFZlTndJTEFxMXJpbjZXd2RzSC9waUFEbmdsZmFDenhrbDZENGE4clpRZjRK?=
 =?utf-8?B?ck9PVk5LcStJNVFyK1REdlh5d1dFd2xXaFczWkdZVFRGQ3ptWG9IVytpY1l1?=
 =?utf-8?B?dGo5aGhCaTEyUE1PWDQvUFBIT04vNFdURXpwalV4V2lDQ2EvZlFrVmNXQzA3?=
 =?utf-8?B?S2IyKzlsQnRJRERzQ3RGMmNlREdCd1pLRVZocFNkUUk0cVhFOVoxM0VKeWZu?=
 =?utf-8?B?ZzJ6K0VTWGw0WnZRMVBKVEFYS2tZeElnd1ZQNzdmak9UVHBHa29JQmQwaVFa?=
 =?utf-8?B?dVhic2JQME9wOTVNb0FiZjBUL3RSOURFK0plTlRBR09PYjUvbVpGMllNNHhw?=
 =?utf-8?B?SUNLbGU0UnpRYkZrdWZReXJ0KzdnSXhoWHpWYmEwY1c1L1FuT1hjYU95aFFY?=
 =?utf-8?B?dDNjaWRnZStaZVRoTnFOU0VFL0tFbURjT21ValU4czRTVmhKNlRsei9pbC9s?=
 =?utf-8?B?L21TODQ5MnNiR1ZuWmtWWk5rVUdzc0FNalhWU1FmVmxGRjF3NFRvTEI5bHFL?=
 =?utf-8?B?TGFIRmxTR3J2dFBub0lNQ0h3SkEvdHB5ZEJhWk40MnYwMWw5MmZzSGFNNzBk?=
 =?utf-8?B?TVV1dCsrOS9JNWp5ZEt6VEM4QTNJWW5OZWlGVWVkQ0s0K3Q3Mk4rWTlXaGlR?=
 =?utf-8?B?OFdQMU1OYkhGcndxK2NWcGlKalRGRWovNVZpWFRBekVDTVZCNXVlTXBaWElE?=
 =?utf-8?B?Vmc1ZVRjNnZ1bUk5dG41M3p4U09RenlMMXhvazl3M243R2FBS3NVRUJ1dGh2?=
 =?utf-8?B?RktRWEVxYWtJWm5kZGU3ZTFjaFEzNmVSRjhMSWRaQlRZQ1d5Y2FUeWp3ZHc4?=
 =?utf-8?B?eTQzQ1VmRUt4YW4yaUxXS0NCZ2ZybVRnMjRhVmI5a2ZLc1pmOHFZb05lSGFM?=
 =?utf-8?B?Nlc1NmpHUTdIajM3eTRDbVRIZHd4Nk4vbkVMa2htSEZnK3JmNzZKU1Y1ZGtl?=
 =?utf-8?B?NW9zUjRrT3AwVHZWNHRDcFJOWXJ2NVNpTzgwbHJ6bFMzQTZxc2YzYVF6b2kv?=
 =?utf-8?B?UnFWbE5Ebi9uOVFYM2lheGlWUStCci8wUHhYYnpXcURFcjA4THBuRmpNSGFP?=
 =?utf-8?B?TmpyRE9GZXJjb1Z6b2ttNkxIRkRaaWJDLzlxNldBV3ZsMEJyNjkwTkVudlhk?=
 =?utf-8?B?OTl4eUJCZUU3MG8zMUtibGZYUUs3QitRU2xNMmhTazVwWVV0SHBXbEpoeTdO?=
 =?utf-8?B?N1dMdVBZRTcyTlA3cjdOcDN0VE9lSmk1elg3Y053UDV3TU1Ec0NJQVB4Qys3?=
 =?utf-8?B?Q2VlSmtBQkNHaytQVGUxZEtOcDZhVXpUcUdad1dXd2RvdlVWdEpZVDQ2K0Y5?=
 =?utf-8?B?dElXdGJGVEhwUDU5ck1oU1JIL2R5bVE0dUNjZG00b2lORGNqVHFERm95L3RO?=
 =?utf-8?B?ejhsU2ZxaFBRNGZhTFRHQ2tiZzBpQlN3QjNUcWxLdXdET0JWTHZ2SFQ1alZO?=
 =?utf-8?B?V0l3ZklrS28yd2pxWk11c0VPTVJJQTN6RmFXQXdCUXQyRXJQQWtjdUtwNm8x?=
 =?utf-8?B?bXVPN2xHQWQvRmcrcWRSRFhmdE1IT2dyOHdHa2hPN2t6aVVNelJicHBIOTI1?=
 =?utf-8?B?U2NOWFFhYnBhSVlDb0x6L3JHTXdQNWRlMHBxbGFhSmJOVzFoalp4N0VCNUQ5?=
 =?utf-8?B?WmhGSTVrQnRWYjZaeFd6MmJLRHZQTS8xV3ljVldnN2xURm1OSjk4WXR4amlh?=
 =?utf-8?B?MDBIZ3c2K1E2TXNKejlLQUFiM0hTUlBJZ1RxOHg5Y1lBQ09ab0p6eU92NXZt?=
 =?utf-8?B?Wk1XQ2VQdm9XMnJRSm90eTZUU2R6QURvQ24rQWp0M2l0WVVVUWpjWENVaUhi?=
 =?utf-8?B?Q2Fub01PRHF2bGNGZFE5TUJRUGR6cXRZMlZ5U1Z3cVNmcVkzV0s1emNJZkl5?=
 =?utf-8?B?NTFTVjVMeXhFaHBOZUJ6VklSNkc3ZVhmRGZRRzBPdlBTSUVobmpEQmtlUndG?=
 =?utf-8?B?RisrYjJPUlFDTi92U3lSSUJpZzlnVmdPK3VCVU1GUDA2YU5jdHFDeFkxOHN1?=
 =?utf-8?Q?+9+8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 03:17:52.0682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daaee00-38ae-493a-4524-08de392d0909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764
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


On 12/11/25 13:50, Mario Limonciello wrote:
> On 12/10/25 10:56 PM, Lizhi Hou wrote:
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
>> ---
>>   drivers/accel/amdxdna/aie2_message.c | 52 +++++++++++++++-------------
>>   1 file changed, 28 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 03b75757a6e6..980aef9dc51a 100644
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
>> @@ -214,13 +227,16 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>> *ndev, struct amdxdna_hwctx *hwct
>>           return ret;
>>         hwctx->fw_ctx_id = resp.context_id;
>> -    WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>> +    if (hwctx->fw_ctx_id == -1) {
>> +        WARN_ON_ONCE("Unexpected context id");
>> +        return -EINVAL;
>> +    }
>
> Is the message super important?  I'd think just do this:
It indicates there is unexpected hardware issue happened. It should 
never happen.
>
> if (WARN_ON_ONCE(hwctx->fw_ctx_id == -1))
>     return -EINVAL;>

Sure.  I will change it.


Lizhi

>>       if (ndev->force_preempt_enabled) {
>>           ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, 
>> &hwctx->fw_ctx_id);
>>           if (ret) {
>>               XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
>> -            return ret;
>> +            goto del_ctx_req;
>>           }
>>       }
>>   @@ -237,51 +253,39 @@ int aie2_create_context(struct 
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
