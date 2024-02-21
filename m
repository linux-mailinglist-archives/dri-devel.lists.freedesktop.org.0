Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A385EAB5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056D410E823;
	Wed, 21 Feb 2024 21:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRbs2Le0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2E10E817;
 Wed, 21 Feb 2024 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708550908; x=1740086908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N3PAtwDSTNM6KPFeVHASvaUT1tzyq/84v7I4bn3lYdw=;
 b=SRbs2Le0QMLOFPl6D/wAadNKqY5qQHVDZ2hjeie55Lup3QJaMPMX7tKH
 oOH0N1khLINpDv43Pi9FE6wMJV5D4tuTAnkoEtDfA82C24DB2KjCT1fDZ
 hrV2xoFzVvUD8HuLCzi7vJcJdDi+eCi04p6/IRYvf+efByZsuhDvYhjJD
 ejXazL3K9G/zmunrxBuu0NFYshtsKFCP4nCMtOOVBltoorf3DJVfXs60c
 YdvPBL4MT9cZN7Nr9pN5S8FYEYTKJXVxK7p6jD654ydO3Plkr40UYhylv
 vHpT1kWX2LAw7ubbeA+3yYAikZZrUOWd116BUiXB/dc0bY0YaLY23mZue w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28182868"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="28182868"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5278162"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 13:28:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:28:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 13:28:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 13:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9Fl4kLveewmxsWI5ii5RuOVbdPqoMefQ33cEQi/54Cf8BEaE3i1TWP/7rbroCmBEkeaT+KQSxp/HIltOkgIMcbWKUKaMrPv6X6pQIe5bg2JeeLfMcjyLfg2WvMGyMzqXU9H4oK8BKpm1H7FX2w5JbQu3EmkdG6mVpNBeqK5PFPqXpIcer2yPrtnFM6pK3dWqOHa6Ei0An5APiNOPBhvjwnTm0W9QEfPNml/KVYP/rNVUzFdloxZViOQju875OsBaIHCDcvXUPKFOXun0eEwHiOlR7Nq9uWtURcwNREzFdHTvRkSr8DKDnsX6NmkIWHNJ9Xi3NiXCjcycs2S5YfgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V019Oc8pyzGppzuiglDeDiBnr9YWAlrE6QoHs0MFQkE=;
 b=StVn+Z5OfcdXqfd671wvG2YlCUJtJ8k0ulZFMdvhluVWF8D6ZL7E2eBsCZJB9M42a/jv8dOthCcDE8PTvrIeRJer/CLu1tC2asl/7C6UMuWS2XRIyG0NuHPwE7239cmydGxkItIZAxJ3SIMXYm+gAmiNKGNd5woaqWsAipy6nMVIQ1kWKa7BJKFIZl/vOwR2wlI6T70ZAsckYonpo0WnvIaFFl0AGs9AdgP4jJEvYGID1ZGE1SGsvuSRoCBIjk72TdnRF6zovAezKciEsrWV5t13ryvYSg92p5eMFAl+4j1eLMja1zvcAQ95kFcCGnPGI3uqG5FBp97tViL6Qrs//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 21:28:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 21:28:24 +0000
