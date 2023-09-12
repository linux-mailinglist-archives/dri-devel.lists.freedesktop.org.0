Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD279D401
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC7410E422;
	Tue, 12 Sep 2023 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB95410E41E;
 Tue, 12 Sep 2023 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694530136; x=1726066136;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wi3IfPYFiMQnBWfAhkAunyt2pp8XcBaNlHcwXW76ABw=;
 b=EOX31I2iqG8W/9vK8lp9X5JvWGXhLpNMXLWZ7svuI3m54pbc7R1r11VZ
 RhqeAkzIM+qyhkX9UAMcigW04KCSAcH9WcOrp+MvPPxUHWQPpwjVq+C6s
 myd3kQ+2LESmsU5wAmr7XG/nad+IgOroft5lXPlo7y4AFFoQkcGxbaxQY
 jeJDnvORkm4higC2tXkocuTkAgzX41T3NDurs0vuqjYrFrvXQWelOMstP
 ekPnoewdBn9PFUCj8cVEEKw68NUyvABRn8I/K7sDWmOa27comeVxjJPio
 piMWSJ14qOxEdTEIWmDysOtiSwhf0oRophKksyjoGHeDAPPLZmlcvLZlh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377311147"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="377311147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867412811"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="867412811"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:48:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:48:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:48:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbRPPUItKQYYFDOSud/2QuwALtU+JeDxKDBrKXfoJOlQl/sH83hgb9uxuo5zG6ey4ycNF8RcY0dNePgu0lV8xRJPmWVyVvBI69tGNcS9r8DznpE7xJ4hYQ1O82jXRfm8HHGJKWtJHs+DvuDsu8rNW+iu22gl30eafZPbIiVB+RAsCiV8mQz03QPASomYAH8uptNp+4QxImfZvn4q9YhTAl/X+hYXkjUMHOzoVJBujnj19XLEpNISogeH06bW11sboBLTANdztSrCJa5vjKdROquW6FGVuoAIr6VZL4YdiYtAB9N66bIWbsq8rKXazo9AXSU7WuFaNFd1+gj4qCMnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXyw6wyV8GF2NkesGMgsuWc5ml9w/zTT9AlrXjX9ePM=;
 b=Wc4pcTIW65tL+EGFRyHGp6mhs10dHn/3rPvCPGKrdrm1tn/RbNnyNJdIX7te3qfcAbqlMTIkAKrGaTPMW51gIfQZhYO5vSW7dlX0qdmCQigpKsy4GHEj2VywA/vo8I6TTDqEFsvGT/rAxtwPY1K5oYpyESFdX1ReZKlO6ythMnMTfTuWhnfzHspP9/wYFnnK9h2UfSplKljTz6CFf05Qgnczp9uH/cH4OOeHVZyGHQYD+qCxsFEkpFuDcA7StGTL0yn/BDoNRTQKa5tw2DRRCSrg1Og30LJ8cyynOMZSibPXyh1Ob3zIZSQDGdl/oJ+SyBHvWjqWLHZUuO+PUUD2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 14:48:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 14:48:53 +0000
