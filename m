Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB4C93425D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 20:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83BB10E323;
	Wed, 17 Jul 2024 18:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maUDOx62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F79D10E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721241709; x=1752777709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bHuTVIwmX/jyLc0HGQvxrpmc7fUsPJrWzIdNlgyhLfs=;
 b=maUDOx62i9eYm+dezcfGLF7ei9jweADVWV+EWGoHzi4Md2qplnbmkGet
 JUsgMmCop2EyvMxsW3hvGffTsnQUpJdI4mgwrY/3S+ETVSehqZMZkNFMS
 HdR6uJfDnktLCnwQyZYP1cMUDjkzFl7ph2WZHKqxw5YFqxKloAxMYnxz/
 YYGKBnM16OIB+TSvOmbnKsINAvNg+9eMALqM4GTA9WVo9Fl6/VnL90O85
 v1B3JrkaQAQ3B/dimejFvC0fZfKIg4IuTtEAnPcBzZPQ/nmoD/AaBS9BZ
 rPSePiY66A8z31Nrl11x8lcr/lfo5HEWytz6VYdwutgVTWupTTEBA/LrZ Q==;
X-CSE-ConnectionGUID: QMhiLwWtR4+6Uu7ZM9IddQ==
X-CSE-MsgGUID: Az+dVHYHQfGLWRZi5SVTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22534345"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="22534345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 11:41:49 -0700
X-CSE-ConnectionGUID: 1+2L63n0SZCftRVpnjGCeQ==
X-CSE-MsgGUID: 4lLDG/LlTVCPIjIES8/14Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51196228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 11:41:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:41:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 11:41:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 11:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7lHNWfxdfVs9rjpoW1dQeugnPZLqMqo1bAaABUtgQkzNjHTue+RQTH5crkM+X6MLm3FRl+BtiJKdyiKD1cBRqM+Jkl0VSSJhNQ7+rJzpEBBgBgI9CZsDyG0K0YtqknS1Pn2aielAucbjqKnhTDoW9xmWeWa0oSnb9Zszeobzgo8tXFiIldNxn/8Rjwpcnk6kylvBCNMwmAKz4mdueY6qq67xZBzeFYJh7tPLWQYrTTIRnplj+J24BECWFs1emwGfynqUG1pvBu8bfNhVPvpV6pHIUIzknTdJnopnGpyeiswS3BlT7rxjsOeN4ZLii+/eVrPVoareTyYVwxUQchnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W7hDVW/ASFRhKmMok2MVpxxT+ovXrWK1dJRUO2Ddt4=;
 b=RBH5l/EEx+R4pboyb6cmfK6M4lQs/mR0sE2q8IN02mlScSvc9dif+d0wsm15vd6yQQH3oUs/gPXrhL6Ac7kjhUGCbzN6kzTScaNpMSBL/oekuMB0bvgwIorYlgD2E6QVy7/eiejphIFWN+hWA4GgqXmOapDR5KLFKIbcxmVGNd3d7D4XWFAUtfKsVMZ3g8H0XmlLg93AIArWmDQBCvgCQ7ceHLr2gU0tQJbiCO2jxY8VBpq8pjqt2zNegi5HcYNwl2keTJY185h5cTAKkN/DdyU8OSs8hxmHEkIrtbzEUN3QV3XIETbacNzX2EJIb3Od4ETKm79VgQ1CFbv+i0VfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 18:41:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 18:41:45 +0000
