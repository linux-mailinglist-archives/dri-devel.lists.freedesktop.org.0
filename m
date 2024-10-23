Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEB9AD7A7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 00:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9671110E389;
	Wed, 23 Oct 2024 22:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3yrCCub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D310E139;
 Wed, 23 Oct 2024 22:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729722923; x=1761258923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yHyRLVxfz2s/ehPPtAqsewMt/dRiDVF5mHot2IVfcM0=;
 b=D3yrCCubCoNpJaO7JpXpeAVtojBxHrJxfLIiycYBU0vzm+4qUtf73Ivv
 MOd6xk7ExkhsUflPIpefv7BPPxg+za22do82o2T9SEnM+JloZQknM4yM8
 iNfjOeCiiyFAuCbur4kn2iaVQKjCu0p7DARwPNVfeVyfSIFlgw6IFxFCS
 nS+t3A1fYqPFqJF/EhTem64EftFBRxS5V8i4nX9V/Sw6nnsbBY6pqRldd
 Y/SgPNVjagZeKlVHdNNtFqjSRcryspE4qbmNZ8HMET1fYLuDmYMJQ6MBs
 pHUIAJfLivPhbL4lTHWRz2ATnvtSdvVD0rXibyb3wC3SO/i0z6PUWsMqN g==;
X-CSE-ConnectionGUID: 3NdL/vxbRwSoePcY+y7H/w==
X-CSE-MsgGUID: Kh0i/7muSyei82ai4I8q5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40703412"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="40703412"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:35:23 -0700
X-CSE-ConnectionGUID: F5knDroiStW91+7u458d3g==
X-CSE-MsgGUID: vMAWwcu2ThuQKs3v+4F6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80509601"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 15:35:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 15:35:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 15:35:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 15:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHzeZjYgkOHDnFuETsw+mXzv6mr8KZsMtCMXSzrlahODzCTfErEF68CjGfcvMa57LZCWhwA5Mj+N26ImJBueZe/8WJVRJMMKk4ObJesxURwTmkLM/tIgz9Aj/MJlrBWWC4K3Qe9eiuYGm52YUOKuOdXuUCUSwvdNf9iPRjHGVmOmA9nkOtkfRHW66BhCR4wEZv+CFNvl/W744y0/pYuoZ4bGWIjaCBbh1Yq2yIUQV0TjfFN319s5XcWjki8KJWVnRA/OOVub6Bxs8t/AhLTZVCYjlJLeDOseTVUsc3I8PrEfuRea/xntWRmrXr7nG6Klu6CkXKfm2Hm1GBr7PUCVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKVXDtwR0IXL1sa6YvhVCA6DGXsPwx5iHbcoXsmfmbc=;
 b=PZXBK30t+5p1MyAZZTQOjK/iqc22WUDG/thgCR2XqMnWM9Fm8M10IXb7z5E6bTAbPT/UuQvjLHb5lcs/qMjEwSzcr9sZTsimV7JotL3e8bxwlYFQ/Om07BK4PwdijUuJQrXQZqzGHAcDPNQ82hTVAfeJ9vY1i+voH4ARCohPkVNlR5jtjxRhNP5tRE9VfGmFmjXNcIc57j775zOlP7cEU73PUp3LW4zqPMKu+M0lYW5hOzTfWXTn7Rq6DefEzwu/phfWlMwST6sN79cSlCdXq99/1d3ATux717Qtp06QA500OZq/DYH58XN7rZiqf2RJ2L0mSoNPWnVoCL6DcjvuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 22:35:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:35:18 +0000
