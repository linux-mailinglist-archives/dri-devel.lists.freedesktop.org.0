Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B7B194F0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 21:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A6C10E00A;
	Sun,  3 Aug 2025 19:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w+gRoSCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7A10E00A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 19:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFByox3DASgfSE1EDxQ06EOjff3WiAqrhScOkhdHbI+0xhVRd/YFpKu52CtahlJjHpD3is5OXHkTZGjJ0f2rZLdk66oMY941r7jS+1zw8DdNlsvElfgHt30nXkx8J1cPxHSjqp6n8zV0qC4m7S/TD//wLkqtIASptzHin+q9Abiz8FMzC8YBUYwmMG9NVZ/CfE4yJ/nAceYHY1yXgNvEeQosiL9qikf9RyyiS0bPn62uYQ8H31m6OjPJyN1R2ymReh1Ddm3ipg3HND21O2h0qQqmo2L2BE3amSNqJLvSqhRa5WS6upe/WzIfTsayFZ4L2FfWvR7Hk6pq5TVElKVfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1k4wgzQ4mK7Qschg+EYUq3Co7Q+eOQPZvZ4YOwmwmg=;
 b=rFirP5WMUH26ipEze7yvU6Ervt3nK67Ri9NgD6AgDwSPYRNlTjFk4A22wjmmQ5bI0WX2+6z5bBCchPsqdaDxdujmtv5s9ac8wk68cnbTX5OOVJs5G+ETdh7GoqMnVCNVpo89MFboO8a5N9fKCYxn4aJkngH/83Gfk9EHf7uGYbLH78q+4RhMI9RPF8QdozTo8YwQtqtogDh/4tAAl2PKUb0ZiMkN0Rzj+SCbine2gJ73HkiJPpvtyqUyNbVqe+vY9Z0XtOM4s3FP2QvXec2z4Pd1dSuugLM3dQ4hNsdn0wEx0SYtzy14VUNGxIBN+gEdHWzrzre5Enj7u8IXdHCuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1k4wgzQ4mK7Qschg+EYUq3Co7Q+eOQPZvZ4YOwmwmg=;
 b=w+gRoSCKaRKqBz47sAua+1vhVA+/leOhkWTahay8BKRcYgSa6LRhw1th1KbmQpHRWmen/4oToXi4OcwgCL9iMftcH+6kucORCXJiElMzmj6YWS7Kv65ZG3mSGCnxUNQPEwm060JkLfRM/IqRlzzwis55/CQizfL3C637amrkXO0=
