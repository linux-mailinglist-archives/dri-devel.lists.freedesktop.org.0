Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90BCB6F9C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E235E10E828;
	Thu, 11 Dec 2025 19:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QfxQyz+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A09D10E828
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBW6VAv7aS00tJY+JL72XX+EdybQiM0d9UjvhA+lZPJj5QE3+ZpFVyv6Bg0TpdhZwZYOCahk5MC0vXdFIdYpywaKiu+8/9tsXLX+i99iUUrlhJn0a804WDN5McwLRTL+QWInwUxV0WzARGW+hLqIQYQfKYz+PmgozeAd6hOkDQOjk62Ag4s7OHz6XzblZODt2qRSnplNLe1qdHZDNqBZPi6Q7EucBTScAGJWYZHfOiY//efGXMVy/QRxy1eTAnkTwQZdxvDb/5td4X77lBRU9RJQcnBHQ1RmhpjdQErtZOkNYMB1T/Z9FMa9IT//ehhA+T/YORSJmfoZfDMBqFEI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQkyK4axOQtkhFPHLFqwYjurS07nJGtt4V0EPAKJCpY=;
 b=vG2ZP1etpdebXJaZVhfzZYOvviK5FUJHbENv25yZ6u+aUX4z+GHP+yZbhlEBE7jYRfEOHLnCzZAqbnPvEIoD6s8AdW00/dVf+P6ymb5b/1CNCeyfkWydNVDVBiwk7oQOWO5vmpIUdZOBxYQdQ3kGHJ7mJ3mJWX4iryPbzdVRiJy9bXhNs7c4UcgBmF+yrrOM2t54kB8XfKMDMDe6G8yJrhvvjMGB4amGfAaE572lFPohhR8EC4smEZjhTBNybBggnDRTXDzsrg/GPwq4BEF/DHyrPXrqCvXIbLkQzpvOWHNATqop09T2uuOp9ojd+EpStPl9gKmqk7gJXZ7zDnJAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQkyK4axOQtkhFPHLFqwYjurS07nJGtt4V0EPAKJCpY=;
 b=QfxQyz+01NT4K7r52tn+cOyqaXe6CjbMnG3uZSJdzuqpcmFB2ulRe4o5dlFg5Jqvn+rxpY1gQZRYMu5KdGqWAIuBv1puuv+M3WtxCeZpMYGbhC7V/2uYaJB5G6AiB7hC6AfdF8Hrcwm9U37MA7szTpV9c1dagGz0gFU0uPTuOK0=
