Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DD90F0FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8729C10ECE3;
	Wed, 19 Jun 2024 14:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tbnuk7BV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B456310ECE3;
 Wed, 19 Jun 2024 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718808299; x=1750344299;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D6GPOSOmUbBSL7rNU4gr4ArviAbXR1cPPUA3j+KewQE=;
 b=Tbnuk7BVQqk8U+qsclzzl5hkBCy054B9lQqXZdjWIrG0HYjhWstBVwk2
 TPQ34WNr1W0tD8FNQIFisObnK3ppEbnHwZEg4g+d+oq8ygPB6BzDQaFkr
 NoVpwgB+JIlhN48CWlv0m/k367onfQ2hfsFkQxSSG9KrkUqYe16sR1CW+
 wBDN8C1FoKRCTYPmokQgjn8+XTcYfAJMfuNpgkNWXWU3xKYl40NpJ7vyg
 xIhBQGA8ZSH/MTxUim5lIOkHsYsgfV6IttiEiDxwENFjCQbydba5dV7mu
 NnYKfPNVC+YrUC3ivAIZDB+z8+3BuUphcXcVJpkyiNuYV/VjOY4gM02CH w==;
X-CSE-ConnectionGUID: f8o0zh2oQ/mk4PEFVtkD2g==
X-CSE-MsgGUID: gqtmDxTRS/epYCIt+WRLJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26343655"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26343655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:44:59 -0700
X-CSE-ConnectionGUID: FU9C38BrRhay1gLu7rKwwA==
X-CSE-MsgGUID: 9h6vKkaQTMWCwwlyKct/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="47080148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 07:44:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 07:44:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 07:44:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 07:44:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 07:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+9znZuLQDgNyrVQAyi0i6G5M3ReQZRbl8GCW/P77dGpONt1QDD2FYMDejjTCASUMTyEQrpGBA2dimUW46JwWlMb2UrjzF0iUM66QarLc68I80Fa0jdRb6GTNUyCJeLd21+AM44d7xon54/Ra1nJET1GTek//FrvcPYgRwkS2jz06MNA4vs1c5IpeBybflqGcQRzfKma2Dh1R4GgnsS6hiF19aHue7e2SXITqpIoeuROlanUd0aG1Lbcj2G3tN6GTvLrNQjjwr7SY2y5qKzs9M4mt2iaIC5E/Tu31e1oVVKd+fuR+ZsIxJFtLgRMg/rJlSL3muZHF2pbPmD/97hUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKnbVro9E/RYdvq7An4NohzbJw7PjNsnPtAt3rlQuvE=;
 b=UUB81LuwuKXAbbdfZB/36s2V2WHBsM1S3/laX8BSsZC3cKOqOj97/2FAfsbBrMyT8B2bAhLZeutRgA6ymmTUN6t98MUa0JxR0XiM6+TUEIbk1HDiDCQkhzdUB/ffCSFiRdB/cydY7NdHEUCDe9oq4KNH6rhREjJyOPvQF9NkPSeHyxbnGXADNLeuHyzKu9rEd7kHc4Q34TNUGx1qtLWl+0FPBu3qwmszFWsoffnuwM3oW3HCnMDvdINY+0yfKK7vlnWAbOF4QQjzaE086QgL9/RTUPqDIsqyS8m1n6/7ThBbbqAzdKIPTZg9W+4NKvPZQsuAzEFGPhvVQNoOcZ5/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 19 Jun
 2024 14:44:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 14:44:55 +0000