Date: Wed, 21 Feb 2024 16:28:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Add Compute context hint
Message-ID: <ZdZq9NH0VYbL-QV8@intel.com>
References: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
 <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6f517e-6b08-4b20-b2df-08dc332408b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPNasQ9kebklwlJmMmeOQXo2C0oNOi0meQRpAVzAcKeNC/6hxZNKi9zW7i2ue5vLvCbzcCS17GGV6znKwAESi+NohW2y4cLCqTGvGgI6grrlDn4VKMrkhzyYux/4qbTKuVPYsyb7HgZkhNsDzQrQ8Qea9odpRw73gKzIW9qocRXku+LDE8+JDicrPQ34CilDaiTmWSSyyCTtkx4yPrkUYZhB6VRqgKhbtnGJA6qaXVbABr7VhaHT/RAP1k74M/K6fnZwdEEfUzbZRBIdCX4KWl5Wp3+IbrHhfFan9W30uTNcnPnvDLKCib4uAZf20MEyUgs2XzqZVzyRYuxq+l5sJlfj+8yPx1J3heUfKh/gLkkk3zp3yUuk3c2kmo7SIk9z4pdOlfOIup2p/MAsSD5PJy/ZeZmwXji3m58Cc/19ytsxlt33TKppoKBXdQnaxkD47TlxdKtN+qoq3dHB03HWYGs6mH7Ozsv8crxCfgw0BxSS7xFtdSTDPLOf9uc9AZlYnfspM3NCkeu/reV9Zt1qUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgdCTespnkzfX9VK9NLeQLOiFA1iv/2ZiLV1o/BJRKwRwfDgtwBcANw6neX0?=
 =?us-ascii?Q?Hkk+KPZBJOtiGSsOlDWp+Rda/3AYPZDYxDEb6JqTdd9Kqlvw/LSM/6jVgZmf?=
 =?us-ascii?Q?YuIQcahRAIoVZptik1zeDiAUzLwRj66vjL/k7ueteFR1Tb6kPLAog7QcfE7n?=
 =?us-ascii?Q?XqMEWMUV7o3KintMDqZa5kxI+8U0M89UCfMxc0GIeJwPPzOe7oPo8dRtv3aP?=
 =?us-ascii?Q?pi3dGJNyf5BnQxnW6c+o6iIrl7JQmZytay4HO/f73ByshjAvkR6xdNYJuo67?=
 =?us-ascii?Q?bqdzopgWpAU7dN9NA6ts6nIbVYP0Ox/URgm+7ebt9lk7mumQtud+Qgd8UJAG?=
 =?us-ascii?Q?Kv57JWyM4ThttSdZ7yLO+X3FFPP9JXoMYYp0a9E3Oynzie0NPev+UYhoAHlm?=
 =?us-ascii?Q?iVxC4Hup7cRqYq81kV+RV/C8sE2D+Yz3ISO1bLa6jAScAD3QvL3QvfSHWtLR?=
 =?us-ascii?Q?rkzW205bWUkiaWpq8XDvN7bG8qLqMOkILdLNKphsJP+MiS5ixdmj71/WZefS?=
 =?us-ascii?Q?zxqRQSoiuC9qCPGHRJbGFd1fnAZJon7apxgi36mGlnZ5rHKYjv9nXhVHjhbe?=
 =?us-ascii?Q?mz0cU0X/Y7X4Hh76bV+kYhvnAJTvw0GMBtexNlYWeKpvwo/c9cXznGomyv5j?=
 =?us-ascii?Q?lhuS1mx2XDFWqGHfkxV8dOP1nosIBCjktMcFbZPVQeo9RwC3pLTFZ9Zx76Hb?=
 =?us-ascii?Q?XWUQz93fXAPBc3p4VQYxuwvSYVyS2Up12k4CUdqAMW6UA0ychnPl2bKC6jG7?=
 =?us-ascii?Q?lCoWewaHw0HEG+WuQ9HI/kAatI2X2FVbQCOSK08gz+KRVa9mwjbqCgKb4V4m?=
 =?us-ascii?Q?XwmSPKbJDeNq9jZOs6WEQqOwyZcEiLk3QsnURjRtvu5yWKNbZz7Oqeb/cvW2?=
 =?us-ascii?Q?A1QyAGPxGoZPJ7CBw0pjOcofx5pdPjnlsC8pJWOvwgAoId9GIBzxDttkSMea?=
 =?us-ascii?Q?ujby/iKTshh8TMTaSJpryde6dZKURdiK+J5jjSjnyMdlY4b3fFf+dpAcx0mL?=
 =?us-ascii?Q?bEy2k7INXYpZWvVkUHz2ftQKQCV0/GACwFnXRYBtRiN1MYKnzbQeCx5gOXpd?=
 =?us-ascii?Q?yUFqKT/gCB1NBqOw/s8l7cYhEEv1cx558D4e29U9Sa8xsYl5MB2pheO6Vj2x?=
 =?us-ascii?Q?xp6ACyxEkrCg7DulDWRp+AXQgembm7T+KlUked1XNFlrdU4Yq3V8yOKa88nt?=
 =?us-ascii?Q?qJsmkyFu9T6ksHXg8Yx04xDokmydPPRJ3QYBNaMLJm5VZ97qSBl2j/9vkQd9?=
 =?us-ascii?Q?6MDpEYuNYznC7J701Hvaf0GXJFdlgNjIJQfZeu27Vb/rTh9PBXbgVTEsVy7v?=
 =?us-ascii?Q?CBmYeyQw+xs+xDegN97udwLME70//G0D0ubGwkRhDQ+jZaUvdfQDat0aCIwX?=
 =?us-ascii?Q?N/bllCa2ZfiD8f18CHMnrhkv6lm0Yi4yr1NSK111vFrTCbAQxic0i2vXakts?=
 =?us-ascii?Q?Bvy6tKBXLo3KIcSnCbb/qNxrOg/bB/x4Z4D70bsMBNQMtk8qKhUZBAN7JOHY?=
 =?us-ascii?Q?+AknTAdeCgAF4VzZRF+sOieDoHR1RdcxmAYKgf/FKmcAjMz05rCv3ZQCHeHy?=
 =?us-ascii?Q?invIWtOQrgBtorYkWhYEr4O0O9DzwowDc0V0KBesl9qSQ3K3Q/ViX77AVmmH?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6f517e-6b08-4b20-b2df-08dc332408b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:28:24.0518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reEQMXnMEgQjQoPUnMrV1kumDwJGX18llVjKVKrdHzkVrNiaGvmAthKlwRJG/gydT38MIh6D26QqXM5x9oL1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

