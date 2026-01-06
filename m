Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1CCF94A5
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A410E3EA;
	Tue,  6 Jan 2026 16:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e0a4iluq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1410E3EA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqI0KwIot7qwXw3kJzAFTPTcGbz+5UNvFlZ4DEsukdfyjLab0SK5LxlO6Rr7B8yzTC8FxYc+E7PxbAij1fyJy8CI8hRWKyDr79Oi7qL/QwMjBmEvJk3gkFQNmKjZh+DhYDf5vT5IvVQLflzwPepKO5GBWtErp94Fx78VCFsxPKy7shAttuMm8wFZQO8ed+X+yBstkbM8zd6z1lxo+/zNLhba/SmNsqtIi3G8v9bd7JrNZ1lxlooqU1paP2z7nTplFqnTsn400HvQVbD7AuuasSDFIE+sGQfpx1lrEzD+VI1rKFy+CCrF2h3fWgeZ/mE/RgDcABn5oCCw3s6ag5lHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0o9J0dqeVzL2KFV1aIulKftVF1a4FuLI6ej+U1Uh8o=;
 b=ddfStVHA7X3R3v2/CGarL0MpwRpzZO5zcBQF1MIR/ZcBhQaeSYvDFirOADU3Wj+zcx9rCu/oE4DnyG0wQLy/oME6WHcwGn3XgQCoc2fu1yCaPXIlgiCnoCTqm8deGNl8wGGJFgfDsMa1PoEK5XnN8l0N6fjvL38CKriOf3NgCrW1oAMb947tj+vbHztTwVFHGhXnnzGwTwASwacLMirbRPC1biPnMVp5Gx685UdoBHkIvlAYsg1ocvuUfejdQvedWIMi7+v4rzVYkjOmpau9hNS1YtjSCGWMZbcOCKr7Ma9QgbKmq83BjiRBqlfTzPPxTLvEpy/UeVE4f4i2aKj4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0o9J0dqeVzL2KFV1aIulKftVF1a4FuLI6ej+U1Uh8o=;
 b=e0a4iluqoYBauxQXST+MRCGf0t8/4Q79r+QS3krhoUa5i1gywKCWgN4nfuAcK8He5uE7fMevU9sEtSaeUVBclJUEe38Ns9sKzMb7oerUr8Ana7xRWlYjiQxH5CwQj/Pjp8PWJpLxUIH0J2qvesg4e4t/UB/PHSXIXCJ/tt5sVec=
