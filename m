Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEEFD28420
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 20:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5446A10E097;
	Thu, 15 Jan 2026 19:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="B5jWeh3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazhn15011022.outbound.protection.outlook.com [52.102.139.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C32F10E097
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhfd7zzYG7afZduw6we4ly+z+q13Jau73HFBJEcWgJttHMfFe1d0qwc7FXfHJFrjWxyBtCnsR7ZjilmB3+EYYuDwUghjBbhH5QvAv45963qOH8v/IoK/ICrQuL9wZmX/e7EbhB/TjomiRLVVZZz3kPeR6+uJGsJJGZV3EHYyxNAcblw9AvP73S0ATawSfs1zsjQ0FJxmbUWzivfmcrKR/C1GTRPgy3nTUXztIBjn9BSewT2le94+zWVjEdhp7m5POs+XGyYkg2iJUo20hMHrimO9NT/KGPIWm6dk9BJ2oiwANFZSpmpFiUgoTdq24A3/WVMa8hDvxzKzmGwe7ffprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJgffSRR9ebtb452Ia+CI0JnjCR6ZDsQ3XelQzl2cjM=;
 b=osLQSkB2t/TzlC7HkT6QfUhzigl37u5qq18kerY3hZ7e81K17R1Z+2EsnegOqZRSs+Hgkl2I+kXIDZcJSsUiPMRyDL9/7lGeKykyS2lzAl7JXB9qvQysRuUj8Q7tV6kN041V3w6PD7ZCQeeSoHzYtZchIeL5GoX+//1Jdwh6Bc2KNCELOcfGw0xZhg40m1Nw/hShMgrFZmzILRE37usCxpc5Rq+VuckJFbD/SrngM5NBMT/lF7maMb4OJEb/XNw1pRHO/WZd41hBXxbYeWN2+cPhDWzrdu+6wl93Ezxkz+tDFAhKzy0zVxTaXo0Lk1Z0FTv/KvdCBn5DKK5Rc9ZECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJgffSRR9ebtb452Ia+CI0JnjCR6ZDsQ3XelQzl2cjM=;
 b=B5jWeh3crouN3eDwUZFnHmZpnz6TGj2HJ2M1ATQzxmNdCwfzjle3DWk8+Pi/O65DOzpvaz2h+5DDPJxgxu/ZmIDcCTi7WA2DkTWVOgIsfSUU15kSWio5gKIXUkU8AU4PQvZhq91Bctne+Ynmg2qJwvA3+774OLoFhdCetzIZQr4=
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by BN0PR10MB5112.namprd10.prod.outlook.com (2603:10b6:408:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 19:55:46 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a6) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 19:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 19:55:45 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 13:55:43 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 13:55:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 13:55:42 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FJtbsn1956073;
 Thu, 15 Jan 2026 13:55:37 -0600
