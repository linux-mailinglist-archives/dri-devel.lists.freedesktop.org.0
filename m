Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE7B0FE3C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 02:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3D10E1A1;
	Thu, 24 Jul 2025 00:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgDkkHQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0810E1A1;
 Thu, 24 Jul 2025 00:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753317736; x=1784853736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DsdXN0bohPWDEXnx/kTCQLnWe8Kq7zEUpNRoAgfI/4c=;
 b=WgDkkHQhZdp0pPlY9Tkl8KQK0Ef/N2bXLJ5/4jbgbTL2gjnbwYVWRDt6
 t9QVFIOdomuGI6VzTjkExaTmw7aRnqysrSRr81P+OiGn+YQ7fnLbUYCjq
 GQn1mcKQieQ3SYvv2QIR/5ZuWMAEgLVn+A6gTlJ0Ai2oC+TMExZPgtqDo
 Mmfj7PK1dvcIAtqRzSexSK/WLtfOZQ1PCYdeEPiYl+lOzDUTKtf0Jc2NY
 tyPAunqfCvPBUEKpHsosybSX0L+XiaUvfDft6xh8g9VJh1VcYIxf5Kj3q
 rcuEWyP0WK9KX8+dgjQH2uN+ExjqHEh/3DXxN1KSskcUzZ4Pw8Pq9DFsn Q==;
X-CSE-ConnectionGUID: I1uMHKBmQCa8p3tcKRIy7g==
X-CSE-MsgGUID: PeOfrplOTtSG6WbIKElZVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65877064"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="65877064"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 17:42:12 -0700
X-CSE-ConnectionGUID: sEYO7TVwTDuKygSE0c9aJw==
X-CSE-MsgGUID: oJgh7psUSCuT0n1+frUlIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="164336991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 17:42:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 17:42:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 17:42:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 17:42:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLsixzXru3orB3ZKWIDeq+lL9OdT3Ic1Dw+G981kjjm7dlOPPcOGwMQ6EJWCUmYdC1ZbMl9XWfgyZlZBzNY0yTgvJQrmva2TYTwIEeqkF75/G3fAyWu5ctu6zezWku+JGFCKKSxRTL2kWJfa/1bAbjN77+dE53yvInuGlRXcjcPs0Yq9N2z941kWD/L0lUKO/WdfPGwFyBKrdaH7U4GK7IXlUW8rH/Qlk/b94FGL4g1RE7GnqacL7qJnFJyEsdk+zq88vWby+m5lIQPepbEA1UWscvGOxjqtrSiSLdJfvBoZ+UETzpdwoDLDZzmy9o2snaKaDzHBBzgolllHghImSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wOhxxpJusAjRQDz8jdDZzcFdbu8MsgquvMZkPNb6XI=;
 b=m8sbhQyorN+M48fLGGpzFzpMJAApQknLbH6/qTgioQfv1J7VaiNBUpEfSKpEz0DErGc0aLqBESzGdOMNNtrHCDfuvK2rZziSjNxwwiDGeYaO5KncsAKSw7S/C4FSJHGEERUhH66RN4FicrT1ktav5M/ocnWDUwQBITyT9plSTc7yxLIgKsJCYYfeazTKm+dIg08WcOY7R4W1O2tAd1lyqu2av7sTMy4oTIdFDTTruyXYGRUodiWs/Qcz1yM+rMtPYctsrgzq3ff+w4VItyUYDzzzqPiMSd3lV7dePbKCT+wX+5b2bsnA7DLga0FgEt/N+1VfkGXSWLkgMCklHZrX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 00:42:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 00:42:08 +0000
