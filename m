Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D26992A5C8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E73010E38A;
	Mon,  8 Jul 2024 15:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngTMw4lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361010E390
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720452916; x=1751988916;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AABO/w8DITrNmHcGkEFLTaNZwQ/g/VZkh+YBjX5ns+8=;
 b=ngTMw4lfbTAJhbQzT0YjQhQy68A9ygHUEU3ViI9gZI8fiIF4Ki0Wr1lp
 oopeFFIJgXdiwtPvvvauVyVdcnKmNjEIWlfIm9zaL9iW6blVk2L3Gy6Ll
 VVBehmTTELDjm+vO46ul2wbSgG/4p0EEx2G2ENIu2ayrQC5Ey1D2fsFgt
 ABmekvsO2yipv3v1RnVeutvm8KOeHF0PqfauanT73Wz7pnxO1J0FDLU9r
 Fdfme1EH6yoSGa7HMLwrrNJYfD+BW97irLunzf1ho/8OlsS9SKlaBoc8G
 h7Hr0b1T7JrxKFiSRbJ3/FiLQf3LdLDS0r4ATkFkkwQL9ORjCh3UTnWaL g==;
X-CSE-ConnectionGUID: aT8wR4pTScKemPWsMhiEtg==
X-CSE-MsgGUID: 2V2uvtIPQBitfRLHmm5adg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21532393"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="21532393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 08:35:16 -0700
X-CSE-ConnectionGUID: Tq3qCBxWSbiJ26XEUK5p5w==
X-CSE-MsgGUID: soLaW/NXSa6gThilPu8Thw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47309755"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 08:35:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:35:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 08:35:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 08:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgm3eMgThaDR8iFGhLXIlYIWp2A3vUU/Y6SuyGHSJcspnHV1jB3Fre2yaO1YRYcfyFbaXLIXdaTSvCr8Lj3V+HTiDCYLSDZnMHA7ouWsuHjx66OxrvCGONM43e6XWrxyOB6b0WoOyTCSUphavl1W4BPVeUPMcnmR7UvmfdhKFW3yDy0lAoWA+U9540d1zlXzCcujiCBbnhJ/wK7gQXTaeToXSnHM67uIF9UfSPuXK40r0yL3KyrjqcZmGV1rqTN5bDWuCzCA4nTOsaNkLQSi+jm0VxiDPBCl5woqo/oMOIWS4y2j8qQHkteWeg3Nw5dIFkZcGGoLwqRfxx0eJs1+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jhF72CMN95dlU69N/zGLdDYfG8b/a4qA+6ch2h2WWk=;
 b=Oet2zOedYXodc+r/wK+dtRiQQ4hM7L8owDf0HBHcPMAUMRvmSEew8P4yu029HiSoUNVSA9W9G3NNr1m3FoxX8m8hoy5UQeC+H9o/Zr6bg6xrJIWNoVuianf1ZQ7n3OzGRhWw8CkTkDp9USELub8Ir+JjPlj2Q0Oy4oFNE/1J93h95fag9eJWIntSF6vNR8Ti2BwXbDEBKnbWN2Te/9Ka2Hz57GNdT47MuJS610LZQqSZeeUtqnZO22Z46ynEMvTpQrqDSXPmtvuQBGb0O2YFv+Qn6PL9Rtb1MhZvK2GHuRda/pq4i2iR0+pzGL7EoIXpldCRr+F97HkxD4R+0OoXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Mon, 8 Jul 2024 15:35:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 15:35:10 +0000
