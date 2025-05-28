Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F421AC6B16
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF90C10E2C2;
	Wed, 28 May 2025 13:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czqTBOAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449210E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748440632; x=1779976632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H6LeQesTlX6+vbVvRnMTBOZvyiM2cM6GoWKsxdWvCkY=;
 b=czqTBOAxCCxi7Z3S0jyBi2RW1mRokwzrxpO3rKLer3z2HNoptg0xWYbG
 EuDHx+rL067JaUreFjtXMcEsKjsrlczrNVABULzlXfmZ/ADoCWtXJLk67
 /WEsQdK0Izm7c22ljS+n9hnAkr2F+Xhnof/dSHgVQlVivX/9F9yF3KftE
 ovGATi+Qmy6BwZm7P1XW7yikdqEjK5/G+7cPYWjkeziVTHw7QgGuTAnCO
 zuEhl05ElyK3LDLwq4eQklyEUv3ZeRDWp7RCBcIBw61ZAj5/TS/NQBsR+
 rXLvcFc3fsgOjsZkflV+ynKJ+kmgxjeSm2onDszPFZj86TnP0tborQNgb A==;
X-CSE-ConnectionGUID: OLhBkY1HSDCLM8iSKZgJQQ==
X-CSE-MsgGUID: xHn3AKiPSC6h2ZhkYJSFZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50623912"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50623912"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:57:11 -0700
X-CSE-ConnectionGUID: j3ywkt9XQ0KEtAeqR3Wcvw==
X-CSE-MsgGUID: Ev1vGsyzRVO3bW7nRBW5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148536716"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:57:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 06:57:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 06:57:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 06:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPPyPF2hLHBkhjLlddIGIQWqj5j8TXmmJ2rkDHl6lIj/y4QGRygzHC6Ei4OOOYrrh/2u7oXDCrxHmNlg1f2pwgxjL+gUMlHzABbebhFhRgtWxJ+PqEVQSG56NDWmBV78Qj52EbCPAx3Ly0NQQdVKAVmlww/yduKlJWkj9bJ66k+rpWF6/GzsOPzcrH59fltpKegeonJ6dczQJN9jN3zDUVfUu7BuNInkePvzO+t+OKA2eHFG9KquW+vgxg78+OcCQuUUU4k3KQPSt3QuZtd360pztInzNEf/icZ3WdCYDRg+0l4XtsSCCPBr92k3vz1IGP1CotV8CaqUJmXljPgCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmBrLh1owI68JqNJF19vdb+Ac21G6eXmKRw6O7dG5ZU=;
 b=wJjiAdaLVcYOCJEBFDEuy+LKskdZvcQ+otKttp44/2x66x5hFFvrDc6GqrVHBoe/K9yoRxbayH7wJ7AMlr1he0pwNbweWLATGT4VRnnaRlLyojyVJWVdGKwTWcJhWOaxQ6aQHj/r00uDgR8w+mlpwS5FMR3Da3vCcjnCkj0jAZ3/4Krc6NP59VEg6X3ULUDXoTqNaJknmu1YSZUMO9rgeGN6q0hjRX3GjP+dwduwBPd2bsO4r0u0g4MswvChCDY0XmzA0HJejDNfv8Ttw4CR87iD/JfJFCDGWQYtx1etPKoZ5fwzbU6pkEstCeCw3uZxWDem+NZbFhbS8Kh5rq9hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 13:56:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 13:56:54 +0000