Date: Wed, 23 Jul 2025 17:43:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Message-ID: <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
 <DBIMILMUUV20.YED53M3X50H5@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DBIMILMUUV20.YED53M3X50H5@kernel.org>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4d62f7-8c50-4915-29bf-08ddca4aeb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HoYcdwT+jvsfansoPNEnC7WDHyJlp2BRFHrtGmwcNxj/glqfM3UQYAA9v08d?=
 =?us-ascii?Q?XJBqQ/3HoZDmTRBBk3Oue0FnY3mG+zBicW95bXkC/lEF3Lmf6e2vdrRUq1xX?=
 =?us-ascii?Q?995ipC7dhe3XtSJrXXjwSnAVMoMMObQY5xBcUVPioQD5X98J4jBxVeZNS08W?=
 =?us-ascii?Q?MabL6POr98gDHxelCqCr4x9Jh2g9grITEGp0CjEYp97l0gZqoUlSYUWH1CEJ?=
 =?us-ascii?Q?5WTqWeS1HhkXFLORyto01plUhl26zDPO1AiO4Ibub1ukhsjNLja84I+SkeBs?=
 =?us-ascii?Q?71985U8MgZL1cwdxaCDNkA1vqS06vNd4Nj/7tY4hOp1r75uhm2pxAuVTucNN?=
 =?us-ascii?Q?5zXkS9KCHh2y2umAJ4tPCLLc8WAnLJGbfmATjn221lVclL688BbkKHKn0+DO?=
 =?us-ascii?Q?qrPdnXjQ27QSXIShgq2xf4RKhxqeo8jtEauoPzP8AMTOyfK+2/Dn2zqx6Kfe?=
 =?us-ascii?Q?gSruFE2+kt/74Oo8ggYYRfR8G+6TVFnIuAErx/mu0O7wtPrKUFEypX6lIN46?=
 =?us-ascii?Q?ILxgDmmNngxbGhuAGu33GfEHZXh4ZKP0NyuQewRLEpAzE937BlVrCA5ESbkz?=
 =?us-ascii?Q?XusCspBtVZ3ltkYtDKT5AMay2dxHG6rTgbdl9pT7j0uJ9/Wj9L8a+ycK7avr?=
 =?us-ascii?Q?5rNvfroG3GLyWXCk43APZECzVVTUgkBApEM7dys13idanRgOxIBinqMKC+UP?=
 =?us-ascii?Q?Ya+RwI/NTJGvRUoZgfDKR/1BgZiMZSUJZ/esqTJtBtspyB/Ac/8rvcVwMe/2?=
 =?us-ascii?Q?wpULOKcTzwcf3utLpIanDw9iXDdreoSovVl1+SzNbXMLBpz+mVRrn4KNlEEg?=
 =?us-ascii?Q?4aJQ/2x6oGB6Zg88/7qhQgcgpdK02OzBicHDDUrgA8DRsYhufh6Z7qKEkqQY?=
 =?us-ascii?Q?95s+7Xp8YACI74ZD8QpIzl+zMVushkTWKwNldDSvFXBxPxG8okM/tMfjX20K?=
 =?us-ascii?Q?GuaXtY53O7egpFMED3Ib8z77KGJdRQ3JGTTxZaHHwZeuGrx494pwg2YsNqHR?=
 =?us-ascii?Q?RfFWiJ5uKHjmW9AnMvKT5MStHTwK9aoUTnZniuXMopJsQMSFOGz2ip9kr+y2?=
 =?us-ascii?Q?8hZWqMXRCkzkqdK0hganrSXAyQRPrLqdCtjZu493P9hbMClnAnBdvyjRRJ4d?=
 =?us-ascii?Q?ROm5Ru0ua9fMD+g55xB7WL1NkCr7SawHtlFpKdAfi6/HQJXDKRDMS1Xi+qc9?=
 =?us-ascii?Q?dmWW4woEaka9CH11uyRa4hDkaxYrrpUCsZT1HW1vmi+4RQKytrGmml8tGBUG?=
 =?us-ascii?Q?KNmGP0vHM0Y0QI/TJuZLtx+EU8+tTygWxrloSAjBAbg0BPeIG1A0EY7/T8lc?=
 =?us-ascii?Q?iiVLBrUhXyf5GdWoOtG7NB6VmAlrslMJTNR6TG3S90OFQSCx+KcoHbs+uKmE?=
 =?us-ascii?Q?IZJB5MDeQ1SkXh4PN2F9S0F7slhqVqvL8TYxd9vWL5Mldwss+Pp5tdL1AiC4?=
 =?us-ascii?Q?7BMnSQoJ0go=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LWWSAyxdQjEAHmbNytIf8jqrk4h6uzSYi8Ksmv9EjU+BnEuPk2gTeZN7g2E+?=
 =?us-ascii?Q?5H/ktBpNbS42YGo45EVHpvepWhKNapVxcewLZNyWFUj4sQf95/VPUNJ0oLmV?=
 =?us-ascii?Q?B00dYW2d6IOgCcorQucuEgkXNrLh2lzn+PhlHLKs29aRYhEbxhLDguhh+K/w?=
 =?us-ascii?Q?fcWPwc4Ko1kIZzPLRHjV+3/x3KhA/AEUMxPRkYlrl38UJc0t0mIJVZdUo9CS?=
 =?us-ascii?Q?fLHkXVzjUgNTQFWVqa72/+Fo3OhpjH8Fsi65Xv7FNaLIKgjgHOa25ZjFJuK4?=
 =?us-ascii?Q?JotcH7JIry1smkul5lHjlhQC1UqHt+5kLZOMjJXbEy6I/yAXzMvbUPoCR8AI?=
 =?us-ascii?Q?qnE6XcQtFWutDG1AHey0E5NJjU7UubIZLCy4JSSeNx41b+tRu3vgbg2PpAG9?=
 =?us-ascii?Q?TVpHWkbMiSDjRuHXpwKs99JvEUc2Ocmdh2/ra93Fzybw5uwPv3TxDAe4Z2Ib?=
 =?us-ascii?Q?i6i8bXQUKjJTBvjVLEFPSkpK9Nn6yx7PFBRA+PSoaGYlr2Djr7okVM2ZfAGb?=
 =?us-ascii?Q?Ne6DaGnyZzGzaWExCqDIjNhHRqdh54n95K4hMqZVF96zwgjK5ADIQOVMTbF1?=
 =?us-ascii?Q?1aP1rgvcijhE8jlK11gvkss9YE6c8Wz9C+NJVEgqFSG1c65Z/1KYKLWzCQdK?=
 =?us-ascii?Q?uOHbsGZorwBO7N0nN1GtAixzlIJBRkeSpSgQfDEsYWhz/1AaFXcwNLjt2Ehn?=
 =?us-ascii?Q?FLbtHfxFSCpD5s6eHUzrZoNMdXhfRvvcj39lcGgz2ocJHsThDLqmA7//WW8Q?=
 =?us-ascii?Q?3IIGHClFqqxN5bA9tBEejZUvR9FES9FeF+SeOlFv32p1OrOdJTXdDyqMn3RE?=
 =?us-ascii?Q?IJKVm0t+nSy6MP1GAcwt4hA0haYvjsLV3EKfw9A8Ps0Jk4S/EDXypjTTwUml?=
 =?us-ascii?Q?d7O821vafUHPkv+FhXBgZtaFWtLoCG40kv5WjGzzLEIzxQfFFUk/CoefEXw6?=
 =?us-ascii?Q?eqe6LI+5RKPALQhvYM1FPAR04DsyirtDTaIn4pOUBNe9HqrjaEC7xS2rlNoN?=
 =?us-ascii?Q?s/HWUsqJkqDNZ3gGsUC3hwlW2CUYJc5HXPKqGUuDmk6hfybE5I5h3XbLbBjZ?=
 =?us-ascii?Q?CJTa1F4IXivYvOxMi1959sBWkdwi5TZrRzREe8Q9tm/GOixSnJ/0/DcAc3Nt?=
 =?us-ascii?Q?OXu7kqYGz8f42nobPP0eVL0Ie/Q6oTqDiKR/SmWTzRQleJidAw7AIbJfsGUu?=
 =?us-ascii?Q?IRohcXTETnzyfPYVP5NY/YAliAIFCUaTdVQBdNSaau6EoQeE/bks3z0JcM8x?=
 =?us-ascii?Q?0oHOoFNfDJSSflbZiOmtMsqp9EjakS03cmdjtpoLuYOhmO0Znijy4yxg8ecJ?=
 =?us-ascii?Q?c+I0oWY7U+djfnOvaGnwEfxvnyVGZwO5uRwtfMy7ZWy/GtAl1moRBD2qwJ1K?=
 =?us-ascii?Q?BAY5vwTh3OuPgVxYg2lou0MQHrIQbtq49q8Ip86f6nLwLK1xf5jdlt46i5+P?=
 =?us-ascii?Q?bIefRa7IJESIOMGSabXWSP7pvoXmbGWpW3u0gktD/gnEJXk9oaMLUtMvYlBe?=
 =?us-ascii?Q?AisZ0734+G5lUu97VVkkx2cZlUZwrBdvgxAMJ5+wgVwG0lLP1qWU4xif7lDL?=
 =?us-ascii?Q?MRulPaE3edgmwbptuY35VUhOcdP2YyWO/kCuxPyHSE8hR+L40Kp6+IIYntjy?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4d62f7-8c50-4915-29bf-08ddca4aeb99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 00:42:08.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MX/lFoJI0jk8jF0w/d17b2SVPapfHiDrPYNeEsY9nHbwTw+ATrx3rX5I99zeldYKsFCai1aNSKkk7dn95uokdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
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

