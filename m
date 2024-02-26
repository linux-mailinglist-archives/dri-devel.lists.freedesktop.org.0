Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0725867C33
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F8A10E3A3;
	Mon, 26 Feb 2024 16:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdGHN4UK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29A410E3A3;
 Mon, 26 Feb 2024 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708965621; x=1740501621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z9UvnZabD1O6kIIA9Cg/ukLG4q9Yi6fLos+jelMLhCY=;
 b=NdGHN4UK9BBBO19Zva2OKqbSvGQJJzeVC68uzn411xmrDSYooBFxZT8J
 CdqjWB5cmc47zFkSlcu64RDet6AP0zL/zagVNcolKOv8ImR6Ws7EAcAqX
 s5guQ33m5af26JSd4NzglfNLG5qBGaRxZBVzGveRVc2rVBNB6rAH/8s4T
 gC7IdS/7CRb1HsnOIdicfTv/6AYWK2sonz44Z8Smt+CxagPdQa8uZNByC
 PPyYfQaq2XWoQPMVKs78t0RTmRpk7g2o3i/tTJAdidz4hf2L+sO5NTXrD
 CDPSzGqyFK07brdrMqqYnPzk+IK9MWnSy4EzKpx0W/QUkpeJPq8sb4i04 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3130102"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3130102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="29894199"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 08:40:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 08:40:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 08:40:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 08:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEUW3ffeZOuX33OnpgnQZoVBYV2ephXrOyRNK3t4srzAdXm92r302xs17XOO732PNTByg90akoOanTE8psnQ8VN+v98IpfSCFZQNxvBLIzaKZTzzOeJak8swMulWg/jJ1ZJstzoHlSSt7wUahcD7B5d9HrDjxiIiGaPJVkrPyAMZoSQ+XDBNlHzIDDHLy+OM7wsffp84lYTw0lcw+Y54MBCB/qoKCMp3b9WlhS7XwGhgH5Mj7+I49KYnpLuttZJ/RXRMxga6/IaNVfdqWfm00EPP0Cn/aB9Q+5wrn4uYM/k5CYCwCK9d1eRkWiA+lLwcu+SSylXEYTMUrS4or0SZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSfJgIjSsCEz1/ZvODREuYtBzH9AMKdjciUDY5nA2cM=;
 b=QQYzcmkLAwdtUpeZbcFtctAhT/fvJZRkS1oVjYNUwc9RydYzmJLiB4wf5nxLtyALdql1dXeFvS7QvN8mz75oBdpcnZGzLP0TQAP2PuMcDMMzLWcrwT3nhraL2BXdsAt0SZE2xn5uAB7hNkEYfrv3JXFSvKe6fnl7e0W3fMIPBzLtdlRnCVhf47q8x491LynanyKyWw21k7y2YSq5zDruOi84TO7rVjzm2W/6QM8eJC446325HgJIUDeGyiI22duZVrlKOozXzOX/8ss2jCoE/ROwq4za5YTGiEqIASrMu8m+9bUeDUBEL02+/SLebjPr0hp6B9kxr2yQtzPcB4sqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 26 Feb
 2024 16:40:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 16:40:16 +0000
Date: Mon, 26 Feb 2024 10:40:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] [v2] drm/xe/xe2: fix 64-bit division in
 pte_update_size
