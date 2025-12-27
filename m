Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE3CE0153
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 20:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82E10E0C7;
	Sat, 27 Dec 2025 19:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pdgj20OZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8763710E0C7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC52ifwSrpN09fkpXmisEnE6AIvZF2+C2gw60Ecopn6AkC2WNYTlMPXj13DUMeuZ7n4CIYjNSXuRW61FXjZtNhEasbuZ7Pxr394RRxFP0mtxmKoefzeChC27d/SRI2E3hK/Qc2tZ2+vR5AehXSufjZAb5B9UhzwaQyxXGRxuIjb+XpXkR6np6TZa36/YF5ldTjPOsIkgz4aT/Oh/Eb+idPkodUr12OrolaQn0FRZlOtOvokqz3ZXpO+sTXdJKbkw9vuhI4WlYEzJMe0F3ZoJYasTM1aRSSIRQhWlYpRfDCqbjJXFYONQnvxdW479gidXG4dH3eeIhFAsRlIGHOeQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVFigVFYG4TUz0X6/6Q5ous3glYs/w7+fjdH3fCad2Q=;
 b=YJ8ydsz9CIEcgIyO+enxyjMW7qekSsAZZBkxs41LUqVDqSbd1jag7r0fOqWr8unnE7H8C35CWecTCwn4onE2Tq9UdkSAQa5EVJIFcFBApyAT8hmaUpO5Ykwc9DXnt3+FEXIgS6UJ+2VxTWiK7yJVta08xDY0z1Pg9fwNoqbuJ46nWZoeXv91HG8mpynGO4Jhl8m9iobNyE4XuK9nL09eUFE5CwQxJBqO0IYgdkp6Bdi60Ge4Ld7P3so60MjQ+OZl6bQvpF47id06RZg+WOoJZKW7GPQU7iLowfZ/fTDMJUU9HwNNNs9GZTZRVKzLJ5mzV45SsYo25EURnXM99k2lxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=wanadoo.fr smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVFigVFYG4TUz0X6/6Q5ous3glYs/w7+fjdH3fCad2Q=;
 b=pdgj20OZF74Yn3rTMH8wyh/mcjMlAgnPuL7YJIKujkr9ddYhDmKZ+ZszLHO9t5qTn186kvi/LoPqWaILpRHumk8oFTffW+HAUcG1q7wZ5r+A9UeCgPLjH98Fncd3DQNU11UXUlN/cHJhAdvEQT0KLtu4YH3TRoYcuT9x+wgF2JE=
