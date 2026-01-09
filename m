Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6DD09465
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733F810E8A7;
	Fri,  9 Jan 2026 12:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="K7NoaReO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15010009.outbound.protection.outlook.com [52.102.149.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30FD10E8A7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM6Az9o9jCencPvPzQlUByTXyI0DtZb3R8k8Tdy2BL8gaObj0/ERUrLsPzfCleWohSeOeEOQ0PxTBhBHehpCa+AQd6kYqHVwAkfI4vQ0UZPiLELToMnAxLAMXyX6EL1IlxGc8bDLb+sFTuUOagG1pmWbASYx/7+5fTnaAd2ac7qITuGNOCxHm2wptBMCsdg+g5k0qiyEM7U+rVMvW6iDFwsIAMP/js5GmkF9X+9SG6SNO2vxt9p/0YcOnq42r3wkhXvxtfXh+YvClRfAlmnMIOZbmKhDSQ5QUyM6n0quj3SLUpYOAvbPfmN9RjxSGMQhn65QXkBT+CnxjAwz393mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIkk5JkiLjKEoDkM2FFVunjHbEIuSismX4bEWSxY/LA=;
 b=i+8obKDwP2/mMIjRNUL58w/y4mrs7rngw4d1kceOgWc82KyuoN1w/vezskGQ9tluuyRtnvEbMxjHpHdE6rDqYppRh20a+I6++t3KjHX24GmO8kvYoVHtHVg1zZitdKHCETJblntX+Ess/8bOQl2ko10uSBBuaGNHWyKBSn+GVioVGMAe4LQwgj32IV2qFiWayrVmp4rGvpWqvjJw88phSRm0GjsC3uCNNUPigjLuJPF504qB4SNbweyKRvCuLvhGSMB5/e7h56oIx6V4acB+8ebF6EFGvPjXZ+p7vFQPDZFKDLcuZMP0H3s/DovDSgvyxaRE265bdU2eW3EufF2gdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIkk5JkiLjKEoDkM2FFVunjHbEIuSismX4bEWSxY/LA=;
 b=K7NoaReOvsyvcf+L6FIF7IzpW2NVwQFMjGHsAE/XUJgNa+BEosW+LRGHaLBFpDjziN5XGECNjmH7SPOk8fm9wnpHm2ZuEOjFjMRTUhPlRdEut9hcSiK0YftEImX+s/Uc1VI6nY8AqG7wmdKd3lTfqzp61uPgVCwv4wirA6+K3fo=
