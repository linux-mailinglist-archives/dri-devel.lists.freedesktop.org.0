Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAA6F6429
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 06:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F52810E22B;
	Thu,  4 May 2023 04:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51B910E22B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683176091; x=1714712091;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iH4kAe+UZkCy9MBOetCYwp62asWU4bSH7Thl/za12KU=;
 b=ePmEJ68jjczW2IrW5F1r/AqMlcLFWnm/zuNlXSd4U02KR4RFBuOrfjiL
 zRqbjM9wHRXGLNz/osPj/deu3s9z0zhr2XeoaqVR4j7pa9NwYXgpLL598
 SlwQakMFEKXOGpRpKM2PBrPD7j54NTBJc/2eK9P8ludIFh3Mxeg0GTYsS
 RLrudroAyEnx2faKYnR9lzeR0KoDtwNUuoqF8jIFaTpKVvM22wUZHHS38
 ipi7E6BwtFMx66KPuEQNNA9MxOwQueJXPdBZEFLY0ivvCoC7zExuWPsM0
 bNEUg/6k7XSpVEs4NwkWbN2NgXBalr+NUs/yj+HSrfafmMk1CXdSgFc1v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="337978219"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="337978219"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808548653"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="808548653"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 21:54:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 21:54:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 21:54:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 21:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9J25MaC+qm62JxzPC01hWSTsNSJnJLo1wY56knAbQY65JSbqHgBUmA8xjYkNVhOVbu0zOYp8ubj5wvMrfjuFwqfrI0PFtpLDaeaj7YqeuOYFaZN07llfDb7iagYQ//YZF5TvCfaq07BnZECCfZ2pzGvy2mnK9EOh/AK1BRqzM6RY14cRtImgzEJpQoi/loHXC+PJRTiSALqLVF0tf0Vx1WfMex92XdxC5AGLCWuWZdkpsXTa6dxb4kAdwmcYF5iLXSE4nYaoza3+ECNrwSkSIQ/vL+d08gAJtl1ZvDhGt5iLkR5+ruk7HWTGoBDL26y+nxsN4o1/kiyCaO1NW/1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+TXf95KtW4FoOD41Ywwi39WqC9BtGc9RHM0SZptbXw=;
 b=dyubqvOw8me620ciGG1mM7yFKfS4imOeq4bBV24qK+BbyhFR9qo2Xp6abmCzWpr5gu0//rTR+d7xJFWEPo9kiU38srtZoZr11/CFelOuLAlCz2iWycYDWW+SENRRlNMQUeuwG87h8JZeZ8KXiWus5/voCxXj6lNB+Cc3o4j5GWzoG9mV+1nPhvM9X8WeovnBhBsHq7iMBOEb3iQ1WXxLuM/j6huJF8rP7XBE9siu1/iWi7apcEQo/dZ14rglAO5sXvZohsWUK1Vl1cKwd01y4URkPwHmGGQ+WjNZ8JUBPSfKT3+YE+B5w+c7VsKNlwTl5IkbDzar0fDILrmwqvMHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 04:54:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 04:54:47 +0000
