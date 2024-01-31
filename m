Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D34844250
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A3010FA74;
	Wed, 31 Jan 2024 14:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7610FA74;
 Wed, 31 Jan 2024 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706712902; x=1738248902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ntGNIWZ90PYjlvRLk7ow1BrBe2aDSwFw0wYgb5n+0Ck=;
 b=NFWyyt3jd4OjKGcfuhNcsPsLbkylslc3b539NiKxh/0S+43iilRHrGzg
 ukljkki9rGyPwU1ghAA0YdSmcEO3OvG8Xp9nz424LzGek0EFUnp4jmDMo
 hzfyQbzxG/g+yZ7FcXd/+/HD43sEocx6ctJoTObBy0lFp+gBP6mDmDnUF
 0eozmf0lduqwD1H12XO9EmdyMaZSnItWiAtKKI/5weZF8jYjXnMEG8PdK
 FsRbHBaHNXw+Mrk+kbUD2TwgUtm9H2w8mxEuBZBXfItGIBa53c0hTiH2W
 /KPBU2LGHdJdES9dmhL3vfqZVJgwUFT2GbjFffBbdx3Ubk/yTvH9vY23C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10255078"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10255078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 06:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4114752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 06:54:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 06:54:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 06:54:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 06:54:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL1/PrLTM4xUFpn/s9Vb9FWlcz+LwjyPSSTtygDmt6o8ShVUWqbcSKWN8QFDE1+0z27HRO0ZviOywkW2UhCWKUIcUVPH7OTmxftX3458hKuqbZ+VDWBB+Zep+v9IBzC5eKvUG26FBVSBDmT/zrQudILFKKJT4BNGr5Fy8QPqBq/u05awwxgKGOCB6/xryi4dv0l9P8tO2kcTQliAo5gJSzXCQMVgUuwqf+M9HcfiE4Lgc5GFPzrcNyWcOSR36swMXgT1qNStz5Aj6EqTwYyeORMr6CLwWHQ9elkFJfnKEa5B2Yo6gqFcSY/zy8u3i3Cc1UqjLuXBWu64m73x8KZMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ8PhVqHX5ulhMmF2IMJdxqFDcsc0fAk1bLeA29s45k=;
 b=VddQRVoZuO2YA+HIr++h7YmhIxeIuEbMGhFkwmB9IgW37Hd8lOHXb8Iwn4mxWZXJEqNBEkEQewWjoO2ay6wipgFwYO0vZFLZKZP5jU8ICItVrFXn9d6diqBPXEktPSreh/pXPDDu63BvBdykPh137i3Qa3566To9HQezO//TKVSaMbfpKAjit3jixYXVonoWDgLf7HmKGmBEozKv/evZsp1gxbF75pILFhgTelaFWL1qm2i8d14/40FAhTXqM6f7LGZqU4IkbhZuh16831JiMrvrgSbCT51+YVDzLS4uIoXKKejgO56LgpLJyg6uON+JB/T44bFxL2A5wNSiT2O6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Wed, 31 Jan
 2024 14:54:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 14:54:49 +0000
