Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71645870DF0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01B21125FF;
	Mon,  4 Mar 2024 21:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRwoGbLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952781125FF;
 Mon,  4 Mar 2024 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709588354; x=1741124354;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iTyDm8zlJy99D30s115mi47MkZmsLw6OJb7k47GQpyk=;
 b=IRwoGbLZk4SR1xidNRr8ezGeFj4v6g2IS8c/IftkEIcchJJevJu/tyFQ
 JwNZdLPMScDjmKNC3sJZhlUoQu+3z+RGnr2WCF9WP4+6Yb98EG7wKIbQn
 Gcw1JZ49qW1f4fKoqNB6vXx/aYFUQxCFi26DOCeQvt4DcSGid4CRBwjyM
 dHX+WM3N0hwYFPlUqxu/xVkd6grJ9nssh5aqcAufkoWxK/xh5wDcCDkD9
 H/ICgx6TrRInfmxW9Gcwpnb88QLvDxM+hJuSYASxuYU7LKWutGUFGk5ea
 5ulzZLigEqEVH6YE3Lb2AtZ/JWbnJM9v9izDFHrCEW9dtcprc13qFZLO9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4273206"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4273206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 13:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9045707"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 13:39:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 13:39:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 13:39:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 13:39:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 13:39:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=araq0biSdnIURdFCuEvTProy4X0mHF/Qb1K1UPkx7PRX/Q5PzSzffi/Uh7W1wEkt5AnCY+YcSZEAjOil0nrgRxzki97TJil7rsIa91ODf1HDScN7+FBe6+5XjLgC1TQgrqCUzTaJOlgqF+/8NJLBUCPmxnzP4CKii4MnoKev1ZIzo9j/I4Vl0YNxzk9l9AvEBK1eTwImtgh03UkREWxYUM1W7i6iNOKhZLNuZZYT/xH3SnSE06qVa4Kjv8+R9/yTSC0+gk7OdLDmXNNb/icCYasV4fS0WIXwDX0v0tBGdsF+KaQuINQ7KfILexrziOsShvrpQfhbJ9522bUJYvlXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UX8zM/lzRKbxkH5OAITTJJ/ml/aayxNqbG5VyTZlz+g=;
 b=AM8vOTElofiI1PPW4nRZ0BUDcJCVAHPRMbM8eYLUevnmY555F2tspidc2pH+Si0YaCsVSPITWhFr78fu4ebLLt3JnXAyCZYMn8U2WhfD3VPjyvDA56oRRFRYb2agGvR4ytzzs5OiHdQfjLmNY00rC2WPmlGjUM2XFF1aeBg8Nh8dmUSmguezTV9RAd3f4rSERX3yPCXX6lzq5pCz0BFMGVLAsSlfgDO2UI6OhApG/KpEBa/C7wlU3zB2kTbQkgrX7de0kj03nOlGGrV/89xqUdw+7i2/7c+hhX3Xx56DApUBDGIOlwxDyjApPHW4rBVr0nJeN1BCcannx4iW4KfM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 21:39:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 21:39:09 +0000
Date: Mon, 4 Mar 2024 16:39:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sushma
 Venkatesh Reddy" <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v2] drm/i915/guc: Use context hints for GT freq