On Wed, Feb 21, 2024 at 09:42:34AM +0000, Tvrtko Ursulin wrote:
> 
> On 21/02/2024 00:14, Vinay Belgaumkar wrote:
> > Allow user to provide a context hint. When this is set, KMD will
> > send a hint to GuC which results in special handling for this
> > context. SLPC will ramp the GT frequency aggressively every time
> > it switches to this context. The down freq threshold will also be
> > lower so GuC will ramp down the GT freq for this context more slowly.
> > We also disable waitboost for this context as that will interfere with
> > the strategy.
> > 
> > We need to enable the use of Compute strategy during SLPC init, but
> > it will apply only to contexts that set this bit during context
> > creation.
> > 
> > Userland can check whether this feature is supported using a new param-
> > I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true for all guc submission
> > enabled platforms since they use SLPC for freq management.
> > 
> > The Mesa usage model for this flag is here -
> > https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
> 
> This allows for setting it for the whole application, correct? Upsides,
> downsides? Are there any plans for per context?

Currently there's no extension on a high level API (Vulkan/OpenGL/OpenCL/etc)
that would allow the application to hint for power/freq/latency. So Mesa cannot
decide when to hint. So their solution was to use .drirc and make per-application
decision.

I would prefer a high level extension for a more granular and informative
decision. We need to work with that goal, but for now I don't see any
cons on this approach.