Date: Thu, 4 May 2023 04:54:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <ZFM6hElmnFsBwyOi@DUT025-TGLU.fm.intel.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da27dca-c9f7-4a3a-03a2-08db4c5baf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/GPXdWv+cFIbiKaEBBB7EkrUyM3tVPnGSzM09VMUM8p1VZg7YJv6Sc5jXgWV+WhKm7ATs2Aeky+N2iDsVGbgoQDRhU5jpj+67iuFFDbi5aoMC4pNMGy7w24UF70s5pLnXK++ps9752lzXDNq3nZUCtlZHKDuucDHYu4dHvW8vuiec+BUusdhD7FtkofHsecdZKql2fK+kpXVHyRAesiA0lfCqBY2SHrxhbOxyxDhNb//rZzvOpAU3/SfOCHXUK43iMaY0KypuP/H1NX5jarT4NB9CZAKwQBVAPKuyQQE+OWKSBZigyiy+mYy4d/ArkVVshdfSvyDnJC7LbH6f30/uCMuJMfWOiFf2JVoJwPLsjQ9ihpZ9r8qef1Niaa0DddqclzE4hqkAq/9d7JPP3/vOdlN/CqKZwQuFlrLd5ck1VWKz6CeJE4Txyr4j2/5Ht39SOXLXO6A6HX8Zjgja05gYiZvaZQB0OcTXEqQVSIZeybBP0E2zufNVirh741RdTD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(6486002)(6666004)(966005)(66946007)(66556008)(6916009)(4326008)(478600001)(66476007)(316002)(54906003)(86362001)(66574015)(83380400001)(26005)(6506007)(6512007)(8936002)(8676002)(41300700001)(44832011)(2906002)(5660300002)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5OwPP0gK48sVa9/Z81SdWJhnBgyACPnLIjqRU7Wh1wEGg6TLN6yFHxhDyA?=
 =?iso-8859-1?Q?nwNi2e6qVdggtJ0IWXSyWT1Z4toLL7WUXLrEe/79SepjtIqo41CnI4NwgL?=
 =?iso-8859-1?Q?H1/4j270WrRjyL6f+rUmtKYkLLcJapfjrq4+JcARy9b0nd0Lek+bl9NmqE?=
 =?iso-8859-1?Q?oIWcgd5KQV8gI7444/hoqbN57ssQnZFyXjNf/GfniZt8XjJGGGw9ylkMXl?=
 =?iso-8859-1?Q?79TmBGVUe/vlMcPsvknt0E+2ybwSZ1cKKAIZ69y2CGc34NgSeFQfNJp+Jw?=
 =?iso-8859-1?Q?GeX/KBBdOYu1tI2kTb7xOfMzjej7LvgSQGWgG2BWtB7WVr8TCIrhzx9TNn?=
 =?iso-8859-1?Q?RScBByfP8yIKU8azTpDkKVSFTZiPTmLwSdzfeyeBAUc9N06JVrxoJK6GJe?=
 =?iso-8859-1?Q?UdbswlTN8iF8oEZu+hB47O+nX9l9d0GS7GN+B7V2v6cFB1DQWJ40lwgi2+?=
 =?iso-8859-1?Q?j0o8tSJHxT9wVsVUnfU4P2RwgJ+TvYy6M5J60LtcqoQCJ2dgL3YRLdfW1p?=
 =?iso-8859-1?Q?OZSZcUnAh2OjPiPUFDR3c8TLGLZKyENvdc69LXljopW9GstzFQ+VKYJ/04?=
 =?iso-8859-1?Q?jcVORLzI1UEtr/7k1y8AHFfWBp2e24BK7b7vOweWIKaBN6zYqLU0HWwBbz?=
 =?iso-8859-1?Q?ZtItAq3JdXVM+vdqw7tcocrOAvbW1erV7OQcutEyAcv/9QDHxMBOQhZuwJ?=
 =?iso-8859-1?Q?61Bk129YfG2IcJew9Gy1qXdP6kENtCFUkoGnA0c/LWe0vmOeRHr8TokY1a?=
 =?iso-8859-1?Q?6Ta58slrK2MYOZBwK/1LuxZ4PXJltdoKo7ry+gaP4cimuT5sRHGL0Yllx4?=
 =?iso-8859-1?Q?O/PtUdvUIDKwSpRDaC2ZA6LWPN4h4BqWAR4gx0M84Z69OqrCRhh5Xo+Fjg?=
 =?iso-8859-1?Q?HN1ljPWW3MJhGGV/V3tZZP489iA7+RAQii2B+h8wQlQYZAYxnOidM2UNPT?=
 =?iso-8859-1?Q?bRX9BhfWYb3zFCSIN51PgnQeEkG7RhuJrr1VrBUEw9OGWixDUN7mD7J7XS?=
 =?iso-8859-1?Q?M5h1iHenxyylnnmgeQ7FLq7A8OAATo3IiexZYqFouGTVs/ER7kCeZVLj2f?=
 =?iso-8859-1?Q?fJjNmt3eXM6cZodQnVMPd9WcxjDNgj0Pox48jPtu7s4557qUAPKA6R9Qhz?=
 =?iso-8859-1?Q?n3RhVDiayI0kLvyEIkZAHXFvHiMIVGZ1z4uFteJOSZ52vBt0iqstVswggq?=
 =?iso-8859-1?Q?vnwgAVcyqpqbZSW+6wuKoBSzFx0MHxRJTQ3x8D7UJzy53CpDMn2NKeiN77?=
 =?iso-8859-1?Q?p4tLrf2enshvSNkHQZQv1SgNM1Bcz0Bgpx64cNySAMJEfjPbzjY+NCrFnh?=
 =?iso-8859-1?Q?WkQ2PB0XfHdN03g9Ft1KPTmm3MHOd1Y9ctxQwGJYNorvZZvoW0vFkMaw5S?=
 =?iso-8859-1?Q?WYUnH2KKoYfPfaXmZVX+Gh7s3QK7MDGSXA8qGhCqdYd9w7jtz+fBRLwnP4?=
 =?iso-8859-1?Q?xaGaF3ajdVUKhH8m0cR4r9g8yR9EuOhXv25Bjb+7ImhaWKvZLFtRoZi4Sr?=
 =?iso-8859-1?Q?6hDTZL8cp9CD9gjOztqDBEaVWcPzKnzWxpsr0/7RdUGHWiZ7uaFkltB4dX?=
 =?iso-8859-1?Q?RtrU4XH4h3+xU1tiQtOZLGvk6MWezT2Y1cB1bzRs+OGPdTb0i9ib8/hBJw?=
 =?iso-8859-1?Q?+JE8AGebPunbRwzwL1kQdi9oc1bRbyt/nc+62spmgkqkkwcu4xrbPp9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da27dca-c9f7-4a3a-03a2-08db4c5baf6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:54:47.3435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvNco3UzePCPTuJlcCt95FQQcYxjplBRzw93XA6GhyErXUU6wzkDzDD9VAMx22kQsXT4phLpG8JFVgJV9F91+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Sarah
 Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 10:47:43AM +0200, Christian König wrote:
> Adding Luben as well.
> 
> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> > [SNIP]
> > > To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
> > After the discussion I had with Matthew yesterday on IRC, I
> > realized there was no clear agreement on this. Matthew uses those 3
> > helpers in the Xe driver right now, and given he intends to use a
> > multi-threaded wq for its 1:1 schedulers run queue, there's no way he
> > can get away without calling drm_sched_{start,stop}().
> > drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
> > wondering if it wouldn't be preferable to add a ::resubmit_job() method
> > or extend the ::run_job() one to support the resubmit semantics, which,
> > AFAIU, is just about enforcing the job done fence (the one returned by
> > ::run_job()) doesn't transition from a signaled to an unsignaled state.
> > 
> > But probably more important than providing a generic helper, we should
> > document the resubmit semantics (AKA, what should and/or shouldn't be
> > done with pending jobs when a recovery happens). Because forbidding
> > people to use a generic helper function doesn't give any guarantee that
> > they'll do the right thing when coding their own logic, unless we give
> > clues about what's considered right/wrong, and the current state of the
> > doc is pretty unclear in this regard.
> 
> I should probably talk about the history of the re-submit feature a bit
> more.
> 
> Basically AMD came up with re-submission as a cheap way of increasing the
> reliability of GPU resets. Problem is that it turned into an absolutely
> nightmare. We tried for the last 5 years or so to get that stable and it's
> still crashing.
> 
> The first and most major problem is that the kernel doesn't even has the
> information if re-submitting jobs is possible or not. For example a job
> which has already been pushed to the hw could have grabbed a binary
> semaphore and re-submitting it will just wait forever for the semaphore to
> be released.
> 
> The second problem is that the dma_fence semantics don't allow to ever
> transit the state of a fence from signaled back to unsignaled. This means
> that you can't re-use the hw fence and need to allocate a new one, but since
> memory allocation is forbidden inside a reset handler as well (YES we need
> to better document that part) you actually need to keep a bunch of hw fences
> pre-allocated around to make this work. Amdgpu choose to illegally re-use
> the hw fence instead which only works with quite extreme hacks.
> 
> The third problem is that the lifetime of the job object was actually
> defined very well before we tried to use re-submission. Basically it's just
> an intermediate state used between the IOCTL and pushing things to the hw,
> introducing this re-submit feature completely messed that up and cause quite
> a number of use after free errors in the past which are again only solved by
> quite some hacks.
> 
> What we should do in the GPU scheduler instead is the follow:
> 
> 1. Don't support re-submission at all!
>     Instead we can provide help to drivers to query which fences (scheduler
> or hw) are still not signaled yet.
>     This can then be used to re-create hw state if (and only if!) the driver
> knows what it's doing and can actually guarantee that this will work.
>     E.g. the case for XE where the kernel driver knows the contexts which
> were not running at the time and can re-create their queues.
> 
> 2. We can provide both a wq to use for single threaded application as well
> as start/stop semantics.
>     It's just that the start/stop semantics should never touch what was
> already submitted, but rather just make sure that we don't get any new
> submissions.
> 

I pretty much agree with everything Christian has said here and Xe
aligns with this. Let me explain what Xe does.

1. Entity hang (TDR timeout of job on a entity, firmware notifies Xe that a
entity hung, entity IOMMU CAT error, etc...):
	- No re-submission at all
	- ban the entity
	- notify the UMD
	- cleanup all pending jobs / fences
2. Entire GPU hang (worth mentioning with good HW + KMD this *should*
never happen):
	- stop all schedulers (same as a entity in Xe because 1 to 1)
	- cleanup odd entity state related to communication with the
	  firmware
	- check if an entity has a job that started but not finished, if
	  so ban it (same mechanism as above)
	- resubmit all jobs from good entities
	- start all schedulers (same as a entity in Xe because 1 to 1)

The implementation for this in the following file [1]. Search for the
drm scheduler functions and you should be able to find implementation
easily.

If you want to use an ordered work queue to avoid the stop / start dance
great do that, in Xe the stop / start dance works. I have extensively
tested this and the flow is rock solid and please trust me when I say
this as I worked on reset flows in the i915 and fought bugs for years, I
still don't think it is in the i915 because we try to do resubmission +
crazy races. Because of that I was incredibly paranoid when I
implemented this + tested it extensively.

I'll post an updated version of my DRM scheduler series [2] on the list
soon for the WQ changes, plus whatever else is required for Xe.

So my take from this discussion is maybe with a little documentation, we
are good. Thoughts?

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c
[2] https://patchwork.freedesktop.org/series/116055/

> Regards,
> Christian.
> 
> > 
> > Regards,
> > 
> > Boris
> 
