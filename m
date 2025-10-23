Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E2BFF07A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 05:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAF510E2B8;
	Thu, 23 Oct 2025 03:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dD/ahWHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB96D10E2B8;
 Thu, 23 Oct 2025 03:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761191129; x=1792727129;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ctHLoVe+JXGKnCKg/Ho8/2xA/6CyS+d/gRUXQIdkfRE=;
 b=dD/ahWHxjOzFhCmyrn25Cs7AVtoYC1vxTMPK0hq53aHmxHltUo8KnsN6
 OLDjnra+izhHLjgfMGT41wHf6yPRyFXZj7P/uBVfHRuanEGFXQBXWedRv
 oUtxny7Co7nF5YWobbTj/Wg37XijrVjkx+Qgg8bgCnAieStw/qd/39bgN
 t8bJui1qUGogdU7rFT50LqCci95DhHxOL0Z47v3bV7tzwhHp0uY0jUTEo
 c6aCwuFStxgSX9gJPRdX43RK2RJLwZD/0gHx0m9AHDXHylJVTgNStHw7D
 9ZZyy8bSpeDuXMucX2S6nPGo3PT0U1//bRqWpG03HA5tjHUvG6IWshgCT Q==;
X-CSE-ConnectionGUID: V4sIoRyRSNKa1ep38xOFnQ==
X-CSE-MsgGUID: pZO5rCGLS/KiMUAckGFeZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73640430"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="73640430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 20:45:29 -0700
X-CSE-ConnectionGUID: Qyje2munQ1GUggLlA5VaCw==
X-CSE-MsgGUID: 6SuWofkLS3uWm8wgq2WrMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="184438244"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 20:45:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 20:45:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 20:45:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 20:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvzxmPI5VeiQcA1sHXKaB/Mw4uhMnb9U2/zgW9aLiC49huXzyHqeMSOZ/E6aq+BwAQNcDk6QPqaFK1p7Z0XxjRqZf76/wzbRXV4TGW4YIUYDR2mqjlMdYWVMGEB/8ChbdV/wDWmY6bdrGn2evwJFBpeJrjr4j9nIjUks2euGYCQUcOgCQAoOuxYkmyQ2mk9Bi//8X8IDsolckphxrmZdkY7UoTRglKa2JBU8ZFglk7niCldhrfZFgMAhjScJvL6SvGYC48iLTW6XIRLjXnle06WZULELqu9jcqAZYGY8/gPSNf+hZs56smP36IfUoTKaUwfnoSbOFYbVlWBULtrE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1St5XJD1hkQafsiMYWCWeKx+WdQcjRTywB0mwYqjWw=;
 b=SNm6q9LECGFswjXVWyOLvjWdR1ccwNp3PkP3Rppgi8XPFrGAzWl528VE/fnw4IcZXS4vGdBBZuJjR11Gk+3BGEH/ravJ0DvmlfjTKavnXWONP510fSjdyNDHcZXExkRQS01VADh1NbDYOnmb/yzHU+cv+wVkeSc9s9btJYJFLmo6dWy1tQjuXSld2TO6qg4wI1EjeNtOQL0TBsXXzujuqNzRUVhWkJjr1Ho09ogovcRtpYqSvPBzfMUj6gGbKK+t2MF01mOr/bF2LS6e7eaBuXpoAjUEQDkasvSJ5rKu6dpsfj4JN5hkG2uWgzf0mMgtBZEZu3xk8RBk2KS9NcJ8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 03:45:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 03:45:23 +0000
