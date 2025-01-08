Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFEA0659B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE36510E039;
	Wed,  8 Jan 2025 19:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eccUXFuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF110E039
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scyFT0ixLzlJ7SUnDuTCKwvd839/SQSj4hgiUJ6Abc1cONBErcj7x/9zWLxOmeD7ILtvcfz5tDtio3pXfFSBs6kuwQZwKxIPiMSmQAJaI9aZI22zQkOmPcG+jniRg+oJYGkZ5CZWdj/nFf+YT5zIeVNnbHjjhrIeb5l09paz6zBBBETWSHWhpTsOG5dFU06aFOm+BH7+caPbhqlnQEIZ+XBWWMGzy1PjW2LT43Od1YnYBAn2Vs+sTKXLJblKfBDbmXgD6uebTPDeGqFb0MLbo/nCTqi9Wnq0K+sAQnRoLWOgcl0oINYjOTWJ0phHvCb6vNYpnnoqGvxPKc6jCqk10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3E1VDIDERJKcLjsD62RmadT8fr+KUWm7+sudEbm0qw=;
 b=X2EGswVrhTp9vGpcyWDcjAd2TKd11suzvtNSUS7b59nqO2fY3LxjvNIb0bOwWuu5eBqFGvUzXU8CDyt+GI51lDUlQnIsktfCtAfaPNWBtS81wy8/Q1Gh1PPPUA9OQRgNIU/fIpVCNwA7QvxWsXXX/vBrFHXLzS7wMPjzhz3MnN0H8fUmQnI7B9YueXBxjVI/BObb+HMws5s6fR29b+0m6eB3CUg1RmvC4BnfKkpOdgjC3qFvTEeFYnA1DphIqwL8HxyRj9IDt2XokfA3Re845i+7cAyD3JjZArHRa2+2pdzD1qUYAHqnm8ZG7C9XzFBBX4vpw8q2PEDr5Ww558mgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3E1VDIDERJKcLjsD62RmadT8fr+KUWm7+sudEbm0qw=;
 b=eccUXFuTsxKN5gkVcgzCMFuGFrSyxKEZv4N1kY5FOqCOt/fXzFlUx/SddgU7obdls55VkwSGoBPuVN5vsrDLzaRsUT68RWmIKwinj1+yjon+tvKfw5kzEZil1pUF/Y4SguC/cExBz7ktNPdSku0GaMHwZ3C+fHg21uTENbSRBlc=
