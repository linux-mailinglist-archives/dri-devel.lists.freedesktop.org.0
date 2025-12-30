Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB2CEA968
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 21:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA50D10E0B1;
	Tue, 30 Dec 2025 20:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sqpHxkA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0D10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 20:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPDER6MCzT6KePZV6jOPTL81AewlcIEEeo2RCQy15rp/RYk2uUnzEbWJWg7m45R7aZCXKyjvp3reSmzW3VSTFCrMHB5bTHgUdkT1veCVQrSvnriH4/43UJokEZmAEhkMlZAEoO7Pa0TWSs+eht/2OMYU5iLpjFYMf7khimWD8xqWdwkjd8o3WI6O83SNM7gZtoBP+v1o37hDQO7FhgFogsVFZIC6LhNlTs1DjgqDk21x0WOdBvJyofkLH+Fm26tHoJdoubnyKQEAONEAcxdCDrBPYKQSK2FjPStyp0YHOMTjVgjva8SvCkCJLmwE/uhxLagNdU5f7Kxgkekhj3Sqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj1/K7dWkyBv6qsp6OezuXLeXtpWM/HHMPTUUPPCFmg=;
 b=T0GYbQat1mU71s73FKXafVzCykvMi23DCmrA60MWH9v6iYdOdK6JG3woQQwWkmB2I6YCY0WpKqBM1E6mlPiUm1uDhJIvg091EbwPUU3p8xa6E765LEGmHY7TW2CTCzVQBcwSfi/gAPWf5PpBwZTkyuIniQ34RI7trDaVPD5GIYKzyoOrK3ClrcuRMX8oeuOFSFE6o8EWtmGwkn2YVGQhWvbd5qf/s9P4Uvh61C6plxPStIiRz3i/3MTssDRnFpOa8lukL6psCheaBcWCmVstyYsjBdQsKFoq7UjApcFOdvrW1D6iW7BWuyAN/rD2tkmCLOCwwlUXEmB1+z5l/vbxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj1/K7dWkyBv6qsp6OezuXLeXtpWM/HHMPTUUPPCFmg=;
 b=sqpHxkA97pd7/4WqID5cNmkBnfuexxxR1Upidr/3g/RHXLAINMtb3Zan+g85OzNufo8DGLYBGKERNf2FT9LyRqVXLrOukwxj4bligkCvW/OyfMocPe1ASNtT5b89ZzNT9S8aSxaBLzMF4jXqWlvPbA5U3EZ13dLB9N+1y+6t/7Y=
Received: from BN0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:e7::10)
 by IA1PR10MB7285.namprd10.prod.outlook.com (2603:10b6:208:3fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 20:12:44 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::3b) by BN0PR03CA0035.outlook.office365.com
 (2603:10b6:408:e7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 20:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 20:12:42 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 14:12:33 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 14:12:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 14:12:33 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUKCXQr1206900;
 Tue, 30 Dec 2025 14:12:33 -0600
Date: Tue, 30 Dec 2025 14:12:33 -0600
From: Nishanth Menon <nm@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Andrew Davis
 <afd@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>,
 <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] clk: keystone: don't cache clock rate
