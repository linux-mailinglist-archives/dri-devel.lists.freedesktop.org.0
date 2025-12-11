Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC9CB6F90
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42810E8A1;
	Thu, 11 Dec 2025 19:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WlM9VpZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBDD10E893
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAd6nXCL724mpD5hvJv8HZ3K7jUUL3Qjpsi0HhLlLk/IJncqfnR/ExZvdQ4ihwFS/HgKSsMNRMnkyhDdmMnINXiCrlICl6JKp5e/iG+mw3PhIoqz6txQ2vTCOzOvXk1rYyGsJERhnt7nclW4mZaI++RRoFDjlUvmMy4q1CB5DkwXbBrZNyJAh5C/OqqP1JvXDFLLAv7wVl571PI5v1WyGG0dPq6wU6i31L04PG8SjzHc3lcs4EbKQuLiQMSL9E4Bg3CIB468i9rCZvIow4baFlduFWvuU6R0mp6CnnrECtFMIJw+GYtavmmeEqLQaJVcTSMYxc+9KR2Agz0mltsNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8+HqM3uO9OJfGibVYkstgJI07FEtbw7giIxY36raZc=;
 b=ZmyXwb0WNSriw1k2yfSaCIGD0kEb1Rj7jrrvOWpmRD2GL2bh6PC3/xJ3OOha03d5lbwP3ymISFEthYxdMLNhShzWSSsMe6fIKV6ul5nicDMVc+qrhpTm1+UOVU/GOTCDrl+PnNP9EWLIDqxaclirqMYI3/oTn/W9xFNADEPV7ycGq6GPOc5vG0FwZJXrBIrtaQh8FIS+RO1pexhOB5VBiPVXDOHUvGxqOJLieDhaL07ZZ+jyANwGhS9bjKIiChGo2ADjDCgjXeH5CdnIaekv+0gjaqb8zyCJlethch6WGID/TklZS5ZuSd1nofF24guhz7DZA9KoxVr0S3qRbfpGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8+HqM3uO9OJfGibVYkstgJI07FEtbw7giIxY36raZc=;
 b=WlM9VpZtMFzkCPygcfjgNaKT9CO0j09W5gG/wm9NGPYjbz4Vt3OOtOV8vXcfAd6Pl4Lv9HcAicwhNNH4z3bVhZTub75/n5VrA8M2/Uz/XM4hn8u8FQ6RJ8EDzh4IZFmaOOSm+Gtk9q2u9zKS5cW0VGpWKeyNjAvStj1eSQDwDmc=