Received: from CY8PR12CA0069.namprd12.prod.outlook.com (2603:10b6:930:4c::14)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 19:53:17 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:930:4c:cafe::6b) by CY8PR12CA0069.outlook.office365.com
 (2603:10b6:930:4c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 19:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 19:53:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 13:53:15 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 13:53:15 -0600
Message-ID: <487e9cb5-d867-f608-1b0a-d53df5c681e0@amd.com>
Date: Wed, 8 Jan 2025 11:53:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/14] accel/ivpu: Expose NPU memory utilization info in
 sysfs
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 52014054-b971-4fea-23ca-08dd301e17db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mms5RWFQR2gwN21PU3YrMG8zTzcrM09QY1NIM2p6S3JaQmhFM3g2azdaNzJX?=
 =?utf-8?B?U0UvU3dZc1Z3N1crR2RlK05vL0JlZUd0M0lwUTAxR1BpdmZ0Nk5ZR2k0ZXpS?=
 =?utf-8?B?THdxS3JBTm1DMFgvSW9VQVltZ2xtRzl3WXV5TXdPdEh0ODJ2aWxsVVdlR3ll?=
 =?utf-8?B?UXlVenZKNEkzZDNaZ1ZpWlprREdub2hMSlVoK2ZuUkpIbXhoSUVGMkZXb25o?=
 =?utf-8?B?czdkazQzbW1qaVJHcUprOW1pbExQWEJ6UTR1K2pMK3ZNZFV5U3Q1bnIwT0Fn?=
 =?utf-8?B?MVZxMm00bXdRa2pUZCtlaEFRUk54WHJhcFBDV2lIR2Rwbk0zalVaQkFNdUVw?=
 =?utf-8?B?WFF4b3A4bS90M2I4Rmt2ZWFjU1RISyt4NGR2eTBaL2pCU2V2QUgwbXJxS3hm?=
 =?utf-8?B?WHp4SklxSGJwQlk1eit6SXMzUkVobElkK2QxbFA5SGIyakxGdkhHMjFxamk0?=
 =?utf-8?B?VDV6TzAwSGlXSEhPM05SbFVZaDJWaS9LL243MlIxQnQwQU1zRUNyaFlRZ3JD?=
 =?utf-8?B?c0NSdDRDQklBMlJheDFZQy9veSt5TndjVi96MFA4NUpDNE9jd25nNE4yYXVx?=
 =?utf-8?B?WEEwS3VaSWlWeG4rNStCRTJwdTJEbXBuT3RGNkh1QUlyZ29MRCthaDVKbEFw?=
 =?utf-8?B?NWErR3pkbU43YVcwZ1NnVnJjUDVra0lLREgyQ0NwcFpKa1lhd3BNQmV0NEFT?=
 =?utf-8?B?R2oyaVJwM1EyeDFLS1hZak5wbjdSblltRzRtNHgrS0RKV2ZKRjlLaDhUWkpO?=
 =?utf-8?B?ZFAwVXhYY29rYjBEekQzQUlmUVdycHkvYnFXdW5zM0N4OW9jamw1a0FKc2Y1?=
 =?utf-8?B?cXJtUi9lYzF1SVhySnNSQmVwNXcwWTBnbWxHcE96dlMzaGhlWjJWZElsVkNV?=
 =?utf-8?B?Z1VwY2MyNUU4a2F1QVIyYWVSVzJrZHdyMW9WbjMyOFJSVDN4bnp4T1dvazhB?=
 =?utf-8?B?aU45bU5lUWVlL25BdHVuczhqbUp5V2FmRytFVDgzaHIzSFQ5T2xHWXJDOTZX?=
 =?utf-8?B?TW5veXcwaWVNUmI2QUh2WW1NazRTMzEvVjdYa2duaXRIMjFzdVFYR0FqVndX?=
 =?utf-8?B?VjRmdWdLNkRDdEZUQWFvbjA4d0dzcVkrdFRQY0t0aVlETHNFSmgxVXl6VHN1?=
 =?utf-8?B?VEZHRTJVWlRXelh1dGtUYkNwU3ZqbzhuU0VkajhoK2RlS2hrVGxMMHlJTDRB?=
 =?utf-8?B?WlBCYmFCYWg2SEVIdzJNb2k5TU4vWi8yUllma012OU5ZWkJSYmlzeWlGYzZy?=
 =?utf-8?B?bURaL1VYeHZ5dzM1dVYrblNNdmR5aVZOa2MyTXZxdkF3c1J3OEZnVklyQVlz?=
 =?utf-8?B?OHB1OGhxVEk5WU8veUI4UG1kTkNxajJHT1EydnRmenVMSnNOZnFVY0dZRGVD?=
 =?utf-8?B?N3AzQjBkL1RHdVRxNHZHSHJhUjVrZlVVVTBJSlgzR3hyVGc1czVzalU2b0k4?=
 =?utf-8?B?K3A5RVFLcnVwM0ZEa0Y0azcvWkJHMlMrRzVoWGYzS3BMZmJiMVBJSnFMekJy?=
 =?utf-8?B?NERVRlFaTjBCQXpFRUdWVmQveFlMNEkwamlrQ3VUdzI5blNHd0U5d1N6djVX?=
 =?utf-8?B?NCtTRm9OK3NqTGFzUngwbU9nVTJiTGtiK3pxYzE5a3dVd01UL0lhdHZUVjR6?=
 =?utf-8?B?d3VnOFNGYVBxUGtkUmw2ajBFRkhhTG1uajJlUHhiYVg1UWRwb3JZV1UxdnBa?=
 =?utf-8?B?d0U0LzZkQWljYnpqdGxlMHYyMWhHZ3RsSHhxcUovZmY1VkhOUnZaam9ramZ6?=
 =?utf-8?B?aU5rQ3pEMTlmdExtY2xQOVJZcmFRMVQwcUMyeUZyS2l3ZURhdGdrZG1PdUkx?=
 =?utf-8?B?dm1NSnVVWStSc0lNZXFEYyszbjRJamdXd2gzdzJlTnd5dzlsdDFxOExkQWJ5?=
 =?utf-8?B?S1BIbHg2ZFNCRG1QaVlLdVNYcklkRXJndmNKSTF0Um9FUTNPeWJManB4dldO?=
 =?utf-8?B?Y1dyb3h2Y01VMHk1aDBjV0lCN3c5T2t3QnltcW5GRU9wS28za1B6WWRpWjQ5?=
 =?utf-8?Q?i+L/hX1CQJiVjxsJeRIP6PfExMwhII=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 19:53:16.3243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52014054-b971-4fea-23ca-08dd301e17db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893
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


On 1/7/25 09:32, Maciej Falkowski wrote:
> Expose NPU memory utilization info in sysfs in bytes
> to show total memory used by NPU (FW + runtime).
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_sysfs.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
> index 8a616791c32f..97102feaf8dd 100644
> --- a/drivers/accel/ivpu/ivpu_sysfs.c
> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
> @@ -7,11 +7,14 @@
>   #include <linux/err.h>
>   
>   #include "ivpu_drv.h"
> +#include "ivpu_gem.h"
>   #include "ivpu_fw.h"
>   #include "ivpu_hw.h"
>   #include "ivpu_sysfs.h"
>   
> -/*
> +/**
> + * DOC: npu_busy_time_us
> + *
>    * npu_busy_time_us is the time that the device spent executing jobs.
>    * The time is counted when and only when there are jobs submitted to firmware.
>    *
> @@ -42,6 +45,30 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
>   
>   static DEVICE_ATTR_RO(npu_busy_time_us);
>   
> +/**
> + * DOC: npu_memory_utilization
> + *
> + * The npu_memory_utilization is used to report in bytes a current NPU memory utilization.
> + *
> + */
> +static ssize_t
> +npu_memory_utilization_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ivpu_device *vdev = to_ivpu_device(drm);
> +	struct ivpu_bo *bo;
> +	u64 total_npu_memory = 0;
> +
> +	mutex_lock(&vdev->bo_list_lock);
> +	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
> +		total_npu_memory += bo->base.base.size;
> +	mutex_unlock(&vdev->bo_list_lock);
> +
> +	return sysfs_emit(buf, "%lld\n", total_npu_memory);
> +}
> +
> +static DEVICE_ATTR_RO(npu_memory_utilization);
> +

Instead of adding sysfs, maybe implementing  show_fdinfo callback and 
call drm_show_memory_stats()?


Thanks,

Lizhi

>   /**
>    * DOC: sched_mode
>    *
> @@ -65,6 +92,7 @@ static DEVICE_ATTR_RO(sched_mode);
>   
>   static struct attribute *ivpu_dev_attrs[] = {
>   	&dev_attr_npu_busy_time_us.attr,
> +	&dev_attr_npu_memory_utilization.attr,
>   	&dev_attr_sched_mode.attr,
>   	NULL,
>   };
