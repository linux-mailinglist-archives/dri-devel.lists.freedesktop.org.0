Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948FB194F2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 21:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0E810E040;
	Sun,  3 Aug 2025 19:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P4ku1Quf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C0F10E040
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 19:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6ImWTeLfNjA35VGSho/oyopzVuBebDJy819mQbNYHLfEykK3m2QvrtltKjwz82W5FQWiKdd6qeQJXRImn2RVYi54qjRoRI+DUUir+iOt9dpkKZthQNcHho41VcvlCHx2y1VXvHTYnoIjbQDmyk2tS/19aRxymy/C7Vr8cQ/wlesNHNl2aBIsA+DWfK9dSrgfcNvKMBTnHTkCB2nGemZiaQiSlh9GS1rYUyjBfjvb+7HEG7d8Oc4sXSuASOS1GGXHUwl69w3s3K3E0T6I6rkdY2+TSL0bv7M3UdVcBshVbJ1MsT3J9juMK1Jls8WFX7/CYv9LhKDFah3ch/fk7VAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK3FrnkUZrs5Rr5Xb4jGWH7zpPuq0NQR14oy61dGq8w=;
 b=AePSI+ICd4+1VrMYyQCUjNU3XdvEq0O7Rk6RzvKB3BACNtUyXR7uxXiiSUkSB60TIMrHSzyHhIPsht2YCLh3txy5a9KGIaSNHUR0AiF1EI/IrEa00Cr5i9jFQq+6+14++7k8Nx1diKjmWVofCiEuKmUcY9ZiFL1WmDf2sEd7n0TARjKD2e8di3suVqaSx2uRDJOCrtYO4AdRE5kt+IfKDnCp9Z4RmYXgkivpiV6lsBVXE0G7bijlL458X9VvjdfURRAXK5gfkDy0E4SzwU1hjZ7TySkHdobwiApXGhCxjB9SwhWSi/483qug+eK5vle9m7eNpSilDwYa7PWSzCXXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK3FrnkUZrs5Rr5Xb4jGWH7zpPuq0NQR14oy61dGq8w=;
 b=P4ku1QufhDRw7fqpBXF6ebvPZ+PbeLU4stcySlhjmH+X7ezhEQXJiCWuL9hBHSetqh75YIOtQKGXVJyCokJE0EWdkgU8ZbbsGVI8RGNiXKuxk0YNGApvsc/KsWzaObJZvVAQy2j+XYb4NU5ODZz7nlE9GvQNVRea1AKtyeQNpME=