Received: from CH0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:610:e7::19)
 by SJ1PR10MB6002.namprd10.prod.outlook.com (2603:10b6:a03:45f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 12:07:32 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::9) by CH0PR03CA0224.outlook.office365.com
 (2603:10b6:610:e7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 12:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 12:07:29 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 06:07:28 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 06:07:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 06:07:28 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609C7S534106285;
 Fri, 9 Jan 2026 06:07:28 -0600
Date: Fri, 9 Jan 2026 06:07:28 -0600
From: Nishanth Menon <nm@ti.com>
To: Michael Walle <mwalle@kernel.org>, Stephen Boyd <sboyd@kernel.org>
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
Message-ID: <20260109120728.2wku6akxof2ddn4h@tastiness>
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-3-mwalle@kernel.org>
 <20251230201233.n36d5fiensqyb6fc@splice>
 <DFDXXBFG13CK.385K2HM9FOWS6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DFDXXBFG13CK.385K2HM9FOWS6@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SJ1PR10MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: bf842820-675c-4bfa-5274-08de4f77a998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gD6J4mfFxdqYUgNYRtYLepdQbA7ob+LhmChj+cIMbnts6RJ/RZOCawZBNc7e?=
 =?us-ascii?Q?w0IzDHAa9QaAk+fys/OEs8EXOl6P6HbRCldM6UER32KFN93j+xGqHOBh1fjX?=
 =?us-ascii?Q?BBcEVN3Bd9vX6WchMwTvHl/Sq88JVIl9KSL/+MYbpnRcpishtrP6njDUb8cR?=
 =?us-ascii?Q?GTNGA1d1q7CMlTf/KCNGEwL7o1pCprR9mhma3rq4EulahUASm/KRStWd7j6v?=
 =?us-ascii?Q?iseqSOlZbhd3b35WrhuNUrKX+B8VmTh/hn0Mk+OFrqajKvXrJSs2/veJuAza?=
 =?us-ascii?Q?Hkt2axlx5VcwZy5WjxT1LfyCW3fiMFnsJ5ByyZeS6Y+JBfZj1mxk22K4RZFQ?=
 =?us-ascii?Q?4yVFb90LPX9ESTt6SjPY5eQcot2jjJMnqUpwmAVftjooK5oa2nPnn0vs1XH7?=
 =?us-ascii?Q?DjsgWBgmmz5kPPmSYC1BpGO5ljy1ZRDuVuiqXkt5vzvV43gOtxiPIVQ8E7au?=
 =?us-ascii?Q?b0LSbF+O9CGrULDrBaJz6PhyIha2vM+xxALkOcl7gwMAjw8/rXW64AlwAJcv?=
 =?us-ascii?Q?38tvDQ0r+NI+obwlffvzHQvzxWEZ3bX89FiZCIF1eMs5RrqkUlmfO/c0nDde?=
 =?us-ascii?Q?82PakBHGGLyqeouzyBNxELnU3oTyF9q1BOGpr9L3PVuPsTDdudbgWYGWgWKj?=
 =?us-ascii?Q?CMNpleV93RpZQtPKAVfqeUhCKOZAp7JuLQEYy9wbz16uFP5gPUblZriqmo06?=
 =?us-ascii?Q?YfFuXysCu5/XhHabbzzDXgK/smCJvuRVcovz+OADiojH+rSo0whwFD7r9WRJ?=
 =?us-ascii?Q?8BaHgBUNfJ3KrS+f20JH48h1bTuhcPpHius+9+YlZYpo2wVu+zFAn3z87SMo?=
 =?us-ascii?Q?Zmh5P/9uKNnDlxdc0xAjWM/awcejHGYcmyLPwboL8h5aMKZrsbXI2rbEYJE5?=
 =?us-ascii?Q?6bZrGh9ub+qivsl8U/zXfdFhaWNh8W+GJaC3mfkzhihAB0K7iqHMRcrfaJuq?=
 =?us-ascii?Q?q729nQuZUe3fQ9cS/6UibetMRq+2BoI4N/vdOXyL/Qw4XbX0lPCQFvLLz5I6?=
 =?us-ascii?Q?3RJQQpfrhTuhBBK78P20ZpRn90v7rXiIZ6ePlF6oeXe/AzSYX/Pdrct7sa21?=
 =?us-ascii?Q?ZudjoazxCsYk9bRhRLa+I1njCEWcoN1ojF4/V8b03yfdBBa17urgwujGGoHB?=
 =?us-ascii?Q?ZbEbZIBJR/SjOJHQzQfuon78rPYr4z2d9INDGEewXiBkB+HABAsO6m+VIuyU?=
 =?us-ascii?Q?3aPfg93Gs3f6pzs+B0DIRWsJIIZupepl/AREFOu3gXWthRcmFgmNOeNbuqDD?=
 =?us-ascii?Q?QQdGVlICdMDhvf/neTUINUHdtYxAtSxAyCQOABp1AYzSPEkRCUlUVc0rQCiO?=
 =?us-ascii?Q?9Q1az6yNJ+EFAam2QVESP1EIlvuh1SnV5yOUBKd5o9L0BBkEr1wEnaIjA9pA?=
 =?us-ascii?Q?CCpAgVDnKayJEoDQ0HE6u0Dt7o9OXj0TMXFKyK7pwsyYIGUZBOtnI8BjrCbm?=
 =?us-ascii?Q?O/ZLXpwxpdAQjSwCLETChS9e/HdCi2KxD1S5qcGcdkxOETUeBTTNragCofm8?=
 =?us-ascii?Q?3GAHp46JZEp7jBhukH/JQrpOJnKfz99d6V6kOKWCuPtmmHEVIuQPrfssEZRX?=
 =?us-ascii?Q?os8I3cserBAtPUsX6YE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(34020700016)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:07:29.7261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf842820-675c-4bfa-5274-08de4f77a998
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6002
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

On 08:55-20260102, Michael Walle wrote:
> On Tue Dec 30, 2025 at 9:12 PM CET, Nishanth Menon wrote:
> > On 13:47-20251223, Michael Walle wrote:
> >> The TISCI firmware will return 0 if the clock or consumer is not
> >> enabled although there is a stored value in the firmware. IOW a call to
> >> set rate will work but at get rate will always return 0 if the clock is
> >> disabled.
> >> The clk framework will try to cache the clock rate when it's requested
> >> by a consumer. If the clock or consumer is not enabled at that point,
> >> the cached value is 0, which is wrong. Thus, disable the cache
> >> altogether.
> >> 
> >> Signed-off-by: Michael Walle <mwalle@kernel.org>
> >> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> >> Reviewed-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >> 
> >> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> >> index 9d5071223f4c..0a1565fdbb3b 100644
> >> --- a/drivers/clk/keystone/sci-clk.c
> >> +++ b/drivers/clk/keystone/sci-clk.c
> >> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
> >>  
> >>  	init.ops = &sci_clk_ops;
> >>  	init.num_parents = sci_clk->num_parents;
> >> +
> >> +	/*
> >> +	 * A clock rate query to the SCI firmware will return 0 if either the
> >> +	 * clock itself is disabled or the attached device/consumer is disabled.
> >> +	 * This makes it inherently unsuitable for the caching of the clk
> >> +	 * framework.
> >> +	 */
> >> +	init.flags = CLK_GET_RATE_NOCACHE;
> >>  	sci_clk->hw.init = &init;
> >>  
> >>  	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
> >> -- 
> >> 2.47.3
> >> 
> >
> > Reviewed-by: Nishanth Menon <nm@ti.com>
> >
> > I wish there was a better scheme, but inherently, just like SCMI and
> > other systems where power management co-processor controls clocks, there
> > is no real feasible caching scheme I can think of. I wonder if Stephen
> > or others have a thought on this?
> >
> > That said, I wonder if we need fixes tag to this? I am sure there are
> > other clocks susceptible to this as well. I wonder if
> > commit 3c13933c6033 ("clk: keystone: sci-clk: add support for
> > dynamically probing clocks") is the appropriate tag?
> 
> >From my previous versions of this patch:
> 
> > Regarding a Fixes: tag. I didn't include one because it might have a
> > slight performance impact because the firmware has to be queried
> > every time now and it doesn't have been a problem for now. OTOH I've
> > enabled tracing during boot and there were just a handful
> > clock_{get/set}_rate() calls.
> 
> I'm still undecided if this needs a Fixes tag or not. Strictly
> speaking it would need one. Although, I'm not sure it's the one
> you mentioned, because the culprit is the "we return 0 if the clock
> or it's consumer is disabled", which then caches the wrong value.
> So it is probably the very first commit b745c0794e2f ("clk:
> keystone: Add sci-clk driver support").

Stephen: Can you pick the patch or suggest improvements?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