Date: Wed, 17 Jul 2024 18:40:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/amdgpu: use GEM references instead of TTMs
Message-ID: <ZpgQNtr27H1oNf4i@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-2-christian.koenig@amd.com>
 <ZpbrxAyVTdhkJZ9O@DUT025-TGLU.fm.intel.com>
 <e4349837-8b5c-48f4-899e-814aede79679@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4349837-8b5c-48f4-899e-814aede79679@gmail.com>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 5522574a-df8b-4fbc-e5cb-08dca6901b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3xTk9xgEopkOki1r7nuupBMXPBuYElYbvSJBwdHd+oAg8njeGbzYfbGXsW?=
 =?iso-8859-1?Q?BRe90pJMhuKh7oA9MXUcQ1L6Eu7tynrZVFZlJCLn7CWOe20OhAAJolYLNW?=
 =?iso-8859-1?Q?SBs5KsEBen/IBDuAMwWaKYXNpf3eNqnwZ8OTf1tFOOU8xhxi0Y5ACJTT7i?=
 =?iso-8859-1?Q?jGLAYM5jh4ty6wyUYYQ3dk1KpKu2FFbAS00ec1SO1p5EcYR9vLbMho/HsZ?=
 =?iso-8859-1?Q?fsAGIiQE5Oq1Bf8QP5Jv4ckxeS8KaIUn5d3s1+knaVZim8igT82kBH9b3n?=
 =?iso-8859-1?Q?0kktDI1kKw01e17BGj9A8ZY7Wpeu1U7ZQ2scsgdg0104YVGK38nYW1sXnF?=
 =?iso-8859-1?Q?/3tKFQ3vYiFPyEEzw6XjnCu4iF6eqMvMwI1pqD0MxhqbjyDb2XAWsmcY3x?=
 =?iso-8859-1?Q?WLeBn8ohViSjGHc0Jbf9rsWI9KLhBv8HwhPU/jIj7dZtNXmns7GMMhg0eQ?=
 =?iso-8859-1?Q?x/eqWe+shpnZGtPAV74379nPN6a+bZ19VuzZy67nL+6NPOW36CjdH7Rbpj?=
 =?iso-8859-1?Q?TMObz0bvdlrEmDraRjaY8VXNBapGEWFmV+Br0qmNaced21UiL7EXoZec0a?=
 =?iso-8859-1?Q?mKNErKpXs4J60LA0af3M8xaRS5Dy0gIWzCH+DH5AmEc4e82J6Kd2YednK4?=
 =?iso-8859-1?Q?i21rrOisfpaNCUy2/rMZdL067LmwKzOPm0SHvFZVvHXN/IsB0iH/bG56YI?=
 =?iso-8859-1?Q?AQMM6oH5xo9aoZr/v2Zb78ASuDrXlrJVhvpYWIMDN5w4sUIOyh0uLkuT8t?=
 =?iso-8859-1?Q?kJmkOd7DaZefUpk3GFaX2/KBkHftlAkveosLi5F6ueaeIOUXZoNQUah/Co?=
 =?iso-8859-1?Q?MvzDitth0HH3CNFceGcHvdxebicz55Qf0uknkQUvYFVyI8y0R25h5yHttN?=
 =?iso-8859-1?Q?W12/Ow5jVl6Wcxp4ROpoWuE6lVYMMv3ULkFZXDRMewju52O/g+4GzYdBI2?=
 =?iso-8859-1?Q?IeqVVKWFezhkxyUlWsyCnsPPU2T4iR9ZlXVTCmzVcR4Sc51jjunltiyE95?=
 =?iso-8859-1?Q?C/Wou6xx6TD7aDlYQwWcegLz1O+1uPyXipGNmdUAwbVnYhkypFx3uUHXyO?=
 =?iso-8859-1?Q?J1zdOvCNWfVn5OCZJ9Ojc2kZzJ71oMsEA23bfpF4h4symBfe5h/MOiH+0u?=
 =?iso-8859-1?Q?dsvhKGcdOK86QIrPeeFrwPxaDj8ArFxLA2weVzXh+Eulvfwmz1027/hg0h?=
 =?iso-8859-1?Q?KB0E7TPtkzWDImTWEEGAFcSnXRjQ878Fj9V5MWjSHWKYrNGIaIint0C0XZ?=
 =?iso-8859-1?Q?NEj5xE5DRHnral7n7qdJSmrTrliislKXo6vBRQtwq9zQP3NSyZz0/jDtKv?=
 =?iso-8859-1?Q?OXm58GkbQTzUgiIXEJkx4DSky7YG0zfkHtqEXlWpDLWsuIewxw28EFboLy?=
 =?iso-8859-1?Q?VTLfKtjWBglSl2ATS/9OUcK6BtY1HC8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PMR8eFgxSIPsJOp/mX+aGGu0NJw2Fb4pDibYKwMSjylhfmsjYXrKyr2UKW?=
 =?iso-8859-1?Q?jtXPU/2su0DjYby4zNf7SiRROx96D+bTK4VsxAU4WImkOB4ZpWnhnDSxlz?=
 =?iso-8859-1?Q?PQeK+pLW6HlOGmYseWUfRDR6TPJPiqedT1PVyiPLksiwqNxO2wBw/0k2HH?=
 =?iso-8859-1?Q?iCTGaeT5V6bwW4/aZp5nzhbFmSbhEThkgiwen3v/SGllSYJzdo/xWckMY+?=
 =?iso-8859-1?Q?lpeMaJyD+NTgt9iqYXodCEyNw+f6jM1zLsJLQkkUoSc8ENEp1CqFjSNN/M?=
 =?iso-8859-1?Q?4dSdHAp3f1YlEq7A1QUJfi/s0ua0NhN6mgAZkfNPB8ORIYOSlIWelb3iQ3?=
 =?iso-8859-1?Q?f56rCTM6AkWTeO6EG7kiXTLxABl2DWwukT24s9mv/5Jq8u4ViGaN6cLcZE?=
 =?iso-8859-1?Q?Kvfu8dv2gExocXQNyyql4qi4GYcls6bKxWNauzmfTzy0WuA/yxwUdyAcO6?=
 =?iso-8859-1?Q?1sUny9xMA231DSkFkN28KxOe1jkQZCWx986zAKzisI0xcn3i0NcaIFubtz?=
 =?iso-8859-1?Q?lXXq36NbmCtAz/AQ5rxmi3rTz5qGNG5eMn5V4F9+oAS1TKc9Dn8uiKi6F+?=
 =?iso-8859-1?Q?YMhtWH5DLp0cR7vR5I7U8Ij0iy1KPjRV29ksgJZ+x3xUrHtHgsDifD337q?=
 =?iso-8859-1?Q?Ikm/i0nIGmir0z1ttiZBjZ7a2RQM+qMwpQBMPCWLv/G/NXy+3HvNSMTm/r?=
 =?iso-8859-1?Q?gXHdtVUyrpg8uBBsxWQzKyA29QwO7ZR5Lft3u3ePAeKgO3H8fNADECBwDS?=
 =?iso-8859-1?Q?+Qnl+qNiZIu8z8TU+BtYB6IDEEnmifbdUOVmBUZiWtEI8O3hX4KECu1hCi?=
 =?iso-8859-1?Q?55rcK807Q2ISxzbK+FupOL8DBrYyIVHeNkBic6C0v11Du07UA/AzGshQSa?=
 =?iso-8859-1?Q?o1St01EaY0adWbptRbhqAWlIInwouOHRj14MZ1pxvoEF1O+UbVgTgbkPvC?=
 =?iso-8859-1?Q?aNKVg/AcMCxOdhIOoPlFu31NGHZQEy4ODIVjpRYJbC0d2qmPW27ABwPHGq?=
 =?iso-8859-1?Q?5YuiAg7j3hBBid3j324UyFwLaSUb+Cl7+b1vPhWfhuWAw/wycxQhy8Lzmi?=
 =?iso-8859-1?Q?SU1k7WW/po9Kja2rxrYX3LOG3rKw2b2CpqImNKysm4DayMLtf9w18S+7nm?=
 =?iso-8859-1?Q?+4GGOlvBOkPb0LqmleO7Kyo8ZoG+8sgx/uUnrVdZ1omx6ISl5Go0a9nXnV?=
 =?iso-8859-1?Q?BWQBiyjT5sp1x1jSyakpWF6pbUEXXZx88nvgMyGylpZPT8k29sxCxUTKD4?=
 =?iso-8859-1?Q?ZdyIo/pQuML2bNHqDSohK31V5CKAZ+kbjiGHuO5/KEsjxanfH0HLSQu+sS?=
 =?iso-8859-1?Q?U4YSlZeCKcz0I7a7Xoi5ecnILujQVcHwSCAcyeQvEeBGkXElaB0gD2PoCL?=
 =?iso-8859-1?Q?19i+0Yld5s3/KutBjbzc/tUu0vdtvilOHwXuifLX3XpM08u2gXsmcX4qXm?=
 =?iso-8859-1?Q?8OvRkJcremZSPIUSNpNoH01k0kII/tj6Jk/afqtnsrTjIxk42PatHo2Cuz?=
 =?iso-8859-1?Q?bKkh8c4zArxw4il/em5ovGg191ybiDeCwmM3tFqBeFk+lZKMh47+Q/VFDr?=
 =?iso-8859-1?Q?BFNMOytJwRaeuilnmok7ZP0dWVb41hejFcpT6LtSHCQb+VbD8s2g9JNMLO?=
 =?iso-8859-1?Q?bwoklQ/Of2QTpnXfQzQXjwDrNtSifiM5Cwb2yihP7K9k7geh66InH30Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5522574a-df8b-4fbc-e5cb-08dca6901b9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:41:45.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHBJ7P2RZ8feED6IP8ytZNEwP0ZImKTAahXBOrGeIEvO/o3mvBq7uXrPOjSxLREu7yAhyX70Jlpi0QB1xfG3rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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

