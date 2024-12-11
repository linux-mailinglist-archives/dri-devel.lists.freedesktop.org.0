Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9C9EC458
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 06:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C66F10E3C7;
	Wed, 11 Dec 2024 05:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wsW2FSEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7D710E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 05:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etIoJR3B23uVabC8SN140pgXAFtVkv+3dc4hD1yZ/cUZKPBYmQfIhvau71oAO7SExHS8fMAInPi9pH4k6ZgnIJB+jCrYJgk1rULSWPV0ECapwN3mW2DQa8nZzW3T0fTGrxG2K9slWinh4TYUbE1qFtYbS/6DDhxgonFM1/4i20gbmZoVx+UdXNvsM1kDsl1IYuTWyI8u+SIV8duVTa2oas3DDTueUdTiqqJkah/FpR9fHcMTALCQdlN4MiA5VHW21XD+P0dDAqj6cAWPyO1lqVLkRpfJcyHXB+64T1eDVLYPiyV+m+IJAxKHjSu+VvaWnnSdN/sQUCHjy87VLPGXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYHbs362G84HYJL7jvZ3sV8o58KKye+mQ7AssYRZO/I=;
 b=DhYaqy3dPvczneLd1oR0HtrfFPkOq/djziGUtGgMgFkKQPk0Gs5keB+bdakO47+kpGUMNxNiOQYP8C5b5KsrJxKiKh3ESUWvPmX2RRGUtIBQoxVroMSUgA+dKDcbimmK7TFLkyQzwuPrGExZtYekfJEOFLdLNWjEyYPRZEy0Fe6sX8WMn3Pz7j6Ap6nXqVA4s1EnEROYT/KCy2pRNep1PPxB40URzygOkBKgGxBdtTQdp0hKkgjCAdMQSTQr04Rh42P6ioL9FcChZDaGKb9UZreiCV7cMJ31letXZ76aXDKwmc43zpcKaLYkKa68dEm4uowXUP8kzIlt3U1QSBR4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYHbs362G84HYJL7jvZ3sV8o58KKye+mQ7AssYRZO/I=;
 b=wsW2FSEVVf/B77ZPDn+ePPXaKa5q5wdBptcoh6prUY2FdDMGXZZ8fi4lzt4W29Hc1QUmM4nKf5KlxeCgE6fcfzggDt1lHeXQhWeUkC1lpPcTNuxqoi9CWGx8Zgdqyt5RaNZucod8Rs6qjjgqHvA8CRZuWi6U7HjvgEZNkT7RcA8=
