Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DA8C04B8
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF5310E73E;
	Wed,  8 May 2024 19:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCB/JscN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3600610E9ED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715195295; x=1746731295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fKjnJBhfilCb9SYLPNVZ0NOdqLvQJSMjKhLu3QtyZ9w=;
 b=CCB/JscNCmId2Igz5so3MwVLb4SCQdHVNC4hEGWWCod5iidPZ4Vk9YIm
 Te+Kwcf9g54kT2vpSbMNfrbmjeKHjbJ+VBD2LgfOjuvYICWJre41SfQFy
 RhkKnq/Dnoo1thpj80vJD3J/wXtUeqM7zXhKK2OH3dxRff2EtDaM7T+3m
 zfq93C1O/NOeZ/jaE0rK4DlH1vvHqIk6drYrEISSKM2u0mlz33WuKuDjJ
 Csj0Laq+OoqL/fCxuD7ewhKSaeVv4+rvRYJu5a2CkTAOGrBgjtf7tFLWv
 0GXE28QtW5u98iEzhynqcZ4Cvut/Qdr2P1w2NsJWAuhyUrPEXKb7gBNN5 g==;
X-CSE-ConnectionGUID: +MBydP3LQrKck4OObxJF5A==
X-CSE-MsgGUID: EAWlnx8ARaKvadIyISF4Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10950255"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10950255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:08:14 -0700
X-CSE-ConnectionGUID: UeI1+29RSZiQipQIHUdeGw==
X-CSE-MsgGUID: zozjPM7VQ+aik4efJ0rGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28869040"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:08:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:08:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:08:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:08:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNnhwE4sIgd7RQPLhQQl60Tk3GgFwNwxc7sxpUa01GTgxauOozr+2O6iXtoCYupDPxcSOA9kmaeOhjgZZt5Z3k4RX2QthX5O3ryzTc8p7/NFaFxfzVef68gahxoYCNCHM2O2KM/blc1hS5c650+quAoXhnrml/jtQFl6ktZJnIOMLIJqkNNPyVTpPw9TEliEtUqoeaVipyGQpE+A2lhMG0diP3KtXCNOdRXLqB3KA9lQ6gXehUfd27xfEzABWpgrtOavbVooV9EbiNU570VAXvaJ6obvEJmINz/yV0UEWLiZ007YwhrE1hKkU1C3B6Di3OrB7R4fSnmne92QO0nCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADK9NhSopncQJfMhyTWwY3YcAdL1E8gsP6OU/fWxWJM=;
 b=MwM0HC3jVyk2IvcJ3Wk9CE3BPD9elnRE1yBfUN6KLfexaLDM4Bmt7D/+O+Twgxiq6IqKNM6H59xBBpP3tOzVNpcYU28ZMEVcMzrJnr9GNM6NjLdQuK1AAaBGavHe2UtYSkjd3qwAQWpU/pZyRb/CIINMibm9cGsSxpnjfqDT14/9kRnYNgNSHxyNkkZMp3a+V90zBkLP2oAj7XHYI6Xw6iomHREQxHlu85ImDG6thHRHYyct2CvACeGOytmiXJwxf4RNexGDoV26WC28Q+R0pvqpG79SdoFTsRUPnpPZJR7N8T4zPohJjp4Pz63XYfwfeXhCjQVjtwCLMdMFKVQ7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 CH0PR11MB8088.namprd11.prod.outlook.com (2603:10b6:610:184::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.45; Wed, 8 May 2024 19:08:11 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::1923:3601:c44d:17c1]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::1923:3601:c44d:17c1%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:08:11 +0000
