Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242A9849EA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEAB10E72C;
	Tue, 24 Sep 2024 16:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsOtdhKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74BF10E0CF;
 Tue, 24 Sep 2024 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727196264; x=1758732264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U8w5M1i3m/HVbi0ZnYtWSUCu8ZpA+cyXBP3JtgLZTVg=;
 b=JsOtdhKc8aHi7hTekfPWEJeI6dDbOfArTpUGrJf241keYD8tyIrckTrF
 8VOCvJKFhUcI2EeUUS7pUx+25GgsDI2MPpVVAtaOmRZptFIfYcd6UWklq
 PS4RLckbDCmnf+/iN7KwEO5HIzTnp3S9AwVMk/Yqy91fjcXKDhWqhfqfe
 0MoIP1gzrZEfrerXgTkD2CIZOqG/BgMLImiRTVHjTyqyL8CBD7GMudcW2
 uz0bizGrSVuXRGu/8vy7fSHUKxEg9m7mXJEeI+UpR7EU3zFgRtPzJ3W1o
 EAOF7FeQ7FunmlAl6Qe4ZoV/30BIFh5Vpo8pZo+6jOiYc1gnAnFKCS0AS w==;
X-CSE-ConnectionGUID: EFhuWBr3RLuaOjp7xXecCg==
X-CSE-MsgGUID: q6Kee3X3T16ExzHDBLj3rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26299052"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="26299052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 09:44:23 -0700
X-CSE-ConnectionGUID: bLTbVMY0SUeqrQXI6nNrfA==
X-CSE-MsgGUID: fIt4j18GSTKeqwHpO04bYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76413565"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 09:44:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 09:44:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 09:44:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 09:44:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 09:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZu56X/QBCPMknQVbpLq2lbsBO8A2e6NL8zOIGyzXA5ey4uSJ3AmrmQZ3AJJizYjiALSuMnKB3HVEIZlNgktM0Am2r5USnhNzxY2AstI2lj0t0QAzYDhPGilPoYHhn1igcodei0Y5I2CjCvkWDTdWFMrHbLUstDmPNvCJho52xQRuuSZYHvFN3Z5NXxgc76eb4ru3UDctEKeivxHPQfHh2ILTNMXcfqTVBFyZyj1Dgwa5iV6gNPPQP5jp3Nwh4o6T0wukd/pnoawIVJOZUUrIBhxpFL7tV8exVBcq4r1JHM4alPPMne2/UnvuK95t7A4GpWz53PKdjr/d7yPgCSEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXttfdi9LUQf9+rCQZANUIT1QiIg88G6I/Lx7ltlFk8=;
 b=oJ8o3YKdi33zwG5/7g3J0iJstYk9L8/vpexDLhQonaABtkqwxKGms9T9S1VAbO1cleq+B7Z2SkZvaQRbeZAVx914V+Y3HAB+zqqG7KoGSqqKHUcxABdEDfltFiVUxEAPU+w4oRoD9tWVo/TH6J+xcUHzfITXAt9RSTeE5n75yl5hzOyeUOsYwF2Ot9KBZ9NBV3ycxvaeEwKHYzfvUGXLGgM8M5yaKI8SX28ov4bRJXC/ZIAuLqIX9I26NHji1neaELZYoBHCDj+fOG9AhusJtIrRjvMJ0IFMMRXfBEy6ABlsulGY2UEYUcOp7KFy7Fe64mGev3oDO7cVEotiJkXGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 16:44:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 16:44:19 +0000
