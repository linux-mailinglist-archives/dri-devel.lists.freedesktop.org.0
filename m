Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BD23213B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438526E536;
	Wed, 29 Jul 2020 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E196E536;
 Wed, 29 Jul 2020 15:09:47 +0000 (UTC)
IronPort-SDR: WppqfxEPtdTwO1OcoUX9sDM34HqlIUaUO6wvZr0RoBwAGEbM51ZCAdC6WZ092h5Wle8j5GZgTy
 XL9HsmsbwaZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="148891497"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="148891497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 08:09:46 -0700
IronPort-SDR: GagSq0xY1JUqlQZztKdqk7dFOdSz71mNIA7WOluPT9cnV24kOa3bJJ9GUtoItbO6dfhKchIAeV
 fVZnNhtQ+euQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="313057299"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2020 08:09:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 29 Jul 2020 16:09:44 +0100
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Wed, 29 Jul 2020 08:09:42 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Subject: RE: [PATCH 1/3] drm: Restore driver.preclose() for all to use
Thread-Topic: [PATCH 1/3] drm: Restore driver.preclose() for all to use
Thread-Index: AQHWYRW5n+A4jji0YE+tc8HbwEq9WakcTJSAgAFel4CAAQcEIA==
Date: Wed, 29 Jul 2020 15:09:42 +0000
Message-ID: <0118a278832d4dde8d8d71e3db635869@intel.com>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <CAKMK7uFt5ViekqBPqdBbJWN4FhfxvF57K58VW8hAZGZwjRDz0w@mail.gmail.com>
 <159595365380.28639.1774414370144556112@build.alporthouse.com>
In-Reply-To: <159595365380.28639.1774414370144556112@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
x-originating-ip: [10.1.200.100]
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
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Tuesday, July 28, 2020 9:28 AM
> To: Daniel Vetter <daniel@ffwll.ch>; Dave Airlie <airlied@redhat.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; stable
> <stable@vger.kernel.org>; Gustavo Padovan
> <gustavo.padovan@collabora.com>; Tang, CQ <cq.tang@intel.com>; dri-
> devel <dri-devel@lists.freedesktop.org>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH 1/3] drm: Restore driver.preclose() for all to use
> 
> Quoting Daniel Vetter (2020-07-27 20:32:45)
> > On Thu, Jul 23, 2020 at 7:21 PM Chris Wilson <chris@chris-wilson.co.uk>
> wrote:
> > >
> > > An unfortunate sequence of events, but it turns out there is a valid
> > > usecase for being able to free/decouple the driver objects before
> > > they are freed by the DRM core. In particular, if we have a pointer
> > > into a drm core object from inside a driver object, that pointer
> > > needs to be nerfed *before* it is freed so that concurrent access
> > > (e.g. debugfs) does not following the dangling pointer.
> > >
> > > The legacy marker was adding in the code movement from drp_fops.c to
> > > drm_file.c
> >
> > I might fumble a lot, but not this one:
> >
> > commit 45c3d213a400c952ab7119f394c5293bb6877e6b
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Mon May 8 10:26:33 2017 +0200
> >
> >     drm: Nerf the preclose callback for modern drivers
> 
> Gah, when I going through the history it looked like it appeared out of
> nowhere.
> 
> > Also looking at the debugfs hook that has some rather adventurous
> > stuff going on I think, feels a bit like a kitchensink with batteries
> > included. If that's really all needed I'd say iterate the contexts by
> > first going over files, then the ctx (which arent shared anyway) and
> > the problem should also be gone.
> 
> Or we could cut out the middlelayer and put the release under the driver
> control with a call to the drm_release() when the driver is ready.

Chiris, can explain this idea, or post a patch ?

--CQ

> -Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
