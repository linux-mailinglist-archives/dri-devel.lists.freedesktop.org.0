Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F57702BB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C5810E718;
	Fri,  4 Aug 2023 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C2310E718;
 Fri,  4 Aug 2023 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691158458; x=1722694458;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9x7mb9kt9Odf7V+CUNJYa9jLmeS4cysigwX1yhRJXPA=;
 b=JmsCbrRCHWSpwpo8ZTgVp2fHtDU0PVvhiwEuDqQkm64YNxTE1fJNhnzg
 zlEZJHkujcA7MRjS/eI03DU1IBrGQp5ITWJuclUfXo2KAGtP7/kPVMeG1
 xCfnC+7WO6E+IYJFPd0Svd/jp1ERLpEwM1m+Rw0NiMPQ3a+7jJ8i8cfD6
 2PFV/IlUXg8ackBy3XqGfuDaQdYQ39K2Mut/LuJujOoNba/IddFgr49pf
 /HKfsQC29TeLDI+gOhgYHC5YhwK8tUn/mikTwntEMDi+346EZgtTxErkF
 7kfsOPsIs73iTZcg+cAkyqTk/zmn4xJjegHLTnEepzONwT2cC14r/n7fP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456541866"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="456541866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 07:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="679979981"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="679979981"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 07:14:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 07:14:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 07:14:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 07:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljipX87IOOvxhIcC+HBvUBFspWZEz7YJ/jdrMLEId4A6HMpOWZfaasjPSUXUCBQ4jmUxLvvIp1A66JKng///kS9jycau915rYnNyK8b672tj/VJ6DiSPrZaJwjYA/71s6Gc3DVtPgBFBCHttnRk3+hwoGlRHQXNC77blMMBwCHkeym9jAQv/Sx5gCXX0/S91J99CrePdP3Ihci6EJOef1Fc4Z6VY9ARDmEuogG8OPg+B87G+pOsiZzEVKizGw9fyaKxZwXZyNPmSfxoE1mF9zzQG/plNCFpHhMWt0F66hjgEvlvU7HXvYE+N9t7EPedVvUTwst+m+86Z31zdZA8mqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yp/att2VV8eqZkj+hRpuBFCB10128jBb8pMb4Yt0EI=;
 b=X6LdOJiL/VBtqynsDSPxgzdMd6RewX/rUJ8RbDF2GOPhN7YOi6ll/5s8oMICKyj3qd1vXdV0XrtLHra0CbU8UZ4AiPWDuRLNnWumWf0h+SxUv4A9Dt4wQzuQADX1VkbI8gdwOFxkEQggvGq53bvQlkIF9cnLTBo/ahz3db2K9LjJK3Dhx++awEKyw94ixmr34mMbRP4ZYUIitHDmHwfedGzlV/oI3aQwN+GlqYYkGDJr3+OOAhra4DgaO02b7vjLbkd1wY2S6tXQ2DSlqZdfUnOg+Lqu0JYml7rL2rKOdtAH3HlJJlfR5LinsatrMc37/JpDbxQ2aLFgavpgWwf5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 14:14:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 14:14:11 +0000