Received: from SN7PR04CA0051.namprd04.prod.outlook.com (2603:10b6:806:120::26)
 by CH8PR12MB9742.namprd12.prod.outlook.com (2603:10b6:610:27a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 16:16:19 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::cc) by SN7PR04CA0051.outlook.office365.com
 (2603:10b6:806:120::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 16:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 16:16:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 10:16:14 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 10:16:14 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 10:16:13 -0600
Message-ID: <8495eeb5-b049-2efc-4ba7-c6dad1747501@amd.com>
Date: Tue, 6 Jan 2026 08:16:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3e19f17e-3d5d-4b48-8776-65ac2543c066@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CH8PR12MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: d94c8cb9-5001-45e2-ae67-08de4d3eec9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWREaTdiVWdxb1Y4M2xEZnl2eHBpL2F1aXNQNzJBcFVDZjRSQ29uWlFlYnBG?=
 =?utf-8?B?YXZSUEZkVEx0Q0pLdWNBRWFvWmY3SmE1aHdvY2RTRmZpRStqKzRUcVc2QW5k?=
 =?utf-8?B?d1hzdUw5ZFZ0dXBZSnU3cDEybUpKQitmSHVWaHFmeUhHL29hU3VXby95bFVv?=
 =?utf-8?B?OHk2WlE4ZzlaTTRBM3NuenFqbzdWbjV4RisveEc0NVJkb0M4LzJFZWNvYWpD?=
 =?utf-8?B?ZmhCYlBJaU1zeXFhbnhlMERFSUsxNWs1KzJLRmtJSkZtZHVsMUh1Zm5iTzVW?=
 =?utf-8?B?Y0xVM0JtY0ovamFNUWV1aXBGRzRHZVBmalZQY21jS1FxYzB5b2Q4M0NwNHU3?=
 =?utf-8?B?cTRRVHRvSHMxa0orYk5ZampPWnBYMmRabmIwVXRNSmpITEZPbVByRER5LzJm?=
 =?utf-8?B?Sm1GczJOa3pNZnJ6aU9ZM0YyMHZWc21NZ2dzV2k3MVFJZXQyVUwzbjlYR2JZ?=
 =?utf-8?B?NVZGYlZXcnNRT3NSWGpIemlOYlZBbkFVVWpnVHhtaWlvclF2VXRGaXRCWU91?=
 =?utf-8?B?akVQbzZPTWpGTG5nUm96Ry9malJFV2M3dnN5dkhLbHUxRU9DSE15dWtXaW9N?=
 =?utf-8?B?b1ZjNTlpRGhnT1BsMHFTNVFaazF5L2luNFM3dXE3ZXlkaHNoN29VaVFmeVlH?=
 =?utf-8?B?NjUzOWx4TzFZNk1vdThlV1lBek5acko1MWZ1ejhOV1BnU1p5SkNQNDVweHFu?=
 =?utf-8?B?OHU1cmtxT3psUnZ4TkxmOVM1MVRVdkIwbVcwamRpcG1SaEk1K1ZYSnUwVThO?=
 =?utf-8?B?OGJGZDk1VmdGd3F3cEw4K0VvdlMyRUpnVkJYd1VWSmR0a0hDalN6MlpCdWt2?=
 =?utf-8?B?QVRkYmhzdzI1SDdlKzJnVTYxZmYxaFhKdlZBMHBNb0dSZTM4U1F0NWtUL2xn?=
 =?utf-8?B?a3UxV1kvbytaOUtjV2FDcFBUUkV4bnpVSnloRi9VWlBqRFU2TG01czBjaW1Y?=
 =?utf-8?B?QkJiMSs1cHJvbFpkbFg5dXUwVjMvbnJMRzR4SW9XVUE0VjF5RUtxL3g0NG1r?=
 =?utf-8?B?UkJaSTZIZmpzVXlZMVpZR3ltTG9JMXd0a1k3OHRtdUtXcGF4bDBlR0xMS1ox?=
 =?utf-8?B?SXZRbDQ0d2VSdDRDQWtuOERIVnVJa05yeEVQL3plalN5N1VRMzZMS3BrdTdN?=
 =?utf-8?B?SEw5VjlqUVR0UlF2dDdtc0REd0xKR1VFYWwycjFRUUdEY1R1N1pYYUlVWWZo?=
 =?utf-8?B?bmZLT05NSnpCcTlLb0R6bWNTNnpPOEhodjZQVnpSQlRjb2ZDNTRNUTB0ZUN2?=
 =?utf-8?B?UG4xbjBXSncraGdXbDZMSUhBakFWL1VXdXNEUnVkN01RQW9uYWNPYi84WlRH?=
 =?utf-8?B?UVEyN2Q1aXdyd1hJdGtiK0Z3NFhtNklGZzJSc0VNa0FhaVAvVk5lbWloeFY1?=
 =?utf-8?B?VW1NcDZiQVo2eVl5NmxjN3JQNmFUQ3ZRWVE3TFVUUVJCN0xVaVdKL2kyRkVE?=
 =?utf-8?B?encwdU1iNjM1MHlGVWVBTldsNWpoN3U3MmxuOUp1YVdwQlczZVBDbmVCWmNK?=
 =?utf-8?B?bjVaNW5VbnovUTlSRElwaXpmNkZEVWRWNUg1UktjNUovTnN0cUg0elE2MXhx?=
 =?utf-8?B?cndSSEhsNWNycTBsMzlJZnBwbHRIbE51SXJwYjczZStTUXBLQlpsdVVEUnho?=
 =?utf-8?B?TmRJYzJyd1RZMktNWElHWkdac00xbVhDcXM5Z3MrZlRSOUlrOWRYRkJCVHlr?=
 =?utf-8?B?OG1FTFNuYUFOT2tqcWlqQ01Gdlk4TXZrUjJ6R3hRS0t0dkYyNUZnakNWdllF?=
 =?utf-8?B?Nks3SVVGVjNyQ1pEcnVHaWQ1Vk5JeEdrR0JZRXB2WEl2OXpUWjVKcWZQS2pJ?=
 =?utf-8?B?VHdVVjkxZThsUHRNbFlPSmlEeDl2TDVTaUNEa3U4MmpoWkVkY25CMW1QbmdE?=
 =?utf-8?B?UUhGUDBoR3Ird0tTYXdNcnhLcDluZEdjcjR3allDR3hJdXFFQ0hEL0lIYldz?=
 =?utf-8?B?S0xOblpLM1BQankrcUg5OFcyZjgwdFNRQ253NGZ4M05wNWZTdGE5cTFEWEtE?=
 =?utf-8?B?c2tkSnhuUEM2UStZaEVCT2RoVS9RMjhqYzNZY2pLMFFWem1mbVdNQzVqa0Qw?=
 =?utf-8?B?a3FMSHNZa3VNTThKVzFZdjhHdHZGekx6bndOVzk1WDEzRm13QUYyVUNzay9C?=
 =?utf-8?Q?6Sw8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 16:16:18.5424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d94c8cb9-5001-45e2-ae67-08de4d3eec9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9742
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


On 1/6/26 05:19, Shyam Sundar S K wrote:
>
> On 1/5/2026 22:59, Lizhi Hou wrote:
>> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
>> interface to make NPU metrics accessible to other drivers like AMDXDNA
>> driver, which can access and utilize this information as needed.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> [lizhi: save return value of is_npu_metrics_supported() and return it]
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Lizhi, just noticied that this patch may not apply cleanly on
> Ilpo-next (which tree does this change land? drm-misc or
> platform-x86)? If platform-x86, I can share you a rebased version

I used drm-misc.

Lizhi

> offline so that you can wrap into XDNA series.
>
> Thanks,
> Shyam
>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c | 76 +++++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>>   include/linux/amd-pmf-io.h          | 21 ++++++++
>>   3 files changed, 99 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 8fc293c9c538..d180a39e03bf 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -8,12 +8,15 @@
>>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>    */
>>   
>> +#include <linux/array_size.h>
>> +#include <linux/cleanup.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/power_supply.h>
>> +#include <linux/string.h>
>>   #include <asm/amd/node.h>
>>   #include "pmf.h"
>>   
>> @@ -53,6 +56,8 @@ static bool force_load;
>>   module_param(force_load, bool, 0444);
>>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>>   
>> +static struct device *pmf_device;
>> +
>>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>>   {
>>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
>> @@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>   	return 0;
>>   }
>>   
>> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>> +{
>> +	switch (pdev->cpu_id) {
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		return 0;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
>> +{
>> +	int ret, i;
>> +
>> +	guard(mutex)(&dev->metrics_mutex);
>> +
>> +	ret = is_npu_metrics_supported(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = amd_pmf_set_dram_addr(dev, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memset(dev->buf, 0, dev->mtable_size);
>> +
>> +	/* Send SMU command to get NPU metrics */
>> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
>> +	if (ret) {
>> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>> +
>> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>> +	data->npu_power = dev->m_table_v2.npu_power;
>> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>> +	data->npu_reads = dev->m_table_v2.npu_reads;
>> +	data->npu_writes = dev->m_table_v2.npu_writes;
>> +
>> +	return 0;
>> +}
>> +
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>> +{
>> +	struct amd_pmf_dev *pdev;
>> +
>> +	if (!info)
>> +		return -EINVAL;
>> +
>> +	if (!pmf_device)
>> +		return -ENODEV;
>> +
>> +	pdev = dev_get_drvdata(pmf_device);
>> +	if (!pdev)
>> +		return -ENODEV;
>> +
>> +	return amd_pmf_get_smu_metrics(pdev, info);
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
>> +
>>   static int amd_pmf_suspend_handler(struct device *dev)
>>   {
>>   	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> @@ -477,6 +547,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
>> +	if (err)
>> +		return err;
>> +
>>   	apmf_acpi_init(dev);
>>   	platform_set_drvdata(pdev, dev);
>>   	amd_pmf_dbgfs_register(dev);
>> @@ -485,6 +559,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>>   
>> +	pmf_device = dev->dev;
>> +
>>   	dev_info(dev->dev, "registered PMF device successfully\n");
>>   
>>   	return 0;
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9144c8c3bbaf..1bf896c5b92c 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,6 +12,7 @@
>>   #define PMF_H
>>   
>>   #include <linux/acpi.h>
>> +#include <linux/amd-pmf-io.h>
>>   #include <linux/input.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/platform_profile.h>
>> @@ -413,6 +414,7 @@ struct amd_pmf_dev {
>>   	struct apmf_sbios_req_v1 req1;
>>   	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>   	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct mutex metrics_mutex;
>>   };
>>   
>>   struct apmf_sps_prop_granular_v2 {
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index 6fa510f419c0..55198d2875cc 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -61,5 +61,26 @@ enum laptop_placement {
>>   	LP_UNDEFINED,
>>   };
>>   
>> +/**
>> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
>> + * @npuclk_freq: NPU clock frequency [MHz]
>> + * @npu_busy: NPU busy % [0-100]
>> + * @npu_power: NPU power [mW]
>> + * @mpnpuclk_freq: MPNPU [MHz]
>> + * @npu_reads: NPU read bandwidth [MB/sec]
>> + * @npu_writes: NPU write bandwidth [MB/sec]
>> + */
>> +struct amd_pmf_npu_metrics {
>> +	u16 npuclk_freq;
>> +	u16 npu_busy[8];
>> +	u16 npu_power;
>> +	u16 mpnpuclk_freq;
>> +	u16 npu_reads;
>> +	u16 npu_writes;
>> +};
>> +
>>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
>> +
>> +/* AMD PMF and NPU interface */
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>>   #endif
