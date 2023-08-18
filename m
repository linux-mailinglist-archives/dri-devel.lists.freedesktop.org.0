Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586C780C59
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D18B10E509;
	Fri, 18 Aug 2023 13:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB09B10E04E;
 Fri, 18 Aug 2023 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692364494; x=1723900494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z9BPhQH7VsZlyb/zpKWAFakABZCGACVF599mhwITqZg=;
 b=Ko7DBU44R1iQr+zENyI12ejk0bgIfuE6M96fZCvqq+JYL78P3C9qgEED
 2sz+s7mfigEJOltE9MMpn0L3rzW9j1sPg++6E9kk2PsIneNzTfm3bdUxY
 vC2naK1eUae1Bu80O7GPYMQb4FQ3YJuNaqd6WlLjbrdfZAKGs/x7Ef183
 ChlbAbQIkdEE7wLlQbvK2e7tO8oSAul9Iwd2WQKGB/KQ5v0QORZ91FBjq
 OvtHYD+OVIa0j8bJvgkQLX04kZwlh2GOzkBxPXPCT/CtrsoNWpBCP5Mvm
 1xVdYrPU6xwEcLyO+1P2Fc1ooamiEflYqNeOeKpg0Yj6f9XbLz8gdUqDB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353401174"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353401174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 06:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="684889729"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="684889729"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2023 06:14:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 06:14:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 06:14:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 06:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmH0ny04qVJf+hHB7mC6K/EAIfEihPZyP10W5/JNQYeTLJgyphr3a8vxWs7/mYwrFcFvoEmHMlS15ys12ZrvCr3ni+XxuTxeiwhmWWQWNiz5HDgzIle0NS+dx4cQJy6JD3aAapKGbMP9EpSkBbFIUjP6os0II6BRWnNmFtoTFN29ZScMlJtyq82FVG2NrnMpg3c3JjwJUbz5XueqiZa5QAYGZxNk1XJAWJ/fNL3fT75QIM1dmKXjHkFjxLmDmluaqc9bitdXzbG7UBljEGAVOihef787vS7qaA1AkqF+EPFYLad3o3rymSBwKlacO2o6RT4p6WKQ6JUTJK+OzINSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlEtdLLX4lTrWJH8tF+/ht8OXifQ4epdZju+ESzyK5s=;
 b=HrtDKeuE9FzX6Wm5BZNV3TezOGvrMWfmisKC4llJMRqW3fJrT5WU2KZr2TPGazuIJXAlAw83+XPTAMAtghD6tCc+XiH+DQg+py0D8pWfI/F+6hJUienSlwdSkII/pTEOALE05VZG17E7t2X/puYRfQqJYUVDYTJUnzu0Fv6Y+flUzVIhR8TQouW7wTdivSd6ulBpPap3NrlrIZYOi5kqGBj6OnEdVAKHBn3KCTVzD5oXiYt9IJXIjT/4GMncSeYHCBAZfZNJcYMBYa/lh4rX96LCs38MUm4hQol2+/00DYoNTOAtFOmTZrc6LgGoX64sAn0s/LOk/kOgdzVwEYrF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:14:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 13:14:32 +0000
