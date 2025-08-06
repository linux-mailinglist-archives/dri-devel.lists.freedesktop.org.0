Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D483B1CAF9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 19:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA4010E0F1;
	Wed,  6 Aug 2025 17:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gq6Tiwv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071F710E0F1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 17:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boceG0C52ooD70A8gf1vo6gENXXJABbhD92fTuBn0NEcmOLafJ7kHAO99XK1HyoZQFtXvyfTNwbxMmWkk+eunrBvl+zzu7sQy3V2p9i7f2MAnSI8xR6gUYaWboMO8/0WMZN71Bm7NzCbKfllCswhcPr/IjqblN6PicamDpSSBN1t22ZqqxofVAOLeRb7ywzQkxPnF/DAsSZXkxOyc3TrjOUOPn/zMoKD+X6rnwBhmLeleJvb1NlBt1a7HPIPKyiTFPJGno/2Gggd5xxUbZkDCLgxkU3CXD4WtEDoliJ/krrWQwEfC+ej0qq7whr6X6PNY0ER/8WNP2ZpjMvReyI9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrqhhy1/3DljZcL7bgqx4MmyX3fzZ+jiNynmXxq92R4=;
 b=w1PN2F2ZajSBoL5KI2p9/yJnxAN0GPnyGdQko6VjuS/f+vZCMrmIn4jQj7wNjx6i9ObvvyD3U/TO4QBMcdP0/WJIuouvO1h9TZBvSLLtwPKGdWE+2Q+ou+0nelte+0w1uyNpOILca7G9rNKY4gwjZpAOly1+kjFG0BpoZt35t4mgb/tFGGYqVbd6foq0dK+Ul6bhMgQ1sMN27mx7pH9Pli4MXqp3o+zRx4QQVb67yGL3zP4P4KdLus7aBfljUZFYCdfM/5tdwrFFRxjoSL0HB15r7Rmv1OFfwRXEjKVI7DwmTjyJq67fdlrSujYeK3El6LxGxJAm0tOGocXjJavldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrqhhy1/3DljZcL7bgqx4MmyX3fzZ+jiNynmXxq92R4=;
 b=gq6Tiwv3OZ7AkvIedxut7GoLMgJr/dmCExslJrU+gWAPTGdHLYHsDvRKWfTPqa7vmOSbhhKEEMUMztqpE6A6wDcxs97sumbHO6KIu59sZprtX5NBoIkqKQ0pAMY8eROQt2g4ioFXrUGsabnwnRtlINyT+vD96jzB6abSjuAO/VI=
