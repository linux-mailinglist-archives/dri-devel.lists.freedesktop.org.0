Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8527183CA07
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D6110E309;
	Thu, 25 Jan 2024 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B93810E309;
 Thu, 25 Jan 2024 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706203873; x=1737739873;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hIoTjNKqiow0frNvjlcd9ksQ19NXxL+uvneCWe94sVk=;
 b=lHw1LINxV72eH04q2Bc7zi+stg2nnbZDAc1sc/SF8X9GivS35iJL7aak
 3q9h0xU9o9wOPXY3yaM4NO+qj+HfuSrvW89JMehzA6nbd0HAB7RNWreJL
 uAlh1J11D93S+isI7oy3sQw23+vV8IahCxDRmbNvWtIeILKI/f4vOkq0U
 QPIUY8dwlMnwi2A8hP7cuGs++oupxItlUFX0bRgHAJgFdjMZAoqGIgLzR
 MJHLS6rBGmkUGppN90v4ulTRZIstLg5ZXg5LGfogvsmEOp1IJIvM3XPln
 eAMdprGk35ape00TXK1iEInS3BtDFINXvAwklCipwEsaQpU+WxfuuBM9i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8887717"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8887717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 09:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28835535"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 09:31:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:31:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 09:31:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 09:31:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3U01Oa5rk5m2yYkb2FKj6L7jv+ZeJqVoynjaedH2DTLyOQHOhbdJSj+5GDaMtl6ZQgxJ5F9rXEpzrWAa1oGBLqyiN4gGzDcY/scnk8XfzYQDihtLk4kcCgfqSjCOWG9vhC6jHpU/8g372jqzAGcO9OOYtnXKyPMQ70NtfhOUSMOm3YS8XNQ1xAULJFWtoBWHgPtHk99E2ALF0Ro2N2DpsJWlnEaASKm3odeVSWvZQOoFbDU90oofka3YaTwvqxkYWiXjZDgAvUY5r+UA6ToUq6P2HNIsqAocYYqSubaBzFN+QlFtnhBAUWDsqsVd5nLSHH7+F/UYXtqNO+wMKndVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cy4UBBpJJAwXHBT+M1dqUG0HzIwCQLAmF3dsbLMksE=;
 b=df/n7AOSahMLD0NlaY4CGxDBe9TDgf8DMk8aIWVlTy/56DrrKyTKbt3FL6IpG/LNOS9n+oAXe0zFDObg8Q3kC7WyX290naThtozmBZSkh2FfptouTsDstnehp4nibEuTdUJ+aYqoUATyiXHBPe8SyQPq4dINnAXYKt07Pgje1j8eajh3LyUw9Fz+b8JE3SVM02k0mFVRXct04PQO960lE69BRuF13Vie4VMUqJwi4GG6aXjjAXYO7m/GOkb5u992ac/qXM2KyezGOVuNgGoJb+yNy15nY8CXZu06raMGSmc7TAzTnWApywGQSuwNrmrA+jRrhW0QFlFBYmXY43GcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 17:31:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 17:31:05 +0000
