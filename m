Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5787675D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203EE1138F3;
	Fri,  8 Mar 2024 15:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaQSQn7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2371125D5;
 Fri,  8 Mar 2024 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709911706; x=1741447706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p4l7+8vGZn3qO7A6DRJs2Lqcoti3sKgs2LwcM0PSNuo=;
 b=ZaQSQn7qT3ZY6BGybDt0EY6tTOsRDCjb1gt+2fubYgsEKc51H3mzAKi/
 8OihEkAyrZ/Gm7hpTNraToPZ4Qm5PyXT/Sc5Vocvrabib28qV9jKn9ztw
 fOC2xmB0wfGQEKV+ZPM5+qi0UcZH3gRZ9eat4d2ZINrG72M68tWCHYVa5
 evIf2Xpw73+qw/+jOM3GgQdBgMtvDB7+bcRXAQw25jIAGMjRwW86MVkQz
 ZkM4gWLNrPaflwPJKdElwMY6g5XDrob7oya8bJVJSSBFnrJX9/JvVDNSE
 ifTLBugfp5EuM+McdVxBEVMmts2GoS5IUg49IAuXyplQTLm2WLYp4gWX8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4485315"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4485315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15155652"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:28:25 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:28:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:28:24 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:28:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSxFl+jdsvQT7v/weDBp3jgyf+lRoJQP9/fqvwnDIDlrcumvBIVzWOu2TSKMXmZWTTgUloacUYZHpAF9cgIo/HLxFeqnoSV6jqWhbP5nmkJ6sZScvZV+4CTmuw+mrE7F4jbIOr4L62IizcNsQvL1jXmdAmmIBcesdMLFgEG/tIlL1Srk2wvdPZ7KXk2woL8c/aPapvxZOEztYlkdV9graiHLejU8wJccEwTE9kE/ARxx42GgI1MI8PKuWKbxrxSSMf6WYhcwUvEeScaWwQArhOhEzjLFekNYmozJkbQsFpyC7jq519wf12vKzbgj0GmQgaccmiPNHu5HzubvBJSdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eydtJ5OEBD4kQqEtUzVGS/Aa2Nkp5far5qn+PnoXoz8=;
 b=aXF/2SwAL7aMozWiKNNZGhOpM2FL2lNYnyybGJBlVtOfppUDSMZ+DjgLBaFCoxZt3FtizcurDpuynU0qSO1nPPJeX6OH/5YSa8xyMYDSKz5qCvBsuztbuMwGww5BnfSaOBDjP8JbQGFANeRvQBEDUwr1EoQkelmbBJdLxvIwkMRT8KSlJpQ/WP2V6J3ZuORHmEqxjZIKXcq8QnQ65qkylwuW7lY0bMlwmzIYLwCS/FjixCmIzwkLcBhrDLPddZ2+1AXimcmqY/3z4tDqy1Zi7xKTmNTKamNFU4dKkHdSdTc7j4cQstzjnKTRixa86zIq0ukjkH9dgYqOg8JCw9ANwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Fri, 8 Mar
 2024 15:28:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 15:28:20 +0000
Date: Fri, 8 Mar 2024 10:28:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <ville.syrjala@linux.intel.com>, <imre.deak@intel.com>,
 <tejas.upadhyay@intel.com>, <jouni.hogander@intel.com>, <javierm@redhat.com>, 
 <airlied@gmail.com>, <daniel@ffwll.ch>, <lucas.demarchi@intel.com>,
 <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/6] drm/i915: Unregister in-kernel clients
