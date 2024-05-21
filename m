Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DA8CA66B
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9B10E040;
	Tue, 21 May 2024 02:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx1qqz0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816B710E040;
 Tue, 21 May 2024 02:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716260065; x=1747796065;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Dr8bIV94mcjZOW2JqNKwRLox9HIYMIq+DjOD4r/5mk=;
 b=Kx1qqz0dfr8zFEVC8xFkkMMsrrooYqahnWbE0ZG9dzvixvkMtYWNm50O
 VMrEAT+8gmdkFXjWp6PjdfWWyOdLbE9maGwR+oVf1eq7I/dwdH1SRYDPZ
 JzbzaQGyrgRrdldHFyzpmcBL9UN+ZN3OuKOAg/eqEw3sKyTMAZ9BUZXmd
 nBrl4wAkBJnSDPfI8830k/9GLxpOTCLGZ74D9KpPhZbHZBNrA42Aj1hpd
 FqHl8x3LeD1FcLCtjh1zADb7VrV74HZLXd6Nv6zdiXHR2vKBdVHh7XZOq
 a0uCzWhJfQ/fmS7GSS9aynZnX7mTZDinb12zpCLjJt0Wo9cw1uoYNDK4t A==;
X-CSE-ConnectionGUID: EdRbgppDTNyzk/1Cjp4HPw==
X-CSE-MsgGUID: uRi8gCd5T8u1VvRWOKVWIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16214315"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="16214315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 19:54:24 -0700
X-CSE-ConnectionGUID: tl5HPMZsRyOdvJfiL5fQAw==
X-CSE-MsgGUID: s0WdnLVNRvK04jjjisI4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="37586688"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 19:54:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 19:54:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 19:54:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 19:54:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 19:54:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nrac+yz1SPdnnMRr8wv6jiGnnsOecicDusmCG2+UBvTH/8VgCl0QlmVAV/x6uZ1vVvxt7vFADjIHXvU60O+NT8/37uThIfmgwJ2sRL1a2qlkna4CxG5NR6SSTDxWXVtcIS693P03q6olr34xmcKf6v7AU9bifPbxylmTnQIWQ4S/c10ffOY9OjkHVirbrG3XF7vbyWRruZAwmhB6iKhvijulEu9FMJ2Pv+4oJCUEqgKzi8uLsfwWHGsedAZXE/f13M3kRT95d+aA7WILwLg6DBi5iSBwQ6omY7s0oMiIMKHVNbvarvW8sw/NU7M+bX6Ok/00zwre9hdt/0G/i4voGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDyE33Q9Y8aQD21aTmOwd08TPFgA+gae+whuD1KfT0I=;
 b=bgBcFGqPTlfEtpHr7xpAaOhi2dPr7AS4QxHccrnKm/dcGPTzWdtV8hljVRJXH8ByuhDeM21LczMm3oGXyuRkWyeNk+VkibjC2lht2gV1ZDvXyhXGR6yV+w9qza3g7QMgRw0LiknSo3tWZ89DkvPapJciDMGoK4N1OKQfTDdEd32GpEdBCcmTkClHdGyPzpY4/lB9H7j/shgIrjkBblqBE2hIhGV0wZVBUKJz61c3bLXdzPqSaB3vzOv4lhOL9KyDDEBo3xpzNje3LcbV5D8ClkcT2sSTs9FuKcamU0MGbUhO+OhHENon8jVjlCxovSPBKgdvPFmOHZ0R9xfELJnJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:54:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 02:54:20 +0000