Date: Wed, 22 Oct 2025 20:45:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <phasta@mailbox.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 01/15] dma-buf: cleanup dma_fence_describe
Message-ID: <aPmk0azjXFqGMpfi@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-2-christian.koenig@amd.com>
 <c32fa361-9331-4cc6-a155-33cc6339038b@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c32fa361-9331-4cc6-a155-33cc6339038b@ursulin.net>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae00413-2f15-46ee-c5ce-08de11e698c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fR4YnlKmRJMNv+wBvKMm94CQaV351ZWNVvhYDF9S3nFdH3NOHEldIP1xQD?=
 =?iso-8859-1?Q?EUYrPwzHDinOnsdA0vtN3cyhUpV8BVtfJnx2IKDVipDHW5M+N5o4kSN2cz?=
 =?iso-8859-1?Q?ZiztugD8/PmRunwe4ZDI3txvPTM7XMrsLnc/4k2WHnhLryqzzP9U4Va/gY?=
 =?iso-8859-1?Q?vZa+QV+PvCbN4TRJuazQIOmsh/qzr5BIE+F0my3U0IOX7oc2UtFSsj4Yw8?=
 =?iso-8859-1?Q?tHYEk2JuY/MARirTm2t5pAPYEG8zdVZU8gO/jYZ7rSL5+n/oDpS9Rr0Wp2?=
 =?iso-8859-1?Q?0gjGTaW0fgOUBTOPPWgJOrbz5NtfU2nB6lVgj/QBYZhqMZIOw7CbIlyXya?=
 =?iso-8859-1?Q?pPQWBdch4O+u/IEQmOsqFY6QMwJWmJmAh3LdA1cKIkQIRNj4kRImj+1WcA?=
 =?iso-8859-1?Q?mzRvUMh9XHcqEipjEHWsU5rROXsfVMxU72tfQYlsHWu4+IvTAo4xfozMyr?=
 =?iso-8859-1?Q?baLWG3nC76s5Zz2PH71nakfzDwUQ1mBa+GcAwC/iZKmCfsJzjEOx3NpZuc?=
 =?iso-8859-1?Q?TRdq8ttGbDKQvX1JLd0rYg6GA2gHIdEV3N3v5kur+kNJroDFUYAJ6GGwiV?=
 =?iso-8859-1?Q?vB04nAINbtHfzVVEtO+1ZnXEJPlgI6Im7dDvY0ApnzcysuLSPHbJIOr/ZV?=
 =?iso-8859-1?Q?MCNiTUO/BziBuAitvR/Sp5ftoKXgXGAS3JfwoMIu80jNzUTNqBkwzvxXEd?=
 =?iso-8859-1?Q?JY9Oh2CQEImRY0eGxbh8UD+4RULsPxzQAGywWQ19PXh4+SwDMq1ovq1CY/?=
 =?iso-8859-1?Q?OBO1k0OyU6Wly0aq5oK8JZjxeZ9TghylbdSQEDK5n7Lu5hqeZlRJnRQeog?=
 =?iso-8859-1?Q?Bo6XPEOZC6AzEnV/hkVyB0bsd/F/Ay5aZReWU13yp8jA4wCHcIuM+w9ri+?=
 =?iso-8859-1?Q?zDFB/XHaELPBIBm9Tnazema9MgTtsDX8ZjoHgTJGsp0GYhKNB94IiNI8Qk?=
 =?iso-8859-1?Q?BsDo9u5X07GWq++0FaDOHI9kGBmulFyq9V6gzzxUGQrJaSKCAQU538k1s0?=
 =?iso-8859-1?Q?byVPjQlqjjFwD0xycWgZ+2kRGL6eA/VdkJHn/+WHIISL3ezpfpquD4fhSC?=
 =?iso-8859-1?Q?v2lIFEXx00l2jfEpPGJfLBraDDUMFNVbOYSFHKkV3Ug7aHgxWXRirHRPgB?=
 =?iso-8859-1?Q?KPoUMK7zb2Q1wwMZE/13vEsHY24NZlYmwz2BRoMo6uN1jNRJZwlY+oBwsB?=
 =?iso-8859-1?Q?XGq6UJnqDiclosvSNEU+jDGT0wmoop6iOuXAZ8joQFuUKCitk76IrADqVY?=
 =?iso-8859-1?Q?yUbXIMjasBl4ybu+LrFS4yZNRvvsjI7kTtozfpL0FtzDc7rcaW/4PYTVhH?=
 =?iso-8859-1?Q?jKQZBfZ0vOWnr2xf2EDpd7eZPfK701QvIy9D868YZVpcKeCi1JbyLdeOGx?=
 =?iso-8859-1?Q?Qk2KXnWermy8Zb4+9Reco3Lho7/V02j67aqAHX9liugM7d6ixucTQbjuf8?=
 =?iso-8859-1?Q?R5kow7BWNc4dfmGrKfejJ4SIAPh1rtUrD486o04j5QVXBZkeCsJhb0jZ/+?=
 =?iso-8859-1?Q?In8JqEXNawvo6VEHHB8YSx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?45h6eCOG9q+q10V7iqBV8pWw3h/A5gmgGZmbObjEkGuT32/0vJRO8WsQXD?=
 =?iso-8859-1?Q?NtrAbW1W389Q+AYfaOth3hqdS38+f9uJjxNKqdyQnYnvbNPq+jCXMCPcn1?=
 =?iso-8859-1?Q?0Hc2iuQ1xaLJ792M2AWx0MriGU2ZjLNl0Uvm2hIQ4xp8YTUjnMO/VDeTSd?=
 =?iso-8859-1?Q?tgIfAXvY2AXNIBFFVHrxGabzpBiWTcixLT7jfHf9mhzdmgfDlKuVx374Qy?=
 =?iso-8859-1?Q?sSx92RSeaTw038s836fK8zItVOoAe4RV0Px5o1YA3ghzsVVUyKGa95qCwU?=
 =?iso-8859-1?Q?bc/MP5Qw5JE8waHOZ5hL5AENRFokGxJyQmxCFGJpD0rMCUatu9ypFRf+Yq?=
 =?iso-8859-1?Q?Z6yl95uD/EXuLHuOGBKTp5V4U2f698wrVzA2nMyAIxcHybpffoZCkw9DVL?=
 =?iso-8859-1?Q?XDy6IY8pU9Plt3om53b4fOYE60clqq3eismzoTEDyD6nQ2t9CECu68yZad?=
 =?iso-8859-1?Q?ndILhMnPkTqWJyJ9++Cdo1g8VK/NXxvij+6Le31gHENn3hA0u2/+Efn57f?=
 =?iso-8859-1?Q?PqCLqe0icOUgaGL5cDS1M7B7WUIE2gtVLzQGpOKP1RsMWMiibD0vArv6Lk?=
 =?iso-8859-1?Q?Knw2HonSuGl6XhqIqlvJmOhgnjacPAK1FvaYPbGUgBOpiDXDTrKYcK+Ly/?=
 =?iso-8859-1?Q?kC/Kh4HeDRqH7aOs/FyS+q+Imnq0EnOXu2b4twa+WP9or3kDSjbDF+a+oP?=
 =?iso-8859-1?Q?D1Xjmz2x66d/80BhNx7cN6RUMKwXX74rg6Af6pjoxvlEFBm5O9bMf8ikhb?=
 =?iso-8859-1?Q?N/LZE2aoIFLnvPypIo7kT/1W9Xn47M+5cYwPmAFUxw1v8y0YTFW+VJvy1i?=
 =?iso-8859-1?Q?/0GUCpHIvnpffT/kYy6IS1X6uQzwHEnUGzQlMVBmlRYfL6ux06GC+ToK50?=
 =?iso-8859-1?Q?1lq0flwiK58Y0UfhtyXdr1KJsBF/IjJb1v8IyAI4b51tXokxwjdp9KVs43?=
 =?iso-8859-1?Q?X7i93upLKpPBhqVRco/8KP4p2xdC2Aeh2Yyu4G6CqQoKjLSQW02km8SJbd?=
 =?iso-8859-1?Q?3400kYpoAXjTQW4pFLJ+2nGLqknitym6CDxFJp8SpyU7W+pjwZBEaVlDTz?=
 =?iso-8859-1?Q?oc6HhpssaI08zphRB++vwUygzVdu6lsBxG5DOGIbBbEYnP8qU5Wl4RpJ/F?=
 =?iso-8859-1?Q?SRz1+euBhcNAYu80KzyFVhwrJzdqGXwF8JQknF4UQYGsU/09bX0c14tCD/?=
 =?iso-8859-1?Q?T9oa5aTjgFZc4ajOHfHPV3CY+EfFhRwNFAHXmLXzyKDTTvFjNX9tgsnT59?=
 =?iso-8859-1?Q?4pa0y8SP2cgzop4ozITcQapFszo1wnhD6chxOc/m/+aHqqm+7xlZnDswwO?=
 =?iso-8859-1?Q?kov1/9jQhgHDhPLLkaRmhU6QSV5aQwtNg+hoNevkTACotLPC9xvRmf9bcw?=
 =?iso-8859-1?Q?MiRSucJxix2v/7Y57FCbdeG4p5j9P3/kKvjDd0Uu/fBl7mIMjeepxCO+sh?=
 =?iso-8859-1?Q?5l5a3Wux75UClROf59YErTGVBWKE6W7VgFLpNZ3o2mX+PGw3qP+V5TuzH4?=
 =?iso-8859-1?Q?jER/wP54HNG2Xi5i9T2YnsVQWZOgv4SsjlHIaVDITJuWLKXMiKe5UR8B5v?=
 =?iso-8859-1?Q?ZhCBPizTu67+Vf+Y2Y8yh7fO02nByKLtZLQnIRr9JsyYbxzJl676tmqx7m?=
 =?iso-8859-1?Q?XdB6ZO4KMxtXEIuvLiD6YUnAS9zcaO0IphTuUO+Z4hMwmHLVJFbAaX0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae00413-2f15-46ee-c5ce-08de11e698c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 03:45:23.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOVIAc0KzJcWWUZPZBwfN6Soi+7FII0WUXtd6NyXZLUNYuvBpUZ/QquevWB/skCkPosHLPx88WavRNG/CtP3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

