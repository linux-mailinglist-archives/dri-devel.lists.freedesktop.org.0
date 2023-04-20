Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D86E9DCA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4E110E2D3;
	Thu, 20 Apr 2023 21:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAF110E220;
 Thu, 20 Apr 2023 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682025813; x=1713561813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+BftSjnrVBsMI7higWO7SbwttsxrenJTu4zWPXiVIAw=;
 b=cUAeFBYeZEZFFEUKR42RJ+O/u+0fWWxE7iHo3Q9sCWSu3g7+Cbbmz9Hm
 H7zgTGmdDDGPGW/+1G8BEF8mQ1xBMUgFH05TPClbDb7BFyliZYKfGHvKi
 2WQ9Y2qnKytbTJwiGnrcpBLCuWhdx9boGnsemecxihMI54h/4qPexHgtI
 bA1bAkoTdbjCgsknU7tZpF+dpx/cXEarbqxAzxt9TvXfU9+9jkei9UVHh
 WN6ve1fDHyFaC3NvpAw4cceG/u5T5i4Jyx+Ut0dgP9SKYZnidvZ4DA+k8
 h2NsgksNhk53Fpr++XbGCW1nisDFSFNpJ36KceTIr2UZEJFa5+wy1gsc6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325459290"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="325459290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803483332"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="803483332"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2023 14:23:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 14:23:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 14:23:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 14:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5cD+R2ks8nm0rEuI90ySRRuHxGwuqMUwAUAbOOTG2h+ni6KgNqQZnDwHKc+T+MngKSwbfGv2GFXxXYFVqL41KKBsQBk789mAn3K3pyFkHZyPmM3A0n9BoHsCL3wFxm2SEScMzm9ZmcgB2RruAco3ghY+a+zsO4ZRrdRdmxYr2tDXGPU37tJHYa5xOuUdYhgsaIN0NR+pmMxkRFQVrRlKH26m9mbPtAk8Rh/QQKIp0ertga4gv4crOeWnvcvKZZUPbjdbU7XZTZW8+ppjBzx6EZb/X59baIHXtiHd4Nv55zh510NlVmRvgfZ0L7CFdnITI1upewYFOtmsTOczhOHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjdAG/w2X2NZTUpT/HgeyVe8b3oaeK6enJar7GU504A=;
 b=kpBTHnvKqDyX2PHWYvOfZvVByOol9rRrlApGqwSvxnsCi3Ja3TK3xxW/5Z0VidsuTlkf8w9nfPVM8umJ22zRpTGXBPS/TpBKrAGqjxHXam9rMs2E/bXXrcb9GAS8+ESjDwIWeTY5WCraonsRtOYqpbC6zxziR+kG1YcH3FodYbvoWRmJWKc8WjIjcaY8vWyzqDAce1uW8v4MHSO6wfy8AwfwehT/3tz6x+w20eTEjViFxtSpssVetzrgrXEvqvnl08a2vA64eN6KWpMQ9h+rVRbR3FgB1IdOqTV4/wmxdXXYcAInWBHQH7wto1kN8CyJ9cu94enhVMhWnMCjwsVt6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 21:23:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 21:23:25 +0000
Date: Thu, 20 Apr 2023 14:23:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Define MOCS and PAT tables for
 MTL