Date: Tue, 21 May 2024 02:53:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/8] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <ZkwMxNNWK7qNhzbR@DUT025-TGLU.fm.intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
 <20240517204310.88854-6-lucas.demarchi@intel.com>
 <20240517224022.GC2343622@mdroper-desk1.amr.corp.intel.com>
 <fuzcf5ntgkfnsgxovqj67sknsowk74gikec6wtdq45dj3zbnab@m7suetcohnfa>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fuzcf5ntgkfnsgxovqj67sknsowk74gikec6wtdq45dj3zbnab@m7suetcohnfa>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dc1116-afe2-4e0a-8de9-08dc79414fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?srPX0AmhgAcRn/6i0QEz44l/Sks7V1eLJFI2ngCM8gOUyYzxdsT1O7YLy/hF?=
 =?us-ascii?Q?m9mVuTaFlwB75GYVoKJkUc/RlUOw8lwLXhhgN2etcLXCk30ciGRMdu/xKNyW?=
 =?us-ascii?Q?iN3HdNgTANftdsIX4DWcYCgCTVELNZ9qPWLq22lX3bJtgUp+PTNvSVYHaq5z?=
 =?us-ascii?Q?20y80EcsJqEaGKjaTyQ5XsFFz3slN8UeO78TTKxvN+kJjp3hBg7cycfMZwbx?=
 =?us-ascii?Q?NzMpKozUml8QdrYetTu5poaaaDO+vgTg1/PCzREiLz2lU1tTLhTnmzTO4dOL?=
 =?us-ascii?Q?XIA21k0jaG5BxjKgCgvEI66aIcPfe/yJjkpZ9o4LEUS3swWJv82TNB/TprgO?=
 =?us-ascii?Q?CJ3IdH6UyG1Z8b6X3w1NdV7fD4uP5fjnTc9TUcTKT0/QlPLX4K5JtAF8f+Ac?=
 =?us-ascii?Q?bYUO1hqnXSEHYw98FbnYPxGmcHHb/huk3Nw7jcb8d0/DwQAnVF43KX08+kwt?=
 =?us-ascii?Q?A9fxC+rY/zumYTpSq6PJbQPHMG74PBgF4ZDNRmChLToCwsbA6brCDCaP5E75?=
 =?us-ascii?Q?nkqJIjWTVncTZzGWc+4AuFlVXMRwOhgiQg91Ny6NX0ZOrOm1n3NF9/X+cWTD?=
 =?us-ascii?Q?jNJ0QuhsjfHwHCVf/+/TLGM1gtPCAMQwYFmGIHpwrnkuha3TEFfw9N/aIDye?=
 =?us-ascii?Q?usYRLDK1KymrhAbGxPt3MzAPxKFq9JSU2SL4aZSvBC9gLDQTwCmD+awd/dQs?=
 =?us-ascii?Q?yQZObY35V4fP+UYk5LMeY6nVBg+IFEvzjSWbvL5MCmmetXVzJODoolvUrlI2?=
 =?us-ascii?Q?wDB+QRjgRbnvCiQp/7XxHk5nzUyzE+sc3yWt1r81z9lxQK/hJNZW/fAuKtyy?=
 =?us-ascii?Q?7Btu6BuyWICH3syzCXKNOVEb60n7A4SMsA6j3IT6cU5M/qZx1ZIcQLkjN4z+?=
 =?us-ascii?Q?3ueT755cNhTIZdKww89GJICqHLjivBZu4ilzhugvJFADc0A169zcCAlbzEJP?=
 =?us-ascii?Q?RGliPaH0QZ69kc8IFmmwA8NzjkzBv5QdC3EI5QhtDFOwUEIZS6X64cfQ2NlQ?=
 =?us-ascii?Q?H1oXZ0A9iRWDxL24QviCPpX0ue1ZDCCfK6QRYIvr0WC2ggKvWylMUjvrfJjx?=
 =?us-ascii?Q?3JOOYnj7o0LptXN2ZwgMCBg1YAyluihS/3A4CkasrKveZDwcGo66AvdZepNV?=
 =?us-ascii?Q?lROykBmltkUEp92oqN3KGMzbnIt6GnYtB19I6suwPPg0daXxHjN8nH+EzQVs?=
 =?us-ascii?Q?0fGJzqHuTHlTIs6lToRKSNnYIFysoTeAr89eftD1W4t28E4bbmUouRfGkpck?=
 =?us-ascii?Q?O+M/22qtF2HErA8GOTbvJIxOWTO0iZnphPsMvcSUgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+agI4xYCUrl3QqZZNTsu/6z/x8fjIySLR1AGWH3e/XAJvSy8J6VR1oIcNDly?=
 =?us-ascii?Q?IlWlWL4yMYwHCU31OLO4SzCrKtPkFTL3Z1+kR8V3sDFII7SvStljK6hvPYmb?=
 =?us-ascii?Q?Ox/8Hs4jqbfwUDGWfOn957VDG9sgZ4K5pB83KQshDNlcR7YIQcTTeUSWhQgw?=
 =?us-ascii?Q?zgqmUTvelUbt160PkJYTnWiDNHPJiqC8ZV9d6Wd+ZnK9yo8Z1ntxed5HfBd/?=
 =?us-ascii?Q?ivM/t0oPIQGV3jCwSFYfaMDox4yONGfTTy3Iqz7mKyWieggHYz64rQflu7tC?=
 =?us-ascii?Q?NOYeahKTNnjmc/RLQJHFt8FA+SkMKgzGF52muyLZA029Uo02Q2BfBp3hzn2I?=
 =?us-ascii?Q?VaGgMv+gi/BExIrsZHGt6iO6tIl604Zxjr4kZl3T7kLiHUPTudqG1fBB/vF/?=
 =?us-ascii?Q?AkiEmCslZd6WZqAva1jSzNeoNcpwnIwkUdaHewcm0yfRySW2h1I1W0NUgvH7?=
 =?us-ascii?Q?O62/HW/B9g3E+/+s24ykYMppMkS9Z54WaLATK2/3Dy80ez4yQaWZmK6LLfTU?=
 =?us-ascii?Q?5HahQ1eYS42DYSU/O40FZ4jQrLZFmqC7yo/ZSpWuv5jcztnGzTQDQvctTKZB?=
 =?us-ascii?Q?XwRwuxfWOYtSCraRfjG9Dp428yNVb6At8pUvctQL7AYDtFeJ6jTItkYKobE/?=
 =?us-ascii?Q?QP9ofVvX9jiASEJh1db5gGlV6cPMp0vqdJD3Nd/k0XVkEyncJeYIANYsscnJ?=
 =?us-ascii?Q?PfbrTe4UqIKauB6D8qPEfypKB9o+TljqOhIEa7a0OUkivFPZGsGaHaMzibxM?=
 =?us-ascii?Q?sqfk4JdzDbyFkiBtTJAjZ8sTbDdyKZokRIJwtaJDzkxkT3COOrhSNLGUGy9b?=
 =?us-ascii?Q?DF/gwuGzsVpKYha3itpGnql/hJ6qTl7cGI3liD4dxRoJbt+VEzxsp0/vbbY5?=
 =?us-ascii?Q?nMFg1UlGS7shZr3DL+wxsBZ4SWO26s1IKszrr1lVfWCgLgH1wZqZz3p4pKsY?=
 =?us-ascii?Q?kA7W5QV2HUk+y5Kq+yxCB6yongpPHsgEUh/0bUJ73NGnGFQjziZMFaj2meMM?=
 =?us-ascii?Q?f9mm/uKQGgGEiS5KtxWrkcicYs0lB8KLqjO/8fV9Tm4pKUiUhrRK5CcSza09?=
 =?us-ascii?Q?EgiUABcKsHxbAPMoMXUXYDCQMzWWARgLI4psKhGpOD7WCgVc4+AJXz7uhSnw?=
 =?us-ascii?Q?YgaR0CIpImaKFQJ7OJDkx6+W51d8DeDdooPUl3q6obPoMGR0IOJeokFiln2F?=
 =?us-ascii?Q?aOfFOK1d+IIEjz/dvADb/cFS4KJvxR+bl7yF3WpNzI0XhaODFE7ZxUKmQTTW?=
 =?us-ascii?Q?t6839yQRZ/rqNrFje9NRn/ljShtf4iWoKGUPwnyG93eYhwmu0vAfuotHiiFb?=
 =?us-ascii?Q?0uc2dN9O59tPhx5hUnWdk2W8kfWIS5LTuGKU5h8zOziWZsADQgo2XRDj59mw?=
 =?us-ascii?Q?gurQPa7qhMha8W3Mp3e6iQbDJ1tbuLZPKmT9KqERULUooSrBt5k7xVH0vxdJ?=
 =?us-ascii?Q?+Q/u04MmlDbk/XZmWuuwdwbp2FowAZZI6jFkuvvL9GO2qjZTPCzBIknH64sm?=
 =?us-ascii?Q?IDBlOt/x/qCqiZmOdxl+1CvaNXCJdhV1mIMphrMSOcbHrNmQiSQwP8hezKM+?=
 =?us-ascii?Q?CASOg6IGOZciK6ueJjEqEbZzjjOh6mh0kP57gBHVQGL8HR7LwkcWVN7uWzaE?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dc1116-afe2-4e0a-8de9-08dc79414fcd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:54:20.0759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvFsHR6Lp39H5Lx4jRFB17SSYWd5w3nb8yVEiMByMfnSOHb/pxW/vcqFp7pKj9aiTLxDrrblNnArijIN2WXC2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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