Date: Wed, 19 Jun 2024 14:44:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
Message-ID: <ZnLuwxnT9Q99K7iz@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-5-thomas.hellstrom@linux.intel.com>
 <ZnJSZlUPs0ohKsHn@DUT025-TGLU.fm.intel.com>
 <074e7b0a09e6304b8ea520560e1476717e1f3655.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <074e7b0a09e6304b8ea520560e1476717e1f3655.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 685b5b5b-c06f-4a73-5d62-08dc906e62a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?50Y2DbmtVC+6xn5N9MgJ/F1KDZYghd9rQs4XpRAlff/hwUZh4UeRgk4gPI?=
 =?iso-8859-1?Q?8i1ManPnjkXxs+6zyR0R9AlopJOFBlSMwJoXhZPvyXMh1hOv3qF5Ou7s6B?=
 =?iso-8859-1?Q?nIAy9U4fnvwDld6EOq8nh7TttYjEC4GHYvKmERWrq3rRJlj92FkcrvJOiY?=
 =?iso-8859-1?Q?HDaLRKCpbC/5vrXpUdgZdjdfyDOTgXHipXtE2Wb5PvlU5G/oNSibi4HstO?=
 =?iso-8859-1?Q?TtKuM4hGLouHDwKg+t2ipaUsRCeF88P1hy69x3UVI728nj3oByXjJmjkme?=
 =?iso-8859-1?Q?50+VF0qefJMjVQgXGyWRqEp2JDpE+8sTrpUQsBP9isVb7v/rTDPo7mVOR8?=
 =?iso-8859-1?Q?Y3eskHR+2LPoA9+hBd8a02IopcMyJZlzVCqEQpCtdXY85NGfEQs652Pc6V?=
 =?iso-8859-1?Q?45VBe8lref//caKGg/gW9CHSJWJdrEMyYNvTjYDznqUxEz1Wufg7DoAWYW?=
 =?iso-8859-1?Q?O+Lo5xhNzta9QFHO9tD9oFQwE+N6EJLD7mt3JSVYnlFldGAOoueqe3TuuB?=
 =?iso-8859-1?Q?1WPQhQdSPQKn/m13DileL4m2dSg1OQP0fOKeRyGb5jl1iTUzcEQLwtB74u?=
 =?iso-8859-1?Q?OM1VGot0RRdHudPyO5I6IyvAvcaNn8WpguaH7dsLMaILpsoJTnzUdFEatb?=
 =?iso-8859-1?Q?AYKP4qGBJUKJa5ANpIgwMpohtRjtYdR3QybX84Rgv6jGWqljDJ4we4NME9?=
 =?iso-8859-1?Q?DP8rgLfyNOtfX4EbcAtxHDQ87efJlkv4tBVwABV3kUr+mXvRScd4O/NHkl?=
 =?iso-8859-1?Q?qP8Ai/jNmgVRHoCE3VpZ2Bo3l2D0sIeo241EvRnuhhkhE0EXs553bnsRPG?=
 =?iso-8859-1?Q?XXhoYahVSNIopny9IHPHvLY3WHhfmklDjuNjfikvQxPjnsOdX7ASliNLaP?=
 =?iso-8859-1?Q?BnJ1+NpHQKWT+DmozLA0h1wEKegpmjW00oxw2xRKFxXmWhnoujeJKrTNIT?=
 =?iso-8859-1?Q?EYw6GTMlH+M9ZSlaNdvj3L4al4ZvqkQpVAGbdy+wM00fes/1bLMhQbqKJb?=
 =?iso-8859-1?Q?4fFqHGo/yE8OHqDgXWSc3sRjQPqqqA8R7sKGURLP5WbipQL125cfLCTo9V?=
 =?iso-8859-1?Q?psJm9OofnqxVdayAc3MYHYN412TtYgGzxOjETDy8xxdD0geywC61iKaZiq?=
 =?iso-8859-1?Q?LJ4nwabF0kMf1fNZzFmlizVLUt0SkWG7FaBeepWfnvoYb89PdpcnzOCD/7?=
 =?iso-8859-1?Q?Uo4xMaAHuiFjmKqctAzEPxcPRubDpPCpXm0m38pGzba7e1iyrqnxN4bIIM?=
 =?iso-8859-1?Q?muAYn/nUb3bQxX9SsP7Pp/xy+f/Pxy9Xk+SjLN+TPzddiPcpy/4LL8VJ6l?=
 =?iso-8859-1?Q?xKDmi4Usa9ut5aPPtrG0xCem9hGibeQPPHlMFBYYcccY0nWqUUFiQjK4eU?=
 =?iso-8859-1?Q?N5mlJFHhTR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sGXH/+j2rhwC+ywJ+qwINgMmE2HTZnK/hD2bMngM0rCXuHWcb1NZ0EcZr2?=
 =?iso-8859-1?Q?zvGyY5HIHgPnKdYZJpnMickf0k1d5SFAMwLhvDdeJt+C8RvalQcTAaMEEF?=
 =?iso-8859-1?Q?WATyT0/uCS1fm5EJigom0FjJ+20kVjXhBlWEQhSKyBp5SuFSxikg7ZJbyO?=
 =?iso-8859-1?Q?+MxamH4n5Sgv4uzixsBtcNglLIIVKCZLzEuynIi8uXot3b6EOJlMFsyJgr?=
 =?iso-8859-1?Q?0YILxtkXdz12ARuDvT2TsnsSEd4pprhFGq7YaO01/+TTX0AFFX2Li80t9t?=
 =?iso-8859-1?Q?xVI/vS7H151FgpFIbfRych8MxSRE1DRlnNHThkCTX1Y3J2DgZ7kycfcWGs?=
 =?iso-8859-1?Q?gD4u/iNuJQIRR+gFxyG+QrAGZ2LhFH9joVk7I7z7H8FBQNACz26VlXURO+?=
 =?iso-8859-1?Q?/lqIyHigxZMcWYnujMP+jz1kukr4HxwS8LWuZWvAjOwxToWFzQImbYHmG7?=
 =?iso-8859-1?Q?3gM4xFp77VMtBU1k2E7HjueEJIHxMzM2yCXRSN2YVvXzx/fOz6cqbQhXIM?=
 =?iso-8859-1?Q?I+uIOl2AraP/YgXSOEHK6Ek9h71E3GyAoq+n79cOFxd0caAggD0mRq2Gbu?=
 =?iso-8859-1?Q?wVoM8FmLM7W6CmBTrRJQ5tX8pjvFGBXZtM3QtFUeza91KRh28HxsNePXW3?=
 =?iso-8859-1?Q?1677aEwWZdYJqikNJpTiTzNbNUwCrONUP0GzQ4de2v2Q+VizDg4QsGQ86u?=
 =?iso-8859-1?Q?mHhPlcYfA+LCcYvpKY0Wl+mTMfnnv2AxSNzUu11ZtJAynqz6opuCFOAYU7?=
 =?iso-8859-1?Q?QEC0V91XL0B+CjHwpabeDxZYPdov6MZBsvKR/6a5SDBKnh2cFDjdYw3tza?=
 =?iso-8859-1?Q?I2GefuD/BZB2Dlu3tXg3hLcrpCq2n0ulCx7pPL7G8FRw4KCOksktrvYIJk?=
 =?iso-8859-1?Q?hwbRVKcNSHj7ut4SrJy02euVuHqBTypSMTeQ72TWWXEMx45+dAs8b7JhFQ?=
 =?iso-8859-1?Q?s0ioU0arIfzzDhJ6StioBZZLTSdScd7BnwNwJYdwfSbZ5pDyb/iABdFlvK?=
 =?iso-8859-1?Q?ynJ6vNx7NwP8Uy3agbRJm/yvHRsv/1DnPw1VkHrdtdsgE4Q6cBbajtqvwU?=
 =?iso-8859-1?Q?tvtGk15ogskNDd+Z6RDmXikynGmKQ/AMrGa4U/7PzQzDSi3LCIDRpOffyS?=
 =?iso-8859-1?Q?2KOgtW5crr4WKrmCI9JP11QQ3Hy+3tUlDbFyiua4thYJkc5uO5TfYnSXWO?=
 =?iso-8859-1?Q?rvK65Bp4NNn2lYmCatK4AED2IkQP8kVRe0M3vJW5gXXvo7H3rEWPKSlj7c?=
 =?iso-8859-1?Q?wENF9epWlBwvoedsLxeF/ycXWeCdQhaafCpuZAAvu+q8DjHyDGRT+NyzZD?=
 =?iso-8859-1?Q?ALRefBqBR+P3oe3ionJ92EayDuL91wLDff2H8hZwk0FojgfRay+IzLHTCT?=
 =?iso-8859-1?Q?h0iVr5zlnCZcbAeWdlNvDrVSqT/JWQTdIiAWVl/Fyz/Ptbe3LOB4wLQdTP?=
 =?iso-8859-1?Q?Tz+NHGcIgo5AjLmC8Vz3SYkBIvBTNkCVhe5HwvKYsMDCAmFdG7rmrsweM4?=
 =?iso-8859-1?Q?cFw8uH2tfaRDZXPKmiqehfyTzBcoJVpWXXF+z7LYd6mVoskw5yBYwb296V?=
 =?iso-8859-1?Q?h2tu+uljaDQ+pe1B9RxW1S67DN1DUZhKV50oQFfNOzadJqkNjWw6ed8Eun?=
 =?iso-8859-1?Q?rhiLLerpWxm12FcBKnCVt5CTt3yfc5P5OLK7kiMY5DGj0cOojfRpg+kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 685b5b5b-c06f-4a73-5d62-08dc906e62a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 14:44:55.7312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWDtaXl0w2qXtnoopNdMXUTLJdJwBJ3Y05a4s7LifH71Sv6vNczxARyizcnaeTHGsH0SgyhHMWpMmFQ0cT8k3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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