Message-ID: <ZeY_eVrfRDXSz1mk@intel.com>
References: <20240227235131.2308656-1-vinay.belgaumkar@intel.com>
 <a3d36d95-ea7e-4796-99a0-2ad2730624f6@linux.intel.com>
 <1e21207b-66d8-4346-be4d-0a67c9a30eaf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e21207b-66d8-4346-be4d-0a67c9a30eaf@intel.com>
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c31164e-0ea8-4ffc-5916-08dc3c938687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Onb016alsQ4yFXxPO0n3eADqUQbR8hHjrwp6KzkrPrPBeY25nFMUFtKJEXJVKgeZ0kZ/b55U/3aJFKk1Bxl28WUUjDfudDX/spY48gT+xBG7IvVdnWjgL//3w1IDeBJA+NCNXTy334pq+/a1ElgFp+oBSVIze4HrhG9G/pKV5oHh47+dP+Bddf3bdmROoHx00N5tFOushEMJlGDfVldrNKRRJ2Ubk4i1WfCWN2HrLng/xhnLOd1JFEMAqqIdNrajjKJCD6m6y6mYlfRMVUUIah4CQDCWJoOI7HKcbMNvFmolYqfXZPNIc0HJVwOyQ2jOVGoHMLJYfiwWxS6MhOX4ZPfrx/Fl15HNHxeqOGyVRTm93rFYcm9fcUsRj6kNqUc+HmFUVpoz6363Pl11QeFMkPCRmNjnwjUGvAN+5gESo2RNxwUCOtu55i49sE2mfrqxAR9tWvmSsJLBd/Q3ve7CFQOLG2YtIGk4YehUMb8PqEsJ4zBBx+fJ7eF3u/O9+QaaYUMf0Ccn8cWQCMc+awbepWjfrTYpreZhryFmQ3mefz8W47sKV4t+AZ+OGU5RhvrmtXY06xCrTh43mXsNQuOPDi2bPjW0vHbQTJxoPaYU0Bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?m8sM0PHZlGKdneKO03tDwHKBF7AWw4/qaZDpi/AGETYlmTAc7f2w1G36JU?=
 =?iso-8859-1?Q?jTeTR2e7F+jk7cuTp+/+bpaQRDYNNIdEGMc41O1g/RHyFIRQXI4yh9gFKT?=
 =?iso-8859-1?Q?RwO2AMU1d7XEL3jzzX8+3XDMfdWKeobddFSjGsB1bQ5UQXLpUXAwaVAVAL?=
 =?iso-8859-1?Q?4MOzrRsI2ghcq+kXCUKsTKlGC99tffYbrcH0Gkn8a4/MCeMvmSxK/tKYEP?=
 =?iso-8859-1?Q?XmtGX9HdAkB63ob86czCp+nNnHIe3EWXAw2pT1IQJeiLIDcOyUvxyygGeq?=
 =?iso-8859-1?Q?2/hQffOgjc420rd+0vOAdMzanqU5Lw/ro5UNMrAb9Ey2YG/Mf6L4AwlR5O?=
 =?iso-8859-1?Q?DJO+tKPuHQYbwXCitV2kl+GHaazvLygV5/B4zxV1jA4HNk6DmuCOiBUxD4?=
 =?iso-8859-1?Q?AwjKPYfg04r8HjR3CjONQduwcTEOT5g3i3+FnaGckj0I/CiNGvSE7Tx/wS?=
 =?iso-8859-1?Q?Yu0QQukjalGYsJ+mJFzMsN8nzh9cZmG1/8ysdqmVo0IOoHpt34IqTHqwQU?=
 =?iso-8859-1?Q?8O6OemEowvp8C7oKAQPsNWJDiuOCDYW8eSCT5zCYhXKhQ4hdKjO05KiwAh?=
 =?iso-8859-1?Q?7VBO+YqOLJU/cucBpU4ew6UJOeMhKceMPxVIPD0twwHrXnKieEjxfemZX7?=
 =?iso-8859-1?Q?X+Jh0TCBr3bmMtU2tIvaSy0ts3HaMonkB9B2zfxquTY84AZ33PX60CP5rv?=
 =?iso-8859-1?Q?uPcszKNCz0HXneA/5yMygBhl1tBP4lwAe6SYF39rYoOvXs/qD/6wu2zxYU?=
 =?iso-8859-1?Q?gBMa7cZIFDBOnke5u8lW3WEzkJ/fCEMiNjZNq01dnaT5MVmhshCNpxV6zM?=
 =?iso-8859-1?Q?Tr4LCQeNCuwDaTdmN6kecvmd9BaoqHhQ10YHjY37xxCPCbDmUqSN8oQizy?=
 =?iso-8859-1?Q?n+GLOzpoIfhHJoyTqQIENblglX0sZ25QA/s2OXg6n9c26cPN80CKeTbT62?=
 =?iso-8859-1?Q?TCbvaR0v5oy+3YeGzsj/bjnAR/48JDrqMChdMY9rSEkynJI3iyjnl402U4?=
 =?iso-8859-1?Q?dmRpDd6GGrLiw9/GarpEniE4SiWg5J34WbQebalV0iFNjAgpkg14MQWnpE?=
 =?iso-8859-1?Q?dnWrH2ifVIV+KDkxGLn6yP9U6ghoaolL/y69t7CZkR4ICPZHkTOTCJLguM?=
 =?iso-8859-1?Q?fSqCb0kH39DTR2eWWAiG2cGp55JPy0sjovZx8lSHOgkdp06Ki5hK8/3YIO?=
 =?iso-8859-1?Q?/GvhcJ27Vtm20Wyn0YMtbTVIlLaw2M5NaLX3AVYtYYBtSvLuAfGvi/VhKC?=
 =?iso-8859-1?Q?hVyl0u8rOi2XUZn/do6/3nxzx4p7ikuF4lCcSIt8oQ72vjfb/4BE5toO1I?=
 =?iso-8859-1?Q?k42AV9ETxdEAszYlgiUo913zuZSRdlx8IGl8bs5v0T6VQhdKrMBnZa8fQt?=
 =?iso-8859-1?Q?DRPnhq+Vfz58N2DM4nicjpeghqttSMKk8IstrIGT9Dy+dVeizfbkrDx8+4?=
 =?iso-8859-1?Q?m3rk8yjhDL1Pb2dPzTbWdXZX5z5+bUyWDsqxp9zXyRXWN+0esVa2YKJR74?=
 =?iso-8859-1?Q?52XwzpByZxQ4dIdSYJZW8a/0chKuLK7n9FZsU5REjFjTNWnPmN444imaUG?=
 =?iso-8859-1?Q?uoFg7Ae7GHGHIqxWt1KM2KE2FrvLJjU2Fe/lWxTRtoy6jMbXmkXBlUXcze?=
 =?iso-8859-1?Q?pqJvkkSFKWP4Z0S7799aGR5qUt0i4pW3wPzYiCyzd+9Bw/+eV0Ibs4Yg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c31164e-0ea8-4ffc-5916-08dc3c938687
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 21:39:09.7589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekrMxoSZcYGOzMqfBKFwu+i9Vl7Xx8/O3RyWb5hh+hJYfKVJPMda9yhrWTiM6BguZg9tGLeaSdxax+74rn9D9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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

