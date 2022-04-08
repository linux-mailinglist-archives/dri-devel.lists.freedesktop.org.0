Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5484F9FD8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 01:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63D510E144;
	Fri,  8 Apr 2022 23:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20A110E144;
 Fri,  8 Apr 2022 23:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649458957; x=1680994957;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5LQJRMtPBG+xFDZjts9fMc+3ns4KieZfK8HTvnaktI0=;
 b=E+UyO7e3dyKqJ5zjTmOaK1TqaNmR5uwQ7Ly/u1LZ0EaEnbX5WTax18kW
 D/i5cM7Xu9Vqn0bJv16lChewE5EhHDIOLIXSRnzQqDZjxTMAEAputMOy5
 95M6x3WjlcVFGM9tt25Oly3YQPUtr/w4B6+1PJaYL8Sasr3uo1Qiu2IfN
 H6wA1BsdSbMMgKrlM9HIcFOYXSqPXw2oO8GgoG6jt40XsZbU4nS7EWcZ7
 wX1lEjIEh/u9/zU9Afbo4fYgSTjksLwTM0BpvrBjcaCQr0j5Frr5BN8Sf
 fnM9Tt6l06xviZpiFeQ7opmWc8pE5D+xziv/1nxKAf2Bw5d9paHdXw9lS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="286713381"
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="286713381"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 16:02:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="557963655"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 16:02:31 -0700
Date: Sat, 9 Apr 2022 02:02:28 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Subject: Re: [v2,1/2] drm/dp: Factor out a function to probe a DPCD address
Message-ID: <YlC/BMxH+BklOUej@ideak-desk.fi.intel.com>
References: <20220408172154.807900-1-imre.deak@intel.com>
 <4a7027ccd8a5007f460dead096961b5a03bf68aa.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7027ccd8a5007f460dead096961b5a03bf68aa.camel@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 09, 2022 at 01:47:21AM +0300, Almahallawy, Khaled wrote:
> On Fri, 2022-04-08 at 20:21 +0300, Imre Deak wrote:
> > Factor out from drm_dp_dpcd_read() a function to probe a DPCD address
> > with a 1-byte read access. This will be needed by the next patch
> > doing a
> > read from an LTTPR address, which must happen without the preceding
> > wake-up read in drm_dp_dpcd_read().
> >
> > v2: Add a probe function instead of exporting drm_dp_dpcd_access().
> > (Jani)
> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/dp/drm_dp.c    | 28 +++++++++++++++++++++++++---
> >  include/drm/dp/drm_dp_helper.h |  1 +
> >  2 files changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/dp/drm_dp.c
> > b/drivers/gpu/drm/dp/drm_dp.c
> > index 580016a1b9eb7..b58e30132768d 100644
> > --- a/drivers/gpu/drm/dp/drm_dp.c
> > +++ b/drivers/gpu/drm/dp/drm_dp.c
> > @@ -527,6 +527,29 @@ static int drm_dp_dpcd_access(struct drm_dp_aux
> > *aux, u8 request,
> >       return ret;
> >  }
> >
> > +/**
> > + * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read access
> > + * @aux: DisplayPort AUX channel (SST)
> > + * @offset: address of the register to probe
> > + *
> > + * Probe the provided DPCD address by reading 1 byte from it. The function can
> > + * be used to trigger some side-effect the read access has, like waking up the
> > + * sink, without the need for the read-out value.
> > + *
> > + * Returns 0 if the read access suceeded, or a negative error code on failure.
> > + */
> > +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
> > +{
> > +     u8 buffer;
> > +     int ret;
> > +
> > +     ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1);
> > +     WARN_ON(ret == 0);
> > +
> 
> Could you add "drm_dp_dump_access" similar to drm_dp_dpcd_read/write
> in order for this aux tranaction appears in the log?

I considered that, however I'd find the log before each actual read
transfer too verbose.

However logging in case of a failure could be moved here.

> 
> Thanks
> Khaled
> > +     return ret < 0 ? ret : 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_dpcd_probe);
> > +
> >  /**
> >   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> >   * @aux: DisplayPort AUX channel (SST or MST)
> > @@ -559,9 +582,8 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux,
> > unsigned int offset,
> >        * monitor doesn't power down exactly after the throw away
> > read.
> >        */
> >       if (!aux->is_remote) {
> > -             ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ,
> > DP_DPCD_REV,
> > -                                      buffer, 1);
> > -             if (ret != 1)
> > +             ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
> > +             if (ret < 0)
> >                       goto out;
> >       }
> >
> > diff --git a/include/drm/dp/drm_dp_helper.h
> > b/include/drm/dp/drm_dp_helper.h
> > index 1eccd97419436..91af98e6617c6 100644
> > --- a/include/drm/dp/drm_dp_helper.h
> > +++ b/include/drm/dp/drm_dp_helper.h
> > @@ -2053,6 +2053,7 @@ struct drm_dp_aux {
> >       bool is_remote;
> >  };
> >
> > +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> >  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int
> > offset,
> >                        void *buffer, size_t size);
> >  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int
> > offset,