On Sat, May 18, 2024 at 09:37:20AM -0500, Lucas De Marchi wrote:
> On Fri, May 17, 2024 at 03:40:22PM GMT, Matt Roper wrote:
> > On Fri, May 17, 2024 at 01:43:07PM -0700, Lucas De Marchi wrote:
> > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > 
> > > Add a helper to accumulate per-client runtime of all its
> > > exec queues. This is called every time a sched job is finished.
> > > 
> > > v2:
> > >   - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
> > >     runtime when job is finished since xe_sched_job_completed() is not a
> > >     notification that job finished.
> > >   - Stop trying to update runtime from xe_exec_queue_fini() - that is
> > >     redundant and may happen after xef is closed, leading to a
> > >     use-after-free
> > >   - Do not special case the first timestamp read: the default LRC sets
> > >     CTX_TIMESTAMP to zero, so even the first sample should be a valid
> > >     one.
> > >   - Handle the parallel submission case by multiplying the runtime by
> > >     width.
> > > v3: Update comments
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
> > >  drivers/gpu/drm/xe/xe_execlist.c     |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
> > >  5 files changed, 44 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 5c5e36de452a..bc97990fd032 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -555,6 +555,9 @@ struct xe_file {
> > >  		struct mutex lock;
> > >  	} exec_queue;
> > > 
> > > +	/** @runtime: hw engine class runtime in ticks for this drm client */
> > > +	u64 runtime[XE_ENGINE_CLASS_MAX];
> > > +
> > >  	/** @client: drm client */
> > >  	struct xe_drm_client *client;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 395de93579fa..fa6dc996eca8 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -769,6 +769,43 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> > >  		q->lrc[0].fence_ctx.next_seqno - 1;
> > >  }
> > > 
> > > +/**
> > > + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> > > + * @q: The exec queue
> > > + *
> > > + * Update the timestamp saved by HW for this exec queue and save runtime
> > > + * calculated by using the delta from last update. On multi-lrc case, only the
> > > + * first is considered.
> > > + */
> > > +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> > > +{
> > > +	struct xe_file *xef;
> > > +	struct xe_lrc *lrc;
> > > +	u32 old_ts, new_ts;
> > > +
> > > +	/*
> > > +	 * Jobs that are run during driver load may use an exec_queue, but are
> > > +	 * not associated with a user xe file, so avoid accumulating busyness
> > > +	 * for kernel specific work.
> > > +	 */
> > > +	if (!q->vm || !q->vm->xef)
> > > +		return;
> > > +
> > > +	xef = q->vm->xef;
> > > +
> > > +	/*
> > > +	 * Only sample the first LRC. For parallel submission, all of them are
> > > +	 * scheduled together and we compensate that below by multiplying by
> > > +	 * width - this may introduce errors if that premise is not true and
> > > +	 * they don't exit 100% aligned. On the other hand, looping through
> > > +	 * the LRCs and reading them in different time could also introduce
> > > +	 * errors.
> > 
> > At the time we're executing this function, those LRCs aren't executing
> > on the hardware anymore and their timestamps aren't continuing to move,
> 
> not necessarily. Besides calling this function when execution ends, see
> last patch. This is called when userspace reads the fdinfo file, which
> portentially reads this for running LRCs.
> 
> > right?  I don't see where error could creep in from just looping over
> > each of them?
> > 
> > I guess parallel submission is mostly just used by media these days,
> > where the batches submitted in parallel are nearly identical and
> > expected to run the same amount of time, right?  Do we have any
> 
> what I got from Matt Brost is that they are always scheduled together
> and will run together on the different instances of that engine class,
> regardless if they are different. As you said, I'm not sure there's
> even a use case for running different batches.  +Matt Brost to confirm

I believe the current usage involves running the same batch program, but
it operates on a different set of data. Even if widely different batches
were submitted across multiple engines, the GuC schedules all engines
simultaneously and does not schedule anything else on the engine set
until all engines are idle. So, I think the logic as it stands is fine.
If everyone is paranoid, feel free to sample every Logical Ring Context
(LRC) in the exec queue.

Matt

> my reasoning below.
> 
> Looking at our uapi and some tests in igt. This is controlled by the width
> arg when creating the exec queue. Later when executing, we can only pass 1
> sync obj to wait for completion. So even if userspace passes different
> batch addresses during exec (i.e. different batches), the whole lot will
> not complete until everything finishes. I think it's reasonable to
> consider everything is busy while it doesn't complete.
> 
> > userspace (or potential future userspace) that might submit
> > heterogeneous batches in parallel, which would make this inaccurate?
> > 
> > I'm not very familiar with the use cases of parallel submission, so I'll
> > trust that you've got a better understanding of the userspace usage than
> > I do; everything else here looks fine to me.
> 
> I kind of learned this part when doing this code :). It'd be good to
> wait for an ack by Matt Brost who is more familiar with it.
> 
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> thanks
> Lucas De Marchi
