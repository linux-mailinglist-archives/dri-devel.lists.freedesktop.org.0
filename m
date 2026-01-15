Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53958D25D4C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4C10E7AD;
	Thu, 15 Jan 2026 16:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xk9cLO39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A860610E7AD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl5FYwTZVjZyAFOFMJzVJJXhmxMWUEHp/oF4adqvactvz+0FG7CUqCdwbyN7pKzjNv19SuvcA1FpimLBqNVhXdqw007QBrFj/KNlnu1UwnGmJ0xkp6CS+lZseYlxHGj3jfRrbGigpZA5W9oQ17LoCg7CkVly5N+hkCSaZwZvsynF1Q0MsX9QxXFXHhQUjTMBf/dNXT7F/iolb8ryQCm4zbAzFjqoJeA1etdlxNjil3fGpeGWMCAgCCSlBFLQPUQ58KzbmkqfD9luvLyne+fVU/2yRq/oWuWE+iWubRPa8GYCbIUifuAk1ej88UlbtZlKmYsTyFy71fwBisnbO42e6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seogoqTdhfW+TPJn+CEKXLzvWS8JAtGtmnkEntykfYs=;
 b=MWCI0YXXZwpa7AlGgEE2TwRcVct5FpqqWIpsaAgRiK5KtfNRXx1vBxT200F7F2KOc6tLWDtgvLkKnjiVgvO6WCHhH424SCusJCjTNo5PNX0Hq5BL5C7wuU/MxhUATnOIjGZP5zbaaZZLi16Jppd2PFUNlQAXtas+Lkee5pIGTX8Q8wNw8ov3cgWNb67D8e6pxCWH0KTAiWa3BDGfxxP/ltl2K2lonP3dPiEz6lQDNib+xBy06++7hPlx09hSzvlguYZ8P8qyaKPFkRDYbmji3G8oG0zTXYULhNpUR1/XYOXNdeFwC49s4aVs/cnLP/NAoZExx0DN+9O9++tHtelSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seogoqTdhfW+TPJn+CEKXLzvWS8JAtGtmnkEntykfYs=;
 b=Xk9cLO39cDXDx5NKEczxlTOmCl9u5Okqec99rkj3F6sDA7qZKb6O+TYxkDuv3iVztFqxEJfYoupHmrav9Popqt3JeOD1T3+/IuSiGsip8H/KSIm8n+hgtLnq7DDdtL4GoVx/HGhsX5wKB05pFJXy0sXXJ0Efk9FfPTQw97pQTSk=
