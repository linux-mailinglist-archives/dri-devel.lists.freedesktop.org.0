Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61838A7AF2C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAED210E2FC;
	Thu,  3 Apr 2025 20:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DoTeynE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B110E2FC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGJWBsEX+/kHKOueDUZwIV7rnhzVAE/qanDxlfy6A/46jgUkspEnkUilVwK6SsBx6KvrEXFP9qpytOfocKFxkLfRiJDc8Okd78Jcu65M98pUIKGOFj8PJBjHCxkV08nWWjPMFMnyhgoSRBhALu9Mrwly0m0jKmNp5k2TJlu3Vh33lDZaJeEJVK3MgNcKVS93ejf5nr2iGXjarBKGUmooW2mOvdYBbnyGrpsf3wGRMXaO5WWfxMGzI9zbj92RQfnb6+zZaRT5KZD5aefLxeUvaOC7rdDkUqLzuwYzqRXcaJFjmHDasPcCb4gUOr4ZHD/o5vMcG4p8364qhv2o36rX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zGenmwWWnMo96hKNAQ31pGhoexPyy6j6mngZ/U8a8o=;
 b=R8YJqqwNOq19vf1DGvk7JJZUfhos8NbHunwaxS7TKoxkErWAUz7jYABLQfmCBa+xQ6k/vAxEMwCzMx5/TEjjoqMM7hSCP4DULO6CTOviHQZdFhXleghuB+zki8Of1LS3zC9v3u78fFkjdf1yT/tbUh9oeEYS8fmJ/rH6EyXeRzk+W2uYZzekRhZNdgdXgJhy9A58lAI7U3p+yb2pdAIGJT3KeKt515s62qiaboe7D2rbvHJsC/Km5mcCboROfd5goVNl3sKghO2xaPRUk+xC4XE92rynqS6yKmbcMgCINtdfv5d991XLlN/hUxIPOyWn8Bl98IkAgf/kMFB+k8a+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zGenmwWWnMo96hKNAQ31pGhoexPyy6j6mngZ/U8a8o=;
 b=DoTeynE8qVD/SU9DdTdfCoKnDPDLpGeMbMilLATxpyYJuvQzEe/JX/R5preg+FOnRCEajpeUETRsGDsOGWT7KokJVeyd/vQKzFfRXQmI8cBHGp6KjlaQAriUIWYNb1d3uhUr2vM6koVJISMMATbm7Vba+An4F+Ix2JUJA2LuAtM=