Date: Wed, 8 May 2024 19:07:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: drm scheduler and wq flavours
Message-ID: <ZjvNiD4CL0fGX1w8@DUT025-TGLU.fm.intel.com>
References: <7236d76a-8e6d-4a8e-9e4e-e2644c5df2d7@igalia.com>
 <ZjlmZHBMfK9fld9c@DUT025-TGLU.fm.intel.com>
 <55e260b7-12d3-462b-aa08-a939a4ee67ef@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55e260b7-12d3-462b-aa08-a939a4ee67ef@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|CH0PR11MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7799c165-771d-4869-7351-08dc6f92343a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XShpyBrPjWVRmho3d1Tg17W7YlBoZTlwZe5itNZW60SqJ1SvGiuNIRxsYbAI?=
 =?us-ascii?Q?g/tZAGoINA29XVxFMfroO96Zwyjn6Dp6TS+9H/3UDSa0TczjDzDPbWk1F/Km?=
 =?us-ascii?Q?YDf5+k3+FdM315XJ3rIqD3sWtBB7o7/x00BSewKN8x41xc5HrdyG4BgsZ4e7?=
 =?us-ascii?Q?h6SpGFcA6ZgESdR5wCyrK4DxC97kZwVej6uz3CmyCPZGSM+GrnDKEVNi3s/D?=
 =?us-ascii?Q?6jkofAomR/6gl9N+6VljlYQ0BO7EmadUDQk+2nblD09UVkY/nQg1eUNoB9tz?=
 =?us-ascii?Q?AiqNAeA9YFRTHuuUk9jbnhIvp6/UKxRSQ01tiPMUfYHBJy/JSu8+KklxIyCz?=
 =?us-ascii?Q?8ojkuevQWXlsfyLVx3N+Rr6hZcxJKDOfnidgf4rIRhqthQfXBvYsa6Yi1KEs?=
 =?us-ascii?Q?fUKC9iqWpLxot/hjdLgz4cOMc+27nG1nyJukf1j2UF88tpK7WCT6I7ypvB2V?=
 =?us-ascii?Q?SAADXBiOWihil7eyYCg3nfzSa7S7YjVR44tQ0q66/1Vd6IwXI88xf6z845Gw?=
 =?us-ascii?Q?tsPeTk1ed/HZvF9Jv2y0RA6sAHpwpE+JX3IbsVJ50iQRObR5NbCRxqk+GI2L?=
 =?us-ascii?Q?vH3LybN6z1mZvktPOirBDJBTjpOLX3smvDIhoNtpIL2pRNEIB+Av05rZoXFS?=
 =?us-ascii?Q?G1exTBmbluvPgC3SlMy9ys0CmXlExYZdE2+e5ZqwY5vexUUqh31w2VgUWqKy?=
 =?us-ascii?Q?x0niTJZaUVNUm7dcU1ltrgidKGPb2HspBdeWIW0/kxGds2RqlFekkN/lLt/n?=
 =?us-ascii?Q?2T7o8TK8D7jUR+c6bMsZCkvSRNn921d6Abkx8uGyBvR2Hh7a28/syl6qU8fM?=
 =?us-ascii?Q?hWqDfgfUEpo5wdfgy2ScxQM5CfdusG3kg6FvQvL5/NrKPAXUzeT+CTNw3e8u?=
 =?us-ascii?Q?q3TigHPMLV8cw/fYdy+1m/D2pKy/xF6gpJEpbf2DFZO31n+QMJ2jy6BDmQ0H?=
 =?us-ascii?Q?Pjyd92kHJj1K3qrxj12qdqvh9/gOYIysMRZsipRUx0MB9TmFjH95WtodTKD4?=
 =?us-ascii?Q?CG+E5u5sWCPUNCDmckO0AalH1aU0lz4VIvBtGYbcnKIyiLIONdWzVNbeOXXU?=
 =?us-ascii?Q?CtCsP9YPEl6bWfUZUlGF9YTqa4YKvyhVkKPs/D87yHoj4Eqd0oFVCC+nH6Lv?=
 =?us-ascii?Q?VzokiT36Pjs1p3EB56LSr0/Ai/3RLpwloyd19x3uHkUYs92x2AoVWqEzftBN?=
 =?us-ascii?Q?koyHDHjO/UOxL1U+XquXo9EGK3eDIWvxY1QKcIxBEbUZgh23XlTYsZcypQ6s?=
 =?us-ascii?Q?0X7nLOUaKL7y291Crb4f5Q/LDbqqIDomd/cX7z77Cg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFdzzQf1z2b0jlGEWYH0xOaITQZmKlO8Bh0qOCMPXC+kcx+lIMYoitS0bX2K?=
 =?us-ascii?Q?Nzo6BVo5+/00paB81GzDc7WHOKIUhP3yt3uTldrUE3fynyXbN89GAc1b+Zby?=
 =?us-ascii?Q?wPU+/G272el02mCqauyDGVUZXW3buprI55GpHCmxpiW2mgvKlIkaMhGcHYLn?=
 =?us-ascii?Q?WAjR+SSptYiOSNZA0bGcxHbfBiDVn+5MPw1TjVxgsKXtISfR6Gg2QI1q0GR8?=
 =?us-ascii?Q?+98cFKqvf5n7d6djEwVMc8aemve7Sq2JgFFugfYEmbJvHsyy+cbYQ2umakYd?=
 =?us-ascii?Q?SdinjfyNl3HY6/j9OEqvTpDK+WqfdY2S60AD7wmlMe0qv9PHNekUUGWc2XfO?=
 =?us-ascii?Q?RKXuAzBar4WjstvegXd6LgwrbZrD6VIirHjNN/xCIeFm/lxARMxCQBhtAKMd?=
 =?us-ascii?Q?MkNHsF+adgcD1bnS2sODsjJGhJX9SW6oyQiLQnAbQP7JoC5PgK4Hk19GkYMb?=
 =?us-ascii?Q?8miOnANEsr/dpWoAtr5VdUp/skKBC46G6NWFfTEMNOOaaekDuKSqE2ri5OOo?=
 =?us-ascii?Q?hvds9MTmtsVKML/yZYRf/7haJEjgOGkahDJaG9ys9f+dvmsYmK4SdPyTuimo?=
 =?us-ascii?Q?3QaxrjXZ0s3akpOHfpuZLCAd2rkynrYfrVFiehsogZVtkCaTsQOFbEzLwti+?=
 =?us-ascii?Q?EGKCKlW5LXA3pZ8b66EP4umuIYxsIXcy0j2qTGGaqcgYYLGMEK2bmQRffGQW?=
 =?us-ascii?Q?jRGGVrHlUuRo9tNe9g2hl05XuimFhk+of/ZV2wRsIobQ5oteDv/KtmLgkpzT?=
 =?us-ascii?Q?Un2icACccTRR/+EtbUqg8H8+PvVDtHPpUZ8sWio/CVhEMLqAC3UeciJgU5IM?=
 =?us-ascii?Q?pP6z+F5taWiCFSUi/BiEabJYikO+F4FhzeOvFu3OkNqcBP+3r2niGN3iM/jk?=
 =?us-ascii?Q?0JBpftIMpfdp8TqRRrMjJVrPU6huMrTlm8rL0RA6bsA3uE4US/9lftVAjYfC?=
 =?us-ascii?Q?1f+WwuGj8E2LWsSLaQrPCG4SUllqGf9ubDIwiYM4JuPz0u56Lt8j5Acxjc85?=
 =?us-ascii?Q?u0c/ml6EInnl9mr1BnpHzuvGwFZ8NV0wf4HKsNkoOtdNTsWFfaAwxjRLaHd9?=
 =?us-ascii?Q?b+ho2FlmaKtdRb3AmTZ8YlnWEEeMLj3+0gtQiLQf001w0Bv9z5I4cjCQWEl5?=
 =?us-ascii?Q?g5MuPXlGqna66q1vQWzd/BEOPJPl6YR/keIyC0DV/cf01Oi2EvdXvngKRzjH?=
 =?us-ascii?Q?+FE69pKhjISbxmTOogEzf+kWHbCkBzML/pXbS4jS3ydM2WUKLmsX6Bd9vd58?=
 =?us-ascii?Q?TyiQbbaAgy/hFKCUx6erRzAYMya6BKV8CIbLsB/tREfl9oUO/6TIwKNNWlGU?=
 =?us-ascii?Q?hdCWiMwzIix8YsmUBw52T/ptusGgiatCq0WU49TZgXYluBOqjm68lSwAAUaG?=
 =?us-ascii?Q?1/vteK3UN3EhykCw5uRXFqtxpMXK9MKJL0wtw+STcx8eX+ZLAEsZ2HNYpI2I?=
 =?us-ascii?Q?eimBwGJk8wXutuXsiFOKsbK5j/bfdOfrkdpuWxDyv6fcRxZVdNyxUVjlLrmc?=
 =?us-ascii?Q?ZXKmPWGBQ4u8/1YkIxbdDEnP1Z+7/UmutkgaB++ew0Kxsnhbom6MdkTMZjAD?=
 =?us-ascii?Q?gWO+sWXf3aCJZMBfkYpsG9/2y/MWyrBmYwohhSaHxNpXmBZ4znMYNTQpI7eg?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7799c165-771d-4869-7351-08dc6f92343a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:08:11.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtA1YJj0epbmNgMtcNYhGukfRcehmkBlq4rCs37zwK31F0RfqxaO1PWMd7e+KtmeZtLYwNdTxo1s4XhAMe7aFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8088
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

