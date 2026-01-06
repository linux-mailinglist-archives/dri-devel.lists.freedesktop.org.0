Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E416CF989A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CA510E52C;
	Tue,  6 Jan 2026 17:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s4XrZUDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010014.outbound.protection.outlook.com
 [52.101.193.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0A810E52F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 17:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0y7Dzg5qh8DI2+FIWt3qlD1emx9+Qx4CcQIfReezy0JAzYsFbRbh/YJDwDVyhAgipEMnXhj2Su+c9z8iD+1iTor7bx4r/PcEgKvgmC1AbhdUfEhlWmNtSVIn0En5hmctq5R0WCdVjjRmXegTssph0aEurraSXzTjkf1MgYNASLZCNx5mYyQLUO1Y/4etG1Mf9OzwrwQOAtzHKvz8mYMQeycs2+8TXj8hXWej+AO9ozdigGO8xcP0XNa6hhaxPO6rDQXjKq9VufvG7FuPgJyLG2oZY4qO06ecV5absF7bOaD8c9S0fsxbRjXIwSIvVq5cGFgg+/OxFGn5ETHSYymhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCY5Yt53KQpKq+bDZZyEDDSO0q/hCgPgYda6+6fwux8=;
 b=tFSgs1YvXT0ROl/i+EvnuozwWpaX2NT3bF6dbdFZ/PedXxpiARHz5P05r76ySFaB9RjUz5QlOfXxe4K5CVoHQ2zYIEYGtZgR1G2Zbj55K16WRhdxL+bkUm85GqCKnOzkaWg4/aMds5bwcgNDtxnwULDcDwDCzMS9RjyWNyBKd7yyxWB/mHWNPo1cDl8b/h5Cf2C9g61YTl+YmicOkrdptHD77mKepXQPn03oomwVSy1VQcIH4biVYx6iQ2UMBSdtuxNZH/IXc7Zaabc59q3xD5/vyY4f0sh+d6RDhhxys8kJigk2B18j+3rDwwZn54do5dmY/fkhErELIsvUDwkg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCY5Yt53KQpKq+bDZZyEDDSO0q/hCgPgYda6+6fwux8=;
 b=s4XrZUDYgYAuyonj+lFaOvVXQwO61AaHKwETqhjHxjq2qHQpNfyraDMKm9RL3Y95DKOeU4+RHyVraGlW8JjIrsAxMsUJxU7lh9eGAV0D9SagdiciIZK9aHLlS/k92xn4rrCcL/RiUIR5XRndH3jlHxBGXmU3soE+N3fRoAdP3aE=
Received: from SJ0PR05CA0183.namprd05.prod.outlook.com (2603:10b6:a03:330::8)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 17:07:17 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::fe) by SJ0PR05CA0183.outlook.office365.com
 (2603:10b6:a03:330::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Tue, 6
 Jan 2026 17:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 17:07:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 11:07:15 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 09:07:15 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 11:07:14 -0600
Message-ID: <4363d65e-c50b-eb1a-39d3-99a9809f3c37@amd.com>
Date: Tue, 6 Jan 2026 09:07:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <VinitKumar.Shukla@amd.com>, "Patil
 Rajesh Reddy" <Patil.Reddy@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
 <20260105172956.3732123-2-lizhi.hou@amd.com>
 <3e19f17e-3d5d-4b48-8776-65ac2543c066@amd.com>
 <8495eeb5-b049-2efc-4ba7-c6dad1747501@amd.com>
In-Reply-To: <8495eeb5-b049-2efc-4ba7-c6dad1747501@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e609632-9777-444f-9380-08de4d460b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmZQdzk1YlczSFNONXhBbUJac2s3cUtpUy9LTnlvYUFtYXJNZDV3bTdFRTZa?=
 =?utf-8?B?bUFRV0toYmxYdmRIRHRWNTZ6ME1Ka3Zmd2dVZkxheEZHcE11NzhRRCtNd3NF?=
 =?utf-8?B?SzJrbWs3ZkQwc0pyc2JmUFJIdkNrekoybU44RW0zeFU2YVhvdk12bHdLck1v?=
 =?utf-8?B?Y0o2TXBaamp0c2xBMVdMaTRldGRXaGVJVUhWQVlvMnQ4SjdubEZZc3h4ZVFU?=
 =?utf-8?B?Q2FJMmduRXI0Nm5iRkZoZHJxMld3N0ZVV1hMYlIyZ2lrTllmdVFKb1RRL2lQ?=
 =?utf-8?B?eUhuZE1TRUUvaHBMang0U0dDTDlFZzh6M1pHTUdLY09xT1ZkL1B0bnNQOVZ6?=
 =?utf-8?B?NDM1QUwvWTdXQmR4cHhMeGJhS2dEN0NiMEExbENsN21vdnpYSHdxTVk0aXhZ?=
 =?utf-8?B?cWZyQk1lL3Jtb1BmUnVScGxrVTJWNlZBSmFDTzBTZHhhOTVLR1RKamJsMVdz?=
 =?utf-8?B?MnBhNkNKTzBlUTZxbS9GUXRLM3VMZ3lrR204bjRUcnFnOHl1VlhWcHZCNnFL?=
 =?utf-8?B?WnVMNm1BSTBSSmM4dk5STW0xbnVIdlpNZ3BGYS9odTNUVnBZT0phcU1zZlRN?=
 =?utf-8?B?OVM3OGRmd2FrWXRmTnh1aVdYL3NmRm9EWm9xN3BKdThwWXNDZ0lXRFpqckRC?=
 =?utf-8?B?UEhWOEovbzVsZ004WkhYK2orMnluYlVWc3ZCcVhBU1QveG8xUmxVQWFQK3E2?=
 =?utf-8?B?QVNiZlRzbE1TUy85UUdKZHNGbU9BTGZzcjhEelZycnpQbXhBWnk0Qlg2bUIx?=
 =?utf-8?B?UlVvcVduMlU0Y0FUU0RHYWJjMkY1YXpyYWl1YllmWlgzRURZaERMajFoLzFR?=
 =?utf-8?B?c2Nmek02aDU5dHAzTW0xdjRKT2Fma1FYSENqMTVnSkpYcXBVT1NZYmtkdnIr?=
 =?utf-8?B?VUVtWHlSenpmOGtDT2JqL3lKNWVRYTdScVU2VW9RNzlWZStNWXFTUk41ZjZO?=
 =?utf-8?B?ci9xc2hlMnh3bHZ6UWtrQStUbWZld205anpPNWhIb3FJNjF0cXZqWXhtNjl2?=
 =?utf-8?B?cjI1SWdrVlVDbHFMZjYyaTM3bmZXS1hLeDcyYmhFZUFQeXFZMjFjV1g5eUdu?=
 =?utf-8?B?VGxsYUNsMllQTzgyY0UxRUQ2TnNWZzludEhYam0wUGR3MFdZdDBVdmVWczVG?=
 =?utf-8?B?VVpCbnE3U0lnQW1EZENkcWRRN0ZLOVdLVXl3YXVzQWhpN1ZKSHoyaFlOOW1B?=
 =?utf-8?B?dDBVOHgwcHhhSFlxaWkyTFRXNk1QdkcvcGJsRU9lb2VWZitCZGFzS2RFdmtB?=
 =?utf-8?B?YVRPMlBYSkxOZ2o4MnJSdWlzbEZ2VTJtVlIvMVJDeDR0akNiUVh4WUV1d0Zo?=
 =?utf-8?B?UFErZklDMjIzK1k3aHYwQWxOZm1CUzFzSW13VnMzRnF5aVc5QjJKR0JCY2wy?=
 =?utf-8?B?SGgybHhiNkZKTXppZm8yWlNQdHRTRmZGNmdkc21ReGU4OVFZVm05YnRRekZQ?=
 =?utf-8?B?bGtrT2VSdHJ3U1IzNVJuZDQxTnJ2M2tpT2R1M3lidllkSHBLaFNBRDNkSHBH?=
 =?utf-8?B?L3VDUEdSVFhPT01vN0ZSbDZ6VnZKd2xrU0hGMkUrcDNHbDVlYWZTZnZDSy84?=
 =?utf-8?B?VXpoL21HS2xpOHE1ZHVXcWZQclU5VWhCbWt3d3o1VmIwQS9ZREdqV1ZyclZO?=
 =?utf-8?B?TXRtM1NrdkJXa0JnSUMxY3FURmlsM0tpRXRFQmtWdCtKV0lxTVBTNTJCdk14?=
 =?utf-8?B?VFkwYmZqWW9MVFl2WVFZb1dsZ0o4cWNDdnpYblFmZDFUR3laWnhMNXdoV0I1?=
 =?utf-8?B?SWR4SmdGS1B2T3N6WGtRa3BjdTdRcDViUCszaVIxaHhNa1kzbWpsN3plcU1v?=
 =?utf-8?B?Sy94bjFzaytKM2NZbXlOVmMvK3A4d1ZYRnNUcW50ZzZiOVlGblRKRzRScFZH?=
 =?utf-8?B?YksrQ0J0NU44ai83TkJyTEtqVnNDcXhaK3k5TFBDVEtaTE5jR0ZpOUdjMmtY?=
 =?utf-8?B?TEk3NVFaZ0gxNzIxWU5xTmlIRG40S1JlVFBvaGIvUzMzUnBFNndGSGZkRkRP?=
 =?utf-8?B?eHM0SGl2WEljTnNvYUltQ2hNc0VYVUtJSnNhcHJQWEQyV1BUVFBiVDlkaUcv?=
 =?utf-8?B?NzhBcUpaZHdqeExDWC8ydFhQenM0Wmc2ckIrZjNKUUpTVDVjVkE5NWZtL2Ni?=
 =?utf-8?Q?iVu4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 17:07:16.1339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e609632-9777-444f-9380-08de4d460b19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074
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

Hi Ilpo,


What should be the next step? Should I generate both patches based on 
review-ilpo-next? Will the amdxdna change upstream through platform-x86 
tree?


Thanks,

Lizhi

On 1/6/26 08:16, Lizhi Hou wrote:
>
> On 1/6/26 05:19, Shyam Sundar S K wrote:
>>
>> On 1/5/2026 22:59, Lizhi Hou wrote:
>>> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>
>>> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a 
>>> new
>>> interface to make NPU metrics accessible to other drivers like AMDXDNA
>>> driver, which can access and utilize this information as needed.
>>>
>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> [lizhi: save return value of is_npu_metrics_supported() and return it]
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> Lizhi, just noticied that this patch may not apply cleanly on
>> Ilpo-next (which tree does this change land? drm-misc or
>> platform-x86)? If platform-x86, I can share you a rebased version
>
> I used drm-misc.
>
> Lizhi
>
>> offline so that you can wrap into XDNA series.
>>
>> Thanks,
>> Shyam
>>
>>> ---
>>>   drivers/platform/x86/amd/pmf/core.c | 76 
>>> +++++++++++++++++++++++++++++
>>>   drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>>>   include/linux/amd-pmf-io.h          | 21 ++++++++
>>>   3 files changed, 99 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c 
>>> b/drivers/platform/x86/amd/pmf/core.c
>>> index 8fc293c9c538..d180a39e03bf 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -8,12 +8,15 @@
>>>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>    */
>>>   +#include <linux/array_size.h>
>>> +#include <linux/cleanup.h>
>>>   #include <linux/debugfs.h>
>>>   #include <linux/iopoll.h>
>>>   #include <linux/module.h>
>>>   #include <linux/pci.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/power_supply.h>
>>> +#include <linux/string.h>
>>>   #include <asm/amd/node.h>
>>>   #include "pmf.h"
>>>   @@ -53,6 +56,8 @@ static bool force_load;
>>>   module_param(force_load, bool, 0444);
>>>   MODULE_PARM_DESC(force_load, "Force load this driver on supported 
>>> older platforms (experimental)");
>>>   +static struct device *pmf_device;
>>> +
>>>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, 
>>> unsigned long event, void *data)
>>>   {
>>>       struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, 
>>> pwr_src_notifier);
>>> @@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct 
>>> amd_pmf_dev *dev)
>>>       return 0;
>>>   }
>>>   +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>>> +{
>>> +    switch (pdev->cpu_id) {
>>> +    case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>> +        return 0;
>>> +    default:
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +}
>>> +
>>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct 
>>> amd_pmf_npu_metrics *data)
>>> +{
>>> +    int ret, i;
>>> +
>>> +    guard(mutex)(&dev->metrics_mutex);
>>> +
>>> +    ret = is_npu_metrics_supported(dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = amd_pmf_set_dram_addr(dev, true);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    memset(dev->buf, 0, dev->mtable_size);
>>> +
>>> +    /* Send SMU command to get NPU metrics */
>>> +    ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 
>>> METRICS_TABLE_ID, NULL);
>>> +    if (ret) {
>>> +        dev_err(dev->dev, "SMU command failed to get NPU metrics: 
>>> %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>>> +
>>> +    data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>>> +    for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>>> +        data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>>> +    data->npu_power = dev->m_table_v2.npu_power;
>>> +    data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>>> +    data->npu_reads = dev->m_table_v2.npu_reads;
>>> +    data->npu_writes = dev->m_table_v2.npu_writes;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>>> +{
>>> +    struct amd_pmf_dev *pdev;
>>> +
>>> +    if (!info)
>>> +        return -EINVAL;
>>> +
>>> +    if (!pmf_device)
>>> +        return -ENODEV;
>>> +
>>> +    pdev = dev_get_drvdata(pmf_device);
>>> +    if (!pdev)
>>> +        return -ENODEV;
>>> +
>>> +    return amd_pmf_get_smu_metrics(pdev, info);
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
>>> +
>>>   static int amd_pmf_suspend_handler(struct device *dev)
>>>   {
>>>       struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>>> @@ -477,6 +547,10 @@ static int amd_pmf_probe(struct platform_device 
>>> *pdev)
>>>       if (err)
>>>           return err;
>>>   +    err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
>>> +    if (err)
>>> +        return err;
>>> +
>>>       apmf_acpi_init(dev);
>>>       platform_set_drvdata(pdev, dev);
>>>       amd_pmf_dbgfs_register(dev);
>>> @@ -485,6 +559,8 @@ static int amd_pmf_probe(struct platform_device 
>>> *pdev)
>>>       if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>>           amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>>>   +    pmf_device = dev->dev;
>>> +
>>>       dev_info(dev->dev, "registered PMF device successfully\n");
>>>         return 0;
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h 
>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 9144c8c3bbaf..1bf896c5b92c 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -12,6 +12,7 @@
>>>   #define PMF_H
>>>     #include <linux/acpi.h>
>>> +#include <linux/amd-pmf-io.h>
>>>   #include <linux/input.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/platform_profile.h>
>>> @@ -413,6 +414,7 @@ struct amd_pmf_dev {
>>>       struct apmf_sbios_req_v1 req1;
>>>       struct pmf_bios_inputs_prev cb_prev; /* To preserve custom 
>>> BIOS inputs */
>>>       bool cb_flag;                 /* To handle first custom BIOS 
>>> input */
>>> +    struct mutex metrics_mutex;
>>>   };
>>>     struct apmf_sps_prop_granular_v2 {
>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>> index 6fa510f419c0..55198d2875cc 100644
>>> --- a/include/linux/amd-pmf-io.h
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -61,5 +61,26 @@ enum laptop_placement {
>>>       LP_UNDEFINED,
>>>   };
>>>   +/**
>>> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
>>> + * @npuclk_freq: NPU clock frequency [MHz]
>>> + * @npu_busy: NPU busy % [0-100]
>>> + * @npu_power: NPU power [mW]
>>> + * @mpnpuclk_freq: MPNPU [MHz]
>>> + * @npu_reads: NPU read bandwidth [MB/sec]
>>> + * @npu_writes: NPU write bandwidth [MB/sec]
>>> + */
>>> +struct amd_pmf_npu_metrics {
>>> +    u16 npuclk_freq;
>>> +    u16 npu_busy[8];
>>> +    u16 npu_power;
>>> +    u16 mpnpuclk_freq;
>>> +    u16 npu_reads;
>>> +    u16 npu_writes;
>>> +};
>>> +
>>>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum 
>>> sfh_message_type op);
>>> +
>>> +/* AMD PMF and NPU interface */
>>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>>>   #endif