Date: Wed, 28 May 2025 08:56:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Message-ID: <jeslyq3zv3l3fakeixfpxw2xeoq55jraag7pfn6xbq65h3armq@uq76bx7xyydo>
References: <20250527225120.3361663-1-heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250527225120.3361663-1-heiko@sntech.de>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 59730f6b-e812-4e17-a30c-08dd9def810e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EFBTV1Vdb0xdb/uWz0PbBPjkmPA1AiX8AhSzK1xaEWEjbHYRFHnU0aIpP/J0?=
 =?us-ascii?Q?qORxTTWxKXt0xIxxoxBCJZYaQivW8Ok1oTKryjigSGVAdNhxFNsN/4f48B+Y?=
 =?us-ascii?Q?q5pCDhWtTBQiiNdBRG76uwuV0Lu342Qho1ysRMiV1U5lYdK/MiQIRzYmkySf?=
 =?us-ascii?Q?a8ccm3xXlQ86/wTVUpRlZLH+uLkzY26OzNKzwBwD0ojO54gOmwjjTgNlGGY5?=
 =?us-ascii?Q?b4B6KhjsflJGGdStv7GY0rCVio4TcTkk/33pzyrEVIA2ABq8I8Fyep6Ytfko?=
 =?us-ascii?Q?ZrGiqEjsBEcW+oxasW7dJs9YiA19MV8ZB1y7upSHRgIpabJ+I+vTlPvhR/EP?=
 =?us-ascii?Q?HmkG9vFzh65Ny3BGRcafkj/eL3OJsdsFflxW9klwPAGMKUe7Ow8GeQBQ18Qq?=
 =?us-ascii?Q?YUdQ2ttD9p7qxyL9VbpLxDu3U21t0d+0SCfmwNi85SnfZkmQJYOn7NWXZtDu?=
 =?us-ascii?Q?VsukGK7jbBVrbjOOver862jx8iwJITgocuLJaglYYoP47iPcx1V0F6XrpfDP?=
 =?us-ascii?Q?htRL3FpGNsRf6nYeSXE7ECOvjbpR5fezZyKFIC8RsUmoiuvoVD2/5dbGJyHK?=
 =?us-ascii?Q?aLQJD51Paa04vRh+q19t+IEGw7hNCTpY+5rgNa+tGqD3OKcqcROkKsd5RXil?=
 =?us-ascii?Q?Q9cbZ9BCUyEENK45awxHLqnbZzunapzyPl0mGarioFv8KdU3vtvHfGcDtiEf?=
 =?us-ascii?Q?j+UCC9x+CwW2cDDPKScZYAAbkC0w6iUiQkqonrcZUhz3J7qpC08I5SJSdl/k?=
 =?us-ascii?Q?OZgbo2ctdmVEaNonN08MROSvV94Dsaa7geDboU8qOmQ7wgk62pUi7g5UT6KC?=
 =?us-ascii?Q?P6ltg/WUnjeeyZDiLXUXrYFBasrkHEcoFBxz++x1ztEEjjBp65GC1te5qBrX?=
 =?us-ascii?Q?4lS16aYjDNPUFqMeg+sEbOGDVuNZAwlVFiLIvcPEFd1GQ8oG9CT/mOsQV+RK?=
 =?us-ascii?Q?t4OJnPCcynSRr1iHSqETslSPo8CRwcoidu2c5q1u6EHSatD4kexIPRpxuWM9?=
 =?us-ascii?Q?ql+CsABpIKiTfLQX+m4imOSzqyg83TEJ8kuBUVUyb4nYEYcMnfF+Nmk7MQ6a?=
 =?us-ascii?Q?QBkionFNcBUAC23kBbgcBdAyxVyIaEdShRJElTLY2m29VnTQtPrvizcv1Vhs?=
 =?us-ascii?Q?G/zEJw2UcmAeqrHfe4Wd4wmUI9ez7SEv152d8nwgmsVQbMveYsVtR0DRkSB0?=
 =?us-ascii?Q?0m0Kt3U3ikPioGmmm6xtnzjhPScjMLEQlfXgdxGhiMEsgjGwWF7Jzx0WUgU0?=
 =?us-ascii?Q?6sQ/9bWNcfhrBKeqd6mP0AdvfBn8eXt4nHek7awURnAC2NgIImc9j8VmhzKd?=
 =?us-ascii?Q?xNYq2TbtwDtVMbb8TIOaTR0ocSiCUf4k/rZ4nkEbq2vY+SUJAE6BfH4tuXO0?=
 =?us-ascii?Q?6pOdPoSIZFowHtnbCMSlUkzPMi9vtbqDtOnLTpZ0mc3UpYUJZFnpi0V1CNDd?=
 =?us-ascii?Q?Y1uGoz55bfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SbgE2oYGhlUTrpeJOijgs5PZaXKFiGcqCxdH85TdlE+PfTplgklkT0yHTKjF?=
 =?us-ascii?Q?L2mqSoNFMsPtGUH4FIa4EN4KifEjSOYhxNeDfn7mtT6ejq1Uaq1BYClB/vAi?=
 =?us-ascii?Q?nINaDyQgTbQTuiZMvE5u/0jnZ/GNs4bUw5E3pj6TB3LFSSWl5sSpJoW9PtHf?=
 =?us-ascii?Q?69u7PauLDQmkqNFzeD02s0MXDyN6Zybv4JfshY4Q9HDgGfqJP1oDXMUCk/WJ?=
 =?us-ascii?Q?3g+06hnuSMmf4N3QktY7q6Co+Req/my5Y7qRpyB+DFqdpv3Kk3kchkZN7+hW?=
 =?us-ascii?Q?zibDFc1MRas0iXXXPlMPzeClvzmBbDtouqDfT4wd2N6vPJv/KDiLmH7IRazU?=
 =?us-ascii?Q?EXvCpT+X065DYoBSIJ/3UPbylOYGJ1IekuUAlObVDLoRCuWl15h+065mw+iB?=
 =?us-ascii?Q?f6UvQriB5XfPSy0Y26FsxVmTLbNZSUVYUx/6LuWXR3XZOhf27pcO97qlwlHm?=
 =?us-ascii?Q?0KLzPp/cgvcx6Jv1mM3nNn5eq8n4pe72VK1rKcd85xj/+W837htbr3qghv8y?=
 =?us-ascii?Q?0J5ArmjaAr0Dzn4HYI6t5ZoHeWv4qfMFyhPM9kz/aFKdW7/hSIXOzTkHOT3C?=
 =?us-ascii?Q?1ile9U4+T49Qap7NWrFvjKNeo50pOhwRUoHezkT81jsCuYVpcF7LjLOHvlni?=
 =?us-ascii?Q?FFwFIuqIBZLBbi4hg88qc73cs0U1jEh5OX3OYGf37wpRb77isyW4sOx0AeCl?=
 =?us-ascii?Q?I2srgkDbWjFqH35AQmQrAJlKLPt6Tm1wIzOpsbS0lyCaRwimQaigmYP5eVjX?=
 =?us-ascii?Q?fhb/mM0zBZ/jOO2mhyOYuUlphFL01Ott9iFfSlZ6bjGxvFlPJD/9eBHOBjrW?=
 =?us-ascii?Q?Oqea/2Sugh/A7XEZPF+/JBxRGPjNjYhhVO6XjX2E2cvjvCxd9u7gcGbISAwn?=
 =?us-ascii?Q?hmkSWesTl/5hluFLZ658s8dDp1r5iBM+a/+c7oBUreDyZvqqw3vnn0wq/Z8I?=
 =?us-ascii?Q?BctO16Iy3XaFpdfMCisdYEbDDJ7T8tY3tmGPzSKqvoblDxhh5xzmGDtBK/id?=
 =?us-ascii?Q?9aDyiJM+efm/J7cPvoRyPO/BdXNcwLwXAet6nfkeq9wTO5n2Qoe7dR7hU5qc?=
 =?us-ascii?Q?j4An/T6gMbgRZA0F3TuGOga29TszbTjV3hvOLykCeRprPkVewb4w3AQ+9Hr9?=
 =?us-ascii?Q?IyioCjLqWSwqN7EOOhzS8Jaug0OevlHC3/5O4sODDz61Im9Yhrz1uEAIPSD1?=
 =?us-ascii?Q?EQlNkP3XSGd/WNMn7UVKVCCyTJnDUPKdzvp66kspQoFyWCGfqkIXMasHcATI?=
 =?us-ascii?Q?zp1cDPnwgG/YwJdTbd2ekt1Cdjx24sIubNxXE36fdVjzIUgUMgmESO++YsW+?=
 =?us-ascii?Q?ga/r+JxSH0aTprIbtlVME4GpaUHEbRJqff6mq4w+AiggVToXUGcy6fldc/HA?=
 =?us-ascii?Q?mDGIO7dCwLPqalO1DjuKkC1Mgzid+TC1PWOiC6TVvLRd7mN7aQ1MkQfEbiM8?=
 =?us-ascii?Q?KfPfUqE2m5b73fWJocJyX1g3m9wZA6SsA9EO4bCDxEEDcDN1PRpVfxLJ33uU?=
 =?us-ascii?Q?pE6IKzi5nHEaLP9Wb8qWA5tjjFwHU5ruJaDW3fS9p93lHg+lcLo10H09IBwL?=
 =?us-ascii?Q?SMPYGEnJnCE0wGss0ju5ck1VYzPZIvtSvy4v3tTEZS46FZYApqKvfjZDLzan?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59730f6b-e812-4e17-a30c-08dd9def810e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:56:54.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6Fqp0/Yg8guJlIhWlgUd59H2h+ImaFOG7mEfn4IzAOiJji4xvg2cHzwH4OrMuH2O3BBj+mqoCbka4EmU8SWXUuHx2Iyxv1j8WgxE94KwGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-OriginatorOrg: intel.com
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

On Wed, May 28, 2025 at 12:51:19AM +0200, Heiko Stuebner wrote:
>Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
>calls to clk_disable_unprepare() during probing") removed the mismatched
>clock_disable calls from analogix_dp_probe.
>
>But that patch was created and sent before
>commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
>from the DP AUX bus") was merged, so couldn't know about this change.
>
>So in the original patch the last change is
>    if (ret) {
>	dev_err(&pdev->dev, "failed to request irq\n");
>-		goto err_disable_clk;
>+		return ERR_PTR(ret);
>    }
>    disable_irq(dp->irq);
>
>    return dp;
>-
>-err_disable_clk:
>-	clk_disable_unprepare(dp->clock);
>-	return ERR_PTR(ret);
> }
> EXPORT_SYMBOL_GPL(analogix_dp_probe);
>
>the analogix_dp_core.c actually now has the runtime-pm handling between
>disable_irq() and return do introducing another goto err_clk_disable there.
>
>So remove that one too and return an error pointer, to not create build
>breakage.
>
>Fixes: 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
>Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Dmitry, maybe you have to enable a config in your build tests so we
don't have broken builds?

Lucas De Marchi