Date: Fri, 18 Aug 2023 13:13:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
X-ClientProxiedBy: BYAPR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a30cb7b-072b-4db7-34f2-08db9fed0fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2UVePxY19NaxliT6kD98GeyPI2hpoI4nxbtWoCT1iXzNO/Xk1h1QLCqwiyP1cJFm23YQivOb9WvaJ2nfLL0iSOncZSYmPKSoWNTwCXVhC/R1dhIeCpIC3W8+P7G1x5XTTaV4LF5Ntln2+2b7bnAtJgKiVXit+gfkS4HR0aCcmigf0HxXGqugGv3648wR9OfcLHjJ1RZ/HYILptx3RMZpsD/mlxJjZmEM//Kge/oY/6bjzmiidyK/PLEcKpNvQ6DKjUJNzmJUxJJXzgITNLEA1VHK3j4iuT2UHtwnaOOsOslj5zDNiSbzT4gQYkIhvmiuKg/7nmQwwvhZXNmgOH4l6TG4/ZgSrqysfu5P+KZP//5O3mY4HSfnVXy9L8UeKAKQ6SaBfGot4fXRuFZ084L058DzGaaPj3yGXmweGXYGmFFVdNqP4uzhGHo9JbRciBFAepksA7Tr4Y0FvChvt6AYQuojln0Yo+8oK1lI5+jNJoIXw+VccA+/JUy72UKqzTiunPr+Q2rvwp0VnvymCbaNoV2Uw2u7vk8698dWnoBQkdJsnaaGr1leBQM+MrkfIUh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(186009)(451199024)(1800799009)(86362001)(83380400001)(4326008)(8676002)(44832011)(5660300002)(8936002)(2906002)(41300700001)(26005)(6486002)(6506007)(30864003)(66574015)(6512007)(478600001)(7416002)(316002)(66946007)(6916009)(82960400001)(66476007)(66556008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SKcKr2P6MfLjZP66Wwdbb3v6TuPk4xnZXyGvsoC9jDpboFy44jiPz4kEZw?=
 =?iso-8859-1?Q?+qCct+Mh3sHO9lPz2rfiCwJvoC5vQbf+Cgz5XvW7cEh5y/WttYr6o0CpRa?=
 =?iso-8859-1?Q?SYnlAKnelgTvHpLkrJ8eRnriNPdKSQCMFS0IF7jn1Hu2oYgjHyyj7I6jOe?=
 =?iso-8859-1?Q?hZfeBLJ9NGgpGqXBAvhTbIy/qO0wsuFNw/8r5zfUPx9xVSY/8SJhT/ehBh?=
 =?iso-8859-1?Q?fNlaG9p0gkPaAzS12A2r66Oxboo5Aolpxsta+KLXvwQJUCOnjwDNywRpyW?=
 =?iso-8859-1?Q?RHT6EVrOD3QpCq3N3HUuyhXM+yHU6wQtZpKMuJudbROttCv8uwoINIbLqk?=
 =?iso-8859-1?Q?SbFj+mziTq6vNnRiN1eocOvhek3/NdZHngH8aGq1jbXsbH8Vo3amcq3G5l?=
 =?iso-8859-1?Q?42BFHrOV4EOR9ugh0YpuBUMfk5cbV6sgV8OVjeBOSVpn9TMRb3lZs5Gur9?=
 =?iso-8859-1?Q?h/Ck4+ZMtXgjWV9Vz8g/dy5t1AmEJrEWNlul8tqD9W3VZQ2R/plrzscAvT?=
 =?iso-8859-1?Q?dlvXBsvwLAL5gsHxkoChPQonyeKqdhLRu4LopVeMFaHB0wqV3UCdMVfZQ0?=
 =?iso-8859-1?Q?JJl3CYNo5mDqWdSjUHxbIcKE/0DMakV2kvtFdFoRiuxII5PmO1KTsneYag?=
 =?iso-8859-1?Q?iAyNgnI0hjV0H228X532u5ri10lDHoWATYDGbM0CAIcsC+VXZz6nc8ZeOA?=
 =?iso-8859-1?Q?N1E31yV3/qmGO1JmYk+q/8OMEo5QhqQWq/fWr7ZEj/yr5rG+8g6ducBnMY?=
 =?iso-8859-1?Q?+2KeJRf4tM5tcJp6qjl4DQgXW6bLQxIunTL51PQAnUMwwDgHxgOLN0+0pX?=
 =?iso-8859-1?Q?f9irlMq7by+ZOkvomeRFQc5rERyHs2wPqwrS/fZ6QNbaq7UN3KIe9AAfLB?=
 =?iso-8859-1?Q?qiUACw7YP8vtly4F9Wjk3bM43Irh02GJtiYp/HYnQistqrqJsT3Hk7GGUm?=
 =?iso-8859-1?Q?q3pgbXtCHv60IMwPOcx72rRDA7b7/oNvWmmZx48jFAcLrugaH0BB/OjHTn?=
 =?iso-8859-1?Q?Q+kJeFDHPGflW2KcbHvySrdo7JtL8LysSqjuRgM1NJ1Ia8kRrZZDoRYxVJ?=
 =?iso-8859-1?Q?8HEbmc+5uY+sg5wA+nlPNb+BL/sL41QXDreJ/vagT1GyG0poADpbjxKw8u?=
 =?iso-8859-1?Q?7bWEdysZ5hf/B8foKim3BMlyRrl9+ms7IBzqVjDXHLKibI5Xps4DuJogPt?=
 =?iso-8859-1?Q?3BtHpxsN6pRjXLm4g8yfCAWPZfw1hO4kvXctfY0aIMHu1lMV9vpPyOhtMA?=
 =?iso-8859-1?Q?wKpOLiTqkvn6bNlqe4On/Sr+dmB3LtFMy9vVBfYJB50RRABrbKyXF7K8vw?=
 =?iso-8859-1?Q?8TEv2O8LM4qAh6NwgKNbwnhoflqm7wcwwBK5p92vWfBfr+vUQGhgeQRpjf?=
 =?iso-8859-1?Q?8W4ugSpr816XgUfmJRT54QVFweC15fJ0m9VsGepkFGBH4F38au5tE60wKO?=
 =?iso-8859-1?Q?MQEhWClOI0tA+Ig2+zhIfu8Cvphak7KlzUGSwZWVP+Qa1QIDu53s6Czl5q?=
 =?iso-8859-1?Q?qDX9ytg3Sjq8KRa2za0ohTUOTcLk6Audzj6WmLYkwXq7M7zcGnfd5vfeBq?=
 =?iso-8859-1?Q?y2n8IGcvmYG+D/g2CsvhkrYuHwFqKTWFWQdiUeEqVMW19KfM/eESzVK88G?=
 =?iso-8859-1?Q?uxp8T5sHNbkUA52Fn2yV86mWajhcoiFPx6eFhR3jMjmeN9Sq0KG2ALuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a30cb7b-072b-4db7-34f2-08db9fed0fb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:14:32.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvpjWNrukAori55waCFCEPhHEB/4Qf3ynnxpW32/Rrp8w8vywrYIW4jVhPHlEQCiGLjkio9AxdQ+eyr9sY2rjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 07:27:33AM +0200, Christian König wrote:
> Am 17.08.23 um 19:54 schrieb Matthew Brost:
> > On Thu, Aug 17, 2023 at 03:39:40PM +0200, Christian König wrote:
> > > Am 11.08.23 um 04:31 schrieb Matthew Brost:
> > > > Rather than call free_job and run_job in same work item have a dedicated
> > > > work item for each. This aligns with the design and intended use of work
> > > > queues.
> > > I would rather say we should get completely rid of the free_job callback.
> > > 
> > Would we still have work item? e.g. Would we still want to call
> > drm_sched_get_cleanup_job which removes the job from the pending list
> > and adjusts the TDR? Trying to figure out out what this looks like. We
> > probably can't do all of this from an IRQ context.
> > 
> > > Essentially the job is just the container which carries the information
> > > which are necessary before you push it to the hw. The real representation of
> > > the submission is actually the scheduler fence.
> > > 
> > Most of the free_jobs call plus drm_sched_job_cleanup + a put on job. In
> > Xe this cannot be called from an IRQ context either.
> > 
> > I'm just confused what exactly you are suggesting here.
> 
> To summarize on one sentence: Instead of the job we keep the scheduler and
> hardware fences around after pushing the job to the hw.
> 
> The free_job callback would then be replaced by dropping the reference on
> the scheduler and hw fence.
> 
> Would that work for you?
> 

I don't think so for a few reasons.

The job and hw fence are different structures (also different allocs too)
for a reason. The job referenced until it is complete (hw fence is
signaled) and the free_job is called. This reference is needed for the
TDR to work properly and also some reset flows too. Also in Xe some of
things done in free_job cannot be from an IRQ context, hence calling
this from the scheduler worker is rather helpful.

The HW fence can live for longer as it can be installed in dma-resv
slots, syncobjs, etc... If the job and hw fence are combined now we
holding on the memory for the longer and perhaps at the mercy of the
user. We also run the risk of the final put being done from an IRQ
context which again wont work in Xe as it is currently coded. Lastly 2
jobs from the same scheduler could do the final put in parallel, so
rather than having free_job serialized by the worker now multiple jobs
are freeing themselves at the same time. This might not be an issue but
adds another level of raceyness that needs to be accounted for. None of
this sounds desirable to me.