Message-ID: <20230420212322.GD4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230420211353.167252-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230420211353.167252-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: 259990d3-33e6-4889-048e-08db41e579a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLEg2fV6TbqgYYg3DeEvxSa8pVmJ1ZkgdblbwAwa/mhJy0oCK2moIJ2dO25o6ubutFKPLSPADv5tDiLSNRrom4RhIBn9+0EUncU6IPhn9OUgw6lm3D0Fu0jCwbnP/Eisf4tBXoBnItMpvSqmJ8Cb9q2JrG7RCTRPnZYPvYbLIkDOF8J9MhnYj7pJMGgbk5AZrNAvp9gMqJhYknJE40wVtpp0eqmBQqnwmUEUQbytT4Fsl7Cf45Y2Mc1BloUgaLXpRZb/wh4iC18kPEpiPHq3tYoxE0/y1Q60JkfUxwRZI8LCcPqw9zqOg7G7I2Bv4RnLU7IepZeIS03VS4lAHobToeDLBlpw0kcmWAqUyiFUCTvws+sDR58auqBLKtGOiIT4G+rgw+NygjzdJ8aXvGqW1Lx9tJTSje/XXZ1Qiu/TEMn7L4C+EjO6N0UI9M1hcD8tuKZDZtTyxexqy9S8iabdeCNLlkjkS4QgpRQVCyBvaOMhzlMRppAXlSfX4JwvmTxtuvHxlKbrgSvpiWzQCKnOWhrZzStW0O2Fqfm0us+SUtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199021)(54906003)(83380400001)(478600001)(6506007)(6486002)(6512007)(1076003)(26005)(966005)(6666004)(66476007)(82960400001)(66556008)(6916009)(41300700001)(66946007)(4326008)(316002)(186003)(5660300002)(38100700002)(66899021)(8676002)(2906002)(8936002)(30864003)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sd/kwk1IuyRyKhbMzrnwweg1lZbOB3iaExA7JnsgCSz+s8d0Psl5XRfD0PAc?=
 =?us-ascii?Q?mHMTgxHqd9CAZysBHf9XDlPq8rBQux1fzu/N2RTMncbxJrc7Y/iXN3e1yWL1?=
 =?us-ascii?Q?ncvYg/qFCC5HAjCcP3DpO/1AtEpaiyAXxd420riOOB+1bWHFumSEYn+pnU0M?=
 =?us-ascii?Q?PTy3LOUeeGRwOspAGDJE47Mf84dEzTVjoEg4feup4EI/jGuGEfhTPvOvfpAv?=
 =?us-ascii?Q?slT0IsFHp6RlA5s/R2I74b9SYno6vbB8y0whWen8mratolOfBu7aiKJJFgSj?=
 =?us-ascii?Q?GT6NlQCIlLrIpi34isC/ERedxadzEyBJOIyyHjtJit9CO9LlaXdlvYJjr0Sr?=
 =?us-ascii?Q?t3DMI+kikboBMuiRkXcUiM99w6yQz9zETEUA/q9XDmWn3L45rhPpk1L7p0iI?=
 =?us-ascii?Q?gp7l8R43dz6iA1JAKyF6ASGbhMibu3VtY1OL3MPXbrYJlqzuQD/IZel1K9cf?=
 =?us-ascii?Q?wUn3W38ljqPamHiDKGBQjaO9yHh1S3kOTImZaawlo15AwwZosKx7tp1iRd9A?=
 =?us-ascii?Q?zIs1BKoFlUkKloCGeAlWMY1J6o890zFToDa1Gt4qhjhOzZ6k7yqfEckNbjt2?=
 =?us-ascii?Q?g8L8KZMXZRe0xbnnbF0zsID66jDwhfsaBghF3iBRHiTMvSeEsSmQ+fOsLSrF?=
 =?us-ascii?Q?ea+f6wzeVLlaaI51/zDeFheXL6cIeFnyuQMRR4pp4ppAP1gXhEjP+qEizcpv?=
 =?us-ascii?Q?MbS2uipCcWU4qTNw9AuHVYRDDFPRHzrvPkPGi2OsX1lhwxUCGg4fjy0pvmDf?=
 =?us-ascii?Q?3gBghGq3/aAO1HGZqFx+8LM10gt13Q6889i8BssV9IKmzZihD6mf4Q6xcU6X?=
 =?us-ascii?Q?Jy5Ycp4RrIrIOb3fIOIVpT9uT5sFNRiAM7RrPBwWPuKc6NWsMsznNBhsOjcY?=
 =?us-ascii?Q?zs+CwEd8/FwwH9ymQ1xZKFsrOKR9gfu+3DpFi7HhgkyPoA7MwVEHRBVK56qB?=
 =?us-ascii?Q?ytMJlKzbwqzv1kLuWl0DSz7aVKh+evmvfHl6HhkLTkkIJT73xlUzcqGUoKqm?=
 =?us-ascii?Q?UDqtJWumECKipg/DtaXIdwBF6tBXWk1zCOXCTVlETBFQw3jVuCBbuyO7CBG4?=
 =?us-ascii?Q?x0lYXKfKzQZ/oWU4EeJLQ/xaLtUYm2UzTfipR2fcradGkr/HJeYDH2at4rfj?=
 =?us-ascii?Q?tVwE7vfP3Hrz4A3/7xcpML0AQ5aNbTekvzwjer7aw00VKyCP45tzq4REh1zS?=
 =?us-ascii?Q?EOGH47xo9iAGzsW4vam7/TTF9iEQcruzK1FvHzuuGw4+5H5bh1RmuXt28NUX?=
 =?us-ascii?Q?a5CgxkrPzctI3PnxRE80/6v4VmNxAaj5RVkMWiEzLNPtqrsdWY74I47ZU8Fm?=
 =?us-ascii?Q?O7P2Zq+1wVToX4iN/Ih3DnwdJ87wCz3ylyVv+jwQE2LFFIVxSPqR7yyYxMBI?=
 =?us-ascii?Q?mcgfZ/6GnSM/egYKsNNbeNz63x7LsFOTYd0o8znzUDcCPg+zPWLD32AxwnO8?=
 =?us-ascii?Q?2Jq5ski9KNtsFHKoI2/5VqMXyxv2GuFApuWZJ6lAsTXE5SAZotRcGOkrL/mE?=
 =?us-ascii?Q?jN0gmS2UVgHNBVK3DJ16CGRsDrHefK4fGDDZcZR0sYjGfGbu0BPzPxFqCcqF?=
 =?us-ascii?Q?FhO+qRbQLAVGV5CX8aoLqdFSw+WqESz/1VK8k5c8iA0+eXDOrip07P+FGaZB?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 259990d3-33e6-4889-048e-08db41e579a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:23:25.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utcMUrLS71GcwsJzDHiQ8ezPQLBcxKGfoSIbT5w36KPD2RFqRAvmPMs9VI8+EqxqWzCwY8PCON/Oks6fr9BvJpXpwlDerTMO/YjeyAdvzjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
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
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 11:13:52PM +0200, Andi Shyti wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> On MTL, GT can no longer allocate on LLC - only the CPU can.
> This, along with addition of support for L4 cache calls for
> a MOCS/PAT table update.
> Also the PAT index registers are multicasted for primary GT,
> and there is an address jump from index 7 to 8. This patch
> makes sure that these registers are programmed in the proper
> way.
> 
> BSpec: 44509, 45101, 44235
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Hi,
> 
> just extracting this patch from Fei's series.