On Tue, Jul 22, 2025 at 03:38:14PM +0200, Danilo Krummrich wrote:
> (Cc: Caterina)
> 
> On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
> > - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
> >   range.
> >
> > - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> >   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> > user-provided range and split the existing non-GEM object VMA if the
> > start or end of the input range lies within it. The operations can
> > create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
> > used by the Xe driver to assign attributes to GPUVMA's within the
> > user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> > the operation with this flag will never have UNMAPs and
> > merges, and can be without any final operations.
> >
> > v2
> > - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
> >   ops_create (Danilo)
> > - Add doc (Danilo)
> >
> > v3
> > - Fix doc
> > - Fix unmapping check
> >
> > v4
> > - Fix mapping for non madvise ops
> >
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
> >  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c             |  1 +
> 
> What about the other drivers using GPUVM, aren't they affected by the changes?
> 

Yes, this seemly would break the build or other users. If the baseline
includes the patch below that I suggest to pull in this is a moot point
though.

> >  include/drm/drm_gpuvm.h                | 25 ++++++-
> >  4 files changed, 98 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index e89b932e987c..c7779588ea38 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2103,10 +2103,13 @@ static int
> >  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		   const struct drm_gpuvm_ops *ops, void *priv,
> >  		   u64 req_addr, u64 req_range,
> > +		   enum drm_gpuvm_sm_map_ops_flags flags,
> 
> Please coordinate with Boris and Caterina here. They're adding a new request
> structure, struct drm_gpuvm_map_req.
> 
> I think we can define it as
> 
> 	struct drm_gpuvm_map_req {
> 		struct drm_gpuva_op_map map;
> 		struct drm_gpuvm_sm_map_ops_flags flags;
> 	}

