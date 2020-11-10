Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28132ADAC3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 16:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C32789B33;
	Tue, 10 Nov 2020 15:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9E089B33
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:48:05 +0000 (UTC)
IronPort-SDR: 3w0zb7iQfl5Ijve30/IkVrcLTJwgkpe6HSvu9h9Hffxl5HGFTBMb8aepBHOKK0VxK15qwW/DG/
 l8OO9X5Un44g==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="149843860"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="149843860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 07:48:03 -0800
IronPort-SDR: RcMmHUskjONEOqcOikdmIqWHS8B3oL3nt9turMxQbHh7g7XYl342wb+BZvAift6W8lLenEfKZf
 t0GNYM6PSS9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="365898061"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 10 Nov 2020 07:48:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Nov 2020 17:47:59 +0200
Date: Tue, 10 Nov 2020 17:47:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
Message-ID: <20201110154759.GR6112@intel.com>
References: <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
 <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
 <20201109212731.GQ6112@intel.com>
 <CAPM=9tyHOoQwhpfAtjREK6mg6zbmNkBuPGYVUpuv8MpP9UDXgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tyHOoQwhpfAtjREK6mg6zbmNkBuPGYVUpuv8MpP9UDXgA@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 03:24:32PM +1000, Dave Airlie wrote:
> On Tue, 10 Nov 2020 at 07:27, Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Mon, Nov 09, 2020 at 09:48:04PM +0100, Christian K=F6nig wrote:
> > > Am 09.11.20 um 17:43 schrieb Ville Syrj=E4l=E4:
> > > > On Mon, Nov 09, 2020 at 05:20:17PM +0100, Christian K=F6nig wrote:
> > > >> Am 09.11.20 um 17:18 schrieb Ville Syrj=E4l=E4:
> > > >>> On Mon, Nov 09, 2020 at 04:57:29PM +0100, Christian K=F6nig wrote:
> > > >>>> Am 09.11.20 um 16:16 schrieb Ville Syrj=E4l=E4:
> > > >>>>> On Wed, Nov 11, 2020 at 06:13:02PM +0100, Christian K=F6nig wro=
te:
> > > >>>>>> Am 09.11.20 um 01:54 schrieb Dave Airlie:
> > > >>>>>>> @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operati=
on_ctx *ctx)
> > > >>>>>>>       if (bo->mem.mem_type !=3D TTM_PL_SYSTEM) {
> > > >>>>>>>               struct ttm_operation_ctx ctx =3D { false, false=
 };
> > > >>>>>>>               struct ttm_resource evict_mem;
> > > >>>>>>> +             struct ttm_place hop =3D {};
> > > >>>>>> Please always use memset() if you want to zero initialize some=
thing in
> > > >>>>>> the kernel, we had enough trouble with that.
> > > >>>>> What trouble is that? I've not heard of anything, and we use
> > > >>>>> =3D{} quite extensively in drm land.
> > > >>>> =3D{} initializes only named fields, not padding.
> > > >>> Has that actually happened?
> > > >> YES! Numerous times!
> > > > You wouldn't happen to have links/etc. to the discussion?
> > > > I'd like to check them out.
> > >
> > > Uff, that was years ago. Just google for something like "mesa memset
> > > hash", there was recently (~ the last year) another discussion because
> > > somebody ran into exactly that problem once more.
> >
> > Found this:
> > https://gitlab.freedesktop.org/mesa/mesa/-/issues/2071
> > which does suprise me a bit. Though I suspect =3D{} might
> > behave differently since the compiler might treat it
> > more like a memset().
> =

> It doesn't there's a bit of info out there on what happens, it really
> only matters for structs we are passing to userspace, but it's
> unlikely to matter here,
> but I've changed this to memset in my local tree, because why not.

Structs passed to userspace should really have no implicit padding.
One of those how to botch your ioctl things...

The main problems with memset() are:
- it's ugly
- people often get the sizeof wrong

I guess the latter could be alleviated with a cpp macro that
does the sizeof correctly for you.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