On Tue, May 07, 2024 at 10:09:18AM +0100, Tvrtko Ursulin wrote:
> 
> On 07/05/2024 00:23, Matthew Brost wrote:
> > On Thu, May 02, 2024 at 03:33:50PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > Hi all,
> > > 
> > > Continuing after the brief IRC discussion yesterday regarding work queues
> > > being prone to deadlocks or not, I had a browse around the code base and
> > > ended up a bit confused.
> > > 
> > > When drm_sched_init documents and allocates an *ordered* wq, if no custom
> > > one was provided, could someone remind me was the ordered property
> > > fundamental for something to work correctly? Like run_job vs free_job
> > > ordering?
> > > 
> > 
> > Before the work queue (kthread design), run_job & free_job were ordered.
> > It was decided to not break this existing behavior.
> 
> Simply for extra paranoia or you remember if there was a reason identified?
> 

Not to break existing behavior. Can dig the entire thread if for
reference if needed.

> > > I ask because it appears different drivers to different things and at the
> > > moment it looks we have all possible combos or ordered/unordered, bound and
> > > unbound, shared or not shared with the timeout wq, or even unbound for the
> > > timeout wq.
> > > 
> > > The drivers worth looking at in this respect are probably nouveau, panthor,
> > > pvr and xe.
> > > 
> > > Nouveau also talks about a depency betwen run_job and free_job and goes to
> > > create two unordered wqs.
> > > 
> > > Then xe looks a bit funky with the workaround/hack for lockep where it
> > > creates 512 work queues and hands them over to user queues in round-robin
> > > fashion. (Instead of default 1:1.) Which I suspect is a problem which should
> > > be applicable for any 1:1 driver given a thorough enough test suite.
> > > 
> > 
> > I think lockdep ran out of chains or something when executing some wild
> > IGT with 1:1. Yes, any driver with a wild enough test would likely hit
> > this lockdep splat too. Using a pool probably is not bad idea either.
> 
> I wonder what is different between that and having a single shared unbound
> queue and let kernel manage the concurrency? Both this..
> 

Each action (run_job, free_job, and Xe specific process msg) has its own
work item on the DRM scheduler work queue. In Xe, these options must be
ordered, or strictly speaking, not executed in parallel within the DRM
sched entity/scheduler. With a single shared unbound queue, this breaks.

> > > So anyway.. ordered vs unordered - drm sched dictated or at driver's choice?
> > > 
> > 
> > Default ordered, driver can override with unordered.
> 
> .. and this, go back to my original question - whether the default queue
> must be ordered or not, or under which circustmances can drivers choose
> unordered. I think in drm_sched_init, where kerneldoc says it will create an
> ordered queue, it would be good to document the rules.
>

Sure. Let me write something up.

Matt

> Regards,
> 
> Tvrtko
