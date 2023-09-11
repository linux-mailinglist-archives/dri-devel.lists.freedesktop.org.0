Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818F79AB16
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 21:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B1E10E1BE;
	Mon, 11 Sep 2023 19:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D18610E1B8;
 Mon, 11 Sep 2023 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694461596; x=1725997596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5zMjXLvJdnNGnSjG/gxYs2zp8jm6cPaC+Jplpx4TtNk=;
 b=FZmCBlRJ+wGl5Si1dMMa3QlmAIAZzPUqqvMAk6A0mX83GQoCh7MpR6nW
 jD3n0vbnrU3ba4nHqy7o/a2yD9fddWMm6IxBTD4S6dUOVyBk1VAACI9b4
 33y3ELOpf++fxvtBQjV1yyUl80zK/k2Rnbo+bAecA9G7Ms0mKJwNKHieZ
 /wU335vree3Rz9t5oPqXWVQY1tyJSEfeLa76/GyrUR2tIgf2TVje8o1s0
 oLUVPOg8BLiVOFVmOu3TBbzWthdWAT8w3AwZRAErBSmeVwCzAsYO36fx8
 5vNkdEqih/m9Hs/uw1iz9b9lybuDG28TU9jM4kE6WtpPY7vEmrwEa/d7R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382000965"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="382000965"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="808938110"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="808938110"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 12:46:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 12:46:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 12:46:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 12:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMr/7Wfthfums0jcpK6jmcFdr2Fc5BTAgBBEnY1O3zGva8ghJ51rR6yO+1ynd/sLps7nvPinEVk/EmEEW3zOB+TqQpXTFlnpGuN42tZVHSq6EIfiLcRSO7BrirMXgvGx94yIblagrntZE8vqO3Y5jN9sToQv2NXUIFBY9YhoOArMR7S6MrrNsP//ezg+gWmk718vR92QyJzuVrK2F8/OJQNIV8N4Mh4Niv86yUdWQVTfkd6Cd/Sqcz59GF9qvCv943k3gbBIVjrO6KhMhqJO74JQ5V3YVBc79eTRXVQOWLnlllF8+8JFqjXboEe3bfKCejNh09/gHaT8p1tojvGwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhYNd/O7sC7Ot6h5rh6tkIZbR8zd3yr3OhHvqmdrynI=;
 b=ZuwaemqvnQ81uJboav20f2J29s7TcfTrz5jCR77yhItHAAfF2q9AZ840zGkIu4acMKksGknmNA4xxrB3S14Sgs2QKj2DKWAt52MtisD8p0y86kidNe70VlblbVawEIJRvoSXDaPwTmNmzp42DAraxmtGPBZN+tmeLv+UDirh5fUHlO5qZQidapLkb+sZxPmjdORebpdqPHXk73vUBKiPUcqIS1Snv/xj36XOUVmNBUM70wyzbR183sdjySOR4OXLZZ20zKrg2OxG1RZ+Cu5QobI8etx20d1RaxJVHw7wVNkE4MQHb9VImKz3k9EAMRkeUoxdaOoi07fgwXXTvOtP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 19:46:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Mon, 11 Sep 2023
 19:46:30 +0000
