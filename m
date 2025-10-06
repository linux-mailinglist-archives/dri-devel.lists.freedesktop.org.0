Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07CBBE295
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 15:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16810E06D;
	Mon,  6 Oct 2025 13:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yazp4ydm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD21710E06D;
 Mon,  6 Oct 2025 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759756651; x=1791292651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sfSv9fYv9nOhLTBD7eimpi5VBEzSTOTKcLZcBb3pzk4=;
 b=Yazp4ydm44pedq2K6aFVGARvnXXvx43R53t/gILzDFyA0gpk81XY9x5v
 Ot2l7VTfxWy2X3EkZWcYQhJBAO7MbeCj15jvSxrRGHgChVE7mh0hSNxB0
 17GRshmwkRnGwsr9IxNqp0bCnT5dL5bO31luvR7Ee5COqjJ7rMTgN/Zb3
 Ea2vsP/j2pTvOTkD8lR0zpe/bXLOzA2UWl7MnQ6zB/lETE6f5TL6lTsv4
 k/K+CY/OY7H3rUDpZyHHKpxYXc0dj9IwzMXwaHIdwdvTg1upZ2oPn6GpZ
 9EEF/U7rS3Xs7YqStW3gdDrWfPt6sxBUpkn/vvjfRzDkRP7vb32SGz3Qq w==;
X-CSE-ConnectionGUID: 0FfvOlY7TjaLN5W611cEdw==
X-CSE-MsgGUID: 22FP9WTHTEC1VJRNAD05/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62097008"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="62097008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:17:15 -0700
X-CSE-ConnectionGUID: slTp9S8RR8anH9MEtiRNAg==
X-CSE-MsgGUID: eGQa/UOLQyuT7ySjKYtl7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="185052276"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:17:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:17:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:17:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSP+1eNy7d1od1DPkCEkahfdj9ng/RM32fRuAhbEa33BygccTwv1AKlRmO064Od3MFIlaD9ZHFrRB8mL8HpqHXQbAmwMKx+WO9pi2Kyg9jbY8KGHU/f0vtMQYBgP0q50mkTKuSIcV0nZPQKSrjVHjeB1TUIKos8Zq3TxAu7f4t+CRwQi7ntJDUVYBXKlm7DztKf61tFVSN3FG/n0UkFULQ5mMhcNLTRzEE9dYQ5rQJJ5tqBwWTCJ9Wk8NrfjTFtnCXIjbFkrXFDATAMWCoKacrfykTzxU8R631NyTb+Zl7c8hSEZzkw8uXMPe91kxBF/LSL6uD0AchECukrdKFY5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkTdh6ZnKkg3Z+ho02gSq9aEKMFh6nvTdyAXuG2mzpw=;
 b=R93+QLsktX1cBtlGNRrOcd1eHWE86sm6vQjuBT4tZz+pAA9ramuvZBPQhBGmqOBGGex6jdKT9Pn7yrB7XHieLawOG/eDxNxzocVb6WYDz9OyVCN07sUMcIGg4KNZyAy5BBztin0FBJXKSvS+msI/buFHEovAsVlglqdpUA1sv+ssSdX2XA0q6g3f90Irk7sX1ruteDGo6Ixd5f6IniNbvaoz/ax5Ct9Yufj/7wBVBZ6dcioYUm/ntPqMeExUEamxTXUZhUxPsBp404R945Os3yjQnkjAEzYXa4lyEZkR6Ybz6psIFmqbPAwSTceiBy06ku7KYjLYWrFuSOscxmH8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Mon, 6 Oct
 2025 13:17:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:17:07 +0000