Message-ID: <cf366804-55c0-4236-a7e8-c7e7ff50747b@ti.com>
Date: Fri, 16 Jan 2026 01:25:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/tidss: Power up attached PM domains on probe
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <jyri.sarha@iki.fi>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
References: <20260107174525.1702585-1-s-jain1@ti.com>
 <20260107174525.1702585-3-s-jain1@ti.com>
 <ae2b549f-1231-405b-ac7d-cc3df8a1dbef@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <ae2b549f-1231-405b-ac7d-cc3df8a1dbef@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|BN0PR10MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: b879ec6e-fe8b-4696-da0b-08de54701256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|34020700016|7416014|82310400026|36860700013|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXBVZnFBMFJMUm1ZQ1NJRHF5dWFCd0NCK0hZbnlERnc5VlliamJvajZVR2lY?=
 =?utf-8?B?eENTQXQ0T3F6WWc3dlFjamxXWHV5NjQ2cVVQVzFhRml0SDFKbXBXalJpeW1q?=
 =?utf-8?B?MHdIZ3lkYnBsbXI1TzZYNHhNUFBuVHJ2UUxObE81aEhBMnh6czAyTjVSci9E?=
 =?utf-8?B?V0cyVUZ2YWtqOHJXYmtCK29rVkNzaHpKcWxsTmpNVEJsaGpuQTFCT0FaYnox?=
 =?utf-8?B?amlyN2tHZmhXczU1UlhUelEwUCtIWGRRV0F4RTZnSmsrQ3hxb3g3ZGJ5dGxp?=
 =?utf-8?B?Zy8zaGdxaG1vTStudElkdEpUZ0wyN3AwZHUvN0pmc0RkZklyK3ZNTjV0QlpX?=
 =?utf-8?B?WDZFd0hqU0x5OVZySkdVQ1FpK0dYSkd0a25YS3YxMmErc1c2dlhSenZ2V0dr?=
 =?utf-8?B?TDNIaXErdGEwZE1pZHdBT1VuYkFCR1laK1dEekF5dWhNdlN3MEQ4MzJ5eUZx?=
 =?utf-8?B?RDVQRjFhNEF5WElFUEtJeksrVjhTNXo4RWZmS0Y2NUJtb2pzdlRuZ2tJa2c3?=
 =?utf-8?B?cDk0bWhBcGJndU8wb1VQSWZaK3N4b1ZxQlJrZ09FUkZNNlREWU4wb2QwVTdZ?=
 =?utf-8?B?aW4xSGI0WTlXOEc2SUFQQ05MbERSelZRcXE3ZG1odnlvS1lxdHYyMmZUbGtx?=
 =?utf-8?B?bUIyVkoxZ3lWUmNLVzRWUTU4bzl0am5nOWZVcFQ5a3kyd25RYmpyNUJKamk4?=
 =?utf-8?B?NlV1VDEzd1VrYzN1alJtWjVqbUZPV0RDa05xSkVEQkhjZlpoak9ZNys5MXNj?=
 =?utf-8?B?QzlIbDNwdWdwTjM0a29lYUFlY2dDcWkyMXBoakFWS2liSjFIVUxkV3pPS21U?=
 =?utf-8?B?VkFuWndCSjhZVEQ3NklYOTdPOFRkenZVMHhTWDdHL21rcmo1YVFCMkNqc0Jr?=
 =?utf-8?B?T1VUNUwrcFdDbWdua3NQcEdyd3A3UFlvbytQeHlvT2NFY2dDTHJVOXF6U3dH?=
 =?utf-8?B?QUFMUTMrK0lkcDI0dzVYZk1NdUN4QndMMW5aY0pMSkU3dEhCNExyL0xsRWo0?=
 =?utf-8?B?SVhNbHhFV1ZNNmh3NWh6ZER4dUFJdEdvS053NHEzalBKL1dFU3FTWUEySXRp?=
 =?utf-8?B?dmxyT2orSkF6SFZxMHVBbmEveHBtZ0F1bDdmdVFQRll1OUJGZEZqVzZaek1q?=
 =?utf-8?B?YkJMUFRzUng3OEU0YWgzakhGMlJGajJDeEdrVmN6L1A4d29iMlRxSXhHN0xn?=
 =?utf-8?B?ZnlsQjJFSXRKZDk0czhoYnA1R3QxdUduTElHa1RuOEYreUxsNzlZVXN0c0hw?=
 =?utf-8?B?UnM4a1ZFa29RZytJVkcvb29XcDBpRE9SWFhCSDlhTE8xa0hCMk1mdW1xSkRh?=
 =?utf-8?B?QlNzSEdweDJNKzM1MUIzSVo1MjlpTWd1OEdja3N1Z1puUm9uc29tYzJlVXk0?=
 =?utf-8?B?WmxIaDVVTnh4OEt2OGs2QWYrZWVqdklpenZLNnMwZGh0a1VTajhmSWVkL3A2?=
 =?utf-8?B?ZkpRNnJ0eHd3K1pUZVNwUjcweXU1cUxMR1RNSmN3SVRvMkhLZ042b3BNY2k5?=
 =?utf-8?B?N29NN29qUTA1UzhaemtsQ2lMaXN5R2lESWxIMUhKT3NNSDUvclh6V1hmVVFv?=
 =?utf-8?B?dEVZbmVlLzBoWVFNcjhCd1FTZXBVSGNFaWx0MTBKYUs3MDRXa2ZVdHFxTUZP?=
 =?utf-8?B?bmoxdkI4Q2EvdTlRZlA5OFJaYkhjMHg4VnlsVm43U3JUeFZDa1h4YmFlOGxX?=
 =?utf-8?B?cW9TNEpQT3BGQytueU9wblg0S3dEeGJ3SjJQc242OXh5dnArZjFFbFdqK2N2?=
 =?utf-8?B?QmYxVzlicVJlZVA0SWcraFRSUFRHT0dLUnNsaFpWbGNzMTlveGt6Skt1VzU0?=
 =?utf-8?B?R2ZhZjJuOFQ5NmwyL0N3djhYdnJxcDg0UlhKeVRNalNKVmlZRW43SVk1dDFG?=
 =?utf-8?B?MCtKbisyWDhMNVk0WHNqa2JrRFRGMEhLWjZqeVZRdVBlSEFoVDV0Y3VHdUZs?=
 =?utf-8?B?MEFGdGtxVUM5TUwvUjRCdlpmcXp3ZUhDWDBGcnhHU3ZmTlFQdUpTellZcTY2?=
 =?utf-8?B?RXBYNVlrcDBpeDdNQWI2U3RqNnJ4T2l3WTVOclBIUFFJZE1RbEkvdmFEWXlF?=
 =?utf-8?B?MTI3S1JaWE9OR2txR1pZWFBjMHlZVjBiTHJEVlRVL0VpalpiaGROZ1FGTjI2?=
 =?utf-8?B?VHhZWWU2N200RGxIUWdoUmtsVU5wT2RjRFBvMU0rcmwyc3lvbHVKYURKQnR1?=
 =?utf-8?B?bWdsWkhzY05hclNsRE51MkwxeEZwMDF0cmpaR08rWjR4dmxwKzhleWM1bmh6?=
 =?utf-8?B?VFVJZ1lhY3hxclFnTU9QeUxuL1ZRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(34020700016)(7416014)(82310400026)(36860700013)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:55:45.2599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b879ec6e-fe8b-4696-da0b-08de54701256
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5112
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

