Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A159773AA3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 16:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FECC10E3E1;
	Tue,  8 Aug 2023 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F410E1C3;
 Tue,  8 Aug 2023 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691503705; x=1723039705;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zmbvYpqlzH81nJJTsZ08hD76OAT2TzYtSfZf3SbHRs0=;
 b=J/aOegTL/Sy8cjECJYaME5peGQcJX+fBEbnaAkXCsieFPWslB6xkXCRA
 v5D2bAQD6MyZY29wf4XaU41yxTqXFvXxf5mWyW6M1yFBbTv2Yi36ZqZox
 D8Wth9N5Re9vs0HrR1MXQ3QBI8c2SXwUoMGN/c3MaoQ6JxUAe56R2oHhe
 hrP6MavJ+KQcMrLvmjUc3pf236ebd2mtVCXBQlA+HyCJGiGQkoln/UHm2
 Z0wHYkZpMlxIhd8au98CThvt3ybMEjWkIf8fFe42b0OWV+E0mUumdKLsU
 KCxYkGxoiKxppghGiwWscelXx95rfvm5vu+oNCUeqO3bsNSdXhmjci4kq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351132408"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="351132408"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845490793"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="845490793"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 07:07:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 07:07:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 07:07:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 07:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFFU5ppsaH9RLsaWghvx511zV59zJyGcff7WlvFaIKC4xPdUTIllXCyiExO1xos2DtodKOdjhSfOdxrXwJZGjnGwxssveCO3oXhcfTgY9BUE4OMHCEUWPma9+v4nZ4lTjtYaBh4JDSGRojHppazInU82W3/j0EvIHqhxorRhYCgkcVhwQ/aQ/c1VyhMl5vz3DtAo6cMD/Sl0xu2rwuIo7nGlbO1u7wnX5EUueCaN/+4LJXerUjvoGRopTcc7CvAw9OmJ+w+FJlVv/Kq/X0RKcSFT72yBnroosl5CapdaQ5GODV47BijdMHFkdql2CeqP+7uCgU6rtNF1hHaqs1TGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NVp1r8SYn4nEI5G343i5IJAiVzWiHQ1dhOAE3SZ1xA=;
 b=MXmcKYL8IPqIsROprmJEx7Z+vCaPyjP3A/wVMu+fgZI94hEPoA21auFfyF2xZXYkPevoXXBrOgjI/DedlRGxA88jx3PhQ3+Hp48J74GSi+lRLTWXJwCfJDnEXZitIgYmFFozux/ICa3/NGqJvMbVk1kYLxH+QQ/Jkd6siEa9CXCspV2ATLgfYfJkCQdzVBtnQF3W2GcC7jmtuJtYF91GkhtYNGVyExf1O9zd9pRomW574ow+jyAW9Gmb83DvFovZb/xzfm8Xh/BxTktEKg4FsmDTGjvwZp3fzchZv4BjsfNeovHJ63g72pGBm+EiaFbKQFEOELkGuEXJdkFGUGbnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 14:07:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 14:07:35 +0000