Date: Tue, 12 Sep 2023 14:47:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
Message-ID: <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: a80e1563-6f59-4bb1-e483-08dbb39f6248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLGOs7KLy7CmqcPgWLyOjmQuokfYmnxVtVlyjQy/MjNgM3DJ72Bn857B6mFG7QnX2EwovfF/akDRU2vpPI+NmdHvBiYfJL+lKpcwiSu04cYQp1jAOYtWNBf/zdnzlgoZ9/qdR3tI1YWmi2P/js13FjZ9zqLN/c9VLfT/xJUnJrNTbMPEC++n+Hpu5PjO12BoATMJXMo+GE+Z4pHKczn/rvXz/llkD4OkjY5Aeiaba4h1ujjEGZruqLI2VYoJKOnetIpgHb+ydYlsu4A8Eg0SlXg+u8I4IRJl4h2LmZlq+/4GMsAXhJetPJfhQDEt0QKVRyP4N33gqGbQyQYtjT8Um0v4Kb6ZAl+5YUP8IgwcKlUIQw8aKP7Xh7kBjNPm3sCGHayacxAyZfM7mFh4YnrhYxNZkO+rKktns/R9jppfzaFjaUUcVjHM+lA4JJgkNtOAlsafO4ycwny58ZUudfZbKpHhQqMmmpC1H7YwsUBX4grT7p4RzgSRFA9E7nVAypk+XWzMh0fRGh9xNhA4P/ufMsboLxRzRx6UkuzgMqfAgz1dXQlzcd1RIvMjA25QuloH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(8936002)(4326008)(8676002)(26005)(316002)(66476007)(2906002)(66556008)(6916009)(44832011)(66946007)(478600001)(7416002)(41300700001)(5660300002)(6666004)(6506007)(6486002)(6512007)(66574015)(83380400001)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tRpHLMGoGcePWPkSdrekXMkFdl1cz0ALdh25g1HWYQAedcofNBYcvNknqS?=
 =?iso-8859-1?Q?UihlW2FFngsw6aTjxB4XPlcaODnXYMhDUTjjzaWZXYWzUKwz+p2ZyrUh7c?=
 =?iso-8859-1?Q?T6g6bnlqa/K5ll9FvxyUejq1YTZJZB3MxrIdnjuY/ICM0GrS6W8BpatVER?=
 =?iso-8859-1?Q?vBsusBxUcC1uU4V5uMY+7prc0PKtwbE7bJbHovZJg0dst/qHlCDrgDocC2?=
 =?iso-8859-1?Q?4+JcU4LQ76NKhljypZJ9IF+HpgUghDDe8OF+kjdP5JzAnLU6vz4jGekD0t?=
 =?iso-8859-1?Q?nd3bxnRR/ZvQiOIk55kN6Xf8ltE24Rd3OFY0aWXdzn1IgzEWD9IFl//KnY?=
 =?iso-8859-1?Q?Jk5MpYcZO93tLSqKD/DQLRbRRjYwzd0rgZ6pawB3Zns38YhMTstzKmj5wJ?=
 =?iso-8859-1?Q?ks75+w3KrqALwv2xlniBXh/KGOulHqnDB4QErUfbG2rbQoTM8HMmop02NV?=
 =?iso-8859-1?Q?EBz81gi1x5QccObVSMLGTrvoOSpavpvrFeedsVLbsHDJzpczjNzum10OT+?=
 =?iso-8859-1?Q?uonQzcbOhPM64LhkZJXjzibwq/5poBbub4nuWJ0T+RSgHcTWa0SFrzh3fa?=
 =?iso-8859-1?Q?31TKWbAlO+ZMovqDputt0LZf9ya0OkbYFq9hAk22ZFiilcQz9yKxmiDhk/?=
 =?iso-8859-1?Q?VQ0/PJShiXnfcoqlZTGKOIZKT+OcfqJpCTa7WehwrJ+6pPb80gF/5rFXVp?=
 =?iso-8859-1?Q?0jpUME9V9XGmYiAFIfZv1RehUxgk3eLbjxB/2jEgKnZzlkNx3H71eMxsIu?=
 =?iso-8859-1?Q?F98mrZ7eJB1wanNyM/tt8+Lju6xE57A6S4hNGAdFfBcBmuxAEdF4tefNw8?=
 =?iso-8859-1?Q?XhkoOtldiDV6iuTqikm85Oon3Z8+pqS4ExHLB09+PH5xIcyHBfLLsb2/R/?=
 =?iso-8859-1?Q?QhZY32WDvA1y0uEKazpygdgoMjcRq4ee/ffJOkJ/DngDwjFzRxZO45423W?=
 =?iso-8859-1?Q?PW1NFji1RNtC27X30fEnvdt/7hxbsTNSYvhzGn6+Rz4svRoqM+N5fECXp+?=
 =?iso-8859-1?Q?jlwJ204CH57GeN1iOcSguHf/Jey0FCO1mqt+JouUq50D9SOkn4LWcg/lh3?=
 =?iso-8859-1?Q?HbKECzIEpDq+h15BzqX2SR0zKNhhqfFUamvTUq8r5hAWkYiH+4hEuOAJ/B?=
 =?iso-8859-1?Q?Jfo3nUCrydFKxdv8oFiW9u+OvT85u09kTqwpfz2ADH5dK5tqiXCKi+pXEj?=
 =?iso-8859-1?Q?HXQCIAaJzYAEEtmAwQcuPYTGvHPIuiox5XKB0kC2j1L6sYtyE4gSQ48FMw?=
 =?iso-8859-1?Q?h4N2MC3wcGtm3tl9mISTpPVHRZ03x8rV/eQRRqbB4cdAHf4ssHSEYTB2iZ?=
 =?iso-8859-1?Q?V1fb1CP1ize2390popskUXTT4S2p0URfK6whOoFx8icir7lHWZI9iaCiBF?=
 =?iso-8859-1?Q?I3hSUx40ZbYrwugYhDw4eTVf177qGN/qiq+t0BAYE4n8HqIuoFhZQj6/s6?=
 =?iso-8859-1?Q?u6qKudFmw/8pgM8xA0nmJniNshXEYjdNk91Zs7rBqWN994EcEK+fnHAYBh?=
 =?iso-8859-1?Q?5RoDUYhRWeoAyngt4FLwTuoaemKuF5QpMAAilAhwJSqWFnk2vnubxO02to?=
 =?iso-8859-1?Q?wySQdY9y3DcsUtbC0WJs/7sX8LzE+KTodrbXRtqncoxn6NKnw+dD+x35uK?=
 =?iso-8859-1?Q?PN38SiMKo9RrSxBG2OKRABJN+QI9wRxvF2T2FN9nDgycxQsPzZ76Uyew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e1563-6f59-4bb1-e483-08dbb39f6248
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:48:53.5288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kqgRc6apKRwfFSHE/xszo+FxDCUj2pC2THjzYYst7OG3DwbVNYl3FL0Kq1MVuOMWFIE5uDgRJT5CujA1/fi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 11:57:30AM +0200, Christian König wrote:
> Am 12.09.23 um 04:16 schrieb Matthew Brost:
> > Wait for pending jobs to be complete before signaling queued jobs. This
> > ensures dma-fence signaling order correct and also ensures the entity is
> > not running on the hardware after drm_sched_entity_flush or
> > drm_sched_entity_fini returns.
> 
> Entities are *not* supposed to outlive the submissions they carry and we
> absolutely *can't* wait for submissions to finish while killing the entity.
> 
> In other words it is perfectly expected that entities doesn't exists any
> more while the submissions they carried are still running on the hardware.
> 
> I somehow better need to document how this working and especially why it is
> working like that.
> 
> This approach came up like four or five times now and we already applied and
> reverted patches doing this.
> 
> For now let's take a look at the source code of drm_sched_entity_kill():
> 
>        /* The entity is guaranteed to not be used by the scheduler */
>         prev = rcu_dereference_check(entity->last_scheduled, true);
>         dma_fence_get(prev);
> 
>         while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue))))
> {
>                 struct drm_sched_fence *s_fence = job->s_fence;
> 
>                 dma_fence_get(&s_fence->finished);
>                 if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
> drm_sched_entity_kill_jobs_cb))
>                         drm_sched_entity_kill_jobs_cb(NULL,
> &job->finish_cb);
> 
>                 prev = &s_fence->finished;
>         }
>         dma_fence_put(prev);
> 
> This ensures the dma-fence signaling order by delegating signaling of the
> scheduler fences into callbacks.
> 