Received: from DM6PR02CA0109.namprd02.prod.outlook.com (2603:10b6:5:1b4::11)
 by CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 19:14:23 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::b8) by DM6PR02CA0109.outlook.office365.com
 (2603:10b6:5:1b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Sun,
 3 Aug 2025 19:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 19:14:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Aug
 2025 14:14:22 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 3 Aug 2025 14:14:21 -0500
Message-ID: <1ed9b38c-8970-639c-108b-37a4be0fa8f3@amd.com>
Date: Sun, 3 Aug 2025 12:14:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250731163550.960686-1-lizhi.hou@amd.com>
 <a6528c4e-b42b-4cd9-84cb-ae8e109e3430@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a6528c4e-b42b-4cd9-84cb-ae8e109e3430@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: ac675a22-4ad0-4471-b9b0-08ddd2c1f492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVR4ejRIa0NTMmxhQTZXengxT2dESTI3WVVkZmhaYkdhcVc4aFJjR3dkUkFj?=
 =?utf-8?B?R1JJVUNPN0hRNUU0a1plMGM1bVN3cjVrdTYrMHhoeXZkOFYrUjBWMVNUQWRF?=
 =?utf-8?B?MEN6OENmSmpNSGhzQ3VJb0ZkOWY2L1h5VTlGZFRSbzFDZVlqdXBlTEVTcnhV?=
 =?utf-8?B?eFZwdEJVZEpiSW54UnNZTnFGU3hMQkprYklac3Y0ZVQzY1hjTTRDU1ZZN0lO?=
 =?utf-8?B?aCs0M0JSczIrYnZKVjZ2TmJsZzE5VTVoSERhSEoxcjZRYURoRk5HTGVVK2pF?=
 =?utf-8?B?YWlJalA4aWZBQ0V6MmlCbG1CK3JrWVJFUWs1Vk9tTTB3UHhQMXRwTWlaQ3lS?=
 =?utf-8?B?Vk5PREp6dzdQUUo0ZjZsSVlnR0JJd2h1WjliWDdLSXg5dkR6UHd5R3NVYUpt?=
 =?utf-8?B?Z1hidjlQOTJBWXRxWEQ2VnQrVUUvMVJqb1BudGdGMkdkcnBwa01ycnRjNW13?=
 =?utf-8?B?K3pmMkwzT2kxY0FWQzN0WjBsQk0vYnFIT1RmcGhsSzl1TXl3NWdWUzI2amRS?=
 =?utf-8?B?RjFLZVdwaGI1N0lFZkdDS21HbDZiRUJaeE8yT0ErbkNuZHJ0bU5MaVJJeFJa?=
 =?utf-8?B?bXlZQXg2dmNXVXV5WHp1Y2Z2c2RGa1NFMmJOSUFNQjBDVnozZHZxREp2Vm9y?=
 =?utf-8?B?S1JpemUvZGdyOTFEQ2tmSUhBNzlUZWt2ZWRTbEdZRHVvTXU3UFVpQTd4U0xV?=
 =?utf-8?B?V3EwV2hJa3M1QkJBZkJqT2pRV0R6VUEreFNKclpldFV6QXByQVdIbDJDQzl1?=
 =?utf-8?B?dE1ZdDZUOTU4cTFqaU5TcmhNVFBhTU1IV0o4VXpDRXRxTkhHN3BUMTEwUWt4?=
 =?utf-8?B?aXBSZWVBN2ZiWndyTDJ0Zmxkbi9VcHA5ckYrbzlGQXhmOGNFTisrd0ZKMTVa?=
 =?utf-8?B?OGRjT3RZZXdjMlJiWnlFa1dwcXdhVEEvVmg2b0lRN0VHRUJMVE9lOGg4dWdO?=
 =?utf-8?B?S3RYK0cvOTNZc1d5cHhSQ1dPbWNiS1RUU1FoOXZOWE9TQUhRT20vUEc3L0hU?=
 =?utf-8?B?Smw1Ym5zWjVzYTFPVkJqNkhVK2UrbGR5Zy9aL3k0bUlIQ3JXYzZRZUVsdFYr?=
 =?utf-8?B?Ty8ydUUxbGZCRG1mMFV5c2dQOUNtR3RRN3NsY1h4a1BNRmFYWVE2WGlsSGk3?=
 =?utf-8?B?cUpRbzRjMGhkcUw2L1M2cndGd2krTjdHanFTQnhNTEI2cUVQZXdvQll1NFNU?=
 =?utf-8?B?eUw4dzBYR3VGaDBwRG13WGFFYkYzbWc3VGpicU1FWGcrNk85ZHNJL2FobGpk?=
 =?utf-8?B?WWxUelEwYnhLb3liSWVYZU5xVHNyZG5Bb0RjdThKUmtMT0Rhc0xNOWM3bXVm?=
 =?utf-8?B?a2ljKzZrRGVxMDg2UnhGbzF5SEhOOVArblRMNDJqQW95cmxWMURnd3JxdU9Z?=
 =?utf-8?B?WE1Td1pRNnpQYjlkSGdaNGtIVlVXcm11OWZGL3J0endISmhXdTNyQ0h6M0x1?=
 =?utf-8?B?V1lod3BHU25BMnRiVmVudWJmcmJSUkRoY3VYbm5NbkhGSWszM0RWUWY4TCtv?=
 =?utf-8?B?dnVlS2hHTHU5ZDBKdnIwQmdhZVhNQmxJMDZuWjhIVXRueU14MGYxcU14RUEz?=
 =?utf-8?B?VW96MUN0S09iZE9yWHZXTVRlSUVIaXNpK1JXcnFlNVlMcG5tR0pETEpyd1Rm?=
 =?utf-8?B?TDlraERwNHIwcmZQWXUxTG1xZmo5YjFVNFhtNkxXcTR2NVpmejNoL2NRV3FJ?=
 =?utf-8?B?WGJFRlZ0WFl1RWIwWVMwK0NPalJxaC85Rm9oQUpQYnN1RUtoR3RJekY5Tkpy?=
 =?utf-8?B?REdrVTJmbGFsbTBTeGhnS1lFZWFRMmxJMEZMOVRsd0VhUzdXdG1qd2hZNGRr?=
 =?utf-8?B?Z3dTLzZxOGxzUDIwWWVJK0kvOEpWV0E3cFcvNysxaEl4aTRkNGRaY2licGJw?=
 =?utf-8?B?Q1lIbGJVVFBrSmFQZUFJZWYrVnlXUHlFcjl3TzJGb3NLNldYMkQ3RlZ2cWJz?=
 =?utf-8?B?dUNjTXRGM3JxSGx3YktqN1FtZk1vU3pYVm5CR1FGQTZOYWJCTmp1M2M5eWl0?=
 =?utf-8?B?WC95RklUSmVPT1dXSCtiLzRiVitXdGVGa2pHb0pmcHFSWW1YRHNjYlRyckNM?=
 =?utf-8?Q?I3U7Br?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 19:14:22.9448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac675a22-4ad0-4471-b9b0-08ddd2c1f492
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717
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


On 8/1/25 05:36, Mario Limonciello wrote:
> On 7/31/2025 10:05 PM, Lizhi Hou wrote:
>> The suspend and resume callbacks for pm and runtime pm should be same.
>> During suspending, it needs to stop all hardware contexts first. And
>> the hardware contexts will be restarted after the device is resumed.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c        | 32 +++++++----
>>   drivers/accel/amdxdna/aie2_pci.c        | 41 ++++++++++++--
>>   drivers/accel/amdxdna/aie2_pci.h        |  4 +-
>>   drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
>>   drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
>>   7 files changed, 69 insertions(+), 114 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 2cff5419bd2f..7444117f0e17 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -141,9 +141,11 @@ static void aie2_hwctx_wait_for_idle(struct 
>> amdxdna_hwctx *hwctx)
>>       dma_fence_put(fence);
>>   }
>>   -void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
>> +void aie2_hwctx_suspend(struct amdxdna_client *client)
>>   {
>> -    struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_hwctx *hwctx;
>> +    unsigned long hwctx_id;
>>         /*
>>        * Command timeout is unlikely. But if it happens, it doesn't
>> @@ -151,15 +153,21 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx 
>> *hwctx)
>>        * and abort all commands.
>>        */
>>       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    aie2_hwctx_wait_for_idle(hwctx);
>> -    aie2_hwctx_stop(xdna, hwctx, NULL);
>> -    hwctx->old_status = hwctx->status;
>> -    hwctx->status = HWCTX_STAT_STOP;
>> +    mutex_lock(&client->hwctx_lock);
>> +    amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> +        aie2_hwctx_wait_for_idle(hwctx);
>> +        aie2_hwctx_stop(xdna, hwctx, NULL);
>> +        hwctx->old_status = hwctx->status;
>> +        hwctx->status = HWCTX_STAT_STOP;
>> +    }
>> +    mutex_unlock(&client->hwctx_lock);
>>   }
>>   -void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
>> +void aie2_hwctx_resume(struct amdxdna_client *client)
>>   {
>> -    struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_hwctx *hwctx;
>> +    unsigned long hwctx_id;
>>         /*
>>        * The resume path cannot guarantee that mailbox channel can be
>> @@ -167,8 +175,12 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
>>        * mailbox channel, error will return.
>>        */
>>       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    hwctx->status = hwctx->old_status;
>> -    aie2_hwctx_restart(xdna, hwctx);
>> +    mutex_lock(&client->hwctx_lock);
>> +    amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> +        hwctx->status = hwctx->old_status;
>> +        aie2_hwctx_restart(xdna, hwctx);
>> +    }
>> +    mutex_unlock(&client->hwctx_lock);
>>   }
>>     static void
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 3474a8d4e560..8b6f17430d3a 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -440,6 +440,41 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>       return ret;
>>   }
>>   +static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>> +{
>> +    struct amdxdna_client *client;
>> +
>> +    mutex_lock(&xdna->dev_lock);
>> +    list_for_each_entry(client, &xdna->client_list, node)
>> +        aie2_hwctx_suspend(client);
>> +
>> +    aie2_hw_stop(xdna);
>> +    mutex_unlock(&xdna->dev_lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int aie2_hw_resume(struct amdxdna_dev *xdna)
>> +{
>> +    struct amdxdna_client *client;
>> +    int ret;
>> +
>> +    mutex_lock(&xdna->dev_lock);
>> +    ret = aie2_hw_start(xdna);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "Start hardware failed, %d", ret);
>> +        goto unlock;
>> +    }
>> +
>> +    list_for_each_entry(client, &xdna->client_list, node)
>> +        aie2_hwctx_resume(client);
>> +
>> +unlock:
>> +    mutex_unlock(&xdna->dev_lock);
>> +
>> +    return ret;
>> +}
>> +
>
> You could avoid introducing goto in the new code if you used a guard. IE:
>
> guard(mutex)(&xdna->dev_lock);
> ret = aie2_hw_start(xdna);
> if (ret) {
>     XDNA_ERR()
>     return ret;
> }
> list_for_each_entry();
>
> return ret;
>
> You can drop a few lines from unlock in mutexes elsewhere too.

