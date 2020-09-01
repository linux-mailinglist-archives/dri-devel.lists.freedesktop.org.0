Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAE258D16
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA846E051;
	Tue,  1 Sep 2020 10:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B796E051;
 Tue,  1 Sep 2020 10:58:04 +0000 (UTC)
IronPort-SDR: UqjhCLs6g0+49ovG4kn6QlU+EwPzTr15D031o/h89lLrq9BDjR467gADYSxJguW961zTPZ41Dp
 GwO7WFNmSBeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175189564"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="175189564"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 03:58:03 -0700
IronPort-SDR: BSLTlhhFI96dTHhNrKzB+6lA0UJqRfp11ZgeYUHGGWL5q2NoUeJyiQV5rZVsUTRTYqLaITgJc6
 ydTg+UUdzvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="301404290"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 01 Sep 2020 03:58:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 13:58:00 +0300
Date: Tue, 1 Sep 2020 13:58:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 16/16] drm: Replace mode->export_head with a boolean
Message-ID: <20200901105800.GE6112@intel.com>
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
 <20200428171940.19552-17-ville.syrjala@linux.intel.com>
 <CACvgo50i8sqhDAyWawcaPUSd=GkKLFWJ_DVSHeq8UvJBh3OwRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50i8sqhDAyWawcaPUSd=GkKLFWJ_DVSHeq8UvJBh3OwRQ@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 02:50:52PM +0100, Emil Velikov wrote:
> Hi Ville
> =

> I don't fully grok the i915 changes to provide meaningful review.
> There are couple of small comments below, but regardless of those

Sorry, forgot to reply to this in a timely manner.

> =

> Patches 01-11 and 14-16 are:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> =

> On Tue, 28 Apr 2020 at 18:20, Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> =

> > The downside is that drm_mode_expose_to_userspace() gets to
> > iterate a few more modes. It already was O(n^2), now it's
> > a slightly worse O(n^2).
> >
> Personally I'd drop the O() sentence, or change it to
> It already was O(n^2), now it's slightly worse O((n+y)^2).

Dropped.

> =

> > Another alternative would be a temp bitmask so we wouldn't have
> > to have anything in the mode struct itself. The main issue is
> > how large of a bitmask do we need? I guess we could allocate
> > it dynamically but that means an extra kcalloc() and an extra
> > loop through the modes to count them first (or grow the bitmask
> > with krealloc() as needed).
> >
> If the walk is even remotely close to being an issue, we could
> consider the bitmask.
> I don't think that's the case yet.
> =

> =

> Hmm the original code never discards any entries from export_head.
> I wonder if there's some corner case where we could end with an "old"
> mode showing in the list?

No. export_list starts out empty so only the modes we explicitly add
to the list can be reached. Thus any dangling pointers in some other
mode's export_head are of no concern.

Pushed the last few patches to drm-misc-next. Thanks for the reviews
everyone.

> =

> For example:
> - creates a user mode via drmModeCreatePropertyBlob()
> - calls drmModeGetConnector() and sees their mode
> - optional (?) does a modeset to and away from said mode
> - removes their blob drmModeDestroyPropertyBlob()
> - calls drmModeGetConnector() and still sees their removed mode.
> =

> If this is a bug (?) that we care about, we might want to add an igt
> test for it.
> Conversely, if this is a behaviour we want to keep this patch needs some =
work.
> =

> HTH
> =

> Emil

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