Date: Mon, 8 Jul 2024 15:34:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: The TTM LRU-walk cherry-pick series
Message-ID: <ZowG//hThxa4zDPc@DUT025-TGLU.fm.intel.com>
References: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
 <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
 <e356d7e2-33db-4aed-bfee-8e0828372527@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e356d7e2-33db-4aed-bfee-8e0828372527@amd.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b1d9d0-c7af-4a94-1296-08dc9f638d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yYzvoA9PLydJ14AU6nZPv4n1zJPnyucB+ZLno9h6p5HNVvnqWhDWSLfwGv?=
 =?iso-8859-1?Q?Z2M9QF4LXSzkyKXdQOuOYqDLlh4IXuydF1l0O+Z5wTfKNfyA8x1WtIv49G?=
 =?iso-8859-1?Q?OuT5Gld+YGuGx2otYFIdrYuKWvvz02flcwcb1QoNK0dUGOaF7CI9EQSJNJ?=
 =?iso-8859-1?Q?fXkoYsydS1APaMIr+W0qaZktJFyN/e+4kpG+MxMS7ogDzMrcOzDfJk/2c+?=
 =?iso-8859-1?Q?aAqRgkA4HwHmfn5U8wj8myLDp6Hf8WcK1I7YQka2aDXQpxYHZ/AdMkW0DY?=
 =?iso-8859-1?Q?dpFOlsUgME/EtfkJX89BfM+zwwmORj6ooxLdZA2M3wvDxsB3Svz1p/p6om?=
 =?iso-8859-1?Q?f4wj93HQNcgZMeEjw+EITgEnOgWG3CViHEw4FMeoGDpmFqTgJDhGOY9xuq?=
 =?iso-8859-1?Q?RYddxi4hEWwDlSMgjFxPnQqCWidf6R65bKLnDoVhumBgGk8s02PnRXQOKW?=
 =?iso-8859-1?Q?EMIp+mMDoUIksT5m2femJPlmeDuOUcw1w6EbkLgKXOw7RTbKwM8FVVWCHW?=
 =?iso-8859-1?Q?Ujz38NA8eZ5Vrr/+I895br1lZpRTfBvOAtaz++EgHqJ/1WLeSVbRyjyWO9?=
 =?iso-8859-1?Q?CLLkcIZauM3wZBUs9G0hZbD0O49OOoASz9KzMQYgtExPufOCf9yOuEHwBB?=
 =?iso-8859-1?Q?GwN8LiMY87V7BWuAAlSAjJcLSleCyk46R6KWCj1sK5DGw51PG5UW3iIcZD?=
 =?iso-8859-1?Q?p/tEGqUgWYFuCAiG0ZzEbHgxxd33ADDQ7eQ62z/7xi5Ejvgej0IYeRwOVx?=
 =?iso-8859-1?Q?KnhRskQ1VuWHK8zo+g+hJd8oUd68TgIRA28byeMaEHVIZejfOTtmxt5O1k?=
 =?iso-8859-1?Q?9Jk2vsmZWsnQNgJBe0NO+6LgWZWQh0Vnw2YUPkdGhg/8bkwxl4fDDw2R1x?=
 =?iso-8859-1?Q?7kBTsQBUina4na4zJsqUn1a8INzOkFqndu5TdBvtUvOqqYa0VBSa5hU7h4?=
 =?iso-8859-1?Q?/Kft596NqUWGfXN/xmipYcMRHpCcy/DEZpIGeb56qiRVBqU/nVLHn7cB4R?=
 =?iso-8859-1?Q?i2pBVfwLta3k2+i4iojU3tREcblqmjAvOyJlyV8J6Q5TJf3/QHNFLWJja+?=
 =?iso-8859-1?Q?DrlENqj05a76w/L95WzfecWev2xta7wogsyZIKZAOgjO51DbmCUw1WPg1+?=
 =?iso-8859-1?Q?R5Akp1s3bVP0EkVwLrCoRSvm56VjlkOGF5UJ1rLFPy0+uAO9esM9s4N40y?=
 =?iso-8859-1?Q?FSFWXcFYJ+R5SibbP3FMZ73mJkrk34CNIXeuRhnLQlCmT0UR9K0O+zMb+g?=
 =?iso-8859-1?Q?XCdXwp+CS/5n7Mw4Vp3m0avudRVNgzWKBwqmzisoiSoi9P9PO3RU/MSwAz?=
 =?iso-8859-1?Q?Hih/qj0V/IUcd6woi+T7jKC22bO+f5RJlny02FXu8LujpxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MIn/YglehWdOqsT3zQpUylA5PcjVRwmyOTdOtDwYrfwNb4H6nIZke8u2/A?=
 =?iso-8859-1?Q?DQDeZvojUqh8ROlJPeGBr5IQSzaoIe8OIw68ES837Zqv+WjLTcbopHtV6g?=
 =?iso-8859-1?Q?vNOqmp8FaGLSvVA0vJx3auYxQHERLam8MymmytcxIauzKv+ZNXbfIE3oNk?=
 =?iso-8859-1?Q?7+xdz8hyLDK3eKUUlKLW68VoycPUvUiKgSIZObmG3PpeMUlX24eqpi79cz?=
 =?iso-8859-1?Q?R8eAtK0cnV+2734gcrYu0Zud+cuB0m8laiwuNA3N8Ql/SxEvHBAC1OZxCv?=
 =?iso-8859-1?Q?m5fMTfwG0IImwk97aadEBL/Ch9CL0JkYk0U4QyetICP2HerlDRFUzi//Gk?=
 =?iso-8859-1?Q?QNO84J0cm+3WTOp8NhQcPdaZDqRxQj1Aj+3zq3HKAIu71hghR5Gqw5qaSl?=
 =?iso-8859-1?Q?JoyzmXOw71Nm7IWeuzcF7CHPuCAeCxKtFo05oV3JAuqrCjWBwqDBzeOWMu?=
 =?iso-8859-1?Q?m1x2FppRhIi/OgDimeQm6cDuHdrWgULtmprje8dwAEIaqKkbJistzpnztT?=
 =?iso-8859-1?Q?S6zNUm9BJCNMTXbdiSE2hDC3porDTqEeK4ErvI58q4zT6vQiSGOGC6t8aM?=
 =?iso-8859-1?Q?5KxUtaFUgZ/m7n2VQiB+yQ/W8aKMlQk/cR9jWReynGyQE/Ny0YNCjDtQoL?=
 =?iso-8859-1?Q?V85IIkcJL6EX2DVQUV9n52Ty+tdX2XSkgBie0p/r49aqMwUxNtHVAJMfVV?=
 =?iso-8859-1?Q?gd5iA63GvDr/f+RmuNj9e0ORqtwe5yGUBS1HLurSBEgwY7ThfvTH+5al7r?=
 =?iso-8859-1?Q?+QqhtpBL87Zg4fUS1Tsq7mMAzyUsIffYSnmUqsIx4DnAaHLdyfOZWmQ+Ln?=
 =?iso-8859-1?Q?SOTkfv7FHonXaU7rbi3GcCvvbiMVtIZOaKLnOfXfSGaXOkTlEoV1CbuynS?=
 =?iso-8859-1?Q?u0WTGw6nMyuVHASIEagxrzaST+FMyhvI9QL0jGtYQqJlVSz7V648Vj1FF9?=
 =?iso-8859-1?Q?KzWPzze0SPbZ86kAnJu235zTPO5262yIQYuUH+PpwRMrOJOCbyAIh8r+q9?=
 =?iso-8859-1?Q?IZp6yp9Znusef0ICxRHycKJfSj3+fUQPhzKi3evqTPpriG+nsX5HP+vMtw?=
 =?iso-8859-1?Q?QEGv5Mgr5Pyc7pgLpS8Wayimu5VpMWqpkf0GT7tTPw1EOGcE4hEi21f3D9?=
 =?iso-8859-1?Q?Waq7qUWWremXZBq/kO0WfDLfruyqkx1iFdLJOgMzsAs/CUbQph7c9TKqjG?=
 =?iso-8859-1?Q?eNj5pXbKTVryn6FtFsR8uPD7znlpcL0FzKNVXUTOJm+kbWuZce45IgMBx8?=
 =?iso-8859-1?Q?39KQ9HmxsE6MysYHpq7xjhHWOmRNBmRWI5DUMXGeHdly5/qP+o5jfQWl2Y?=
 =?iso-8859-1?Q?Bm8P6AfeuehHFuxcyINEhJJPdrQ+T0fFB7AdSvpWRuwNpALD7MRPW8Avoq?=
 =?iso-8859-1?Q?ZT6Jakz3NEwA+K4Og6XF0BdkSNYeeSRYmta3q0jLEylyPVxesoSMX5Uz3c?=
 =?iso-8859-1?Q?VWPmu34SsUN73Hxpqcavhs/9ESm/rTlD+yRIeeJXsXiIyH0/+xCsUaGno5?=
 =?iso-8859-1?Q?nkItSJIk6yFImhtk73vlRz0KNKx4hYK4YMGgjCMOSVJV30cEuRpTNAIBiv?=
 =?iso-8859-1?Q?vA5G4BudE1lyxmIXrF+2CiMOKjN2mAgSPhZyZNZNAkabgy7CD8aVCXfFvg?=
 =?iso-8859-1?Q?S+tP4IHGuq3H+gl6jlA4+ydrcXTd7uMhBq6/LKquL7QNs4MXKLAB9U2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b1d9d0-c7af-4a94-1296-08dc9f638d25
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:35:09.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cunKPn6rUaBoz5CVpHyosWdV3KVBHSvFmwc8KkcudQQ2qVE2Os4FUMM5CzSVJJVwOeN6Myj6dDO7moNGG2Lq0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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