Date: Tue, 24 Sep 2024 16:42:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: Felix Kuehling <felix.kuehling@amd.com>, Alistair Popple
 <apopple@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <Philip.Yang@amd.com>,
 <akpm@linux-foundation.org>, <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
 <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
 <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afec606-b15c-442b-bd1e-08dcdcb822bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TQRMs1nzX+8jUKKPbCElIYZMCCiM0cUpAVwJrTms/JBXog5UCLEywjksk9?=
 =?iso-8859-1?Q?CJGbVnywJAocDIIASjMyjSaXTsmfUtqwdXEWGvgMBywdM1Vi7MPWs/P7wF?=
 =?iso-8859-1?Q?LEGszeTah+OPdyypl6VFbAoTEaTvnsMI/wR96+VscVs2U5NRr7b/UtJEEz?=
 =?iso-8859-1?Q?VVTx1/UZsqeAOFQfihSK/2JZllsjPigSCftMNBsK2L5HjJcws2ycHTuzOY?=
 =?iso-8859-1?Q?YATOOpLKc+w2/mNWSH+eE3Lyy+RlaJZLiWaNNM9gMHS4WAwxW7QHT5YoSj?=
 =?iso-8859-1?Q?xo/tUUQLapKHtkVo4MqF5zjognmNOcRzvU2gVjSYGZEoxswo/3Frg7//1d?=
 =?iso-8859-1?Q?VBlIYaNMUhpDrxVRmGH6H6tcsu9uuaoTK/5kAP8c6/7+Wx/SWd7s+jrbzT?=
 =?iso-8859-1?Q?y03+ELjFQHwlmKLRpGOwdZwIYWksYZrqghI93WaYlsoKVaY585/XiNosv4?=
 =?iso-8859-1?Q?JiUgt7boi6OgFGYKAFgrvWAhXK+XZzGSnzNIu/tC8FplFRX4RdRS1aTEGD?=
 =?iso-8859-1?Q?K6g84QmGeyrHNBFdP5I+g/cutXi2lDPgsR1MCJkb3Tc8sQJJ7Pm9n/WZVn?=
 =?iso-8859-1?Q?038DaWfTYKATcPAJ8Y2XNFaSPrFpWFOsNZnfFDp1HNdW3LhTKolcKo6yUb?=
 =?iso-8859-1?Q?YcMwtM2hzDzOF+OVVxxiJBILUzRpEkb7HM3SsURuqFylUDAywf8GlnksJD?=
 =?iso-8859-1?Q?Yloc1X5cETy26gfPMhRqo10M+FyR/UTPCWOOwwubA0pfovQi+Qv1g8bdu7?=
 =?iso-8859-1?Q?30QalbtourvgghAJ1aqq6OVpxO7WvWH2jshCK+SglDvGKoXHp06hS2u7Ip?=
 =?iso-8859-1?Q?Ay+Rfv5mtmnldUKcbGnEqIh3d1QuwP0Cvg1WxyM/InzlPChhOwgTdghYGN?=
 =?iso-8859-1?Q?8Rzw1Hm6NJsJil9Aefvp4G2yon/GRskX/zcQ+qKVGNYYtapxkKn1IibTNU?=
 =?iso-8859-1?Q?84fKelMTlG/uFE3Bo8/CFM4EfQIYUjiELLg88WUyhTJ0CtsgG1SBE8T9yp?=
 =?iso-8859-1?Q?q55aTVPZkYuxjG7mimYdrVAT6CV0+ikrFKCgvFqShAMl4ojF8p3VuYOPUD?=
 =?iso-8859-1?Q?U7vjFDbAx6JhtZmPBDw8jO6pHhNFDyntltQTwcdJSks1Vl+fKvw3JfMWlq?=
 =?iso-8859-1?Q?nIsDZPmFsTTxYA4lK1OcwA1XRfPsErdyJWrlJrhQMUOwLE2qBb2dZdoJyR?=
 =?iso-8859-1?Q?GG2+ZrWCIbJjxqPpC9BGxmxk5v9chdVRWCoy9zr78gapWud1xpcE60dMOD?=
 =?iso-8859-1?Q?QABOyZ+RuXO1CFGTtKGVTRksULEj515e9k1Pv/mCu2AW8TmeC5QxY3bBci?=
 =?iso-8859-1?Q?djc0ohe1I+VVQBmzPWc5aM2P/ya1VbXG5sCe3w5t+7/YIwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6hFDM4yreYS2sBe+icKvOSz+wT3/GlS503iFthJZYhYGxMdec3xqpgW0JR?=
 =?iso-8859-1?Q?h9quJts4d4Zn02XjKBFBmd3Ajn/9j2oHqeeSYIiAzg+4ZHP3mXKxQe98nA?=
 =?iso-8859-1?Q?jW4esmNtc8R8b3BgA6HvB5I7SsvC5tLk/k2mpUfZNn9baUyhXaT5aVpsoA?=
 =?iso-8859-1?Q?LFsYPvii7gRA9xGPrqQc6/ILOKxpyvfitJw+SPAI0rpGrtSHALcL9nzwo4?=
 =?iso-8859-1?Q?j2dAVHc2wSpKJYnMFRDalvvw2PmK/0TT6t4kma8IncVKfuh/sNiPpQwcUe?=
 =?iso-8859-1?Q?Z4yn9xVIrC5KU1Z6Gp/jrdFWkaEY1PnrBX7MjVwveNyQ1fAY/zTdeJNPdT?=
 =?iso-8859-1?Q?MpYah+VAnxnFnJ7X+KmXeOAl2yUiiZBezJdA2UeHyy2Q6dM6awdAPxJtcR?=
 =?iso-8859-1?Q?FX5RRv/idhm1z1Mtncbk7nxybTsFlQ9Y65DKrn6gXD3RIjKDdzL2XA0XDb?=
 =?iso-8859-1?Q?nPlmbkvj0LSasztXIxLFrGeO263tzHyJJ2cVCpbjhsB8HLES/EBdn9LbKm?=
 =?iso-8859-1?Q?qdUg6LEglRMTQ+ulhncVxZ2TXTm/3O+TkGtqr8iw/Jy6CyMu5wyWu9epZF?=
 =?iso-8859-1?Q?kiSWmduafHt01qQtaQbc+/Z6ibodQ+jxjQ+CMTNuT+uYysKvD/R/79vmwc?=
 =?iso-8859-1?Q?XJvuwrLb2XpM04SOi64iTSYqQh8R20QQCCao1raxKoTlX7Pyu7ww6Sx06G?=
 =?iso-8859-1?Q?Ki61AlDYkfYdRmVKTMDEX2wjzGVPqmeTFzlsX4ASfeDy+GYfqbUmVa3cV1?=
 =?iso-8859-1?Q?f4mrSgVw1UVSD92tFDy2cHVsNuQDgUx95nwnEA1fYYg4OtBjyRxPsV0WoX?=
 =?iso-8859-1?Q?c0u0hiB61TUOUKi0pxZKDA6jCvxCS3LPd9QGXDGple2SL7pjGHNvi/i7yQ?=
 =?iso-8859-1?Q?diYYgxT3JzwZtxuBi1gzdB2m8c8NC35u9nhFSZCgastZHY51vv387Q6dOJ?=
 =?iso-8859-1?Q?tQO4IuvXR0ac+QvnV59O1H2sstngYDGHbr1MhxK48CY7SGSsU9ddiwg7b2?=
 =?iso-8859-1?Q?b0HxpwyijfYZnMQzylAOzXfZHCRwV5oTxdLiGAx+OFthZZDk4Yp6X97BEV?=
 =?iso-8859-1?Q?m1tuGiSi6pLX7+ZP83jla2VcvCWCkrMytjptfJCerkp8dbhTXAJJodkjBQ?=
 =?iso-8859-1?Q?pNirDClt9+/gqslCFvJQ87qWQ9c72FQnJDXAHaU6bHiyL3pU5zcIwyooQy?=
 =?iso-8859-1?Q?yvC+tCh0ODh/WH8eBQPMQeAFkJCd87FRWMe4gRtiU59Cc59AODlbbp2w0q?=
 =?iso-8859-1?Q?Ze1N2NWZMz0JFbPV5+Ji1V038rxFbAqfgYm9ARjhc6RrSvZ/OBPTgFfAgY?=
 =?iso-8859-1?Q?8CQCWOSqxngzSo41e383+/E6IxxASIq/bopi0xlpGuGEo19FII6dU4MDtp?=
 =?iso-8859-1?Q?5kVEiV08KzaYBBUrnJhu/0hlposoyYYIfCVJoc8RY7XZAnZZX1xO5ClX4x?=
 =?iso-8859-1?Q?D2kdr95XXYMvPGv80yqdd9ZAUiCtJVyDxgd9p1ZvETDRkIJfSUZJmVIV/A?=
 =?iso-8859-1?Q?TipULWRAsqxM6oa6WTjV4vVYK63t+lDdl3nK+VZNjKLDl9eTzYs0efjQEK?=
 =?iso-8859-1?Q?a8PY8xhEA4GiUtfwPi3jHvHRUzNHMfYXT9pD3ke+mr3VOaKUNo9mRCDRSY?=
 =?iso-8859-1?Q?5va2zoFT0xutZ1zk3w4d/mfyqGr+GIbcr0MUcwHjDC9vZMnxnqakwRIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afec606-b15c-442b-bd1e-08dcdcb822bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 16:44:19.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Q0rYY+9O4iDR+9XOCOl5/xDYD5zkYo4PjqziCnHuVjgFZLsnljvUt42jGp6Z+VpQNok3Pmfkd4O4mN3+Rb8pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