Received: from SA0PR11CA0034.namprd11.prod.outlook.com (2603:10b6:806:d0::9)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 16:49:04 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:d0:cafe::bb) by SA0PR11CA0034.outlook.office365.com
 (2603:10b6:806:d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 16:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:49:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 10:49:02 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 08:49:01 -0800
Message-ID: <f404080d-b325-98c0-9fa1-2190ee2e0ed2@amd.com>
Date: Thu, 15 Jan 2026 08:49:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, Hans de Goede <hansg@kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <VinitKumar.Shukla@amd.com>, "Patil
 Rajesh Reddy" <Patil.Reddy@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
 <20260105172956.3732123-2-lizhi.hou@amd.com>
 <4d365fb4-08f5-0b2f-62df-b8f46b792953@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4d365fb4-08f5-0b2f-62df-b8f46b792953@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 4309e4f6-0d8d-40ab-ec6d-08de5455fd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZmY2gyaGNFL0RuOVhKMzhReVNnRDVRbzdjRDZWL0Y1RUszdjNiWDNpWVds?=
 =?utf-8?B?VlZjWnJsMFBnWUVSMEJCdGRLR3BOMUo2ZGhlenRJYUQvTmtZd05YWnJDVXVi?=
 =?utf-8?B?MG84cENRWlFTcW5pcXpMSXgwaHV4OFV0YXFpSXFiR05oYlA0R3FkZXhCNGJ4?=
 =?utf-8?B?Qy9wVjhsSmdCb0w1Y3NYcWN0VWNpNWxTNHFaYm8xbmVDVG10QmVJbVk0Y1gy?=
 =?utf-8?B?eTU4a3JmcVlJZGFQdzBKQm4zMnFvaVVUV21Cd3dvQUJwN1RUUzFORE5Jdkpv?=
 =?utf-8?B?a1lLdWFIQnVNQWtJZnllNGJEZFlOYzllTWxHYklsdk1iQngxek51dmZWT1ZB?=
 =?utf-8?B?NCtFSGZmdjFnbHpMU2kvZHB1ZzFWQkdFb0NKUTJtcGI0bFRYM2hwazQ4Ui92?=
 =?utf-8?B?SUlTUFUxcytPZnJlOTZ1K0ptV3IvVUcxSEN4QjVkK1JoWkVHWDRvUmhaYnJY?=
 =?utf-8?B?Q251dzhLWU9FQ2hXR04wMURKZkQ4eWlKdjBuQjBnS3VGQVptdzhLd3pIMjI4?=
 =?utf-8?B?bVpKMDF1NTVQeGtpK2JPMFUvRmVtQWJRR2hrMEE1ZVkzRDFIdHBKdHhINjA4?=
 =?utf-8?B?dlllLyt4blQ5Z2doUWlZOGswVTN5eEZEZkVQTWM4V3hVWit0MkdpMm5Editt?=
 =?utf-8?B?UXI2Zy83YnZJOUdTM2p6dFplaGFXRkJzR2Rra21id0hTWThUQndyWGdXTVA5?=
 =?utf-8?B?dHBMdm4rcW5KRmtjS2U2NzU0eEdJMGNyc0pONUdvcS9sdHcxS0dtRjB6Qmpm?=
 =?utf-8?B?MzdVSUFpNFFOSjhCejNCaXlvZ3VCb004dHg2c05aVytQNW11bUR4WkdHaEh4?=
 =?utf-8?B?WTFRS3BQc3paY2JBcVUvM2lRbE1aSGdKS2RtbE5pM2Rja0FqeDBuTkFhUkxz?=
 =?utf-8?B?VE9IYy9qNDJOc280U0MrRFF3TnJSTmVMdUUwZURodkI5YkhpRjdGcHZsVzYy?=
 =?utf-8?B?em1DK2w3MU5ZWWpwMk1DMStzL1RlMHg4MmVwaVNZNDNOV203T0Uxb1hQYnZZ?=
 =?utf-8?B?K2N3OWVsbjV6RE40akhJTjVPVGpzakZTNG9aSEVGMzI1NFhUUkpyWXUxaFNE?=
 =?utf-8?B?Y3BnaXVSZ3ZsR2N6Rk9MVzZINTAxWnl2RExiL21jUkZkUGJPM0lLcTNvWHVC?=
 =?utf-8?B?RTluWi9DMDJ0OGM2dXE3RGtJNitDVnlpQWdGS0JCbmR1ZTNFeUM0ejZFaXUw?=
 =?utf-8?B?SEN2c3VscmxKemxnc2FEYmpxbnZrUHBtWXFHem95SGpPMHl5bmpkUlFlSGs5?=
 =?utf-8?B?L0xlem94elI1NXBLdXJZMGtnSHE1N2NFVm9SbXNwUmM5OUVJSEJ6cVM4QkVC?=
 =?utf-8?B?aXJEUENVanlvRjl3WTVacnNoZ2laakxaVTdYd1B2N1d2OG1ieStkS1gzdStQ?=
 =?utf-8?B?MHRVL0xacElPdGdnUXNkTjB2NytVcmltMDRkWTBYSFM2ZmNuUjJZdWVjaUcw?=
 =?utf-8?B?ckowQjQ4WndJbUlBVnNqRkh2cm56OXg2bWlCRU9EMVM0bTNNQzJ2Vjd1ZVpO?=
 =?utf-8?B?YktyY3htMXF6OGtoQmFKQTNEbWVoemdYaWt1Uk1SVDFNNStmNHM1aVJMV2or?=
 =?utf-8?B?VjRvWW1jWFF1NWJYbzlTTDJEV1lpN2FVTjUvelVoUkxPbG82NjgvVVFvc3li?=
 =?utf-8?B?MjdqYWQ1aFJMazh6MnVKTGlTdUM1RkFkZXU3cnJ5bDJDSWFVcE44bW9Rb2l0?=
 =?utf-8?B?bkhkZXpXMHp0WnNZNm9MT1dzakNRdUJndXFOY1VwTE1QbUJ5MFpwMEhKWWdu?=
 =?utf-8?B?UDhJVkNZZTZJWTlGQTJTdFBpUGtBTEFwVVlaSnRuOFF3bmMzWHMvYW9qZWVw?=
 =?utf-8?B?eVVBOTlwT2hVOTZxY3FpVWNod1BPUXdFMjJuU1d2QkwrSVFsYzdYMEErWERy?=
 =?utf-8?B?UlBXNGYrck5CaGlEdHR5K3F5Z3BLNzZqT04zLzdOQ2IwVWpLUXZZelpOVmdB?=
 =?utf-8?B?WFVJbjY1b2ZZRFM2bFR3akZiVUI1TCttenN4QW0xa2pjYklEOUJHbVFXRmtI?=
 =?utf-8?B?bzJ1eldBSHIvbGllT0pGSFNxWFdNQmhRQkI4bkNxU3R5ekkxZTdyK3J0WEo0?=
 =?utf-8?B?djdabU41SkVmTExBc0l3WjB4ZWgyYVRmRVRTWGs0LzNCRDc4YW5iOTdoRHAw?=
 =?utf-8?B?S1lxWGE0NGFjY0VrVUxPRWtQdGFJTGs3clVKNVhyWGJaYVorUjVsbUpneHpr?=
 =?utf-8?B?SFBtYmdyUENnTDlXQ2tmbEJleGE2bGMxdFk1amJGL3phSEI0Qit2V0Fxb0JM?=
 =?utf-8?B?ZVRvVzhEZ1BZSjk1TmRUVHM0c25RPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:49:02.9638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4309e4f6-0d8d-40ab-ec6d-08de5455fd30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998
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


On 1/15/26 07:18, Ilpo Järvinen wrote:
> On Mon, 5 Jan 2026, Lizhi Hou wrote:
>
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
> One more thing, the export should be namespaced.
>
> And since I'll be applying only this patch and not do an IB, can you also
> rebase it on top for the for-next branch.

Sure, I will send a V4 patch.

Lizhi

>
