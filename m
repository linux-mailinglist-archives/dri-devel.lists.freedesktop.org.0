Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC2722F9E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 22:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55789E1B;
	Mon, 27 Jul 2020 20:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AF289E1B;
 Mon, 27 Jul 2020 20:11:29 +0000 (UTC)
IronPort-SDR: niTW8Zc70bT/meB8Coj7IGFi93MqzLQ85tDREShTBzBdse53lkxe1+A93ZRU48QzFEgoh2/WOB
 +oVE6UGBOkNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="151087806"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="151087806"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 13:11:28 -0700
IronPort-SDR: ua42VpdUMglpm/GiBvXcDBTeK6P6PDcZ3FAgbnS/0AnZyyMRMRwTKW23i2hE30rCO8IZU0F82c
 IrEYNnnC2wVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="490088627"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2020 13:11:27 -0700
Received: from orsmsx163.amr.corp.intel.com ([169.254.9.67]) by
 ORSMSX108.amr.corp.intel.com ([169.254.2.137]) with mapi id 14.03.0439.000;
 Mon, 27 Jul 2020 13:11:27 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, 
 Dave Airlie <airlied@redhat.com>
Subject: RE: [PATCH 1/3] drm: Restore driver.preclose() for all to use
Thread-Topic: [PATCH 1/3] drm: Restore driver.preclose() for all to use
Thread-Index: AQHWYRW5n+A4jji0YE+tc8HbwEq9WakcTJSA//+T8JA=
Date: Mon, 27 Jul 2020 20:11:27 +0000
Message-ID: <1D440B9B88E22A4ABEF89F9F1F81BC2901183CE79A@ORSMSX163.amr.corp.intel.com>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <CAKMK7uFt5ViekqBPqdBbJWN4FhfxvF57K58VW8hAZGZwjRDz0w@mail.gmail.com>
In-Reply-To: <CAKMK7uFt5ViekqBPqdBbJWN4FhfxvF57K58VW8hAZGZwjRDz0w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
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
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, July 27, 2020 12:33 PM
> To: Chris Wilson <chris@chris-wilson.co.uk>; Dave Airlie <airlied@redhat.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; stable
> <stable@vger.kernel.org>; Gustavo Padovan
> <gustavo.padovan@collabora.com>; Tang, CQ <cq.tang@intel.com>; dri-
> devel <dri-devel@lists.freedesktop.org>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH 1/3] drm: Restore driver.preclose() for all to use
> 
> On Thu, Jul 23, 2020 at 7:21 PM Chris Wilson <chris@chris-wilson.co.uk>
> wrote:
> >
> > An unfortunate sequence of events, but it turns out there is a valid
> > usecase for being able to free/decouple the driver objects before they
> > are freed by the DRM core. In particular, if we have a pointer into a
> > drm core object from inside a driver object, that pointer needs to be
> > nerfed *before* it is freed so that concurrent access (e.g. debugfs)
> > does not following the dangling pointer.
> >
> > The legacy marker was adding in the code movement from drp_fops.c to
> > drm_file.c
> 
> I might fumble a lot, but not this one:
> 
> commit 45c3d213a400c952ab7119f394c5293bb6877e6b
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Mon May 8 10:26:33 2017 +0200
> 
>     drm: Nerf the preclose callback for modern drivers
> 
> Also looking at the debugfs hook that has some rather adventurous stuff
> going on I think, feels a bit like a kitchensink with batteries included. If that's
> really all needed I'd say iterate the contexts by first going over files, then the
> ctx (which arent shared anyway) and the problem should also be gone.

Debugfs code can jump in after drm_gem_release() (where file->object_idr is destroyed), but before postclose(). At this window, everything is fine for debugfs context accessing except the file->object_idr.

--CQ

> -Daniel
> 
> > References: 9acdac68bcdc ("drm: rename drm_fops.c to drm_file.c")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
> > Cc: CQ Tang <cq.tang@intel.com>
> > Cc: <stable@vger.kernel.org> # v4.12+
> > ---
> >  drivers/gpu/drm/drm_file.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 0ac4566ae3f4..7b4258d6f7cc 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -258,8 +258,7 @@ void drm_file_free(struct drm_file *file)
> >                   (long)old_encode_dev(file->minor->kdev->devt),
> >                   atomic_read(&dev->open_count));
> >
> > -       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
> > -           dev->driver->preclose)
> > +       if (dev->driver->preclose)
> >                 dev->driver->preclose(dev, file);
> >
> >         if (drm_core_check_feature(dev, DRIVER_LEGACY))
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
