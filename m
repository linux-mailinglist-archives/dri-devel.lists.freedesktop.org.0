Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E885CB16
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 23:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACC810E59D;
	Tue, 20 Feb 2024 22:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybh0X3ta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2810E59D;
 Tue, 20 Feb 2024 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708469436; x=1740005436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=owidcYhbCeyeMUCfOWSgblz61gbSkcadf6+oFOBGmEk=;
 b=Ybh0X3ta5Zk8cTtUWF43X7Tz/3Iz8zj3in1czUK10etBlOUjFjWRTikV
 Dns5Imb1A/BB/LBDCZ2Icd693yqRKhsF7MzYwwj+rvXiNZLSxH41vz2mW
 3SCu9aClwsx9F4Luj2IKn+7rTvuLLVPmBWGXaqLXi/1mz6z8iQVA7Pmd4
 d9dJ57DiEQrb05ffW2p815+esi3CARy/yVgTBpu3lx+5tzR4aDLiM/ko4
 v5eKvcNf4CE13DAYGRCmCur66CEFPKd7+KzsEgaIJxSqnyEG4Qou6P2gf
 sXltphT0DmEoKCsU6+Vjp62+1loiZDVM0aNj6kaxFg6/0LZFvNdYqsmte A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14021246"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="14021246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 14:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5223683"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 14:50:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 14:50:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 14:50:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 14:50:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRSzFo19qi1dsTOreiXymuAGWK06WyjrUi+l27/d/BEcCjv6ZcYVkmD8hiiUF9F+eQZsAnY8FEW1svP6+6h+ZvmED+JObACtzUAM0si4WLRJ1DGMgtwZyGqcVUZOG/EsSg2fN8K8mnWIugczPejfCNbA6Ooi7zFl6/coGxrT17Q2pTVTNlOsfq2wFt5cp57Wc3bM3+5FxZ7YcnXKXBTYdme+pjGX8mUQ38zBoxjTdrxJlA9o3zrc1zg//2gwk3n7KEFHREySYHuB66uCPU7tMgJ6aq36OKcXd06a3nf/1jv9pYy70M1l1ctz7QvQdw0OWMb/K5CUYAj6CulQn7rddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DtVJiOuhkar0MKejV27pcjehPCgt1UUz5O+zDI9j88=;
 b=PmKi48O1pT2JRwGRRaGsi0ZukXNbt9UzbyIMaH1isGrl8BC5KJo7OZuFrRCy6B2w0avtTugPNQ52TLLUdjjYB+f+mK0KeeJGxaVlO8HfAc2vqJeeaOLXdp3MxGqbJqnv9lcBnajgEb55nVCueFBGJT6cTPpz8f5STqb8+ij54JMWnjYrdZv8ivKss2ToSf3bbdyaNRxSRr5I8pMUFbpDLckU+AVo330DhNiU00UATpy9l4O0ASV6wupjmYZ5EJOUQu469fh2E13YjkdRWUUPFn/FSKSnRPwRh98nz4zhUUqVNNEAu2clS1iIZ4rmFb9xjTYRp5kTPRgLtrNSB3E5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 22:50:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 22:50:31 +0000
Date: Tue, 20 Feb 2024 17:50:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [RFC] drm/i915: Support replaying GPU hangs with captured
 context image