On Mon, Jul 08, 2024 at 05:29:30PM +0200, Christian König wrote:
> Am 08.07.24 um 17:23 schrieb Matthew Brost:
> > On Sun, Jul 07, 2024 at 05:49:16PM +0200, Thomas Hellström wrote:
> > > Christian, Matthew,
> > > 
> > > I think I addressed all review comments and a couple of anticipated
> > > ones (s/long/s64/) in the swapout- and eviction patches.
> > > 
> > > I'm heading off on vacation today, (4 weeks) so if something becomes
> > > urgent in-between feel free to pick up, modify and merge.
> > > 
> > I found a couple of nits in last patch of [1] but gave an RB as the nits
> > can be fixed on upon merge.
> > 
> > The series [1] is fully RB'd and CI looks good. I'm thinking we should
> > merge this. If any bugs pop after merging feel confident that I can
> > quickly fix them while Thomas is out. Also fine for waiting for Thomas
> > to return too.
> > 
> > What do you think Christian?
> 
> I'm currently working on testing patches 1-7 and if that doesn't show any
> immediate problems will push them to drm-misc-next.
> 

+1

> The kernel build bot also complained about something in #8 additionally to
> your nit picks so I think we should investigate that first.
>

>> drivers/gpu/drm/ttm/ttm_resource.c:607: warning: Excess function parameter 'man' description in 'ttm_resource_manager_first'

That is the kernel doc nit I raised.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/135801/
> > 
> > > Regarding the drm_exec trylock functionality I'm for as much as
> > > possible that it should look like any other locking primitive trylock.
> > > i.e. no additional tricks needed.
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> 