On Tue, Sep 24, 2024 at 01:48:29PM +0200, Simona Vetter wrote:
> On Fri, Sep 20, 2024 at 09:59:51PM +0000, Matthew Brost wrote:
> > On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
> > > 
> > > On 2024-09-20 17:23, Matthew Brost wrote:
> > > > On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
> > > > > On 2024-09-18 11:10, Alistair Popple wrote:
> > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > > > 
> > > > > > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > > > > > 
> > > > > > > > I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> > > > > > > Still a driver.
> > > > > > Indeed, and I'm happy to answer any questions about our implementation.
> > > > > > 
> > > > > > > > but theoretically it seems like it should be possible. However we
> > > > > > > > serialize migrations of the same virtual address range to avoid these
> > > > > > > > kind of issues as they can happen the other way too (ie. multiple
> > > > > > > > threads trying to migrate to GPU).
> > > > > > > > 
> > > > > > > > So I suspect what happens in UVM is that one thread wins and installs
> > > > > > > > the migration entry while the others fail to get the driver migration
> > > > > > > > lock and bail out sufficiently early in the fault path to avoid the
> > > > > > > > live-lock.
> > > > > > > > 
> > > > > > > I had to try hard to show this, doubt an actual user could trigger this.
> > > > > > > 
> > > > > > > I wrote a test which kicked 8 threads, each thread did a pthread join,
> > > > > > > and then tried to read the same page. This repeats in loop for like 512
> > > > > > > pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> > > > > > > for it to livelock. Without an exclusive lock I think on average I saw
> > > > > > > about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> > > > > > > thread won this race.
> > > > > > > 
> > > > > > >   From reading UVM, pretty sure if you tried hard enough you could trigger
> > > > > > > a livelock given it appears you take excluvise locks in migrate_to_ram.
> > > > > > Yes, I suspect you're correct here and that we just haven't tried hard
> > > > > > enough to trigger it.
> > > > > > 
> > > > > > > > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > > > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >    mm/memory.c         | 13 +++++++---
> > > > > > > > >    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> > > > > > > > >    2 files changed, 50 insertions(+), 23 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > > > index 3c01d68065be..bbd97d16a96a 100644
> > > > > > > > > --- a/mm/memory.c
> > > > > > > > > +++ b/mm/memory.c
> > > > > > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > > > > > > >    			 * Get a page reference while we know the page can't be
> > > > > > > > >    			 * freed.
> > > > > > > > >    			 */
> > > > > > > > > -			get_page(vmf->page);
> > > > > > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > > > -			put_page(vmf->page);
> > > > > > > > > +			if (trylock_page(vmf->page)) {
> > > > > > > > > +				get_page(vmf->page);
> > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> > > > > > > > rather than do this and then have to pass all this context
> > > > > > > > (ie. fault_page) down to the migrate_vma_* functions could we instead
> > > > > > > > just do what migrate_vma_collect_pmd() does here? Ie. we already have
> > > > > > > > the PTL and the page lock so there's no reason we couldn't just setup
> > > > > > > > the migration entry prior to calling migrate_to_ram().
> > > > > > > > 
> > > > > > > > Obviously calling migrate_vma_setup() would show the page as not
> > > > > > > > migrating, but drivers could easily just fill in the src_pfn info after
> > > > > > > > calling migrate_vma_setup().
> > > > > > > > 
> > > > > > > > This would eliminate the whole fault_page ugliness.
> > > > > > > > 
> > > > > > > This seems like it would work and agree it likely be cleaner. Let me
> > > > > > > play around with this and see what I come up with. Multi-tasking a bit
> > > > > > > so expect a bit of delay here.
> > > > > > > 
> > > > > > > Thanks for the input,
> > > > > > > Matt
> > > > > Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
> > > > > Christian and myself in the loop with future patches in this area.
> > > > > 
> > > > Will do. Already have another local patch set which helps drivers dma
> > > > map 2M pages for migrations if SRAM is physically contiguous. Seems
> > > > helpful for performance on Intel hardware. Probably post that soon for
> > > > early feedack.
> > > 
> > > OK.
> > > 
> > > 
> > > > 
> > > > Longer term I thinking 2M migration entries, 2M device pages, and being
> > > > able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
> > > > finding migrate_vma_* functions take up like 80-90% of the time in the
> > > > CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
> > > > ideal. Seems like 2M entries for everything would really help here. No
> > > > idea how feasible this is as the core MM stuff gets confusing fast. Any
> > > > input on this idea?
> > > 
> > > I agree with your observations. We found that the migrate_vma_* code was the
> > > bottle neck for migration performance as well, and not breaking 2M pages
> > > could reduce that overhead a lot. I don't have any specific ideas. I'm not
> > > familiar with the details of that code myself. Philip has looked at this
> > > (and some old NVidia patches from a few years ago) in the past but never had
> > > enough uninterrupted time to make it past prototyping.
> > > 
> > 
> > Cool good to know this isn't some crazy idea. Doubt it happen anytime
> > soon as I need to get a working baseline in before anything then start
> > applying optimizations and help in get other features to get the design
> > complete. But eventually will probably try to look at this. May ping
> > Philip and Nvidia when I have time to dig in here.
> 
> I think the big step will be moving hmm.c and migrate.c apis over from
> struct page to folios. That should also give us some nice benefits on the
> gpu side, since instead of 4k pages to track we could allocate 2m gpu
> pages.
> 

I think was thinking just encode the order in the migration PFN like HMM
does. Really only Nth order entry in the page array needs to be
populated then - HMM populates every entry though which doesn't seem
like that is required. Maybe having a folio API makes more sense?

> Once we have folios at the driver/core mm api level doing all the fancy
> thp stuff should be at least a well-contained problem. But I might be
> dellusionally optimistic here :-)

