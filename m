Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB67CE5F9C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 06:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CC810E07A;
	Mon, 29 Dec 2025 05:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kYPBSpQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012053.outbound.protection.outlook.com
 [40.107.200.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599510E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 05:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgBF36UULMDwHAva3G5QZ8eEsEIHHGQyHC62kRknSY7eS+L4hbVW7A3sHYLRPUbZRuZ7XbDowf41LjuqyASs9F3PbHa8QPUweBijhLdFqcAtIuexYPMropDERD/0a+LA2B+5FXMPlT8FvJciivKZHQ6Eh7BetILDAoTBHyEf+mwx6kZ9vgNCtPIrBP2TMRXLd9J1i8bfDKqeEsheeWau4ZnZEMjsPHu6veS4MwqJp0etH27ASZNsZvB64un9ATom8FA6bKa3o/QRhpkRP/LegWmmIpBeJ8GLc1OmwHIzYflJ/eCftZe6gJ1I+Rv5Vr7NSTNgr4dv4I6DF4Blh9TVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nb5y8h3ddxfoD8fYner6f5r8Hnvf7scFdpWZ89l/KbM=;
 b=U3rePoaWnGg0VnZBZoYUtmYFt1lxfM2A2qfGFDhA+IN/CEnaT1879ct7nxjMkZOsNYjTLbqTR5P6suYiQsLBmRjJPhKyEEYvB1q7trLb+KiKf+OEXYuZPPhNdd+dJGR/UUAThW4T95VChR2bhjS0vXgt0q+3qImx6tuPEvivgOEfkCjL+sZNkFzkped6lKuoBv0BEEoI+2xju1qm5mhysFYz/cKoH+/fvnZkgzt5fhglVCmc3RFtdlOQX0Pj7fpD4hAQK3j94JHIcseVuuSIWsr6JKuNmIMSZu7ljwgnJhlm7mKP0fh0veYPg7zD7N5x3diFavMC7hjjUnGxJeZklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb5y8h3ddxfoD8fYner6f5r8Hnvf7scFdpWZ89l/KbM=;
 b=kYPBSpQy/xC1tL2Ywd4p9kcrh9HungZZq52IglFUjSm+7EZ9fex5IJP6c58GhhZL3YXyW2KD+093LaHnA04LBd2eWChUzWI8LoEwoIyLHfNe5H2qAG3/Cl8lmH1ThaRTOLl2RNf/MRjZL6GZnkAbRE0NJ78eKolKGdcj+GayAeY=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by DS0PR10MB7936.namprd10.prod.outlook.com (2603:10b6:8:1b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 05:48:52 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::1e) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 05:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 05:48:50 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 28 Dec
 2025 23:48:45 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 28 Dec
 2025 23:48:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 28 Dec 2025 23:48:45 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BT5me0o2918603;
 Sun, 28 Dec 2025 23:48:41 -0600
Message-ID: <d0e9f90b-61f7-43b7-b54c-b9548692911f@ti.com>
Date: Mon, 29 Dec 2025 11:18:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/tidss: Power up attached PM domains on probe
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <jyri.sarha@iki.fi>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
References: <20251125165942.2586341-1-s-jain1@ti.com>
 <20251125165942.2586341-3-s-jain1@ti.com>
 <b91b00db-b3f1-418a-a686-b417b290eb4b@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <b91b00db-b3f1-418a-a686-b417b290eb4b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|DS0PR10MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d54d9d-b997-4856-5294-08de469df18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFo3bEErMVFzbnRrRFBRbFREVXlsR0RlcTlNS0FtaUtycW1ERVlpZUJjQVBZ?=
 =?utf-8?B?dkZuVXdpRGtRamdYQlFVYXpWTDBsV05EYWxZVFRKTVpnOStqOERXM0ZxNVJ3?=
 =?utf-8?B?WGFlcTVYNzE1TVdUWDNldzR3QjkyazBFVHh0M01OL3RMQW9HMHdlaW50Vlll?=
 =?utf-8?B?eDlTemVSZ2dueGZkdHMrc2tlQW1Bbnc1QXdjTFQ2UkM1cmllWUtEczlrQ2xi?=
 =?utf-8?B?eVNlRmw5V1lGUlUwS2I3dDYvRFBXY0JZQnRFTnB0TGhMS3M1Y0tCQ0VyMW0x?=
 =?utf-8?B?dHBGdnhkR1p6VGEzUnVIY3kvODNXZE9Mc0QxQmdwYnFWQW81M2lONStQTXY5?=
 =?utf-8?B?MVJPTS9WYk1zaytodXdPMG43d2ZoTDFGQVF4ZGZ0RGlUSlJhVDJpV2tzeUdG?=
 =?utf-8?B?UDFNV0ErRnhJNUJCcC81T1pGWkdpQ3J2dFFPZHU1T0lZQ1hJTGJ5eUlqRXZM?=
 =?utf-8?B?Umx2aWNMbmZ3TThxc2pBT29oWnZUamhRNVNUNTZyemV3Smh2QkxqaHNSYmlu?=
 =?utf-8?B?YmFHTXN2dlpFWFNHVmRTVFkxN2gxSEt5MmNNem5XSjhUeHVHdzdGV25aNU5w?=
 =?utf-8?B?SStMSDhYMzErS09TTUpDdmFFcVhNS3d4WktqaW5TNXFRWFF4TDQ5TmZCblly?=
 =?utf-8?B?ajg3cUJXYk5MbHZ5anB6Q2FpSGwycGVwQ1l1UTZMZWhrQzJ2K2tMN2I0aE56?=
 =?utf-8?B?NWw5RWEyYjBtQkJDQUdmMENDandQalVLTXZNYjgwTjRoZCtCbEZMQ3ZLcEdF?=
 =?utf-8?B?aVRNWXoyV1ZJNDFBc0dDSWYyL1ltWkFRSGFpblBWRzFtNFk2U0txaTFmSW9H?=
 =?utf-8?B?d1cvY29Kc3VlVWp4LzJyV3lVdjlTNElJSlhCcWxjSGdtWTBqVHZyTnk2cEZ0?=
 =?utf-8?B?cWlHSXBUWnBxNGF1WEFwQlA5aVJ1UWo2azNMeUdIN1pCSUVMWWhWK3krRVRK?=
 =?utf-8?B?NlNmOG1mSDlHMlpsYmxlenZCa0dmSE1mSzFOUGRZZ0Y0V2FOUkphNjZ6dUMw?=
 =?utf-8?B?N1lyQ0VmNld0WGdXRHBFdGhFTkR1ZndSY0xBa0hCQUd6U3BnYlo0RTJUSWla?=
 =?utf-8?B?eHRTK2ZmVDhKMGtScWNhcUR3dnVPbkxBU1N3bzdDMlBsOFF0MmdGVGtNSzdF?=
 =?utf-8?B?NEhjdEp1U0dMRFR2VGpxTHFpQ0RYOW8rYTlqdHF5aXVwd2FpcHZvMmg0Vk5q?=
 =?utf-8?B?T2NQeHplNjY2R1JTNmpzQTA0dWxTUVZQVkxDWmo4UEd3NVlJSmx4WHRvN2E0?=
 =?utf-8?B?UXcxNnJ1QjNMejNwTm9vUXpVeTdlRkZCOUNQNU9FeXc3NjZNVHMwcmN2bHlK?=
 =?utf-8?B?KzdmNlQ2U1BwVTRVbllieTQ5czMyTGlzeGN1d0M4Q2N3VGswRURyeTVzRjdM?=
 =?utf-8?B?ZDJPY3EzMDRqemlPb0R0UVorVGI0Z2NCc1AxcnRRMmU4OXVrY1A5cS9lNGVp?=
 =?utf-8?B?aS9sU3VyaWFJdDlUMVZCUEJHQTlTOFM4QitYYzltaC83VmN3c20vZ2YvZm4r?=
 =?utf-8?B?TVRhckQwNVk4b0hZTnlxWHBNNzZpblNoMk9nejd3Nk9yZFB4N0lwNDAwZEw4?=
 =?utf-8?B?c2tmLytsSFZtMERvRmhGWk1oYmRzRU8wYlQrVmllaXF4bWVvRHR1QlF0ZXgv?=
 =?utf-8?B?ckoreXgxMUhFTk02aC9lVi82RXJPbXVRNXhwSUc0VTRKQkpGelU2bnZ3RGFx?=
 =?utf-8?B?bGk0NC9PcGZ5T1hSNEtpaVl1Uldpck5wNW5CbHRRQ1hhaHd2cG9xdDhkdmxi?=
 =?utf-8?B?aGhOVWlGTSt5Sm5IZ2xMMmtkU3FoYkJranU5YUlUdm43OVdOQUlGbXJmaVZG?=
 =?utf-8?B?cmtIWnh3UlVuOEVQaGsyRTRNSW9hSUpvZUljZ1VqdFE0UjVpR2N1UjF1VFgv?=
 =?utf-8?B?dy9wS1NZdVlJeUUvUFdRTlJ3VExSWHdRY2x6MHJHUFVKZXZSY0FkN1I1M2Jo?=
 =?utf-8?B?REQ2VHpDNVN4VVQzZlZCMEVZT0YrVXhxb0ZGV1kxbXcxcFZBL0UvS0ZuUUZ3?=
 =?utf-8?B?UUsxMHV2aXVrOXN2NDJ0dEh5ZVNvdVhLeU1wRzl3Y2ppYk83cHJwY0l5T1F1?=
 =?utf-8?B?c3JYcVVQbEhxZmFiUEtpaThyc1phQ1gzVEV6VmxiNTIrU1drMEhxVkEzYU00?=
 =?utf-8?Q?omJ0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 05:48:50.8540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d54d9d-b997-4856-5294-08de469df18f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7936
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
Thanks for the feedback.

On 12/1/25 18:10, Tomi Valkeinen wrote:
> Hi,
> 
> On 25/11/2025 18:59, Swamil Jain wrote:
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
>>   drivers/gpu/drm/tidss/tidss_drv.c | 88 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
>>   2 files changed, 89 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index 1c8cc18bc53c..50158281715f 100644
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
>> @@ -107,6 +108,72 @@ static const struct drm_driver tidss_driver = {
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
>> +		if (tidss->pd_link[i] && !IS_ERR(tidss->pd_link[i]))
>> +			device_link_del(tidss->pd_link[i]);
>> +		if (tidss->pd_dev[i] && !IS_ERR(tidss->pd_dev[i]))
>> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
> 
> There's IS_ERR_OR_NULL()

Ack, will replace with IS_ERR_OR_NULL.

> 
>> +		tidss->pd_dev[i] = NULL;
>> +		tidss->pd_link[i] = NULL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
>> +{
>> +	struct device *dev = tidss->dev;
>> +	int i;
>> +	int ret;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct device_node *np = pdev->dev.of_node;
>> +
>> +	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
>> +							"#power-domain-cells");
>> +	if (tidss->num_domains <= 1) {
>> +		dev_dbg(dev, "One or less power domains, no need to do attach domains\n");
> 
> I don't think this print is needed. It would be printed on almost all
> platforms with DSS.

Yeah, true, will remove this in the next version.

> 
>> +		return 0;
>> +	}
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
>> @@ -129,15 +196,24 @@ static int tidss_probe(struct platform_device *pdev)
>>   
>>   	spin_lock_init(&tidss->irq_lock);
>>   
>> +	/* powering up associated OLDI domains */
> 
> I think the function name is self-explanatory, no comment needed.

Will remove the comment.

> 
>> +	ret = tidss_attach_pm_domains(tidss);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to attach power domains %d\n", ret);
>> +		goto err_detach_pm_domains;
> 
> This is not correct. If tidss_attach_pm_domains() fails, it should do
> its own cleanup, thus there's no need to goto err_detach_pm_domains.
>

Ok, will make tidss_attach_pm_domains do it's own cleanup.


>> +	}
>> +
>>   	ret = dispc_init(tidss);
>>   	if (ret) {
>>   		dev_err(dev, "failed to initialize dispc: %d\n", ret);
>> -		return ret;
>> +		goto err_detach_pm_domains;
>>   	}
>>   
>>   	ret = tidss_oldi_init(tidss);
>> -	if (ret)
>> -		return dev_err_probe(dev, ret, "failed to init OLDI\n");
>> +	if (ret) {
>> +		dev_dbg(dev, "failed to init OLDI: %d\n", ret);
>> +		goto err_oldi_deinit;
> 
> Same here, this is just not correct. Please go through the error
> handling paths with your patch. This also changes dev_err_probe() to
> dev_dbg().

Sure.

> 
>> +	}
>>   
>>   	pm_runtime_enable(dev);
>>   
>> @@ -203,8 +279,12 @@ static int tidss_probe(struct platform_device *pdev)
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
>> @@ -232,6 +312,8 @@ static void tidss_remove(struct platform_device *pdev)
>>   	/* devm allocated dispc goes away with the dev so mark it NULL */
>>   	dispc_remove(tidss);
>>   
>> +	tidss_detach_pm_domains(tidss);
>> +
>>   	dev_dbg(dev, "%s done\n", __func__);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>> index e1c1f41d8b4b..6eb17cb32043 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -41,6 +41,10 @@ struct tidss_device {
>>   	/* protects the irq masks field and irqenable/irqstatus registers */
>>   	spinlock_t irq_lock;
>>   	dispc_irq_t irq_mask;	/* enabled irqs */
>> +
>> +	int num_domains; /* Handle attached PM domains */
> 
> What does the comment mean?

The number of power domains that needs to be handled, will rephrase it
to make it more understandable.

> 
>   Tomi
> 
>> +	struct device **pd_dev;
>> +	struct device_link **pd_link;
>>   };
>>   
>>   #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> 