Date: Thu, 25 Jan 2024 17:30:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Message-ID: <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdf962e-1636-4fed-9b2d-08dc1dcb68e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIQpNBUDMhotVZ4Rph4WISj+iKzMmeOJWWIVXF+vkixxrRt/BqXsyhPGbHSdeEQgMCNvrTi0MsJlnWGdI625PgOycA7yYWoHrm2dgr6l1ncr7VXPkjPD8OB/4JAG4Pyz5VgJN9S0AmFnWoNxCZIUDJw8Xq6GmvAf9CrEYaUmGgQ5tDUqjDYHq+1nLSqOv57pB18F29yBFoWflFmW/C2KVbpienHySiyOQoZ1eNzq/KDVfSct4qCwBE8mXF/dOTOLdhTJmPWBnFFwodvOatiSqs/Az/YaToZWkFkacQo4hyn5U+/GxXYv/rM5AD7NzMshQ5u/tPEtFnZrYRl9+0aZZGxw1kFEvpUPa6R8rX1S1k6tp5yYWh5AY6ly/8PGPUjWHan2NPjwERi8ihhxBumPsFStawGdfG+VughoaXrNJXtH+zjktZc1hXEDmca89lshU3zi32E49V/9ULaGk87hNZ/GUJQZ4W3KB74fQWPSIrGdTkjcWawrDP4BMcTAKwkhHPZUK/of19cNewxSg4jOZuac3cfJJYGB7E+TJ0OCaDT9QAY5sNrnrELOLSZYH9+ra4FxJohbW9EmSIkUHMGZXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6506007)(6512007)(4326008)(8936002)(8676002)(66574015)(83380400001)(26005)(66476007)(66556008)(66946007)(6916009)(6486002)(316002)(478600001)(966005)(54906003)(41300700001)(86362001)(6666004)(82960400001)(7416002)(5660300002)(38100700002)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JkpG5/N96QjWsB02VuI1tpscrF3GUG8e2LhTvbaPxhWu4exj256emVYzkX?=
 =?iso-8859-1?Q?JBcUeXGopY3hLaUEKOVR16uTmUeAfFnfuwnM6KFRSr0Fxq10JhlGz3moqs?=
 =?iso-8859-1?Q?kcj3jc4cVJK8DDjoX1YVA5WH5RXeKoGCTIdkEZ8v7miYEI+oK8LEyWCvfQ?=
 =?iso-8859-1?Q?UN16noASvx0BORGC+0Pv0aFcS7wp0VwkQJWp0iMvfw8p1FkDFhtqBQqsCB?=
 =?iso-8859-1?Q?HRqv8BugspxikSlt1kwr2c4TJuQvGa/+00ju8VWG6j/3SKiKv7NFGKrQJC?=
 =?iso-8859-1?Q?3BVtqXjTLnqakka5H7gTNB05b/bhtimsItmQa+4XzCTnS2bVkkxLFJ0EmC?=
 =?iso-8859-1?Q?rdvU78I3gyD7W49BkZIebp6v1H4jFisLcUlbFvmwXPAPm3t/pKSFjUD5FH?=
 =?iso-8859-1?Q?bHZEaIO34zSnGtoF2wwLzfT04/NqoZTxvpo11UwfLHblQjhG03O5w3K3GO?=
 =?iso-8859-1?Q?FYTslKHBFpBekrwf15SeDSN/DyH5ldNg5ngKVNA1/wODuxTk314oPwAwN6?=
 =?iso-8859-1?Q?7gvUwT3By7/M9Oyxh5LDNKHngEfOAitMYMEo6ADWIt5zUEK0/3SVfvj/p5?=
 =?iso-8859-1?Q?VmOvi1SXSF0L5/FpXQ023VGGBgtc2gUG65Ihq9TpnuVz86XXQNqWPbW1vS?=
 =?iso-8859-1?Q?VpuaCUhNvcemLayFFpKTpg+PMRqM5pb3d1+kD0+tVs3ktksfe3Le7y8xON?=
 =?iso-8859-1?Q?MhI4emvUmM0Zda1Tme3tpRseaze8ON+iWkxspLa4ekIGdkd6px0+lEwI7J?=
 =?iso-8859-1?Q?EtvkKRLjtjQJQ3V6F8aIAt46DeNAiT1OSdlNIfhI9ao/76Hrgxj91Tuf5z?=
 =?iso-8859-1?Q?KxeN1V5St+xmNKPQ37K858NvHgsIs6a13OkNCxwSbY4JXOLmS9T748puUU?=
 =?iso-8859-1?Q?W4xZ2Oepjt/gCWeob54819pGKBESpqrFg18Ycx7nI82GmkcbaIvDwdg3qI?=
 =?iso-8859-1?Q?0gURpv9TRaQ3UBxo4l6N1Qd2i/htpos9cehmzuROwXPauqDZKF26vcYd/D?=
 =?iso-8859-1?Q?OleEb9Gp/Foyf0kFKPaR+QdAradJXdEXyIRn8EKha4LR2+e18Ks+kJ2P/l?=
 =?iso-8859-1?Q?ctiO6eS1ykT2ywrRe48SXnQovDsyf/98eysTRnU6UM3tk54qH+Z6Zx8aIl?=
 =?iso-8859-1?Q?a6lmCRjttL+GYQLz4IBAD7aiI88y1V6v0/PUxlSQ/jOvsbNH/ZGecNR64z?=
 =?iso-8859-1?Q?DtJV6Te4IdZUfB+PEBYvbpjfqu/PQ2gMeEGNevExYhxr5VDUpmgs56f5eB?=
 =?iso-8859-1?Q?9PPbWqNLTvpNLjhpwfkSnGhiLfiffJbzeIYZRcM+8qpxUoF7kqYBeitrfi?=
 =?iso-8859-1?Q?GomsByR95JH9x17FpIdINlCggxyjqRJnN3VCEhhkUpe7BRXNume6lqYcgB?=
 =?iso-8859-1?Q?oxmzS3W512SujApCzM/ktJXOkPBA/P/NyWgQ7GWBjigpmieaDA/j0VtSJ6?=
 =?iso-8859-1?Q?m8bUNnQNNWKaZrK6RcQLIomD5LUyITvmxEpuqw1kUvIWLnqIXNMQwTPK8N?=
 =?iso-8859-1?Q?YzsVTZIq7Co7hRp3KG1qTD1ZVJHxgqfg6aYmKg5WbkX9m8ggz8hCC9zuDq?=
 =?iso-8859-1?Q?h5MMv0/YZyDn0uzoWjTJ3we8cip04hZdc/KWkozZyVX7r8dNEtgd899Su+?=
 =?iso-8859-1?Q?7RcY/j0eeN5W6Jdfq5s2pI6Y8+Ju6Z0fkGJg/I8xfyE8qOT3dg5PPgfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdf962e-1636-4fed-9b2d-08dc1dcb68e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 17:31:05.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mmhn7kHKkvYAPOWWWzN1150P1aORwyN2QoSLbhbW8rax+D5Ca65/Re6+9dK0QZubjoGqQ45zCtXqZxK05iO/GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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
