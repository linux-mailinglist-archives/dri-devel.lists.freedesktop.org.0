Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6999235A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 06:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5F110E165;
	Mon,  7 Oct 2024 04:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PehJ1LS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC310E165
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 04:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQnKXhpeMW8A/HAp1CBPlKZVoCYpGPmkyCw9DJM2VZG/bzppedsK8aQbHqQR6WpxbrafLYaE+R+vCv3aRPonGGoWlY4ZYI3g3uPNkv9P8xwPWs/9lz+rVlh2WoRqMipvPDAozG1olu1VPSlgGJyTrtdlRyCMFnRCeF6q0Sx3ManfxZkoSn/uP1/nL7rGUyviRhXahRkp3RcA7QT56V0E6S+VsoBdnvcFBiNALOTrcetRAodJ5vhACuNBK6sou7J4+NX1X/DdZPsZwlHcKnYRY37xoG876BVg8ir23vYc9dCXliZZe+MqAbrL1eBoTYY0R/w3nL0PglUc8XI/rXOU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vG9fUeRe64aXYWq18u9V3xS73Qc0Ka4Ssx1DkqKXsU=;
 b=ZMAWFn8UHrbTmfUMSYpFabbKGjTUT8hERrUAKGXFWFzxovT18pdjJIm1aHXmXJBdewC1b7KhEDyTEE4kXjQprKFbnqShjXxDVfNx91iLlOw3jveyr2q8hgfT5NzsIyQkkSPYg+qCsdaJ2Rsboopt1l2gTVkLQRH1Cw49LSskOFo14VRywlliYiyqp+NdfmMWJU805kdrmDhSZ5KyT0ABu7URcPlbuoktEoIQa84qN3n64a00qyf0EcvkA9Bw4wk2k1QEfncdXw/raI7RKmOdGh2eJrrkie0v+UzcmkeoSpED+qUio1/+OPwWHRNi6liivqT7mstp/miaAHOoIiTqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vG9fUeRe64aXYWq18u9V3xS73Qc0Ka4Ssx1DkqKXsU=;
 b=PehJ1LS4bLaWOaRVdKqdq9kBYh3zXEGhXcqhQvexAzIu5r9VlfAaMiis8EPI5qPP5GJyxMf29s/kNX5Ft1+p28GgtPxL7AyhQ4t8LecD+DcuvHCElaVC6SIh/smjLoug24MlLNQfi/psb8Ie5liG6ex0bs78V+WMLp4ls9HaLL8=
