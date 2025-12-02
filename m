Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D38C9C47C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22EB10E092;
	Tue,  2 Dec 2025 16:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="srVIWwWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF05510E092
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 16:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dijPd02jm7vk0GSL3RPBXpUGYXrpFX/x2KrruYqbqIXm4diAaGzCQeD+GL2BN142W2N5n8lZfhNCtQRe7vnuNCSTVAOg3xr85ccEtiX5K3W9uPGCSIb9nI2i7qsSUmJ36Nypy31ybc46VATSFFFZUbS9HZBSEq+AieMiAOdPUdZxxxyAfV2cbV2rfSTAZRIxug7zyjYuxfEIfrW7JMm6JSkoeLU/y6iwx0qs4zojxQLRxs3P5bFoXIFL6qdqDOW5wEZtOy+wHSU8rdO5L0+daNAckryIRck/z+80YbR8mjQRRwAq1ArkB8o4KcdzVJTtPWbIwt0Et7XU9W+Mw8wYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiSM3RqaXc+bbkc9WCcFqr6uHZ4Y5bYQxLFweJ6TxvY=;
 b=ZEJ+TmseU8wX67vgoDcK3/eDJD02huVIzXHhpiPaVAveq7ZHY2+8f/d5uay12j5xFB6/vGB0xrFRwi0c/FHyplyz4c0jQIXprLtFC2cCGCl31J7kJ7cbLe5ZpBcmit9j85RfYF+Pz3N82RM4xbzolFG/2kG1YxNX6SEZxhjsomH0HMAT9UTPv2XA3+929af3w8rH4g3zToeif1a/3azRGlwChdJ7x5LcW592CgH3it/ekCEEMTOn5CQ8WhNO6Onjb5Xrw/6jClbk4dO1H9NxPgEhJiPiZ5kM41UD7l9UUNd98ak1QcJs+XxxOq886vmrAzT3RUFlSdm8YXv1mJ/Hzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiSM3RqaXc+bbkc9WCcFqr6uHZ4Y5bYQxLFweJ6TxvY=;
 b=srVIWwWx+6RAM1vAf2vnXEtUhnfmSmV2gsgQ4EZpCYgG9Er2VOkaeD7cr+p6Sznky3kauAr27zU2wMMXN8kcwHljWixk6V/5CqEbCZ3N4Sx8IX307mqsMu5v2y/VNehH9CsU8TByJ8ub1jkUl3tIZaz6rAk6HydPw8SAO4BAzD0=
