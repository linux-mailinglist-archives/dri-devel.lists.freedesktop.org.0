Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45CA70BC9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC35B10E5F7;
	Tue, 25 Mar 2025 20:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4iix9jHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C6B10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hu9EQU/eeBmDMs6BmWDOjiu6pspWlcD1v3M4/KgyVXW6yvtU9NNdTUsHSmxmJRMdFGfbLxbEEniRgjnQ2llhckj54kwEiWFrxj7sxBl9bXs1fRh1cLeRncyUyRV0tG9fzjizrul5/8BKqALwyoGxAadZdVdLXyzMi9fckO17hzbmcGWO8SHWq7vcsZ5TH8Xcu8BpF5N0urp8vqwvcbF45ZHSjcnvM6csDkZkcccNqH8qmOnHheR4/x1xB6B4XF5BaVbrNuKHB/S0I7icEgL6Zdn6z/t70QCVR88z5XDCU9Gnpx6x5i9nL+8rJs32mYySxEtOP+c9aCNX9St/XvyA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVt8wvbT7fOYQ/29dy8GtATgejJ0kQrZgDVxbflUYrw=;
 b=TWg6S1XO34RFdkgzWkPuxYg607v6E6tXrFjKjYtUp/x9ftnXrIhnwJ2jWn42F/1SHMGvvjhorbcd58s/bzjEVzhvdlAfeknRIi/9CIjgl0SXoaSR2As+E49hXE7oNG7Bn5I9JWxubMiQYejN91QgGhB4CtMGmW6Qy5UtRS+Mv9kbUKY4ieMUa8eeejpj2VUtjXZPbLaz9IS1IdwU9BarqqMJkclA9axHkhmR1N+F/+OlFDjsICLeVxcM9RZh5yTorDKR1xAHBYNj9a9SXt8IUsAsjlx16IRTK+KSP2ax0k2yynhRaiqrvcT0JdyGMznWVuDimpxKxuGD1iLkmR4Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVt8wvbT7fOYQ/29dy8GtATgejJ0kQrZgDVxbflUYrw=;
 b=4iix9jHKIpltyPZFanYyn3wBynMWcAC2GU1wZNiUdWKzlNm5Qv3dqSVpG5c9a9Xrkg+wGORkxce8Kb8R23HIZzfbDS4FE2le5MrifbgnFZ72akgsdqP4BgbtS4VFSLSx1ZYgt2OQpacJuo35YSgcGCOK80Papku/hO+tn+TP0jQ=