Date: Wed, 31 Jan 2024 08:54:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: wangxiaoming321 <xiaoming.wang@intel.com>
Subject: Re: [PATCH] drm/xe/display: Fix memleak in display initialization
Message-ID: <abko5y3n5mju6srjly257bpqlvjf5ie6h6snboaekxnfv5mu76@jjumdgev76ag>
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
 <20240126153453.997855-1-xiaoming.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240126153453.997855-1-xiaoming.wang@intel.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: b0838c43-eb90-472d-6ae0-08dc226c92ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9LtjZ3dw9r/xU4UhIHfk9OrBEV15zNjYa94rnzQ2ueZ5S7edj/2Hy5WbG8qzOpEzqnSz6xiCWSxnVbM4K9tLcAJmjXix6gkZ9sJykk4TbS5o4gEUYd4JmbN8bQ1k8/cY/b9H+8+EjZ37oHwab+3RL+sLOwKmxwiIhs8riLLjqV0Z6drgZtYYLHeNL1hFz7SXVp9gucWiuQLzC0OpuU4q6CEBSA/YUTzBZbRN/kIidVl1s4+UUX4qq8FfXvpVLlPl9EoJ2/V2oP9HTGALJwRdOpMhWvPgm+80w268AEfNnt2scWLLDCo4DCNGmyysgnQHsjwBb3Ck7SL9RnADwX38gB+010/4ggoSbTMEExX73vpKaKjypyGmcyX56FQyf0esb+IuVSYFq6dpRV/68+pm608PJUXrKIT2PRh/zTDLlQPb27sVEUPGqEwtQ0y9C0ysVnh+lv6lCO7xgj3Vb+V16mkdmm0QDjCdYdqC20QN3J/euleFuZ+JId2r+a9k1WCvfRjPG2lokPvcrI//HV3jAsXlo97LSIRHUIwHXizwo+ji4T3LI6d0n4qmFdIywCm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(33716001)(41300700001)(66556008)(66946007)(6486002)(66476007)(83380400001)(2906002)(38100700002)(6506007)(9686003)(478600001)(6512007)(4326008)(6666004)(6862004)(8936002)(8676002)(316002)(7416002)(6636002)(26005)(5660300002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JA7pkiz4ccu/rVhz+7CsDtsPEl9GkN7HgSQ6xYG3lwJK3UCIISqWkAbqyb/G?=
 =?us-ascii?Q?+a+Kw0I4ZTcBAQYHoeBxKkIbdtUVunrXdhyS7V24JvRcUKR/o1OhKHe+RymG?=
 =?us-ascii?Q?8qbitOSXFyaYFxx71wLJ7WAnOsJpR6TxDzIYbSA8gWH2NtF7OGF9KazUaWIM?=
 =?us-ascii?Q?y6Ta9wEGgAoj39QdmXom25i45L7sq1zkU59fr7MvlCoFDc1Lm2B+OO5hFR5v?=
 =?us-ascii?Q?YnU8xz1txmbd/4CG24oaoyXE8FChLPWxo9QdPwkl+BzAovSc2vpBA2erM2NZ?=
 =?us-ascii?Q?NKRDhIAOVydh/Y+Nagq1vr+XianCKUY/+Dj1pvWpQc8Z1UtioTsThq2XDF3o?=
 =?us-ascii?Q?KSXYPPNnvuJ7efa6eBsO14nPG+JzWKcOgBEQOp4lHDVQjd67srpZIQR0LgxL?=
 =?us-ascii?Q?oF43D8iwcL9/jiKgaX+FZujz5rF3d65Y8STk+lI81Nn/t7S8+P8lctGUv75v?=
 =?us-ascii?Q?am9zIIJtxGuwRRBex4/IJR0PfLwhQ8HE7CMrOnN/5hdx0Je4sVqAONoZu1tV?=
 =?us-ascii?Q?4qWKwL/S66S1sfuuYbOGZxS5VgBQz+0FH+vO3hdARhv/S9yiyy7VH1ayJOrV?=
 =?us-ascii?Q?x73d0CEjbxs+0tp1xVvO3e5uv8pB23WGIpwAXJpU0pO+h6qpXEO2vJ9npkYV?=
 =?us-ascii?Q?oAPGa3o03TDBBSI8jxo7i8w/29Bip43uI91Q0K6Ar6Rrrmto9/P1zBTAb/b4?=
 =?us-ascii?Q?Cj/uPG0Jr6iwguDcZs4HEUkxgjzR4vdMriGDKsR30bmsQlVjwptHAHa9gKj1?=
 =?us-ascii?Q?atSydIaMuZ+6Bi7zws8YIxOK/MR4hf/9m4Vxbb6bW1Rod0ngdlWEAC+wbjRN?=
 =?us-ascii?Q?apvXMrWVZV5aG3nFyEDair2bc+TZXhnykczZ1GXfEclcfQrabEO648odKf7K?=
 =?us-ascii?Q?07+7o6h/XnGFlpbiy00cvN+MkaS5omnIxNLNngGhPmnpueSs68GGSGqTxmRx?=
 =?us-ascii?Q?yLecBAYJrjNN4hK0t9mchfXyDny6BScOchA0vdBJNX48JdpxmWoLAkncVkIb?=
 =?us-ascii?Q?U7Mndx8a0R2qBeAhLbatuHPGueNXaqC+/WBKmZrt3Syn5lH/oc65qIu7XwMG?=
 =?us-ascii?Q?lY/6si0FJZN461exmG8uGExvV0FiewayJ+YKlXaP5soVvrrKuizfnSesM++M?=
 =?us-ascii?Q?ZFJg32G5w8AoLafpOe+tQHqN5cnN7kwEJn4GrSnsP9JnFy29UujUflkb50xS?=
 =?us-ascii?Q?M7J3BC1FOSwANEsjZeimtMwAVByUmM7UOOUMaTGZ1B6OOmNiOGmWMsuokOBo?=
 =?us-ascii?Q?Hs7hi1DcuFs1soW5dH/TtCnpaLIte+UW6eJWOUlM3Rg0Gj96sAEpyWTKVY0L?=
 =?us-ascii?Q?4ASGdroDuqGjh6FsR3FeMQ30Lb6lD7zOn1yi1AmHlXZlsoLq7v3MYLU8vNPH?=
 =?us-ascii?Q?CUGBlky9YQYRty9YkZNr7oscZP7CTiyBb/zdU1qWHccwydbUmuCZ6Smrtt9e?=
 =?us-ascii?Q?13hksOyPdnTU81zis0CpzawGwmyBRKXHv6I6U0PblMwpXHHlqjE5m0aukfdS?=
 =?us-ascii?Q?YsfQf6d/bncQUnhth4/Pmb7g6iTTrBACR3z9rloXUAQTBIjsBXnuQSSPxUue?=
 =?us-ascii?Q?SLZhZuoyQjRkyQZDglyyp91hsbfkbd8zj3JLTnxzu/J2N0nyprfHb/PQ+dd/?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0838c43-eb90-472d-6ae0-08dc226c92ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 14:54:49.4210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8FCNLwEyVsBOJtaasU8WUf9BDUzm3DGBcw9tmaYiW4cPHZRoiGgQ8Xpc2FupgJz5n+1BZbxfM1zGwwD2lzEW7MdtN4CQLBusTgkTjebpO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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