On Tue, Oct 14, 2025 at 03:37:03PM +0100, Tvrtko Ursulin wrote:
> 
> On 13/10/2025 14:48, Christian König wrote:
> > The driver and timeline name are meaningless for signaled fences.
> > 
> > Drop them and also print the context number.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/dma-buf/dma-fence.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 3f78c56b58dc..f0539c73ed57 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -1001,17 +1001,18 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
> >   {
> >   	const char __rcu *timeline;
> >   	const char __rcu *driver;
> > +	const char *signaled = "un";
> >   	rcu_read_lock();
> >   	timeline = dma_fence_timeline_name(fence);
> >   	driver = dma_fence_driver_name(fence);
> > -	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> > -		   rcu_dereference(driver),
> > -		   rcu_dereference(timeline),
> > -		   fence->seqno,
> > -		   dma_fence_is_signaled(fence) ? "" : "un");
> > +	if (dma_fence_is_signaled(fence))
> > +		timeline = driver = signaled = "";
> 
> FWIW you could avoid calling dma_fence_timeline_name() and
> dma_fence_driver_name() since you added the signaled check.
> 

+1 to avoid calling dma_fence_timeline_name / dma_fence_driver_name on
signaled fences.

Matt

> May end up slightly nicer than to override strings returned from helpers
> with a chained assignment.
> 
> Or even store the signaled status in a local bool and branch off two
> seq_printfs based on it.
> 
> > +
> > +	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
> > +		   timeline, driver, fence->seqno, signaled);
> 
> I was initially worried if this string ends up anywhere which could be
> considered ABI but it seems debugfs only so changing the formatting is fine.
> 
> How about making dma_fence_describe() conditional on CONFIG_DEBUG_FS to set
> this in stone? (And dma_resv_describe..)
> 
> And maybe unify the %llu:%llu context:fence as the tracepoints use?
> 
> Altogether something like:
> 
> rcu_read_lock();
> 
> signaled = dma_fence_is_signaled(fence);
> 
> if (signaled)
> 	seq_printf("%llu:%llu %s %s signalled",
> 		   fence->context,
> 		   fence->seqno,
> 		   dma_fence_timeline_name(fence),
> 		   dma_fence_timeline_name(fence);
> else
> 	seq_print("%llu:%llu unsignalled",
> 		  fence->seqno, fence->context);
> 
> Maybe more readable but up to you.
> 
> Regards,
> 
> Tvrtko
> >   	rcu_read_unlock();
> >   }
> 
