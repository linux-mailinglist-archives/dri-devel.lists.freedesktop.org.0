Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25307CAD02
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7A610E21C;
	Mon, 16 Oct 2023 15:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866C810E21A;
 Mon, 16 Oct 2023 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697469045; x=1729005045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hFqnstEtSeJptNv6nW2oagQ6YvkJulBIW/EkcJRTuv8=;
 b=AUN6OlXgAsjBQRhoOEIlZjLjdqJnU1DZjP7xDrSJ13maz4nnblrzBuLb
 Z0h+OC4Uf2etB+FLafZtcxp4eZC/HlV4LTdGuRqbLMulGVH3G8/Fbb90x
 pe2Fb2B1BssN3IPFIO8rFuD8u8z1p7sVb9n1aenEOEjzUaOYO7jiIyoZn
 td2hOMlWe0E8gmJaB0jcUWRJa2eWzY5Y2S8KmMxfQ/2c47NMWof+cuinv
 qlDVrQhZxgFgbOKIaJcHVB1e8/uQe6/f+C1S4ZTZk2YeSpharfkGMwbeE
 VDbfNyZU6a9U+le6/cdDdbdJKQR0o5Y68XcdzDorWN7tQVF6uELQsk3ye w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471772150"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="471772150"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:10:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3557633"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:09:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:10:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:10:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx9QoPexX2+rtP7YQEwIJzUvE1ul5cHkiQR96xUF+PHQw4H/7LIDmqKvJ0LcNB8rGT5iKxTvCYEMi0/DJxD1BGABYwGcBanye8KnenKIUmtUwOm9Z7Hb4qVyq6uo0pTH/vj6BnhPDID5NMsMyd6njBUTJYe8aC64IfMF7QgVbAkC1gu5o/saisUhk3ujlSw6BGFFgmzqR+sJPABMmNjnxCAlSp/ucUaJLCGLRWFYB73C5sno363CwJR3O6XtTZzSs9iikhnwObHBL2//lDy2U6GHjj/Qa8QHcSK2IuLwgBN1yG6q6t+cNfpzKMUh43UwsJFs+wMsavd5BhaBddKyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEXbqZIgLrYho3jjqZZgChMudKbfNUDSyi2SZtsZuE8=;
 b=S7hjvf+orGkJTwwqdQtPYgC7Wc+ALwxoWHgVF5ZQgqqiEx5juDsJpdodyTSploA05d5/XAwhLgdp6vVh1Fh3f5mnT/Bn81dh2kdkh29WyUfnoQ5bEIpLljIawEX+42TZNc4DFK5aFOV18LKiRk8YxdukkF3uloAmnhT0aUozKtCYLWi9t4Pa3vf8FDSrydqVQbPI+ib0kM91ZL3tNj0vqzr8UPO72m71TD8Yd9quxpvrOKlmsKsigOttPlm5RZP38Z8X+Pc1Y7nLodwoEGVeQUncBVH4KUTUgZxHnRI5s648iwX+tdKVLJn1V0f4Bz/oA5QJ/zIit1lOcyCbdp8TKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:10:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:10:25 +0000