Received: from DS7PR03CA0173.namprd03.prod.outlook.com (2603:10b6:5:3b2::28)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 19:07:57 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f9) by DS7PR03CA0173.outlook.office365.com
 (2603:10b6:5:3b2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Thu,
 11 Dec 2025 19:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Thu, 11 Dec 2025 19:07:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 13:07:54 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 11:07:54 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 11:07:53 -0800
Message-ID: <26ee5a0e-994e-16d5-97f6-322ce993d8cc@amd.com>
Date: Thu, 11 Dec 2025 11:07:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>, "Shyam Sundar S
 K" <Shyam-sundar.S-k@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <VinitKumar.Shukla@amd.com>, Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-2-lizhi.hou@amd.com>
 <5217a9b3-8489-fd18-051a-46a497ff56bd@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <5217a9b3-8489-fd18-051a-46a497ff56bd@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: d575851c-de9a-4375-2f57-08de38e89833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGVXZ2w3MURRQ2kzMmxvckRucWFqVXdjU1YxT2RFaGFiTFR3RGxsQ1FoMmho?=
 =?utf-8?B?dDZ5VXdCaCsxdHJTNlREOTFDTGxOTUFiNVB6NHMyOE5tSTdWdjg5YmVpblMv?=
 =?utf-8?B?a1pjNzl2WTJrSGQ5bmNkQU81WWRsWmFPaUFhOGtCOVQyNUYweWpqZE56a1Z4?=
 =?utf-8?B?Qzk3UThQd2ZqclgyVmZKMHpBNEp2Q2FpMDY5M3lRM0RxQnNuYkxWSDhFVDZm?=
 =?utf-8?B?amcyMk9rZVVyUUcvYWw4cDRwUDlUMnErSjRlclpnNThSMWl5T3NjU05lcVJ5?=
 =?utf-8?B?bmw3S2o5dkVhd3RJcFZWbFh1OGVKTXlqaEdZQ0pkZ2pTcWw0T25GdDB1TXJW?=
 =?utf-8?B?U1dxeVlTaWtDY013Z3pxdEFlMTlFVnNvT2UxbkpmQXZhRDZNS2tkbHI1M2hl?=
 =?utf-8?B?UFh3OU5uUXRBU3laRVN4VkNCTzdiYUJPUmV6MXZtWW9NYTNxSUlnQnpzVU5C?=
 =?utf-8?B?STBSQ2NoN2cvKzgrQXd0RVE1UEJkazA2bkkvek1YbWwyVit4RUVhd2RqL3RH?=
 =?utf-8?B?Tis1QVJ1TVpJZzNaSHZNVXlsS0RLYVNSdVVjTmErTWtEb2Y3eGxWMU9EcXRW?=
 =?utf-8?B?NUVBZ3FmVmN5anh3NVBsZVdkV041NWZ6TzBLbXJOSzlMQi91amJXZzI1YzBk?=
 =?utf-8?B?eTBvZCtTMzFBSGViM2ZxQW45NFE0TWd1TDhhd0liTE1MVE1XSDU2ckt3TVMw?=
 =?utf-8?B?OTh6V0RPY1dIdFIrQkpIblIzM0E4SDB5OFRpcmVyb0c2RFpUWlZ5cVc5QnE0?=
 =?utf-8?B?eGZscEdSc3RrbEg2M2xydWFFaDA2VG83Z1hCWWU4VzIzc1lXQ0c3R2QyOXp4?=
 =?utf-8?B?K3A3V3JJaU9lUlFreTl1WndUZWtqYStBdnpCdHJnS1ptU0ZjYS9oQTBjOXlZ?=
 =?utf-8?B?Wnh1VUNsYlNFbDdMbWNFUXhWOWZaa1B5YkkvOVl2YmtHTEFLbVdvNFVMMlo5?=
 =?utf-8?B?cjVzNUNvcmhveGFORWhVNUpVbzltN2xleUplc3VWRWlOUllCNXVvc3ViaERk?=
 =?utf-8?B?cDdhMWl2T0pMU1IyRG52SGFsQmpiVGN6ZWplMUFtWmk4OVBHcDBLUkt5eEd4?=
 =?utf-8?B?Z0s5VlBIWml0ZVR2YllBejkwenliMHhZS2pvVjBDcUZJK1czTHNFZlhlNklW?=
 =?utf-8?B?Q1VhcGRPVk10bHlJbENzWmlqK0NVaEJHVHZwTGdwdXowRCtGN2o4T3EzbWpx?=
 =?utf-8?B?RlZwMEtxcXArYmUvZElOUTk4QmFWNll6aVQxemFuVVNtbGVUSkx1R2htTkJm?=
 =?utf-8?B?enl4aHl0OHh1TjB4MU43UFpMR01PeHVGTWR2QXQzTW9pL2F1RktsOFJVS3ND?=
 =?utf-8?B?WEdrOW9QWXZKaVloeW44Titya1NyY3JFSTRRbjJMdjFqTHNuYk5pYWU4UlVn?=
 =?utf-8?B?Z0FyQWFuKzVrb0ZreWNDZHZERi8vZ20rWHFPWlhKRUlxVE10MEw3MzRiREFa?=
 =?utf-8?B?RjkzNWtUV2U4U0htZ2c1Qyt2cDNHT3VJeCszV1FmQzNzYUtnSHh0bi9Yam5F?=
 =?utf-8?B?NDZsTU5NQmVXUWxrc3JpOGdaT3VzUzBpZ0paM3BMR29PU3NLWTNWSjhLU0wv?=
 =?utf-8?B?N0hPbVhlUkdBTE1UclA5bjgyNmFBRnprOWJzdkloNGc5V2ZDcXg4ZFprWlVM?=
 =?utf-8?B?MnVybW9vZXhWSEUwY3BFdzF5ZVdkcUFKbWxsZ1RneTBtbFFyb2VLUjQwODgv?=
 =?utf-8?B?SXFISkVidHBUclRhNnNrV1RLQkFvWjE5MTBxRGhaNGQ3ZzIrQUFXRzZyR2NZ?=
 =?utf-8?B?TC8rVWY2Z0xZaFd1SlhKNmRHLzlUazBrcTNJYVk5cXpLUHVQN2wzN0lsc3B3?=
 =?utf-8?B?TW05RTEyNUZrOTcwaHYrVzdlTHhvK1h2UU9TVm1DRFBlRWM2N0FMektCMlNV?=
 =?utf-8?B?bUhwMlE3SnBkQnNhem9lZkhOUkxWN09TZEdwcER4MTlvekQxQVorUWVPcHNt?=
 =?utf-8?B?cDRCclJPYlJPc3dDU01iK0NWaHk1SFpjMHhVU0c3VWJlclNSQ2pISTVFZzZG?=
 =?utf-8?B?Z3VRbFdrSlJtSzhpK0lEbzlLN2xpeXNqMk92OVNWTzFzSlhxNm5KSjBzU2Vn?=
 =?utf-8?B?ZlA1VHAxOXhpM1MzdlVsOEh1YXFrcjVEbEtMT3AwZDJMTHo2RERGMEpaYWJk?=
 =?utf-8?Q?uPc8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:07:56.9961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d575851c-de9a-4375-2f57-08de38e89833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
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


On 12/11/25 10:28, Ilpo Järvinen wrote:
> On Thu, 11 Dec 2025, Lizhi Hou wrote:
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
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c | 75 +++++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>>   include/linux/amd-pmf-io.h          | 21 ++++++++
>>   3 files changed, 98 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index a6a5d416edf9..8e4ce91b3527 100644
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
>> @@ -314,6 +319,70 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
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
>> +	if (is_npu_metrics_supported(dev))
>> +		return -EOPNOTSUPP;
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
>> @@ -469,6 +538,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>   	mutex_init(&dev->update_mutex);
>>   	mutex_init(&dev->cb_mutex);
>>   
>> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
>> +	if (err)
>> +		return err;
>> +
>>   	apmf_acpi_init(dev);
>>   	platform_set_drvdata(pdev, dev);
>>   	amd_pmf_dbgfs_register(dev);
>> @@ -477,6 +550,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>>   
>> +	pmf_device = dev->dev;
>> +
>>   	dev_info(dev->dev, "registered PMF device successfully\n");
>>   
>>   	return 0;
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index f07e9f4c660a..0354cc5dc79e 100644
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
>> @@ -412,6 +413,7 @@ struct amd_pmf_dev {
>>   	struct apmf_sbios_req_v1 req1;
>>   	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>   	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct mutex metrics_mutex;
> This files seems to lack include for struct mutex (despite using them
> already so please add it finally there :-)).

Sure, I will add it.


Thanks,

Lizhi

>
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
>>