Date: Wed, 23 Oct 2024 22:34:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 2/9] drm/ttm: Add ttm_bo_access
Message-ID: <Zxl6ExJzU0QO2lht@DUT025-TGLU.fm.intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-3-matthew.brost@intel.com>
 <87bjzcze9v.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjzcze9v.fsf@mkuoppal-desk>
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e0d5ac-cf0f-415f-86ce-08dcf3b2f8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AbfBvPX9HEsLR7i6Hua0I2+XMMtPgPaT4ZN7euDoosDD+nOswZcMVp7vxb?=
 =?iso-8859-1?Q?kbjD3GoMiQ4/tl2P/6JemLdDdYToXt7BumDQMdx9sBgpyDYEAv9Hjks0My?=
 =?iso-8859-1?Q?cMVIz29EgNv/SdT/ydBHEfrT2BYvzlct5fcmp1pvEzc9gE3cjK1tNUt45v?=
 =?iso-8859-1?Q?vpNr+thwDYNGhDXZaeQLZ2CHVR+HoBU3K4nN4PS78XjqLTuKrQVw3l4DO6?=
 =?iso-8859-1?Q?HWRt48KnSFskFuqNU9KkfbK/6KojWaD0AJtPQzLOxJTb0KBuliYZuN3AL6?=
 =?iso-8859-1?Q?/IePSUlQC3mP6AnfyTLtvyoJXDH/azG+sTk6goVtIM/RQXcVh31qyCGr5R?=
 =?iso-8859-1?Q?iQt3PaQrde1RkPS7gVP95GQJT0ub8KgBCzN6Ns0uFIjAGd1lW0Go51p599?=
 =?iso-8859-1?Q?GnNjxxTBDVb0q2WSXqZyQ9oaI24IFlrk7pSTSx6T7tM0GxMc5AumoiKqej?=
 =?iso-8859-1?Q?KSD1OF3n+PiTR2Ly6ajgNHIw8AtJqk9kW5tfnjTDd5krqv+IhE7Y7QSq95?=
 =?iso-8859-1?Q?bw6sSp5PjlJcE71t+6yq0RiImFt/CLEAhdpHxvvWZjgIOYf238hp417Zzg?=
 =?iso-8859-1?Q?CCnW0PbGUm+cwlDhvKBQ/CDXG20y5BRRBjmQ7oPxUfVczpYzCrj1B2zxr8?=
 =?iso-8859-1?Q?JXUfalYhP2b5AOhzpZDHXYmuV8OSI64HisQWDJWNJcKPjI4nQT4tLQo7xz?=
 =?iso-8859-1?Q?snRnQR24GsEb3vo79HdF1/xUc8xweVuL726jVIVkkmaC0mQAKH3D/Sj2y8?=
 =?iso-8859-1?Q?2fJbvb9J9ANr47X9SvJpPx2Vo9WyWoUbpW9u54wJhIaPQWR5MWoIDtWxs/?=
 =?iso-8859-1?Q?ONOwa4sEarzVtkAzyxdGtHL6MuHnmKX5b4KtF97t3a7+AkhoFK2/1K1ML5?=
 =?iso-8859-1?Q?cFdQtKca83ChKDCl6f59u/mICVlKAEoFcwvhi9IR186bsEsc24EjQsraEw?=
 =?iso-8859-1?Q?b7GYmh5dF3/rFuCpwGGbK6mYyNHKNw8f3F5QfTD/qmyVEDEFxLCWdmnzJA?=
 =?iso-8859-1?Q?xXejkJ9bz3nO+gxuNjqRSkOys80vKtUnhAbg/lgq+dCM4/g9o8h15ZJAtG?=
 =?iso-8859-1?Q?q68WOlUL00vP50lqNe7jxUO+7F/uJ8vZlhf7ZZe/x4uEHC39F6DeoJ2jtH?=
 =?iso-8859-1?Q?9UGCyBGlyDpfa+63it4lOd6OAK05Wk5Bac8rYwG9BRn1G0UX5zuEwMwugR?=
 =?iso-8859-1?Q?x8y+D8Q2mW+LU7bqYAktsYDDSMVCmlhc6+zD6OiGHZ9a24OMeJhxcy7/b+?=
 =?iso-8859-1?Q?L+S7qCBsDljzLIPUuTASjUShAY7V1eLKVlx4h0Jk8+wBD5BiCFcGnzbRZP?=
 =?iso-8859-1?Q?2Vc6N+ZJcVltbJRUA5IoGthFJJXFqjvM2rvtZjtXF/bDj1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VJlc0/iSSR2Q5LJsF6JE5STnAokblN+rcWb9+fP1OgFBSmbrQ2mxlZIvJe?=
 =?iso-8859-1?Q?pZ5mz9Cp7PbnRe6FIFOcvSQzKM/fUMsoEICkTuXSgsXK3EniRQMMJaUKJr?=
 =?iso-8859-1?Q?jFOiB94JvS6Q2JJiK10XfZtH3QWW4/j3sgsV8jZvDdErdFUHgDUPbbwHv3?=
 =?iso-8859-1?Q?yieTCE+QtR9ZC6nDjm9uvxqpSkM7RB4bGGDdQEljRz3g7M31J9vDq4jS6o?=
 =?iso-8859-1?Q?HutoAqRQCcg0maiaaIBYmF+voD/ewX6VyGnnGGZPYmu0uZSKpnY+3zMIR5?=
 =?iso-8859-1?Q?tsUU9HrXQS1MmqVJoAzAvvuP8Pp3JEe+hpsK8GA6yLV5JJsWdnwwnlLtDY?=
 =?iso-8859-1?Q?moe6XQy9FPFRX1fnGdDuLeeQgVB/zIyQgncCZr1zI20Z3BFJ0HOrjszBEJ?=
 =?iso-8859-1?Q?Zv7iCe7wNDRMRI2RZEDiYcTuRloEAoUkdQONimpPmx0Pnzld0ThNV+04X3?=
 =?iso-8859-1?Q?uHdprqo574gFO9riMPdaVK1KJK9sYRATVtCSyLAPt6s53kdK9MgehgFZT2?=
 =?iso-8859-1?Q?Nhi0DR+ePh2sA1AR7DUf9X8QbfH69zRSfAudVuLm46MEC0cmZ1zu8wBzS9?=
 =?iso-8859-1?Q?iAqPk1LHf1631ewqBc0Rs1HXoDyGgF2ND+C56dHWaCnFn8ZRJRsjXP/5f9?=
 =?iso-8859-1?Q?nu0R/KRVn7YZ8Kfmt3nEr70e5FNvbEReCmpU7cKyjhpI1IS9xTlTgskAMy?=
 =?iso-8859-1?Q?U6L+2lV3PgNXm2rTNZhceyQK0KsddVyVkoiHvo30p7vvpavuaIGLdP0WHd?=
 =?iso-8859-1?Q?NUlPYxHoXKGR6QLrFhFbw3bHM+qzfWFIPOVANljS2/xaG7/3dve4pOMVnB?=
 =?iso-8859-1?Q?csq3Xj5UlfHNoHBgDb6wnZzzoym7iGd8EEkVpEwH8qDopdmG2iwEbfe6Zx?=
 =?iso-8859-1?Q?iSHmC0H7y4B7UkKcepfSTjCDcSBWMmSepNZv6jp5nQQyb0muEY62KPIIyC?=
 =?iso-8859-1?Q?xzqc4uq+yiX0My9Aq76yAMj9KoGlvDc12zsifsh0ee2lJ855FQRCzFWl9L?=
 =?iso-8859-1?Q?IECQnzEEWVgXwqE4f3OKYcsKJrps/D1rAb0mD046oAXTxV/9eVy+rmszXO?=
 =?iso-8859-1?Q?GXGxWlXArtUZHzIvXNHay10VM5ltoxX6B0Cp9ApGzB1xsoyCRb30fTegxA?=
 =?iso-8859-1?Q?Q9K5RXVvpRuoJ+CKnC92Wcuwn0O3/DPWcYiWMYXmcTxK2IIkNzAtj0KESk?=
 =?iso-8859-1?Q?IBaQB+vxzYeBMuoWUM9OT2i0LrLMSpZgZRTwCeJwQeS6G/QlHOVYK5Ubhb?=
 =?iso-8859-1?Q?Yhq7WyUcFCG5xhSXlLq/r3DzO+2hgUE1DwdNN2k5XYjlawNUDmD46vPuKz?=
 =?iso-8859-1?Q?PA9NWzeqsmUQdVhpeOXgmAv/w1PC+gMwEOlyTW+oxZkAwec4dNRAKBpDYd?=
 =?iso-8859-1?Q?niZ4QJInDZFo07sxLwkJ2Wuf7PeEiAfot8qwtG5VHoWRjMIvE6vOEZSucB?=
 =?iso-8859-1?Q?/spbONRThMdwFPO/fEei9Sy8IOnlqo3dNA8Bw3HPpNvGw0KqBoWusN/4CV?=
 =?iso-8859-1?Q?77OdM7JrgwjLAE3GVaVWYU/7wqRRSTM0jVR2g5wxfCEbS+gLinPDJuq50Q?=
 =?iso-8859-1?Q?90m0xGys+WnHG2UumLNdXQtGBppViM+Gx7IfdwZeoncD5Io0K42ognb8v0?=
 =?iso-8859-1?Q?bcZLGWKTWhnmE9HTZhyQCPrY0TyDCf+HdYdyif+jL7LAVA53xXkj1kHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e0d5ac-cf0f-415f-86ce-08dcf3b2f8e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:35:18.5903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntRF/cyzkGTyy94v9ZIEmnAGdfnc9SZw/cjffJplCv1SzyZYbX/feBMbcQUDEibkJpt53Z5f/5CPAAIGHCT2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