Message-ID: <ZesujXc8R5-ovjTL@intel.com>
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-3-tzimmermann@suse.de>
 <ZedDHPupthhNWte8@intel.com> <878r2w1w93.fsf@intel.com>
 <a562fc9c-7e11-4149-b20c-f65347fa8032@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a562fc9c-7e11-4149-b20c-f65347fa8032@suse.de>
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f72304b-d8ae-47fe-b963-08dc3f8462c1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ORxNi7imyfr3j+D80T+C3Giq1o9vLxmucbea9jGP/f5i1A3I2FQ6U3pD0GEVX7OFdsbr5QgOGCipPae/4Tc852FpW12IjiKrklMGXqjIGL8Y2HG1rAo4R7wl5EmOiV35bj2C204SqILfQaPJ0F1i8b/8eN6A+yu3ooz39N4cWnQXE4kVz5qXY8vJi3yL4rI9t7kQF2BNWKCjVERX5O7lswpyWCLwNfXS9VSC6LmOrFRW2BrVujJYCPexVqCz6qjTAXx2gNKXn6tnmSsqmawQDDMATvcOtZecbZ80jgZ4sCsjc1WU/DGSdosenV3u5IyBiQvidobZkHp0dbkaMVMlFeXY8zuCGg7Kxz7r3ew2y+zRV5RWEQoUwuX4O7vLgaY0vMW2r6j3O8XnEc+Np06/wIps2HA7LWJriWrAH2PV4jGHyZys36A30QPe/lMCAPg/Dc1dcGaPS8+h/7u/S1fmUsHDSiPZ+VDQUy434n8LWQF0VyAo4Z1RoOGqq36Lp665EJEBBeKsqkDBi1mo1LZDdF199UwSoyHJPmLoWXb8FzZVLtoCY/qVAJcAMwFZJkdV6xQF3aEji6Hw99MhvuBOYuLzHYdkFiJ7qEi68p01uvL4ea3zawpAPGcv7EYPiOEC7q579zKYZetRH7aKtEKhJJsBw1SPLxz/igp7xAyTTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?167z46iA23/iA8fy01jWuSlZ4aXG2qMwccrlB5KxCbJBh7QFXagdTtDsPdXo?=
 =?us-ascii?Q?mp90it4YedZiMxCQqoLUv1cBJlvl5UbwyCbyK5y0C/VX5TeEmS4hdi+1oALZ?=
 =?us-ascii?Q?lahNqtu1d+4E0IoGI6C6sUO3jUGdSGhX2ut3WzDmha/KIA8vZg4Vces2uMQy?=
 =?us-ascii?Q?x//y0xrhn/siJby2AOmyDbY+amyK2f+aSHrY693M+1z1cRcXrr215ul6Peic?=
 =?us-ascii?Q?pf6u7F/Ojj4jElS3O2e+8zTRnMZjr0KywNX5QgRNodg2CVdRK8lSyBPfxk7x?=
 =?us-ascii?Q?oejPq5sqS85+8VktbVaNEi9MhiWApZUSxC1X7RcGwsYhjnWB4LxHcEKHu60k?=
 =?us-ascii?Q?u0KhKq8gOi4QOolVnkiqkm3+PFzx77rGQA2I9LkIRvbtpZjw+lwCpAivrHYl?=
 =?us-ascii?Q?p2bDvm9ZdLJ8gF+9VwPu2MaoMjc3PmpkOulQZLMzqVLMDQ0s8ERi8NcbLGtu?=
 =?us-ascii?Q?Sv+daj3lhL0sIWPtgvFo/6UfYw+u9jV4QF0WeuVvIqTIgA4vLGXQ8CB4EPPq?=
 =?us-ascii?Q?ZQdc854gkYdfvNJagabLTTYxzqmTdMCsJFtbzkYgnJzSH27LKrrYHw2YuqwX?=
 =?us-ascii?Q?FfNXvMUdvgnAJQKQyx4oNgCvTt562S5Vji7ORcUPHJos0U/KQ753Y6thrTya?=
 =?us-ascii?Q?E/d7tbankkbN5ue8Chh3ailAGtHhh451LDBf1kq8MhYho9jgDRu9C0riOlqh?=
 =?us-ascii?Q?zbpsqcgGBp6hplZc6CPtOM/s4qOcH67ur+GyfWrgb+6niQCeWFs6h2pohS8M?=
 =?us-ascii?Q?35zl/7ls9+BU4el4s96tLdZpAmdv0nwMzzoi7GiuwkqCI3/57YrMAsvVmpTz?=
 =?us-ascii?Q?tkypHnsjgdLjGcWfL4KD32VJLCyhJcwHdoVfr/LlejvtKGjfLL0Mv+T7jLBE?=
 =?us-ascii?Q?ZmI8zRwkyieVcCqpjRzSNS5YwkZg1xgbxdXEflhbPKPgLTiPlhCOtkQsi3Ea?=
 =?us-ascii?Q?dLUbRTG2psHgp1Do1DTYs/y0Xlff2hLazINQcl4P5txC0O6pqO4bgl5pvo2U?=
 =?us-ascii?Q?6GKxlhFGEiZq2nwNyfSooUnOlMHlyjfdot/rFLniex++D/S5sn4Z5YKOv8xe?=
 =?us-ascii?Q?qYTzQrfnOt341btrxuGDNc5VG2tPPOHyQyHynlSKY8dSq3owGvLOsmCcoYsV?=
 =?us-ascii?Q?pBij7BxAajvBZ9btnRkrnLJdX9bSuqhyuiBnJEb6ibo83+88fWWysZm3hDlV?=
 =?us-ascii?Q?BKyOzHXr369TwRLjKNaWOiySOEWB+EEjtZjcwPWRYvkKEUN0hvEK0lJLsUfE?=
 =?us-ascii?Q?3o2iU7OLzFV0dmUxotZYM5CFFecf+pVuwX/nHqKiwAWcPq110twrlRGUE+dv?=
 =?us-ascii?Q?RHb5/Z/jN+eY3wpv86g+7HNqAYjxhzb/orSI2xGGHgksbieS+fQSjkeDlHbG?=
 =?us-ascii?Q?8pMupvI0S6G/uTxYiW2H6aYPxbnhZzbMAKQ2f6C1UWKfeqvzWHM4fR3qAEre?=
 =?us-ascii?Q?9PM0pQfS0DB3I5IpfR2Vr791LexSg9OPkkvfjXzilP58XgzLHqYTkmHUyQcw?=
 =?us-ascii?Q?K0DjVFZvR6Xu2HqnxZVJDvCthmdvL5oqoc53qrFZoPt06NoYhXzncL2R9RYY?=
 =?us-ascii?Q?HWkvYKV8yVWCLf4tdgKcjzIj9oqYo4u4sq5wPmfM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f72304b-d8ae-47fe-b963-08dc3f8462c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:28:20.8212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7lmtOA/BPjqUY1g+yL+yBx1vy+nJczSNqEWhZMoH66CkNJxOcZzjCF54bErLp29rPJFoDNC6O5OBn4GsiCr3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
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

