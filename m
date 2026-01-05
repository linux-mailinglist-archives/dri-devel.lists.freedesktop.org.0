Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB6CF4AE7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663610E3C8;
	Mon,  5 Jan 2026 16:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IYUVaGp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFEC10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCvuZV0Wh2B8XxV2+fU/j2W2la73//kfwo+g1gYS7ZWyhjbBO1GRnxxwtChwBhYzkvgUP/V8veobN72V3n/dw71pgYl1/UUuH8/nHHaysxtckfO6Cznfi6SoxpQWVH4oBFO7gkhUjXgKeV26zJls0Z1JSDPiYBT/EPklDQgTn8Re/IswWhSKtwGOI8l5E5uZZ9W1epZQL4EmqIh7PhPXHlLlImrTu3/Kv+8PyVd3iJQzcOaCYfRG/ZZz815uypzwhQZHLsvWcCR/J91Z+9yhqseM14wuO7BrLEDhKBV9uUXfwpRenFTQvP1ljfEjV/RWIuG5+cYb5ptOG7lmNgnzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3Pn5EnbhcKQNJ/BtLdKibeqtnTzXBmw8iebLfLjyLs=;
 b=AdVff8camTGw9vAy4r6sbPVqvgbHgKoJybemElGz5b4pOgh+g8Cmyom37P+CUUvd2QZpagKT9uzC4305+AeRadKLVC1zvdxH/4hZLYfbx6u1fLBl+lB7mtXkD0FozeO0HmzPJ7bjiGkoiNIRKiIN/wiZjt6b1ECGCvikVXIRcEZmlJlsOCVv4paSP0g/s6xgm7oKtIsv4lB+C7jrwaG/OKNPsv6teQdCnLfBcipkYoLJX0LoQBtqIwlDKOqOdyCzjBcikwk5iouHMbhGp7xb/SvmMZgDg5xjvD+C+vxPhtik5RcxqJ20rUaVamPqVJZ/qHHCV14rxKJbhMQvQ5yXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3Pn5EnbhcKQNJ/BtLdKibeqtnTzXBmw8iebLfLjyLs=;
 b=IYUVaGp5w7xWOUA8usJRqkQZYCRFKy8KGoxAZ+9CcckGMWXlt6y1+Nd8mxgNoGIkVfA4x6/dot21dPpOju0+u1DoE11Bqh9sftdjL9Emj5moDPRyiAorGaQOjWix2aADVrUljei7aD1ft8C6cue+Jl56cTm7Zu5w9+mzDGNBqgM=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by MW6PR12MB8960.namprd12.prod.outlook.com
 (2603:10b6:303:23e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:29:03 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::e6) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Mon, 5
 Jan 2026 16:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 16:29:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 10:29:00 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 10:29:00 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 5 Jan 2026 10:28:59 -0600