Received: from BYAPR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:74::31)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 19:07:00 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:74:cafe::96) by BYAPR05CA0054.outlook.office365.com
 (2603:10b6:a03:74::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 19:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 19:07:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 13:06:59 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 11:06:59 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 11:06:58 -0800
Message-ID: <88a18f23-04d9-db8c-9c2c-8bf36afa8d63@amd.com>
Date: Thu, 11 Dec 2025 11:06:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>, LKML
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <Shyam-sundar.S-k@amd.com>,
 <VinitKumar.Shukla@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-3-lizhi.hou@amd.com>
 <9dd39a22-608b-12a8-ffa1-3937be62f47d@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <9dd39a22-608b-12a8-ffa1-3937be62f47d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 65324ebd-cbc8-4be4-c7a6-08de38e87655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|30052699003|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjZsRStXZjh3YkRwZXFQV2EzaUJIQlBpTm5uZXJQOWNkNnBQb2oycVgvYTdw?=
 =?utf-8?B?cGdKTnhSZkNGLzdsRCtMdG9WdTVsUVhOYmVPblJPT05aMktneHdHUnl0WnAr?=
 =?utf-8?B?S1FsemY3WXB3SDVvVldEaXB5TVNud2kwTE5TWTM5aWFWUDVzOG9FUzcrQytW?=
 =?utf-8?B?KzJNWEttazh2WW9XZ29ubGpwOEJjNDFKckpNazN6WHArZjI2a0ZqZTdLMWlr?=
 =?utf-8?B?SXBScE9vRk80LzUvSnpFUlBYQlJneHRBeGorZ2ZmV21xN1k4Y2thaHNMUm5V?=
 =?utf-8?B?amZUMVBDSTRCNWY0YnVtam5PTEtCZ0xLYlordjlvcWRqeUxYVlR5ODNMaFZx?=
 =?utf-8?B?aGg1MnRqenlVVE9EUUpwbytyTEsrWkllL095WmFIazlZK1lLR2NLWEI3M2VT?=
 =?utf-8?B?RVo1b3NQajV3RmpRbk1sd2xFVWZPcFJIVU5NYkM2emdwSklNc0huOE1IVFFU?=
 =?utf-8?B?R29wb2x4bDduRUMzanA2T3FvVURFUGRQQzJhcFgwNFZQWmphbXYvUEtBNjli?=
 =?utf-8?B?SzZ3YnJ0Y3dHTkxCT1FsL2FxaUt1SUFuZkt1dC9YeHdoNmg0TkNRUmFmTEg4?=
 =?utf-8?B?RGNmMEN2eVdzUkgwR0ZYVjBFZDMwd1JLQmZZTGhkTHREanZWS1ZHUXEzMVhr?=
 =?utf-8?B?OW14b0VjVTdSYUxrZFo0UmlpbzVXVFBaTVNGeTJBRDJGY1FtZDZrajBxdmM0?=
 =?utf-8?B?anZpejA3MEJURENpMnNEZHRDdDZMUzY3MVIveVpsYjdtWEdvaUp6N2NVang0?=
 =?utf-8?B?UGVEcTJCZnF6dUo2K29rQnRxdFdKNWdjVlFpKzRDZWxJUlFxd1VvWmpGblg3?=
 =?utf-8?B?eDNGT2hlQU9WYzRPdkVyNXBoWWFzUFA5T0xkZXVXWElROEZJOWpGdGdseGJi?=
 =?utf-8?B?L1lZQXdBWWhpekg0bmovbHVia2VTK1V6ZVVTSkNkOG00dlNzekliRGtMMHF4?=
 =?utf-8?B?UDNkRzUvYzFFVUx4anY4N1oyRDdkZ2oxbXJNb3h3M01QeUFKNE9GZWNiTTUr?=
 =?utf-8?B?SGowWHlUcXhlZnkzZUUzR0l3Q0lsSW9od3lRbHV2UkJlL01SVmx2Rmg4M05D?=
 =?utf-8?B?aERZc29GUGx2TSs3NW1UZGNNNEFnU1lXVWRsOVg5ZEhGWnFIREk4L1ZsTmV6?=
 =?utf-8?B?azFub3NrU2dZQzNJOCtHeHJpclUvcDVMZmlXcTJmaGNTMWQzbVdhcXVpa2tG?=
 =?utf-8?B?WUJLQW9NdHdCbzVQei9RNUNicDR4RjVMSGRjUDV4OEtZSXhhdWo0aG5NeFN3?=
 =?utf-8?B?dWIyT2xIblZvYmdrcytoMXo5UlBNUXNhT2RoQk5ieFZKaXl5MVZBRHFrQ0NW?=
 =?utf-8?B?RElpZDBZQUExdXpKcUZwN1M3ZVlOM0llVnJDS1ByalhqTG1SVWJxSEZJditS?=
 =?utf-8?B?N3dLTThnbExZNndPTjhCdnJrM2VGR3VHVzhDcjMrWWF6Wm0vTXhEQ0owVXN3?=
 =?utf-8?B?T3h6VlREU0xnWVU2aXgyRUtXZzhqZEYwa09HRnJTaG1va1NNNmFSa3VQL1lu?=
 =?utf-8?B?cGhlWUE3ZXlPTjgvUmloSXhYK0xxcnJyT0ZFTTVzTGVRbDVwbWwxYnN1L0lS?=
 =?utf-8?B?NzhEb2lzakJLM0hkWWIvdEY1SUZ6aXFmMU5paThzYW84NzJid1JtbWp1R0xs?=
 =?utf-8?B?bnpSQnE2MUFUbTJ3V0ltdGRxQzJWK0N1WFBlMnNUT09UcjV3dmVMak4wQStv?=
 =?utf-8?B?amR4WE5hMFpPSUV0OWR4d0JDakhudnFkM0tmeUluZ3FDWFJrSjA3VzJac1pU?=
 =?utf-8?B?dXptdlo5UzVqdjBaVWpnb2ptOUMrTGpvMjI3RlJrOFVYTjJ5R3JKcGFyd0hz?=
 =?utf-8?B?R1hxMy9iTkNiRWI2TUEwUG9qL01uVkE4SzR4Y3g3bEFJYVRrcE5OQTBaVzc1?=
 =?utf-8?B?MUZwMGNDYnhST2JNKzJ0QjE3MGx0L0FyVGdvdVRwQmVCdVo1alB5cU5tN3Bl?=
 =?utf-8?B?YklnTzBQT05wTmFnempwWm1SU0JiakJDenhGcUJILzdnRnUyM0xBSjd6ZElD?=
 =?utf-8?B?bFptYmplM29VWWhudDBOOXdDckNVMzFoWnVXeVNjbW5EZ0ZTVzRYcktTVjRz?=
 =?utf-8?B?YUIxc0dEVktGRFg5cjBrT1lPQ2dxaXp6T1o1cjdwVXo5ZjVnY3hsR2hzQzVj?=
 =?utf-8?Q?Ccrc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(30052699003)(82310400026)(1800799024)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:07:00.1309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65324ebd-cbc8-4be4-c7a6-08de38e87655
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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


On 12/11/25 10:24, Ilpo Järvinen wrote:
> On Thu, 11 Dec 2025, Lizhi Hou wrote:
>
>> The AMD PMF driver provides an interface to obtain realtime power
>> estimates for the NPU. Expose this information to userspace through a
>> new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
>> the current NPU power level.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h        | 18 +++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>> index 81a8e4137bfd..4a2c7addcd79 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/gpu_scheduler.h>
>> +#include <linux/amd-pmf-io.h>
>>   #include <linux/cleanup.h>
>>   #include <linux/errno.h>
>>   #include <linux/firmware.h>
>> @@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>>   	return ret;
>>   }
>>   
>> +static int aie2_get_sensors(struct amdxdna_client *client,
>> +			    struct amdxdna_drm_get_info *args)
>> +{
>> +	struct amdxdna_drm_query_sensor sensor = { 0 };
> = {} is enough to initialize to defaults.
Will fix.
>
>> +	int ret;
>> +
>> +	if (args->buffer_size < sizeof(sensor))
>> +		return -EINVAL;
>> +
>> +	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
>> +	if (ret)
>> +		return ret;
>> +	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
>> +	sensor.unitm = -3;
>> +	snprintf(sensor.label, sizeof(sensor.label), "Total Power");
>> +	snprintf(sensor.units, sizeof(sensor.units), "mW");
> scnprintf() x2
Will fix.
>> +
>> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
>> +		return -EFAULT;
>> +
>> +	args->buffer_size = sizeof(sensor);
>> +
>> +	return 0;
>> +}
>> +
>>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>   {
>>   	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
>> @@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>>   	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
>>   		ret = aie2_get_clock_metadata(client, args);
>>   		break;
>> +	case DRM_AMDXDNA_QUERY_SENSORS:
>> +		ret = aie2_get_sensors(client, args);
>> +		break;
>>   	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>>   		ret = aie2_get_hwctx_status(client, args);
>>   		break;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
>> index c6b5cf4ae5c4..edf6f2e00dea 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -46,6 +46,24 @@
>>   	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
>>   })
>>   
>> +#if IS_ENABLED(CONFIG_AMD_PMF)
>> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
>> +({ \
>> +	struct amd_pmf_npu_metrics _npu_metrics; \
>> +	int _ret; \
>> +	_ret = amd_pmf_get_npu_data(&_npu_metrics); \
>> +	val = _ret ? U32_MAX : _npu_metrics.field; \
> #include needed for U32_MAX.
Will fix.
>
> Unrelated to this patch, this files is also missing include for at least
> SZ_* (so likely works by chance) and types.h.
Thanks for pointing this out. I will fix it in future patch.
>
>> +	(_ret); \
>> +})
> Please try to align the backslashed to right so that they don't mix up
> with the code.
>
> Add an empty lines after variables declaration (with the backslash in
> the end obviously) so these almost looks like "normal" coding style.

Will fix.


Thanks,

Lizhi

>
>> +#else
>> +#define SENSOR_DEFAULT_npu_power	U32_MAX
>> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
>> +({ \
>> +	val = SENSOR_DEFAULT_##field; \
>> +	(-EOPNOTSUPP); \
>> +})
>> +#endif
>> +
>>   enum aie2_smu_reg_idx {
>>   	SMU_CMD_REG = 0,
>>   	SMU_ARG_REG,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 1973ab67721b..643ebd387074 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>    * 0.4: Support getting resource information
>>    * 0.5: Support getting telemetry data
>>    * 0.6: Support preemption
>> + * 0.7: Support getting power data
>>    */
>>   #define AMDXDNA_DRIVER_MAJOR		0
>> -#define AMDXDNA_DRIVER_MINOR		6
>> +#define AMDXDNA_DRIVER_MINOR		7
>>   
>>   /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later use the
>>