Date: Mon, 16 Oct 2023 15:08:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Message-ID: <ZS1SC2LxOSGZ8Su8@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
 <161b9b56-3938-48b1-a3b9-1ca55fc2134a@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <161b9b56-3938-48b1-a3b9-1ca55fc2134a@amd.com>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cef9022-c3b5-454d-b134-08dbce5a062c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOi+yZ64fmj5CuRFH0hgGPHu7zPyzvMS0pfUsfT5r1MQDlDHYzYNnmByoxv/0wd4X0LaZFsu0+8MQsK/TKmO+5GkuaV8U+7SpaFmwSH7+JNVucZuspOlSNjfYN7StA6SLxiERywODiFLo0UVArjcx3srrt24xsVwhibxhFARhyXycKqTXjV0+L0Oi7SnVYrP8vH+05Ssj/zGPa4ZTwML69tQCF0qullARVKFWjANkgIT74zDaWOJPta00mONWjXqPew5g5qnv6wzz/zf2aTSt/ethfQiwXZWvIU6iS2qRDB+5GqE2cqet+Chc5HU83wvEu8jCgfiPGxfA2OOLw2KZPhrqYqd+S2y+dbZJj0DB+JRDyc2qlwqFtQzvqGBSyNtS3pSaO/9WmRAfsILlc4or3PO7kCvpybeaygOd3kguhYz3RtW9n53MXNxbv3Df8roV7iwEPhmx71gDpt63iGuxjVT48Ey/l+npyhJjXKGX5DECWlJyJG3Nm9BkYdd3mKQacETp4yRP7+kKG43d+XOmmaoXRJHxb9e8cjfg/UmPyVP08knQcd308zSPGJmPNJnvR7oZ8A3RYHb+ugpHW2aFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(66899024)(6486002)(966005)(82960400001)(38100700002)(83380400001)(6666004)(6512007)(26005)(6506007)(66946007)(66556008)(66476007)(6916009)(316002)(478600001)(53546011)(2906002)(44832011)(4001150100001)(30864003)(41300700001)(7416002)(86362001)(5660300002)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/lM+swKmxwLl1TD+xm7xar8tywe74P1Qn8JF1057iamH6kSqqipaAFSYTth?=
 =?us-ascii?Q?rDrlOR1T53xke8bg6TCpQ6E68lpeZw8Xn3ok/ZHEK6jNg0Rv9YD9Zef92GRV?=
 =?us-ascii?Q?cuahqLg3hJOzMPGIojnYCuchGBIBApxcqV0mukkOB+4BnroHkO0pjXtSXt4Y?=
 =?us-ascii?Q?P0oQmfJnvW4Q9P8NsHDbM7VWD14eQNxbAtNKsbNBDQoKlY9lLEpYcWJ8xsIG?=
 =?us-ascii?Q?Z+LPOrR6CMAH+hCvOa3RBsvPvaCpIBY/sUFgqe/dol10sTkSEgFSgA93cPv8?=
 =?us-ascii?Q?hajbZr01b1tU1GrmafkKrSdD2OWMr8CEv+RZyqef4OOwF2fGPyJT7ShZALRp?=
 =?us-ascii?Q?28hpEH+76OvrXBGLBtPZ1+DzET3MLa5kEYJoZWRCmkOm2C59Y+ZTIuxtBUET?=
 =?us-ascii?Q?Q/MLbgk80FNZyFdcbTzo9uAN7iUhPa3lRmwRdfcIRegcLL46MHwu18kZNfg8?=
 =?us-ascii?Q?lnrZmcuVroOkfpeHoS0BXxjy9bvhgVr/3U93IGO2UT8An+cpXPZ6dMenbKID?=
 =?us-ascii?Q?bqAN0ZYc96jvv6+UZ1C2W5y0JMN85zJSNpFWsntVTd7XrsE3zUvAftULrvby?=
 =?us-ascii?Q?PFOmjcOPGqYmXqv6zM4f8VEuuph6yoRDeXe9xw0SpFTIu/42+SIQVH38mCKM?=
 =?us-ascii?Q?jUodO/iSFkD9yZJ06477cMfT1sERMmcPVjeeUcHfax0cqpdC7WtLOkN5sjXC?=
 =?us-ascii?Q?8xP2STiF+AKsReYel6X9ZSXrOFKbrk1OOOeomUvG6sMyCxnVuWAAQvsvgux8?=
 =?us-ascii?Q?JzgAAfrykQJYbj1nqh3OXvj5kGf6R8a1zU5GcnR3ySNn4GrsxAAbeZEnvr2r?=
 =?us-ascii?Q?6KMOSI3M9/qdZIaQWBtIciIWapHTyR2lO7g4p2IMnAMABUTx0oK4tyZPJfw9?=
 =?us-ascii?Q?46HvjDtM8sgBpxv0RfYYi0e4HlvcQXuWOvAajhUbLSWoPrNjELu4jfhUo/xR?=
 =?us-ascii?Q?ETJEoenGZ+AqibR1B9xQoBCV9KaKQ4Jxlf8TxXSpmBHA/TiJk8qT4j7aFgto?=
 =?us-ascii?Q?YhewC/JLA20NBpW/n9dpdqNb9AzptwGZ8buIVoZ6th6hSXsp/04VFcm4HVsY?=
 =?us-ascii?Q?Reg/yjr/a88OoUUN199uk9e0e318m+KOwPtnlR6A4PK8Jt1z7W/9LyKuLP5R?=
 =?us-ascii?Q?Px7rLPElkK5kwqR3GeoJvy5wusO6aDkUNWo70c1yP1QY64CYVrmiVRv5qz/+?=
 =?us-ascii?Q?1OBT7fxi6oiGDKYr6h6yqUobXTJI188WxTkN1mn9fJ9h7i+G3VmTjUnLtyRK?=
 =?us-ascii?Q?B5bkCXMD4CiBu/vei9bIiGxWfIsKhVOQ8n7G4f6/IETLOlIhzSbKNr9r7LJw?=
 =?us-ascii?Q?OO3cj8GAInUDTawhZGdcfvyt1J4+Ik4rO2oAMKU5j7gK2eZXRxHPIqClaXsY?=
 =?us-ascii?Q?tya/QKWK62jSRdbXaV/TatGEH/GHqyrIZR7wVymYt9cXvSBTj1zYXO3sIZ33?=
 =?us-ascii?Q?vrG9iyCi1ck2YcwZtHdxqx/3mCyMiGy+08Ki5GKs1QGveUdXBjRq+xsSoq5U?=
 =?us-ascii?Q?fiJtvsnqsrDLTGbNhiKnFgqRi9JVsQMQ+BbBuhJpK2q+pWErEMzdS8ALAYuE?=
 =?us-ascii?Q?cwRREIlcnEqC5d1QYrRVKQlVNPBAlmgUu2sIIaavQ+syPGC8eHQ3ibyNlx07?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cef9022-c3b5-454d-b134-08dbce5a062c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:10:25.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtEulMd9NVopboKefvfPKk2tdtGW/WvKDGyKYyMJLhQG3MIsD915emHxPd4ouDCWwdjVYReth8VvENIpI2sylw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
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
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 01:45:08PM -0400, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler so user can control each scheduler policy.
> > 
> > v2:
> >   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
> >   - Only include policy in scheduler (Luben)
> > v3:
> >   - use a ternary operator as opposed to an if-control (Luben)
> >   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
> >   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
> >   - Update commit message (Boris)
> >   - Fix v3d build (CI)
> >   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
> >   - Don't update modparam doc (Luben)
> > v4:
> >   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
> > 
> > Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Hi,
> 
> Forgot to mention this, but it is a very important process to note,
> is that one should _never_ add someone else's R-V tag, _*UNLESS*_
> a) there's an email from the person giving their review or ack, and
> b) you're the one pushing the patch set into the tree.
> If you're not the one pushing it into the tree, the maintainer will
> add their R-V (after their reply-to follow-up email--see below),
> including a Link: tag when they do "git am" after it's been all reviewed.
> 
> And there's a reason for this.
> 
> The reason is that when kernel maintainers (especially DRM via dim[1]) push
> patches into the kernel, we want to add a Link: tag [2,3] pointing to
> the thread where a) the patch was posted and b) where the reviewer gave
> their Reviewed-by to the patch in a reply-all email, and at this moment
> there is no such email for this patch.
> 
> When a maintainer says "Do X, Y, Z, for an immediate R-V", this means
> do those things, post it, and get a reply from the maintainer with an
> R-V. This records how it happened and is very helpful when doing
> data mining on how and why the code changed, via what patches, etc.
> 
> I suspect there might be a v6, and we can do the R-V/Ack the right way
> at that time. No big deal, but it's good to know in one place as it
> is a bit scatter here and there in the kernel-doc.
> 
> [1] https://gitlab.freedesktop.org/drm/maintainer-tools/
> [2] git am --message-id
> [3] https://docs.kernel.org/maintainer/
> -- 
> Regards,
> Luben
> 