Received: from BN1PR10CA0024.namprd10.prod.outlook.com (2603:10b6:408:e0::29)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 05:32:29 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::62) by BN1PR10CA0024.outlook.office365.com
 (2603:10b6:408:e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Wed,
 11 Dec 2024 05:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 05:32:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 23:32:28 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 23:32:15 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 23:32:15 -0600
Message-ID: <ccbade77-5060-2c2c-ab40-80c6456599e2@amd.com>
Date: Tue, 10 Dec 2024 21:32:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 7/8] accel/amdxdna: Read firmware interface version
 from registers
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-8-lizhi.hou@amd.com>
 <72c43ee3-0b1e-42be-a936-8389f9954242@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <72c43ee3-0b1e-42be-a936-8389f9954242@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS0PR12MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aa27e6-7d70-4319-c69a-08dd19a53438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yjh1dHZwcTEwcGkyUGZoNU1HZlgrYTAyQWdoNzFwUVZydHQ2M0w1aUNaa2J2?=
 =?utf-8?B?aGhZc1hXeFZBM0ZkeHJUN3BUdGpPRjdGVVZ3S1lMSzgwTTFDd0VmbjRvUlkx?=
 =?utf-8?B?Ynp0NU1nR1VnaTRYQUlNMXpYWDgwMTAzckhNOFBKRXFsQ2c4WkR4RmU4WmUy?=
 =?utf-8?B?a3FxWEwvTVFWTTI0UkVhbEUrUmc4VUVlYk40M3o2QUlIcGJBUUZ3dFI1MFlt?=
 =?utf-8?B?VnlPeUdvdTY0SVluQ1hNVklmdFhkS0RXVkVmZmVJK01hMHh5ZzBVYTdobDdx?=
 =?utf-8?B?ZWdVYmtBcXhsYmIrNmphUEo3MzFTeXd5T0hRL0Vpai9SR1FsRUJTS3pGd1Uv?=
 =?utf-8?B?QUpVcWplVzJSdVN3RXJsUVZhNnN4WWFPbkp0Y1gvSUNqcm8xcGZGRUVYdTZm?=
 =?utf-8?B?dVdJeUJuYlIyMFczVVZ3MFlnNWtUV3YyVi9EdS9tQkVlQm9TK1lJN2F0TFpo?=
 =?utf-8?B?S1R0anRHbGVwcDRpQm9GUTJ0dVZqMFVDcEZob2pzSjVYWDZRNURKMzZZSzVD?=
 =?utf-8?B?TzdnYmd4c0UwWEprVTN3UFBGbVF2a0xheE1tUFBhaTYvNUgxQVZuTEttaUhm?=
 =?utf-8?B?SS9vZEtva3hlOGRMUWkzczlFNGNzU2paOXB2SmtyTGpza0tob3E5MWdxRzZS?=
 =?utf-8?B?enY4VnVXUzVZNlArZ2JqSXF5SzZQd3ZjZ1RSNDM5VVc1OE5xRkFQTFljTlFS?=
 =?utf-8?B?MncvMVlOZXRPUUt6eXB4KzNnOWFJRkl0Qi9kbElRZlpMaUlrVXFWTXg5UHlP?=
 =?utf-8?B?MWNkVytlR3FYMFEzd3hsL0NPUnhiaFdNZ1RJSDJGYnRYZ1RKVVlObTdsVGNM?=
 =?utf-8?B?ZUNkUkpTK1RDTFk0d1BaOHMyeXpUNmE1TG50cXNzN0o3UndNdmRSUmh5aW53?=
 =?utf-8?B?SHhYTFNNNy94NDJIdlpNcVBvRjBQUWFHVUgxSG0zN3Q5TVlPTTBOdXZZT1lw?=
 =?utf-8?B?Vk9zNW9RSWRwR3Qrc2JMSU91blFvL2NycHVJekF0Yjh3dVFkcHdtcVV5MmVJ?=
 =?utf-8?B?ajdwWEpyR01saFJhTnVKUURuZXNMNUc3K24vQUEwQTNLV0ZETDRNL1BHNGF6?=
 =?utf-8?B?Y3E0emNMcHZ0aG1nbjhYNTBZYmFoeWNJQ1dLcHRidU9FYjR4RXpIcldJUVpZ?=
 =?utf-8?B?M0phbm9PTEdTTlNoVWxhekZFTjROSTYwaUs5aWs0aHE3dzE2WUlLbWg5MDhh?=
 =?utf-8?B?NHEwZzNJclR2RnVCRjBlaUMxMXkxODhmUjdNejRVTy9PQ1JvUHlLTXowTVpz?=
 =?utf-8?B?ZUZxNXZHZXJmQmhUaFVtUFpVbEhITjVLNjJ0Q2ZxTkUvd0pRUkt2Zmo0STNm?=
 =?utf-8?B?Y2k3ai9FSU82SkJSUWhMQTQrODR6NkNmZ1MrY3ZlL0JIK1ZVeHVyMC9sYlhU?=
 =?utf-8?B?MmY3cUNTNXdwOHBtMzNMcWNoQ2IwU0M1MWdPbnZhajhIMW00MG1uYjl4a1d3?=
 =?utf-8?B?bExWdDVTdnFabjNxZW9GbWFWZEx3TFJMWjQ2dklscFpjeERLbmNWTTZ5c0pn?=
 =?utf-8?B?Mk93MWRiOUZmeVpzQjNoZWNYYnlCUU9vYi82Z3RnaUoxam5uVTlLTVp6T0pZ?=
 =?utf-8?B?TGxTK0dZV2I2ZUVZais3c09mTWFKSE9kdENDcDBkdGVLMXZCOE1IVElZcm1M?=
 =?utf-8?B?QUxPVTZ6Ty9FMS8vMHU5bWZlOGZiNTVWRkRCanBVcndwRW1DRWxBNzBVM1pk?=
 =?utf-8?B?Z2JQNDZOOStyOW1YY1Z5Z0w2WXNSdGxSdllKK3lHU2huVU1wSXZhSWRhQWFH?=
 =?utf-8?B?YjRVajk3L0tKVmpHWXhJZGdzMEFBaEtHa2pYOUlLYWhCZTExN0hYcTNzOC95?=
 =?utf-8?B?aTEzRFJFK3ZINUVJSGtWeHdOV1lzVXhPc0c3MlRNZ1cvNjl3MjNjRHlOaWJ5?=
 =?utf-8?B?SkxvazQ5a0FDMWxuVXJVMWowSjNucEdKdTVRWXRCZm85VFVSbCttdExvWEs1?=
 =?utf-8?Q?H+4KtglE8f1qwcfc/NHzqBsJWTyUII82?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 05:32:29.2131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aa27e6-7d70-4319-c69a-08dd19a53438
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367
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