Message-ID: <ZdUss7f1FXjbTcpp@intel.com>
References: <20240213131434.1609720-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213131434.1609720-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 91194a45-9688-403d-b61a-08dc3266575e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVGZ+RZ8EsqzmgOoFvdRo0WcuUe4AUuzphKn+JeAM3CmoKw5mZtIIrEvLYGGPwu95z3wPxm8GlZ0iNbhPbqkqQ+jP9W9zRAqczMuSEoCSVdaKJh3i7T5a9h6f5AF+Il5qcne83mT+dIsPdMnbzpvOpdpTBi1EdwoOTwiyFutltga3vD+/AXVtCT39028Jc3DjD0zuZVQhDNjTxxXtYkZpryuA66bV/3+0Wd6JP3tc4Vn5Gx8bV7cdatnhT0QKSTL2FO3k1frGdLaJ8IrSIANlTBxJevDAZu2X5ykXmRQ0rRtrvE+nUi7K58rj3BaipSt5mkxVUp0dwTtM1VjCunjh3BTd44xKiUEUjR2iwGkFBCopLBD/K3J1C76kXeUx+Yecqnb817VTbpChVmEHJBBC+yUE9y5vkut8Bj6lrudnSK7Y/tjbIGceH3/UXgzX65vh1GmpZh2y3S0/cQS77vn+LOl6Vg8rNb+dkIssv1uUKiWYjj9olSmRtmzGftyONdLoc6XS6EYOTVwF13/dmog4q3ZxlbXEOBfdJM/kEURZvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iSX3fShrhFCBgQ/joNsOIZ29a1xZrpOgVsR/ouXdQPR2ZVAyjnlef81aSsLl?=
 =?us-ascii?Q?mUoO3TthOyi8MA5DSzjAAcb4gjR+6rx6nw/XzEob1eQO/MaIUZxKOoOI1ylN?=
 =?us-ascii?Q?w3iST4om6544XtCCoI3l7apdzQdwDizk87rGava829TkcSOmYhgRG8//Vvsw?=
 =?us-ascii?Q?/S+SCkxwWE14uCvEc7TjTBdbIPWxwpzfPZt4qlib018V3Ife0EDvCxrKMvpZ?=
 =?us-ascii?Q?OWAh2fAm6hzCavUkW4QL4mnF2G1peCB5T89/nKY2RUeYpoxTZAqp6R1xvNaa?=
 =?us-ascii?Q?kVhNtS3iU3BLKU7m2W1tgv1Y7ITAZkFhyFTfHVDqXswlYyTYkP7Z1OjjmMkT?=
 =?us-ascii?Q?aw16TL+yd2fZw9uyd5tS9yWvLjb4lyby6Q68XodcOKxoHUbfZROhrGMiv8y5?=
 =?us-ascii?Q?pSj3FUS5/tJkSLGkcJmroUd8YBnMKChJ32M1EJj4yLiacZbM4Lpp5ZEuJMDj?=
 =?us-ascii?Q?LeK4o5VoROgQ3RTnhY+SCwrjHaIbUZWzfmFyttd/Du3TdHTqbmDslYqytwN7?=
 =?us-ascii?Q?komNRijBisihQjs/9e3JJFMSRu6ZC2fO1d0q0yZAFWbHMtnuRhdIIETrF7ps?=
 =?us-ascii?Q?PJTNFy2cvrvn3wmMRQglHx/fpYlOqXIEFXVlg87abV3OjigeuAg75rQEc9r6?=
 =?us-ascii?Q?aOvywgIjnZ2SYc+oqRXEq2VinqiMN4RxeotJ3qxmx8ARSuTwS5BwyQ7W5p6X?=
 =?us-ascii?Q?M4nFvbjkEr2GB4WQ53cBn9t9pqK2pHFddwk6KPvqtfvxZO8wkdpbxVyq+2cm?=
 =?us-ascii?Q?peBK0RCAwV/d2CTdKVtJAXQ2cylGux0RymH0f4Gl72tmMB78japliye6cSU4?=
 =?us-ascii?Q?l8uS0xXIFFUBpYph5pMtmbeaF54kss11OI+hYoaRzkhYHHlt3xGDEjKPjIoq?=
 =?us-ascii?Q?Wi0UgaiLxhepzoN0Jn0dlAzZkKVJA26bsG2kptAXIx0r2S65/DBYQx/4LJpb?=
 =?us-ascii?Q?ZZ3mwys0gtEm2j+q1gqm28by5LFHy6awju5ADr2OoZ5WHhpDIidBj/mlB1a6?=
 =?us-ascii?Q?2f5ibsrlNqHJcT511LCQNAUtSPLPt4WuiQSes68g/YZDWAuiR/C8Ehj+RYwf?=
 =?us-ascii?Q?fqHPflTJNeMtWXRgWogbS8fvJdCUAUVSGLijGlT22KKBC4po/BY0LS16ByWA?=
 =?us-ascii?Q?M/dwaqf5B89IkJqhiAdcnoreMlh/tGa0NIy+bnpZPfGLtU01udmCbikB6zbS?=
 =?us-ascii?Q?JDO/sLF2/ujLzD6JBrx8fAmXcIwpeYQnUvBY0pZqIte5ie1GNN+Oy/9ACsOH?=
 =?us-ascii?Q?M9OOyxs4EoOUBIgSas8d4rae+JKhro3Ox6mpI8VEfvcNo6Cxa6gnxpp2pCMg?=
 =?us-ascii?Q?pFpQm5Ie6OJ2AMesf2Md2DwTSVLnoZeTuDL7S5jkURMrHhHku4V+jx6Gw+J4?=
 =?us-ascii?Q?loB0gpXt6Q7r6McbqfIkgbXGv5iFCxyrGSWZ6Wri6QnmrmN6MZ482f997+N6?=
 =?us-ascii?Q?bAArzJWL6p6GiTYBSxiQsIXwzh44Uln6SKmuxOw6nuzTwB/lSUa/O4L13kJk?=
 =?us-ascii?Q?qLHj/6QdNQVA4RfgvjyNZ78nwfJKk6MKJlcLPnCYsWQcNt3N4qFztAJBA1F5?=
 =?us-ascii?Q?UxpGwgFq6r2c6TokoEfkwdBi+GFsAIHPFgQVB2G6dpJohg5DJjicRqmnpo+1?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91194a45-9688-403d-b61a-08dc3266575e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 22:50:31.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHLfEl4Z8aEqXPjC5bJt22k8mRoZwVWhdChuCN60Z+9wx7gC4bpoj6oMZhCFd8F5NUq+lztXER9mxhRnLw0WrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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