Again thanks for all the details of the development flow. Will read up
on all of this.

Just to be to clear, when I post a rev6 I should not include a RB in the
patches that recieved an RB in rev5 (or prior revs)? Rather a Cc would
be better to alert the reviewer of another rev?

Matt 

> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_main.c     | 19 ++++++++++++-----
> >  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >  10 files changed, 68 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index b54c4d771104..e4e6f91450a4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2283,6 +2283,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >  				   ring->num_hw_submission, 0,
> >  				   timeout, adev->reset_domain->wq,
> >  				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_UNSET,
> >  				   adev->dev);
> >  		if (r) {
> >  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 618a804ddc34..15b0e2f1abe5 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >  			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
> > +			     gpu->dev);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index 8d858aed0e56..50c2075228aa 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >  			      lima_job_hang_limit,
> >  			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, DRM_SCHED_POLICY_UNSET,
> > +			      pipe->ldev->dev);
> >  }
> >  
> >  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 1097f8e93d6b..173ad2f17c50 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >  			     num_hw_submissions, 0, sched_timeout,
> >  			     NULL, NULL, to_msm_bo(ring->bo)->name,
> > -			     gpu->dev->dev);
> > +			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
> >  	if (ret) {
> >  		goto fail;
> >  	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 4c959dec42b3..c4e09d2e77f9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -437,7 +437,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >  
> >  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> > +			      NULL, NULL, "nouveau_sched",
> > +			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
> >  }
> >  
> >  void nouveau_sched_fini(struct nouveau_drm *drm)
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 934b7b930c76..95330ff402ba 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -856,7 +856,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  				     nentries, 0,
> >  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >  				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
> > +				     pfdev->dev);
> >  		if (ret) {
> >  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >  			goto err_sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index a42763e1429d..cf42e2265d64 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > +static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
> > +				      unsigned int num_sched_list)
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All schedule policies must match */
> > +	for (i = 1; i < num_sched_list; ++i)
> > +		if (sched_policy != sched_list[i]->sched_policy)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_init - Init a context entity used by scheduler when
> >   * submit to HW ring.
> > @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  			  unsigned int num_sched_list,
> >  			  atomic_t *guilty)
> >  {
> > -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> > +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> > +	    drm_sched_policy_mismatch(sched_list, num_sched_list))
> >  		return -EINVAL;
> >  
> >  	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  {
> >  	struct drm_sched_entity *entity = sched_job->entity;
> > -	bool first;
> > +	bool first, fifo = entity->rq->sched->sched_policy ==
> > +		DRM_SCHED_POLICY_FIFO;
> >  	ktime_t submit_ts;
> >  
> >  	trace_drm_sched_job(sched_job, entity);
> > @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  		drm_sched_rq_add_entity(entity->rq, entity);
> >  		spin_unlock(&entity->rq_lock);
> >  
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (fifo)
> >  			drm_sched_rq_update_fifo(entity, submit_ts);
> >  
> >  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 8b1d52cff1e9..150e5330f0fa 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -66,14 +66,14 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > +int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
> >  
> >  /**
> >   * DOC: sched_policy (int)
> >   * Used to override default entities scheduling policy in a run queue.
> >   */
> >  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
> >  
> >  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >  							    const struct rb_node *b)
> > @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >  	if (rq->current_entity == entity)
> >  		rq->current_entity = NULL;
> >  
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >  		drm_sched_rq_remove_fifo_locked(entity);
> >  
> >  	spin_unlock(&rq->lock);
> > @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >  		if (entity)
> > @@ -1072,6 +1072,7 @@ static void drm_sched_main(struct work_struct *w)
> >   *		used
> >   * @score: optional score atomic shared with other schedulers
> >   * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >   * @dev: target &struct device
> >   *
> >   * Return 0 on success, otherwise error code.
> > @@ -1081,9 +1082,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >  {
> >  	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> > +		return -EINVAL;
> > +
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > @@ -1102,6 +1109,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	sched->hang_limit = hang_limit;
> >  	sched->score = score ? score : &sched->_score;
> >  	sched->dev = dev;
> > +	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> > +		drm_sched_policy_default : sched_policy;
> >  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..dec89c5b8cb1 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_bin_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_render_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     NULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_tfu_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_csd_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
> > +				     v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_cache_clean_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  	}
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 211bd3cdabdc..320f0a720486 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -72,11 +72,15 @@ enum drm_sched_priority {
> >  	DRM_SCHED_PRIORITY_UNSET = -2
> >  };
> >  
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > -extern int drm_sched_policy;
> > -
> > -#define DRM_SCHED_POLICY_RR    0
> > -#define DRM_SCHED_POLICY_FIFO  1
> > +/* Used to chose default scheduling policy*/
> > +extern int default_drm_sched_policy;
> > +
> > +enum drm_sched_policy {
> > +	DRM_SCHED_POLICY_UNSET,
> > +	DRM_SCHED_POLICY_RR,
> > +	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_COUNT,
> > +};
> >  
> >  /**
> >   * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
> >   *              guilty and it will no longer be considered for scheduling.
> >   * @score: score to help loadbalancer pick a idle sched
> >   * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> >   * @pause_submit: pause queuing of @work_submit on @submit_wq
> > @@ -515,6 +520,7 @@ struct drm_gpu_scheduler {
> >  	int				hang_limit;
> >  	atomic_t                        *score;
> >  	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >  	bool				ready;
> >  	bool				free_guilty;
> >  	bool				pause_submit;
> > @@ -527,7 +533,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   uint32_t hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >  
> >  void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >  int drm_sched_job_init(struct drm_sched_job *job,
> 