On 12/10/24 16:20, Mario Limonciello wrote:
> On 12/6/2024 16:00, Lizhi Hou wrote:
>> The latest released firmware supports reading firmware interface version
>> from registers directly. The driver's probe routine reads the major and
>> minor version numbers. If the firmware interface does not compatible 
>> with
> s/does/is/
Thanks. I will fix this.
>> the driver, the driver's probe routine returns failure.
>>
>> Co-developed-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Just to confirm you're not backing yourself into a corner the plan is 
> not to bump this major version any time soon for anything already 
> supported by the driver; right?

That is correct.


Thanks,

Lizhi

>
>
> Because once you do that this is going to get messy quickly.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c | 26 ----------
>>   drivers/accel/amdxdna/aie2_pci.c     | 74 ++++++++++++++++++++++------
>>   drivers/accel/amdxdna/aie2_pci.h     |  6 +--
>>   drivers/accel/amdxdna/npu1_regs.c    |  2 +-
>>   drivers/accel/amdxdna/npu2_regs.c    |  2 +-
>>   drivers/accel/amdxdna/npu4_regs.c    |  2 +-
>>   drivers/accel/amdxdna/npu5_regs.c    |  2 +-
>>   7 files changed, 64 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 13b5a96f8d25..f6d46e1e5086 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -100,32 +100,6 @@ int aie2_get_runtime_cfg(struct amdxdna_dev_hdl 
>> *ndev, u32 type, u64 *value)
>>       return 0;
>>   }
>>   -int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev)
>> -{
>> -    DECLARE_AIE2_MSG(protocol_version, MSG_OP_GET_PROTOCOL_VERSION);
>> -    struct amdxdna_dev *xdna = ndev->xdna;
>> -    int ret;
>> -
>> -    ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> -    if (ret) {
>> -        XDNA_ERR(xdna, "Failed to get protocol version, ret %d", ret);
>> -        return ret;
>> -    }
>> -
>> -    if (resp.major != ndev->priv->protocol_major) {
>> -        XDNA_ERR(xdna, "Incompatible firmware protocol version major 
>> %d minor %d",
>> -             resp.major, resp.minor);
>> -        return -EINVAL;
>> -    }
>> -
>> -    if (resp.minor < ndev->priv->protocol_minor) {
>> -        XDNA_ERR(xdna, "Firmware minor version smaller than 
>> supported");
>> -        return -EINVAL;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>>   int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid)
>>   {
>>       DECLARE_AIE2_MSG(assign_mgmt_pasid, MSG_OP_ASSIGN_MGMT_PASID);
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 489744a2e226..2d2b6b66617a 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -33,17 +33,51 @@ MODULE_PARM_DESC(aie2_max_col, "Maximum column 
>> could be used");
>>    * The related register and ring buffer information is on SRAM BAR.
>>    * This struct is the register layout.
>>    */
>> +#define MGMT_MBOX_MAGIC 0x55504e5f /* _NPU */
>>   struct mgmt_mbox_chann_info {
>> -    u32    x2i_tail;
>> -    u32    x2i_head;
>> -    u32    x2i_buf;
>> -    u32    x2i_buf_sz;
>> -    u32    i2x_tail;
>> -    u32    i2x_head;
>> -    u32    i2x_buf;
>> -    u32    i2x_buf_sz;
>> +    __u32    x2i_tail;
>> +    __u32    x2i_head;
>> +    __u32    x2i_buf;
>> +    __u32    x2i_buf_sz;
>> +    __u32    i2x_tail;
>> +    __u32    i2x_head;
>> +    __u32    i2x_buf;
>> +    __u32    i2x_buf_sz;
>> +    __u32    magic;
>> +    __u32    msi_id;
>> +    __u32    prot_major;
>> +    __u32    prot_minor;
>> +    __u32    rsvd[4];
>>   };
>>   +static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>> fw_major, u32 fw_minor)
>> +{
>> +    struct amdxdna_dev *xdna = ndev->xdna;
>> +
>> +    /*
>> +     * The driver supported mailbox behavior is defined by
>> +     * ndev->priv->protocol_major and protocol_minor.
>> +     *
>> +     * When protocol_major and fw_major are different, it means driver
>> +     * and firmware are incompatible.
>> +     */
>> +    if (ndev->priv->protocol_major != fw_major) {
>> +        XDNA_ERR(xdna, "Incompatible firmware protocol major %d 
>> minor %d",
>> +             fw_major, fw_minor);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * When protocol_minor is greater then fw_minor, that means driver
>> +     * relies on operation the installed firmware does not support.
>> +     */
>> +    if (ndev->priv->protocol_minor > fw_minor) {
>> +        XDNA_ERR(xdna, "Firmware minor version smaller than 
>> supported");
>> +        return -EINVAL;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
>>   {
>>       struct amdxdna_dev *xdna = ndev->xdna;
>> @@ -57,6 +91,8 @@ static void aie2_dump_chann_info_debug(struct 
>> amdxdna_dev_hdl *ndev)
>>       XDNA_DBG(xdna, "x2i ringbuf 0x%x", ndev->mgmt_x2i.rb_start_addr);
>>       XDNA_DBG(xdna, "x2i rsize   0x%x", ndev->mgmt_x2i.rb_size);
>>       XDNA_DBG(xdna, "x2i chann index 0x%x", ndev->mgmt_chan_idx);
>> +    XDNA_DBG(xdna, "mailbox protocol major 0x%x", 
>> ndev->mgmt_prot_major);
>> +    XDNA_DBG(xdna, "mailbox protocol minor 0x%x", 
>> ndev->mgmt_prot_minor);
>>   }
>>     static int aie2_get_mgmt_chann_info(struct amdxdna_dev_hdl *ndev)
>> @@ -87,6 +123,12 @@ static int aie2_get_mgmt_chann_info(struct 
>> amdxdna_dev_hdl *ndev)
>>       for (i = 0; i < sizeof(info_regs) / sizeof(u32); i++)
>>           reg[i] = readl(ndev->sram_base + off + i * sizeof(u32));
>>   +    if (info_regs.magic != MGMT_MBOX_MAGIC) {
>> +        XDNA_ERR(ndev->xdna, "Invalid mbox magic 0x%x", 
>> info_regs.magic);
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +
>>       i2x = &ndev->mgmt_i2x;
>>       x2i = &ndev->mgmt_x2i;
>>   @@ -99,14 +141,20 @@ static int aie2_get_mgmt_chann_info(struct 
>> amdxdna_dev_hdl *ndev)
>>       x2i->mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, info_regs.x2i_tail);
>>       x2i->rb_start_addr   = AIE2_SRAM_OFF(ndev, info_regs.x2i_buf);
>>       x2i->rb_size         = info_regs.x2i_buf_sz;
>> -    ndev->mgmt_chan_idx  = CHANN_INDEX(ndev, x2i->rb_start_addr);
>>   +    ndev->mgmt_chan_idx  = info_regs.msi_id;
>> +    ndev->mgmt_prot_major = info_regs.prot_major;
>> +    ndev->mgmt_prot_minor = info_regs.prot_minor;
>> +
>> +    ret = aie2_check_protocol(ndev, ndev->mgmt_prot_major, 
>> ndev->mgmt_prot_minor);
>> +
>> +done:
>>       aie2_dump_chann_info_debug(ndev);
>>         /* Must clear address at FW_ALIVE_OFF */
>>       writel(0, SRAM_GET_ADDR(ndev, FW_ALIVE_OFF));
>>   -    return 0;
>> +    return ret;
>>   }
>>     int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
>> @@ -155,12 +203,6 @@ static int aie2_mgmt_fw_init(struct 
>> amdxdna_dev_hdl *ndev)
>>   {
>>       int ret;
>>   -    ret = aie2_check_protocol_version(ndev);
>> -    if (ret) {
>> -        XDNA_ERR(ndev->xdna, "Check header hash failed");
>> -        return ret;
>> -    }
>> -
>>       ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_INIT, NULL);
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Runtime config failed");
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 8c17b74654ce..cc159cadff9f 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -39,9 +39,6 @@
>>   })
>>     #define CHAN_SLOT_SZ SZ_8K
>> -#define CHANN_INDEX(ndev, rbuf_off) \
>> -    (((rbuf_off) - SRAM_REG_OFF((ndev), MBOX_CHANN_OFF)) / 
>> CHAN_SLOT_SZ)
>> -
>>   #define MBOX_SIZE(ndev) \
>>   ({ \
>>       typeof(ndev) _ndev = (ndev); \
>> @@ -170,6 +167,8 @@ struct amdxdna_dev_hdl {
>>       struct xdna_mailbox_chann_res    mgmt_x2i;
>>       struct xdna_mailbox_chann_res    mgmt_i2x;
>>       u32                mgmt_chan_idx;
>> +    u32                mgmt_prot_major;
>> +    u32                mgmt_prot_minor;
>>         u32                total_col;
>>       struct aie_version        version;
>> @@ -262,7 +261,6 @@ int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>> u64 value);
>>   int aie2_get_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>> u64 *value);
>> -int aie2_check_protocol_version(struct amdxdna_dev_hdl *ndev);
>>   int aie2_assign_mgmt_pasid(struct amdxdna_dev_hdl *ndev, u16 pasid);
>>   int aie2_query_aie_version(struct amdxdna_dev_hdl *ndev, struct 
>> aie_version *version);
>>   int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct 
>> aie_metadata *metadata);
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index c8f4d1cac65d..e408af57e378 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -65,7 +65,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>   const struct amdxdna_dev_priv npu1_dev_priv = {
>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>>       .protocol_major = 0x5,
>> -    .protocol_minor = 0x1,
>> +    .protocol_minor = 0x7,
>>       .rt_config    = npu1_default_rt_cfg,
>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>       .col_align    = COL_ALIGN_NONE,
>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>> b/drivers/accel/amdxdna/npu2_regs.c
>> index ac63131f9c7c..286bd0d475e2 100644
>> --- a/drivers/accel/amdxdna/npu2_regs.c
>> +++ b/drivers/accel/amdxdna/npu2_regs.c
>> @@ -64,7 +64,7 @@
>>   const struct amdxdna_dev_priv npu2_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_00/npu.sbin",
>>       .protocol_major = 0x6,
>> -    .protocol_minor = 0x1,
>> +    .protocol_minor = 0x6,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .col_align    = COL_ALIGN_NATURE,
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index a713ac18adfc..00c52833ce89 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -85,7 +85,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>   const struct amdxdna_dev_priv npu4_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>       .protocol_major = 0x6,
>> -    .protocol_minor = 0x1,
>> +    .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .col_align    = COL_ALIGN_NATURE,
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index 67a5d5bc8a49..118849272f27 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -64,7 +64,7 @@
>>   const struct amdxdna_dev_priv npu5_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_11/npu.sbin",
>>       .protocol_major = 0x6,
>> -    .protocol_minor = 0x1,
>> +    .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .col_align    = COL_ALIGN_NATURE,
>
