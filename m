Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D04F918C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4F010F164;
	Fri,  8 Apr 2022 09:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5C10F164;
 Fri,  8 Apr 2022 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649409144; x=1680945144;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=+ccHUXN5d338d9q6NLCICEiCDmsPXOWm49VkkZZBxl8=;
 b=LowlkFW+usSjrfSW8DtOIDGAOGY+obZNld4AreHbelcWEL0yi2ecF2ak
 TvpJj0dOTR1D/safvIO/SAUmEGLfgmLFF6QWY9T7U8I59elJ+fIwCClUR
 F1Bv2mvtccU1OHR1piVgc0uVIqP/nZJ8YALf1g0LhdXJkGSPA1mz/Px3T
 w2VA9SGdSdEn6+s0OlM2SYzMu/qtYA4dTdDuKH/LvScFYVA0tIwPa90U2
 M/PE24tKYA6FBX0BjdsA5vkAHjde4e01/dIHF2qjwBUtSHfefdWogJhsU
 +vpXYzFM6hMe4kMVhRXn8h2xkA77dB8p0Kw8Q3uZoOCiEg3LoORYnXhDx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="249080749"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="249080749"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:12:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="723322922"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:12:22 -0700
Date: Fri, 8 Apr 2022 12:12:19 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/dp: Export drm_dp_dpcd_access()
Message-ID: <Yk/8czINqSRIryCC@ideak-desk.fi.intel.com>
References: <20220407183826.724106-1-imre.deak@intel.com>
 <87lewg3d1g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lewg3d1g.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 10:32:11PM +0300, Jani Nikula wrote:
> On Thu, 07 Apr 2022, Imre Deak <imre.deak@intel.com> wrote:
> > The next patch needs a way to read a DPCD register without the preceding
> > wake-up read in drm_dp_dpcd_read(). Export drm_dp_dpcd_access() to allow
> > this.
> 
> I think I'd rather you added a special "probe" function for this
> specific purpose. I think drm_dp_dpcd_access() is a too generic low
> level function to export, and runs the risk of complicating any
> potential future refactoring of the DP AUX code.
> 
> Something like this:
> 
> ssize_t drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> 
> And you could reuse that for the wakeup in drm_dp_dpcd_read() too.

Ok, makes sense, I'll change that.

> BR,
> Jani.
> 
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/dp/drm_dp.c    | 19 +++++++++++++++++--
> >  include/drm/dp/drm_dp_helper.h |  2 ++
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> > index 580016a1b9eb7..8b181314edcbe 100644
> > --- a/drivers/gpu/drm/dp/drm_dp.c
> > +++ b/drivers/gpu/drm/dp/drm_dp.c
> > @@ -470,8 +470,22 @@ drm_dp_dump_access(const struct drm_dp_aux *aux,
> >   * Both native and I2C-over-AUX transactions are supported.
> >   */
> >  
> > -static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> > -			      unsigned int offset, void *buffer, size_t size)
> > +/**
> > + * drm_dp_dpcd_access() - read or write a series of bytes from/to the DPCD
> > + * @aux: DisplayPort AUX channel (SST)
> > + * @request: DP_AUX_NATIVE_READ or DP_AUX_NATIVE_WRITE
> > + * @offset: address of the (first) register to read or write
> > + * @buffer: buffer with the register values to write or the register values read
> > + * @size: number of bytes in @buffer
> > + *
> > + * Returns the number of bytes transferred on success, or a negative error
> > + * code on failure. This is a low-level function only for SST sinks and cases
> > + * where calling drm_dp_dpcd_read()/write() is not possible (for instance due
> > + * to the wake-up register read in drm_dp_dpcd_read()). For all other cases
> > + * the latter functions should be used.
> > + */
> > +int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> > +		       unsigned int offset, void *buffer, size_t size)
> >  {
> >  	struct drm_dp_aux_msg msg;
> >  	unsigned int retry, native_reply;
> > @@ -526,6 +540,7 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> >  	mutex_unlock(&aux->hw_mutex);
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL(drm_dp_dpcd_access);
> >  
> >  /**
> >   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> > diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> > index 1eccd97419436..7cf6e83434a8c 100644
> > --- a/include/drm/dp/drm_dp_helper.h
> > +++ b/include/drm/dp/drm_dp_helper.h
> > @@ -2053,6 +2053,8 @@ struct drm_dp_aux {
> >  	bool is_remote;
> >  };
> >  
> > +int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> > +		       unsigned int offset, void *buffer, size_t size);
> >  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  			 void *buffer, size_t size);
> >  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
