Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013694FC06
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 04:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66510E1F5;
	Tue, 13 Aug 2024 02:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hke8Bh8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BFB10E1F2;
 Tue, 13 Aug 2024 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723517738; x=1755053738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wb7pQ5Z4GeI9lb0FXSlcYmrZnwWEqn6KpXmUU3Uq9qE=;
 b=hke8Bh8lPxBXYLZwlBmo5gjrLJ+1dA9x41ISbDxS4JL6uvvhFcwdfUyk
 R86UaizNZ7Tsrle4+SLCZXbnG1dEOcOW6a8QUWpT0N4X+jSXih+eZj47a
 5KucQl/cTBO0mwHNCB/T7QyHrwWrSKaALWxb7oxFAa8OvTrAjMnCK957p
 +x7tm3pilru9huGznMLcI8sCSB/ZLIeG0BkVcAIK2pZ+JXlJAnYHi2jkP
 pi5HT1+4PTpxmbHoIxkz2X/gNKPAzn9UqjaC08lvHB0ZEnfUOlf1XHqme
 AwVzH2LNiGfneHuQd1C5Iq0+z8pN1DdRLwKIg/C4q9ZEi7jI/ISbrBoXS g==;
X-CSE-ConnectionGUID: kme2s5CERTa6VQ8VLZm/TA==
X-CSE-MsgGUID: h6EyJ2XERRu78zQklw90Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32804705"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="32804705"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 19:55:37 -0700
X-CSE-ConnectionGUID: 7wpXQ4+1TiKf6rV/Q1dd9Q==
X-CSE-MsgGUID: FlXZYPP5RB65xxKlVKglwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="96048765"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 19:55:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 19:55:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 19:55:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 19:55:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 19:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5gN+YoYWrUYrqJGo9mToOufZ2oqDM79B/jsHlQddeAIasuMZ8mn9BYl9+6pCSt1KurwrP6ekw9paUm28KVFWAe+z4yBi3CyG0V0bhhtFiXjCgf9Ao/Uz3cUMdMLgOlnsf5oJ4o8Njsg2V4rdkCMqyqcLKzHngDfbLLjnN+n585qg45MTTXOPGdr1cTKOjXTzrUViyG3rKjsQeQUka18IHUX2YzPUX2WNl4GdP/hDLyhHWYw6r2C4Xt6p1e6ZsCrAz8AvVUNwwTcjDJCQpJGzhAHWXwFuQh1Lauf/UDnaOuOK2nAGtvzt5FzntOG1Tefwisw1GtGanYmDjSTaoe7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6ymoPc57TZeZ8o/zlxCstqGXk4i4AIkGWDudf6qC9w=;
 b=gKjVflyUhasNXjdg9aHUR9WF7IsT1TtzN+NrZ5KpvkkV9/LDy8U2wo+BCmOhQ9GnCRerHapKTHja7yWbOkgOPq93ROkixLZbmYlrCi0qmcewYttpVewbgqEB10Ro1MvD4QQvc6IkAf0y54nHZV/q8ODJ9q7ie8dTGcv2Fc8Z29ofk4Y+YFg+zTIubUsvikxF9PrwOGZyeipj+mZGXWgj91BZ0n0qTjLFMSq1tQtKfWKqlHZO7X2ZeNugNn74udLFLNfziunWBvfPl0oJjH5e6/Rz2+CyEEsoUutCPia1q0ekHaPjGCtgwgdQseQ+ys8VG/sqEnAtiidbcdLSnLWWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 02:55:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 02:55:33 +0000