Cc: thomas.hellstrom@linux.intel.com, daniel@ffwll.ch, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Jani

On Fri, Jan 26, 2024 at 11:34:53PM +0800, wangxiaoming321 wrote:
>intel_power_domains_init has been called twice in xe_device_probe:
>xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init(xe)
>xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
>-> intel_power_domains_init(i915)

ok, once upon a time intel_power_domains_init() was called by the driver
initialization code and not initialized inside the display. I think.
Now it's part of the display probe and we never updated the xe side.

>
>It needs remove one to avoid power_domains->power_wells double malloc.
>
>unreferenced object 0xffff88811150ee00 (size 512):
>  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
>  hex dump (first 32 bytes):
>    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
>    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
>  backtrace:
>    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
>    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
>    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
>    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
>    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
>    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
>    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
>    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
>    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
>    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
>    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
>    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
>    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
>    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
>    [<ffffffff81930d00>] driver_register+0x60/0x120
>    [<ffffffffa05e50a0>] 0xffffffffa05e50a0
>

This will need a Fixes trailer.  This seems to be a suitable one:

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

>Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 6 ------
> 1 file changed, 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 74391d9b11ae..e4db069f0db3 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>
> int xe_display_init_nommio(struct xe_device *xe)
> {
>-	int err;
>-
> 	if (!xe->info.enable_display)
> 		return 0;
>
>@@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
> 	/* This must be called before any calls to HAS_PCH_* */
> 	intel_detect_pch(xe);
>
>-	err = intel_power_domains_init(xe);
>-	if (err)
>-		return err;

xe_display_init_nommio() has xe_display_fini_nommio() as its destructor
counter part. Unfortunately display side looks wrong as it does:

init:
	intel_display_driver_probe_noirq() -> intel_power_domains_init()

destroy:
	i915_driver_late_release() -> intel_power_domains_cleanup()

I think leaving intel_power_domains_cleanup() as is for now so it's
called by xe works, but this needs to go through CI, which apparently
this series didn't go. I re-triggered it.

+Jani if he thinks this can be changed in another way or already have
the complete solution.

Lucas De Marchi
