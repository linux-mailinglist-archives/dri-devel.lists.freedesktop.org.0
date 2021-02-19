Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B748231FC62
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 16:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6CD6E059;
	Fri, 19 Feb 2021 15:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512D06E059;
 Fri, 19 Feb 2021 15:47:45 +0000 (UTC)
IronPort-SDR: ohz0MTAxCTPOAtQJP+mABcX1AAzHMPGwUNqS4dc6mO8Z53VLrUNwcfPLtwJEb8RHBBF4DCQJ8s
 SNv5UGEdix9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="163021328"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="163021328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 07:47:44 -0800
IronPort-SDR: +jO3ZTZiI80wPil3fk8YPW2POcf72dnAAhjPnRP0GsGTcTX2B7d7LvqU/Xoa6BXvGoPzjV+EZK
 ezLjWYnOs2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="401073823"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 19 Feb 2021 07:47:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Feb 2021 17:47:40 +0200
Date: Fri, 19 Feb 2021 17:47:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/vblank: Do not store a new vblank timestamp in
 drm_vblank_restore()
Message-ID: <YC/dnB479nssyrL8@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <20210218160305.16711-1-ville.syrjala@linux.intel.com>
 <YC/UWTfV6tFSwluS@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YC/UWTfV6tFSwluS@phenom.ffwll.local>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 04:08:09PM +0100, Daniel Vetter wrote:
> On Thu, Feb 18, 2021 at 06:03:05PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > drm_vblank_restore() exists because certain power saving states
> > can clobber the hardware frame counter. The way it does this is
> > by guesstimating how many frames were missed purely based on
> > the difference between the last stored timestamp vs. a newly
> > sampled timestamp.
> > =

> > If we should call this function before a full frame has
> > elapsed since we sampled the last timestamp we would end up
> > with a possibly slightly different timestamp value for the
> > same frame. Currently we will happily overwrite the already
> > stored timestamp for the frame with the new value. This
> > could cause userspace to observe two different timestamps
> > for the same frame (and the timestamp could even go
> > backwards depending on how much error we introduce when
> > correcting the timestamp based on the scanout position).
> > =

> > To avoid that let's not update the stored timestamp at all,
> > and instead we just fix up the last recorded hw vblank counter
> > value such that the already stored timestamp/seq number will
> > match. Thus the next time a vblank irq happens it will calculate
> > the correct diff between the current and stored hw vblank counter
> > values.
> > =

> > Sidenote: Another possible idea that came to mind would be to
> > do this correction only if the power really was removed since
> > the last time we sampled the hw frame counter. But to do that
> > we would need a robust way to detect when it has occurred. Some
> > possibilities could involve some kind of hardare power well
> > transition counter, or potentially we could store a magic value
> > in a scratch register that lives in the same power well. But
> > I'm not sure either of those exist, so would need an actual
> > investigation to find out. All of that is very hardware specific
> > of course, so would have to be done in the driver code.
> > =

> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> For testing, there's nothing else than hsw psr that needs this, or that's
> just the box you have locally?

Just the one I happen to have.

Any machine with PSR should be able to hit this. But now that I
refresh my memory I guess HSW/BDW don't actually fully reset the
hw frame counter since they don't have the DC5/6 stuff. But
even on HSW/BDW the frame counter would certainly stop while in
PSR, so maintaining sensible vblank seq numbers will still
require drm_vblank_restore(). Just my further idea of checking
some power well counter/scratch register would not help in cases
where DC states are not used. Instead we'd need some kind of PSR
residency counter/etc.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