Date: Fri, 4 Aug 2023 14:13:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Message-ID: <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
 <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: b75045d5-894a-42d1-abe6-08db94f51339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IW/9uG2lVTL6AUTTmcLj+RmHj+g8Jwbss0jMoE//uB89GyiUU0PVEMmTV++jBBp7f93caK7nELR9QzM7yXQIZEbzImwdQLAzQdy4/Wh86Y/nMv9kx4CYNsMU2ANAWG8dSLhAPgPhoiHHVT0tdywi4zYYDTYKfI88bqGklx+umlhUqYYzBYeUbTJEql1g8fOm8aqJ7lRMMzFfDbbq6gpvG4BvPR4T0ImLX/T5AlVMrIEwIVtnertSxQC6PVQAzafSZseiYPjmFRf1WNRQbvdBSQYa7FmYSewtQR/vjnarRhpOEbCc7aWF5GUVFh9QtW933OyWZV9kioLQiaZIdWMc2El5WIilKrnwtYP9KzITmLlgk4EO8g6jhB9wXqo2NF9nb167kkWZdHCt6UyTJAePF8n4C2Gko1JzxEiQkizj/XJ52FBS4Io1BPDmPIlc0YXTgkwLT7+4Qg6WPRf7eCgIGahV6XDKDNXpr9C9xmJt2X4D/88K2SxomDhkQABzOJy1BvvmIiSGSGLkt1SGNIdRu/wg+M2+eUkwmAMgWYpaQNRftxHqB+tZM8uawf5CpqhlX0EUHrhc3rL0p1VXEuvBDWDXNFmNcVmTx33hIn+f7S0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(1800799003)(186006)(86362001)(478600001)(82960400001)(38100700002)(6512007)(83380400001)(66574015)(6506007)(26005)(6486002)(8676002)(8936002)(15650500001)(41300700001)(966005)(6916009)(4326008)(66476007)(30864003)(44832011)(316002)(7416002)(5660300002)(66556008)(66946007)(2906002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nhno5MJjqA3bJLkti4gimPorr1yaCwN6MQ2tt+rPig7I3+bZo4IMxMfPg6?=
 =?iso-8859-1?Q?nVHUDsS2aFLKhAzToh81Ka6zS0wN3XD5wS3cDvT6nRY2GwWmn41gSEEN+8?=
 =?iso-8859-1?Q?Vvm373qo/NkBe0ARDOSytTekBHvgEprlha3UUSi8vTHDPhB2v4YJVSM4lY?=
 =?iso-8859-1?Q?Ufh9brdvkr/2sAPOKALxfDsegwAPGJPFGTztQnfLitzbhLMKf2jnuM8/nR?=
 =?iso-8859-1?Q?3acLH2mMG07cXZEmJZmpQ6MZk6FmdyW2O2lwQWhX5VX7bTXjo45b3fXv8V?=
 =?iso-8859-1?Q?5D+KKfYPGMortszWcKwFLL0MsrtOcUk2GiqaIIUp0OLEb05Z5i8zavs+px?=
 =?iso-8859-1?Q?C5TfubRlPM8alX1cu2eYCCBg3diaZf/Wu4trHQJsNE4tZQpeit725GJ+jM?=
 =?iso-8859-1?Q?0nTUlshH9S0znem3XwL8V/rQmDbphusoxaex2XBCwQSdfPJyQjKhI1JVpz?=
 =?iso-8859-1?Q?V7298KWQbYjBTpQa4ys3u9jNPlLINhFL1Za+PpZn1L5PbC/aak4CGAlugo?=
 =?iso-8859-1?Q?XdO47XrWjJIbbPxvUDrxwlchYgQd8orGShdeTuHlZ9bj1xM6QAbtJeZJM5?=
 =?iso-8859-1?Q?Yl5DQZjJNOfTBZ0w5nbo0CvHRvnUZIoedejBQzy2VbfwDuULHFhvFJAerp?=
 =?iso-8859-1?Q?66Qq6Lo1mEf0c6BKPn7hIle3EIkSTsgRGFn6WL2DftihylkGvd1+VBkTDH?=
 =?iso-8859-1?Q?6v9K26hL6h5XyoS3HXVDuOfi23tSeqsCuwmXK8UMfZficpO4yPDLAtzD1X?=
 =?iso-8859-1?Q?4BQWYOEa/HllGWE3xgPYphSqxQcllIildu777gi5Cs5zIIIcWNvH6rRHEQ?=
 =?iso-8859-1?Q?rzueMt7HJRBAwHME/4Uorkiki+YAPdj9FvxPwQbQo/HYTU6TN0tW8ZcWGv?=
 =?iso-8859-1?Q?CMi7BijSl1OGxraQhCOz3m+opprUIpWAgeMuZtNkQsHTeJGsgDUvJejybH?=
 =?iso-8859-1?Q?W7UX9n+h9ckZydCXOQhY0y8caZv3W9o0TF5Z1fc/ADc7QXNJkJJOuzFs8d?=
 =?iso-8859-1?Q?n9J1zpeJM9rLW1E8kBW6OFUK/uVauKFz2cmfrT+viyykCYmH81mqGrc8Ak?=
 =?iso-8859-1?Q?SOiPGGR0S2jbRUUSEiMdsJ4XJtDjRIWkvdu7QLJPqzrItrnCox7hEPM+dU?=
 =?iso-8859-1?Q?aWz/cVrbXDgTvM65kLUGE3WATsTNdudKZQ5f2Ae/R+4uiapLTrQrEHmiNw?=
 =?iso-8859-1?Q?nCYVhfTGR1YYbJlfAyCBb093vTiB9MeJGb/CUlNFpNz76qlbWoIOI7WRyz?=
 =?iso-8859-1?Q?RlMCu4Il1dgg5tVitqheeX5+n3UskDbVV2zjH07dOT8nQvSCOPxMgsO28r?=
 =?iso-8859-1?Q?JHu74kKR9VvKY/+gj2eTwSolw7Se/DJucFtXQWwj6ZZl4LhMScTdChblTj?=
 =?iso-8859-1?Q?aochZuAQeMyzcuQs1iY7Ci6ncwcR+HoXuP/As1rsNF9MgXJhYZ10A2ncIU?=
 =?iso-8859-1?Q?f3lyLHDu4WSqRenAe+viZF0hB5Z4ShlYHk6Bb2bdIISxDi9L6bqERNx5qo?=
 =?iso-8859-1?Q?G4xDBncjXkIr6jne4twpMbRsycB9brSISppuee2suvbTIFTXavjn0Fbl5P?=
 =?iso-8859-1?Q?ZKZ7umlYkj/eh5CnUdb+0ilzNzngpvPvEnmj+d1zpp1ehm7tUhtYduRCET?=
 =?iso-8859-1?Q?EtMhCQIYqH6WedrUu0n/LvBMgWcvU357pOYGB3PRhnP1l/AdwMdBOXWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b75045d5-894a-42d1-abe6-08db94f51339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 14:14:11.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWc335s217QK0DgWvIFMMyXWq708w4VKbJV6tmvY2IGinAv2P0oLqy7EA6DXgt66/HclpodZaEt/KlX4PYGDQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 10:50:36AM +0200, Daniel Vetter wrote:
> On Thu, Aug 03, 2023 at 11:35:30AM +0200, Christian König wrote:
> > Am 03.08.23 um 10:58 schrieb Daniel Vetter:
> > > On Thu, 3 Aug 2023 at 10:53, Christian König <christian.koenig@amd.com> wrote:
> > > > Am 01.08.23 um 22:50 schrieb Matthew Brost:
> > > > > Add generic schedule message interface which sends messages to backend
> > > > > from the drm_gpu_scheduler main submission thread. The idea is some of
> > > > > these messages modify some state in drm_sched_entity which is also
> > > > > modified during submission. By scheduling these messages and submission
> > > > > in the same thread their is not race changing states in
> > > > > drm_sched_entity.
> > > > > 
> > > > > This interface will be used in XE, new Intel GPU driver, to cleanup,
> > > > > suspend, resume, and change scheduling properties of a drm_sched_entity.
> > > > > 
> > > > > The interface is designed to be generic and extendable with only the
> > > > > backend understanding the messages.

Christian / Daniel - I've read both of you comments and having a hard
time parsing them. I do not really understand the issue with this patch
or exactly what is being suggested instead. Let's try to work through
this.

> > > > I'm still extremely frowned on this.
> > > > 
> > > > If you need this functionality then let the drivers decide which
> > > > runqueue the scheduler should use.

What do you mean by runqueue here? Do you mean 'struct
workqueue_struct'? The scheduler in this context is 'struct
drm_gpu_scheduler', right?

Yes, we have added this functionality iin the first patch.

> > > > 
> > > > When you then create a single threaded runqueue you can just submit work
> > > > to it and serialize this with the scheduler work.
> > > > 

We don't want to use a single threaded workqueue_struct in Xe, we want
to use a system_wq as run_job() can be executed in parallel across
multiple entites (or drm_gpu_scheduler as in Xe we have 1 to 1
relationship between entity and scheduler). What we want is on per
entity / scheduler granularity to be able to communicate into the
backend a message synchronously (run_job / free_job not executing,
scheduler execution not paused for a reset).

If I'm underatanding what you suggesting in Xe we'd create an ordered
workqueue_struct per drm_gpu_scheduler and the queue messages on the
ordered workqueue_struct? This seems pretty messy to me as now we have
open coded a solution bypassing the scheduler, every drm_gpu_scheduler
creates its own workqueue_struct, and we'd also have to open code the
pausing of these messages for resets too.