Message-ID: <20251230201233.n36d5fiensqyb6fc@splice>
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-3-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251223124729.2482877-3-mwalle@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|IA1PR10MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d20f1127-0f02-41bf-76bd-08de47dfc9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eyh+m94nJ7xhlkRwq3ovPpQR4VKBSPuRLNMiUKduZVy7XGkDB9V7bEA1A8v7?=
 =?us-ascii?Q?mIhiM9SKB+KVUJ5D+a14AT/G79ZVtTqlbZ8bEqD9dLDPyDIEkcEOvVrCDRgg?=
 =?us-ascii?Q?UTTNRAeCDhVui9ZdHkay4G01bNx+iOEuWxKOLBMZNcGlrdM45HbKdu0XimRN?=
 =?us-ascii?Q?/UwYth0qIO42On6ajq4U/LFWnzopeWTy5T2XbnWMgA+EBsEK3ZQTFi1vq0ep?=
 =?us-ascii?Q?2PNNeY7naYK6Ab89lStMA09CM05nzfUiOg/GrARWt0fbUQBLQVUBxR5AQJyI?=
 =?us-ascii?Q?xRVCIukmPBRt9Q7mt37Yj1i2nzyX5PdVueNrPZ2J1DNGBLa+zQp4pjwVn770?=
 =?us-ascii?Q?HubD0RiVzpEO49nSC2Ol53u6PQYISeRcEUm4pMOqXY0ZKkBCIkbKDNnZgNSY?=
 =?us-ascii?Q?Xh0/7zZSeFcsDSbcqknjVrtbePStcARjYQs9SvkL6VEkHj8h39P097xYSLcF?=
 =?us-ascii?Q?lqV0qIGnWp9FQ9ed1D2P3xHqVUEmm4b8w8Lk7w3hXnmVSM1SAK9O1IQdH0wa?=
 =?us-ascii?Q?1Scdm1jGm7FuA4ZDkNP9xGTXPFYrrLC6LNIlFempWobrxfr0zEH9QUHu1gwV?=
 =?us-ascii?Q?Nqo5Q84omFUKUhJ9gy/NpRH2hdJgAQsYq8Mf4DXa5oxsMWTkxA5R2dzmb796?=
 =?us-ascii?Q?dgnEYlb9747fY84kdpFIk/kwMgbZupNe27dWEGwC/VEtCU8J0fbtQPOCbI1s?=
 =?us-ascii?Q?TAlAnmdv+0BClHdcKnNIKx9qfpx1Cd2Xwz12vCTgkhMYaWvHpEToXb+VMSZa?=
 =?us-ascii?Q?AOcL0RprpJkvRuB2g0JITuXG9JOUJKA/1vM8755ptYEC27+ZiZIs52NkCbd1?=
 =?us-ascii?Q?vCU36jz8pYR3zaWbqNdz3OCNNLh87M4QKp9JQBZYuX+mSC2Ww6S+LvcLL20C?=
 =?us-ascii?Q?/5HwtvxsLa7WwW1jQ8O4jLwfKiovWf8LCTwPNhnOw/XbueisVbDy0bB/KqoJ?=
 =?us-ascii?Q?G82mpRXILgElgma+Rh16Taj9FI0oDis5dg1nKG1yo52/VrGF8RPlUXYBoVnp?=
 =?us-ascii?Q?2n/EDYkOlMNQ17Q2bRSkwW4BiMYMCniiCBTb1iFzn3T4NUR2d6SyPEo+1RtR?=
 =?us-ascii?Q?WnSlrbWPpYG6j3GIr21VQk8z+9r7dwYoE6irhsmnm0/njelQ28ZVdFEjGJQZ?=
 =?us-ascii?Q?M+MwEp/n8R3vKkEvhv+X/FIY8P+m0N8nd+ZVkmqZ2IzIWspphHmlOhgW5U/P?=
 =?us-ascii?Q?fyF4FgY7+ASD0x65DgVI6+B4sJFpfFnx3iGpXj7VQIo6Sb7jH2SqhcMFb8OZ?=
 =?us-ascii?Q?TYDjCb9U3W5XMkEtqeVL/GHUNc2m4Ki2j/wC28aqZuv07Z6xrNAMI0ANtQru?=
 =?us-ascii?Q?K/vNTUe0vg5veolVKVRkenXQT3MSKtArlez4ELJif1gEn+qqDvE8ypGR5Jls?=
 =?us-ascii?Q?tpKJ/sosdil2QiPryqI70U/w/o+UZGQh8VttP8U38zuiSH35HLFwsp4akRRx?=
 =?us-ascii?Q?2xuoItusx5cmD9X7ZL8KMvI4GLirLQUBJNwRerTpYsZ14QlJIqnu0MBJAZKe?=
 =?us-ascii?Q?zF5y/N5dgNmMF/5qdR9k8sj78RPcDC2U/wXsJUa8SG6V3zR4hI9s4+EtEwRz?=
 =?us-ascii?Q?NSKAOFzzzSYsrF5ZmG0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 20:12:42.3304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d20f1127-0f02-41bf-76bd-08de47dfc9ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7285
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

On 13:47-20251223, Michael Walle wrote:
> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong. Thus, disable the cache
> altogether.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Randolph Sapp <rs@ti.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4c..0a1565fdbb3b 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
>  
>  	init.ops = &sci_clk_ops;
>  	init.num_parents = sci_clk->num_parents;
> +
> +	/*
> +	 * A clock rate query to the SCI firmware will return 0 if either the
> +	 * clock itself is disabled or the attached device/consumer is disabled.
> +	 * This makes it inherently unsuitable for the caching of the clk
> +	 * framework.
> +	 */
> +	init.flags = CLK_GET_RATE_NOCACHE;
>  	sci_clk->hw.init = &init;
>  
>  	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
> -- 
> 2.47.3
> 

Reviewed-by: Nishanth Menon <nm@ti.com>

I wish there was a better scheme, but inherently, just like SCMI and
other systems where power management co-processor controls clocks, there
is no real feasible caching scheme I can think of. I wonder if Stephen
or others have a thought on this?

That said, I wonder if we need fixes tag to this? I am sure there are
other clocks susceptible to this as well. I wonder if
commit 3c13933c6033 ("clk: keystone: sci-clk: add support for
dynamically probing clocks") is the appropriate tag?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