I just posted some feedback on Fei's series about an hour ago:

https://lore.kernel.org/intel-gfx/20230420202904.GY4085390@mdroper-desk1.amr.corp.intel.com/

Basically there's extra stuff in this patch that doesn't relate to the
primary topic of defining the MOCS and PAT tables for MTL.  E.g., the
PTE bits aren't used in this patch and should be moved to the following
patch that deals with page table encoding (and at least one of those
bits likely isn't correct from what I see in the bspec).

Also the GSI changes at the bottom seem to be trying to work around a
shortcoming of the selftest; it would likely be better to handle that in
the selftest itself (which can probably be a separate patch).


Matt

> 
> Andi
> 
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 ++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h     | 20 ++++++-
>  drivers/gpu/drm/i915/gt/intel_mocs.c    | 76 +++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/selftest_mocs.c |  2 +-
>  5 files changed, 143 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index fd1f9cd35e9d7..e8c3b762a92a3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -356,7 +356,11 @@
>  #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
>  
>  #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> -#define XEHP_PAT_INDEX(index)			MCR_REG(0x4800 + (index) * 4)
> +#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
> +								   0x4800, 0x4804, \
> +								   0x4848, 0x484c)
> +#define XEHP_PAT_INDEX(index)			MCR_REG(_PAT_INDEX(index))
> +#define XELPMP_PAT_INDEX(index)			_MMIO(_PAT_INDEX(index))
>  
>  #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4f436ba7a3c83..2f6a9be0ffe61 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -468,6 +468,44 @@ void gtt_write_workarounds(struct intel_gt *gt)
>  	}
>  }
>  
> +static void xelpmp_setup_private_ppat(struct intel_uncore *uncore)
> +{
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(0),
> +			   MTL_PPAT_L4_0_WB);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(1),
> +			   MTL_PPAT_L4_1_WT);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(2),
> +			   MTL_PPAT_L4_3_UC);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
> +			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
> +			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
> +
> +	/*
> +	 * Remaining PAT entries are left at the hardware-default
> +	 * fully-cached setting
> +	 */
> +}
> +
> +static void xelpg_setup_private_ppat(struct intel_gt *gt)
> +{
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0),
> +				     MTL_PPAT_L4_0_WB);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1),
> +				     MTL_PPAT_L4_1_WT);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2),
> +				     MTL_PPAT_L4_3_UC);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3),
> +				     MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4),
> +				     MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
> +
> +	/*
> +	 * Remaining PAT entries are left at the hardware-default
> +	 * fully-cached setting
> +	 */
> +}
> +
>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  {
>  	/* TGL doesn't support LLC or AGE settings */
> @@ -603,7 +641,14 @@ void setup_private_pat(struct intel_gt *gt)
>  
>  	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +	if (gt->type == GT_MEDIA) {
> +		xelpmp_setup_private_ppat(gt->uncore);
> +		return;
> +	}
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		xelpg_setup_private_ppat(gt);
> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>  		xehp_setup_private_ppat(gt);
>  	else if (GRAPHICS_VER(i915) >= 12)
>  		tgl_setup_private_ppat(uncore);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 69ce55f517f56..854ec09fd5888 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
>  #define BYT_PTE_WRITEABLE		REG_BIT(1)
>  
> +#define MTL_PPGTT_PTE_PAT3	BIT_ULL(62)
>  #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
> +#define GEN12_PPGTT_PTE_PAT2	BIT_ULL(7)
> +#define GEN12_PPGTT_PTE_NC	BIT_ULL(5)
> +#define GEN12_PPGTT_PTE_PAT1	BIT_ULL(4)
> +#define GEN12_PPGTT_PTE_PAT0	BIT_ULL(3)
>  
> -#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
> +#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
> +#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
> +#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
> +#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
> +#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
>  
>  #define GEN12_PDE_64K BIT(6)
>  #define GEN12_PTE_PS64 BIT(8)
> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
>  #define GEN8_PDE_IPS_64K BIT(11)
>  #define GEN8_PDE_PS_2M   BIT(7)
>  
> +#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
> +#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
> +#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> +#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> +#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> +#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> +
>  enum i915_cache_level;
>  
>  struct drm_i915_gem_object;
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 69b489e8dfeda..89570f137b2cf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>  #define LE_COS(value)		((value) << 15)
>  #define LE_SSE(value)		((value) << 17)
>  
> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> +#define _L4_CACHEABILITY(value)	((value) << 2)
> +#define IG_PAT(value)		((value) << 8)
> +
>  /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
>  #define L3_ESC(value)		((value) << 0)
>  #define L3_SCC(value)		((value) << 1)
> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>  /* Helper defines */
>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>  #define PVC_NUM_MOCS_ENTRIES	3
> +#define MTL_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
>  /*
> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>  #define L3_2_RESERVED		_L3_CACHEABILITY(2)
>  #define L3_3_WB			_L3_CACHEABILITY(3)
>  
> +/* L4 caching options */
> +#define L4_0_WB			_L4_CACHEABILITY(0)
> +#define L4_1_WT			_L4_CACHEABILITY(1)
> +#define L4_2_RESERVED		_L4_CACHEABILITY(2)
> +#define L4_3_UC			_L4_CACHEABILITY(3)
> +
>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>  	[__idx] = { \
>  		.control_value = __control_value, \
> @@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
>  	MOCS_ENTRY(2, 0, L3_3_WB),
>  };
>  
> +static const struct drm_i915_mocs_entry mtl_mocs_table[] = {
> +	/* Error - Reserved for Non-Use */
> +	MOCS_ENTRY(0,
> +		   IG_PAT(0),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* Cached - L3 + L4 */
> +	MOCS_ENTRY(1,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* L4 - GO:L3 */
> +	MOCS_ENTRY(2,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* Uncached - GO:L3 */
> +	MOCS_ENTRY(3,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* L4 - GO:Mem */
> +	MOCS_ENTRY(4,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - GO:Mem */
> +	MOCS_ENTRY(5,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(6,
> +		   IG_PAT(1),
> +		   L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(7,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(8,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(9,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Display - L3; L4:WT */
> +	MOCS_ENTRY(14,
> +		   IG_PAT(1) | L4_1_WT,
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* CCS - Non-Displayable */
> +	MOCS_ENTRY(15,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +};
> +
>  enum {
>  	HAS_GLOBAL_MOCS = BIT(0),
>  	HAS_ENGINE_MOCS = BIT(1),
> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>  	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>  
>  	table->unused_entries_index = I915_MOCS_PTE;
> -	if (IS_PONTEVECCHIO(i915)) {
> +	if (IS_METEORLAKE(i915)) {
> +		table->size = ARRAY_SIZE(mtl_mocs_table);
> +		table->table = mtl_mocs_table;
> +		table->n_entries = MTL_NUM_MOCS_ENTRIES;
> +		table->uc_index = 9;
> +		table->unused_entries_index = 1;
> +	} else if (IS_PONTEVECCHIO(i915)) {
>  		table->size = ARRAY_SIZE(pvc_mocs_table);
>  		table->table = pvc_mocs_table;
>  		table->n_entries = PVC_NUM_MOCS_ENTRIES;
> @@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_l3cc_table(engine->gt, &table);
>  }
>  
> -static u32 global_mocs_offset(void)
> +static u32 global_mocs_offset(struct intel_gt *gt)
>  {
> -	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
> +	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gsi_offset;
>  }
>  
>  void intel_set_mocs_index(struct intel_gt *gt)
> @@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
>  	 */
>  	flags = get_mocs_settings(gt->i915, &table);
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
> +		__init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index ca009a6a13bdb..7307963465148 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>  		return 0;
>  
>  	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> -		addr = global_mocs_offset();
> +		addr = global_mocs_offset(rq->engine->gt);
>  	else
>  		addr = mocs_offset(rq->engine);
>  
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