IMO this is pretty clean solution that follows the pattern of cleanup
jobs already in place.

> > > > This way we wouldn't duplicate this core kernel function inside the
> > > > scheduler.
> > > Yeah that's essentially the design we picked for the tdr workers,
> > > where some drivers have requirements that all tdr work must be done on
> > > the same thread (because of cross-engine coordination issues). But
> > > that would require that we rework the scheduler as a pile of
> > > self-submitting work items, and I'm not sure that actually fits all
> > > that well into the core workqueue interfaces either.

This is the ordering between TDRs firing between different
drm_gpu_scheduler and larger external resets (GT in Xe) an ordered
workqueue_struct makes sense for this. Here we are talking about
ordering jobs and messages within a single drm_gpu_scheduler. Using the
main execution thread to do ordering makes sense in my opinion.

> > 
> > There were already patches floating around which did exactly that.
> > 
> > Last time I checked those were actually looking pretty good.
> > 

Link to patches for reference.

> > Additional to message passing advantage the real big issue with the
> > scheduler and 1 to 1 mapping is that we create a kernel thread for each
> > instance, which results in tons on overhead.

First patch in the series switches from kthread to work queue, that is
still a good idea.

> > 
> > Just using a work item which is submitted to a work queue completely avoids
> > that.
> 
> Hm I should have read the entire series first, since that does the
> conversion still. Apologies for the confusion, and yeah we should be able
> to just submit other work to the same wq with the first patch? And so
> hand-rolling this infra here isn't needed at all?
>

I wouldn't call this hand rolling, rather it following patten already in
place.

Matt