Date: Tue, 13 Aug 2024 02:54:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrrK5yjirbjJQSFL@DUT025-TGLU.fm.intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
 <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
 <ZrogDGT326oSUZls@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrogDGT326oSUZls@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 916459d9-0ec5-4c5a-0cc9-08dcbb43660f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iuBwBLdBujFpt3Ejc69Oj+47Q7LKgR5NFAQxr1SwLEetOfDG7yV4wp3A7fc0?=
 =?us-ascii?Q?PMzk6N/fkanXb+cU1we1lySSL3B/RLiFsWx06mE/6Wu0vyjl9zk8qGbvKUy0?=
 =?us-ascii?Q?3V5+vvRe0kkZgk8vSGTrxpeFr3yrZK5L0+oP3ZR0cqPN9djz76iRVV6Dhtky?=
 =?us-ascii?Q?rkZRSZfZDgqKQlvm390B29NVGPYKVdyaxviaRAx3b63/VNsNqs4TUi+Xel3a?=
 =?us-ascii?Q?L5bXgi4kMBoKj3gO4BLEzm0u2FfJJB9+1FZz09TpzlEex0fX+KM4cLsMlVDJ?=
 =?us-ascii?Q?3lofOxcQFC+Niq7NAU+A5jE+aGMdv7eH54DJ75zIwiIqtIngWlEEJA3rqFK5?=
 =?us-ascii?Q?NW6YIoiwdx58CGF70oFCzFyaT1tlxslOhAVDl0eff3OPdkxHESNqirQ0QM+J?=
 =?us-ascii?Q?1Cs7/GQuqLGYDYFVVdivLLxGNKfY1ZR4xS7Pz+tUcdpN8Nyvn+oji1tbO38r?=
 =?us-ascii?Q?aZjpH0Wajg/NUvy14BlHylqgsMXxioLSVBDpW/jOi77rA7NNLwZm/Y4fpHOc?=
 =?us-ascii?Q?eNI36mx4c3KIP0fnmWv7mW5N7mtIGQJwYaN56900g3DltjT1sBICK6RnnfIr?=
 =?us-ascii?Q?itVMy3nMmNQpmw+lbX8xDJWo6dNB4sQe1FzsAZhdwXqy3zjPplFo7jU4SwEd?=
 =?us-ascii?Q?TxFNwbYmXKX29uHMKLMyMf/y9fzB19kaufSHulD3AtK2095RK7+glssgeEx7?=
 =?us-ascii?Q?pc6lWonJPtErPtTBIVEFgZlcHOd1h9lT21CzQ8kkV2kbZRYan11PseOfmNgm?=
 =?us-ascii?Q?qahVmh7RVAfcAPTJcixuutX+SREElbI6G1p/FEwcVJw1AO+cEzDJRuZtsVA6?=
 =?us-ascii?Q?NRPfCCVRenR0e72IxZL0QHtjDgTHBy/6KjfdF7LGAU41Jt9OTmQsm3htkCFK?=
 =?us-ascii?Q?2Jx7DbP2A6eAyJH5bEGAoxPY6NJlyhBo6N/N985CzZwVXA0fdmfk4uc9WijE?=
 =?us-ascii?Q?bt6LCNeoewMj960TvsISqzXyjcRuYccXEvSeY1rsWukVF7wlGkm7d0/ppdWb?=
 =?us-ascii?Q?Vwy7sYkuMENz4yT1rt0LQzvWsmsoZXo3LHkRnuSf+mIllRoygp7RpIDyODdv?=
 =?us-ascii?Q?fbNhhHrEDpvunoSkjQkLJPlm7R99PxHRPoNBhnHhp4XwFRQ3YHUaHdyiSIZp?=
 =?us-ascii?Q?Jw+xYgmrRE343YF2MDWMzIPSB+jGbxrPYX5UsPJVIGs3Su8mkWPzLNdP64id?=
 =?us-ascii?Q?5MFBpdQEck49TEXJbj3724LQkhSQDVpO7hisGA86Rh60CSfMmv7nN6VnVQWn?=
 =?us-ascii?Q?f+H9WHXNW3DhZ3CK06dFsp4DHVQ23rY+izrMDPm6Q7peWmJnL/CzOGrnTPdo?=
 =?us-ascii?Q?8iU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?79Uq+AhHwFZFJjCuhcEu2Ngrr2DMj6A8guYYtvkvQJuL0a0PuxPPtdr/igjs?=
 =?us-ascii?Q?iou1twRf/cysqJ/H05mSdEfFXg8x54SPEHpFJKnsSLq70QAjvRC5MC5yn6c8?=
 =?us-ascii?Q?klgJ5dHyF4Z9Io3ZxB3cP+bXb1a5a5S5N3GS+CD3Qf+GSFs55WWSdwQ505Wb?=
 =?us-ascii?Q?heIkkVYCuTr0jK0zpyKI9Yv3gT66NwibsJMNlc5LrMLy7HWNDBtjajtsBimM?=
 =?us-ascii?Q?05GTVJulG2k2Z4NbKUEQpJZOiZ/DaS7lbS5rBZs9yjkMOAHgJbM92d+O2z22?=
 =?us-ascii?Q?CVJ5W0NRzbjimxlwFQN0g1fisar8i9mzH5uQ13gEbw5sDiUGfTJ8MTaIaw+R?=
 =?us-ascii?Q?roavNrMei6/w/Mna5FAhKgdFA9ITR4zwZ94LQ9GkiQJcVg5m+w8OLe+2Ijmu?=
 =?us-ascii?Q?xR+wNScUlmR73f+nVR1SbUuBSvRbhlruwJZ50c5KRKCnpzuNoCBs6FdZ9G4F?=
 =?us-ascii?Q?/FOZHFo6afs7uwgdL57Z3TM3chGa5uYTFEKWL8scw6UALLSOL7XUz4EeRHY2?=
 =?us-ascii?Q?417NoazN6BOVuh4ujcKWS972Un9UEhxOSYWj19DOL63skzkKbEt0Mhag9hr4?=
 =?us-ascii?Q?5GpTlSLa64jvFDyfZCWID2HruUpjkB4ElKeAjYyTCeNaKsb/cepvul4EsJ+8?=
 =?us-ascii?Q?heu3SqU4nErF5vFPxcuw8GX+4ZlouP7O9COEIKr0c0HdotWdgbJvJtJPj2ZD?=
 =?us-ascii?Q?oLdNeW9SvZt3MOkinLL89XCUEukS6K62YnTwcp2Ez0pxqRs2/nUmSC9lpAHb?=
 =?us-ascii?Q?nLarhJCl39qFJ6MtJCBjJt2p8ugxAkB9bVVfBYxBM8qbcP8czuwDoooIPIHu?=
 =?us-ascii?Q?UW3IIHkZP3CrkOI2IaSFSn5KAj0d2BvMqV79eRwajdEhiNi7B3kpZOz86tqR?=
 =?us-ascii?Q?MMEKupLb2qoxJyNk5XRukdaRmYLhFn8t8ystVQA3YBwIfIXRuuJAYvWNsrzg?=
 =?us-ascii?Q?v2HpS6zCs4Ps8t3/86aAbTkBLe2Hcbt724knS00UbEMNVaEBgrRO6/n4aEqn?=
 =?us-ascii?Q?EZV99vULgkrpwZaRw9tPSZHYgMG0dKWGySQiwnsPj4QEhYmhWkk0rnaiwTjR?=
 =?us-ascii?Q?Y3CKLJkvhBKAn0vuT0glj6BulQeYjYxFaFi1iZ5a/+WdlksETuoEULWGSYtz?=
 =?us-ascii?Q?OC2v8xz8uMWUq2jk1gAf5VAlsoiNslFyYP/FyT6m2yQAR7/PFrIB0RACAO+s?=
 =?us-ascii?Q?GfnvEd9P82nnzy25uxUd8ai4ePYJbKlC4WphE/M0F+qBD2HBWMU/Tbs4DvaA?=
 =?us-ascii?Q?LGCfDX0QNNatdxzHTyTuiXdicaplGHceAbFMPGt/JFsSKuUiO2IckMj9sdBl?=
 =?us-ascii?Q?QawriZH5WtLZnoUdecXw+OSyvZEneEPFx0lf9CLZZ4fAVyu0wwAElJIWifLs?=
 =?us-ascii?Q?UPz0OdMgXXG6XjWFqb66CAj4QIfuEhZ9dz2yNKn7oIR9Ja9AfuQKaUxv2JcW?=
 =?us-ascii?Q?kaNrpNsVsaRYDfKeSr3l5osYeGc4/8ElBZiAF1A2FVV5SJ1CeedZaOKGMuLq?=
 =?us-ascii?Q?5Xyp1HgTUq1vywSGIiVaptkJcHaX0uiElLeGRVfeFIpG7EilS6HWSpdRe9AC?=
 =?us-ascii?Q?ySIDT4YUwUeb7POZ4FXUBFzkBTi2yOJAy/5PBAcPXgrxwlw0vkZKENHv72qJ?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916459d9-0ec5-4c5a-0cc9-08dcbb43660f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 02:55:33.0261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJxxd889Bwq9AuzXZmq/XCE9GyxUFrEK55FyATsbk+xGM41YtWmHSu8cf2681h6EMnXTcyNm2+6ErOatgG0PsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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