On Tue, Oct 22, 2024 at 12:18:52PM +0300, Mika Kuoppala wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > ttm_bo_vm_access, to access such memory.
> >
> > v4:
> >  - Fix checkpatch warnings (CI)
> > v5:
> >  - Fix checkpatch warnings (CI)
> >
> > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> With the igt/xe_eudebug* coverage,
> 
> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Thanks! Is this for the series or just this patch?

Matt

> 
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> >  include/drm/ttm/ttm_bo.h          |  2 +
> >  3 files changed, 89 insertions(+), 64 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index d939925efa81..41bb5a7477d3 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> >  
> >  	return progress;
> >  }
> > +
> > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > +			      unsigned long offset,
> > +			      void *buf, int len, int write)
> > +{
> > +	unsigned long page = offset >> PAGE_SHIFT;
> > +	unsigned long bytes_left = len;
> > +	int ret;
> > +
> > +	/* Copy a page at a time, that way no extra virtual address
> > +	 * mapping is needed
> > +	 */
> > +	offset -= page << PAGE_SHIFT;
> > +	do {
> > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > +		struct ttm_bo_kmap_obj map;
> > +		void *ptr;
> > +		bool is_iomem;
> > +
> > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > +		WARN_ON_ONCE(is_iomem);
> > +		if (write)
> > +			memcpy(ptr, buf, bytes);
> > +		else
> > +			memcpy(buf, ptr, bytes);
> > +		ttm_bo_kunmap(&map);
> > +
> > +		page++;
> > +		buf += bytes;
> > +		bytes_left -= bytes;
> > +		offset = 0;
> > +	} while (bytes_left);
> > +
> > +	return len;
> > +}
> > +
> > +/**
> > + * ttm_bo_access - Helper to access a buffer object
> > + *
> > + * @bo: ttm buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Utility function to access a buffer object. Useful when buffer object cannot
> > + * be easily mapped (non-contiguous, non-visible, etc...).
> > + *
> > + * Returns:
> > + * 0 if successful, negative error code on failure.
> > + */
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write)
> > +{
> > +	int ret;
> > +
> > +	if (len < 1 || (offset + len) > bo->base.size)
> > +		return -EIO;
> > +
> > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (bo->resource->mem_type) {
> > +	case TTM_PL_SYSTEM:
> > +		fallthrough;
> > +	case TTM_PL_TT:
> > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > +		break;
> > +	default:
> > +		if (bo->bdev->funcs->access_memory)
> > +			ret = bo->bdev->funcs->access_memory
> > +				(bo, offset, buf, len, write);
> > +		else
> > +			ret = -EIO;
> > +	}
> > +
> > +	ttm_bo_unreserve(bo);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_access);
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 2c699ed1963a..20b1e5f78684 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> >  }
> >  EXPORT_SYMBOL(ttm_bo_vm_close);
> >  
> > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > -				 unsigned long offset,
> > -				 uint8_t *buf, int len, int write)
> > -{
> > -	unsigned long page = offset >> PAGE_SHIFT;
> > -	unsigned long bytes_left = len;
> > -	int ret;
> > -
> > -	/* Copy a page at a time, that way no extra virtual address
> > -	 * mapping is needed
> > -	 */
> > -	offset -= page << PAGE_SHIFT;
> > -	do {
> > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > -		struct ttm_bo_kmap_obj map;
> > -		void *ptr;
> > -		bool is_iomem;
> > -
> > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > -		if (ret)
> > -			return ret;
> > -
> > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > -		WARN_ON_ONCE(is_iomem);
> > -		if (write)
> > -			memcpy(ptr, buf, bytes);
> > -		else
> > -			memcpy(buf, ptr, bytes);
> > -		ttm_bo_kunmap(&map);
> > -
> > -		page++;
> > -		buf += bytes;
> > -		bytes_left -= bytes;
> > -		offset = 0;
> > -	} while (bytes_left);
> > -
> > -	return len;
> > -}
> > -
> >  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  		     void *buf, int len, int write)
> >  {
> > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  	unsigned long offset = (addr) - vma->vm_start +
> >  		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> >  		 << PAGE_SHIFT);
> > -	int ret;
> > -
> > -	if (len < 1 || (offset + len) > bo->base.size)
> > -		return -EIO;
> >  
> > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > -	if (ret)
> > -		return ret;
> > -
> > -	switch (bo->resource->mem_type) {
> > -	case TTM_PL_SYSTEM:
> > -		fallthrough;
> > -	case TTM_PL_TT:
> > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > -		break;
> > -	default:
> > -		if (bo->bdev->funcs->access_memory)
> > -			ret = bo->bdev->funcs->access_memory(
> > -				bo, offset, buf, len, write);
> > -		else
> > -			ret = -EIO;
> > -	}
> > -
> > -	ttm_bo_unreserve(bo);
> > -
> > -	return ret;
> > +	return ttm_bo_access(bo, offset, buf, len, write);
> >  }
> >  EXPORT_SYMBOL(ttm_bo_vm_access);
> >  
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..8ea11cd8df39 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> >  int ttm_bo_evict_first(struct ttm_device *bdev,
> >  		       struct ttm_resource_manager *man,
> >  		       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write);
> >  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> >  			     struct vm_fault *vmf);
> >  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > -- 
> > 2.34.1