Date: Tue, 8 Aug 2023 14:06:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Message-ID: <ZNJL4Sgigy4JsprS@DUT025-TGLU.fm.intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
 <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
 <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
 <b19bb89c-a814-2519-e037-ee1c33dce02f@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b19bb89c-a814-2519-e037-ee1c33dce02f@amd.com>
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 161e232e-8a9f-4a73-046e-08db9818d0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DOrjlnoHf24++D8uQ0RMN7oEZjYGvH6MEAVwCDKlRYTT1ITmBkJD8QYxn03k7VFVaQFvBWBkODgQHY33uNGcSnALwj0kGJBih3QgqNomGZg3rGEQHP6oOao8Ii68g4xH2Q7k7ucP5vrASue+m7kA+20MjF1BRQGnN5o/ARei2esr3LCfDXmUEgbIz6XSygUOeg1rkPNe4UDKPvHUb06reP4jqhMYtsmUj/9D70nYEF0f+TaHiQ6Y7f7dVa5IAoNRRuvphSKMkSjYD/hIrn3KadlecVMOE0TZqW1XXQfMM8GLEW3cB6Eu/lFEMW2kzcJLX7s9J7jXG9KTM4jgUzM14WaX3WKiKy5TIcE2zDYDqHZgZ8cYHa0/TaL9juuxABt+QX4Xpno2NimmFxSr6MUpVwg42II1qlgnOzsaxuBJde7ZtzjDeqBTjCNvD4ReNkRT57IhclGK++U7octdp2+RGSkvQRzdzYTRq7a71mCdarTvj/9IWA571KpbWmkDLG3vSNnCYnAyRry1tNZEJaK22cpG6r3r3Qgy1nXBOS/ymmbF+2/W7ykvDddiCc3E4aEWxgfEvF37kv7mrS66wGm5vfKAjgu+Y1z7JdpOqG2QIZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(1800799003)(186006)(8676002)(2906002)(8936002)(41300700001)(316002)(5660300002)(7416002)(44832011)(30864003)(15650500001)(86362001)(66574015)(478600001)(26005)(6506007)(82960400001)(38100700002)(83380400001)(6512007)(966005)(6666004)(6486002)(66946007)(66556008)(6916009)(4326008)(66476007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZLgYnKLATPLHPL6xn8qP/OO4+P5qCjzLnrFuP57EBRwd1U6gePQcQqqVCP?=
 =?iso-8859-1?Q?6ggy/sMCZRb+9yia665Y2TEh7dvr899MXVp8rtIyXVqi+b9L6BUxhmRm7Y?=
 =?iso-8859-1?Q?VK6cWg1LEm4khxvfHlFurhk/Tf+S3ohrishBjypnRAvrXAdD4OV7tGdQfE?=
 =?iso-8859-1?Q?ZN674UTnGjRkk5BwckmTvZJBZvm1UaaJLAD792mvTJU49mHdQAKzq+5koQ?=
 =?iso-8859-1?Q?A4oOYfbSUjeUGRjOxoEJ+Btp73OGsdUFfO8+NjfiZ76Wxx5LR9oi4kQXFn?=
 =?iso-8859-1?Q?R7/8TsLJDwDsT8SPfAoTArjbGmOaqdR3tVkRAQi/pFoHzqbEtUYZcgaNfP?=
 =?iso-8859-1?Q?Nx4y1aJt6nkZMwMj31NdoxOt8UQr4jaUmZKSqVmfYEvw15gGAjpUOzQFpO?=
 =?iso-8859-1?Q?zvRnUWLNWBAqSqdiZU4st5E3iPVHShp8JFMgXr3WHiQNiS2VkNoosZq+WK?=
 =?iso-8859-1?Q?n3mBEq4MWPyB9U3vFxs9tznA3rZdRTjdMLoDtC+iu8VuUDicaOcobe0TB1?=
 =?iso-8859-1?Q?bYAF1qmKvDGh1RrGi78D7k//VF2ufQNXUcJ9LLKto6AM2KidY51wz/syVo?=
 =?iso-8859-1?Q?gqfxGi0L2LnEccvbh2HhzKztszEScfnotsz0dIthIKDvPpEaEOq9aLvhBb?=
 =?iso-8859-1?Q?1OR9lqrgc1vL9B7tAB36Xw5y0i84SnK1xlnzmVXbpoAy7r9aZua8T5mJX0?=
 =?iso-8859-1?Q?xMPsXGB6LvnHsWFkyiXhd/lfpKFYMFH8r4+qWsjdqFnDvZpRpE876vA+p6?=
 =?iso-8859-1?Q?iroNEO6qy+z5LZPcSxarVMWaHN4OKCIBgI9d0TK7GsU/T6L2pHPdN4QeQ8?=
 =?iso-8859-1?Q?puQN+RZSbh1UhmI+wQU2NBWYOZ5tUnio/3QC6l9DUoBNq7KSxwXWdGMfVX?=
 =?iso-8859-1?Q?NE0zzSN91K2wb25UqdXJRrt2+mmY2laQQBBNKDO2U3cRuqpiwF0xN0VyS5?=
 =?iso-8859-1?Q?PRX+3VREJtweoBfpc8t+cqUL4muJz3fEccUaIGqw6ZFcFRzSb8sRpLgfVN?=
 =?iso-8859-1?Q?w3Gt91NU0mNrIcqSGiW1W3ru6pV/N1eBXGfQZ2vP+aDOpu4ZekueUOcVK2?=
 =?iso-8859-1?Q?7Y8Q4BTHZ2Kv35NFlRo+7EOMlZ/dDmq0SlUHLtKVSvzQO7osK0G2vLviNB?=
 =?iso-8859-1?Q?H2Jg4u5wiZrWJ87Yqdp9QVgu/guR+yxiOkd6k75X3OsbAjqDzR2N9JPeSK?=
 =?iso-8859-1?Q?+yzuNlmBF1vnl4bgEr/YNIDwVUeIuubrDfbsLojhHqWSha9DJCZjeZ/AmT?=
 =?iso-8859-1?Q?VzADAClFzPyMaiODVEs9vhGtjGg8rZOxR4JpM38pSaWBmS4OCjBUEUFLa0?=
 =?iso-8859-1?Q?9o4Hp2VQbWxWFEAlBGaqgFni5Zs2Ty/5Sp1s+SNDCQjncRrYhuIaERfDbV?=
 =?iso-8859-1?Q?MYISxDKSRMC2lkpL6m3IvedJHCTnU0nOFKo6+6siU+dT0Fgg9+16PZ0sIG?=
 =?iso-8859-1?Q?hIhfbXF+GGSflnfa+Ml/DlcVe2tPhtqR3BnDNUBqva9cOwHEtSH3jke0EF?=
 =?iso-8859-1?Q?5uYZW6fP7zo9Qd+LCBHuT6mJHhS9wR7SadxXlXjR/3OHGqPScwHTFSaaGo?=
 =?iso-8859-1?Q?scKhz/uCuoj3auiltJ1HyooDJiDUhHvxVuHgdSMiYMO1MfzmrLVo3Ecqnx?=
 =?iso-8859-1?Q?uXzcxCTDYsxDTfPWVBd98JY7m79ClhzQq0TBz+Nkc4PcYDvr58j1v97g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 161e232e-8a9f-4a73-046e-08db9818d0a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:07:35.1481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBlGVK4rG5zlfGl49e2CKCiH82zDu1iDJOU7mKaLilKanZl+RrftwDlSql+X+mC39VWcAKiRq8AZ132A2jFz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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

On Mon, Aug 07, 2023 at 05:46:16PM +0200, Christian König wrote:
> Am 04.08.23 um 16:13 schrieb Matthew Brost:
> > [SNIP]
> > Christian / Daniel - I've read both of you comments and having a hard
> > time parsing them. I do not really understand the issue with this patch
> > or exactly what is being suggested instead. Let's try to work through
> > this.
> > 
> > > > > > I'm still extremely frowned on this.
> > > > > > 
> > > > > > If you need this functionality then let the drivers decide which
> > > > > > runqueue the scheduler should use.
> > What do you mean by runqueue here? Do you mean 'struct
> > workqueue_struct'? The scheduler in this context is 'struct
> > drm_gpu_scheduler', right?
> 
> Sorry for the confusing wording, your understanding is correct.
> 
> > Yes, we have added this functionality iin the first patch.
> > 
> > > > > > When you then create a single threaded runqueue you can just submit work
> > > > > > to it and serialize this with the scheduler work.
> > > > > > 
> > We don't want to use a single threaded workqueue_struct in Xe, we want
> > to use a system_wq as run_job() can be executed in parallel across
> > multiple entites (or drm_gpu_scheduler as in Xe we have 1 to 1
> > relationship between entity and scheduler). What we want is on per
> > entity / scheduler granularity to be able to communicate into the
> > backend a message synchronously (run_job / free_job not executing,
> > scheduler execution not paused for a reset).
> > 
> > If I'm underatanding what you suggesting in Xe we'd create an ordered
> > workqueue_struct per drm_gpu_scheduler and the queue messages on the
> > ordered workqueue_struct?
> 
> Yes, correct.
> 
> > This seems pretty messy to me as now we have
> > open coded a solution bypassing the scheduler, every drm_gpu_scheduler
> > creates its own workqueue_struct, and we'd also have to open code the
> > pausing of these messages for resets too.
> > 
> > IMO this is pretty clean solution that follows the pattern of cleanup
> > jobs already in place.
> 
> Yeah, exactly that's the point. Moving the job cleanup into the scheduler
> thread is seen as very very bad idea by me.
> 
> And I really don't want to exercise that again for different use cases.
> 
> > 
> > > > > > This way we wouldn't duplicate this core kernel function inside the
> > > > > > scheduler.
> > > > > Yeah that's essentially the design we picked for the tdr workers,
> > > > > where some drivers have requirements that all tdr work must be done on
> > > > > the same thread (because of cross-engine coordination issues). But
> > > > > that would require that we rework the scheduler as a pile of
> > > > > self-submitting work items, and I'm not sure that actually fits all
> > > > > that well into the core workqueue interfaces either.
> > This is the ordering between TDRs firing between different
> > drm_gpu_scheduler and larger external resets (GT in Xe) an ordered
> > workqueue_struct makes sense for this. Here we are talking about
> > ordering jobs and messages within a single drm_gpu_scheduler. Using the
> > main execution thread to do ordering makes sense in my opinion.
> 
> I completely disagree to that.
> 
> Take a look at how this came to be. This is a very very ugly hack and we
> already had a hard time making lockdep understand the different fence
> signaling dependencies with freeing the job and I'm pretty sure that is
> still not 100% correct.
> 
> > 
> > > > There were already patches floating around which did exactly that.
> > > > 
> > > > Last time I checked those were actually looking pretty good.
> > > > 
> > Link to patches for reference.
> > 
> > > > Additional to message passing advantage the real big issue with the
> > > > scheduler and 1 to 1 mapping is that we create a kernel thread for each
> > > > instance, which results in tons on overhead.
> > First patch in the series switches from kthread to work queue, that is
> > still a good idea.
> 
> This was the patch I was referring to. Sorry didn't remembered that this was
> in the same patch set.
> 
> > 
> > > > Just using a work item which is submitted to a work queue completely avoids
> > > > that.
> > > Hm I should have read the entire series first, since that does the
> > > conversion still. Apologies for the confusion, and yeah we should be able
> > > to just submit other work to the same wq with the first patch? And so
> > > hand-rolling this infra here isn't needed at all?
> > > 
> > I wouldn't call this hand rolling, rather it following patten already in
> > place.
> 
> Basically workqueues are the in kernel infrastructure for exactly that use
> case and we are trying to re-create that here and that is usually a rather
> bad idea.
> 

Ok let me play around with what this would look like in Xe, what you are
suggesting would be ordered-wq per scheduler, work item for run job,
work item for clean up job, and work item for a message. That might
work I suppose? Only issue I see is scaling as this exposes an
ordered-wq creation directly to an IOCTL. No idea if that is actually a
concern though.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Or what am I missing?
> > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > Worst case I think this isn't a dead-end and can be refactored to
> > > > > internally use the workqueue services, with the new functions here
> > > > > just being dumb wrappers until everyone is converted over. So it
> > > > > doesn't look like an expensive mistake, if it turns out to be a
> > > > > mistake.
> > > > > -Daniel
> > > > > 
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
> > > > > > >     include/drm/gpu_scheduler.h            | 29 +++++++++++++-
> > > > > > >     2 files changed, 78 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index 2597fb298733..84821a124ca2 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > > > >     }
> > > > > > >     EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > > > 
> > > > > > > +/**
> > > > > > > + * drm_sched_add_msg - add scheduler message
> > > > > > > + *
> > > > > > > + * @sched: scheduler instance
> > > > > > > + * @msg: message to be added
> > > > > > > + *
> > > > > > > + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> > > > > > > + * Messages processing will stop if schedule run wq is stopped and resume when
> > > > > > > + * run wq is started.
> > > > > > > + */
> > > > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > > > +                    struct drm_sched_msg *msg)
> > > > > > > +{
> > > > > > > +     spin_lock(&sched->job_list_lock);
> > > > > > > +     list_add_tail(&msg->link, &sched->msgs);
> > > > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > > > +
> > > > > > > +     drm_sched_run_wq_queue(sched);
> > > > > > > +}
> > > > > > > +EXPORT_SYMBOL(drm_sched_add_msg);
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * drm_sched_get_msg - get scheduler message
> > > > > > > + *
> > > > > > > + * @sched: scheduler instance
> > > > > > > + *
> > > > > > > + * Returns NULL or message
> > > > > > > + */
> > > > > > > +static struct drm_sched_msg *
> > > > > > > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > > > > > > +{
> > > > > > > +     struct drm_sched_msg *msg;
> > > > > > > +
> > > > > > > +     spin_lock(&sched->job_list_lock);
> > > > > > > +     msg = list_first_entry_or_null(&sched->msgs,
> > > > > > > +                                    struct drm_sched_msg, link);
> > > > > > > +     if (msg)
> > > > > > > +             list_del(&msg->link);
> > > > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > > > +
> > > > > > > +     return msg;
> > > > > > > +}
> > > > > > > +
> > > > > > >     /**
> > > > > > >      * drm_sched_main - main scheduler thread
> > > > > > >      *
> > > > > > > @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > >                 container_of(w, struct drm_gpu_scheduler, work_run);
> > > > > > >         struct drm_sched_entity *entity;
> > > > > > >         struct drm_sched_job *cleanup_job;
> > > > > > > +     struct drm_sched_msg *msg;
> > > > > > >         int r;
> > > > > > > 
> > > > > > >         if (READ_ONCE(sched->pause_run_wq))
> > > > > > > @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > 
> > > > > > >         cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > > > >         entity = drm_sched_select_entity(sched);
> > > > > > > +     msg = drm_sched_get_msg(sched);
> > > > > > > 
> > > > > > > -     if (!entity && !cleanup_job)
> > > > > > > +     if (!entity && !cleanup_job && !msg)
> > > > > > >                 return; /* No more work */
> > > > > > > 
> > > > > > >         if (cleanup_job)
> > > > > > >                 sched->ops->free_job(cleanup_job);
> > > > > > > +     if (msg)
> > > > > > > +             sched->ops->process_msg(msg);
> > > > > > > 
> > > > > > >         if (entity) {
> > > > > > >                 struct dma_fence *fence;
> > > > > > > @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > >                 sched_job = drm_sched_entity_pop_job(entity);
> > > > > > >                 if (!sched_job) {
> > > > > > >                         complete_all(&entity->entity_idle);
> > > > > > > -                     if (!cleanup_job)
> > > > > > > +                     if (!cleanup_job && !msg)
> > > > > > >                                 return; /* No more work */
> > > > > > >                         goto again;
> > > > > > >                 }
> > > > > > > @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > 
> > > > > > >         init_waitqueue_head(&sched->job_scheduled);
> > > > > > >         INIT_LIST_HEAD(&sched->pending_list);
> > > > > > > +     INIT_LIST_HEAD(&sched->msgs);
> > > > > > >         spin_lock_init(&sched->job_list_lock);
> > > > > > >         atomic_set(&sched->hw_rq_count, 0);
> > > > > > >         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > > > index df1993dd44ae..267bd060d178 100644
> > > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > > @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
> > > > > > >         DRM_GPU_SCHED_STAT_ENODEV,
> > > > > > >     };
> > > > > > > 
> > > > > > > +/**
> > > > > > > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> > > > > > > + * message
> > > > > > > + *
> > > > > > > + * Generic enough for backend defined messages, backend can expand if needed.
> > > > > > > + */
> > > > > > > +struct drm_sched_msg {
> > > > > > > +     /** @link: list link into the gpu scheduler list of messages */
> > > > > > > +     struct list_head                link;
> > > > > > > +     /**
> > > > > > > +      * @private_data: opaque pointer to message private data (backend defined)
> > > > > > > +      */
> > > > > > > +     void                            *private_data;
> > > > > > > +     /** @opcode: opcode of message (backend defined) */
> > > > > > > +     unsigned int                    opcode;
> > > > > > > +};
> > > > > > > +
> > > > > > >     /**
> > > > > > >      * struct drm_sched_backend_ops - Define the backend operations
> > > > > > >      *  called by the scheduler
> > > > > > > @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
> > > > > > >              * and it's time to clean it up.
> > > > > > >          */
> > > > > > >         void (*free_job)(struct drm_sched_job *sched_job);
> > > > > > > +
> > > > > > > +     /**
> > > > > > > +      * @process_msg: Process a message. Allowed to block, it is this
> > > > > > > +      * function's responsibility to free message if dynamically allocated.
> > > > > > > +      */
> > > > > > > +     void (*process_msg)(struct drm_sched_msg *msg);
> > > > > > >     };
> > > > > > > 
> > > > > > >     /**
> > > > > > > @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
> > > > > > >      * @timeout: the time after which a job is removed from the scheduler.
> > > > > > >      * @name: name of the ring for which this scheduler is being used.
> > > > > > >      * @sched_rq: priority wise array of run queues.
> > > > > > > + * @msgs: list of messages to be processed in @work_run
> > > > > > >      * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> > > > > > >      *                 waits on this wait queue until all the scheduled jobs are
> > > > > > >      *                 finished.
> > > > > > > @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
> > > > > > >      * @job_id_count: used to assign unique id to the each job.
> > > > > > >      * @run_wq: workqueue used to queue @work_run
> > > > > > >      * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > > - * @work_run: schedules jobs and cleans up entities
> > > > > > > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> > > > > > >      * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > > > >      *            timeout interval is over.
> > > > > > >      * @pending_list: the list of jobs which are currently in the job queue.
> > > > > > > @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
> > > > > > >         long                            timeout;
> > > > > > >         const char                      *name;
> > > > > > >         struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > > > > > > +     struct list_head                msgs;
> > > > > > >         wait_queue_head_t               job_scheduled;
> > > > > > >         atomic_t                        hw_rq_count;
> > > > > > >         atomic64_t                      job_id_count;
> > > > > > > @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > > > > > 
> > > > > > >     void drm_sched_job_cleanup(struct drm_sched_job *job);
> > > > > > >     void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > > > +                    struct drm_sched_msg *msg);
> > > > > > >     void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > > > > > >     void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> > > > > > >     void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
