Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F78AB37EB
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C817A10E3D1;
	Mon, 12 May 2025 12:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKP3F56b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F3389DA5;
 Mon, 12 May 2025 12:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054583; x=1778590583;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/ceYbm+VmcQ+yWYLFBFvqnLRiP5kZncqF3sq3QvsnU4=;
 b=LKP3F56bUF+FTzX60g0Gqc+tbwhx0/NFsjlf+OrXd9AZz7bfdzm5lWwJ
 DcwuMnxAV1LNHqXuQCTCTcrUjX/NIsmw2hI+7xuLvAlWIM0cL5zeMkmyN
 qeSOdQFesUzGrFSnNLAfI7CDwQ/OfutN+0OrbnqWoNxqmw1akLOVdAawk
 jhqzlJCvnDYJuSXJVfiLtYqcsHZKacnc7AC9GpnpGckGSI8sGHfgnCowx
 fpmIWsmTKKO5EKYWLgLqQHYYwuSiK8Pyv+D///IU2qoZCFswdo1vTFsGa
 zGyyDOxUGp0UvqLcbCUuWAFRWPcqlSVHjhj6E7uqTI32oT3fTBPSwUrA3 w==;
X-CSE-ConnectionGUID: t7+xxclxTfKCrRGRrEYJJw==
X-CSE-MsgGUID: 9VHHiZs0Qr2a+PdgAve4Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66258718"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66258718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:56:23 -0700
X-CSE-ConnectionGUID: zISDkdG7SauaXxm45xdeBQ==
X-CSE-MsgGUID: q6vAPHZGTp6Nl5d/Q2tH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="160625783"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:56:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 05:56:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 05:56:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 05:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghU23m1vH99Z7HG5Pi0drlWB0OYKNVK+DXWc9T42XhUcecsT+odCsFGnLa9X3cGqSn7WAcwUT8zIYsah2LD9uxoYejIbWA2ftBw+18H45Kk/H/TLgyiQvsDgeNKTYCyPi/MDndLy76DPDmTDfiGEeIMBn53GD+/buT4kDl/4nedRQWTQFQZIqg4GGvkiaeYI7X4inbp5IpZgVRVzwH0EYplWN/KOOglmDX2ABX8ImTfU8v/Y4UuIGDlYAQSi6Ip5ZW9W7jTnTd1as1RWd6D48mBzxOJ7gO5hoGx8qLJRNOgrUr3AU/+Pup18bzUdGR+n9Xg3dk6OjsAlEsDGK9kNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFon3rP1eJs7zcwcQtgtBp6dPu3oeyTrWXdZIQsJNBA=;
 b=Ee6Ko/QQ+IiRpty4HHgbDhDFoli+n/LhzthwsNlbKrawmMXsZJK5PgQU1R02icWe9kF1pTEUdgBrBH5unl0Gcl9j0aggNzaI0XSyMMUAwqiQsyfbtcxI4RpN99QOydbaIAtxZs9DiHwWBtF6MYLMzkud7lQLba5nSAuPeDVVcFi5OgJvjVCDmhOua1U08B5vGFgmV3dBC/TzFsJ3WgOjMIRNTds7b7jYt09O6GN7IgoxoTor0tqGqT6DFDyzNUW2fnpCxmQupUlxcVXKRpMBOCuINzCYJkEsYUUE9J+UFCZIEkqpRWdRcuLHnUlXc7C5EHn2ZEo/yo5oMACSPHwSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Mon, 12 May 2025 12:56:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 12:56:18 +0000
Date: Mon, 12 May 2025 05:57:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC v4 04/16] drm/sched: Avoid double re-lock on the job free
 path
Message-ID: <aCHwSFBWTAm1PPP0@lstrano-desk.jf.intel.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-5-tvrtko.ursulin@igalia.com>
 <657c053d7cd443ff310dfff19d03ab11e0f17289.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <657c053d7cd443ff310dfff19d03ab11e0f17289.camel@mailbox.org>