> 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
> >   .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
> >   drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
> >   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
> >   drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
> >   include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
> >   9 files changed, 89 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index dcbfe32fd30c..ceab7dbe9b47 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
> >   			       struct i915_gem_proto_context *pc,
> >   			       struct drm_i915_gem_context_param *args)
> >   {
> > +	struct drm_i915_private *i915 = fpriv->i915;
> >   	int ret = 0;
> >   	switch (args->param) {
> > @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
> >   			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
> >   		break;
> > +	case I915_CONTEXT_PARAM_IS_COMPUTE:
> > +		if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > +			ret = -EINVAL;
> > +		else
> > +			pc->user_flags |= BIT(UCONTEXT_COMPUTE);
> > +		break;
> > +
> >   	case I915_CONTEXT_PARAM_RECOVERABLE:
> >   		if (args->size)
> >   			ret = -EINVAL;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > index 03bc7f9d191b..db86d6f6245f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > @@ -338,6 +338,7 @@ struct i915_gem_context {
> >   #define UCONTEXT_BANNABLE		2
> >   #define UCONTEXT_RECOVERABLE		3
> >   #define UCONTEXT_PERSISTENCE		4
> > +#define UCONTEXT_COMPUTE		5
> 
> What is the GuC behaviour when SLPC_CTX_FREQ_REQ_IS_COMPUTE is set for
> non-compute engines? Wondering if per intel_context is what we want instead.
> (Which could then be the i915_context_param_engines extension to mark
> individual contexts as compute strategy.)

Perhaps we should rename this? This is a freq-decision-strategy inside
GuC that is there mostly targeting compute workloads that needs lower
latency with short burst execution. But the engine itself doesn't matter.
It can be applied to any engine.

> 
> >   	/**
> >   	 * @flags: small set of booleans
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index 4feef874e6d6..1ed40cd61b70 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -24,6 +24,7 @@
> >   #include "intel_pcode.h"
> >   #include "intel_rps.h"
> >   #include "vlv_sideband.h"
> > +#include "../gem/i915_gem_context.h"
> >   #include "../../../platform/x86/intel_ips.h"
> >   #define BUSY_MAX_EI	20u /* ms */
> > @@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
> >   		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
> >   		if (rps_uses_slpc(rps)) {
> > +			const struct i915_gem_context *ctx;
> > +
> > +			ctx = i915_request_gem_context(rq);
> > +			if (ctx &&
> > +			    test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
> > +				return;
> > +
> 
> I think request and intel_context do not own a strong reference to GEM
> context. So at minimum you need a local one obtained under a RCU lock with
> kref_get_unless_zero, as do some other places do.
> 
> However.. it may be simpler to just store the flag in intel_context->flags.
> If you carry it over at the time GEM context is assigned to intel_context,
> not only you simplify runtime rules, but you get the ability to not set the
> compute flags for video etc.

+1 on the intel_context->flags

> 
> It may even make sense to add a "don't waitboost" flag on top of the "is
> compute" so this call site becomes self-documenting (otherwise I ask to add
> a comment here please). Then you could even move it out from the SLPC
> special case.

+1 on the dont_waitboost flag as well. might be worth for other cases
like display metrics for instance.

> 
> >   			slpc = rps_to_slpc(rps);
> >   			if (slpc->min_freq_softlimit >= slpc->boost_freq)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > index 811add10c30d..c34674e797c6 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > @@ -207,6 +207,27 @@ struct slpc_shared_data {
> >   	u8 reserved_mode_definition[4096];
> >   } __packed;
> > +struct slpc_context_frequency_request {
> > +	u32 frequency_request:16;
> > +	u32 reserved:12;
> > +	u32 is_compute:1;
> > +	u32 ignore_busyness:1;
> > +	u32 is_minimum:1;
> > +	u32 is_predefined:1;
> > +} __packed;
> > +
> > +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> > +
> > +struct slpc_optimized_strategies {
> > +	u32 compute:1;
> > +	u32 async_flip:1;
> > +	u32 media:1;
> > +	u32 vsync_flip:1;
> > +	u32 reserved:28;
> > +} __packed;
> > +
> > +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> > +
> >   /**
> >    * DOC: SLPC H2G MESSAGE FORMAT
> >    *
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > index 3e681ab6fbf9..706fffca698b 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
> >   	return ret;
> >   }
> > +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
> > +{
> > +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > +	intel_wakeref_t wakeref;
> > +	int ret = 0;
> > +
> > +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > +		ret = slpc_set_param(slpc,
> > +				     SLPC_PARAM_STRATEGIES,
> > +				     val);
> > +
> > +	return ret;
> > +}
> > +
> >   int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
> >   {
> >   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> >   	/* Set cached media freq ratio mode */
> >   	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
> > +	/* Enable SLPC Optimized Strategy for compute */
> > +	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > +
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > index 6ac6503c39d4..1cb5fd44f05c 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
> >   void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
> >   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
> >   int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
> > +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index f3dcae4b9d45..bbabfa5532e5 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
> >   MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> >   MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> >   MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
> > +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
> >   #undef MAKE_CONTEXT_POLICY_ADD
> > @@ -2662,8 +2663,10 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> >   	struct intel_engine_cs *engine = ce->engine;
> >   	struct intel_guc *guc = &engine->gt->uc.guc;
> >   	struct context_policy policy;
> > +	struct i915_gem_context *ctx = rcu_dereference(ce->gem_context);
> >   	u32 execution_quantum;
> >   	u32 preemption_timeout;
> > +	u32 slpc_ctx_freq_req = 0;
> >   	unsigned long flags;
> >   	int ret;
> > @@ -2675,11 +2678,15 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> >   	execution_quantum = engine->props.timeslice_duration_ms * 1000;
> >   	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > +	if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
> > +		slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > +
> >   	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> >   	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> >   	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
> >   	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> > +	__guc_context_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
> >   	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> >   		__guc_context_policy_add_preempt_to_idle(&policy, 1);
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> > index 5c3fec63cb4c..0f12e36b2a12 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
> >   		 */
> >   		value = 1;
> >   		break;
> > +	case I915_PARAM_HAS_COMPUTE_CONTEXT:
> > +		/* This feature has been available in GuC for a while but
> > +		 * a use case now required the use of this feature. We
> > +		 * return true now since this is now being supported from
> > +		 * the kernel side as well.
> > +		 */
> 
> Nit - stick to the multi-line comment style i915 uses please.
> 
> Regards,
> 
> Tvrtko
> 
> > +		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > +			value = 1;
> > +		else
> > +			value = -EINVAL;
> > +		break;
> >   	case I915_PARAM_HAS_CONTEXT_ISOLATION:
> >   		value = intel_engines_has_context_isolation(i915);
> >   		break;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 2ee338860b7e..1bd12f536108 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
> >    */
> >   #define I915_PARAM_PXP_STATUS		 58
> > +/*
> > + * Query if kernel allows marking a context as a Compute context. This will
> > + * result in more aggressive GT frequency ramping for this context.
> > + */
> > +#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
> > +
> >   /* Must be kept compact -- no holes and well documented */
> >   /**
> > @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
> >    * -EIO: The firmware did not succeed in creating the protected context.
> >    */
> >   #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> > +
> > +/*
> > + * I915_CONTEXT_PARAM_IS_COMPUTE:
> > + *
> > + * Mark this context as a Compute related workload which requires aggressive GT
> > + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check if the kernel
> > + * supports this functionality.
> > + */
> > +#define I915_CONTEXT_PARAM_IS_COMPUTE		0xe
> >   /* Must be kept compact -- no holes and well documented */
> >   	/** @value: Context parameter value to be set or queried */