Date: Mon, 6 Oct 2025 06:17:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [RFC PATCH v2 1/4] drm/sched: Add pending job list iterator
Message-ID: <aOPBURqjbeoOjQEO@lstrano-desk.jf.intel.com>
References: <20251003201156.1995113-1-matthew.brost@intel.com>
 <20251003201156.1995113-2-matthew.brost@intel.com>
 <d95920d45821d0e1e73737889e3e1481102c2e3b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d95920d45821d0e1e73737889e3e1481102c2e3b@intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d97188-a03d-487e-bbfc-08de04daa67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5H6/uRmc20ifJCoUCoajO9xTiRFMOO9Pe6L0YjAfLaZh2hNgx7SZshmcQDW5?=
 =?us-ascii?Q?kh3KUdIdjecaCWieN8yXySCj+WQAG/vZfnRv4bQG35ZlGqNnTN5NKIVwU3F2?=
 =?us-ascii?Q?1v9juzfdYX2kDZqsxSWqNB7dWeq+CfYueIAW+xCJt/0x8YlvIn9WKP+0qjCF?=
 =?us-ascii?Q?HCr385BHGHBJFCw56oBKAC9nWTZ/B1o8q9H7J89iWybIYu7W8USMvPzd2qdP?=
 =?us-ascii?Q?Xs+vH4IBzjVre22SsxxqzzDGCZ797aPV6P0IhENUroAML05jk6e/YT/mcWJf?=
 =?us-ascii?Q?oL8CzNbudzwF7YX2wf81wrgQn8FUfygfZyHTWwhxHQ4aw1RUjLbxLxAyOon3?=
 =?us-ascii?Q?iGcmGE5aebzO+iU9LKwS7v9H1CUviL1SQ1GzPt8Jnj3DpT2+WC95dpG2VHiJ?=
 =?us-ascii?Q?nKw7Sji0un775uAfdGyTfn9ql7NLg6WCxmo9W64uucAknTIE6v1gpj773qWN?=
 =?us-ascii?Q?lw66GA5EW1z66IITZF7qJxlJB5DH4NBii4YI073bCS5zDOcYQNr50ud3dEL4?=
 =?us-ascii?Q?GblYP6Sj/x3wag2v6V96NDzF4Bbo/SMEY78v+h/sYdZK5r5YO9bpMCKf3JDd?=
 =?us-ascii?Q?T9PzgmugfY9Ae3uPxY+BVx7sr7tXrCgTKkyA2MTscmxlQZe71FC0jkatue+w?=
 =?us-ascii?Q?cKb14Z/WQ7liRPfl4Wx+7WzlAkWm5D9kyloHwQSwkofQrp4Ub3K3AbGBPzJj?=
 =?us-ascii?Q?sk25wCBxVTlwhCFYz9236/DXvCXmEChgpWvOOKgzPOpVnDBgL1n8IcF1xhtB?=
 =?us-ascii?Q?+/c4Z5+mxuyn3cZTCe2x9PxlmBFYmO9GPpaLLjKcW0jwe55Aj9TO0ULVeGJV?=
 =?us-ascii?Q?tmVVGmZFl9PYmZoslBXjnoMwCacoKJoA+5KMjJb/g9IQb5n0wHmfbQn2YXJ1?=
 =?us-ascii?Q?crouvtuLksDhbROXskGuPSlonwptGPkJgwf1OwSEPfAzFDWWAl2daR65hn6i?=
 =?us-ascii?Q?/fqdnz/gAfwlB61lSuukU2TlFPGQHsucTQO2iQjGQ4a5++B6nDsGH7IsUDlU?=
 =?us-ascii?Q?z2NoWy2U8Okvd2N41C9i8rqQVhJis22U/jId+jZ/L/ylLYF+X1QsekxaCmra?=
 =?us-ascii?Q?u7tDrPt3RhsLXPGdgDuuiHRC36q1/qyZHW/4JplPuFvx/mPR7Spw9imNcENr?=
 =?us-ascii?Q?PoWHR2uW4go+w1V8E3gcHRQ2NM41YHj+39jNHlLP3ufHUiJYGefIx0FLjDrg?=
 =?us-ascii?Q?RynlYojg2uzWt471a5gN8BcJI5CGdjPbc2SNGXdxlpeuf4nooP2TZwzeq6+D?=
 =?us-ascii?Q?rxw6kpnGZdr7Nqnqn4F2PyEUH6vvzla5zTQ+Ke9QYGefHjt7XvMu05umKaRK?=
 =?us-ascii?Q?xIemk++8cFVUk8Nnr1kNtA5YowREFZdzkA6ojHBjStSfFSOejJEMa1hu93n5?=
 =?us-ascii?Q?wBwTJJg7Bftox/ExaAnzTxToBot7qDNbKu3/gbXl8aJMmzFxOQkMU7oYlIkM?=
 =?us-ascii?Q?etWR+Ipchelisk9yGovPQxYNx8YDTaPG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3n7R56e8jFK5Ra23FRkRWxFUsBusk/VdR0D4WHq/0Tf8iQrgRaK6zC1hnMP2?=
 =?us-ascii?Q?1isCyv0PVwvGNyqrazf2VLiiRMjAX+C0VJfbNNq7Klyrh2L1SViAffNrDjHi?=
 =?us-ascii?Q?FrwSYnEj47azGJIC623vihJZDfHppcxe3edxiLxm2LQzZMoZRzZi28JCHQ7g?=
 =?us-ascii?Q?1ljB1DOOsD4S+itSPUYE3z45C3MH+lW0EaeBUKf2eVjDXe49F0lDBr0df8E7?=
 =?us-ascii?Q?f9B1VLLINssdTDNemv7NfpMNCrL/hKFBb6oWd1ZEoxFhFiYMxlshdwyeVLs6?=
 =?us-ascii?Q?lZf+lq5ficpdkeHnzeZpLtf/g/5DDPFfeYY62BnaeG7WfVYIKZ5lIHjORINU?=
 =?us-ascii?Q?Nz0UOXz60TOt7Y5rbehEXPayLbCpdGCrUkQWVcb1MFR+CpnS6X4SbWKkTidR?=
 =?us-ascii?Q?ZiWgcPpg4FWPTP/tAeXWikod0UFCkv5jChtnjIMFfqrZeNKXSpB0kF9aEU4m?=
 =?us-ascii?Q?bSCelOOov9ZY+n2Bssu2LumtpDjUBHCe8TvirDOorfrm5fhhrKPJ2HEZEdWC?=
 =?us-ascii?Q?v3ci9w+nosR1/DK0riWz/n8MQYzt4x+khhfnzameNKebnlvm2qhWhWamhPEJ?=
 =?us-ascii?Q?sUwwNVjvbTauqFC6zvgVImG9sC4s/C2EqPk533Me7NfM3gFqb/5B57tP9PuE?=
 =?us-ascii?Q?BBaiGB6oOJKt8/smnTdnCMsm9IMK9IIP8Z1EOEt5MvNCG8BU4VTQ3LTKuZID?=
 =?us-ascii?Q?TDmCZ+z3QZMc3APgSXI5CvRfsgdxZyhpL2/HCDg1d1HhuH35o2YYGWm4C49m?=
 =?us-ascii?Q?YOjYhg2gFkql+gYbPC/x1HQwGi3mVmEZLXIoLMY4Os8Iz4VjxWwbgcRMfdTy?=
 =?us-ascii?Q?6yprzOCwkw2soewIod4gdvRkYVLIjZEcy5oCvkWt64hiZgj8ZrOrnmMoj1XE?=
 =?us-ascii?Q?nOBEcHivln5Flq9pHGFcmd/5HHf826P0w39TBwmCEmgj9RS5BFQt66pzzhsv?=
 =?us-ascii?Q?GwumnIKDKqfc1o+1lZw0bnpG1N8xxUwY9FNquTC3Eth8EkoWxTWxtctRH402?=
 =?us-ascii?Q?dTd5emzih2yfnK2HLGWK1NPH1TLYFFm+8x+wT7ALuAos0NdEZRhtGnLAsK3u?=
 =?us-ascii?Q?AYGUxYY9MIUhZEDd/yNldKHSRl8QM8z1gbgJIvR2qp14j4FftTJzTHagniCy?=
 =?us-ascii?Q?KpnynmQzEpRZMeTyU4kql+UIH7C623TRbMvXeRflSYiBgTGhZMNGoXLHcXnL?=
 =?us-ascii?Q?iAzsMZSNVyqJEjEfbj6FWVg8IVCqIOxVPd5jtdHtZci5t+lLdFsz/DgPWgNX?=
 =?us-ascii?Q?BXBrI+ZO4r3D6/d00g2ga62QLho8Fdv7jwwE0NsSaxxREHqWtTPQ+Gfd87cm?=
 =?us-ascii?Q?IzfXvOyJgrIc7Eqfhp56xCFilCLJ/JpYbRQ28JvsBnnYBJ+qz8lyPQND+LpA?=
 =?us-ascii?Q?E0eRsIc7QuvjES30LXGUBnzCfEgkMmNdIl2S9i4PzvN+aG20fd7llGq5vcyc?=
 =?us-ascii?Q?Xel6KjcltZ5zbK5meCiNHWDxampBKni9vReQSqVjm7UHsHQ+uhj77gnVGqI/?=
 =?us-ascii?Q?Fb+rz7g6+3cmbBr1cWMpFKa0m23mdXyXM+P00BBf5S4idrJkSaVtZ4260DJ/?=
 =?us-ascii?Q?wG/vstrV038jbOoVP2qKcUTaK/bdwRX595isWfoLFnEu9nl3Ax3vNReGlIjw?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d97188-a03d-487e-bbfc-08de04daa67b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:17:07.9183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYb7Pu4CP540JbE2rOh6sm3yezQDxnzx4DbfozC27bd5aN1g+zoFikHDAko/SyoC3aZZusIB5UNrkqRmkX/AnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

