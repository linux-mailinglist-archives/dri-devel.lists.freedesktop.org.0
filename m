Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A551398FE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 19:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CDD6E131;
	Mon, 13 Jan 2020 18:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77589DB7;
 Mon, 13 Jan 2020 18:36:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 10:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="217487703"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2020 10:36:32 -0800
Date: Tue, 14 Jan 2020 00:01:58 +0530
From: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915: add helper functions to get
 device ptr
Message-ID: <20200113183158.GA739@plaxmina-desktop.iind.intel.com>
References: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200113115557.32713-3-pankaj.laxminarayan.bharadiya@intel.com>
 <87imlfmu2s.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87imlfmu2s.fsf@intel.com>
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
Cc: pankaj.laxminaryan.bharadiya@outlook.iglb.intel.com,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, sam@ravnborg.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani, 

On Mon, Jan 13, 2020 at 02:14:51PM +0200, Jani Nikula wrote:
> On Mon, 13 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > We will need struct drm_device pointer to pass it to drm_WARN* calls.
> >
> > Add helper functions to exract drm_device pointer from various structs.
> 
> Please don't do this.
> 
> We use the helpers we currently have when they involve something more
> complex than dereferences, such as container_of() or having to use
> dev_get_drvdata() or pci_get_drvdata().

Removing all the helpers will lead to 3 level access depth wherever
struct drm_device pointer is needed and unnecessary complicate the
drm_WARN* calls IMHO.

e.g.: drm_WARN(&vgpu->gvt->dev_priv.drm, 1)

If you are OK with this, I will remove all the helpers and extract
drm_device pointer while calling drm_WARN*() instead and submit
updated patch series.

Thanks,
Pankaj
> 
> I really don't want people to use e.g.
> 
> 	i915_to_dev(i915)
> 
> over
> 
> 	&i915->drm
> 
> 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h | 14 ++++++++++++++
> >  drivers/gpu/drm/i915/gvt/gvt.h                     |  5 +++++
> >  drivers/gpu/drm/i915/i915_drv.h                    | 11 +++++++++++
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 7964b3dc0046..765878718fe9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1521,6 +1521,20 @@ dp_to_i915(struct intel_dp *intel_dp)
> >  	return to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> >  }
> >  
> > +static inline struct drm_device *enc_to_dev(const struct intel_encoder *encoder)
> > +{
> > +	return encoder->base.dev;
> > +}
> > +
> > +static inline struct drm_device *
> > +crtc_state_to_dev(const struct intel_crtc_state *state)
> > +{
> > +	struct intel_crtc *crtc = to_intel_crtc(state->uapi.crtc);
> > +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> > +
> > +	return i915_to_dev(i915);
> > +}
> > +
> >  static inline struct intel_digital_port *
> >  hdmi_to_dig_port(struct intel_hdmi *intel_hdmi)
> >  {
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> > index b47c6acaf9c0..d257399b075a 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -348,6 +348,11 @@ static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
> >  	return i915->gvt;
> >  }
> >  
> > +static inline struct drm_device *vgpu_to_dev(const struct intel_vgpu *vgpu)
> > +{
> > +	return i915_to_dev(vgpu->gvt->dev_priv);
> > +}
> > +
> >  enum {
> >  	INTEL_GVT_REQUEST_EMULATE_VBLANK = 0,
> >  
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index e7be4c3e43c6..bdc89d021ff8 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1325,6 +1325,17 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
> >  	return pci_get_drvdata(pdev);
> >  }
> >  
> > +static inline struct drm_device *i915_to_dev(struct drm_i915_private *i915)
> > +{
> > +	return &i915->drm;
> > +}
> > +
> > +static inline struct drm_device *
> > +perf_stream_to_dev(const struct i915_perf_stream *stream)
> > +{
> > +	return i915_to_dev(stream->perf->i915);
> > +}
> > +
> >  /* Simple iterator over all initialised engines */
> >  #define for_each_engine(engine__, dev_priv__, id__) \
> >  	for ((id__) = 0; \
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