X-ClientProxiedBy: MW4PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:303:b6::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: de7cbe33-85c2-455a-12c5-08dd91546323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z1ttkrLWOpsJuHcPSErEGixI2wuPh6OkeBBbUTHwNeGGixv5KRy55ZoIrV?=
 =?iso-8859-1?Q?vjHeLBp9hx/TvSRHkih2xSYfdu24yGUoMnBHe2qMn70dO7sSNPqqfksGL7?=
 =?iso-8859-1?Q?7IZ+rFQgGkB2x39c6k1FpApUlNU47u9PmiKGjlqBsFM//nCc9w69A60XUA?=
 =?iso-8859-1?Q?LbypxqrOU2ABi/DFCc9zKyxEM7a2WPt9ryuQ36iYa8zr49ByZSkdaCcsOE?=
 =?iso-8859-1?Q?9+8ix6SxauITGCP3ZwVOAM6D8mINj6UTv5d0ZW/N8mYO8Vp+TiprX3cZE5?=
 =?iso-8859-1?Q?6FupvW/mt1SNJrqpiScH4RYPuAp9c/3Wnydm+shAV+KohryoEQmBnWwuoN?=
 =?iso-8859-1?Q?rK5OEThNwAn/XA/K/vIDk4Yk82llPiG6UFU2o9EMY+C2xXNyj9xCjy8vkX?=
 =?iso-8859-1?Q?Eto9P23RQy1A+N8aPdWGLt6+AVp3+UU4fzX03OICYmp8IggRwtnOqJYGOu?=
 =?iso-8859-1?Q?j+9jhzUCvOLlOxBGTKY7IxNFyuM1cd9ii6BEpgT8vKsjZLyZbk/F4DL/fh?=
 =?iso-8859-1?Q?r5mBsZeTgW53icWQZPczOALB6Ih9XxlRFNrnmbPR7EEOw69B0UE3y3lLhM?=
 =?iso-8859-1?Q?c6Og7GzJ2xH6h+7laVF0wvi31j9lUe9QPskmzjMcGWXlotFlstKieVMpB0?=
 =?iso-8859-1?Q?cw5mF8BYuYiaOCFB7NySthC6GXsfCvVf9vCGhRiqZmnM4yDmcuPlnGcfn0?=
 =?iso-8859-1?Q?ihgZaILP2dEFzycxKT7kAT9zF8e+RgFe4RG30XQPkduVfpvndNbiOwEXsH?=
 =?iso-8859-1?Q?CJYLoD1cHDA2hc1z/xv2CxL3QQ1sliSMotLOoB/r4lSzmA4lOwQ8yWdwxa?=
 =?iso-8859-1?Q?J8gFsvvAFO+zXK0HKhKeO8S/8Ee0Rirc9GHf2F2wJTdeDuCr2q6YqQiinO?=
 =?iso-8859-1?Q?YTKESJzHjL+YgwO5DV86oDYyUAT/3ZN5Cw5OWPTsWfSNHHnaz/9ri5Nzxm?=
 =?iso-8859-1?Q?VD+51D+sSyPUHNP4ieJs9Yiri2vNr+lFHA+oJOg3quB8GWrx/eY2dJp4Yz?=
 =?iso-8859-1?Q?0gdx6QLpCLLuGumLd1r3nCIcgmUru1xnKDIGFZhRsIF0IeXOrDWqe2zfMj?=
 =?iso-8859-1?Q?lNs7zfDEX1eTCgpHvfDBEviqe7tKr3PFBsZx0Qa+lh5CXroTVxXuvaiG09?=
 =?iso-8859-1?Q?QuyzwsX2wrkOlBd9CQfiQEh6ZKxmgwHuvuhBu4/W7AyVURbV8SI6zOKqS0?=
 =?iso-8859-1?Q?fw1B4TEHuA0EvnqK2N/1h81w58wNKgiAiNfbcSofo/BGw4vDf3VsGZxRey?=
 =?iso-8859-1?Q?KCbquVGJvN35r3ZoC2B2++Y4Jx+50NKnntLCP9KlTHvgFLYtiQCfmLJPw+?=
 =?iso-8859-1?Q?+VxbEVnJBJOflsrkAc2eFO58cpwAYlN4X8bhr+EmR9NRb04hb4uz/kMNrB?=
 =?iso-8859-1?Q?CVeot9kynP4kBcEajBHRStzDlHbpuPkuUiZUpAvFq/T4suWKfV6+/b0qYZ?=
 =?iso-8859-1?Q?NqTGdHmk/yjx0lOFhc5cSqmMENT2D6beMd80GTfxE0NESuRVHjVsIJPcPR?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jlmCK+VYT9s2Ogixz3nSsr9vUI1260jF2x7/lKDSk456ouSA+gh7xRekBs?=
 =?iso-8859-1?Q?LTcBU322/K2W4LU5OqRaF+rCaigKOGe/6lBVCsY625UAoTFIc2BZQFWp3/?=
 =?iso-8859-1?Q?fqq/5Gy7FlbZAZx3Ly1niNAiE0uf8fwFHHG3bAvm6/OSHutpfCTBNhkQul?=
 =?iso-8859-1?Q?hS37itSKm6aQs2xhsrYKxlGwbbOBSEUeyvzABC9EBUG8udb45dBqHQqcFX?=
 =?iso-8859-1?Q?tQwCyTQfIflNDrrW5MhEtPB1TAJPvh5NLJugCsFHAX3eCREnR9Ln4UOx05?=
 =?iso-8859-1?Q?ckyD9C9fha4kq/uYEZEJdJi9PVdhACBQXlG3Dlks4PW6GvKfTMiP7psfc4?=
 =?iso-8859-1?Q?RtAdFBdgY3mG98SX3jVBq0JFSUFmAAdn+eIGEp7L2hIESNimPlckoRtbZw?=
 =?iso-8859-1?Q?me29kSyBPegcD7hT99Kdyavk4kJ6D0AkqkkNC0N1g4Vo8jcdbdBHVwwT6z?=
 =?iso-8859-1?Q?6NNdWzQRK24nGQj1Zyeu7s9gBnE3cIMzGNpSLcGWTYUNWyxvyznicci0YP?=
 =?iso-8859-1?Q?Zicod4AxlpuxsY/LCa4NuMNryXMqbDfEyj2B5wBh+5nkdOjJvhlg3kfL3T?=
 =?iso-8859-1?Q?fURmNQvXHv40PvyrJ8E/GcoPf9YrAQcFRmw6wcNNkyRcIWtnZm1zVwr5tP?=
 =?iso-8859-1?Q?yeo8mSZ9h4I26O4SE98O7s/bfXddiA9eBqo32H7E+vmdraxRTTFK3Wle8y?=
 =?iso-8859-1?Q?oEWQ0g5nyG9mBcUpGYLWpYpP7Neavp6LXrXMuqgzy3wUNNSrplV17TbBY4?=
 =?iso-8859-1?Q?KVPIdUnye9OWhWTc1wtq/2FpRb4erDdl6t52ogSTnaSobtb440D7/Tadqd?=
 =?iso-8859-1?Q?vkZ6uXw4+zx3xpqCGHCKxDzocWj2UpG8fkT3pBNRAdTS4OkG+kBSkNBB/e?=
 =?iso-8859-1?Q?OBohNMgMhJw+NO35A/+YmAt47zuSfpv21nvXOd65u9+jr00LCCIAPOQ9cC?=
 =?iso-8859-1?Q?YhvKjPxmPdr6XTYl/BMMuQOFJWv94X/zrYquRmnbzLQVtPndvhtlooELVg?=
 =?iso-8859-1?Q?T5RvLHs1kPD1fqbsuAkqU3rGp93jAne24C860IDqFsj57VBVahOJjcVsg3?=
 =?iso-8859-1?Q?6vyuRlbzFVBssjKsiiKT/9cKfcZrZotEoRUyBlcJs085+Tc8PpIahSWbrr?=
 =?iso-8859-1?Q?FroxR8MlB3G/79i+sIf3QDCjlUQXMQS0GUsUyOFKCEsz4f/wLwuk6Alv2X?=
 =?iso-8859-1?Q?SnV2xe6PjGaSlC2W4o66lnOjET7JyG5Tm8I1bhK4j5bYLScymoILESx8//?=
 =?iso-8859-1?Q?bTryA9PAZK+RX3Dd6A6hJV7ho/8Q4gNTDhFSMhv/oG6R5g6mdl+DXEsNu2?=
 =?iso-8859-1?Q?44TA2himhC5o/dVysATqe7wCOM5aFUQFdc3or5kzGwQL1vdI+J4aYEgEN2?=
 =?iso-8859-1?Q?hdeu4QsL8az7mN35vKpGWziX4p52dI+UgVpuuiEs8srF0UB8X/Bs61m+tm?=
 =?iso-8859-1?Q?qvYkjRSnLU1G8p0kOwX+UHCePqGcNEOihRK9cADG4PogJZYAZ1eS5bNHO4?=
 =?iso-8859-1?Q?twCfZ0qq9eXdpeP5tlry466SSZFyCSOdUCFpVJu/rXC1z7Y/+ZcLD7lwAF?=
 =?iso-8859-1?Q?N7Sa1zpC4qFq91JXCp/bI73ZKf4KJDjx+MHCD8kxlQjC8LJ5/4nx7ET6ma?=
 =?iso-8859-1?Q?TSVuRTfG285o9dPU1q4ZhTyZoINwjRqmzcY/klShSLlfAra0TRHUTvHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de7cbe33-85c2-455a-12c5-08dd91546323
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:56:18.4715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V9R/hkWbddgOCWOTW6zKecrRs8Sg1a91lT99O6ut2I/pNceyoqh2xB6jgn1JvR+gC1AM55k936eyIPCzp2ZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On Mon, May 12, 2025 at 02:49:55PM +0200, Philipp Stanner wrote:
> On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
> > Currently the job free work item will lock sched->job_list_lock first
> > time
> > to see if there are any jobs, free a single job, and then lock again
> > to
> > decide whether to re-queue itself if there are more finished jobs.
> > 
> > Since drm_sched_get_finished_job() already looks at the second job in
> > the
> > queue we can simply add the signaled check and have it return the
> > presence
> > of more jobs to free to the caller. That way the work item does not
> > have
> > to lock the list again and repeat the signaled check.
> 
> Are you convinced that this is worth it?
> 
> I'm torn. It's rare that one returns a status through a boolean by
> reference.
> 

