Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C3A73B71
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 18:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA48C10E0E0;
	Thu, 27 Mar 2025 17:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="POVud3ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2C10E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 17:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjaRsctnKHUeqhGiVJs5duQB+/iA2dDyPtl/Lw0P7qdAK1krwGemdlJCeefnG9s7/cp32MjehCrW61Dobu5QxpU4FsBmItbtDuWB47Km7PMNCmF+DNfP3jjMaj6JEyD+ofXjAc7iQY2THG3ZFapC+2DuOda+XRqtdg2X00SWeoG6xXt39T6OGtxDrm/rIhmQmA/gf0xXdvD6iNEu9K/Alr2VbmEa+9GkOZbjjfDQPtUQAeXb2nRVYq4XhsHc76E2oTiQTsJTL/ObODhgzIVsfK1+rg1cueZzJy/pgmid3z58MaIUFrOsW2v9W/ieItg7UU2fh4NrrztD9OqfcUnrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kaf/YUIzffoDGRYwpo5C22Fjfltz4LsutCtr2lsx5w=;
 b=shmzlVa4IUyuFV4zRFLdWPcI5doVg9KfRSM7ydGYHZVP+PbVSwhwuHgf0nrlj7nCI5aydyWAWFOAjTzOcJ7QrAq0m2edA75w51TlwiHUGD3q8qs4/dFtK6ZtDK2sYwhZsYKA5s4ns1tIXF4AIUjuq8Q5AufuCIVsmCnrLtj2ZliPYw+njrxwqznNhRIdwZfTvjT4OUKjEWspC0mA++CXnXM16cv4CTHsKJ0X9DD5L338T7ij24lUaafvlQrBiWDt684ciOtmuCYJCFnlzSFwjaElE1zNtA0E+EzfTdyiT7rTrivEGC6qpWrTbgzumUEzvsc8vlFfDV7Jyx/5Gm7saA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kaf/YUIzffoDGRYwpo5C22Fjfltz4LsutCtr2lsx5w=;
 b=POVud3ec1Kjy8T7ksHK9aQYeP4qs2eukeC99Ysx8JWyBiINTUFJHXlsQV63YDr/dhfdycIdF7YPb5XabKY40/tePdb0UuP42DXXghEye4Jxnf0jxQnm50a86kSbGyoW+Fax0fJoulM/oJj+3GSHXYlNk8yXEH0rfnddXMwqMFjg=