Hi Tomi,

On 1/9/26 19:48, Tomi Valkeinen wrote:
> Hi,
> 
> On 07/01/2026 19:45, Swamil Jain wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> Some SoC's such as AM62P have dedicated power domains
>> for OLDI which need to be powered on separately along
>> with display controller.
>>
>> So during driver probe, power up all attached PM domains
>> enumerated in devicetree node for DSS.
>>
>> This also prepares base to add display support for AM62P.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> [j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_drv.c | 83 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
>>   2 files changed, 83 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index 1c8cc18bc53c..33a10fba4325 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/of.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/pm_domain.h>
>>   #include <linux/aperture.h>
>>   
>>   #include <drm/clients/drm_client_setup.h>
>> @@ -107,6 +108,68 @@ static const struct drm_driver tidss_driver = {
>>   	.minor			= 0,
>>   };
>>   
>> +static int tidss_detach_pm_domains(struct tidss_device *tidss)
>> +{
>> +	int i;
>> +
>> +	if (tidss->num_domains <= 1)
>> +		return 0;
>> +
>> +	for (i = 0; i < tidss->num_domains; i++) {
>> +		if (!IS_ERR_OR_NULL(tidss->pd_link[i]))
>> +			device_link_del(tidss->pd_link[i]);
>> +		if (!IS_ERR_OR_NULL(tidss->pd_dev[i]))
>> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
>> +		tidss->pd_dev[i] = NULL;
>> +		tidss->pd_link[i] = NULL;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> This should be void, especially as you don't even check the return value
> below.

Sure, will make it void in v4.

> 
>> +
>> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
>> +{
>> +	struct device *dev = tidss->dev;
>> +	int i;
>> +	int ret;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct device_node *np = pdev->dev.of_node;
> 
> You should try to order these lines from longest to the shortest (not
> possible for every line).

Acked. But, here we are using pdev, so, can't re-order here.

> 
>> +
>> +	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
>> +							"#power-domain-cells");
>> +
>> +	tidss->pd_dev = devm_kmalloc_array(dev, tidss->num_domains,
>> +					   sizeof(*tidss->pd_dev), GFP_KERNEL);
>> +	if (!tidss->pd_dev)
>> +		return -ENOMEM;
>> +
>> +	tidss->pd_link = devm_kmalloc_array(dev, tidss->num_domains,
>> +					    sizeof(*tidss->pd_link), GFP_KERNEL);
>> +	if (!tidss->pd_link)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < tidss->num_domains; i++) {
>> +		tidss->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (IS_ERR(tidss->pd_dev[i])) {
>> +			ret = PTR_ERR(tidss->pd_dev[i]);
>> +			goto fail;
>> +		}
>> +
>> +		tidss->pd_link[i] = device_link_add(dev, tidss->pd_dev[i],
>> +						    DL_FLAG_STATELESS |
>> +						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
>> +		if (!tidss->pd_link[i]) {
>> +			ret = -EINVAL;
>> +			goto fail;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +fail:
>> +	tidss_detach_pm_domains(tidss);
>> +	return ret;
>> +}
>> +
>>   static int tidss_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -129,15 +192,21 @@ static int tidss_probe(struct platform_device *pdev)
>>   
>>   	spin_lock_init(&tidss->irq_lock);
>>   
>> +	ret = tidss_attach_pm_domains(tidss);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to attach power domains\n");
>> +
>>   	ret = dispc_init(tidss);
>>   	if (ret) {
>> -		dev_err(dev, "failed to initialize dispc: %d\n", ret);
>> -		return ret;
>> +		dev_err_probe(dev, ret, "failed to initialize dispc\n");
>> +		goto err_detach_pm_domains;
>>   	}
>>   
>>   	ret = tidss_oldi_init(tidss);
>> -	if (ret)
>> -		return dev_err_probe(dev, ret, "failed to init OLDI\n");
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to init OLDI\n");
>> +		goto err_oldi_deinit;
> 
> This doesn't look right.
> 

Will use err_detach_pm_domains in v4 and will take oldi_deinit() issue 
separately as tidss_oldi_init() is not doing own cleanup if it fails.

Regards,
Swamil.

>   Tomi
> 
> 
>> +	}
>>   
>>   	pm_runtime_enable(dev);
>>   
>> @@ -203,8 +272,12 @@ static int tidss_probe(struct platform_device *pdev)
>>   	pm_runtime_dont_use_autosuspend(dev);
>>   	pm_runtime_disable(dev);
>>   
>> +err_oldi_deinit:
>>   	tidss_oldi_deinit(tidss);
>>   
>> +err_detach_pm_domains:
>> +	tidss_detach_pm_domains(tidss);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -232,6 +305,8 @@ static void tidss_remove(struct platform_device *pdev)
>>   	/* devm allocated dispc goes away with the dev so mark it NULL */
>>   	dispc_remove(tidss);
>>   
>> +	tidss_detach_pm_domains(tidss);
>> +
>>   	dev_dbg(dev, "%s done\n", __func__);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>> index e1c1f41d8b4b..6625b989b815 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -41,6 +41,10 @@ struct tidss_device {
>>   	/* protects the irq masks field and irqenable/irqstatus registers */
>>   	spinlock_t irq_lock;
>>   	dispc_irq_t irq_mask;	/* enabled irqs */
>> +
>> +	int num_domains; /* Count of PM domains to be handled */
>> +	struct device **pd_dev;
>> +	struct device_link **pd_link;
>>   };
>>   
>>   #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> 