I'd say no to this (mirco optimization) and to freeing / running more
than job per worker invocation. The later was rejected in original work
queue conversion.

Matt

> 
> Independently from that, this is a candidate which certainly can be
> branched out from this series, to make the series completely about the
> new scheduling policy, not general other improvements.
> 
> 
> P.
> 
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <phasta@kernel.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++-------------
> > --
> >  1 file changed, 16 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 86e40157b09b..a45b02fd2af3 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -365,22 +365,6 @@ static void __drm_sched_run_free_queue(struct
> > drm_gpu_scheduler *sched)
> >  		queue_work(sched->submit_wq, &sched->work_free_job);
> >  }
> >  
> > -/**
> > - * drm_sched_run_free_queue - enqueue free-job work if ready
> > - * @sched: scheduler instance
> > - */
> > -static void drm_sched_run_free_queue(struct drm_gpu_scheduler
> > *sched)
> > -{
> > -	struct drm_sched_job *job;
> > -
> > -	spin_lock(&sched->job_list_lock);
> > -	job = list_first_entry_or_null(&sched->pending_list,
> > -				       struct drm_sched_job, list);
> > -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > -		__drm_sched_run_free_queue(sched);
> > -	spin_unlock(&sched->job_list_lock);
> > -}
> > -
> >  /**
> >   * drm_sched_job_done - complete a job
> >   * @s_job: pointer to the job which is done
> > @@ -1097,12 +1081,13 @@ drm_sched_select_entity(struct
> > drm_gpu_scheduler *sched)
> >   * drm_sched_get_finished_job - fetch the next finished job to be
> > destroyed
> >   *
> >   * @sched: scheduler instance
> > + * @have_more: are there more finished jobs on the list
> >   *
> >   * Returns the next finished job from the pending list (if there is
> > one)
> >   * ready for it to be destroyed.
> >   */
> >  static struct drm_sched_job *
> > -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
> > *have_more)
> >  {
> >  	struct drm_sched_job *job, *next;
> >  
> > @@ -1110,22 +1095,27 @@ drm_sched_get_finished_job(struct
> > drm_gpu_scheduler *sched)
> >  
> >  	job = list_first_entry_or_null(&sched->pending_list,
> >  				       struct drm_sched_job, list);
> > -
> >  	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> >  		/* remove job from pending_list */
> >  		list_del_init(&job->list);
> >  
> >  		/* cancel this job's TO timer */
> >  		cancel_delayed_work(&sched->work_tdr);
> > -		/* make the scheduled timestamp more accurate */
> > +
> > +		*have_more = false;
> >  		next = list_first_entry_or_null(&sched-
> > >pending_list,
> >  						typeof(*next),
> > list);
> > -
> >  		if (next) {
> > +			/* make the scheduled timestamp more
> > accurate */
> >  			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >  				     &next->s_fence-
> > >scheduled.flags))
> >  				next->s_fence->scheduled.timestamp =
> >  					dma_fence_timestamp(&job-
> > >s_fence->finished);
> > +
> > +			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > +				     &next->s_fence-
> > >finished.flags))
> > +				*have_more = true;
> > +
> >  			/* start TO timer for next job */
> >  			drm_sched_start_timeout(sched);
> >  		}
> > @@ -1184,12 +1174,15 @@ static void drm_sched_free_job_work(struct
> > work_struct *w)
> >  	struct drm_gpu_scheduler *sched =
> >  		container_of(w, struct drm_gpu_scheduler,
> > work_free_job);
> >  	struct drm_sched_job *job;
> > +	bool have_more;
> >  
> > -	job = drm_sched_get_finished_job(sched);
> > -	if (job)
> > +	job = drm_sched_get_finished_job(sched, &have_more);
> > +	if (job) {
> >  		sched->ops->free_job(job);
> > +		if (have_more)
> > +			__drm_sched_run_free_queue(sched);
> > +	}
> >  
> > -	drm_sched_run_free_queue(sched);
> >  	drm_sched_run_job_queue(sched);
> >  }
> >  
> 