On Wed, Feb 28, 2024 at 11:58:06AM -0800, Belgaumkar, Vinay wrote:
> 
> On 2/28/2024 4:54 AM, Tvrtko Ursulin wrote:
> > 
> > On 27/02/2024 23:51, Vinay Belgaumkar wrote:
> > > Allow user to provide a low latency context hint. When set, KMD
> > > sends a hint to GuC which results in special handling for this
> > > context. SLPC will ramp the GT frequency aggressively every time
> > > it switches to this context. The down freq threshold will also be
> > > lower so GuC will ramp down the GT freq for this context more slowly.
> > > We also disable waitboost for this context as that will interfere with
> > > the strategy.
> > > 
> > > We need to enable the use of SLPC Compute strategy during init, but
> > > it will apply only to contexts that set this bit during context
> > > creation.
> > > 
> > > Userland can check whether this feature is supported using a new param-
> > > I915_PARAM_HAS_CONTEXT_FREQ_HINTS. This flag is true for all guc
> > > submission
> > > enabled platforms as they use SLPC for frequency management.
> > > 
> > > The Mesa usage model for this flag is here -
> > > https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
> > > 
> > > v2: Rename flags as per review suggestions (Rodrigo, Tvrtko).
> > > Also, use flag bits in intel_context as it allows finer control for
> > > toggling per engine if needed (Tvrtko).
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 15 +++++++++++--
> > >   .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
> > >   drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
> > >   drivers/gpu/drm/i915/gt/intel_rps.c           |  5 +++++
> > >   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++++
> > >   drivers/gpu/drm/i915/i915_getparam.c          | 12 +++++++++++
> > >   include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
> > >   10 files changed, 92 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index dcbfe32fd30c..0799cb0b2803 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct
> > > drm_i915_file_private *fpriv,
> > >                      struct i915_gem_proto_context *pc,
> > >                      struct drm_i915_gem_context_param *args)
> > >   {
> > > +    struct drm_i915_private *i915 = fpriv->i915;
> > >       int ret = 0;
> > >         switch (args->param) {
> > > @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct
> > > drm_i915_file_private *fpriv,
> > >               pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
> > >           break;
> > >   +    case I915_CONTEXT_PARAM_LOW_LATENCY:
> > > +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > > +            pc->user_flags |= BIT(UCONTEXT_LOW_LATENCY);
> > > +        else
> > > +            ret = -EINVAL;
> > > +        break;
> > > +
> > >       case I915_CONTEXT_PARAM_RECOVERABLE:
> > >           if (args->size)
> > >               ret = -EINVAL;
> > > @@ -992,6 +1000,9 @@ static int intel_context_set_gem(struct
> > > intel_context *ce,
> > >       if (sseu.slice_mask && !WARN_ON(ce->engine->class !=
> > > RENDER_CLASS))
> > >           ret = intel_context_reconfigure_sseu(ce, sseu);
> > >   +    if (test_bit(UCONTEXT_LOW_LATENCY, &ctx->user_flags))
> > > +        set_bit(CONTEXT_LOW_LATENCY, &ce->flags);
> > 
> > Does not need to be atomic so can use __set_bit as higher up in the
> > function.
> ok.
> > 
> > > +
> > >       return ret;
> > >   }
> > >   @@ -1630,6 +1641,8 @@ i915_gem_create_context(struct
> > > drm_i915_private *i915,
> > >       if (vm)
> > >           ctx->vm = vm;
> > >   +    ctx->user_flags = pc->user_flags;
> > > +
> > 
> > Given how most ctx->something assignments are at the bottom of the
> > function I would stick a comment here saying along the lines of "assign
> > early for intel_context_set_gem called when creating engines".
> ok.
> > 
> > > mutex_init(&ctx->engines_mutex);
> > >       if (pc->num_user_engines >= 0) {
> > >           i915_gem_context_set_user_engines(ctx);
> > > @@ -1652,8 +1665,6 @@ i915_gem_create_context(struct
> > > drm_i915_private *i915,
> > >        * is no remap info, it will be a NOP. */
> > >       ctx->remap_slice = ALL_L3_SLICES(i915);
> > >   -    ctx->user_flags = pc->user_flags;
> > > -
> > >       for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> > >           ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> > >   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > index 03bc7f9d191b..b6d97da63d1f 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > @@ -338,6 +338,7 @@ struct i915_gem_context {
> > >   #define UCONTEXT_BANNABLE        2
> > >   #define UCONTEXT_RECOVERABLE        3
> > >   #define UCONTEXT_PERSISTENCE        4
> > > +#define UCONTEXT_LOW_LATENCY        5
> > >         /**
> > >        * @flags: small set of booleans
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > index 7eccbd70d89f..ed95a7b57cbb 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > @@ -130,6 +130,7 @@ struct intel_context {
> > >   #define CONTEXT_PERMA_PIN        11
> > >   #define CONTEXT_IS_PARKING        12
> > >   #define CONTEXT_EXITING            13
> > > +#define CONTEXT_LOW_LATENCY        14
> > >         struct {
> > >           u64 timeout_us;
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > index 4feef874e6d6..3accfd8db287 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > @@ -24,6 +24,7 @@
> > >   #include "intel_pcode.h"
> > >   #include "intel_rps.h"
> > >   #include "vlv_sideband.h"
> > > +#include "../gem/i915_gem_context.h"
> > 
> > I wouldn't think this needs the directory backtrack. Please double-check
> > and remove if not needed.
> > 
> > Also please group the GEM include on it's own before the gt block.
> Don't think this is needed. Removing.
> > 
> > 
> > >   #include "../../../platform/x86/intel_ips.h"
> > >     #define BUSY_MAX_EI    20u /* ms */
> > > @@ -1013,6 +1014,10 @@ void intel_rps_boost(struct i915_request *rq)
> > >       if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
> > >           return;
> > >   +    /* Waitboost is not needed for contexts marked with a Freq
> > > hint */
> > > +    if (test_bit(CONTEXT_LOW_LATENCY, &rq->context->flags))
> > > +        return;
> > 
> > I understood the plan was to add a separate "no waitboost" flag which
> > Rodrigo would need for later? Could be done later too.
> This flag is as good, I guess. If we plan to add more flags, we could add a
> no_waitboost assuming they will be a mix of some that warrant waitboost and
> some that don't.

I believe the current way Vinay implemented is the right way to go.

Well, we could have 2 flags already but we would need to force user
space to only use CONTEXT_LOW_LATENCY if also using CONTEXT_NO_WAITBOOST,
because this compute strategy would be meaningless with waitboost enabled.

But then, the other case that we have in mind is media case where we
would need to disable waitboost as well... but even on that case, it
looks like we might want the waitboost disabled with yet another slpc
strategy, then we would need to force media to also go with 2 flags.

So, for the other case it will be likely better to have something like
CONTEXT_BACKGROUND where we also disable waitboost and set the
ignore_business slpc strategy.

so, on this patch as is:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> > 
> > > +
> > >       /* Serializes with i915_request_retire() */
> > >       if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
> > >           struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > index 811add10c30d..c34674e797c6 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> > > @@ -207,6 +207,27 @@ struct slpc_shared_data {
> > >       u8 reserved_mode_definition[4096];
> > >   } __packed;
> > >   +struct slpc_context_frequency_request {
> > > +    u32 frequency_request:16;
> > > +    u32 reserved:12;
> > > +    u32 is_compute:1;
> > > +    u32 ignore_busyness:1;
> > > +    u32 is_minimum:1;
> > > +    u32 is_predefined:1;
> > > +} __packed;
> > > +
> > > +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE        REG_BIT(28)
> > > +
> > > +struct slpc_optimized_strategies {
> > > +    u32 compute:1;
> > > +    u32 async_flip:1;
> > > +    u32 media:1;
> > > +    u32 vsync_flip:1;
> > > +    u32 reserved:28;
> > > +} __packed;
> > > +
> > > +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE        REG_BIT(0)
> > > +
> > >   /**
> > >    * DOC: SLPC H2G MESSAGE FORMAT
> > >    *
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > index 3e681ab6fbf9..706fffca698b 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> > > @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct
> > > intel_guc_slpc *slpc, u32 *val)
> > >       return ret;
> > >   }
> > >   +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
> > > +{
> > > +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > +    intel_wakeref_t wakeref;
> > > +    int ret = 0;
> > > +
> > > +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > > +        ret = slpc_set_param(slpc,
> > > +                     SLPC_PARAM_STRATEGIES,
> > > +                     val);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > >   int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc
> > > *slpc, u32 val)
> > >   {
> > >       struct drm_i915_private *i915 = slpc_to_i915(slpc);
> > > @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc
> > > *slpc)
> > >       /* Set cached media freq ratio mode */
> > >       intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
> > >   +    /* Enable SLPC Optimized Strategy for compute */
> > > +    intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> > > +
> > >       return 0;
> > >   }
> > >   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > index 6ac6503c39d4..1cb5fd44f05c 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> > > @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
> > >   void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
> > >   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
> > >   int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc
> > > *slpc, bool val);
> > > +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> > >     #endif
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index f3dcae4b9d45..d6ea4898ac39 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum,
> > > EXECUTION_QUANTUM)
> > >   MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> > >   MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> > >   MAKE_CONTEXT_POLICY_ADD(preempt_to_idle,
> > > PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
> > > +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
> > >     #undef MAKE_CONTEXT_POLICY_ADD
> > >   @@ -2664,6 +2665,7 @@ static int
> > > guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> > >       struct context_policy policy;
> > >       u32 execution_quantum;
> > >       u32 preemption_timeout;
> > > +    u32 slpc_ctx_freq_req = 0;
> > >       unsigned long flags;
> > >       int ret;
> > >   @@ -2675,11 +2677,15 @@ static int
> > > guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> > >       execution_quantum = engine->props.timeslice_duration_ms * 1000;
> > >       preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > >   +    if (ce && (ce->flags & BIT(CONTEXT_LOW_LATENCY)))
> > > +        slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > > +
> > >       __guc_context_policy_start_klv(&policy, ce->guc_id.id);
> > >         __guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> > >       __guc_context_policy_add_execution_quantum(&policy,
> > > execution_quantum);
> > >       __guc_context_policy_add_preemption_timeout(&policy,
> > > preemption_timeout);
> > > +    __guc_context_policy_add_slpc_ctx_freq_req(&policy,
> > > slpc_ctx_freq_req);
> > >         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> > >           __guc_context_policy_add_preempt_to_idle(&policy, 1);
> > > diff --git a/drivers/gpu/drm/i915/i915_getparam.c
> > > b/drivers/gpu/drm/i915/i915_getparam.c
> > > index 5c3fec63cb4c..4fc182fdb2e8 100644
> > > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > > @@ -155,6 +155,18 @@ int i915_getparam_ioctl(struct drm_device *dev,
> > > void *data,
> > >            */
> > >           value = 1;
> > >           break;
> > > +    case I915_PARAM_HAS_CONTEXT_FREQ_HINT:
> > > +        /*
> > > +         * This feature has been available in GuC for a while but
> > > +         * a use case now required the use of this feature. We
> > > +         * return true now since this is now being supported from
> > > +         * the kernel side as well.
> > > +         */
> > 
> > TBH I don't see why the comment text is useful? The condition below
> > already makes it clear the thing is always supported when GuC is on.
> ok, will remove.
> > 
> > > +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> > > +            value = 1;
> > > +        else
> > > +            value = -EINVAL;
> > > +        break;
> > >       case I915_PARAM_HAS_CONTEXT_ISOLATION:
> > >           value = intel_engines_has_context_isolation(i915);
> > >           break;
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index 2ee338860b7e..4f69f4e117ac 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
> > >    */
> > >   #define I915_PARAM_PXP_STATUS         58
> > >   +/*
> > > + * Query if kernel allows marking a context to send a Freq hint to
> > > SLPC. This
> > > + * will enable use of the strategies allowed by the SLPC algorithm.
> > > + */
> > > +#define I915_PARAM_HAS_CONTEXT_FREQ_HINT    59
> > > +
> > >   /* Must be kept compact -- no holes and well documented */
> > >     /**
> > > @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
> > >    * -EIO: The firmware did not succeed in creating the protected
> > > context.
> > >    */
> > >   #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> > > +
> > > +/*
> > > + * I915_CONTEXT_PARAM_IS_COMPUTE:
> > > + *
> > > + * Mark this context as a Compute related workload which requires
> > > aggressive GT
> > > + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check
> > > if the kernel
> > > + * supports this functionality.
> > > + */
> > > +#define I915_CONTEXT_PARAM_LOW_LATENCY        0xe
> > >   /* Must be kept compact -- no holes and well documented */
> > >         /** @value: Context parameter value to be set or queried */
> > 
> > Modulo the comments I left and the SLPC/GuC parts I haven't looked at,
> > the implementation on the overall looks fine to me.
> > 
> > For the uapi angle I am not really happy that it is steamrolled to be a
> > GEM context level concept, apparently without much motivation to discuss
> > and document the pros and cons. But I guess finer grained control could
> > be added later if need is confirmed so it is not a huge problem.
> 
> Thanks for the review,
> 
> Vinay.
> 
> > 
> > 
> > Regards,
> > 
> > Tvrtko
