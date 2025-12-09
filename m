Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92633CB0F9F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 20:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBC810E5C9;
	Tue,  9 Dec 2025 19:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HWbWVpxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013019.outbound.protection.outlook.com
 [40.93.196.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023B10E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 19:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekcmtEd+ap/yvi7QXFFIzgre+MDFHRnqo/eoH/pAnf7vP0yBPfMHSrkrk1xPm0i9bjVelGRwVhsXvRT7wpm3+CSMs9jSo/L6L0ASej/xacT43aeDpdsrL+Yd5lM19VFTDo5VjZ6c4aD858k9eU3LVe8oZFishk2pVRKWyseJKH6QbCopMhIS/PPB2OEiW8bkKRSKnApnw9n84qr1V4UndvHwOFhEPOFBSGRYYtZ/hF30PHrF+z1NcUm8f7AP+tu9QwOE4xIIsHIibHXcQb7m04+yG34NMjiI5j2Q4cXsAdIXd5zhduwVryvs+X6gxbZHaELA7f8q0YogN5RtuybzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19BTPbpTjoyHg66l6vv8+buc7be0vIMi3mT31Y0Mz6w=;
 b=FNzlHSIzKgozSt41ZURJgmjDTvVZ+mMHdMrS8OwtcfKpumsydD1I04/hRqpyyPYXseSNNI/8FEgiwaVW/vWwqKgboPe3rNY5IcnBkbTxhPJh8jtU39qmY4ltBrj4qYAgwF2a9dCGYxCVbUaLmuuHOYNlWPN0PHyYdGt2WD+37QcMO10OGHrrGQF5s+uQ3wRZNXuqJ7zo02hTLFotcFVkVl9mPUQiQxWbtUPGJlM41wKTJKgrIduhssdnRwT5Rt2QrH5L4+R5mXjjoKo5JjXZh1T3TNcbMki9lmrk3Ubj+vQ+naNC/7z0dcInfXazdQYqXkyI7mIEU3HjZKP9K4TShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19BTPbpTjoyHg66l6vv8+buc7be0vIMi3mT31Y0Mz6w=;
 b=HWbWVpxeJ9ZK43XIkwrswCjpnAbuedIeLWFwOtQ0Vg8+cPoVYPvWjSFXfJ62qcoiLTSa7gOKvcWcOBWKnzt16/wd7Fcf2hnts/CAjzQBgn6Hmc+j8LmNb9uHF1N21weY+QO2MI8vtVxvgdrYj4+AoenSDFFIFMYCQuFMDGvcV0Q=
Received: from DM6PR06CA0077.namprd06.prod.outlook.com (2603:10b6:5:336::10)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 19:55:58 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::27) by DM6PR06CA0077.outlook.office365.com
 (2603:10b6:5:336::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 19:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 19:55:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 13:55:57 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 11:55:57 -0800
Message-ID: <de19aefd-7e46-5653-b4b9-71a811597347@amd.com>
Date: Tue, 9 Dec 2025 11:55:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Fix race condition when checking rpm_on
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20251208165356.1549237-1-lizhi.hou@amd.com>
 <4b3b19a6-1569-4647-ae88-e5de496d4e0d@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4b3b19a6-1569-4647-ae88-e5de496d4e0d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b6f28d-8860-4351-66b0-08de375cf8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVJPZ0NXRG4xWEN5T25ZcVRNRGdSNFV6ZndZQXJUUTJ5NGk4YzdWUGo3M2hJ?=
 =?utf-8?B?eTIwNHRVNEd0R0RLMURESU1pc01nVVRxcGxBUURlSTcraXhxbUpVaDhJZHdR?=
 =?utf-8?B?YURRRGtydEphTTZKR0V2QktzdTdvcFlraFJRWVFXbkxlMmFWOU1HTWc2dGI0?=
 =?utf-8?B?QkFYSzUvN05vbEx1U05Qc3dic3UzZGpoQTdXOWVUWmJndG44aVpEMDhNdkpN?=
 =?utf-8?B?L2FUeS9jYmVNc0htMVRGdzRrU2NJV1Z2RVJ3TmI4a1o5MXV4c0l0SlE3VFdP?=
 =?utf-8?B?SmRtNjFORFp4UTR0SGd4NjdSem8yQmlYSTljakZyWmF5ak5VOVJTV09CSjVB?=
 =?utf-8?B?eDFweFcyT09DK3RuS0pBeFVQa2VXN1d4azRWa1B1RHFhcm1obTNFdW5ISE92?=
 =?utf-8?B?Q3JaRmROUG1wV0dYR1RLRUlUNHl5ZUJXc1dpYW5RR3F0d3UxanFUOEV4ZjRF?=
 =?utf-8?B?NnVYREthSzJaMFJpK2plWXhYT2lQQ1p4ZXNBNkZvRk5jTnpsemgvSzh3V0pu?=
 =?utf-8?B?T3NFRGVENTRCK2M4VUF4V3grbTNJOEM1dFE4Yk95MmNrQzB3Rk1SNnVpdGFP?=
 =?utf-8?B?N2ZaK3dGTnlkWk1xMzlVL0dsZ1V3OWdBanZBdW9pZ2JTWU1vRXQ0MWpkdHNZ?=
 =?utf-8?B?by93a0ZaSXRZZFNKUUFVZC9lUzk1dHg4bjRzQTIwd005U1dLODc5Y0ZLdktN?=
 =?utf-8?B?YkJCcjcxT09uNTRSRGVFRUxqZWtiL0VvRVlwSDRrWTBqQXhyNjdMb0FsTkNZ?=
 =?utf-8?B?ck1OMUszcVU2UUZiMitNdGZvcjkzaGZ5OUNYb3VadFBqNzBVc2dUOFZXMVo3?=
 =?utf-8?B?YTVJSG0vZFAxMEpkem5QK1ZFSHF3YmZXNmdMdmVQNy94Qy9IMkhKWE5YbG9a?=
 =?utf-8?B?eEdSZXRGM21YRzhZUCtrUkRCRVpSdEhTY09iQjFkc1FqWm9JSEo1YTd0aVpG?=
 =?utf-8?B?RXo4a0dtaHJvK01PM1Zsbm1tdnFESHQ1NDhyYW5aYm5uNkxVajZSNE1tV2N2?=
 =?utf-8?B?WDhIS3BNY25DWUNCVXZSUUxNVUZvR21heldZQXdMbklUanJDUThSU2xuVHNa?=
 =?utf-8?B?Wk9ibVdqUGhLVTBrb0RWZ0JCWk5rYnpMMU1wb2pCbzVRemgrcXhCdjZERHdh?=
 =?utf-8?B?RHBPdmJTTlB4S0lCTUlzbU9IQVhuKzdORS9Dck5hMUR2ZXQ5OHA4bmpwZ3Vj?=
 =?utf-8?B?YUJqdStSTlk4R3Ftb1VxMkNRL2lZZFA1MzltV1p1eTJmalRydHVKVFBXeUc4?=
 =?utf-8?B?aUQ0UWxjMzRyL0lwZW5QdDY4SWRUSmIyTXJNV2UzZHBzanFLRjR0VTlZMVo5?=
 =?utf-8?B?REU0YlEyREFmZnBzb3BNKzMzcXVJYWVYdzFsS09PbFBuWUtUNTBrbjZITFFw?=
 =?utf-8?B?TE9seUtiMjN0dStMaHFFNzd2d05hV1YzMzRtcVFIdGR4SkZmajhTZTdpRWk2?=
 =?utf-8?B?dzhiNGhwUnFtQldRNGI0OVUwM2JEVTR4SkxaRUVyMnB6N1JnSWVRbWlXTUwx?=
 =?utf-8?B?Zk56T0NHL0RyNW4vRVFCbnFCbFNuam81dFJMQlJ3WUlHZ05kTnBJVnhqck11?=
 =?utf-8?B?eXJhcjZwSmxhTUtsY3lIL0NqLy90YndudmVmRzBkTDJwT2huMEdrUkFJbkpv?=
 =?utf-8?B?ZHZMVkpiRFQ0cFcxNEVZdjZiNHVoRXlvc1hhZFd0SDduT0FBV2pzdm9xc1Rt?=
 =?utf-8?B?VHVieHdLVE1rUFd1aUE3Sk9JZUVkaW9wU3ZMZVZLMVhuWDlnTGtrRlo4dWpC?=
 =?utf-8?B?VVhDdjJYclh0KytMdENGSDNxUXZnWHNrZzdtUUdGSWlSUXZUSmx1dUR5YkhZ?=
 =?utf-8?B?MHJmVnVIZElsa2pBVUw3NnFJNGN1OEQxbEk0WEM2LzF1QnR0bUcyTWpCcTcw?=
 =?utf-8?B?S29LRVJyV3VRR0xKTVNLK3I0Z29ZV3dlTk5GZzFGWkRGVnMwa0ZnVEF2NjAw?=
 =?utf-8?B?NkV1NHhWR3RyT0NlWE1jZlg4cEZOTlV6MFFNUk41M3BuOGkxWFVSMDR3WktE?=
 =?utf-8?B?K08xQ25LSjNwNzEwZ0lzUGQyLzBwQXh0WGFhMFVKaC91c3ZsU0pJU29LUTVJ?=
 =?utf-8?B?SzBKbllIRWNOTVBEM0Iva0lLaGtXWTFSUTdxV2kvOG9LR1NoKzY5L3dIa1J3?=
 =?utf-8?Q?MoQQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:55:58.3576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b6f28d-8860-4351-66b0-08de375cf8d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
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

Applied to drm-misc-next.

On 12/9/25 00:28, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 12/8/2025 5:53 PM, Lizhi Hou wrote:
>> When autosuspend is triggered, driver rpm_on flag is set to indicate 
>> that
>> a suspend/resume is already in progress. However, when a userspace
>> application submits a command during this narrow window,
>> amdxdna_pm_resume_get() may incorrectly skip the resume operation 
>> because
>> the rpm_on flag is still set. This results in commands being submitted
>> while the device has not actually resumed, causing unexpected behavior.
>>
>> The set_dpm() is called by suspend/resume, it relied on rpm_on flag to
>> avoid calling into rpm suspend/resume recursivly. So to fix this, remove
>> the use of the rpm_on flag entirely. Instead, introduce 
>> aie2_pm_set_dpm()
>> which explicitly resumes the device before invoking set_dpm(). With this
>> change, set_dpm() is called directly inside the suspend or resume 
>> execution
>> path. Otherwise, aie2_pm_set_dpm() is called.
>>
>> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>> v2:
>>      Removed drm_WARN_ON() from aie2_send_mgmt_msg_wait().
>>      Revise the description.
>>
>>   drivers/accel/amdxdna/aie2_message.c    |  1 -
>>   drivers/accel/amdxdna/aie2_pci.c        |  2 +-
>>   drivers/accel/amdxdna/aie2_pci.h        |  1 +
>>   drivers/accel/amdxdna/aie2_pm.c         | 17 +++++++++++++++-
>>   drivers/accel/amdxdna/aie2_smu.c        | 27 ++++---------------------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  1 -
>>   drivers/accel/amdxdna/amdxdna_pm.c      | 22 ++------------------
>>   7 files changed, 24 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index fee3b0627aba..a75156800467 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -39,7 +39,6 @@ static int aie2_send_mgmt_msg_wait(struct 
>> amdxdna_dev_hdl *ndev,
>>       if (!ndev->mgmt_chann)
>>           return -ENODEV;
>>   -    drm_WARN_ON(&xdna->ddev, xdna->rpm_on && 
>> !mutex_is_locked(&xdna->dev_lock));
>>       ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>>       if (ret == -ETIME) {
>>           xdna_mailbox_stop_channel(ndev->mgmt_chann);
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index ceef1c502e9e..81a8e4137bfd 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -321,7 +321,7 @@ static int aie2_xrs_set_dft_dpm_level(struct 
>> drm_device *ddev, u32 dpm_level)
>>       if (ndev->pw_mode != POWER_MODE_DEFAULT || ndev->dpm_level == 
>> dpm_level)
>>           return 0;
>>   -    return ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
>> +    return aie2_pm_set_dpm(ndev, dpm_level);
>>   }
>>     static struct xrs_action_ops aie2_xrs_actions = {
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index cc9f933f80b2..c6b5cf4ae5c4 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -286,6 +286,7 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level);
>>   /* aie2_pm.c */
>>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
>>   int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum 
>> amdxdna_power_mode_type target);
>> +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>     /* aie2_psp.c */
>>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct 
>> psp_config *conf);
>> diff --git a/drivers/accel/amdxdna/aie2_pm.c 
>> b/drivers/accel/amdxdna/aie2_pm.c
>> index 426c38fce848..afcd6d4683e5 100644
>> --- a/drivers/accel/amdxdna/aie2_pm.c
>> +++ b/drivers/accel/amdxdna/aie2_pm.c
>> @@ -10,6 +10,7 @@
>>     #include "aie2_pci.h"
>>   #include "amdxdna_pci_drv.h"
>> +#include "amdxdna_pm.h"
>>     #define AIE2_CLK_GATING_ENABLE    1
>>   #define AIE2_CLK_GATING_DISABLE    0
>> @@ -26,6 +27,20 @@ static int aie2_pm_set_clk_gating(struct 
>> amdxdna_dev_hdl *ndev, u32 val)
>>       return 0;
>>   }
>>   +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>> +{
>> +    int ret;
>> +
>> +    ret = amdxdna_pm_resume_get(ndev->xdna);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
>> +    amdxdna_pm_suspend_put(ndev->xdna);
>> +
>> +    return ret;
>> +}
>> +
>>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
>>   {
>>       int ret;
>> @@ -94,7 +109,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, 
>> enum amdxdna_power_mode_type
>>           return -EOPNOTSUPP;
>>       }
>>   -    ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
>> +    ret = aie2_pm_set_dpm(ndev, dpm_level);
>>       if (ret)
>>           return ret;
>>   diff --git a/drivers/accel/amdxdna/aie2_smu.c 
>> b/drivers/accel/amdxdna/aie2_smu.c
>> index bd94ee96c2bc..2d195e41f83d 100644
>> --- a/drivers/accel/amdxdna/aie2_smu.c
>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>> @@ -11,7 +11,6 @@
>>     #include "aie2_pci.h"
>>   #include "amdxdna_pci_drv.h"
>> -#include "amdxdna_pm.h"
>>     #define SMU_RESULT_OK        1
>>   @@ -67,16 +66,12 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>       u32 freq;
>>       int ret;
>>   -    ret = amdxdna_pm_resume_get(ndev->xdna);
>> -    if (ret)
>> -        return ret;
>> -
>>       ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
>> ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>>                ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
>> -        goto suspend_put;
>> +        return ret;
>>       }
>>       ndev->npuclk_freq = freq;
>>   @@ -85,10 +80,9 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>>                ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
>> -        goto suspend_put;
>> +        return ret;
>>       }
>>   -    amdxdna_pm_suspend_put(ndev->xdna);
>>       ndev->hclk_freq = freq;
>>       ndev->dpm_level = dpm_level;
>>       ndev->max_tops = 2 * ndev->total_col;
>> @@ -98,35 +92,26 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>            ndev->npuclk_freq, ndev->hclk_freq);
>>         return 0;
>> -
>> -suspend_put:
>> -    amdxdna_pm_suspend_put(ndev->xdna);
>> -    return ret;
>>   }
>>     int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>>   {
>>       int ret;
>>   -    ret = amdxdna_pm_resume_get(ndev->xdna);
>> -    if (ret)
>> -        return ret;
>> -
>>       ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, 
>> dpm_level, NULL);
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret %d ",
>>                dpm_level, ret);
>> -        goto suspend_put;
>> +        return ret;
>>       }
>>         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, 
>> dpm_level, NULL);
>>       if (ret) {
>>           XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
>>                dpm_level, ret);
>> -        goto suspend_put;
>> +        return ret;
>>       }
>>   -    amdxdna_pm_suspend_put(ndev->xdna);
>>       ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>>       ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>>       ndev->dpm_level = dpm_level;
>> @@ -137,10 +122,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, 
>> u32 dpm_level)
>>            ndev->npuclk_freq, ndev->hclk_freq);
>>         return 0;
>> -
>> -suspend_put:
>> -    amdxdna_pm_suspend_put(ndev->xdna);
>> -    return ret;
>>   }
>>     int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index c99477f5e454..0d50c4c8b353 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -101,7 +101,6 @@ struct amdxdna_dev {
>>       struct amdxdna_fw_ver        fw_ver;
>>       struct rw_semaphore        notifier_lock; /* for mmu notifier*/
>>       struct workqueue_struct        *notifier_wq;
>> -    bool                rpm_on;
>>   };
>>     /*
>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c 
>> b/drivers/accel/amdxdna/amdxdna_pm.c
>> index fa38e65d617c..d024d480521c 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pm.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
>> @@ -15,14 +15,9 @@ int amdxdna_pm_suspend(struct device *dev)
>>   {
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>> -    bool rpm;
>>   -    if (xdna->dev_info->ops->suspend) {
>> -        rpm = xdna->rpm_on;
>> -        xdna->rpm_on = false;
>> +    if (xdna->dev_info->ops->suspend)
>>           ret = xdna->dev_info->ops->suspend(xdna);
>> -        xdna->rpm_on = rpm;
>> -    }
>>         XDNA_DBG(xdna, "Suspend done ret %d", ret);
>>       return ret;
>> @@ -32,14 +27,9 @@ int amdxdna_pm_resume(struct device *dev)
>>   {
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>       int ret = -EOPNOTSUPP;
>> -    bool rpm;
>>   -    if (xdna->dev_info->ops->resume) {
>> -        rpm = xdna->rpm_on;
>> -        xdna->rpm_on = false;
>> +    if (xdna->dev_info->ops->resume)
>>           ret = xdna->dev_info->ops->resume(xdna);
>> -        xdna->rpm_on = rpm;
>> -    }
>>         XDNA_DBG(xdna, "Resume done ret %d", ret);
>>       return ret;
>> @@ -50,9 +40,6 @@ int amdxdna_pm_resume_get(struct amdxdna_dev *xdna)
>>       struct device *dev = xdna->ddev.dev;
>>       int ret;
>>   -    if (!xdna->rpm_on)
>> -        return 0;
>> -
>>       ret = pm_runtime_resume_and_get(dev);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Resume failed: %d", ret);
>> @@ -66,9 +53,6 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna)
>>   {
>>       struct device *dev = xdna->ddev.dev;
>>   -    if (!xdna->rpm_on)
>> -        return;
>> -
>>       pm_runtime_put_autosuspend(dev);
>>   }
>>   @@ -81,14 +65,12 @@ void amdxdna_pm_init(struct amdxdna_dev *xdna)
>>       pm_runtime_use_autosuspend(dev);
>>       pm_runtime_allow(dev);
>>       pm_runtime_put_autosuspend(dev);
>> -    xdna->rpm_on = true;
>>   }
>>     void amdxdna_pm_fini(struct amdxdna_dev *xdna)
>>   {
>>       struct device *dev = xdna->ddev.dev;
>>   -    xdna->rpm_on = false;
>>       pm_runtime_get_noresume(dev);
>>       pm_runtime_forbid(dev);
>>   }