Message-ID: <kq3cpbz4ctqvfhtlh7f7wxd7ub3izdjovhv2jqkjasre7u6y2k@exaw42ber3f6>
References: <20240226124736.1272949-1-arnd@kernel.org>
 <20240226124736.1272949-3-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240226124736.1272949-3-arnd@kernel.org>
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: de48196a-77e1-4591-4bca-08dc36e99c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5HcD2r061VFtYdWzxlB+BRrA3geEDXzEkLCESNlQVDTGjMZ/ubvYbwqvO0Cg1ZHc5eJeMge9ZMA9Gl1q3UGvib74xMCQ/uSTWUp0ITVzysrjXEvY0zWkzxpgzSni/hb1PlnH4PmZFbbJTPoxm1xCkZmLLT/DEcvPZIlr42v+vAY0pT4cdhUT/K0dmNERzOztBolN4k+gq8O7iZU092wh9KzsTKEkZR10DKb32TzPzLt9KMmFhdT3ykXFgEQp/1sbrWPRFJUzZqzb7h0c1qYZaDehEYAmBidZIxx0w/0lTig+qKBeqw0mDyUzQucMIOuwNP+DJa/NOwfCAN03FLXpbB/qIOB9KAngtXJwoBPH78e0CnmwmwstUKndd1Lu63OlwCcNhVLRkm6NrFNGkXw3ZWsRNa7TXK7mV1rYm+IIQTyTdHd7Fow32+fwl4UDQhQ1DdtX44o8IwqsR2y31gYm4qcgfhzNVoM8c3nhYScqpLid3EW31RxacFnFg/4RD9VGTudMbaBl1bYlrRLqHaBKrdFoBHvaO7tHD3jb7Sjpmm3ZFdl9F4Q1xhokYszqotEX3PDsc+dkZz7PAg/sGqwDNzIZJ1HfiCxp6082Y4qSNcHLx3RDqcCoPDQO3/dYqf5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1SaKRyIxQxFKbqe4vjwXmeOOMZpZgQ3soId/rB4yfMoXdbwZuBEJci4DOoY?=
 =?us-ascii?Q?WcARqoXnkgTYeHnPeb5+AKd1GSHefbd7eFMpTgzCZAjDybxrQ6x0/orNQzTQ?=
 =?us-ascii?Q?6dtUqTkr9xWMcD3V1tr9wuNXj0cF3q9EH5qzpDbJUPHO2Dvc9RSgFxtb7Nhw?=
 =?us-ascii?Q?9e9ZzUI18i4qEzP7AwsWrSscv/A1uyb853MAqHUYQECQyjJxvhYzVALgCE45?=
 =?us-ascii?Q?eYPvMMyPlKY9ZK/xLT6l9cAQR7eYnxpIxqIy+fMItWC2oA0it8+C9JcAmj7z?=
 =?us-ascii?Q?H2XO9T/RfDSMHMyFvhViLsbWwv8TumtAkoX0XFuDgW8fQ3tD4T/2UcMolmG9?=
 =?us-ascii?Q?rl2WXmD/efbz8h+JpuefNFy9guAIH4/Bvpp1XdFtSSGvoD/9ltiPcPzsQq9k?=
 =?us-ascii?Q?BSEeSxCNU7OLZvWsczPduVQZoll+cpowHvqmiFwBRbQgDFYvRstNAPoZP8Md?=
 =?us-ascii?Q?9+w+9uuzxcjH3Yjop1klj0SWUTMhzgMxfR7loCresXeZD6Z3HMav0LNzL50Z?=
 =?us-ascii?Q?+c4qx/2OBNX6e78UodVuWE68Ac5+GhvoHPbmutRu2En3diQShwfychEz8iGU?=
 =?us-ascii?Q?J0CwCxsFLusesnTRm0zkSBM2j80jSas1F0q3iBE94Ngs3je/CIwseBiqIBKd?=
 =?us-ascii?Q?KANGVV8NTZv0MBaHX77QorNLUF2lfehTxlR8CNCfXf1q9swDjBWUe+Ac4eQ+?=
 =?us-ascii?Q?3RNRYHfbDndp0klmJQYAG47Zr9F2MTMl8+rF572BhCSyFG+UKQ3H1pJvr57u?=
 =?us-ascii?Q?IojFTrx2cIVIHFjIqyddJUvl855LP166ZoZPN5GOVmaVm0eVYRP4p1rtQebJ?=
 =?us-ascii?Q?EHas1wAQh+1jL82woP6arzP0KiDo5aoklezjokFvVZpyGNS5QyfBUqqCw5dL?=
 =?us-ascii?Q?ksCH2W4c9LC/n7zcgHRLZh07a2SLhBcJRBz7CNwhAmC7hzaD2AGYF2nqaD2V?=
 =?us-ascii?Q?pailzeTj163yL5tdNcm71KX2kORDq6avbK0Y4w6dlwmoxcjeH+A7Ii55Oie5?=
 =?us-ascii?Q?/yV4zdFy/HX5ZOUA/mzIBpypqQTfopMnnWpnpqPoluCxjpOuYbQqsZQDr+Kb?=
 =?us-ascii?Q?xT1ciE20O40ipIMLZoz4Bb6Ik3IkKoo7/W3f0mKZyNTBqPG/tV19OOQp+9+K?=
 =?us-ascii?Q?68xSRFn9TW8cmimZO7oUOFRJtdsQ3MQes5+gP4HX66V11JWy8efHKRl091K+?=
 =?us-ascii?Q?eDde+jkLu2bOuCyeRHjaKR90P5tea6MrIvr/VArV7JObkKscs6PIPggSjNQI?=
 =?us-ascii?Q?jrQbOn6sCxvAsnqf9bxvElCzyHFbazcR69VV0qT37z0P45MdSXrqAgyWDCKy?=
 =?us-ascii?Q?2P8IbLKYIgdDGn2JyymsdcA4FP7m00NmTkoycDGz2Xo116uY83zR4M5lw3ZJ?=
 =?us-ascii?Q?RgAHrMuhABehiO0R/+4SiBX2zwpGa5WMQ9Ojs6vcDYjpM+FStbQ3ke+xjFtm?=
 =?us-ascii?Q?euHf7+eOnZSC5UScV3Y9ljL9L47C440dPFdlo3XmmIiwOPVcTvMmOKMBN4sq?=
 =?us-ascii?Q?rL92VUGdlbRKG4R+zriQOfg/6Sp9Cxjz61jattUlDCqbmGnnn0s+cDL7CLuF?=
 =?us-ascii?Q?W0ulfyj0i7BPvhnHKchi16hvy8PW83oa9JL/Tycwl2CUvv2QH21hYSUrNJ7K?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de48196a-77e1-4591-4bca-08dc36e99c8e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:40:16.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4d80YQNphhhmmPOpVs/4KegHdELrizQWMV8BEL9RBRrzRCsCmXw9QHf0BBeUFKz/tq8ahpIOewE908Og95RsLC8r2/jZc/jCTyHFjUkh/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
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

On Mon, Feb 26, 2024 at 01:46:38PM +0100, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>This function does not build on 32-bit targets when the compiler
>fails to reduce DIV_ROUND_UP() into a shift:
>
>ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by xe_migrate.c
>>>>               drivers/gpu/drm/xe/xe_migrate.o:(pte_update_size) in archive vmlinux.a
>
>There are two instances in this function. Change the first to
>use an open-coded shift with the same behavior, and the second
>one to a 32-bit calculation, which is sufficient here as the size
>is never more than 2^32 pages (16TB).
>
>Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
>v2: use correct Fixes tag

but what about the other comment? How are we supposed to use
DIV_ROUND_UP() but then in some places (which?) have to open code it?

What compiler does this fail on?

>---
> drivers/gpu/drm/xe/xe_migrate.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index a66fdf2d2991..ee1bb938c493 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -462,7 +462,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> 	} else {
> 		/* Clip L0 to available size */
> 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>-		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>+		u32 num_4k_pages = (size + XE_PAGE_SIZE - 1) >> XE_PTE_SHIFT;

also the commit message doesn't seem to match the patch as you are only
changing one instance.

Lucas De Marchi

>
> 		*L0 = size;
> 		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
>-- 
>2.39.2
>
