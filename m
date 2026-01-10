Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7FD0CB0A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 02:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B5A10E07F;
	Sat, 10 Jan 2026 01:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fNVxZPUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azhn15012014.outbound.protection.outlook.com [52.102.136.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135E10E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 01:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ3Vn+RRyH9t+szrBgKlBh96JwpEUQr75ZTGEIB6IhUUn6r8kI3+fSSTIsuU5e5iU8J+SI73yImyA88Ueul4GO7mN5cuaaf4KwGGcDYZTegOLqQLjd//PAGssfNLsxTHqtW5lvmtUjuPajEaX0lA/Dl1HuGfoB4XIaIddPjTxbg7a/DSJWfur7aYXIGs+HtYExzqNBF72FC9/42fqpC4Tn6Z3TU1Y58A1w9nwSAoCcA/2Qsnedr/KmYfvmTi+JAXeqNX9YkVEO9oqiyKtZ5RTPP9FIREMwBDIEJw9b3pMNm5slD7qtsaeIYgcguF0NwIlA9uT4AfXA0vg14WUVR9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHWlD58fCOYESutG9tvVbmyxX6K/+IyppYWFRO2uaA8=;
 b=AeEphu01SMvLn34Ny5S4eMR6BQQLffN22jhaCOjFiB8Vbeuq7eaWxgKVXDMp9trNc/MHL6H9CXZVGHJOrZboxfv5wItFE4cHhOiWK1aFpl37RdjOAtbVYdPpqdfC3/ndia5ciY0wYMMe4GcvBjtgXznYmvvN11+7Zk2+mTQME6mKEWbP/sdq0zU4ZK3QzS2jG8WXq6K/oKqjAzgI6tQ3FY2YWXFGcTqgtKcYB1DHrCz2jZDbClp+fQ5bpDRf1oRDtioVk+ajo0fW3M6LFfNzLpOie25/pB6V3PHtkYhXTCPIUzWV53H+PTayL0NClm6TqwhANAA7K7gqD1nXxcsm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHWlD58fCOYESutG9tvVbmyxX6K/+IyppYWFRO2uaA8=;
 b=fNVxZPUO+egQNBiTHUlbYVPzn2wU4rVhVI9No386VjQzxO0YK1sM1F+ea7yoj6N3yhzoMU0zpbdrmQn+/bf3shLP3gUhGSRZ/y4ia4rLfHOemAdxnVouJZVse5yS+4eEWCkL0pP9VyEWc8m4vSUdy1hYwQuWrX6ztrnB13E/L44=
Received: from SN6PR05CA0002.namprd05.prod.outlook.com (2603:10b6:805:de::15)
 by PH7PR10MB5698.namprd10.prod.outlook.com (2603:10b6:510:126::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Sat, 10 Jan
 2026 01:19:50 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::1b) by SN6PR05CA0002.outlook.office365.com
 (2603:10b6:805:de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via Frontend Transport; Sat,
 10 Jan 2026 01:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Sat, 10 Jan 2026 01:19:48 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 19:19:47 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 19:19:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 19:19:46 -0600
Received: from [10.249.141.75] ([10.249.141.75])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60A1Je9E832909;
 Fri, 9 Jan 2026 19:19:41 -0600
Message-ID: <41291801-46bc-4d27-ae46-91d65e076820@ti.com>
Date: Sat, 10 Jan 2026 06:49:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cdns-dsi: Split pm_ops into runtime_pm and system_sleep
 ops
To: Abhash Kumar Jha <a-kumar2@ti.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <devarsht@ti.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <aradhya.bhatia@linux.dev>, <tomi.valkeinen@ideasonboard.com>,
 <p.zabel@pengutronix.de>, <u-kumar1@ti.com>
References: <20260109060312.2853133-1-a-kumar2@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260109060312.2853133-1-a-kumar2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|PH7PR10MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 5754ef8b-09b1-4e44-64ce-08de4fe65932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|34020700016|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJYKzRuTGZ6MHV6NjFWblV2MEsxTlhFUjl4ZmtkRlBPVHFHckhubzFLNGJi?=
 =?utf-8?B?amJwRzE3NnRjTEVsRDZkeUs0bVdESDhCNERzanFCZ2pZV3dCb2IzUDcrQ09t?=
 =?utf-8?B?V0l3OGVMbE5LZUZYMnB4aDZMWDRCOG1pUmNUTFBvOThKRkdjYjJjUUFNODlT?=
 =?utf-8?B?cEpwVjRDSGZiWFJzV3A5Tk55Q2FxRG12WGd4VlRrMFBWYVJtUi9sMFJ1eDFi?=
 =?utf-8?B?MXRkTmhwZTl2bkJzems2bmtaeDZSSXlrSnVTalZITGYwWHFpOGV1Vk9GdXg0?=
 =?utf-8?B?S1U3cC9yZ214Uko3QlVNaHU0L0N3Z2xzYmFSUUtTbjRJRGZIenZxN3U5aENp?=
 =?utf-8?B?UElYN3Z2dENKZ1FWNGQ2Y2d2SVVHTHhRb1d6dFAwWVMrZ21KSW5nRWd5K09R?=
 =?utf-8?B?ck1xWExjajdMbzFlcUk5VWRYUytlaytOVUtxUVNkeVBGdmY1bVFDSmJSVVZT?=
 =?utf-8?B?YTg0SDU4TUZZY3ZOdkhJbjhyZUo5bG9Jei9nUHBQNytpOUtwa3dxL2JuZ0dU?=
 =?utf-8?B?cDdIZVpmeFRhSTJhMTJ5YS91OC9NQVpGUnBQVlJiK3NmNVlIS041aHpsTFpZ?=
 =?utf-8?B?QkpMSFhnNDQ3UUdCU0pVd3NaV0hBRHpBaG1mRkpiZGtOcUZra0pNczRPTWMw?=
 =?utf-8?B?UVlVZ3ZheWdJQUU4QnBrZWJlTzNQS3NYbEVsaDBlUldiRVFkdExvbmU5K3R6?=
 =?utf-8?B?K2ZZWWNxNUQzR2RHN1U3TmhNV1pRcG9CbytweW1iclZUbU1uaXNINFNwTXRF?=
 =?utf-8?B?M2M4OGVJemRLbFR3SVlCdkdCUExtbmZLVWljWi84V0xNYmlLVGJrTjhYdmdR?=
 =?utf-8?B?bnhvVHBWOU40OXExaCtEckVUU2Y5NTVVS1NXZnA4dVpmZ1oyNFcwV09pNFUr?=
 =?utf-8?B?TnFhOUNnTHZ2enV1VTJKRU1tNmwxWEtXb3ZVWmVyem9ESVV1MWdEeWZERUdP?=
 =?utf-8?B?b0lZUURkdTlEU3RNejc1Z05FdHljZWxCUEd0TzlNeFZkamNqWUFoRlZqbDdV?=
 =?utf-8?B?eHpzWmJWR1V1S205MDBaaDg1ZDVmellUYTBUUlhHeDFOWFNORE01cUJjK0lV?=
 =?utf-8?B?b29RSEg4d0N1Wk1tUXBrUlpzU1MwN3ZMT01DU1BSekJ2cG9yUSszYWdBS3pB?=
 =?utf-8?B?TnVmZEc2V2pEU0tSdlYvUzRyOGhWcCtvcm5mdkJLcm5JcSt1Vlh6MmczYjJR?=
 =?utf-8?B?b0lTQlMxR2ZFTW9oejExd2JyekVjRWtxalRKUGNvMFEycExyTEIzQ0t1azNM?=
 =?utf-8?B?WTZLbXNvcHRFTzNDVTZJWFRlUmowWE1QUFlqckp1eDgxclUrUnkwOStpVXNp?=
 =?utf-8?B?VTlKaGQ5N3JjQ2FROXI3K1ZRTnBBelhJRC9mNExkNGlSb3dnTFpya0dZYm1j?=
 =?utf-8?B?dVY2ak5GcG9kQkZGem9EU2JURlluRVBSWkVGVVd6MHBDc2dRQm1lUHUwOGIv?=
 =?utf-8?B?bEdSY2poLzQyMThRTC9rcE50endDWkhyVGFKZjRVNnhZOWRuZURqdmVERml3?=
 =?utf-8?B?M0RzNFV5aHhaaXdqc3lLSElPRkV2ZTFueHcwUkx4Tm1MRDdySldPM0F0dTlh?=
 =?utf-8?B?TzFaZ2Q5QVdQdTlPZERqZ01zU0ZQY2laR3RnSGMrSU1KUzdIZ0JHTmdUckh1?=
 =?utf-8?B?dTFHRUZ1eEZ6WVVlbWxBSy9kaTNveDJzZU9seTgvbTQxM2poTzYyTDBlRnI2?=
 =?utf-8?B?K042QnlCNzhLK0s2c2hjK1lFSWtzT1hOQmxrb0FobStGM3dldmRYMU55anJL?=
 =?utf-8?B?ZmlMV011V2VLV2pVRUdEV3QvOVozdXJ3VGVXVkJjZ0MzQTJMUFF6blRrc2I4?=
 =?utf-8?B?endNMmhrNzdXa3hncEZ3S01MYWlveXlyeG9qZUQ1dFN2T0RNQmd3ZGpmTkZs?=
 =?utf-8?B?WEx2bWZVcHcvMkUwQ3AwWVV0aHRXWWc5Y0ZaR2RHSlhDMnZxTXVVM1Y3WjIr?=
 =?utf-8?B?TS9iZm85WW5JTHVNOVJPbEoxSTZPL05tM3J5RWpLQ2NXUDg5eC9qbis5M2Vh?=
 =?utf-8?B?OVBZL01XMUNhQnFPVFdXdmMrZERYdS9vMGpQeGgyZllSUXRyU0s4OFVoSlZN?=
 =?utf-8?B?MjRuNG9yWHZtdkxJc0VSeU14SXJqTGZzOFV3UUVFL0thLzdZWGFLMmh1WWNX?=
 =?utf-8?Q?4dUs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(34020700016)(82310400026)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 01:19:48.9950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5754ef8b-09b1-4e44-64ce-08de4fe65932
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5698
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

$subject prefix, Please check with git log 
drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c

should be drm/bridge: cdns-dsi:....

On 1/9/2026 11:33 AM, Abhash Kumar Jha wrote:
> Use pm_runtime_force_suspend/resume in system_sleep pm callbacks to let
> runtime-pm take care of the coordination between system suspend and
> itself. This ensures that they do not interfere with each other.

Could you add details, where you saw interference


> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
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