Received: from SA1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:2ce::10)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 17:36:21 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::2) by SA1PR04CA0002.outlook.office365.com
 (2603:10b6:806:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Wed,
 6 Aug 2025 17:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 17:36:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 12:36:20 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 12:36:19 -0500
Message-ID: <f54c9f84-01c5-2911-e07a-7d577a65462c@amd.com>
Date: Wed, 6 Aug 2025 10:36:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250803191450.1568851-1-lizhi.hou@amd.com>
 <8d877db5-3c16-44dd-8be8-eb3dd0130fc7@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8d877db5-3c16-44dd-8be8-eb3dd0130fc7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 2424bb3d-832f-4dd9-2ec7-08ddd50fc1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGkrY1VKMVRvaGRiMUhyM0NaaW0vcjNyUFJ1UDRwYUZLeXRjcDRMS05VVTBD?=
 =?utf-8?B?TjFnSjVEam1zQlBZQ1FXVm5QNi92QmkyRGpOOTVCRHZxVm5SZXo0M212dktS?=
 =?utf-8?B?emNyM0hGcExMMk1UZHBtUGRTdjJZSWhvVEprWGZUN1lJQWt1ejI3dFY3MXY3?=
 =?utf-8?B?eTBobVZRYk1zT2M4QnlHb3pNdmtuUEZPYWtmQzF4MkRNTk5MODEyMVFsL29w?=
 =?utf-8?B?bWFmYUFTOTJSc2lGdHRKb1k1U0dwMHo1bW1yWlNiK3hzaFVzTVdZZmhEaW5E?=
 =?utf-8?B?bGp2RVJDMHFUZGx5clRiY1I3b1paNTVpK3NzRkc2RXFQRUZjcDM4NDgwU3BV?=
 =?utf-8?B?T3BPdzFodHVTTzQvNlgxRk5TdS9MQzBPWjBYVjROZHlvVmtoQTZKOXlKL2w2?=
 =?utf-8?B?dVE4M04rV215OTRXdnRwRFZNTEtzanNWVGlRWGo2ajJBVFRBV250aEhsZVRF?=
 =?utf-8?B?VDU1OVVYL3V5SlNBQ3dKZUphRTdaUXFYaUFYOFgreFJuNmJVdFh2YnU1c2FR?=
 =?utf-8?B?TVVIK1FlSzUwZm5rU2VacnpjKzVFWVNZRDQzd0x1MnZwVGlFZTFucXA1alNk?=
 =?utf-8?B?OXN5UGF6bmc2RU42b0haMzk1NGYyOVlEVnRaYjNwMzc5dGlqM01MSjJwTFR4?=
 =?utf-8?B?dTdrbjFicVQ2aTJRWEJaUFlZb0xaVFdtRmJTV0Nua0swRUhsUEtWZy9qNWd4?=
 =?utf-8?B?K0duT1NyVjJSeTdaZUlpUExHMW5QZnZBMHNlT1JsNmh4RXQ3L0Z1ZjBIYy9o?=
 =?utf-8?B?QUxsRHRWTHUrTnB6MlZaNTJ5cDR6YXVtYmhWUTN0R2pyWGluSlYvQWJEL1NO?=
 =?utf-8?B?eHBjV3dMNEwzaWxKNTZJQ3hyNWk3N2hFd1RqangxRmRRekdOcUlrdTFzM05q?=
 =?utf-8?B?ZmtLUVFwek5TcUkzdFNNbTRUVkVCZmcxSEovNlRhUDJjdnRORnNCZWVCRTZU?=
 =?utf-8?B?TmcvcTYvRFEzb0Fvai9uaWNWWVgveXNjMkxZOXVoczd3TGp5cmw2UEJkZEtO?=
 =?utf-8?B?blBHaEhDUC8remhvOFJFLzJnZDUwdnd0SmFTNUIyYlVFT01aSksrZzhiV0Mv?=
 =?utf-8?B?ZUpnalVQZUJrNTlvV2dmNzJwM3l2QzFSM3dGbXkrS1Fwd2ZscHdqSGxDQm05?=
 =?utf-8?B?czFjRzhja3IvN2FjLzU5Q0xMaktkckQ3TllibFJJanBudGl6c1g0Ull3U0ZG?=
 =?utf-8?B?ZktiOTE4OEk5bm83WVBxZTNzYVNuQm9vMC9hSTFFL0dtRnpHYVF5QXRnMy96?=
 =?utf-8?B?ak05TFV0eWxVdW1WV3lpRTI1Mk1ZTUovWVRWVlpUdldtREtaQjhPamh3bCtU?=
 =?utf-8?B?THJ5elRLd1NvaVRLS3VlM0JOSmp5Y1VWV200eWo1VEZBM2lwcGtGalVMa0da?=
 =?utf-8?B?ZkFDdXh2bGV0ZHhuUHQ3c0hCV1Q0MTd1UnVmNkZLOTQyS1B5NzZ1Mm4xT3c1?=
 =?utf-8?B?dWl0bkUvTFNDMXhqSFNGZ1VwVVl0Z0xhNlkzTTUyTm1wQVFMZzVYY0pDVHJM?=
 =?utf-8?B?Ui8vWlhxa2lDWDBSaU1KMmpmV1E3S0poaEtxWUdRa2daU2lKYjhYQVc5ZDQ0?=
 =?utf-8?B?dXZZc2lSRnFXekQzVEtnNzRDY1diVUM2YXc5SDU3QnJzMDc0NXNaMGJFeDBH?=
 =?utf-8?B?dFl3Zk03NmFTVHB5K2NGdlJzYzVuMkdtWDRGQ1hDRGJFZE1aUXNtd0JhWUp2?=
 =?utf-8?B?NWlpdEY4dDlQRVJodHhHN3hkTFF3blpxQ0pVVkh1MGFHTmxvc0JkWklCSkll?=
 =?utf-8?B?WU56MmMvYnJSR3p6YzcwUDBBWU9xRDdQeWw1RFRWVFp1RWRxMHN0b1IxNXlO?=
 =?utf-8?B?RTF6ZE5xRlFwRlAwVHJmZytkMGhkOFN2TGJ3OEI3WjRYa244ZzdQRFNpYzh1?=
 =?utf-8?B?QW9GUkJicTkzQk03czZsVjA4ZDAzRFRnT2R5cGFxMHBqWFo3bTRyendhOVpK?=
 =?utf-8?B?cWdIMmROVW9MclpURjAvc21jano4elZGOStZbGc3ZWJrd0RERWExUm54dTNT?=
 =?utf-8?B?dXJ3VWNVN0pEYXhlVk1qdWxSTHVaRm5VMXBhVW1kMkI5dVpOYlJpZ3R3d0kx?=
 =?utf-8?Q?cOnMUw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:36:20.6275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2424bb3d-832f-4dd9-2ec7-08ddd50fc1ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590
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

Applied to drm-misc-next

On 8/5/25 11:55, Mario Limonciello wrote:
> On 8/3/25 2:14 PM, Lizhi Hou wrote:
>> The suspend and resume callbacks for pm and runtime pm should be same.
>> During suspending, it needs to stop all hardware contexts first. And
>> the hardware contexts will be restarted after the device is resumed.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> (I had an email transmission mistake, sorry if this is recieved twice 
> by anyone.)
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c        | 59 ++++++++++----------
>>   drivers/accel/amdxdna/aie2_pci.c        | 37 +++++++++++--
>>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>>   drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
>>   drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
>>   7 files changed, 73 insertions(+), 134 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 2cff5419bd2f..910ffb7051f4 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -46,6 +46,17 @@ static void aie2_job_put(struct amdxdna_sched_job 
>> *job)
>>       kref_put(&job->refcnt, aie2_job_release);
>>   }
>>   +static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
>> +{
>> +     hwctx->old_status = hwctx->status;
>> +     hwctx->status = HWCTX_STAT_STOP;
>> +}
>> +
>> +static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
>> +{
>> +    hwctx->status = hwctx->old_status;
>> +}
>> +
>>   /* The bad_job is used in aie2_sched_job_timedout, otherwise, set 
>> it to NULL */
>>   static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct 
>> amdxdna_hwctx *hwctx,
>>                   struct drm_sched_job *bad_job)
>> @@ -89,25 +100,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev 
>> *xdna, struct amdxdna_hwctx *hw
>>       return ret;
>>   }
>>   -void aie2_restart_ctx(struct amdxdna_client *client)
>> -{
>> -    struct amdxdna_dev *xdna = client->xdna;
>> -    struct amdxdna_hwctx *hwctx;
>> -    unsigned long hwctx_id;
>> -
>> -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    mutex_lock(&client->hwctx_lock);
>> -    amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> -        if (hwctx->status != HWCTX_STAT_STOP)
>> -            continue;
>> -
>> -        hwctx->status = hwctx->old_status;
>> -        XDNA_DBG(xdna, "Resetting %s", hwctx->name);
>> -        aie2_hwctx_restart(xdna, hwctx);
>> -    }
>> -    mutex_unlock(&client->hwctx_lock);
>> -}
>> -
>>   static struct dma_fence *aie2_cmd_get_out_fence(struct 
>> amdxdna_hwctx *hwctx, u64 seq)
>>   {
>>       struct dma_fence *fence, *out_fence = NULL;
>> @@ -141,9 +133,11 @@ static void aie2_hwctx_wait_for_idle(struct 
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
>> @@ -151,15 +145,19 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx 
>> *hwctx)
>>        * and abort all commands.
>>        */
>>       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    aie2_hwctx_wait_for_idle(hwctx);
>> -    aie2_hwctx_stop(xdna, hwctx, NULL);
>> -    hwctx->old_status = hwctx->status;
>> -    hwctx->status = HWCTX_STAT_STOP;
>> +    guard(mutex)(&client->hwctx_lock);
>> +    amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> +        aie2_hwctx_wait_for_idle(hwctx);
>> +        aie2_hwctx_stop(xdna, hwctx, NULL);
>> +        aie2_hwctx_status_shift_stop(hwctx);
>> +    }
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
>> @@ -167,8 +165,11 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
>>        * mailbox channel, error will return.
>>        */
>>       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    hwctx->status = hwctx->old_status;
>> -    aie2_hwctx_restart(xdna, hwctx);
>> +    guard(mutex)(&client->hwctx_lock);
>> +    amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> +        aie2_hwctx_status_restore(hwctx);
>> +        aie2_hwctx_restart(xdna, hwctx);
>> +    }
>>   }
>>     static void
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 3474a8d4e560..6fc3191c3097 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -440,6 +440,37 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>       return ret;
>>   }
>>   +static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>> +{
>> +    struct amdxdna_client *client;
>> +
>> +    guard(mutex)(&xdna->dev_lock);
>> +    list_for_each_entry(client, &xdna->client_list, node)
>> +        aie2_hwctx_suspend(client);
>> +
>> +    aie2_hw_stop(xdna);
>> +
>> +    return 0;
>> +}
>> +
>> +static int aie2_hw_resume(struct amdxdna_dev *xdna)
>> +{
>> +    struct amdxdna_client *client;
>> +    int ret;
>> +
>> +    guard(mutex)(&xdna->dev_lock);
>> +    ret = aie2_hw_start(xdna);
>> +    if (ret) {
>> +        XDNA_ERR(xdna, "Start hardware failed, %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    list_for_each_entry(client, &xdna->client_list, node)
>> +        aie2_hwctx_resume(client);
>> +
>> +    return ret;
>> +}
>> +
>>   static int aie2_init(struct amdxdna_dev *xdna)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>> @@ -901,8 +932,8 @@ static int aie2_set_state(struct amdxdna_client 
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
>> @@ -910,6 +941,4 @@ const struct amdxdna_dev_ops aie2_ops = {
>>       .hwctx_config   = aie2_hwctx_config,
>>       .cmd_submit     = aie2_cmd_submit,
>>       .hmm_invalidate = aie2_hmm_invalidate,
>> -    .hwctx_suspend  = aie2_hwctx_suspend,
>> -    .hwctx_resume   = aie2_hwctx_resume,
>>   };
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 385914840eaa..488d8ee568eb 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -288,10 +288,9 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
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
>> -void aie2_restart_ctx(struct amdxdna_client *client);
>>     #endif /* _AIE2_PCI_H_ */
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