Received: from BL0PR02CA0056.namprd02.prod.outlook.com (2603:10b6:207:3d::33)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 20:43:53 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::b2) by BL0PR02CA0056.outlook.office365.com
 (2603:10b6:207:3d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 20:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 20:43:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 15:43:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 15:43:52 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 15:43:50 -0500
Message-ID: <49f73a5b-c879-bf74-214c-3a33e1c255c7@amd.com>
Date: Thu, 3 Apr 2025 13:43:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Flush pending jobs of device's workqueues
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>
References: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|IA1PR12MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: e46c3a1c-c3c2-4acf-d155-08dd72f03ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDJ2d0FXWGpMdWZvRFM3YTZjYjZMNHdPM0xlaU9IUlpNN3JVV0x0TkhLNE81?=
 =?utf-8?B?Y1hRT0tFS1picHo2aTMzKzBoNVRUMjUvOWVna2FTODIxTGI1Qy9pZzEwZm9z?=
 =?utf-8?B?aHh4WHlSMlQwbzUvYi9JVnhkbHJIVCtZVmhtYzBicFF0bTVnZCtud3VhOFB1?=
 =?utf-8?B?eWFOWHlQcEUxSktRMkZYeTVIamkxR2dLZWdLTWhxUm5LT1M0QmU5ZzhycTFD?=
 =?utf-8?B?QUEyWGxPbVFWMWtraEpwM04vVk1pV0txMzYzQXExRGVRZU9oU0kyZEVGa1cv?=
 =?utf-8?B?UFhvcTdsNlpLcktnS0dnZ2pJVTlFTFpSY2J4bVRpWW5YQXJOcjk2UjFuMXRY?=
 =?utf-8?B?citqa3N1ZmI1cTRaMWVaVE9VcHdIeWkwbjZacDNBbmtBMXIySklJallwajEy?=
 =?utf-8?B?dHdjYytjMVM3dHlhZGlybkZNajRydWtxMGVIL1N3VVgwY2YzdjlXZm9UNmFJ?=
 =?utf-8?B?VUsyRGU0dGNvME9OLy9KWU1UeDIwZ09ZOE05dEdHaXpSWS9qYkFnYWZTV1BX?=
 =?utf-8?B?T2lZZlhVRWhuNHdVRUhyK0xZb01JRDdrYVhpOUZlaVloWXUzck42TmtwUWVT?=
 =?utf-8?B?czl2cjF4aHV5K0FYMmx5RVRBaCt0YUxQc2kxYnJub3RQQTdvc3ZCWFJYQi9u?=
 =?utf-8?B?YjdvaVJPeGM3MjRXMUxTUG0xclZ6THl0RnhnYWk3cjRZMURwZ2hiOHRhazVR?=
 =?utf-8?B?aFJYeUo1NkVjN01qMHdDOEpIYml1bXBMWFNNNkkvRmRqcDNlcDdOVllWbXhC?=
 =?utf-8?B?MnJiaVVSenFrUGlmcGFNTkV4OWsrVEN2b2F0a2tqbk9oRnJjZnVibEpFeXFD?=
 =?utf-8?B?MFdCMFBFNzJpc1RTRmNiTDVNVkVsRHJ0R2d4MDkxeWdqdEZSbUF2Rzg0bGtt?=
 =?utf-8?B?bVFDWnJHL3h1WXJ6N05tem9taHNtK2JyTmFudnBwSGs0S0NkcWp0ODhEekhx?=
 =?utf-8?B?d2JoQmR0MG5YSE12bDVwUmJRWGN0QjZIZWpmbjNzTGd4MjVxUkJuMWhmVDFy?=
 =?utf-8?B?MEFMVW4wVzllTW5WMGtTSDZFY3NDbU90MEo0T2ZQVkxnT2t1TUR4aUJxVE02?=
 =?utf-8?B?NkI4M1FUL0VBdlZCUFB1M0xTTWViSnNNTDdFNk5zRldSQXJHcWNDMTFVZUp4?=
 =?utf-8?B?LzFaRGkzYmRjT0Erall4TXcwZXM2b3dvbVRMNlpJRmlBTGxjdXdIUmh4WHZu?=
 =?utf-8?B?Zk1mVlhYTWpyRVRFNU43eUgzU3VhT01VZno3MTAwMWxheVgxSzZTY1lOMCti?=
 =?utf-8?B?SzJpQk11UXJzcWpWREJYaGhnbU9Ud1Y1dUtZc0dXdHNZaU1mZUhFRkpadGdm?=
 =?utf-8?B?c3pWdncvTWIvaUhGOGZDZkQ3VWh2Mnh0OWRNYnNkUVdncXlyVTgxdEJOWnpF?=
 =?utf-8?B?amlIeFMzZWprQ0c5RG80UW4zL3BYbnZ0TlpRRkR0VjJQOTR2bzRCUjUxdVhE?=
 =?utf-8?B?MzhPbkN6cy9CalMxZUdONlMrWURMSmhHMHF1d1dJbDJycmdORVhGdjhlL0Rk?=
 =?utf-8?B?dHZDM3JyY005K2MzMzhwZzE2QnZoTjAxcVdBMUJRUENGMVI3cHlhZzRLek9Z?=
 =?utf-8?B?eXBiWUw5M0VOcUoyeHVKZ1FjcCtpYkU3VVpCeXBUdGRCckIybHA2L1hKYzU2?=
 =?utf-8?B?bkZXdHNFTHhXMXExdU5JK015WEZhbXRoL2U3aHBtWkZiQ2Z3YjZJWWtwbXVv?=
 =?utf-8?B?M2t1b1RvRmp0VmQ1MHZ4eW1qenlmajUzSit3WlJYL0FQREx5MXRRcDkxM3JO?=
 =?utf-8?B?QVNNZ1FxZm9ET1BxNFNMMFlwRExBRE8vMUJGMmVJSXBZc3VxbFhjaEk5MW9v?=
 =?utf-8?B?VVdCK3hyNFY3aVVtQTFGY3FwNnRaWGd2SmdPUkQ3MVlJYWlqcDlZTm51bVZy?=
 =?utf-8?B?VFd4WUMxWC9sRUJJTkRsd2l3MkhzM1hIbXhqbnRzaEcrYTFSZmc2SUdiY2VF?=
 =?utf-8?B?OTNPT2RZN2MzYUJOd3BZRGV3citCNStwWjNuMnpVNHZEUTF0QnJKN1NNeGNp?=
 =?utf-8?Q?bEvCMguumCRN82S0aHGhvhMbtHr8BM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:43:52.9696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46c3a1c-c3c2-4acf-d155-08dd72f03ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
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


On 4/1/25 08:57, Maciej Falkowski wrote:
> Use flush_work() instead of cancel_work_sync() for driver
> workqueues to guarantee that remaining pending work
> will be handled.
>
> Fixes: bc3e5f48b7ee ("accel/ivpu: Use workqueue for IRQ handling")
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 4fa73189502e..5e3888ff1022 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -421,9 +421,9 @@ void ivpu_prepare_for_reset(struct ivpu_device *vdev)
>   {
>   	ivpu_hw_irq_disable(vdev);
>   	disable_irq(vdev->irq);
> -	cancel_work_sync(&vdev->irq_ipc_work);
> -	cancel_work_sync(&vdev->irq_dct_work);
> -	cancel_work_sync(&vdev->context_abort_work);
> +	flush_work(&vdev->irq_ipc_work);
> +	flush_work(&vdev->irq_dct_work);
> +	flush_work(&vdev->context_abort_work);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	ivpu_ipc_disable(vdev);
>   	ivpu_mmu_disable(vdev);
>   }