Date: Mon, 11 Sep 2023 19:44:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 3/9] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Message-ID: <ZP9uMA92HBvzQME+@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-4-matthew.brost@intel.com>
 <21b82a4e-ded8-cb63-0013-72e4043c3344@redhat.com>
 <f2e87279-e2c3-db5c-0fe6-51ad77d7afb5@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2e87279-e2c3-db5c-0fe6-51ad77d7afb5@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9e6a0b-9073-4b26-23b0-08dbb2ffcb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx/Xo2X0X92nkTpk47b7SfYk/I6zkBd/XaxSNhVwzTrR9YlT19xPa0npIjl0vjT21Zl4lcBBpSt5tn4BXatU9DEwgubTobZv/0L4XU/iCqryl5ZYfzxEHRtxmGk+q5hYHHkzYJU601aHwDrdvIrD9PRzaZMKztTkDCak2agSJtwIfngy7Jpy/Jk0wkt4/3PVWgO4vwngKzVCqaiEsDzWZRqoiqBpGQz7J7EJv6HITl7MS/KSmBi0tQYaxrW257lsPNDVYt6LnsdAKlKLPxAlmEI3lbqdWr01jRv3O7dQonAnS4fWYin6EsHUfTT0LNNMY6Ui3WNxl4R4I1W23+5ru6mrEq3urc/o8bbvOX+Q75y2Zt47aK/iGICc20dqKaFOJE1Mk0BvOKRrIl+g80MnuzCJ3t6N3o1wkLHdEHU29/GAeCUICgEKocZFw+dohDITUejaA+xncH6549HYa0Be1CRIeLmvNtsZApSX7sLiU38fq3XYJFDaGa6Ses3NSwNxU/rKjZQMOtcYbEniakV+9FEQ+TvqE4P68E9SgRieKrQ/SllmuMpjPLrrwbzXw7eo789UCPvuz9h4sl9DhZKY7/T1cu5vLTjnGMX5LHgD6D1qivUfjCuvIVRptCZHMcGY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(1800799009)(186009)(451199024)(6916009)(316002)(66556008)(66946007)(66476007)(26005)(83380400001)(6506007)(53546011)(6666004)(6512007)(6486002)(38100700002)(86362001)(82960400001)(478600001)(7416002)(30864003)(2906002)(8676002)(5660300002)(41300700001)(4326008)(8936002)(44832011)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?chAlYrdpdhfw5DuOudpmdSShE5JhyARN0caQqpDKpXAOMpJ+nzf3YIqjKv?=
 =?iso-8859-1?Q?2r4MNfGSVtFVacFPazJ2ZCPJmN237qxP05OOZ5Sl/0YwJ7EHSFHvG4Ax1h?=
 =?iso-8859-1?Q?hTDKhAeYyWgCZH9+awu4vbEzlm0d/E9fb0XNQzzfGhsBzCbOLZdxHA8+FH?=
 =?iso-8859-1?Q?WP/ZwisjrPmpPxHETK8lk79S5hZtzRGGIhd2BYTyt4pL4USVYaBh4C9gWY?=
 =?iso-8859-1?Q?nrW/u6L4Hqh5vL0yh+LWiBR2hPdfVDfBU7mJWbQbctcBKDxl5uAuaKTQ4E?=
 =?iso-8859-1?Q?FreFeaAtq8p3NzpiaJKnwEYgVqL7FRZVBaV8VcgxbPmB6U/IzI6Q1RIkPh?=
 =?iso-8859-1?Q?8QNvmRuqPgWVk4flCs0lVa2NKSSiQT6d3crK5UZEdUVm9+H1shxPLjPqhN?=
 =?iso-8859-1?Q?viFpTu8qYjrGKTgd7nDM9301CHoCAGj8Ux1hHin9d0l8uibtsNHucRgCs9?=
 =?iso-8859-1?Q?mGJt9Wojz7CXg04plMD6CXun/CVDAuXyPK6+RNGim93j4WHfMAqW5MNQdR?=
 =?iso-8859-1?Q?9afJZqO/41/bkQN8yNLNtcrA0bSNFqNLz2xxNn92uD1NTA/vgLQYpAYVL7?=
 =?iso-8859-1?Q?GHR4fKfFLb3bb4PqumNQAsM31zebQLL44HE67gl7IOjiYM7Vj6XgRghje9?=
 =?iso-8859-1?Q?D3m4kSvAEV6b40jUJEsri3x8t8HXQckAkVnPzA2TVAHLnr+RGXwOx++e1V?=
 =?iso-8859-1?Q?paNPgJSkaAehdBryzFXOUi8uK99F6Ka4wMW7nD6GycrCmTpjmUon+IW+bZ?=
 =?iso-8859-1?Q?jI9x5igMYBl2NCMnY1udvTXrTiiQP9kcmki3DNgHBQMqhXIVvanAy15ypl?=
 =?iso-8859-1?Q?oz41s/+TAmuWQsIqbR6GwKNIJW5/YksEEEJzm31mlqkLjmuTjMGic1FBBP?=
 =?iso-8859-1?Q?/+7L2dk+NOEsr1I/88DW7s6p9AQ261beYiFWMmD6Ju34wZVdS8RSca4M6b?=
 =?iso-8859-1?Q?tzoSgTeqM1MBZat8yKK6PttWgSNZ2Np2aHjipA74v5lssgEjMrA0YKiboS?=
 =?iso-8859-1?Q?I82EGZZeeMxkh2g3k9MiODPsUzGZRg7TyKsrSB34wFuPQzaUDKdpzKvyl7?=
 =?iso-8859-1?Q?vP+aTb7NmSmjv+fRWh+cFbFUQWEV6AiHbag292tDBrqN0yfPrNZE8Si2Rh?=
 =?iso-8859-1?Q?HKX2NucMQEigwlVqK7uZas3glq76XaugwdxJ92I+28QOuKP6TWI/h5JL+l?=
 =?iso-8859-1?Q?kpd+y10NOm9EAeBKn2ZIm3mXJDF0gCe4WAvZjcU92UaIov7a2F+nh7KMvn?=
 =?iso-8859-1?Q?9VFM5No9zDAbmvOqPkXkWuBPH33LNGDSt9CqGDkbTg8FxQtq58MAru5A3a?=
 =?iso-8859-1?Q?1rl9TJCdliZ11gZz45uWUTnSB7YsG/jvW2AnxYhRiZYMtN7YVQ+k36HRjC?=
 =?iso-8859-1?Q?hVszoYXhJDO77Bwop1fE9QviVtQbN5ldm5UnfnN3Qj2p/MsopmsDrV/lgN?=
 =?iso-8859-1?Q?IsY+Hdm1jIwkwHkUSbk7iDhBOy92Bm0R7qr6nYGCaNmUiFJ6pUsTpax+S7?=
 =?iso-8859-1?Q?4z30anTqriLHxTxVJNw3LmJGc1V8Jw4qMcEh2p2DzKmgHoRxi9MO9ue77c?=
 =?iso-8859-1?Q?Ugli9M5VZFNonCr7ag/a3iWfUmfwXuAhj9nT5kWTUMcen/VCBPWJ8wJzTD?=
 =?iso-8859-1?Q?TBiwSAF9Jn23aUtpxdxEQuLgFyLtrdMyw1Tf38wFzX7aOjQwhNZPgOqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9e6a0b-9073-4b26-23b0-08dbb2ffcb06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 19:46:29.7482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7oxg3S86atw+Z2SgSXqvRYncd6RI5efM644EKrzGqdr4tjSIlXF66d3SdbCuScXTsUJ50Q3U/OMSlDRwtDxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 01:10:38PM +0200, Danilo Krummrich wrote:
> On 8/29/23 19:37, Danilo Krummrich wrote:
> > On 8/11/23 04:31, Matthew Brost wrote:
> > > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > > scheduler and entity. No priorities or run queue used in this mode.
> > > Intended for devices with firmware schedulers.
> > > 
> > > v2:
> > >    - Drop sched / rq union (Luben)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++++++++++++++------
> > >   drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> > >   drivers/gpu/drm/scheduler/sched_main.c   | 63 +++++++++++++++++++---
> > >   include/drm/gpu_scheduler.h              |  8 +++
> > >   4 files changed, 119 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 65a972b52eda..1dec97caaba3 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> > >       memset(entity, 0, sizeof(struct drm_sched_entity));
> > >       INIT_LIST_HEAD(&entity->list);
> > >       entity->rq = NULL;
> > > +    entity->single_sched = NULL;
> > >       entity->guilty = guilty;
> > >       entity->num_sched_list = num_sched_list;
> > >       entity->priority = priority;
> > > @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> > >       RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > >       RB_CLEAR_NODE(&entity->rb_tree_node);
> > > -    if(num_sched_list)
> > > -        entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > > +    if (num_sched_list) {
> > > +        if (sched_list[0]->sched_policy !=
> > > +            DRM_SCHED_POLICY_SINGLE_ENTITY) {
> > > +            entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > > +        } else {
> > > +            if (num_sched_list != 1 || sched_list[0]->single_entity)
> > > +                return -EINVAL;
> > > +            sched_list[0]->single_entity = entity;
> > > +            entity->single_sched = sched_list[0];
> > > +        }
> > > +    }
> > >       init_completion(&entity->entity_idle);
> > > @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > >                       struct drm_gpu_scheduler **sched_list,
> > >                       unsigned int num_sched_list)
> > >   {
> > > -    WARN_ON(!num_sched_list || !sched_list);
> > > +    WARN_ON(!num_sched_list || !sched_list ||
> > > +        !!entity->single_sched);
> > >       entity->sched_list = sched_list;
> > >       entity->num_sched_list = num_sched_list;
> > > @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > >   {
> > >       struct drm_sched_job *job;
> > >       struct dma_fence *prev;
> > > +    bool single_entity = !!entity->single_sched;
> > > -    if (!entity->rq)
> > > +    if (!entity->rq && !single_entity)
> > >           return;
> > >       spin_lock(&entity->rq_lock);
> > >       entity->stopped = true;
> > > -    drm_sched_rq_remove_entity(entity->rq, entity);
> > > +    if (!single_entity)
> > > +        drm_sched_rq_remove_entity(entity->rq, entity);
> > 
> > Looks like nothing prevents drm_sched_run_job_work() to fetch more jobs from the entity,
> > hence if this is called for an entity still having queued up jobs and a still running
> > scheduler, drm_sched_entity_kill() and drm_sched_run_job_work() would race for jobs, right?
> 
> I worked around this with:
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9a5e9b7032da..0687da57757d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1025,7 +1025,8 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>                 return NULL;
>         if (sched->single_entity) {
> -               if (drm_sched_entity_is_ready(sched->single_entity))
> +               if (drm_sched_entity_is_ready(sched->single_entity) &&
> +                   !READ_ONCE(sched->single_entity->stopped))

This looks like the proper fix. Will include in next rev.

>                         return sched->single_entity;
>                 return NULL;
> 
> > 
> > Not sure if this is by intention because we don't expect the driver to drm_sched_entity_fini()
> > as long as there are still queued up jobs. At least this is inconsistant to what
> > drm_sched_entity_kill() does without DRM_SCHED_POLICY_SINGLE_ENTITY and should either be fixed
> > or documented if we agree nothing else makes sense.
> > 
> > I think it also touches my question on how to tear down the scheduler once a ring is removed
> > or deinitialized.
> > 
> > I know XE is going its own way in this respect, but I also feel like we're leaving drivers
> > potentially being interested in DRM_SCHED_POLICY_SINGLE_ENTITY a bit alone on that. I think
> > we should probably give drivers a bit more guidance on how to do that.
> > 
> > Currently, I see two approaches.
> > 
> > (1) Do what XE does, which means letting the scheduler run dry, which includes both the
> >      entity's job queue and the schedulers pending_list. While jobs from the entity's queue
> >      aren't pushing any more work to the ring on tear down, but just "flow through" to get
> >      freed up eventually. (Hopefully I got that right.)
> > 
> > (2) Kill the entity to cleanup jobs from the entity's queue, stop the scheduler and either
> >      just wait for pending jobs or signal them right away and finally free them up.
> > 
> > Actually there'd also be (3), which could be a mix of both, discard the entity's queued jobs,
> > but let the pending_list run dry.
> > 
> > I'm not saying we should provide a whole bunch of infrastructure for drivers, e.g. for (1)
> > as you've mentioned already as well, there is probably not much to generalize anyway. However,
> > I think we should document the options drivers have to tear things down and do enough to
> > enable drivers using any option (as long as we agree it is reasonable).
> > 

Agree we should document this. Agree both ways seem reasonable. Let me
include a patch that documents this in my next rev.

Matt 

> > For Nouveau specifically, I'd probably like to go with (3).
> > 
> > - Danilo
> > 
> > >       spin_unlock(&entity->rq_lock);
> > >       /* Make sure this entity is not used by the scheduler at the moment */
> > > @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > >       dma_fence_put(prev);
> > >   }
> > > +/**
> > > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> > > + * @entity: scheduler entity
> > > + *
> > > + * Returns GPU scheduler for the entity
> > > + */
> > > +struct drm_gpu_scheduler *
> > > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> > > +{
> > > +    bool single_entity = !!entity->single_sched;
> > > +
> > > +    return single_entity ? entity->single_sched : entity->rq->sched;
> > > +}
> > > +
> > >   /**
> > >    * drm_sched_entity_flush - Flush a context entity
> > >    *
> > > @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
> > >       struct drm_gpu_scheduler *sched;
> > >       struct task_struct *last_user;
> > >       long ret = timeout;
> > > +    bool single_entity = !!entity->single_sched;
> > > -    if (!entity->rq)
> > > +    if (!entity->rq && !single_entity)
> > >           return 0;
> > > -    sched = entity->rq->sched;
> > > +    sched = drm_sched_entity_to_scheduler(entity);
> > >       /**
> > >        * The client will not queue more IBs during this fini, consume existing
> > >        * queued IBs or discard them on SIGKILL
> > > @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> > >           container_of(cb, struct drm_sched_entity, cb);
> > >       drm_sched_entity_clear_dep(f, cb);
> > > -    drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > > +    drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
> > >   }
> > >   /**
> > > @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> > >   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> > >                      enum drm_sched_priority priority)
> > >   {
> > > +    WARN_ON(!!entity->single_sched);
> > > +
> > >       spin_lock(&entity->rq_lock);
> > >       entity->priority = priority;
> > >       spin_unlock(&entity->rq_lock);
> > > @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> > >    */
> > >   static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> > >   {
> > > -    struct drm_gpu_scheduler *sched = entity->rq->sched;
> > > +    struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
> > >       struct dma_fence *fence = entity->dependency;
> > >       struct drm_sched_fence *s_fence;
> > > @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > >        * Update the entity's location in the min heap according to
> > >        * the timestamp of the next job, if any.
> > >        */
> > > -    if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> > > +    if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> > > +        DRM_SCHED_POLICY_FIFO) {
> > >           struct drm_sched_job *next;
> > >           next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > > @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> > >       struct drm_gpu_scheduler *sched;
> > >       struct drm_sched_rq *rq;
> > > +    WARN_ON(!!entity->single_sched);
> > > +
> > >       /* single possible engine and already selected */
> > >       if (!entity->sched_list)
> > >           return;
> > > @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> > >   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > >   {
> > >       struct drm_sched_entity *entity = sched_job->entity;
> > > -    bool first, fifo = entity->rq->sched->sched_policy ==
> > > -        DRM_SCHED_POLICY_FIFO;
> > > +    bool single_entity = !!entity->single_sched;
> > > +    bool first;
> > >       ktime_t submit_ts;
> > >       trace_drm_sched_job(sched_job, entity);
> > > -    atomic_inc(entity->rq->sched->score);
> > > +    if (!single_entity)
> > > +        atomic_inc(entity->rq->sched->score);
> > >       WRITE_ONCE(entity->last_user, current->group_leader);
> > >       /*
> > > @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > >       /* first job wakes up scheduler */
> > >       if (first) {
> > > +        struct drm_gpu_scheduler *sched =
> > > +            drm_sched_entity_to_scheduler(entity);
> > > +        bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
> > > +
> > >           /* Add the entity to the run queue */
> > >           spin_lock(&entity->rq_lock);
> > >           if (entity->stopped) {
> > > @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > >               return;
> > >           }
> > > -        drm_sched_rq_add_entity(entity->rq, entity);
> > > +        if (!single_entity)
> > > +            drm_sched_rq_add_entity(entity->rq, entity);
> > >           spin_unlock(&entity->rq_lock);
> > >           if (fifo)
> > >               drm_sched_rq_update_fifo(entity, submit_ts);
> > > -        drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > > +        drm_sched_wakeup_if_can_queue(sched);
> > >       }
> > >   }
> > >   EXPORT_SYMBOL(drm_sched_entity_push_job);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > > index 06cedfe4b486..f6b926f5e188 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> > >   {
> > >       unsigned seq;
> > > -    fence->sched = entity->rq->sched;
> > > +    fence->sched = drm_sched_entity_to_scheduler(entity);
> > >       seq = atomic_inc_return(&entity->fence_seq);
> > >       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> > >                  &fence->lock, entity->fence_context, seq);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 545d5298c086..cede47afc800 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -32,7 +32,8 @@
> > >    * backend operations to the scheduler like submitting a job to hardware run queue,
> > >    * returning the dependencies of a job etc.
> > >    *
> > > - * The organisation of the scheduler is the following:
> > > + * The organisation of the scheduler is the following for scheduling policies
> > > + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
> > >    *
> > >    * 1. Each hw run queue has one scheduler
> > >    * 2. Each scheduler has multiple run queues with different priorities
> > > @@ -43,6 +44,23 @@
> > >    *
> > >    * The jobs in a entity are always scheduled in the order that they were pushed.
> > >    *
> > > + * The organisation of the scheduler is the following for scheduling policy
> > > + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> > > + *
> > > + * 1. One to one relationship between scheduler and entity
> > > + * 2. No priorities implemented per scheduler (single job queue)
> > > + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> > > + * 4. The entity maintains a queue of jobs that will be scheduled on the
> > > + * hardware
> > > + *
> > > + * The jobs in a entity are always scheduled in the order that they were pushed
> > > + * regardless of scheduling policy.
> > > + *
> > > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
> > > + * when the KMD is scheduling directly on the hardware while a scheduling policy
> > > + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
> > > + * firmware scheduler.
> > > + *
> > >    * Note that once a job was taken from the entities queue and pushed to the
> > >    * hardware, i.e. the pending queue, the entity must not be referenced anymore
> > >    * through the jobs entity pointer.
> > > @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> > >   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> > >   {
> > > +    WARN_ON(!!entity->single_sched);
> > > +
> > >       /*
> > >        * Both locks need to be grabbed, one to protect from entity->rq change
> > >        * for entity from within concurrent drm_sched_entity_select_rq and the
> > > @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> > >   static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> > >                     struct drm_sched_rq *rq)
> > >   {
> > > +    WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > > +
> > >       spin_lock_init(&rq->lock);
> > >       INIT_LIST_HEAD(&rq->entities);
> > >       rq->rb_tree_root = RB_ROOT_CACHED;
> > > @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> > >   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > >                    struct drm_sched_entity *entity)
> > >   {
> > > +    WARN_ON(!!entity->single_sched);
> > > +
> > >       if (!list_empty(&entity->list))
> > >           return;
> > > @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > >   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > >                   struct drm_sched_entity *entity)
> > >   {
> > > +    WARN_ON(!!entity->single_sched);
> > > +
> > >       if (list_empty(&entity->list))
> > >           return;
> > > @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> > >                  struct drm_sched_entity *entity,
> > >                  void *owner)
> > >   {
> > > -    if (!entity->rq)
> > > +    if (!entity->rq && !entity->single_sched)
> > >           return -ENOENT;
> > >       job->entity = entity;
> > > @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> > >   {
> > >       struct drm_gpu_scheduler *sched;
> > >       struct drm_sched_entity *entity = job->entity;
> > > +    bool single_entity = !!entity->single_sched;
> > >       BUG_ON(!entity);
> > > -    drm_sched_entity_select_rq(entity);
> > > -    sched = entity->rq->sched;
> > > +    if (!single_entity)
> > > +        drm_sched_entity_select_rq(entity);
> > > +    sched = drm_sched_entity_to_scheduler(entity);
> > >       job->sched = sched;
> > > -    job->s_priority = entity->rq - sched->sched_rq;
> > > +    if (!single_entity)
> > > +        job->s_priority = entity->rq - sched->sched_rq;
> > >       job->id = atomic64_inc_return(&sched->job_id_count);
> > >       drm_sched_fence_init(job->s_fence, job->entity);
> > > @@ -896,6 +925,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > >       if (!drm_sched_can_queue(sched))
> > >           return NULL;
> > > +    if (sched->single_entity) {
> > > +        if (drm_sched_entity_is_ready(sched->single_entity))
> > > +            return sched->single_entity;
> > > +
> > > +        return NULL;
> > > +    }
> > > +
> > >       /* Kernel run queue has higher priority than normal run queue*/
> > >       for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > >           entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > @@ -1091,6 +1127,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >           return -EINVAL;
> > >       sched->ops = ops;
> > > +    sched->single_entity = NULL;
> > >       sched->hw_submission_limit = hw_submission;
> > >       sched->name = name;
> > >       sched->submit_wq = submit_wq ? : system_wq;
> > > @@ -1103,7 +1140,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >           sched->sched_policy = default_drm_sched_policy;
> > >       else
> > >           sched->sched_policy = sched_policy;
> > > -    for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > > +    for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
> > > +         DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
> > > +         i++)
> > >           drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > >       init_waitqueue_head(&sched->job_scheduled);
> > > @@ -1135,7 +1174,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > >       drm_sched_submit_stop(sched);
> > > -    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > +    if (sched->single_entity) {
> > > +        spin_lock(&sched->single_entity->rq_lock);
> > > +        sched->single_entity->stopped = true;
> > > +        spin_unlock(&sched->single_entity->rq_lock);
> > > +    }
> > > +
> > > +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
> > > +         DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
> > > +         i--) {
> > >           struct drm_sched_rq *rq = &sched->sched_rq[i];
> > >           spin_lock(&rq->lock);
> > > @@ -1176,6 +1223,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
> > >       struct drm_sched_entity *entity;
> > >       struct drm_gpu_scheduler *sched = bad->sched;
> > > +    WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > > +
> > >       /* don't change @bad's karma if it's from KERNEL RQ,
> > >        * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
> > >        * corrupt but keep in mind that kernel jobs always considered good.
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index 897d52a4ff4f..04eec2d7635f 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -79,6 +79,7 @@ enum drm_sched_policy {
> > >       DRM_SCHED_POLICY_DEFAULT,
> > >       DRM_SCHED_POLICY_RR,
> > >       DRM_SCHED_POLICY_FIFO,
> > > +    DRM_SCHED_POLICY_SINGLE_ENTITY,
> > >       DRM_SCHED_POLICY_COUNT,
> > >   };
> > > @@ -112,6 +113,9 @@ struct drm_sched_entity {
> > >        */
> > >       struct drm_sched_rq        *rq;
> > > +    /** @single_sched: Single scheduler */
> > > +    struct drm_gpu_scheduler    *single_sched;
> > > +
> > >       /**
> > >        * @sched_list:
> > >        *
> > > @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
> > >    * struct drm_gpu_scheduler - scheduler instance-specific data
> > >    *
> > >    * @ops: backend operations provided by the driver.
> > > + * @single_entity: Single entity for the scheduler
> > >    * @hw_submission_limit: the max size of the hardware queue.
> > >    * @timeout: the time after which a job is removed from the scheduler.
> > >    * @name: name of the ring for which this scheduler is being used.
> > > @@ -503,6 +508,7 @@ struct drm_sched_backend_ops {
> > >    */
> > >   struct drm_gpu_scheduler {
> > >       const struct drm_sched_backend_ops    *ops;
> > > +    struct drm_sched_entity        *single_entity;
> > >       uint32_t            hw_submission_limit;
> > >       long                timeout;
> > >       const char            *name;
> > > @@ -585,6 +591,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> > >                 struct drm_gpu_scheduler **sched_list,
> > >                 unsigned int num_sched_list,
> > >                 atomic_t *guilty);
> > > +struct drm_gpu_scheduler *
> > > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
> > >   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
> > >   void drm_sched_entity_fini(struct drm_sched_entity *entity);
> > >   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> 