FWIW what you suggesting sounds like how the i915 did things
(i915_request and hw fence in 1 memory alloc) and that turned out to be
a huge mess. As rule of thumb I generally do the opposite of whatever
the i915 did.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> > > All the lifetime issues we had came from ignoring this fact and I think we
> > > should push for fixing this design up again.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > > >    include/drm/gpu_scheduler.h            |   8 +-
> > > >    2 files changed, 106 insertions(+), 39 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index cede47afc800..b67469eac179 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > >     * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > > >     *
> > > >     * @rq: scheduler run queue to check.
> > > > + * @dequeue: dequeue selected entity
> > > >     *
> > > >     * Try to find a ready entity, returns NULL if none found.
> > > >     */
> > > >    static struct drm_sched_entity *
> > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > > >    {
> > > >    	struct drm_sched_entity *entity;
> > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >    	if (entity) {
> > > >    		list_for_each_entry_continue(entity, &rq->entities, list) {
> > > >    			if (drm_sched_entity_is_ready(entity)) {
> > > > -				rq->current_entity = entity;
> > > > -				reinit_completion(&entity->entity_idle);
> > > > +				if (dequeue) {
> > > > +					rq->current_entity = entity;
> > > > +					reinit_completion(&entity->entity_idle);
> > > > +				}
> > > >    				spin_unlock(&rq->lock);
> > > >    				return entity;
> > > >    			}
> > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >    	list_for_each_entry(entity, &rq->entities, list) {
> > > >    		if (drm_sched_entity_is_ready(entity)) {
> > > > -			rq->current_entity = entity;
> > > > -			reinit_completion(&entity->entity_idle);
> > > > +			if (dequeue) {
> > > > +				rq->current_entity = entity;
> > > > +				reinit_completion(&entity->entity_idle);
> > > > +			}
> > > >    			spin_unlock(&rq->lock);
> > > >    			return entity;
> > > >    		}
> > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >     * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > > >     *
> > > >     * @rq: scheduler run queue to check.
> > > > + * @dequeue: dequeue selected entity
> > > >     *
> > > >     * Find oldest waiting ready entity, returns NULL if none found.
> > > >     */
> > > >    static struct drm_sched_entity *
> > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > > >    {
> > > >    	struct rb_node *rb;
> > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > >    		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > >    		if (drm_sched_entity_is_ready(entity)) {
> > > > -			rq->current_entity = entity;
> > > > -			reinit_completion(&entity->entity_idle);
> > > > +			if (dequeue) {
> > > > +				rq->current_entity = entity;
> > > > +				reinit_completion(&entity->entity_idle);
> > > > +			}
> > > >    			break;
> > > >    		}
> > > >    	}
> > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > >    }
> > > >    /**
> > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > + * drm_sched_run_job_queue - queue job submission
> > > >     * @sched: scheduler instance
> > > >     */
> > > > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > > > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	if (!READ_ONCE(sched->pause_submit))
> > > > -		queue_work(sched->submit_wq, &sched->work_submit);
> > > > +		queue_work(sched->submit_wq, &sched->work_run_job);
> > > > +}
> > > > +
> > > > +static struct drm_sched_entity *
> > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > > > +
> > > > +/**
> > > > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > > > + * @sched: scheduler instance
> > > > + */
> > > > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	if (drm_sched_select_entity(sched, false))
> > > > +		drm_sched_run_job_queue(sched);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_sched_free_job_queue - queue free job
> > > > + *
> > > > + * @sched: scheduler instance to queue free job
> > > > + */
> > > > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	if (!READ_ONCE(sched->pause_submit))
> > > > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > > > + *
> > > > + * @sched: scheduler instance to queue free job
> > > > + */
> > > > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	struct drm_sched_job *job;
> > > > +
> > > > +	spin_lock(&sched->job_list_lock);
> > > > +	job = list_first_entry_or_null(&sched->pending_list,
> > > > +				       struct drm_sched_job, list);
> > > > +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > > +		drm_sched_free_job_queue(sched);
> > > > +	spin_unlock(&sched->job_list_lock);
> > > >    }
> > > >    /**
> > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > > >    	dma_fence_get(&s_fence->finished);
> > > >    	drm_sched_fence_finished(s_fence, result);
> > > >    	dma_fence_put(&s_fence->finished);
> > > > -	drm_sched_submit_queue(sched);
> > > > +	drm_sched_free_job_queue(sched);
> > > >    }
> > > >    /**
> > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > > >    void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	if (drm_sched_can_queue(sched))
> > > > -		drm_sched_submit_queue(sched);
> > > > +		drm_sched_run_job_queue(sched);
> > > >    }
> > > >    /**
> > > >     * drm_sched_select_entity - Select next entity to process
> > > >     *
> > > >     * @sched: scheduler instance
> > > > + * @dequeue: dequeue selected entity
> > > >     *
> > > >     * Returns the entity to process or NULL if none are found.
> > > >     */
> > > >    static struct drm_sched_entity *
> > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > > >    {
> > > >    	struct drm_sched_entity *entity;
> > > >    	int i;
> > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > >    	/* Kernel run queue has higher priority than normal run queue*/
> > > >    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > >    		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > > > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > > > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > > > +							dequeue) :
> > > > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > > > +						      dequeue);
> > > >    		if (entity)
> > > >    			break;
> > > >    	}
> > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > >    EXPORT_SYMBOL(drm_sched_pick_best);
> > > >    /**
> > > > - * drm_sched_main - main scheduler thread
> > > > + * drm_sched_free_job_work - worker to call free_job
> > > >     *
> > > > - * @param: scheduler instance
> > > > + * @w: free job work
> > > >     */
> > > > -static void drm_sched_main(struct work_struct *w)
> > > > +static void drm_sched_free_job_work(struct work_struct *w)
> > > >    {
> > > >    	struct drm_gpu_scheduler *sched =
> > > > -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > > > -	struct drm_sched_entity *entity;
> > > > +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> > > >    	struct drm_sched_job *cleanup_job;
> > > > -	int r;
> > > >    	if (READ_ONCE(sched->pause_submit))
> > > >    		return;
> > > >    	cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > -	entity = drm_sched_select_entity(sched);
> > > > +	if (cleanup_job) {
> > > > +		sched->ops->free_job(cleanup_job);
> > > > +
> > > > +		drm_sched_free_job_queue_if_ready(sched);
> > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > > +	}
> > > > +}
> > > > -	if (!entity && !cleanup_job)
> > > > -		return;	/* No more work */
> > > > +/**
> > > > + * drm_sched_run_job_work - worker to call run_job
> > > > + *
> > > > + * @w: run job work
> > > > + */
> > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > +{
> > > > +	struct drm_gpu_scheduler *sched =
> > > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > +	struct drm_sched_entity *entity;
> > > > +	int r;
> > > > -	if (cleanup_job)
> > > > -		sched->ops->free_job(cleanup_job);
> > > > +	if (READ_ONCE(sched->pause_submit))
> > > > +		return;
> > > > +	entity = drm_sched_select_entity(sched, true);
> > > >    	if (entity) {
> > > >    		struct dma_fence *fence;
> > > >    		struct drm_sched_fence *s_fence;
> > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> > > >    		sched_job = drm_sched_entity_pop_job(entity);
> > > >    		if (!sched_job) {
> > > >    			complete_all(&entity->entity_idle);
> > > > -			if (!cleanup_job)
> > > > -				return;	/* No more work */
> > > > -			goto again;
> > > > +			return;	/* No more work */
> > > >    		}
> > > >    		s_fence = sched_job->s_fence;
> > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> > > >    		}
> > > >    		wake_up(&sched->job_scheduled);
> > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > >    	}
> > > > -
> > > > -again:
> > > > -	drm_sched_submit_queue(sched);
> > > >    }
> > > >    /**
> > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > >    	spin_lock_init(&sched->job_list_lock);
> > > >    	atomic_set(&sched->hw_rq_count, 0);
> > > >    	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > >    	atomic_set(&sched->_score, 0);
> > > >    	atomic64_set(&sched->job_id_count, 0);
> > > >    	sched->pause_submit = false;
> > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> > > >    void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	WRITE_ONCE(sched->pause_submit, true);
> > > > -	cancel_work_sync(&sched->work_submit);
> > > > +	cancel_work_sync(&sched->work_run_job);
> > > > +	cancel_work_sync(&sched->work_free_job);
> > > >    }
> > > >    EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> > > >    void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	WRITE_ONCE(sched->pause_submit, false);
> > > > -	queue_work(sched->submit_wq, &sched->work_submit);
> > > > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > > > +	queue_work(sched->submit_wq, &sched->work_free_job);
> > > >    }
> > > >    EXPORT_SYMBOL(drm_sched_submit_start);
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > index 04eec2d7635f..fbc083a92757 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > >     *                 finished.
> > > >     * @hw_rq_count: the number of jobs currently in the hardware queue.
> > > >     * @job_id_count: used to assign unique id to the each job.
> > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > >     * @timeout_wq: workqueue used to queue @work_tdr
> > > > - * @work_submit: schedules jobs and cleans up entities
> > > > + * @work_run_job: schedules jobs
> > > > + * @work_free_job: cleans up jobs
> > > >     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > >     *            timeout interval is over.
> > > >     * @pending_list: the list of jobs which are currently in the job queue.
> > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > >    	atomic64_t			job_id_count;
> > > >    	struct workqueue_struct		*submit_wq;
> > > >    	struct workqueue_struct		*timeout_wq;
> > > > -	struct work_struct		work_submit;
> > > > +	struct work_struct		work_run_job;
> > > > +	struct work_struct		work_free_job;
> > > >    	struct delayed_work		work_tdr;
> > > >    	struct list_head		pending_list;
> > > >    	spinlock_t			job_list_lock;
> 