+1, I see the patch [2] and the suggested change to drm_gpuva_op_map
[3]. Both patch and your suggestion look good to me.

Perhaps we try to accelerate [2] landing ahead of either series as
overall just looks like a good cleanup which can be merged asap.

Himal - I'd rebase on top [2], with Danilo suggestion in [3] if this
hasn't landed by your next rev.

[2] https://lore.kernel.org/all/20250707170442.1437009-4-caterina.shablia@collabora.com/
[3] https://lore.kernel.org/all/DB61N61AKIJ3.FG7GUJBG386P@kernel.org/

> 
> eventually.
> 
> Please also coordinate on the changes in __drm_gpuvm_sm_map() below regarding
> Caterina's series [1], it looks like they're conflicting.
> 

It looks pretty minor actually. I'm sure if really matter who this is
race but yes, always good to coordinate.

> [1] https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@collabora.com/
> 
> > +/**
> > + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
> > + */
> > +enum drm_gpuvm_sm_map_ops_flags {
> > +	/**
> > +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
> > +	 */
> > +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
> 
> Why would we name this "NOT_MADVISE"? What if we add more flags for other
> purposes?
> 

How about...

s/DRM_GPUVM_SM_MAP_NOT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_NONE/

> > +	/**
> > +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> > +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> > +	 * user-provided range and split the existing non-GEM object VMA if the
> > +	 * start or end of the input range lies within it. The operations can
> > +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
> > +	 * in default mode, the operation with this flag will never have UNMAPs and
> > +	 * merges, and can be without any final operations.
> > +	 */
> > +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),

Then normalize this one...

s/DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE/

Matt

> > +};