On Wed, Jul 17, 2024 at 04:53:16PM +0200, Christian König wrote:
> Am 16.07.24 um 23:53 schrieb Matthew Brost:
> > On Tue, Jul 16, 2024 at 02:35:11PM +0200, Christian König wrote:
> > > Instead of a TTM reference grab a GEM reference whenever necessary.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 8 ++++----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 7 ++-----
> > >   2 files changed, 6 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > index 67c234bcf89f..6be3d7cd1c51 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > @@ -87,11 +87,11 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
> > >   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > >   {
> > > -	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
> > > +	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
> > > -	if (robj) {
> > > -		amdgpu_hmm_unregister(robj);
> > > -		amdgpu_bo_unref(&robj);
> > > +	if (aobj) {
> > > +		amdgpu_hmm_unregister(aobj);
> > > +		ttm_bo_put(&aobj->tbo);
> > So, this relates to my comment in patch number #9 about dropping the TTM
> > ref count. If TTM only uses the GEM ref count, could we convert this
> > ttm_bo_put to something like ttm_bo_fini here (also in Xe and any other
> > drivers with code like this)?
> 
> That's exactly what I was planning to do as a follow up.
> 

Cool, glad we are aligned.

Matt

> Regards,
> Christian.
> 
> > 
> > I think that might be cleaner.
> > 
> > Matt
> > 
> > >   	}
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > index 8d8c39be6129..6c187e310034 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > @@ -853,7 +853,7 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
> > >   	if (bo == NULL)
> > >   		return NULL;
> > > -	ttm_bo_get(&bo->tbo);
> > > +	drm_gem_object_get(&bo->tbo.base);
> > >   	return bo;
> > >   }
> > > @@ -865,13 +865,10 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
> > >    */
> > >   void amdgpu_bo_unref(struct amdgpu_bo **bo)
> > >   {
> > > -	struct ttm_buffer_object *tbo;
> > > -
> > >   	if ((*bo) == NULL)
> > >   		return;
> > > -	tbo = &((*bo)->tbo);
> > > -	ttm_bo_put(tbo);
> > > +	drm_gem_object_get(&(*bo)->tbo.base);
> > >   	*bo = NULL;
> > >   }
> > > -- 
> > > 2.34.1
> > > 
> 