On Wed, Jun 19, 2024 at 10:24:25AM +0200, Thomas Hellström wrote:
> On Wed, 2024-06-19 at 03:37 +0000, Matthew Brost wrote:
> > On Tue, Jun 18, 2024 at 09:18:12AM +0200, Thomas Hellström wrote:
> > 
> > Ugh, replying to correct version again...
> > 
> > > To address the problem with hitches moving when bulk move
> > > sublists are lru-bumped, register the list cursors with the
> > > ttm_lru_bulk_move structure when traversing its list, and
> > > when lru-bumping the list, move the cursor hitch to the tail.
> > 
> > - So the hitch moves to the tail (last) which points to the next item
> > in
> >   the LRU list
> > - Then bulk is moved which is from first -> last to the end of the
> > LRU
> >   list
> > - Now the hitch remains in the correct position in the list (i.e. it
> >   didn't move with the bulk)
> > 
> > Did I get that right?
> 
> Yes, correct.
> 
> > 
> > > This also means it's mandatory for drivers to call
> > > ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> > > initializing and finalizing the bulk move structure, so add
> > > those calls to the amdgpu- and xe driver.
> > > 
> > > Compared to v1 this is slightly more code but less fragile
> > > and hopefully easier to understand.
> > > 
> > > Changes in previous series:
> > > - Completely rework the functionality
> > > - Avoid a NULL pointer dereference assigning manager->mem_type
> > > - Remove some leftover code causing build problems
> > > v2:
> > > - For hitch bulk tail moves, store the mem_type in the cursor
> > >   instead of with the manager.
> > > v3:
> > > - Remove leftover mem_type member from change in v2.
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
> > >  drivers/gpu/drm/ttm/ttm_resource.c     | 89
> > > ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_vm.c             |  4 ++
> > >  include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
> > >  4 files changed, 132 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > index 3abfa66d72a2..97743993d711 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device
> > > *adev, struct amdgpu_vm *vm,
> > >  	if (r)
> > >  		return r;
> > >  
> > > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > +
> > >  	vm->is_compute_context = false;
> > >  
> > >  	vm->use_cpu_for_update = !!(adev-
> > > >vm_manager.vm_update_mode &
> > > @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device
> > > *adev, struct amdgpu_vm *vm,
> > >  error_free_delayed:
> > >  	dma_fence_put(vm->last_tlb_flush);
> > >  	dma_fence_put(vm->last_unlocked);
> > > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > > >lru_bulk_move);
> > >  	amdgpu_vm_fini_entities(vm);
> > >  
> > >  	return r;
> > > @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device
> > > *adev, struct amdgpu_vm *vm)
> > >  		}
> > >  	}
> > >  
> > > +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
> > > >lru_bulk_move);
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index 9c8b6499edfb..a03090683e79 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > @@ -33,6 +33,49 @@
> > >  
> > >  #include <drm/drm_util.h>
> > >  
> > > +/* Detach the cursor from the bulk move list*/
> > > +static void
> > > +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> > > +{
> > 
> > A lockdep annotation wouldn't hurt here.
> 
> Will add.
> 
> > 
> > > +	cursor->bulk = NULL;
> > > +	list_del_init(&cursor->bulk_link);
> > > +}
> > > +
> > > +/* Move the cursor to the end of the bulk move list it's in */
> > > +static void ttm_resource_cursor_move_bulk_tail(struct
> > > ttm_lru_bulk_move *bulk,
> > > +					       struct
> > > ttm_resource_cursor *cursor)
> > > +{
> > > +	struct ttm_lru_bulk_move_pos *pos;
> > > +
> > 
> > A lockdep annotation wouldn't hurt here too.
> 
> +1!
> 
> > 
> > > +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
> > > +		list_del_init(&cursor->bulk_link);
> > > +		return;
> > > +	}
> > > +
> > > +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
> > > +	if (pos)
> > 
> > 'if (pos->last)'?
> > 
> > As 'if (pos)' is going to always be true given you are using the
> > address
> > of operator (&) on an instantiated struct ttm_lru_bulk_move_pos.
> 
> Good catch! I'll fix that up.
> 
> > 
> > > +		list_move(&cursor->hitch.link, &pos->last-
> > > >lru.link);
> > 
> > This should be list_move_tail, right? So last->next == hitch.
> > 
> > As the code is last->prev == hitch which means the hitch would be
> > included in the bulk move, right?
> 
> It's the other way around right? list_move(a, b) will insert a as b-
> >next, which is what we want.