On Tue, Feb 13, 2024 at 01:14:34PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> When debugging GPU hangs Mesa developers are finding it useful to replay
> the captured error state against the simulator. But due various simulator
> limitations which prevent replicating all hangs, one step further is being
> able to replay against a real GPU.
> 
> This is almost doable today with the missing part being able to upload the
> captured context image into the driver state prior to executing the
> uploaded hanging batch and all the buffers.
> 
> To enable this last part we add a new context parameter called
> I915_CONTEXT_PARAM_CONTEXT_IMAGE. It follows the existing SSEU
> configuration pattern of being able to select which context to apply
> against, paired with the actual image and its size.
> 
> Since this is adding a new concept of debug only uapi, we hide it behind
> a new kconfig option and also require activation with a module parameter.
> Together with a warning banner printed at driver load, all those combined
> should be sufficient to guard against inadvertently enabling the feature.
> 
> In terms of implementation the only trivial change is shadowing of the
> default state from engine to context. We also allow the legacy context
> set param to be used since that removes the need to record the per context
> data in the proto context, while still allowing flexibility of specifying
> context images for any context.
> 
> Mesa MR using the uapi can be seen at:
>   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27594

I just wonder if it would be better to split the default_state in a separate
patch.... but from what I could see it looks correct.

Also, I have to say that this approach is nice, clean and well protected.
And much simpler then I imagined when I saw the idea around.