Received: from BL1P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::22)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 19:13:21 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::33) by BL1P223CA0017.outlook.office365.com
 (2603:10b6:208:2c4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 19:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.0 via Frontend Transport; Sun, 3 Aug 2025 19:13:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Aug
 2025 14:13:20 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 3 Aug 2025 14:13:19 -0500
Message-ID: <f3337f36-0dfe-a103-5198-3fb640750adf@amd.com>
Date: Sun, 3 Aug 2025 12:13:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250731163550.960686-1-lizhi.hou@amd.com>
 <84335bcc-b7a6-4a4a-ac80-2bd6062e2dd5@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <84335bcc-b7a6-4a4a-ac80-2bd6062e2dd5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: adc515cd-e30f-4d6f-1642-08ddd2c1cf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFNUanR2ZFVHM0NTcjM0dHRxTmVZd1VYZ2lEeXNESWxxbk12QTVvSDFjN1dI?=
 =?utf-8?B?a3Z3L3lUM2Nka0g5TTlENmJOblZGaVdwMS9EVTBwOGRzdU9LYVFzSmdSRUg0?=
 =?utf-8?B?ajRiMmpXTHN1ejVOLzE0Y2JaRmszWlZVdURDSmMwQ0luSXJsajRrWExDaFd3?=
 =?utf-8?B?VGI5RldSa2hOaWZmaGNGalpORW81Tk0wQjdldDRuRVB0R0N0a3c3emQrQVoz?=
 =?utf-8?B?ZldCTktlNE1TeldiUGJFU3EzS25HZzdIOTJJQUxUdHhycUNvOXc3NUhFUU5Y?=
 =?utf-8?B?UEVvcGlZODhwRy9iVHJmK3lXRk1MNzZGWjhuY0d4YWVQTm01QU9CRGROczhW?=
 =?utf-8?B?TDhvQXdMUFRZUThvZDVtUTV6bW4za2Y4VUZINGtOZHRyOGhIdTYxVUwrTGVO?=
 =?utf-8?B?YkJRd25WR0haOXREaEEydGtDejdRV1doclBYc0Q2bVJDbXpqNWVPUVRyK2xN?=
 =?utf-8?B?OHQ0SWV5bkhibkMxd3dMOTROaGxNNis0QW1qT0pleGlMWVRkYlNFOW94eStO?=
 =?utf-8?B?S1VLSi9CZFNVZnZmcXgvNEE3YkFnL3FVQjd4djMybUJIRW9SRlU0NW9WR0JR?=
 =?utf-8?B?eFJURll5c0tFYU84YWZteEJHbDNtUktDZk1lcVh5dFM2a1l3c3hzakIzOVF3?=
 =?utf-8?B?QXdUTGR0bjNPVklrVEhWcXZZa1BudnJsdU9CQkxOLzhIQjlLRTVLZ1VFaG5v?=
 =?utf-8?B?Z25RRGxSMGdRYlU5ZDRka0VWL2ZDNnVKdUl1Z2c0WW14eWZjcmowSFBNb0NB?=
 =?utf-8?B?N3ZjdHY3RmVxZkx4VWZWUFkvVm0rNlA4S213VmFHeS85RlVpYUlwTnNVN1Qy?=
 =?utf-8?B?dzI0cVg5VjZ4VHQrbmlDazd1ZzU2UGp5WksxRS9yTnk2RzFRR1pZVE4ycEUw?=
 =?utf-8?B?WG1RRm01RjFXTElzVmpWdklwWVdUYmN2a2psZmZZNXBTeldWejZJY0hnbDRN?=
 =?utf-8?B?ZUFiQTlET1dhR1FxMUhaN3MwMTd3dU4vd0V3c09pSDVCL2FSRDZLQVVpRnUx?=
 =?utf-8?B?bVQrOWxpdXpOb09qOXk2a3ZWZUkzRzRZM1k4MWVNRnNDTlZoR1JyS1ByTGZU?=
 =?utf-8?B?Y0NXbm0rVWdhVTFDYW1aczRBMGRDSGorMEdudUROUVJkckYzYmRiUjd0cUNL?=
 =?utf-8?B?K3VqTjVIZWZYSFFNcDgzRFFGYTNTY25QL2szMm5TQk1vM0NReHl0b0RQQlRq?=
 =?utf-8?B?UG9yaWNlVklwWlJvSEMwbWdxZ0hyMStxV09mTU1QaFRNZmJWOEJuYW9JNlhi?=
 =?utf-8?B?U0RYR0VzbG5WejUramNYdk5RRjhoYzFsOUMwbUI3bHZKMENpWjZXcEZlRHF5?=
 =?utf-8?B?dXBreVFjUUtubi9LclRua3dwb1NrNlFIU2tSOGZWbU1sSVRPaFRXZWdPd1lo?=
 =?utf-8?B?OG1ienRpZFNUT2IvZ2NGb2xvSnZMcGZJYWJRa1FKcExkOXkvV0JrbGh5Z2tL?=
 =?utf-8?B?dWtZYjVYaFN2bGFsS0x4S21EZ2VONzBZclNkNzJUQkRUYWZuNk1VLzNhSjV4?=
 =?utf-8?B?WTMyYkxPTGdqWURDVTZSSUh2dThyRHZPVC9Venh2L2xnYUg3ZktQWFB1UWJL?=
 =?utf-8?B?MWhjUW5uQUQvY2JnSEhzMWNjTjhkTnAwbkhMYVpMVXVLSEp3MjZxMTM0ZUEw?=
 =?utf-8?B?bTlaRkxNRmNWaTNMdG1SUWp6R01sUmNWRU5xUmhSSGs4cXFLRzdUQkNzdlNN?=
 =?utf-8?B?UnRsdUl3ZkdkRWw1UHRMdUFmQzYrWmlUOWNQR0oydHJ1ZFpoZzU5MjJtdng0?=
 =?utf-8?B?ekgrWTZDanhPZDZsYmgxYjJRUG05bC9JUDJkMEZJQkJMWlYyb2Rva0dtZ1pC?=
 =?utf-8?B?UElHcWN0bmRmcmhxaVRtSVlEUmI3SkhEdVIxZUJLb1ZXKzNvRHE3T3EwZXNj?=
 =?utf-8?B?QW5lM0tVcG9jcTlyNGg2YS9Wc2ZBc3E2cXQ2UXlnaXVmVERmRUJsdTZIcVd0?=
 =?utf-8?B?RGNJOTFHWjBFek8xQld2eS95TFR2bkdUbmJDMTBtTi8zRlZKWmVJTGNDNVlk?=
 =?utf-8?B?MnhrRXdwWk1ScTRYcmEwOXk5MS9PaDd1eGxWMk12RjRqS2R1VWFleWtlWFFR?=
 =?utf-8?Q?kewjFD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 19:13:20.5151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc515cd-e30f-4d6f-1642-08ddd2c1cf57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
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


On 8/1/25 07:48, Falkowski, Maciej wrote:
> On 7/31/2025 6:35 PM, Lizhi Hou wrote:
>
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
>
> nit: You might refactor this status shift for maintainability to 
> something like
> aie2_hwctx_shift_status(HWCTX_STAT_STOP);
>
> But that is just a nit, otherwise
>
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Thanks. I will cleanup.


Lizhi

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
> Best regards,
> Maciej