Received: from PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::11)
 by DS0PR12MB8480.namprd12.prod.outlook.com (2603:10b6:8:159::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:38:39 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::20) by PH5P222CA0010.outlook.office365.com
 (2603:10b6:510:34b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.45 via Frontend Transport; Thu,
 27 Mar 2025 17:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 17:38:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 12:38:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 12:38:37 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 12:38:36 -0500
Message-ID: <40a4d432-aa18-6a60-adcc-e73eb3c7fcb7@amd.com>
Date: Thu, 27 Mar 2025 10:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>, <stable@vger.kernel.org>
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
 <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
 <a0d93faa-40e0-4fc9-8b86-1e30c3946124@amd.com>
 <17c82a42-2174-425f-a4c4-4df18176f7a1@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <17c82a42-2174-425f-a4c4-4df18176f7a1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS0PR12MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: ec752d6d-eaa3-475d-301c-08dd6d56353b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qks4Njc1ZWdoTjFISHVTR1VpS1NXRStMNUcwNTJJL2YzVmFLaW53R1R6QU1u?=
 =?utf-8?B?ckFGUndGcFZkS1VwNG55M1J6ZmtFVm93M2R2S1ZzczE4aHZnU280K29mbGhG?=
 =?utf-8?B?djA3bDdEeStPTTIyaHd5UjdLaUdGbVpabG5YYTVhUlp1SDlDR3o2ZUlBV2ps?=
 =?utf-8?B?TGJaa2RpdzN3QU9xek1HNUs0OVhvcjhEVkZiVy9PUTlnZnFkTlgwOFprUzAy?=
 =?utf-8?B?S25rWndjbkRpK0lOb2luMEJ0QTIrc2VCd3BuVVpXd0N5cDd4KzRRT3FxL0dn?=
 =?utf-8?B?YVIrUzB0NVVBaVU0ekJCcHcyS0tLaDJQaUpQaDkyVElMRHFXWWVsNTUrQU9X?=
 =?utf-8?B?SHhpeDRUejd5cCsyblU5TE4zZEloUlVRcnMrMDZib1NqVVJRc2RmTWt4Vzhm?=
 =?utf-8?B?QmNOdDR0WWhSQkZZVWZYQkVXU3VTL0hKb0VWbkJnZkVYQWR2bC8vWjlCeC9T?=
 =?utf-8?B?RDdBL0NDWXd1SFE0OHVDY2RkRzlQZFpIS3ZlTkNqSEVzamFlT1MvTGZMQ0JN?=
 =?utf-8?B?Z2lwMjM3Y2o2TlZieVNzSnJ0QmdjT0lBMkRSY0FlMjY4a1lRajRURWU3cmZL?=
 =?utf-8?B?ell6TW8rcFVTNkJ4MW90T2d0QTV1ajJpNmloYmRTeHY0NXFkWjZ5bU1OZHdo?=
 =?utf-8?B?d1hHV041QTFBV0JUQm1NZkp3UFFQSVI2aTJWQWl4bzUybEUwTVhPeWRBVTk3?=
 =?utf-8?B?MnpCcDRaL29DUk83T0YzV2J3RnhkTUJ6T3NISjdiOGpmaDNSTmNXTXZDMXNH?=
 =?utf-8?B?R1lscWpXaGd2dXhXNWJpbzczWE9Ta3RETTZ4RWJLaGx3aWtqdTBCN25aOXVr?=
 =?utf-8?B?TzNCSEFiamZGdlhhU1pwQU9sSWs4TUtxT1ZvMVYvc1V0bTIwbHU3Uk4xUEl1?=
 =?utf-8?B?NFpvdVpvVFpVQnFzVGZOcURFWTVHV0N5dlo5b0dBeE05SFdkNktST25lM1RM?=
 =?utf-8?B?Snd0U3FmTVduUGN3UVR1a2w4QlBKemN2UEQ5b1YzeFJwU2FVNnpCVzZMWlh1?=
 =?utf-8?B?c0lWR2JuYnBDM2JvbFdzV2U2aWM4dGhlS0lmeWVYSzJEWUxWelBvN2phUU5H?=
 =?utf-8?B?d3A3UFhndnBabHBLZFF3WDZGL0R0VGV1Y0dPZGVwWnlUNSt4RHpGNjEvOElU?=
 =?utf-8?B?V2kyS1FVRENCbGJtWkU1dDdkNVQ1Ry9HYndsY3N1VjBIYnFVVXNEN3QxU251?=
 =?utf-8?B?bkdtdGM4YmRvNDlLSS83T0MzejlSOXVGVEg0bzBqOFpHeW9IaVNYUlp3ZXN4?=
 =?utf-8?B?N2pXZUp6N21Gd0g3ZVhCai93aUUwRDhwdHZwSTZLM0pRVHRMUmNYOUZPOFNG?=
 =?utf-8?B?a3pDREpQQmE3Q2IxS2s3dk5BcWR5bXN0LytNVFpqcHk4MXBMNWV1K2pmMDF0?=
 =?utf-8?B?NlIzTm5wUHFQRlZnVml5bzB2VlQ2VkZEQXJrVWV0dFBpakJaTXRUdjhyTzZa?=
 =?utf-8?B?T0ZLMU5hSlA5QTJTOEh5NmZIUnFhaVFKNGVYUkFrVzUvTTI3WW9TcW00b05Z?=
 =?utf-8?B?cWtRSCt5ZTkrMGdIdkRvbmxvdEd5ZTdHZVVLNmwzQkVhRnB1dWJtUW9CdGk1?=
 =?utf-8?B?L2FIK1BBdkFhZW1jdVp0Z3JPbDcyczMwZFNKUXB5NFJ6MDBLaG9MRFIvMEpL?=
 =?utf-8?B?eXB2KytwS05sYnlML2RnWVVsS0NrVnNZK1NVWDZUTi9ydTJpMzF0blhVR2dJ?=
 =?utf-8?B?TXVpdWZiNEtYcEpQZnk5QzIwOFUxQ0tkaTVCZ1V1VC9RRHhRY1U0dUxyWGlV?=
 =?utf-8?B?aE1QTHY2bnpEY1lzekxZRjRDNGM1Yy9kQ1p1MXNGNHJFcGRzYzZsUnlzeTRQ?=
 =?utf-8?B?ck05V0QraXlyamZXaVRWTFhkUmlGZVdkeHVQZ2FiYy9wTFE2OG9WTnBETDhR?=
 =?utf-8?B?NWJzNTBjU1ZnWWY5Y2lZdmRnZGUwb3J2eDFnUEQvN3RBUXd6ZUJONUkvN3I4?=
 =?utf-8?B?dmhXMVBKbmVmYjVXcURseWpRcWtlODcyQ1hzRFBCeUdCaXhub0hjdWdVQ1RR?=
 =?utf-8?Q?fc4x87pKLrAj3GOjbNuakUoEz9qxD4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:38:38.2758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec752d6d-eaa3-475d-301c-08dd6d56353b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8480
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


On 3/26/25 01:06, Jacek Lawrynowicz wrote:
> Hi,
>
> On 3/25/2025 9:50 PM, Lizhi Hou wrote:
>> On 3/25/25 04:43, Maciej Falkowski wrote:
>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
>>> file_priv->ms_lock is acquired.
>>>
>>> During a failure in runtime resume, a cold boot is executed, which
>>> calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
>>> that acquires file_priv->ms_lock and causes the deadlock.
>>>
>>> Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
>>> Cc: <stable@vger.kernel.org> # v6.11+
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
>>> index ffe7b10f8a76..eb485cf15ad6 100644
>>> --- a/drivers/accel/ivpu/ivpu_ms.c
>>> +++ b/drivers/accel/ivpu/ivpu_ms.c
>>> @@ -4,6 +4,7 @@
>>>     */
>>>      #include <drm/drm_file.h>
>>> +#include <linux/pm_runtime.h>
>>>      #include "ivpu_drv.h"
>>>    #include "ivpu_gem.h"
>>> @@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>>    void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>    {
>>>        struct ivpu_ms_instance *ms, *tmp;
>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>> +
>>> +    pm_runtime_get_sync(vdev->drm.dev);
>> Could get_sync() be failed here? Maybe it is better to add warning for failure?
> Yes, this could fail but we already have detailed warnings in runtime resume callback (ivpu_pm_runtime_resume_cb()).

Will the deadlock still happens if this function fails?


Lizhi

>>>          mutex_lock(&file_priv->ms_lock);
>>>    @@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>            free_instance(file_priv, ms);
>>>          mutex_unlock(&file_priv->ms_lock);
>>> +
>>> +    pm_runtime_put_autosuspend(vdev->drm.dev);
>>>    }
>>>      void ivpu_ms_cleanup_all(struct ivpu_device *vdev)
> Regards,
> Jacek
>
