Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC433FA62
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 22:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7062D89CAA;
	Wed, 17 Mar 2021 21:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17189C63;
 Wed, 17 Mar 2021 21:17:43 +0000 (UTC)
IronPort-SDR: 0uqWvYJXn/xgLBNDX5W78F/XwoK6w8HrtzeXtB9i1J+P1DY/2+hLZNjpAyyEJRXiAviPDwM2KS
 7j7z5kKM+65Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="168824753"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="168824753"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 14:17:41 -0700
IronPort-SDR: AAYchsC5i4LrAN0vhFv8eT2hagSqLhZ4g92YNpGCKK6JxLIzRAKC1aCmpxMLfDd9eTxiLa0PXM
 gyYY1+jmU16w==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="450239592"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 14:17:41 -0700
Date: Wed, 17 Mar 2021 14:23:49 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [Intel-gfx] [PATCH] drm/atomic: Add the crtc to affected crtc
 only if uapi.enable = true
Message-ID: <20210317212349.GA30079@labuser-Z97X-UD5H>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell>
 <20210303204433.GA15819@labuser-Z97X-UD5H>
 <20210304104223.6b3490bc@eldfell>
 <20210309005252.GA27491@labuser-Z97X-UD5H>
 <20210309111350.3be0543f@eldfell>
 <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
 <CAPj87rOtWpBW3u7M+ePPQqT_RKEmCzDA8u4gRfT-HrcRaR7_zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rOtWpBW3u7M+ePPQqT_RKEmCzDA8u4gRfT-HrcRaR7_zg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 11:46:38PM +0000, Daniel Stone wrote:
> On Tue, 16 Mar 2021 at 21:35, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Mar 9, 2021 at 10:14 AM Pekka Paalanen <ppaalanen@gmail.com>
> > wrote:
> > > On Mon, 8 Mar 2021 16:52:58 -0800
> > > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> > > > Hmm well after the actual real commit, since the second crtc is stolen
> > > > even though it is not being used for the display output, it is
> > > > used for joiner so the uapi.enable will be true after the real commit.
> > > >
> > > > so actually the assertion would fail in this case.
> > > >
> > > > @Ville @Danvet any suggestions here in that case?
> >
> > That is very bad. We can't frob uapi state like that. I think that
> > calls for even more checks to make sure kms drivers who try to play
> > clever games don't get it wrong, so we probably need to check uapi
> > enable and active state in another mask before/after ->atomic_check
> > too. Or something like that.
> >
> 
> Yeah. We can _never_ generate externally-visible completion events. We can
> later fail to enable the stolen CRTC - because trying to enable new things
> can fail for any reason whatsoever - but we can't generate spurious
> completion events, as doing so falls into the uncanny valley.
> 
> If the kernel is doing clever things behind userspace's back - such as
> stealing planes or CRTCs - then userspace can never know about it, apart
> from failing to enable those resources later. The kernel can either never
> do anything clever (and make userspace bind them both together), or be
> extremely clever (by hiding the entire details from userspace), but it
> cannot choose the halfway house of doing clever things behind userspace's
> back (such as stealing new CRTCs) whilst also exposing all those details to
> userspace (such as delivering spurious completion events for resources
> userspace never requested to be programmed).
> 
> Cheers,
> Daniel

Yes I agree, in this case there will not be any completion events associated with
the stolen slave CRTC since that does not get used for the output.
The completion events will only occur on the bigjoiner master crtc.

But I guess like Danvet suggested we need a separate mask for keeping track of active and
enabled crtcs before and after atomic check. But need to look at how this will fix
the affected crtc not matching warning.

Manasi

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