Received: from BY5PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:1e0::23)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.13; Sat, 27 Dec 2025 19:17:12 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::2f) by BY5PR03CA0013.outlook.office365.com
 (2603:10b6:a03:1e0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Sat,
 27 Dec 2025 19:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Sat, 27 Dec 2025 19:17:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 27 Dec
 2025 13:17:10 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 27 Dec
 2025 13:17:10 -0600
Received: from [172.19.74.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 27 Dec 2025 13:17:09 -0600
Message-ID: <83a72692-327a-4061-93b8-b9d0d5e8ecbf@amd.com>
Date: Sat, 27 Dec 2025 11:17:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, DMG Karthik
 <Karthik.DMG@amd.com>, Nishad Saraf <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-3-yidong.zhang@amd.com>
 <91aad9d6-f408-4716-a45f-7ad3199ee36f@wanadoo.fr>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <91aad9d6-f408-4716-a45f-7ad3199ee36f@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fe3a2c-652e-4599-d200-08de457c8976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1VDaDdOV1ZaL3pzT3JmZ0Y0cFhTcGlqZmFXd0FmTDJPNmo3dkw0WHBRcG1M?=
 =?utf-8?B?emVMaTcwSnAxeXRzcHZjYkVacGdWbmFWLy9LdHM4Zk1tOWZtemNYYW0rRHRu?=
 =?utf-8?B?Tno0TG90dmFhR2Y4RmZUV042K29zQnN3ZkpYeHBJRGRtVlVuUExRZGcxUmVV?=
 =?utf-8?B?VDBuVU9vMVdNMFNNa3hud0lxVWd1TWx3OHppTUE1d0YzMzdZbHFZRWMwYXBN?=
 =?utf-8?B?UzcrZmRhaTlhZm90SFE3R0pWMDB2emw3QVFsRWRKRk1LOEgwUWVPbWlsUkxa?=
 =?utf-8?B?Z0lTNEVJbUdNcjdmZU5HNE5meEw1VEtuYUFUOFhpcStCU2dxVUt5RDJhczFx?=
 =?utf-8?B?dmE4dWVDTEdjbzFvT3ZOZi9TalFUTlhEeUQ0bEdNSUoyZVpydDBWWi9CTUxu?=
 =?utf-8?B?SnFoWlBma0d6SnJ0TFYwR3p0aFhSWVVTSUNWUHdXdDk4MWZFVVR3eFdDSEZr?=
 =?utf-8?B?alZXaFg0VVByYjkyRE45czZmdmxrWnFnVXV6VHhzNG95bnkraUk2OVJHeE84?=
 =?utf-8?B?amFqWmZSNWk4WWYvR0JUbjdQNDVxNUhyOEV6QWNTcXJtRGpNTTZTN05oekpQ?=
 =?utf-8?B?NUxxeFM5T2hkeG5tTTRzL2JiYXQ5VlJyQUJEbjFiKzYwaWhBY29pSHpaMXkz?=
 =?utf-8?B?S29YWHBUcHlBbHdIVUFLQTUvSTEwelRxRjZhQXRRZm01ZGtXR2xTQ0hDVWNV?=
 =?utf-8?B?WWIvTVVjbk5sYkpWVmkxYTBCNHVCempKMGl4Y3pFOWZGdklpKzI2T0RoYWww?=
 =?utf-8?B?Qk1hT245Tnh6a1RvRlFZL0VuRDZJRzh2UjVESDNndTBrZkVoQ0FkUnlsMVdW?=
 =?utf-8?B?Z0RXU1JlT2Z0a284UHlpdzhCZ0YvZHVpMHlTR1NkdDBEMC9PdkJxdllQb1FH?=
 =?utf-8?B?L3JuUkVHU1dDRjFMV3drd0lNTTUzSllSUjhXNlpVVitwMXNONzRKb0t3a0t6?=
 =?utf-8?B?QUFoWEhuSTV4UkJVcU13eG01TXdEK1cwN2l3Mll5NkwyZGRTRFhrb05VZmNI?=
 =?utf-8?B?dUptUnB4V0E1QUlrbTZOWkVNQWltcWNOd0ZTSmxHTlIzNXMwM3M2bmRkQXBs?=
 =?utf-8?B?b0szT2RWaHRPZTZzOUdVYkkvUklTQ2MwcUN0UDR5ZzcyNThXazRmYWx1bW5I?=
 =?utf-8?B?U3VBOXozQ1RIejdLYmdIYjFPUUtrRGpvN1dFRnZ5MXNhaXFNWGhKUjVpcTJ6?=
 =?utf-8?B?VEVwMEFZMEQyRlc2cmQwU2pKdFFZM1d2TEpManU0NS9VczJYWHQxd0dQYkUw?=
 =?utf-8?B?aElRbGllVkhuZ3gvdkUwcWZlakwxa1ZYMGc3SVRuTnlIUUdMK21NWFNUazF0?=
 =?utf-8?B?ajBsZ0ptRWlFQ0xaUmpDUDhRdXMraCthUXdXWjBLOC96RWhSaCtRT2tONkZ1?=
 =?utf-8?B?SUMxQjRWS01Jdm16VjA3bzJ4VHhTdXNmZjJCc3YycEdlYlJwY25qSHdIMGRj?=
 =?utf-8?B?VnUxNXlXbDFpdk5OY05WS1RuSnRNQnFVV09qVzVIVmJUSi9KcWdGWG1CZ3hh?=
 =?utf-8?B?ajB3OXphVTMzWk4rbHVieVE2RlBucnZEWGl2K0JVV3RaNXNrV29xQ09icnNs?=
 =?utf-8?B?bzd4WjBZYlF3bFhTOHoxYU9pNHNCL3Y3ZVcrREhUMFJNSXp0WVZpbXYwTUVp?=
 =?utf-8?B?NGhaOE5uVEorOVIzcHo3TTBTS3J3OEttK2UybTRZcW5GbGZYa05uSVFWM1ZC?=
 =?utf-8?B?dG5NNWFzNnA2YUp3TFRDelVjR1lUdFg2LzBQK1B2MGFTWmtleHBucmtnb2xt?=
 =?utf-8?B?aHFha1Q0TDBUR01jQUR1bkx4RXJiT3BXK3BnTStDeHRTQVcyYjEyd3MvVnhp?=
 =?utf-8?B?Z0ZXQ2NGaGxNWkRGMXRwamkwbkpRY1pVQmpValNnUDd3aktvMXdtcEpUeGhp?=
 =?utf-8?B?UjJQWDYvcDJLQUgwdk1OR1N3dm1yeTJ4S2lvR0s3bWhaVHRjVXU1UUhDYVJq?=
 =?utf-8?B?WkNXTzI4emZCb3BUVnZQRSttWDQ5dmtwQ2ZvRlRuQ1RRMDNjS3BBU0dVMHE0?=
 =?utf-8?B?RTJReVp3ZnNwd2Z1U0UxUVk5QmtKblA5a1JSN0pnVkJucFJBRlpvQVFla1lY?=
 =?utf-8?B?eHBZSFFKRXF0akM4aHc5K1dreWkvN29NN2Rnd05mOU1sdUxDWlRCeHNEY1lX?=
 =?utf-8?Q?sdlk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 19:17:11.6387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fe3a2c-652e-4599-d200-08de457c8976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
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

Hi Chris,

On 11/11/25 01:38, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 11/11/2025 à 02:15, David Zhang a écrit :
>> This patch introduces a new PCI driver for AMD Versal-based accelerator
>> cards.
>>
>> The driver provides basic module and PCI device initialization, based on
>> BAR resources used to establish a hardware queue-based ring buffer 
>> between
>> the PCIe host and the Versal Management Runtime (VMR) service running on
>> the embedded SoC. This interface enables firmware management and board
>> health monitoring.
>>
>> Key features:
>>     - PCI probe and BAR resource initialization.
>>     - Integration with configfs for firmware management
>>     - Compatibility check using firmware-reported UUIDs
>>
>> The base firmware image is expected under /lib/firmware/xilinx/<fw_name>
>> and can be programmed to the device through the configfs interface.
>> Firmware transfer is handled via a remote queue service (added in a later
>> patch).
>>
>> Co-developed-by: DMG Karthik <Karthik.DMG@amd.com>
>> Signed-off-by: DMG Karthik <Karthik.DMG@amd.com>
>> Co-developed-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: David Zhang <yidong.zhang@amd.com>
>> ---
> 
> ...
> 
>> +static int versal_pci_device_setup(struct versal_pci_device *vdev)
>> +{
>> +     int ret;
>> +
>> +     ret = versal_pci_fw_init(vdev);
>> +     if (ret) {
>> +             vdev_err(vdev, "Failed to init fw, err %d", ret);
>> +             goto comm_chan_fini;
>> +     }
>> +
>> +     ret = versal_pci_cfs_init(vdev);
>> +     if (ret) {
> 
> Do we need to call versal_pci_fw_fini()?
> (here or in the error handling path to be future proof)
> 
>> +             vdev_err(vdev, "Failed to init configfs subsys, err %d", 
>> ret);
>> +             goto comm_chan_fini;
>> +     }
>> +
>> +     return 0;
>> +
>> +comm_chan_fini:
>> +
>> +     return ret;
>> +}
> 
> ...
> 
>> diff --git a/drivers/accel/amd_vpci/versal-pci.h 
>> b/drivers/accel/amd_vpci/versal-pci.h
>> new file mode 100644
>> index 000000000000..ca309aee87ad
>> --- /dev/null
>> +++ b/drivers/accel/amd_vpci/versal-pci.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Driver for Versal PCIe device
>> + *
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __VERSAL_PCI_H
>> +#define __VERSAL_PCI_H
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/firmware.h>
>> +
>> +#define MGMT_BAR             0
>> +
>> +#define vdev_info(vdev, fmt, 
>> args...)                                        \
>> +     dev_info(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
> 
> \n could be added after fmt, as it is not included in the messages
> themselves, when used.

I tested this with "\n" on latest linux kernel, it will give us one 
extra line. I think latest linux has no need to add this extra "\n" anymore.

Meanwhile, I will address all your other comments and also update the 
copyright to 2026.

Happy new year to everyone!

Thanks,
David

> 
> Same for the other macro below.
> 
>> +
>> +#define vdev_warn(vdev, fmt, 
>> args...)                                        \
>> +     dev_warn(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
>> +
>> +#define vdev_err(vdev, fmt, args...)                                 \
>> +     dev_err(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
>> +
>> +#define vdev_dbg(vdev, fmt, args...)                                 \
>> +     dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
> 
> ...
> 
> CJ
