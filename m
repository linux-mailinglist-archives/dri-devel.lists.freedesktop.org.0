Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71215D17C95
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD2010E31D;
	Tue, 13 Jan 2026 09:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="HiEGFm1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazhn15013037.outbound.protection.outlook.com
 [52.102.140.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D109C10E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeWpla7XIdXZwW4goIf6WJinj56MC2bl34dgqvyAgz7g98yrHa+cplL30uDFnD6FjBU3/Xl1+a5JhgxH1PWnsvDTMp4neb7kGHBcOAeIUAaJMx+cU50IQE1B+P1++XMSuUOP5/UnViwn0vG7nnQZiwpXT0HckwPwTNYRmmTTL3sbrvpanmhYwEaAZVp2rpkRz9Pc4rpaBBG415fzfYMoRxkQQmBKVBaOLs48SdFyk4b31CFbhVTkCH7wl823d49fZuRwR6S/Su//S4KPy8RTsjnEO7pEJz5n6z1uTCRZ7zXytdUeEvxBmeCgPXyGOqjkmxFXd/kwL1SM8HQqyqDAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsdA1qQfGT6kQdjWMSPvnbhyZSpZf87ZkcLpEL0TFtM=;
 b=B6uhxd1/I+DMlxiasi6bg58T8l7qMjM+Zjxnklna0YW0VtOEm6GuYKJ3mrroz0JPPIlXQX0Lb+uYz/MPLhgH2xMoVi0kkjlQIso/mwlyTetK2xI7xAqOf6QJsO4Af3knUDyGIpY/+05BMFc74GX/RTvri7SY8k+DpGQGINOkS1XiqlTwH8y55iPJcPGew8Z42VmluPk0eEZ5Frzf/ccWeFoqS9c5N9RNELl8yjyhlQGMHk+LFJfAeJOQVFBZmN/IDoHSaW5NIIw6lQuFBNazz4+GnJKyCVpHf3FepQVGNN9Z8uR2KvbXQBms7SSgR4mWgHb0MXw3BuUc1QMhKVks/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsdA1qQfGT6kQdjWMSPvnbhyZSpZf87ZkcLpEL0TFtM=;
 b=HiEGFm1DIx4z1c/qzeYgxyH0ICK86KhOcXuO69UeqggLgrJ1YuCQ1CE8iBsvIcDbiP2QQZQE52cz6svpD9l/HNGLByJ3IsoT6O5R0RPgI3ERdgvhmAyPwOiGbKJzH8Vwa5x9G61o6LKTOTVt2e6gBTqCxMv4/cUEZsa213/W4MM=
Received: from BY5PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:180::16)
 by CH3PR10MB7396.namprd10.prod.outlook.com (2603:10b6:610:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 09:54:00 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::b5) by BY5PR13CA0003.outlook.office365.com
 (2603:10b6:a03:180::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 09:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:53:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 03:53:17 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 03:53:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 03:53:16 -0600
Received: from [172.24.31.151] (lt5cd2489kgj.dhcp.ti.com [172.24.31.151])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60D9rApx1952956;
 Tue, 13 Jan 2026 03:53:10 -0600
Message-ID: <3ce98440-7b8d-4db3-afa3-64890da4a8cf@ti.com>
Date: Tue, 13 Jan 2026 15:23:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: cdns-dsi: Split pm_ops into runtime_pm and
 system_sleep ops
To: Abhash Kumar Jha <a-kumar2@ti.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <devarsht@ti.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <aradhya.bhatia@linux.dev>, <tomi.valkeinen@ideasonboard.com>,
 <p.zabel@pengutronix.de>, <u-kumar1@ti.com>
References: <20260112091210.3505622-1-a-kumar2@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260112091210.3505622-1-a-kumar2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|CH3PR10MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e5fd18-32dc-4fd7-2511-08de5289ac12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|34020700016|36860700013|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNPcmIwam4zZm9WMkR5aWlQZmFtc3d0SVg3cE5ON1JPS3hzU0RWL0Ixalov?=
 =?utf-8?B?UnRnNzNpaWhPRnF3a3Bja3YxNVgxZW1RMFh3Ly9SMk9tcy93MFRpQnRUNWlo?=
 =?utf-8?B?ZlorT1RaVGVXenZHbjM4Nk9MZjN2Nm5uY0FjQjlhU3FpVDRWdFZ3UjJUc3RX?=
 =?utf-8?B?ZnAxRTZhSE5MQXVkWmY0ZWNZZEpDa3hZclJDUUdIWENSOXJveE5QYWVmNEZl?=
 =?utf-8?B?eUVUaG9XY1pQcDlnSDhiWnpmWGxCNW9RcjhJVkY3RjA3dkhtdnNaV2dhS3lp?=
 =?utf-8?B?dkZBUDRGdDJuSjZINVpwNVpJekJkWVFpSjBVMmJpcGg1UEJUYks3WjRWdTYz?=
 =?utf-8?B?VnBFMEtDcDBJMnFpWVJhb3BDU1hYZUhpUFowa2QzTGdyRWIwWDdhSEsvMzZu?=
 =?utf-8?B?M2t5NXF6NDdTZGtleS9JanZoeXo2K1Q1OG5TbHVaSjdEaVB6TTBFaEtvNEZT?=
 =?utf-8?B?dkRnT3cyQU1mRExtZEUyYW11UVB3dTZZc3hkWCtnaUtDc04rTzdqblJKTmpM?=
 =?utf-8?B?UVRFbW02cWJnK2w1eWxyVUFVZzI1KzM4ZVdpencybnphTHF1Y1VOcnU0ZVUz?=
 =?utf-8?B?V2JUQS9oOVN5NmQxVUJYSHBjbEQxMDRoakRFTnJxR0xQaXFvMjZXMmk1UUEr?=
 =?utf-8?B?cFpnNC9UL0dtQndtVzJRWW9wSUFqQTRoOVJxcklobU4weEdweFNMREF4TUkx?=
 =?utf-8?B?dDFTVWE2VS9iMmg0S05sVEdGRlBIMnBEaTVhckJrWTZ6UndBK0VlUDNlVllK?=
 =?utf-8?B?QVBMa2x1Qmh4cG9SNWd4emdQVHNoRGZLM0cvSUdTRGg1VHlDWWVINm1IS0RM?=
 =?utf-8?B?djNrTGVSeitqQmpraFV6Z09EelVzSDlsWFZCejYvRjdueDNRdVhEVXFXTUZu?=
 =?utf-8?B?T09IMUVBVDBlWHhWSmplVm8xMjd4Q1VVZE5ETXRWRFVDalFodTNmUUV2eXcw?=
 =?utf-8?B?NitUeVRoVHE4dkFpM3dLZzQ5T1JRYU5zQkxqNUVSbkFmaGQ1bEFXVTRKWEh0?=
 =?utf-8?B?Rk1mR0hibTkzUlNCdHBzQXQvTG8yZGZJczBsVEhLd2N0V3JDRHB4U3Uxbkhn?=
 =?utf-8?B?L1B6L0lCU0laem4xY3NYc3dIWmh4MXAvNW9aT0VrUEFLaUZPRlVDQnJKQ0tF?=
 =?utf-8?B?a1FvdHpaV2t4c1NNYXRHNW1iMWI4aVhpbmlsUG81bVpwUUNPWEREaVFjOS85?=
 =?utf-8?B?NHQ1aHhvL2pRRXpGM3lPTlBBVi9tL1I0RHNidlZwTWNQQXE2MGRWRWlCS29S?=
 =?utf-8?B?MmozeEFMZGVzUDFFYXd1aFV1dnJUVUN2alNzMitaVVQrRkl2b2FkT2psZW9C?=
 =?utf-8?B?VU5SN3N0MzlHc2dkU0JvWmJBRzN5Q0MrSGFmdVppVk5lK1BpSjRXMzVLa0RT?=
 =?utf-8?B?RUIxVDBsbW9tNHdIZFhLbE9sbXprT3V0eUNlcEw4UlJGa3NycmlFdXdXQUMx?=
 =?utf-8?B?b1Z3cS96VFJJL1NVRzY3bFRWQUt2b1A0RnFQSjlibVo4RnZPNnRpb2JuRGhH?=
 =?utf-8?B?dnpRN2QwRVVTTG1OQWdNR1pVZExIUUhrU0NNQ0htUXlaVUpkb3Y4SC9MQ1dI?=
 =?utf-8?B?WVROOGlhVVVjSHFXNmRpVVNRM0h3aVJFVXByV2FhZGJaWGxCRFhYSjFQY3Vi?=
 =?utf-8?B?amtJdU1HZkczRllDZDQ5a2JwNTc3UHMrdThyTSsvQjhOMTdFbm5qajgwYlZ5?=
 =?utf-8?B?QnU0RWxCN1Q0cGdlZXRNak94Z3lVM1cwUk1aUmNYSmpIbU1yQ21DditlcGQw?=
 =?utf-8?B?akRlUWJOWGN0c0o5bm9IWVNwMkczbk5ZTW5yZC94aGkzcFFQZ1JmWTljUjdv?=
 =?utf-8?B?NGJJa3RISUsyYTNmSFdUZW4zUGVXOHdHUnBBL3lnLzlGUTQrSkFKaUk3Uk1x?=
 =?utf-8?B?UW4xVloxMjVyYnMrMkJRMlEybXg4T2d5ZVQzc1M3RGord2R1VFRxd3ZpTFkw?=
 =?utf-8?B?NTBlWVEvQktOZlFUcVNDVzZyTTZrUzRlNjVVSlFVcXJRaDJlTmRzUkJHbjBm?=
 =?utf-8?B?ZlhvNTF6b0tQVXMxVk9rYUxkSmQ1OVJsaHpKaGx3MnJrQXJSYnFwRE1UMUtZ?=
 =?utf-8?B?UmNlVG5YUy9uWk5JNm96MDRZdDl5NlNHZ2JSQnppZGRYZFc3aC9id01WWXFN?=
 =?utf-8?Q?lPv0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(34020700016)(36860700013)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:53:58.2767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e5fd18-32dc-4fd7-2511-08de5289ac12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7396
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


On 1/12/2026 2:42 PM, Abhash Kumar Jha wrote:
> If runtime-pm has already suspended the device and a system suspend
> occurs, then we see a kernel crash when disabling and unpreparing the
> clocks.
>
> Use pm_runtime_force_suspend/resume in system_sleep pm callbacks to let
> runtime-pm take care of the coordination between system suspend and
> itself. This ensures that they do not interfere with each other.
>
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
> Hi,
>
> If a device is runtime_pm suspended and a system wide suspend is triggered,
> we see a kernel crash. Hence split the power management ops into separate
> system_sleep and runtime_pm ops.
>
> Changes in v2:
> - Improve the commit description and subject.
> - Link to v1: https://lore.kernel.org/all/20260109060312.2853133-1-a-kumar2@ti.com/
>
> Thanks,
> Abhash
>
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 32 +++++++++++++------
>   1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 09b289f0fcbf..25eaf0192013 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1230,7 +1230,18 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops = {
>   	.transfer = cdns_dsi_transfer,
>   };
>   
> -static int __maybe_unused cdns_dsi_resume(struct device *dev)
> +static int cdns_dsi_runtime_suspend(struct device *dev)
> +{
> +	struct cdns_dsi *dsi = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(dsi->dsi_sys_clk);
> +	clk_disable_unprepare(dsi->dsi_p_clk);
> +	reset_control_assert(dsi->dsi_p_rst);
> +
> +	return 0;
> +}
> +

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +static int cdns_dsi_runtime_resume(struct device *dev)
>   {
>   	struct cdns_dsi *dsi = dev_get_drvdata(dev);
>   
> @@ -1241,18 +1252,21 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused cdns_dsi_suspend(struct device *dev)
> +static int cdns_dsi_suspend(struct device *dev)
>   {
> -	struct cdns_dsi *dsi = dev_get_drvdata(dev);
> +	return pm_runtime_force_suspend(dev);
> +}
>   
> -	clk_disable_unprepare(dsi->dsi_sys_clk);
> -	clk_disable_unprepare(dsi->dsi_p_clk);
> -	reset_control_assert(dsi->dsi_p_rst);
> -	return 0;
> +static int cdns_dsi_resume(struct device *dev)
> +{
> +	return pm_runtime_force_resume(dev);
>   }
>   
> -static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
> -			    NULL);
> +static const struct dev_pm_ops cdns_dsi_pm_ops = {
> +	SET_RUNTIME_PM_OPS(cdns_dsi_runtime_suspend,
> +			cdns_dsi_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_dsi_suspend, cdns_dsi_resume)
> +};
>   
>   static int cdns_dsi_drm_probe(struct platform_device *pdev)
>   {