I think it contained in the sense is the DRM SVM layer just allocates a
THP or large continous device memory and hands it off to migrate layer
and that layer does the right thing. The 'right thing' here I believe is
a decent amount of core MM work though.

Matt

> -Sima
> 
> > 
> > Matt
> > 
> > > Regards,
> > >   Felix
> > > 
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > Regards,
> > > > >    Felix
> > > > > 
> > > > > 
> > > > > > > > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > > > +				put_page(vmf->page);
> > > > > > > > > +				unlock_page(vmf->page);
> > > > > > > > > +			} else {
> > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > > +			}
> > > > > > > > >    		} else if (is_hwpoison_entry(entry)) {
> > > > > > > > >    			ret = VM_FAULT_HWPOISON;
> > > > > > > > >    		} else if (is_pte_marker_entry(entry)) {
> > > > > > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > > > > > > > index 6d66dc1c6ffa..049893a5a179 100644
> > > > > > > > > --- a/mm/migrate_device.c
> > > > > > > > > +++ b/mm/migrate_device.c
> > > > > > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > >    				   struct mm_walk *walk)
> > > > > > > > >    {
> > > > > > > > >    	struct migrate_vma *migrate = walk->private;
> > > > > > > > > +	struct folio *fault_folio = migrate->fault_page ?
> > > > > > > > > +		page_folio(migrate->fault_page) : NULL;
> > > > > > > > >    	struct vm_area_struct *vma = walk->vma;
> > > > > > > > >    	struct mm_struct *mm = vma->vm_mm;
> > > > > > > > >    	unsigned long addr = start, unmapped = 0;
> > > > > > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > >    			folio_get(folio);
> > > > > > > > >    			spin_unlock(ptl);
> > > > > > > > > -			if (unlikely(!folio_trylock(folio)))
> > > > > > > > > +			if (unlikely(fault_folio != folio &&
> > > > > > > > > +				     !folio_trylock(folio)))
> > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > > > >    								walk);
> > > > > > > > >    			ret = split_folio(folio);
> > > > > > > > > -			folio_unlock(folio);
> > > > > > > > > +			if (fault_folio != folio)
> > > > > > > > > +				folio_unlock(folio);
> > > > > > > > >    			folio_put(folio);
> > > > > > > > >    			if (ret)
> > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > >    		 * optimisation to avoid walking the rmap later with
> > > > > > > > >    		 * try_to_migrate().
> > > > > > > > >    		 */
> > > > > > > > > -		if (folio_trylock(folio)) {
> > > > > > > > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > > > > > > > >    			bool anon_exclusive;
> > > > > > > > >    			pte_t swp_pte;
> > > > > > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > >    				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > > > > > > > >    					set_pte_at(mm, addr, ptep, pte);
> > > > > > > > > -					folio_unlock(folio);
> > > > > > > > > +					if (fault_folio != folio)
> > > > > > > > > +						folio_unlock(folio);
> > > > > > > > >    					folio_put(folio);
> > > > > > > > >    					mpfn = 0;
> > > > > > > > >    					goto next;
> > > > > > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > > > >    					  unsigned long npages,
> > > > > > > > >    					  struct page *fault_page)
> > > > > > > > >    {
> > > > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > > > >    	unsigned long i, restore = 0;
> > > > > > > > >    	bool allow_drain = true;
> > > > > > > > >    	unsigned long unmapped = 0;
> > > > > > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > > > >    		remove_migration_ptes(folio, folio, false);
> > > > > > > > >    		src_pfns[i] = 0;
> > > > > > > > > -		folio_unlock(folio);
> > > > > > > > > +		if (fault_folio != folio)
> > > > > > > > > +			folio_unlock(folio);
> > > > > > > > >    		folio_put(folio);
> > > > > > > > >    		restore--;
> > > > > > > > >    	}
> > > > > > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > > > > > > > >    		return -EINVAL;
> > > > > > > > >    	if (args->fault_page && !is_device_private_page(args->fault_page))
> > > > > > > > >    		return -EINVAL;
> > > > > > > > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > > > > > > > +		return -EINVAL;
> > > > > > > > >    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > > > > > > > >    	args->cpages = 0;
> > > > > > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > > > > > > > >    }
> > > > > > > > >    EXPORT_SYMBOL(migrate_vma_pages);
> > > > > > > > > -/*
> > > > > > > > > - * migrate_device_finalize() - complete page migration
> > > > > > > > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > > > - * @npages: number of pages in the range
> > > > > > > > > - *
> > > > > > > > > - * Completes migration of the page by removing special migration entries.
> > > > > > > > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > > > - * before calling this.
> > > > > > > > > - */
> > > > > > > > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > -			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > +				      unsigned long *dst_pfns,
> > > > > > > > > +				      unsigned long npages,
> > > > > > > > > +				      struct page *fault_page)
> > > > > > > > >    {
> > > > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > > > >    	unsigned long i;
> > > > > > > > >    	for (i = 0; i < npages; i++) {
> > > > > > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > >    		src = page_folio(page);
> > > > > > > > >    		dst = page_folio(newpage);
> > > > > > > > >    		remove_migration_ptes(src, dst, false);
> > > > > > > > > -		folio_unlock(src);
> > > > > > > > > +		if (fault_folio != src)
> > > > > > > > > +			folio_unlock(src);
> > > > > > > > >    		if (is_zone_device_page(page))
> > > > > > > > >    			put_page(page);
> > > > > > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > >    		}
> > > > > > > > >    	}
> > > > > > > > >    }
> > > > > > > > > +
> > > > > > > > > +/*
> > > > > > > > > + * migrate_device_finalize() - complete page migration
> > > > > > > > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > > > + * @npages: number of pages in the range
> > > > > > > > > + *
> > > > > > > > > + * Completes migration of the page by removing special migration entries.
> > > > > > > > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > > > + * before calling this.
> > > > > > > > > + */
> > > > > > > > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > +			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > > > +{
> > > > > > > > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > > > > > > > +}
> > > > > > > > >    EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > > > >    /**
> > > > > > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > > > >     */
> > > > > > > > >    void migrate_vma_finalize(struct migrate_vma *migrate)
> > > > > > > > >    {
> > > > > > > > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > > > > > > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > > > > > > > +				  migrate->fault_page);
> > > > > > > > >    }
> > > > > > > > >    EXPORT_SYMBOL(migrate_vma_finalize);
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