> Or what am I missing?
> 
> > Regards,
> > Christian.
> > 
> > > 
> > > Worst case I think this isn't a dead-end and can be refactored to
> > > internally use the workqueue services, with the new functions here
> > > just being dumb wrappers until everyone is converted over. So it
> > > doesn't look like an expensive mistake, if it turns out to be a
> > > mistake.
> > > -Daniel
> > > 
> > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
> > > > >    include/drm/gpu_scheduler.h            | 29 +++++++++++++-
> > > > >    2 files changed, 78 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 2597fb298733..84821a124ca2 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > >    }
> > > > >    EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > 
> > > > > +/**
> > > > > + * drm_sched_add_msg - add scheduler message
> > > > > + *
> > > > > + * @sched: scheduler instance
> > > > > + * @msg: message to be added
> > > > > + *
> > > > > + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> > > > > + * Messages processing will stop if schedule run wq is stopped and resume when
> > > > > + * run wq is started.
> > > > > + */
> > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > +                    struct drm_sched_msg *msg)
> > > > > +{
> > > > > +     spin_lock(&sched->job_list_lock);
> > > > > +     list_add_tail(&msg->link, &sched->msgs);
> > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > +
> > > > > +     drm_sched_run_wq_queue(sched);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_sched_add_msg);
> > > > > +
> > > > > +/**
> > > > > + * drm_sched_get_msg - get scheduler message
> > > > > + *
> > > > > + * @sched: scheduler instance
> > > > > + *
> > > > > + * Returns NULL or message
> > > > > + */
> > > > > +static struct drm_sched_msg *
> > > > > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > > > > +{
> > > > > +     struct drm_sched_msg *msg;
> > > > > +
> > > > > +     spin_lock(&sched->job_list_lock);
> > > > > +     msg = list_first_entry_or_null(&sched->msgs,
> > > > > +                                    struct drm_sched_msg, link);
> > > > > +     if (msg)
> > > > > +             list_del(&msg->link);
> > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > +
> > > > > +     return msg;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * drm_sched_main - main scheduler thread
> > > > >     *
> > > > > @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > >                container_of(w, struct drm_gpu_scheduler, work_run);
> > > > >        struct drm_sched_entity *entity;
> > > > >        struct drm_sched_job *cleanup_job;
> > > > > +     struct drm_sched_msg *msg;
> > > > >        int r;
> > > > > 
> > > > >        if (READ_ONCE(sched->pause_run_wq))
> > > > > @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
> > > > > 
> > > > >        cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > >        entity = drm_sched_select_entity(sched);
> > > > > +     msg = drm_sched_get_msg(sched);
> > > > > 
> > > > > -     if (!entity && !cleanup_job)
> > > > > +     if (!entity && !cleanup_job && !msg)
> > > > >                return; /* No more work */
> > > > > 
> > > > >        if (cleanup_job)
> > > > >                sched->ops->free_job(cleanup_job);
> > > > > +     if (msg)
> > > > > +             sched->ops->process_msg(msg);
> > > > > 
> > > > >        if (entity) {
> > > > >                struct dma_fence *fence;
> > > > > @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > >                sched_job = drm_sched_entity_pop_job(entity);
> > > > >                if (!sched_job) {
> > > > >                        complete_all(&entity->entity_idle);
> > > > > -                     if (!cleanup_job)
> > > > > +                     if (!cleanup_job && !msg)
> > > > >                                return; /* No more work */
> > > > >                        goto again;
> > > > >                }
> > > > > @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > 
> > > > >        init_waitqueue_head(&sched->job_scheduled);
> > > > >        INIT_LIST_HEAD(&sched->pending_list);
> > > > > +     INIT_LIST_HEAD(&sched->msgs);
> > > > >        spin_lock_init(&sched->job_list_lock);
> > > > >        atomic_set(&sched->hw_rq_count, 0);
> > > > >        INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > index df1993dd44ae..267bd060d178 100644
> > > > > --- a/include/drm/gpu_scheduler.h
> > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
> > > > >        DRM_GPU_SCHED_STAT_ENODEV,
> > > > >    };
> > > > > 
> > > > > +/**
> > > > > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> > > > > + * message
> > > > > + *
> > > > > + * Generic enough for backend defined messages, backend can expand if needed.
> > > > > + */
> > > > > +struct drm_sched_msg {
> > > > > +     /** @link: list link into the gpu scheduler list of messages */
> > > > > +     struct list_head                link;
> > > > > +     /**
> > > > > +      * @private_data: opaque pointer to message private data (backend defined)
> > > > > +      */
> > > > > +     void                            *private_data;
> > > > > +     /** @opcode: opcode of message (backend defined) */
> > > > > +     unsigned int                    opcode;
> > > > > +};
> > > > > +
> > > > >    /**
> > > > >     * struct drm_sched_backend_ops - Define the backend operations
> > > > >     *  called by the scheduler
> > > > > @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
> > > > >             * and it's time to clean it up.
> > > > >         */
> > > > >        void (*free_job)(struct drm_sched_job *sched_job);
> > > > > +
> > > > > +     /**
> > > > > +      * @process_msg: Process a message. Allowed to block, it is this
> > > > > +      * function's responsibility to free message if dynamically allocated.
> > > > > +      */
> > > > > +     void (*process_msg)(struct drm_sched_msg *msg);
> > > > >    };
> > > > > 
> > > > >    /**
> > > > > @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
> > > > >     * @timeout: the time after which a job is removed from the scheduler.
> > > > >     * @name: name of the ring for which this scheduler is being used.
> > > > >     * @sched_rq: priority wise array of run queues.
> > > > > + * @msgs: list of messages to be processed in @work_run
> > > > >     * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> > > > >     *                 waits on this wait queue until all the scheduled jobs are
> > > > >     *                 finished.
> > > > > @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
> > > > >     * @job_id_count: used to assign unique id to the each job.
> > > > >     * @run_wq: workqueue used to queue @work_run
> > > > >     * @timeout_wq: workqueue used to queue @work_tdr
> > > > > - * @work_run: schedules jobs and cleans up entities
> > > > > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> > > > >     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > >     *            timeout interval is over.
> > > > >     * @pending_list: the list of jobs which are currently in the job queue.
> > > > > @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
> > > > >        long                            timeout;
> > > > >        const char                      *name;
> > > > >        struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > > > > +     struct list_head                msgs;
> > > > >        wait_queue_head_t               job_scheduled;
> > > > >        atomic_t                        hw_rq_count;
> > > > >        atomic64_t                      job_id_count;
> > > > > @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > > > 
> > > > >    void drm_sched_job_cleanup(struct drm_sched_job *job);
> > > > >    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > +                    struct drm_sched_msg *msg);
> > > > >    void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> > > > >    void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
