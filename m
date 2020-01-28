Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0014BDB9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 17:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797D76EEB1;
	Tue, 28 Jan 2020 16:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CC56EEAD;
 Tue, 28 Jan 2020 16:29:12 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 08:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310365166"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 28 Jan 2020 08:28:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Jan 2020 18:28:57 +0200
Date: Tue, 28 Jan 2020 18:28:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/edid: Check the number of detailed timing
 descriptors in the CEA ext block
Message-ID: <20200128162857.GM13686@intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200128151758.GI43062@phenom.ffwll.local>
 <20200128161536.GL13686@intel.com>
 <CAKMK7uGjtJOU_+Hv=A1LbOoqwO-FSC4iOxbb__r0iN+v5FpgRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGjtJOU_+Hv=A1LbOoqwO-FSC4iOxbb__r0iN+v5FpgRA@mail.gmail.com>
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 05:18:34PM +0100, Daniel Vetter wrote:
> On Tue, Jan 28, 2020 at 5:15 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Jan 28, 2020 at 04:17:58PM +0100, Daniel Vetter wrote:
> > > On Fri, Jan 24, 2020 at 10:02:24PM +0200, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > >
> > > > CEA-861 says :
> > > > "d =3D offset for the byte following the reserved data block.
> > > >  If no data is provided in the reserved data block, then d=3D4.
> > > >  If no DTDs are provided, then d=3D0."
> > > >
> > > > So let's not look for DTDs when d=3D=3D0. In fact let's just make t=
hat
> > > > <4 since those values would just mean that he DTDs overlap the block
> > > > header. And let's also check that d isn't so big as to declare
> > > > the descriptors to live past the block end, although the code
> > > > does already survive that case as we'd just end up with a negative
> > > > number of descriptors and the loop would not do anything.
> > > >
> > > > Cc: Allen Chen <allen.chen@ite.com.tw>
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > Hm I think edid parsing is like the perfect use-case for some in-kern=
el
> > > unit tests ... In case anyone feels motivated?
> >
> > Another idea I've been putting off is simply shoving the parser into
> > userspace. Kinda looks like with fork_usermode_blob() we could embed
> > the executable into the kernel/module and thus avoid the problem of
> > actually shipping the binary somehow.
> =

> "How to run unit tests without losing hair" is essentially what kunit
> tries to solve. I think we should cut over to that (it's merged now,
> should be good enough for at least the edid parser, mocking stuff
> isn't there there), and then make sure CI runs that stuff for us. Then
> we could convert over at least the unit test like selftests eventually
> too.

I meant run it in userspace *always*, not just for testing.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