On Mon, Oct 06, 2025 at 12:19:29PM +0300, Jani Nikula wrote:
> On Fri, 03 Oct 2025, Matthew Brost <matthew.brost@intel.com> wrote:
> > Stop open coding pending job list in drivers. Add pending job list
> > iterator which safely walks DRM scheduler list either locklessly
> > asserting DRM scheduler is stopped or takes pending job list lock.
> >
> > v2:
> >  - Fix checkpatch (CI)
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index fb88301b3c45..bb49d8b715eb 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				   struct drm_gpu_scheduler **sched_list,
> >  				   unsigned int num_sched_list);
> >  
> > +/* Inlines */
> 
> Do they need to be inlines for perf reasons? Otherwise, inlines just
> make proper encapsulation harder, proliferate header interdependencies,
> and make the incremental builds slower.
> 

The iterator needs to b inline as it is a macro. Everything else, no.
All the inlines are in this series are a couple of lines so stuck them
in header, easy enough to move if needed.

> Have you tried running the header through the compiler to see if it's
> self-contained?
> 

I would think they are self-contained but I'm not exactly sure what this
means.

Matt

> Unfortunately, DRM_HEADER_TEST still depends on BROKEN so we don't get
> that check as part of the build. :(
> 
> BR,
> Jani.
> 
> 
> > +
> > +/**
> > + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
> > + * @sched: DRM scheduler associated with pending job iterator
> > + * @stopped: DRM scheduler stopped state associated with pending job iterator
> > + */
> > +struct drm_sched_pending_job_iter {
> > +	struct drm_gpu_scheduler *sched;
> > +	bool stopped;
> > +};
> > +
> > +/* Drivers should never call this directly */
> > +static inline struct drm_sched_pending_job_iter
> > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched, bool stopped)
> > +{
> > +	struct drm_sched_pending_job_iter iter = {
> > +		.sched = sched,
> > +		.stopped = stopped,
> > +	};
> > +
> > +	if (stopped)
> > +		WARN_ON(!READ_ONCE(sched->pause_submit));
> > +	else
> > +		spin_lock(&sched->job_list_lock);
> > +
> > +	return iter;
> > +}
> > +
> > +/* Drivers should never call this directly */
> > +static inline void
> > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> > +{
> > +	if (iter.stopped)
> > +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> > +	else
> > +		spin_unlock(&iter.sched->job_list_lock);
> > +}
> > +
> > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
> > +	     __drm_sched_pending_job_iter_end(_T),
> > +	     __drm_sched_pending_job_iter_begin(__sched, __stopped),
> > +	     struct drm_gpu_scheduler *__sched, bool __stopped);
> > +static inline void
> > +*class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
> > +{return _T; }
> > +#define class_drm_sched_pending_job_iter_is_conditional false
> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> > + * @__stopped: DRM scheduler stopped state
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity, and
> > + * enforcing locking rules (either scheduler fully stopped or correctly takes
> > + * job_list_lock).
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity, __stopped)	\
> > +	scoped_guard(drm_sched_pending_job_iter, (__sched), (__stopped))	\
> > +		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
> > +			for_each_if(!(__entity) || (__job)->entity == (__entity))
> > +
> >  #endif
> 
> -- 
> Jani Nikula, Intel