On Wed, Mar 06, 2024 at 04:11:54PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.03.24 um 17:25 schrieb Jani Nikula:
> > On Tue, 05 Mar 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > On Fri, Mar 01, 2024 at 02:42:55PM +0100, Thomas Zimmermann wrote:
> > > > Unregister all in-kernel clients before unloading the i915 driver. For
> > > > other drivers, drm_dev_unregister() does this automatically. As i915
> > > > does not use this helper, it has to perform the call by itself. For xe,
> > > > do the same in xe_device_remove()
> > > > 
> > > > Note that there are currently no in-kernel clients in i915 or xe. The
> > > > patch prepares the drivers for a related update of their fbdev support.
> > > > 
> > > > v7:
> > > > 	* update xe driver
> > > > 
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > ---
> > > >   drivers/gpu/drm/i915/i915_driver.c | 3 +++
> > > >   drivers/gpu/drm/xe/xe_device.c     | 3 +++
> > > >   2 files changed, 6 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > > > index 9ee902d5b72c4..97910a85e3917 100644
> > > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > > @@ -41,6 +41,7 @@
> > > >   #include <drm/drm_aperture.h>
> > > >   #include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_client.h>
> > > >   #include <drm/drm_ioctl.h>
> > > >   #include <drm/drm_managed.h>
> > > >   #include <drm/drm_probe_helper.h>
> > > > @@ -852,6 +853,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
> > > >   {
> > > >   	intel_wakeref_t wakeref;
> > > > +	drm_client_dev_unregister(&i915->drm);
> > > > +
> > > >   	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> > > >   	i915_driver_unregister(i915);
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 919ad88f0495a..7f41f0ec819f0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > probably deserves a separate patch since this is one here is named 'drm/i915:'
> > Or do this for both in intel_display_driver_unregister()?
> 
> Ok, sure. I'll update this. I also have to update i915 and xe in patches 5
> and 6. I don't see how I can change them individually. How would I best log
> against both of them? drm/{i915,xe}? or drm/intel?

hmmm... though one...

drm-intel is the name of the i915 repository

well, perhaps drm/{i915,xe} works
or maybe just drm/i915/display: because since display is shared, that
kind of "tag" would be an indication that xe needs it as well anyway.

> 
> Best regards
> Thomas
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > > @@ -9,6 +9,7 @@
> > > >   #include <drm/drm_aperture.h>
> > > >   #include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_client.h>
> > > >   #include <drm/drm_gem_ttm_helper.h>
> > > >   #include <drm/drm_ioctl.h>
> > > >   #include <drm/drm_managed.h>
> > > > @@ -614,6 +615,8 @@ void xe_device_remove(struct xe_device *xe)
> > > >   	struct xe_gt *gt;
> > > >   	u8 id;
> > > > +	drm_client_dev_unregister(&xe->drm);
> > > > +
> > > >   	xe_device_remove_display(xe);
> > > >   	xe_display_fini(xe);
> > > > -- 
> > > > 2.43.2
> > > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