Received: from SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:46:56 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::11) by SJ0PR03CA0080.outlook.office365.com
 (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 16:46:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 16:46:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 10:46:55 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 08:46:54 -0800
Message-ID: <86378b86-bf98-6dc5-0f3b-0a92cfa6a5f1@amd.com>
Date: Tue, 2 Dec 2025 08:46:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251202053717.461943-1-lizhi.hou@amd.com>
 <b18d6c28-fd7a-43df-b2a5-a8af3050c2a1@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b18d6c28-fd7a-43df-b2a5-a8af3050c2a1@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|MN2PR12MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bc5a5f-0a2a-45aa-e432-08de31c267a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2NXVW5CQ0tGc3ZlVjlOZ2NjelFBT3lPUncvNkJXN0tnOXpZS3Y2NjQ2Mkhs?=
 =?utf-8?B?NkNmaVM1dGJDOUJIWnJjNzZ1azBZVmpoMi9IN1Zod3FIdTB3Q2JwWFBnZ3Ro?=
 =?utf-8?B?K0FIQTRzNXFaeVN0Z2lPQk84dEZQQWJNSmpCeXZINU1zL1lQSllWZ0ljUGVM?=
 =?utf-8?B?d3hXa3E5cDZpZ0MwWitHQUo4b2dEUmh2VldMODRqcUh1V2tKMVJKdFkzVUU5?=
 =?utf-8?B?VnJRUFNlS1A3UWd2UVE0WHpGN2drRDVyVW4ySzZDc29BWm4zMURFNUZwNENw?=
 =?utf-8?B?MzYxUC95UTE4YllmbG42bkpOUC80V2JpNlpITU9SclZlZ1p4WXZCNVA1QkVv?=
 =?utf-8?B?NTJ5TkZKV1VPblZiM2Raay9nZWhSaXdoamJLTUxwY0RHUEU4Z0drcjloTStO?=
 =?utf-8?B?blNReVcwTlR0T2FXUloxREYva1Nzai9iWW1CVDBmMmFkVGJjMVl3TVdtS0tD?=
 =?utf-8?B?TnFFS3BvZENmRHh1UDlqL0YrZ0Y2QXJiblNNSlNQUkpnenUxeTRGKy9IbDA1?=
 =?utf-8?B?WVFtRzUvMURUZmdaVExsYUY5WmpYTjQvY3d5QzRqZ0h1aVkyakZVS3E3cnVJ?=
 =?utf-8?B?MmJ3bHN2RmgzMzY3TW9pUXBkRnIzODdzcEhSZ1QwOHpwazJFUkIvWEJmaGZR?=
 =?utf-8?B?QkpHdFRwS2E2QXNlY0ZXRzhqYUVDWWcrWmp4dWs4ZmE1T3V0dm40OEh4WUNw?=
 =?utf-8?B?L2doWnlwSHNEVDIyb2JLeUlQNXVVc0RBZk1VTm1zbUFRMlhpakRVZXRab1Ux?=
 =?utf-8?B?VEF6Zmk1TlBkb1dhYnpVV0NzOEliKzdYc3FLZHhidFlOUWU4VXZDcm1ZUHJy?=
 =?utf-8?B?bmZEbVNONVpoT3JQRGI3elYxVm83cnl0UkU0UVMzMXZyYlV5blJ4M0JVeXNN?=
 =?utf-8?B?ZmlzVldEamV1RmxRSmNzUFlwRVNQd3BNU1RSVVc4aTdKQUtJYzZZWDVtak5w?=
 =?utf-8?B?b0pzZlU4WHFKYVV6TElBcWExV0V2OU9Qa1BFNjMwWGNqWVExZE5JcldlNmJn?=
 =?utf-8?B?VmdacnR5aTVlQVU5T2FRMUE4Z0ZrVUY5T0xlc1RLd0dlcnhGNEh5RWV0MTJT?=
 =?utf-8?B?ejNoM0JXalRtQVdNU0F5WTBORThmVWhKakpaaEVIUnc0WDZnQjQzUnFKU2NR?=
 =?utf-8?B?YTFSVUZsamZtenlWT1JCMXhGZzBLR3NRTEhZbWpBRnFCeTZhMmk5UmkxVVRi?=
 =?utf-8?B?d3NSNXJ4Q2hidjJYQzNBcC9hN09zMTdTKzhxcmtTTVlOZjlrV0RqajJDOEtX?=
 =?utf-8?B?c0ZsZWZJd1NvS2VCSHFCY1hjL25yTkdnNFlVWDlsTnd4M2QxWHFXVk1LY2xq?=
 =?utf-8?B?UEFFd0lPR2xQMkIzcVhtS0I3cTIrYzE5OXJmYk5FWEYzT3ZtOVl0enZvV09q?=
 =?utf-8?B?Q2dpMXFYU1YyYW82aVpUbitwU3oxa0lLZzRTRUFFQ2NZZy9iRGpGaEZEd0p2?=
 =?utf-8?B?cVh4Mk53eXJnK1ZMQWdnYU9MbnJIZ1RQd0hFL2l6OXpFVGN1Ujl1TDRpa1VC?=
 =?utf-8?B?WG5DSnFxMHR6bUxmdWZDc1VBV0QwOUd0MGZ1dmRpbFJ6bUlPaUp6RXdWQ29a?=
 =?utf-8?B?UDBtb2N5OWtrenNKNkhnNVdNLzlpSVRsbTlYYmR5bS9weHVZWXIyTGlBL0tK?=
 =?utf-8?B?NzU2TGdVWW0zbXQyNFBoM2pDK1ZvVFZqd1hKYTYweVpTZWp1Q3k0RWNWejdp?=
 =?utf-8?B?cU5udWlQS3FhTmlVWnNCR0FwZjd6MTA2RXozVUJqY29XZjZmSmFpOXJXYjY1?=
 =?utf-8?B?QjlsZ0ZzRFU0Yks5SGQxdERBU2NMRFZQODUybVFUcGNlS0kwMk10SDY5aC82?=
 =?utf-8?B?Y3JycDJZZGNSZmE0cXgzSDgrWDAwcDVUdE12dkJ4WmtXeXo3ZFd4dmE5d3Y3?=
 =?utf-8?B?Mk1vUGhyZDZLOXVMbGNiZnVvMFNoU3VGNzlmSzVaZTZ1K0dxMnFkY0ZDbS9y?=
 =?utf-8?B?SS9iVUYvOFJGaXBJTUtCSUROVVdsWDduRSs1cmZZN1g4cFRNRjRVZmhzQjRr?=
 =?utf-8?B?c0tXUlI3a1Y4LzF5S2t3U3BmUWZOaGNEaGQwZkJjU2RzUUZOYVJBSURIdnhM?=
 =?utf-8?B?bzZwUW03eGt5bDR6cTJmc0ZsSFhRRS93eEpBWmlyTG5LUmdEMWFaT2RiTkZz?=
 =?utf-8?Q?VmdE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:46:56.3986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bc5a5f-0a2a-45aa-e432-08de31c267a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285
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


On 12/1/25 21:51, Mario Limonciello wrote:
>
>
> On 12/1/2025 11:37 PM, Lizhi Hou wrote:
>> After issuing a firmware suspend request, the driver must ensure that 
>> the
>> suspend operation has completed before proceeding. Add polling of the
>> MPNPU_PWAITMODE register to confirm that the firmware has fully entered
>> the suspended state. This prevents race conditions where subsequent
>> operations assume the firmware is idle before it has actually completed
>> its suspend sequence.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c |  9 ++++++++-
>>   drivers/accel/amdxdna/aie2_pci.h     |  2 ++
>>   drivers/accel/amdxdna/aie2_psp.c     | 15 +++++++++++++++
>>   drivers/accel/amdxdna/npu1_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu2_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu4_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu5_regs.c    |  4 +++-
>>   drivers/accel/amdxdna/npu6_regs.c    |  2 ++
>>   8 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index d493bb1c3360..fee3b0627aba 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -59,8 +59,15 @@ static int aie2_send_mgmt_msg_wait(struct 
>> amdxdna_dev_hdl *ndev,
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>   {
>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>> +    int ret;
>>   -    return aie2_send_mgmt_msg_wait(ndev, &msg);
>> +    ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> +    if (ret) {
>> +        XDNA_ERR(ndev->xdna, "Failed to suspend fw, ret %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    return aie2_psp_waitmode_poll(ndev->psp_hdl);
>>   }
>>     int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index a5f9c42155d1..cc9f933f80b2 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -70,6 +70,7 @@ enum psp_reg_idx {
>>       PSP_INTR_REG = PSP_NUM_IN_REGS,
>>       PSP_STATUS_REG,
>>       PSP_RESP_REG,
>> +    PSP_PWAITMODE_REG,
>>       PSP_MAX_REGS /* Keep this at the end */
>>   };
>>   @@ -290,6 +291,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl 
>> *ndev, enum amdxdna_power_mode_type
>>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct 
>> psp_config *conf);
>>   int aie2_psp_start(struct psp_device *psp);
>>   void aie2_psp_stop(struct psp_device *psp);
>> +int aie2_psp_waitmode_poll(struct psp_device *psp);
>>     /* aie2_error.c */
>>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
>> diff --git a/drivers/accel/amdxdna/aie2_psp.c 
>> b/drivers/accel/amdxdna/aie2_psp.c
>> index f28a060a8810..4bc60f458fd4 100644
>> --- a/drivers/accel/amdxdna/aie2_psp.c
>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>> @@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 
>> *reg_vals)
>>       return 0;
>>   }
>>   +int aie2_psp_waitmode_poll(struct psp_device *psp)
>> +{
>> +    int mode_reg = -1, ret;
>
> It seems like from the usage mode_reg shouldn't be a signed integer.
Will change it to u32.
>
>> +
>> +    ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), 
>> mode_reg,
>> +                 (mode_reg & 0x1) == 1,
>> +                 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
>> +    if (ret) {
>> +        drm_err(psp->ddev, "fw waitmode reg error, ret 0x%x", ret);
>
> Aren't these return codes going to be negative in the case of an 
> error? IE they shouldn't be 0x%x, they should be %d.
Agree. I will fix this.
>
> Also shouldn't you be using XDNA_ERR()?
Sure. I can use XDNA_ERR.
>
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>
> You can probably simplify as:
>
> if (ret)
>     drm_err();
> return ret;

Agree.

>
>> +}
>> +
>>   void aie2_psp_stop(struct psp_device *psp)
>>   {
>>       u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index ec407f3b48fc..ebc6e2802297 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* Address definition from NPU1 docs */
>> +#define MPNPU_PWAITMODE            0x3010034
>>   #define MPNPU_PUB_SEC_INTR        0x3010090
>>   #define MPNPU_PUB_PWRMGMT_INTR        0x3010094
>>   #define MPNPU_PUB_SCRATCH2        0x30100A0
>> @@ -92,6 +93,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, 
>> MPNPU_PUB_SEC_INTR),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, 
>> MPNPU_PUB_SCRATCH2),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU1_PSP, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>> b/drivers/accel/amdxdna/npu2_regs.c
>> index 86f87d0d1354..ad0743fb06d5 100644
>> --- a/drivers/accel/amdxdna/npu2_regs.c
>> +++ b/drivers/accel/amdxdna/npu2_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index 986a5f28ba24..4ca21db70478 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -116,6 +117,7 @@ static const struct amdxdna_dev_priv 
>> npu4_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU4_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index 75ad97f0b937..f761a6661f40 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -62,7 +63,7 @@
>>   #define NPU5_SRAM_BAR_BASE    MMNPU_APERTURE1_BASE
>>     static const struct amdxdna_dev_priv npu5_dev_priv = {
>> -    .fw_path        = "amdnpu/17f0_11/npu.sbin",
>> +    .fw_path        = "amdnpu/17f0_11/npu.dev.sbin",
>
> This seems like an unintended change.

Ah. Yes. It is a merging issue. Sorry about the confusion.


Thanks,

Lizhi

>
>>       .protocol_major = 0x6,
>>       .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU5_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 758dc013fe13..1f71285655b2 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU6_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
>
