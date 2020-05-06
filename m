Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E71C6CB8
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 11:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC789E65;
	Wed,  6 May 2020 09:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0262089E65
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:18:44 +0000 (UTC)
IronPort-SDR: OIKqn9HOlo3sArXlSU+394KAX6gMFE2sOcCyw0YMulW7tCXVEfwugRFwhMMTyiQ3pHpfW2tDmJ
 QjBxC18Ce32g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 02:18:43 -0700
IronPort-SDR: hxRy3IsY51BeAP7IzJDkGa7PoiRFA7Rd8eXBTVtTl2itlFgTfoAtzZNwkQlLf6yC4OUQ1cE5zf
 Qz3ijQAr8QVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="278164910"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 06 May 2020 02:18:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 May 2020 12:18:40 +0300
Date: Wed, 6 May 2020 12:18:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Artem Mygaiev <joculator@gmail.com>
Subject: Re: Question about sRGB framebuffer support
Message-ID: <20200506091840.GP6112@intel.com>
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
 <20200506074457.GK6112@intel.com>
 <CAJwc6Kum2SrGixZyJzAWjC71pxO8zkBJ7MBfdVhxZOFvWyw4RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJwc6Kum2SrGixZyJzAWjC71pxO8zkBJ7MBfdVhxZOFvWyw4RQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 06, 2020 at 12:04:22PM +0300, Artem Mygaiev wrote:
> Hello Ville
> =

> On Wed, May 6, 2020 at 10:45 AM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, May 05, 2020 at 01:24:16PM +0300, Artem Mygaiev wrote:
> > > Hello all
> > >
> > > I am currently working on DRM/KMS driver for Fresco Logic FL2000 USB =
display
> > > controller [1]. I have already implemented a POC driver [2] which is =
working for
> > > me, although there are still plenty of things to improve or fix, of c=
ourse.
> > >
> > > So far I have one thing that I somehow cannot find in DRM/KMS documen=
tation or
> > > existing drivers: how to tell the system that HW expects sRGB (i.e. n=
on-linear)
> > > color encoding in framebuffers? This is a HW limitation that I cannot=
 influence
> > > by configuration.
> >
> > Does it do something to process the data that requires linearization
> > or why does it care about the gamma applied to the data? In a typical
> > use case the data is just passed through unless the user asks otherwise,
> > so it doesn't matter much what gamma was used. Though most displays
> > probably expect something resembling sRGB gamma by default, so that's
> > presumably what most things generate, and images/videos/etc. pretty
> > much always have gamma already applied when they are produced.
> >
> =

> Unfortunately the HW was designed in a way that when it is configured to =
24-bit
> RGB888 it expects sRGB and applies degamma automatically. It is not possi=
ble to
> disable this, I've asked vendor and they confirmed this [1].

So it always does degamma+gamma for no real reason? That shouldn't
really matter (apart from potentially losing some precision in those
conversions).

> =

> The only workaround I could implement now is to switch it to 16-bit RGB56=
5 and
> perform framebuffer conversions in driver, similar to what
> rm_fb_xrgb8888_to_rgb565() alike helpers do; but it would be still great =
to
> understand whether it is possible to support sRGB.
> =

> [1] https://github.com/FrescoLogic/FL2000/issues/42
> =

> > >
> > > Any pointers are greatly appreciated.
> > >
> > > [1] www.frescologic.com/product/single/fl2000
> > > [2] https://github.com/klogg/fl2000_drm
> > >
> > > Best regards,
> > >  -- Artem
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
> =

> Best regards,
> Artem Mygaiev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