Received: from BN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:408:e6::30)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 20:50:32 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::45) by BN0PR03CA0025.outlook.office365.com
 (2603:10b6:408:e6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 20:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Tue, 25 Mar 2025 20:50:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 15:50:29 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 15:50:27 -0500
Message-ID: <a0d93faa-40e0-4fc9-8b86-1e30c3946124@amd.com>
Date: Tue, 25 Mar 2025 13:50:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <stable@vger.kernel.org>
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
 <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 174e8c7f-71dc-4c25-8b51-08dd6bdeaeca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXc2OHcvS0FpQ25xL1NkUm1VR2JwMEtBSGdQQjExQkFrS3ZkR21iTkpsMC9R?=
 =?utf-8?B?Tk1Ha1hrNmkwYktsUU5zOGVWelhWd0VXM1kyOWRidThud01RdVlWdlZWVmpi?=
 =?utf-8?B?Ti85MFUzc3JrUGc4U1Y3UHBkbVRyb1Z3bHFuRWNBN1orRkxONjBvaCs2VVl3?=
 =?utf-8?B?Skx1TkxpV2E2Z0h5WExEZzdJOWZaR2tUYUNPRTdINEpVbXExTVlSTk8vMUhI?=
 =?utf-8?B?WGc3UFZCeWlVK2JJVW5QaWlkR0JpeWVQdUp1VWtQS2NzRStuLzVtMEpGVFNW?=
 =?utf-8?B?OHhWdjBzbXhYUWF3c0EvWDMwTzJ0MGZlcTlzTEZ0dmdNN1RqdndobUxXaE5i?=
 =?utf-8?B?UjNGR09IZ25zUXVDeVZHUWhUOHNRMTF4YmQwT28vcXFOeng5eTVlNVhZb2lu?=
 =?utf-8?B?TXh3eTdtQ3ZSNzdOemRYc0tzSkVLbTViU1ZMSDd1dUFGaERyWVJHeU9FSkRh?=
 =?utf-8?B?UFUxaHZkMEZObWhjb3QrWmtDMkxEMytvZC9RSzBZZzA3ZTg0T3VnSjAwVnJI?=
 =?utf-8?B?WDkycFhGamNRbHhqNUtobkNWYkNvU3pDaGE2OGFuUjZHcSt3S0h6b2V2YStQ?=
 =?utf-8?B?REhIZEpVRTUrQlRyb0xobWpEeE93cUt2Qng1ZlVoNGo5ejE2b3poTXJOZUdT?=
 =?utf-8?B?STh1Ky9PUkVnOUVNbVNoaTJ6UThBOGk4VFlrNFdZQ3lWeE9zenVSUVFnNHUw?=
 =?utf-8?B?QkdHdUExdlAzS0V3MnM1enJLWlFpTVl3RW9MemdIa1d5ekJXK1o4d2d1N1hZ?=
 =?utf-8?B?YkVnZTAwMkJiNWdnUUVDQVVOK2QvVlUrL2ZnUk5sVmlYK0hyTUlFSVMyazNH?=
 =?utf-8?B?bC9YVFlyZG92YkxRNmZvVDZFQkcrek16enpOaklqQU9NcGN0Q0t1WTVxV2xo?=
 =?utf-8?B?TmVSc1BqRXhITHFHRTlPbzFhK2cvNndXVGoyQ1dnY0VUSFZVZEQzaktoZGds?=
 =?utf-8?B?ME5PQ05IYXJjQkNHL1dteDlIUVZqRTlIMTZ2d1B1YVlqTWp1ZmMxSDFvbUd2?=
 =?utf-8?B?ei84QWdtU3FrZUwyUTN0VW9TWlY3bG53UGw2eElhamYwclE0NW1JSzM5dFBn?=
 =?utf-8?B?UU5RUjczbUo0a1ExczlpbGJMZDIzL21JVXVCL0tPSkROVjhPMUdMU09XS1l1?=
 =?utf-8?B?SWs2cnFZVnBNTnl1dGc4OUNoS1A2eGYvRVBYMy9DbVhEU1ZkaUx0Y1k4ei9l?=
 =?utf-8?B?c3lZelZtTVhpeUsyRDViUEZNTEp6ZWgyMUlwZWJFSjRucytCdVlVL3BCWVF4?=
 =?utf-8?B?b2l1V3ptalIvVVBIdCs1LzNiS3NEczY0bWhSejFNRXZjUHZMcmhWSndBaXIy?=
 =?utf-8?B?TTJTdTlLdUFNQ2M1RjRrUGJqSVRHVURhZlNLTUx3TkFqU3hCUUt5NFp2bU9k?=
 =?utf-8?B?UXZoZTJvemFqOUtxWXo0cXpBeC9qb3plcFRjaFF5VjFlaXhrV2RFZFg1Y0w4?=
 =?utf-8?B?NlpVWkpwbkNaOVdVMjduU3RUczdlczMvbGNDMkxkbGQ2MWhTdkpDWlNkN0Vl?=
 =?utf-8?B?RkRtMFl1citLMEJBZC92VkdGQ09OL3Y0T2x4YU1Fcm5wY3pFNE8zS0x1T1pV?=
 =?utf-8?B?MlErVVp4eTQzaUlwZVpOaWYvcmR4VXB1Q2FRaHcxODRpbDNDZHR0QUpyWnZm?=
 =?utf-8?B?cER4aUZIbUpZREVOcHNuSFBFNkdWQ2RKa1l0YWllT1JBN0NpU09YK29JZFJm?=
 =?utf-8?B?L0JGMzIyeVpWVmlxK1B1Ly85TFJRMDNzN2dUMDBmUWhRaE9McHd0TU9nMVZh?=
 =?utf-8?B?S0hubms0ZmlRS0Z4WWJxNFF3R3I0MHVSbXJPWGw3SW5EVzBUMjJFVmZHL242?=
 =?utf-8?B?Skc2L09MUWU1UDRrVDNtRTI4QjUzTGlCejZteFl5S3Y0Vzh1Q2tpckxEMkYz?=
 =?utf-8?B?TzVOSGsxaGoraXY5SitaWkRCbVBCU0VkSU5Hbm9ZUXZaSklBRzI2aldGTGlU?=
 =?utf-8?B?cmx4OTdzZzZFWFdUV0ZTVzdtRENySXpjSEV4RWRwUTRWWnJtOHZYLzlNeC93?=
 =?utf-8?B?ejU4YmZnUjF3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 20:50:31.5456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174e8c7f-71dc-4c25-8b51-08dd6bdeaeca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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


On 3/25/25 04:43, Maciej Falkowski wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
> file_priv->ms_lock is acquired.
>
> During a failure in runtime resume, a cold boot is executed, which
> calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
> that acquires file_priv->ms_lock and causes the deadlock.
>
> Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
> index ffe7b10f8a76..eb485cf15ad6 100644
> --- a/drivers/accel/ivpu/ivpu_ms.c
> +++ b/drivers/accel/ivpu/ivpu_ms.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <drm/drm_file.h>
> +#include <linux/pm_runtime.h>
>   
>   #include "ivpu_drv.h"
>   #include "ivpu_gem.h"
> @@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
>   void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>   {
>   	struct ivpu_ms_instance *ms, *tmp;
> +	struct ivpu_device *vdev = file_priv->vdev;
> +
> +	pm_runtime_get_sync(vdev->drm.dev);

Could get_sync() be failed here? Maybe it is better to add warning for 
failure?


Lizhi

>   
>   	mutex_lock(&file_priv->ms_lock);
>   
> @@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>   		free_instance(file_priv, ms);
>   
>   	mutex_unlock(&file_priv->ms_lock);
> +
> +	pm_runtime_put_autosuspend(vdev->drm.dev);
>   }
>   
>   void ivpu_ms_cleanup_all(struct ivpu_device *vdev)