Received: from MN2PR01CA0045.prod.exchangelabs.com (2603:10b6:208:23f::14) by
 SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 04:04:02 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::7) by MN2PR01CA0045.outlook.office365.com
 (2603:10b6:208:23f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 7 Oct 2024 04:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 04:04:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 6 Oct
 2024 23:04:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 6 Oct
 2024 23:01:57 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 6 Oct 2024 23:01:56 -0500
Message-ID: <12f54522-4c4c-30d4-8046-f77a67db0bcb@amd.com>
Date: Sun, 6 Oct 2024 21:01:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 02/11] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-3-lizhi.hou@amd.com>
 <f81addf5-f9eb-5d39-313e-b18788cd8418@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <f81addf5-f9eb-5d39-313e-b18788cd8418@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc676c2-6c3a-4788-ae19-08dce6851458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXg4MTE0RzQyOXVZSUN1dzRRY0FnQ3A3NzhMZUVDYVltUTFYY0hlYVFHdW80?=
 =?utf-8?B?V1VZdklEZWx3ajEzM1Vhb2VmaHBrdUNteFFtbFZ6VjlHZFRjem5NdTJ1Zlhh?=
 =?utf-8?B?Z2sxRTJBY2k0Y09PWTBvRGZ5d3A3bkpabUdZUG5qbXJNSWVQTU9jT0RCeFg0?=
 =?utf-8?B?NGt6UHV4MmhtNmRoN29SaXpzUGN6dUR3czl4V1BnaWpIcXRDMDREMXBiREtR?=
 =?utf-8?B?aW9KaWFvS0NXQ2V2NjVlSHVDWSsrY3QyeTB0WjlZVStIVjl5UE9VVzJsbjNY?=
 =?utf-8?B?Ri8zRzBzYkFXZjhHRVF5aFlUOGsxREZ6bEVEWGZ3M0FQdmswNkt5WVI3UFZB?=
 =?utf-8?B?VEZxMzVTQ1JkM2lDKzBkY3ZQSkZJcS9keXhEa3YrajlnSlV5cVoxZy9mU3FB?=
 =?utf-8?B?d0lJUCsyNHhzdzZzcjY2ZnlsOU9lTEpuaU1IRFNFMzhGYy9yMTB2UFgwY2gr?=
 =?utf-8?B?WW1TSHJrclFocmNjdVZmMXVhekZoZVFJM3JjbUV0ZU5zZU81aE0rV205eDFk?=
 =?utf-8?B?YVgrcE1EanIvUTd0cDVzYmFDcnZFQ2RTcm5KZkVvbVIzRXFwdTBXVkEwbERk?=
 =?utf-8?B?c0RCMG1BSEwxUkJtdkwxaTlYL213SlplL2lXbURqT2FMRjlBb1V0QUtyMTh3?=
 =?utf-8?B?bjhJWnhOcjRLdGRFcFlCSTZ1NDR4dExjek9TTkFOWXIzZjV6NFAwdWdhaVVq?=
 =?utf-8?B?ajNIb2FUanpFUXZ0ajlJYmJrTVRyeWEzYzdPMms1SG9oUW8xcm9qUEYrRHpI?=
 =?utf-8?B?aUZiTENVdDZ4Q1NHQnl1RkRqVlVqdnZYcGRhZFh2NlRxdDlRdHd1dTNVaHJy?=
 =?utf-8?B?NmRoVnhnZWgzMWd6V1lsWktzQitFc1FtVnY3Yjg1VUxicFBGek5RbWlwSmx4?=
 =?utf-8?B?UWNTZmlBSExvSDZJb3YzeEY2V3p3dXg5N1QwRU1odGp4Wit4bTU3L0FkSU5M?=
 =?utf-8?B?MmR1eVY1U0M1cWtRV0NZVTg1bkZOdytra2F2eGc3VzB3V0xSUFQxKzA1djFN?=
 =?utf-8?B?T0ZvcHBWSGFQZTRzWDg4K2ZHK0h6MlgxbDhJL0NzaVRwUEJFK1BVODk3OXBs?=
 =?utf-8?B?WTdEdkwzSFk3SjhpVHZSUGhjQUQ5NGRoVmoxV2FaaGNnVE9qd0k3T0t1WlJE?=
 =?utf-8?B?UjlGc0tLam1aN2tJVGZGTHQxWlNjTG40U3o5c3c3M3E0RWQ0T0lGeDZRUmd1?=
 =?utf-8?B?K2dOc1dRUUFTR0tpMmRFWTlNZldHdUVNR3JHc21ib0E3WDRMYXJZTmU5Wkc1?=
 =?utf-8?B?TFpaRTF2SkYrMmROV2p2NjROWG9KYnVzOHg4bHpQK0gxaFhNZW43bFl5WmF1?=
 =?utf-8?B?NHd2SkJQZGNQbVI2cUE4MkFOUmszTDVmcXBmcVFrWjA2cWxwUXEzSmZMQjgy?=
 =?utf-8?B?YVVJdjJINzBMTnIrVkdmbUo2K1ZyQndKc1FhV0RSYnNPak91b3hIVi9HREVx?=
 =?utf-8?B?VnpIWWNwN0hPalIweHFpOHp3OGRWQWwrU3ppb09ibEJ3Yk5HYzBWOGNZeGh4?=
 =?utf-8?B?cTREd0FTR2UwM1FaQko0MXMxbTMzb01FTEN1Sy9maGhJaWwyRWNaUzdHT3l1?=
 =?utf-8?B?NGZjS0c0V1NXSi9ZNURGWWlNUHV0VDUzUmFlMEJiVWpxS05MdzBNbVdncU5l?=
 =?utf-8?B?dE5OSzJROEtpL1p0OEdTQ1RDOXlWa0ZqeEVEQTBRbWlxUWRLbWJEQmt4ZytI?=
 =?utf-8?B?eDF1UEFqMk5lei9EeitZUDcvNFRKdFArSnA1dEN2b21HUTZ4eEpTb3FEQzcx?=
 =?utf-8?B?MjNnaUkrZnkyK0NaM0gzcmpnaVJUSXhDdWk3dVZLRUF0RFFEMmRvUEtwU01r?=
 =?utf-8?B?TTF6YzY0WXBIVjRod0t5YmFBSUtBNlphY09WQnRLamZmRHluRDhLdlRoMUR6?=
 =?utf-8?Q?42/xK0WcjeP2M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 04:04:02.5381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc676c2-6c3a-4788-ae19-08dce6851458
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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


On 10/4/24 10:21, Jeffrey Hugo wrote:
> On 9/11/2024 12:05 PM, Lizhi Hou wrote:
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> new file mode 100644
>> index 000000000000..e21b32557fc2
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +#include <linux/errno.h>
>> +#include <linux/firmware.h>
>> +#include <linux/iommu.h>
>> +#include <linux/pci.h>
>> +
>> +#include "amdxdna_pci_drv.h"
>> +#include "aie2_pci.h"
>
> Feels like a blank line is missing here.
sure. Will add it.
>
>> +static void aie2_hw_stop(struct amdxdna_dev *xdna)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> +    struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>> +
>> +    aie2_psp_stop(ndev->psp_hdl);
>> +    aie2_smu_fini(ndev);
>> +    pci_disable_device(pdev);
>> +}
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> new file mode 100644
>> index 000000000000..b3c360a10c04
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _AIE2_PCI_H_
>> +#define _AIE2_PCI_H_
>> +
>> +#define AIE2_INTERVAL    20000    /* us */
>> +#define AIE2_TIMEOUT    1000000    /* us */
>> +
>> +/* Firmware determines device memory base address and size */
>> +#define AIE2_DEVM_BASE    0x4000000
>> +#define AIE2_DEVM_SIZE    (64 * SZ_1M)
>
> SZ_64M? Then the code, and reader's brains, are not doing multiplication.
ok.
>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> new file mode 100644
>> index 000000000000..33133f2503cd
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/drm_accel.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_managed.h>
>> +#include <linux/pci.h>
>> +
>> +#include "amdxdna_pci_drv.h"
>> +
>> +/*
>> + *  Bind the driver base on PCI class and later use the (device_id, 
>> rev_id)
>> + *  pair as a key to select the devices. The devices with same 
>> device_id
>> + *  have very similar interface to host driver.
>> + */
>
> Looks like this comment didn't get updated when the class matching was 
> removed.

I will fix the comment.


Thanks,

Lizhi

>
>> +static const struct pci_device_id pci_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x1502) },
>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x17f0) },
>> +    {0}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(pci, pci_ids);