Thanks, I will change this.

Lizhi

>
>>   static int aie2_init(struct amdxdna_dev *xdna)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> @@ -901,8 +936,8 @@ static int aie2_set_state(struct amdxdna_client 
>> *client,
>>   const struct amdxdna_dev_ops aie2_ops = {
>>       .init           = aie2_init,
>>       .fini           = aie2_fini,
>> -    .resume         = aie2_hw_start,
>> -    .suspend        = aie2_hw_stop,
>> +    .resume         = aie2_hw_resume,
>> +    .suspend        = aie2_hw_suspend,
>>       .get_aie_info   = aie2_get_info,
>>       .set_aie_state    = aie2_set_state,
>>       .hwctx_init     = aie2_hwctx_init,
>> @@ -910,6 +945,4 @@ const struct amdxdna_dev_ops aie2_ops = {
>>       .hwctx_config   = aie2_hwctx_config,
>>       .cmd_submit     = aie2_cmd_submit,
>>       .hmm_invalidate = aie2_hmm_invalidate,
>> -    .hwctx_suspend  = aie2_hwctx_suspend,
>> -    .hwctx_resume   = aie2_hwctx_resume,
>>   };
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 385914840eaa..6b21909841e0 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -288,8 +288,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>> struct amdxdna_sched_job *job,
>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 
>> value, void *buf, u32 size);
>> -void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
>> -void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
>> +void aie2_hwctx_suspend(struct amdxdna_client *client);
>> +void aie2_hwctx_resume(struct amdxdna_client *client);
>>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job, u64 *seq);
>>   void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long 
>> cur_seq);
>>   void aie2_restart_ctx(struct amdxdna_client *client);
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index be073224bd69..b47a7f8e9017 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -60,32 +60,6 @@ static struct dma_fence 
>> *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
>>       return &fence->base;
>>   }
>>   -void amdxdna_hwctx_suspend(struct amdxdna_client *client)
>> -{
>> -    struct amdxdna_dev *xdna = client->xdna;
>> -    struct amdxdna_hwctx *hwctx;
>> -    unsigned long hwctx_id;
>> -
>> -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    mutex_lock(&client->hwctx_lock);
>> -    amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>> -        xdna->dev_info->ops->hwctx_suspend(hwctx);
>> -    mutex_unlock(&client->hwctx_lock);
>> -}
>> -
>> -void amdxdna_hwctx_resume(struct amdxdna_client *client)
>> -{
>> -    struct amdxdna_dev *xdna = client->xdna;
>> -    struct amdxdna_hwctx *hwctx;
>> -    unsigned long hwctx_id;
>> -
>> -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    mutex_lock(&client->hwctx_lock);
>> -    amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>> -        xdna->dev_info->ops->hwctx_resume(hwctx);
>> -    mutex_unlock(&client->hwctx_lock);
>> -}
>> -
>>   static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
>>                         struct srcu_struct *ss)
>>   {
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index f0a4a8586d85..c652229547a3 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -147,8 +147,6 @@ static inline u32 amdxdna_hwctx_col_map(struct 
>> amdxdna_hwctx *hwctx)
>>     void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>> -void amdxdna_hwctx_suspend(struct amdxdna_client *client);
>> -void amdxdna_hwctx_resume(struct amdxdna_client *client);
>>     int amdxdna_cmd_submit(struct amdxdna_client *client,
>>                  u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index f2bf1d374cc7..fbca94183f96 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -343,89 +343,29 @@ static void amdxdna_remove(struct pci_dev *pdev)
>>       mutex_unlock(&xdna->dev_lock);
>>   }
>>   -static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
>> -{
>> -    if (xdna->dev_info->ops->suspend)
>> -        xdna->dev_info->ops->suspend(xdna);
>> -
>> -    return 0;
>> -}
>> -
>> -static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
>> -{
>> -    if (xdna->dev_info->ops->resume)
>> -        return xdna->dev_info->ops->resume(xdna);
>> -
>> -    return 0;
>> -}
>> -
>>   static int amdxdna_pmops_suspend(struct device *dev)
>>   {
>>       struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>> -    struct amdxdna_client *client;
>> -
>> -    mutex_lock(&xdna->dev_lock);
>> -    list_for_each_entry(client, &xdna->client_list, node)
>> -        amdxdna_hwctx_suspend(client);
>>   -    amdxdna_dev_suspend_nolock(xdna);
>> -    mutex_unlock(&xdna->dev_lock);
>> +    if (!xdna->dev_info->ops->suspend)
>> +        return -EOPNOTSUPP;
>>   -    return 0;
>> +    return xdna->dev_info->ops->suspend(xdna);
>>   }
>>     static int amdxdna_pmops_resume(struct device *dev)
>>   {
>>       struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>> -    struct amdxdna_client *client;
>> -    int ret;
>> -
>> -    XDNA_INFO(xdna, "firmware resuming...");
>> -    mutex_lock(&xdna->dev_lock);
>> -    ret = amdxdna_dev_resume_nolock(xdna);
>> -    if (ret) {
>> -        XDNA_ERR(xdna, "resume NPU firmware failed");
>> -        mutex_unlock(&xdna->dev_lock);
>> -        return ret;
>> -    }
>>   -    XDNA_INFO(xdna, "hardware context resuming...");
>> -    list_for_each_entry(client, &xdna->client_list, node)
>> -        amdxdna_hwctx_resume(client);
>> -    mutex_unlock(&xdna->dev_lock);
>> -
>> -    return 0;
>> -}
>> -
>> -static int amdxdna_rpmops_suspend(struct device *dev)
>> -{
>> -    struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>> -    int ret;
>> -
>> -    mutex_lock(&xdna->dev_lock);
>> -    ret = amdxdna_dev_suspend_nolock(xdna);
>> -    mutex_unlock(&xdna->dev_lock);
>> -
>> -    XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
>> -    return ret;
>> -}
>> -
>> -static int amdxdna_rpmops_resume(struct device *dev)
>> -{
>> -    struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>> -    int ret;
>> -
>> -    mutex_lock(&xdna->dev_lock);
>> -    ret = amdxdna_dev_resume_nolock(xdna);
>> -    mutex_unlock(&xdna->dev_lock);
>> +    if (!xdna->dev_info->ops->resume)
>> +        return -EOPNOTSUPP;
>>   -    XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
>> -    return ret;
>> +    return xdna->dev_info->ops->resume(xdna);
>>   }
>>     static const struct dev_pm_ops amdxdna_pm_ops = {
>>       SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
>> -    RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
>> +    RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
>>   };
>>     static struct pci_driver amdxdna_pci_driver = {
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index ab79600911aa..40bbb3c06320 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -50,13 +50,11 @@ struct amdxdna_dev_ops {
>>       int (*init)(struct amdxdna_dev *xdna);
>>       void (*fini)(struct amdxdna_dev *xdna);
>>       int (*resume)(struct amdxdna_dev *xdna);
>> -    void (*suspend)(struct amdxdna_dev *xdna);
>> +    int (*suspend)(struct amdxdna_dev *xdna);
>>       int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>>       void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>>       int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 
>> value, void *buf, u32 size);
>>       void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned 
>> long cur_seq);
>> -    void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
>> -    void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job, u64 *seq);
>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_info *args);
>>       int (*set_aie_state)(struct amdxdna_client *client, struct 
>> amdxdna_drm_set_state *args);
>