Cc: ltuikov89@gmail.com, dri-devel@lists.freedesktop.org, Thorsten
 Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 intel-xe@lists.freedesktop.org, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian König wrote:
> 
> 
> Am 24.01.24 um 22:08 schrieb Matthew Brost:
> > All entities must be drained in the DRM scheduler run job worker to
> > avoid the following case. An entity found that is ready, no job found
> > ready on entity, and run job worker goes idle with other entities + jobs
> > ready. Draining all ready entities (i.e. loop over all ready entities)
> > in the run job worker ensures all job that are ready will be scheduled.
> 
> That doesn't make sense. drm_sched_select_entity() only returns entities
> which are "ready", e.g. have a job to run.
> 

That is what I thought too, hence my original design but it is not
exactly true. Let me explain.

drm_sched_select_entity() returns an entity with a non-empty spsc queue
(job in queue) and no *current* waiting dependecies [1]. Dependecies for
an entity can be added when drm_sched_entity_pop_job() is called [2][3]
returning a NULL job. Thus we can get into a scenario where 2 entities
A and B both have jobs and no current dependecies. A's job is waiting
B's job, entity A gets selected first, a dependecy gets installed in
drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.

The proper solution is to loop over all ready entities until one with a
job is found via drm_sched_entity_pop_job() and then requeue the run
job worker. Or loop over all entities until drm_sched_select_entity()
returns NULL and then let the run job worker go idle. This is what the
old threaded design did too [4]. Hope this clears everything up.

Matt

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L144
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L464
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_entity.c#L397
[4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler/sched_main.c#L1011

> If that's not the case any more then you have broken something else.
> 
> Regards,
> Christian.
> 
> > 
> > Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> > Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> > Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> > Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> > Reported-by: Vlastimil Babka <vbabka@suse.cz>
> > Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
> >   1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 550492a7a031..85f082396d42 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >   	struct drm_sched_entity *entity;
> >   	struct dma_fence *fence;
> >   	struct drm_sched_fence *s_fence;
> > -	struct drm_sched_job *sched_job;
> > +	struct drm_sched_job *sched_job = NULL;
> >   	int r;
> >   	if (READ_ONCE(sched->pause_submit))
> >   		return;
> > -	entity = drm_sched_select_entity(sched);
> > +	/* Find entity with a ready job */
> > +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> > +		sched_job = drm_sched_entity_pop_job(entity);
> > +		if (!sched_job)
> > +			complete_all(&entity->entity_idle);
> > +	}
> >   	if (!entity)
> > -		return;
> > -
> > -	sched_job = drm_sched_entity_pop_job(entity);
> > -	if (!sched_job) {
> > -		complete_all(&entity->entity_idle);
> >   		return;	/* No more work */
> > -	}
> >   	s_fence = sched_job->s_fence;
> 