Message-ID: <f5c11ef5-0370-a53e-9fb2-b43f1367b0e9@amd.com>
Date: Mon, 5 Jan 2026 08:28:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>, "Shyam Sundar S
 K" <Shyam-sundar.S-k@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <VinitKumar.Shukla@amd.com>, Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20251212181803.1825142-1-lizhi.hou@amd.com>
 <20251212181803.1825142-2-lizhi.hou@amd.com>
 <975fcbfc-33d2-758c-9efb-cbacef47883b@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <975fcbfc-33d2-758c-9efb-cbacef47883b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 78467549-a857-4ac2-fcb7-08de4c7788c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVk3ZmpjVVJpMENTaVlRZVoxSjBnRmx3TW9tV0xTdFREQ2RtSlltNjN1M2tk?=
 =?utf-8?B?cUFGaW44MTdNWkV6QkJjK280UysxbE44cFFrenV1VmRoMlFYVjV5QnVOQWJV?=
 =?utf-8?B?VnhrMUQxZkNGRndhRVA3TFlRT2RxSzJyNEorclBUb3NodWQzRG1UT0F3U2FL?=
 =?utf-8?B?YW9CUDE1OTluTGlRa0N5VzlTOGovRisrUXFsbnFXLzl1QUhHR1RYNTlaYTBw?=
 =?utf-8?B?YXBWUXhMTnFlVGhMaE5sbzFFa2drWWpEdFNSVXFaMmFpSGcvUVp4bWRDMFdC?=
 =?utf-8?B?MTRJU3JSc3lCTFdyeEZsL0ZZM3dIbStPazFhSW9uY2FjY0QvUjNWVGNjeC9D?=
 =?utf-8?B?RkJsVnJpcXJ1K2dBRTZ4bTNjcUZXZ3ZVeGRicURhZGhKNCs5aElKUTUxU09H?=
 =?utf-8?B?eTlFVjVxQzFzbDdZWWxaR20vcWFHdExNVzVmd1ZmUXNLWVhMZytkUzhvRXFB?=
 =?utf-8?B?L01ZNUY1NzlGNHM0Tk91N0pGMmRyUTZMbXFlNXBYNDhha0ZaRW9tNU96OWJJ?=
 =?utf-8?B?cFNiM1d6MncvV21JM3hDdnRuelZ1ZVFPQzNuNFE5aTdhaHFRd05XZXd3VVRW?=
 =?utf-8?B?QjFKWi9GT3pRdENzNmxTbkxwREMvSnRJWjZYWk16NUJlWkU0ZlFWeXVYRzYy?=
 =?utf-8?B?dlVkMkh4MzNIU0lQRUkya2U4MUZYdzU0NGVRQ1EwYjgzcStFNmNjdjJpR1Zi?=
 =?utf-8?B?WGxJSytDU0pvMlRUTkRVZ04weTgxR3AwUkpHRnpSWlFncUFTVklZWDRxaTVo?=
 =?utf-8?B?WkxuSUllT21QK3VZb1N5M05weEhDazY2MTRlV3I3Z0lPTkdyeEtROGI1QThv?=
 =?utf-8?B?ZnNibTBYZ1FNeGgxNG1oenVZb1I0SlYyZUhpSkhGeWlWR3JiVkVQdG9hMU1F?=
 =?utf-8?B?bUFnNjFZamNLZk9HVjdZa3c1RjVCcE9tbElaaENSRC9pN1pIMUltRlZnVUJV?=
 =?utf-8?B?bmlPUVpncFlJN3NqekVydEE0RnI5MUkvTU5hdGs3bDJQUkxTQUR2VjQ3blVC?=
 =?utf-8?B?STFCUGZGaGxSNzRSc29zUllNc0ozYzYxZ3pnY0p0ZmczMXdEbDFXbk5SVXVW?=
 =?utf-8?B?R0hYTjJKYlkrTWNkcXhQYlI4M3puMFNwbEVPNElGTk1ldFZlSlgycjZKWVJF?=
 =?utf-8?B?M2QzcElGL3dROGoxN1o2YURvbUtuSTlSTzF2bm5Dbm5XSVNmOUxUd0JnZ3VY?=
 =?utf-8?B?RmIzemFXTlp0UFdJcjJmV2IvS2owVGhOTEFDZUI1ajBhdmVhTlBtaENXVWd3?=
 =?utf-8?B?QUQ3TVJtWXF1T2R6RENPYXhmZXJGU1ZxeTJZYXNvaW9MMXRleXlKRTQyVDNZ?=
 =?utf-8?B?d3JHTUtkSnJRb3hzaDJTZ1R2Q2dOL3BFNmEzWUgxVG0vNFNQYlcxbjZIZ1Nx?=
 =?utf-8?B?clk4TjhIVjFQUjlDZFZvelNJalIrL1lhWUR6MEtZOUxiWU1kL2xJTzJidUFM?=
 =?utf-8?B?aVpXMll0UU4zeTVwZ3JxS1NLWDNFV3ZJWkRzNzFMU2xWYk9vSERWTFFsNE1x?=
 =?utf-8?B?RTd4Skt4aEpFNWZkRHEvOEozODBSK2lSVFNNNnlHU015UlllYzJWak9tSmUr?=
 =?utf-8?B?bmZ5QjZNSFA1c0hlV3RSNHRlQytCNkRhS2Z3T0Vpd3crVG11YzZYeUdrSlUv?=
 =?utf-8?B?dEwvWHhab05UeVBHK2Q4SFVrNUlOWTBXYXo2WkE4Uk9lZFRNNzVCNzNybDVl?=
 =?utf-8?B?VkI5YkZHVlVQTGx1VUR0ZTZ6UVpUYXZjTUYzcTE5MTdsTzJ5U2dzbVY5UUlK?=
 =?utf-8?B?S3FLKzlqM1pzb1dWOC9UaFlsenFxMEpOS0kvTHQrbXhYNmIxcjVHbnpHek9u?=
 =?utf-8?B?MHQ5VkNySnpwMTFiQmV0ZThWczIzWWRkTUxCQVJPMXRTdzVhWkRHSWZOcFIw?=
 =?utf-8?B?dE1NYzdWTEMvVmJsUE1FbnRMWDVaTDhrMjV2bWlqR0NJQW40SENUTkk2Q1lh?=
 =?utf-8?B?L1Y0K0p1SURXdW9iRm1mM0hDakJ3c1FDT2VORXpteFZZNmwxazFOeVExWjhp?=
 =?utf-8?B?cTBHR0x5UGd6QklEc001czMwa1N2V3ZZQ2FGY3lBSC9HVzA2R3pEQ1dSbGxX?=
 =?utf-8?B?T242R3NPeGdIS3U1NTR3VXBVRktXeGdNdmRQWkxPTURURENxQzlvZDZxa1dz?=
 =?utf-8?Q?ySwY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:29:01.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78467549-a857-4ac2-fcb7-08de4c7788c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
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


On 1/5/26 07:27, Ilpo Järvinen wrote:
> On Fri, 12 Dec 2025, Lizhi Hou wrote:
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
> Generally, we don't want to shadow error codes like this so please save it
> from is_npu_metrics_supported() and do return ret;
Sure.
>
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
> To confirm, so only this field is currently going to be used?

Yes. Only this field will be used for now.


Lizhi

>
> --
>   i.
>
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