On Mon, Aug 12, 2024 at 04:45:32PM +0200, Daniel Vetter wrote:
> On Mon, Aug 12, 2024 at 01:51:30PM +0200, Andi Shyti wrote:
> > Hi Daniel,
> > 
> > On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > > > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > > > This patch series concludes on the memory mapping fixes and
> > > > > > improvements by allowing partial memory mapping for the cpu
> > > > > > memory as well.
> > > > > > 
> > > > > > The partial memory mapping by adding an object offset was
> > > > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > > > memory.
> > > > > 
> > > > > Does userspace actually care? Do we have a flag or something, so that
> > > > > userspace can discover this?
> > > > > 
> > > > > Adding complexity of any kind is absolute no-go, unless there's a
> > > > > userspace need. This also includes the gtt accidental fix.
> > > > 
> > > > Actually this missing functionality was initially filed as a bug
> > > > by mesa folks. So that this patch was requested by them (Lionel
> > > > is Cc'ed).
> > > > 
> > > > The tests cases that have been sent previously and I'm going to
> > > > send again, are directly taken from mesa use cases.
> > > 
> > > Please add the relevant mesa MR to this patch then, and some relevant
> > > explanations for how userspace detects this all and decides to use it.
> > 
> > AFAIK, there is no Mesa MR. We are adding a feature that was
> > missing, but Mesa already supported it (indeed, Nimroy suggested
> > adding the Fixes tag for this).
> > 
> > Also because, Mesa was receiving an invalid address error and
> > asked to support the partial mapping of the memory.
> 
> Uh this sounds a bit too much like just yolo'ing uabi. There's two cases:
> 
> - Either this is a regression, it worked previously, mesa is now angry.
>   Then we absolutely need a Fixes: tag, and we also need that for the
>   preceeding work to re-enable this for gtt mappings.
> 
> - Or mesa is just plain wrong here, which is what my guess is. Because bo
>   mappings have always been full-object (except for the old-style shm
>   mmaps). In that case mesa needs to be fixed (because we're not going to
>   backport old uapi).
> 
>   Also in that case, _if_ (and that's a really big if) we really want this
>   uapi, we need it in xe too, it needs a proper mesa MR to use it, it

I looked at this code from Xe PoV to see if we support this and I think
we actually do as our CPU fault handler more or less just calls
ttm_bo_vm_fault_reserved which has similar code to this patch. So I
think this actually a valid fix. Can't be 100% sure though as I quickly
just reversed engineered this code and TTM.

We don't have IGT test cases for this in Xe though, we likely should add
some if mesa is doing this.

Matt

>   needs igt testcases, and it needs a solid way to detect whether the
>   kernel supports this feature or not. But unless other drivers are doing
>   this too, I have some big questions why i915-gem needs this.
>  
> > > Also, does xe also support this? If we only add this to i915-gem but xe
> > > doesn't have it, it doesn't make much sense imo.
> > 
> > I don't know about. Lionel, Do you have anything to add here from
> > your side?
> 
> "I don't know" is not an acceptable answer for uapi work.
> -Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