Thanks for the explaination, this code makes more sense now. Agree this
patch is not correct.

This patch really is an RFC for something Nouveau needs, I can delete
this patch in the next rev and let Nouveau run with a slightly different
version if needed.

Matt

> Regards,
> Christian.
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
> >   drivers/gpu/drm/scheduler/sched_main.c      | 50 ++++++++++++++++++---
> >   include/drm/gpu_scheduler.h                 | 18 ++++++++
> >   4 files changed, 70 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > index fb5dad687168..7835c0da65c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -1873,7 +1873,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
> >   	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
> >   		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
> >   			/* remove job from ring_mirror_list */
> > -			list_del_init(&s_job->list);
> > +			drm_sched_remove_pending_job(s_job);
> >   			sched->ops->free_job(s_job);
> >   			continue;
> >   		}
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 1dec97caaba3..37557fbb96d0 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   	}
> >   	init_completion(&entity->entity_idle);
> > +	init_completion(&entity->jobs_done);
> > -	/* We start in an idle state. */
> > +	/* We start in an idle and jobs done state. */
> >   	complete_all(&entity->entity_idle);
> > +	complete_all(&entity->jobs_done);
> >   	spin_lock_init(&entity->rq_lock);
> >   	spsc_queue_init(&entity->job_queue);
> > @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >   	/* Make sure this entity is not used by the scheduler at the moment */
> >   	wait_for_completion(&entity->entity_idle);
> > +	/* Make sure all pending jobs are done */
> > +	wait_for_completion(&entity->jobs_done);
> > +
> >   	/* The entity is guaranteed to not be used by the scheduler */
> >   	prev = rcu_dereference_check(entity->last_scheduled, true);
> >   	dma_fence_get(prev);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 689fb6686e01..ed6f5680793a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
> >   }
> >   EXPORT_SYMBOL(drm_sched_resume_timeout);
> > +/**
> > + * drm_sched_add_pending_job - Add pending job to scheduler
> > + *
> > + * @job: scheduler job to add
> > + * @tail: add to tail of pending list
> > + */
> > +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
> > +{
> > +	struct drm_gpu_scheduler *sched = job->sched;
> > +	struct drm_sched_entity *entity = job->entity;
> > +
> > +	lockdep_assert_held(&sched->job_list_lock);
> > +
> > +	if (tail)
> > +		list_add_tail(&job->list, &sched->pending_list);
> > +	else
> > +		list_add(&job->list, &sched->pending_list);
> > +	if (!entity->pending_job_count++)
> > +		reinit_completion(&entity->jobs_done);
> > +}
> > +EXPORT_SYMBOL(drm_sched_add_pending_job);
> > +
> > +/**
> > + * drm_sched_remove_pending_job - Remove pending job from` scheduler
> > + *
> > + * @job: scheduler job to remove
> > + */
> > +void drm_sched_remove_pending_job(struct drm_sched_job *job)
> > +{
> > +	struct drm_gpu_scheduler *sched = job->sched;
> > +	struct drm_sched_entity *entity = job->entity;
> > +
> > +	lockdep_assert_held(&sched->job_list_lock);
> > +
> > +	list_del_init(&job->list);
> > +	if (!--entity->pending_job_count)
> > +		complete_all(&entity->jobs_done);
> > +}
> > +EXPORT_SYMBOL(drm_sched_remove_pending_job);
> > +
> >   static void drm_sched_job_begin(struct drm_sched_job *s_job)
> >   {
> >   	struct drm_gpu_scheduler *sched = s_job->sched;
> >   	spin_lock(&sched->job_list_lock);
> > -	list_add_tail(&s_job->list, &sched->pending_list);
> > +	drm_sched_add_pending_job(s_job, true);
> >   	spin_unlock(&sched->job_list_lock);
> >   }
> > @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >   		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> >   		 * is parked at which point it's safe.
> >   		 */
> > -		list_del_init(&job->list);
> > +		drm_sched_remove_pending_job(job);
> >   		spin_unlock(&sched->job_list_lock);
> >   		status = job->sched->ops->timedout_job(job);
> > @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >   		 * Add at the head of the queue to reflect it was the earliest
> >   		 * job extracted.
> >   		 */
> > -		list_add(&bad->list, &sched->pending_list);
> > +		drm_sched_add_pending_job(bad, false);
> >   	/*
> >   	 * Iterate the job list from later to  earlier one and either deactive
> > @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >   			 * Locking here is for concurrent resume timeout
> >   			 */
> >   			spin_lock(&sched->job_list_lock);
> > -			list_del_init(&s_job->list);
> > +			drm_sched_remove_pending_job(s_job);
> >   			spin_unlock(&sched->job_list_lock);
> >   			/*
> > @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> >   		/* remove job from pending_list */
> > -		list_del_init(&job->list);
> > +		drm_sched_remove_pending_job(job);
> >   		/* cancel this job's TO timer */
> >   		cancel_delayed_work(&sched->work_tdr);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index b7b818cd81b6..7c628f36fe78 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -233,6 +233,21 @@ struct drm_sched_entity {
> >   	 */
> >   	struct completion		entity_idle;
> > +	/**
> > +	 * @pending_job_count:
> > +	 *
> > +	 * Number of pending jobs.
> > +	 */
> > +	unsigned int                    pending_job_count;
> > +
> > +	/**
> > +	 * @jobs_done:
> > +	 *
> > +	 * Signals when entity has no pending jobs, used to sequence entity
> > +	 * cleanup in drm_sched_entity_fini().
> > +	 */
> > +	struct completion		jobs_done;
> > +
> >   	/**
> >   	 * @oldest_job_waiting:
> >   	 *
> > @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
> >   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >   		     unsigned int num_sched_list);
> > +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
> > +void drm_sched_remove_pending_job(struct drm_sched_job *job);
> > +
> >   #endif
> 