Feel free to use:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.debug            |  17 +++
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 106 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>  drivers/gpu/drm/i915/gt/intel_context.h       |  22 ++++
>  drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
>  drivers/gpu/drm/i915/gt/intel_lrc.c           |   8 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   8 +-
>  drivers/gpu/drm/i915/i915_params.c            |   5 +
>  drivers/gpu/drm/i915/i915_params.h            |   3 +-
>  include/uapi/drm/i915_drm.h                   |  27 +++++
>  10 files changed, 194 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 5b7162076850..32e9f70e91ed 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -16,6 +16,23 @@ config DRM_I915_WERROR
>  
>  	  If in doubt, say "N".
>  
> +config DRM_I915_REPLAY_GPU_HANGS_API
> +	bool "Enable GPU hang replay userspace API"
> +	depends on DRM_I915
> +	depends on EXPERT
> +	default n
> +	help
> +	  Choose this option if you want to enable special and unstable
> +	  userspace API used for replaying GPU hangs on a running system.
> +
> +	  This API is intended to be used by userspace graphics stack developers
> +	  and provides no stability guarantees.
> +
> +	  The API needs to be activated at boot time using the
> +	  enable_debug_only_api module parameter.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_I915_DEBUG
>  	bool "Enable additional driver debugging"
>  	depends on DRM_I915
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dcbfe32fd30c..1cfd624bd978 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -78,6 +78,7 @@
>  #include "gt/intel_engine_user.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_ring.h"
> +#include "gt/shmem_utils.h"
>  
>  #include "pxp/intel_pxp.h"
>  
> @@ -949,6 +950,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -2092,6 +2094,88 @@ static int get_protected(struct i915_gem_context *ctx,
>  	return 0;
>  }
>  
> +static int set_context_image(struct i915_gem_context *ctx,
> +			     struct drm_i915_gem_context_param *args)
> +{
> +	struct i915_gem_context_param_context_image user;
> +	struct intel_context *ce;
> +	struct file *shmem_state;
> +	unsigned long lookup;
> +	void *state;
> +	int ret = 0;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API))
> +		return -EINVAL;
> +
> +	if (!ctx->i915->params.enable_debug_only_api)
> +		return -EINVAL;
> +
> +	if (args->size < sizeof(user))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&user, u64_to_user_ptr(args->value), sizeof(user)))
> +		return -EFAULT;
> +
> +	if (user.mbz)
> +		return -EINVAL;
> +
> +	if (user.flags & ~(I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX))
> +		return -EINVAL;
> +
> +	lookup = 0;
> +	if (user.flags & I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX)
> +		lookup |= LOOKUP_USER_INDEX;
> +
> +	ce = lookup_user_engine(ctx, lookup, &user.engine);
> +	if (IS_ERR(ce))
> +		return PTR_ERR(ce);
> +
> +	if (user.size < ce->engine->context_size) {
> +		ret = -EINVAL;
> +		goto out_ce;
> +	}
> +
> +	if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> +		ret = -EBUSY;
> +		goto out_ce;
> +	}
> +
> +	state = kmalloc(ce->engine->context_size, GFP_KERNEL);
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto out_ce;
> +	}
> +
> +	if (copy_from_user(state, u64_to_user_ptr(user.image),
> +			   ce->engine->context_size)) {
> +		ret = -EFAULT;
> +		goto out_state;
> +	}
> +
> +	shmem_state = shmem_create_from_data(ce->engine->name,
> +					     state, ce->engine->context_size);
> +	if (IS_ERR(shmem_state)) {
> +		ret = PTR_ERR(shmem_state);
> +		goto out_state;
> +	}
> +
> +	if (intel_context_set_own_state(ce)) {
> +		ret = -EBUSY;
> +		fput(shmem_state);
> +		goto out_state;
> +	}
> +
> +	ce->default_state = shmem_state;
> +
> +	args->size = sizeof(user);
> +
> +out_state:
> +	kfree(state);
> +out_ce:
> +	intel_context_put(ce);
> +	return ret;
> +}
> +
>  static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  			struct i915_gem_context *ctx,
>  			struct drm_i915_gem_context_param *args)
> @@ -2144,6 +2228,10 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_persistence(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
> +		ret = set_context_image(ctx, args);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
> @@ -2488,6 +2576,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_ENGINES:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -2600,5 +2689,22 @@ int __init i915_gem_context_module_init(void)
>  	if (!slab_luts)
>  		return -ENOMEM;
>  
> +	if (IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)) {
> +		pr_notice("**************************************************************\n");
> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
> +		pr_notice("**                                                          **\n");
> +		if (i915_modparams.enable_debug_only_api)
> +			pr_notice("** i915.enable_debug_only_api is intended to be set         **\n");
> +		else
> +			pr_notice("** CONFIG_DRM_I915_REPLAY_GPU_HANGS_API builds are intended **\n");
> +		pr_notice("** for specific userspace graphics stack developers only!   **\n");
> +		pr_notice("**                                                          **\n");
> +		pr_notice("** If you are seeing this message please report this to the **\n");
> +		pr_notice("** provider of your kernel build.                           **\n");
> +		pr_notice("**                                                          **\n");
> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
> +		pr_notice("**************************************************************\n");
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index a2f1245741bb..b1b8695ba7c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -27,6 +27,8 @@ static void rcu_context_free(struct rcu_head *rcu)
>  	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>  
>  	trace_intel_context_free(ce);
> +	if (intel_context_has_own_state(ce))
> +		fput(ce->default_state);
>  	kmem_cache_free(slab_ce, ce);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 25564c01507e..9f523999acd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -375,6 +375,28 @@ intel_context_clear_nopreempt(struct intel_context *ce)
>  	clear_bit(CONTEXT_NOPREEMPT, &ce->flags);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
> +{
> +	return test_bit(CONTEXT_OWN_STATE, &ce->flags);
> +}
> +
> +static inline bool intel_context_set_own_state(struct intel_context *ce)
> +{
> +	return test_and_set_bit(CONTEXT_OWN_STATE, &ce->flags);
> +}
> +#else
> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
> +{
> +	return false;
> +}
> +
> +static inline bool intel_context_set_own_state(struct intel_context *ce)
> +{
> +	return true;
> +}
> +#endif
> +
>  u64 intel_context_get_total_runtime_ns(struct intel_context *ce);
>  u64 intel_context_get_avg_runtime_ns(struct intel_context *ce);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 7eccbd70d89f..b2ea14155ff0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -87,6 +87,8 @@ struct intel_context {
>  		struct rcu_head rcu;
>  	};
>  
> +	struct file *default_state;
> +
>  	struct intel_engine_cs *engine;
>  	struct intel_engine_cs *inflight;
>  #define __intel_context_inflight(engine) ptr_mask_bits(engine, 3)
> @@ -130,6 +132,7 @@ struct intel_context {
>  #define CONTEXT_PERMA_PIN		11
>  #define CONTEXT_IS_PARKING		12
>  #define CONTEXT_EXITING			13
> +#define CONTEXT_OWN_STATE		14
>  
>  	struct {
>  		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7c367ba8d9dc..1038659754f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1060,9 +1060,8 @@ void lrc_init_state(struct intel_context *ce,
>  
>  	set_redzone(state, engine);
>  
> -	if (engine->default_state) {
> -		shmem_read(engine->default_state, 0,
> -			   state, engine->context_size);
> +	if (ce->default_state) {
> +		shmem_read(ce->default_state, 0, state, engine->context_size);
>  		__set_bit(CONTEXT_VALID_BIT, &ce->flags);
>  		inhibit = false;
>  	}
> @@ -1174,6 +1173,9 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
>  
>  	GEM_BUG_ON(ce->state);
>  
> +	if (!intel_context_has_own_state(ce))
> +		ce->default_state = engine->default_state;
> +
>  	vma = __lrc_alloc_state(ce, engine);
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 92085ffd23de..72277bc8322e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -474,8 +474,7 @@ static int ring_context_init_default_state(struct intel_context *ce,
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
>  
> -	shmem_read(ce->engine->default_state, 0,
> -		   vaddr, ce->engine->context_size);
> +	shmem_read(ce->default_state, 0, vaddr, ce->engine->context_size);
>  
>  	i915_gem_object_flush_map(obj);
>  	__i915_gem_object_release_map(obj);
> @@ -491,7 +490,7 @@ static int ring_context_pre_pin(struct intel_context *ce,
>  	struct i915_address_space *vm;
>  	int err = 0;
>  
> -	if (ce->engine->default_state &&
> +	if (ce->default_state &&
>  	    !test_bit(CONTEXT_VALID_BIT, &ce->flags)) {
>  		err = ring_context_init_default_state(ce, ww);
>  		if (err)
> @@ -570,6 +569,9 @@ static int ring_context_alloc(struct intel_context *ce)
>  {
>  	struct intel_engine_cs *engine = ce->engine;
>  
> +	if (!intel_context_has_own_state(ce))
> +		ce->default_state = engine->default_state;
> +
>  	/* One ringbuffer to rule them all */
>  	GEM_BUG_ON(!engine->legacy.ring);
>  	ce->ring = engine->legacy.ring;
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index de43048543e8..1226af5fd96f 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -134,6 +134,11 @@ i915_param_named_unsafe(lmem_size, uint, 0400,
>  i915_param_named_unsafe(lmem_bar_size, uint, 0400,
>  			"Set the lmem bar size(in MiB).");
>  
> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
> +i915_param_named(enable_debug_only_api, bool, 0400,
> +	"Enable support for unstable debug only userspace API. (default:false)");
> +#endif
> +
>  static void _param_print_bool(struct drm_printer *p, const char *name,
>  			      bool val)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 1315d7fac850..e2cdf12ce611 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -64,7 +64,8 @@ struct drm_printer;
>  	/* leave bools at the end to not create holes */ \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
> -	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0) \
> +	param(bool, enable_debug_only_api, false, IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API) ? 0400 : 0)
>  
>  #define MEMBER(T, member, ...) T member;
>  struct i915_params {
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index fd4f9574d177..0af932e61d12 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2154,6 +2154,15 @@ struct drm_i915_gem_context_param {
>  	__u64 value;
>  };
>  
> +/*
> + * I915_CONTEXT_PARAM_CONTEXT_IMAGE:
> + *
> + * Allows userspace to provide own context images.
> + *
> + * Note that this is a debug API not available on production kernel builds.
> + */
> +#define I915_CONTEXT_PARAM_CONTEXT_IMAGE	0xe
> +
>  /*
>   * Context SSEU programming
>   *
> @@ -2549,6 +2558,24 @@ struct i915_context_param_engines {
>  	struct i915_engine_class_instance engines[N__]; \
>  } __attribute__((packed)) name__
>  
> +struct i915_gem_context_param_context_image {
> +	/** @engine: Engine class & instance to be configured. */
> +	struct i915_engine_class_instance engine;
> +
> +	/** @flags: One of the supported flags or zero. */
> +	__u32 flags;
> +#define I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX (1u << 0)
> +
> +	/** @size: Size of the image blob pointed to by @image. */
> +	__u32 size;
> +
> +	/** @mbz: Must be zero. */
> +	__u32 mbz;
> +
> +	/** @image: Userspace memory containing the context image. */
> +	__u64 image;
> +} __attribute__((packed));
> +
>  /**
>   * struct drm_i915_gem_context_create_ext_setparam - Context parameter
>   * to set or query during context creation.
> -- 
> 2.40.1
> 