I realized a bit after typing this, yes this is correct as is.

> 
> > 
> > > +	ttm_resource_cursor_clear_bulk(cursor);
> > > +}
> > > +
> > > +/* Move all cursors attached to a bulk move to its end */
> > > +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move
> > > *bulk)
> > > +{
> > > +	struct ttm_resource_cursor *cursor, *next;
> > > +
> > > +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
> > > bulk_link)
> > > +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
> > > +}
> > > +
> > > +/* Remove a cursor from an empty bulk move list */
> > > +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move
> > > *bulk)
> > > +{
> > > +	struct ttm_resource_cursor *cursor, *next;
> > > +
> > > +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list,
> > > bulk_link)
> > > +		ttm_resource_cursor_clear_bulk(cursor);
> > > +}
> > > +
> > >  /**
> > >   * ttm_resource_cursor_fini_locked() - Finalize the LRU list
> > > cursor usage
> > >   * @cursor: The struct ttm_resource_cursor to finalize.
> > > @@ -45,6 +88,7 @@ void ttm_resource_cursor_fini_locked(struct
> > > ttm_resource_cursor *cursor)
> > >  {
> > >  	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > >  	list_del_init(&cursor->hitch.link);
> > > +	ttm_resource_cursor_clear_bulk(cursor);
> > >  }
> > >  
> > >  /**
> > > @@ -73,9 +117,27 @@ void ttm_resource_cursor_fini(struct
> > > ttm_resource_cursor *cursor)
> > >  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
> > >  {
> > >  	memset(bulk, 0, sizeof(*bulk));
> > > +	INIT_LIST_HEAD(&bulk->cursor_list);
> > >  }
> > >  EXPORT_SYMBOL(ttm_lru_bulk_move_init);
> > >  
> > > +/**
> > > + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> > > + * @bdev: The struct ttm_device
> > > + * @bulk: the structure to finalize
> > > + *
> > > + * Sanity checks that bulk moves don't have any
> > > + * resources left and hence no cursors attached.
> > > + */
> > > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > > +			    struct ttm_lru_bulk_move *bulk)
> > > +{
> > > +	spin_lock(&bdev->lru_lock);
> > > +	ttm_bulk_move_drop_cursors(bulk);
> > > +	spin_unlock(&bdev->lru_lock);
> > > +}
> > > +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> > > +
> > >  /**
> > >   * ttm_lru_bulk_move_tail - bulk move range of resources to the
> > > LRU tail.
> > >   *
> > > @@ -88,6 +150,7 @@ void ttm_lru_bulk_move_tail(struct
> > > ttm_lru_bulk_move *bulk)
> > >  {
> > >  	unsigned i, j;
> > >  
> > > +	ttm_bulk_move_adjust_cursors(bulk);
> > >  	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
> > >  		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> > >  			struct ttm_lru_bulk_move_pos *pos = &bulk-
> > > >pos[i][j];
> > > @@ -515,6 +578,29 @@ void ttm_resource_manager_debug(struct
> > > ttm_resource_manager *man,
> > >  }
> > >  EXPORT_SYMBOL(ttm_resource_manager_debug);
> > >  
> > > +static void
> > > +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
> > > +			       struct ttm_lru_item *next_lru)
> > > +{
> > > +	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
> > > +	struct ttm_lru_bulk_move *bulk = NULL;
> > > +	struct ttm_buffer_object *bo = next->bo;
> > > +
> > > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > > +	if (bo && bo->resource == next)
> > > +		bulk = bo->bulk_move;
> > 
> > 
> > Can you explain what the above if statement is doing, struggling a
> > bit
> > here. Is this a weird case where the LRU item (struct ttm_resource)
> > is
> > fully (1st condition) or partially (2nd condition) detached from a
> > BO?
> 
> Yeah, this is a weird corner case where the resource is handed over to
> a ghost object, and the lock protection is not clearly specified. From
> my reading of the code, at least bo->resource is not protected by the
> LRU lock when clearing, but bo->bulk_move is, so given that, perhaps
> the test is indeed unnecessary.
>

Looking at that code I think the above statement is correct.
 
> > 
> > > +
> > > +	if (cursor->bulk != bulk) {
> > > +		if (bulk) {
> > > +			list_move_tail(&cursor->bulk_link, &bulk-
> > > >cursor_list);
> > > +			cursor->mem_type = next->mem_type;
> > > +		} else {
> > > +			list_del_init(&cursor->bulk_link);
> > > +		}
> > > +		cursor->bulk = bulk;
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * ttm_resource_manager_first() - Start iterating over the
> > > resources
> > >   * of a resource manager
> > > @@ -535,6 +621,7 @@ ttm_resource_manager_first(struct
> > > ttm_resource_manager *man,
> > >  	cursor->priority = 0;
> > >  	cursor->man = man;
> > >  	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> > > +	INIT_LIST_HEAD(&cursor->bulk_link);
> > >  	list_add(&cursor->hitch.link, &man->lru[cursor-
> > > >priority]);
> > >  
> > >  	return ttm_resource_manager_next(cursor);
> > > @@ -559,6 +646,7 @@ ttm_resource_manager_next(struct
> > > ttm_resource_cursor *cursor)
> > >  		lru = &cursor->hitch;
> > >  		list_for_each_entry_continue(lru, &man-
> > > >lru[cursor->priority], link) {
> > >  			if (ttm_lru_item_is_res(lru)) {
> > > +				ttm_resource_cursor_check_bulk(cur
> > > sor, lru);
> > >  				list_move(&cursor->hitch.link,
> > > &lru->link);
> > 
> > Sorry noticing this here from a different patch. Shouldn't this be
> > list_move_tail so if the LRU can't be evicted we don't pick it again?
> 
> Same as above.
> 

Yep, my mistake.

Matt

> > 
> > Matt
> > 
> > >  				return ttm_lru_item_to_res(lru);
> > >  			}
> > > @@ -568,6 +656,7 @@ ttm_resource_manager_next(struct
> > > ttm_resource_cursor *cursor)
> > >  			break;
> > >  
> > >  		list_move(&cursor->hitch.link, &man->lru[cursor-
> > > >priority]);
> > > +		ttm_resource_cursor_clear_bulk(cursor);
> > >  	}
> > >  
> > >  	ttm_resource_cursor_fini_locked(cursor);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 61d4d95a5377..226da3c74f9c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1339,6 +1339,8 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >  
> > >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > >  
> > > +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > +
> > >  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > >  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up
> > > to uAPI */
> > >  
> > > @@ -1462,6 +1464,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe, u32 flags)
> > >  	mutex_destroy(&vm->snap_mutex);
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > >  	kfree(vm);
> > >  	if (flags & XE_VM_FLAG_LR_MODE)
> > >  		xe_pm_runtime_put(xe);
> > > @@ -1605,6 +1608,7 @@ static void vm_destroy_work_func(struct
> > > work_struct *w)
> > >  		XE_WARN_ON(vm->pt_root[id]);
> > >  
> > >  	trace_xe_vm_free(vm);
> > > +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> > >  	kfree(vm);
> > >  }
> > >  
> > > diff --git a/include/drm/ttm/ttm_resource.h
> > > b/include/drm/ttm/ttm_resource.h
> > > index 8fac781f641e..571abb4861a6 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
> > >  	return container_of(item, struct ttm_resource, lru);
> > >  }
> > >  
> > > -/**
> > > - * struct ttm_resource_cursor
> > > - *
> > > - * @man: The resource manager currently being iterated over.
> > > - * @hitch: A hitch list node inserted before the next resource
> > > - * to iterate over.
> > > - * @priority: the current priority
> > > - *
> > > - * Cursor to iterate over the resources in a manager.
> > > - */
> > > -struct ttm_resource_cursor {
> > > -	struct ttm_resource_manager *man;
> > > -	struct ttm_lru_item hitch;
> > > -	unsigned int priority;
> > > -};
> > > -
> > > -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > > *cursor);
> > > -
> > > -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> > > -
> > >  /**
> > >   * struct ttm_lru_bulk_move_pos
> > >   *
> > > @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
> > >  
> > >  /**
> > >   * struct ttm_lru_bulk_move
> > > - *
> > >   * @pos: first/last lru entry for resources in the each
> > > domain/priority
> > > + * @cursor_list: The list of cursors currently traversing any of
> > > + * the sublists of @pos. Protected by the ttm device's lru_lock.
> > >   *
> > >   * Container for the current bulk move state. Should be used with
> > >   * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> > > @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
> > >   */
> > >  struct ttm_lru_bulk_move {
> > >  	struct ttm_lru_bulk_move_pos
> > > pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> > > +	struct list_head cursor_list;
> > >  };
> > >  
> > > +/**
> > > + * struct ttm_resource_cursor
> > > + * @man: The resource manager currently being iterated over
> > > + * @hitch: A hitch list node inserted before the next resource
> > > + * to iterate over.
> > > + * @bulk_link: A list link for the list of cursors traversing the
> > > + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
> > > + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange
> > > @hitch is
> > > + * inserted to. NULL if none. Never dereference this pointer since
> > > + * the struct ttm_lru_bulk_move object pointed to might have been
> > > + * freed. The pointer is only for comparison.
> > > + * @mem_type: The memory type of the LRU list being traversed.
> > > + * This field is valid iff @bulk != NULL.
> > > + * @priority: the current priority
> > > + *
> > > + * Cursor to iterate over the resources in a manager.
> > > + */
> > > +struct ttm_resource_cursor {
> > > +	struct ttm_resource_manager *man;
> > > +	struct ttm_lru_item hitch;
> > > +	struct list_head bulk_link;
> > > +	struct ttm_lru_bulk_move *bulk;
> > > +	unsigned int mem_type;
> > > +	unsigned int priority;
> > > +};
> > > +
> > > +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > > *cursor);
> > > +
> > > +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> > > +
> > >  /**
> > >   * struct ttm_kmap_iter_iomap - Specialization for a struct
> > > io_mapping +
> > >   * struct sg_table backed struct ttm_resource.
> > > @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct
> > > ttm_resource_manager *man)
> > >  
> > >  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
> > >  void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> > > +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> > > +			    struct ttm_lru_bulk_move *bulk);
> > >  
> > >  void ttm_resource_add_bulk_move(struct ttm_resource *res,
> > >  				struct ttm_buffer_object *bo);
> > > -- 
> > > 2.44.0
> > > 
> 
