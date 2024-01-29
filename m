Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1130C840358
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DD611284C;
	Mon, 29 Jan 2024 11:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F88711284A;
 Mon, 29 Jan 2024 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706526010; x=1738062010;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wSjzEQbOtD7ZT845LT57CrxeRbKtml3XThyRwr5N1bQ=;
 b=KDQb3/aGsvxmNztstBMkAK5QlYOD78GdESwY2bMNz41LILpvKVFUY4/T
 kIoTx+bDOpUqDzzLbmYcW85qAr05UnNr8eBP8YpjLe1IT+RaQxmSZ+kD/
 AGXEatQDZG78xNJadudOUs85irq9gsJSyUPAB/6EZj8vARw+IAY4MJnXH
 mpfAP/VMGJFetEPJgs0u6djyQwnUj1PtJOMn2GTPWWiU5aemt/WFGLc4X
 +/igBUO8d/3iVIAfQahYgFRHr1rpdZFRf9Ftcz9iBbzGBOVetr2fuj7s4
 Auc4JMVQNgzIU52otSkz5ieqwujkjve3C1UEwXek4YSMdWHDhlb+xcMYP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="400067039"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="400067039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858063683"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="858063683"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:00:08 -0800
Date: Mon, 29 Jan 2024 13:00:25 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH 03/19] drm/i915/dp: Add support to notify MST connectors
 to retry modesets
Message-ID: <ZbeFCT8lvLl7vEyD@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-4-imre.deak@intel.com>
 <d4db6d48a3397ebaa95a56ad63bf59d4fa0af01d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4db6d48a3397ebaa95a56ad63bf59d4fa0af01d.camel@intel.com>
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

On Mon, Jan 29, 2024 at 12:36:12PM +0200, Hogander, Jouni wrote:
> On Tue, 2024-01-23 at 12:28 +0200, Imre Deak wrote:
> > [...]
> > +void
> > +intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
> > +                                     struct intel_encoder *encoder,
> > +                                     const struct intel_crtc_state *crtc_state,
> > +                                     const struct drm_connector_state *conn_state)
> > +{
> > +       struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
> > +       struct intel_connector *connector;
> > +       struct intel_digital_connector_state *iter_conn_state;
> > +       struct intel_dp *intel_dp;
> > +       int i;
> > +
> > +       if (conn_state) {
> > +               connector = to_intel_connector(conn_state->connector);
> > +               intel_dp_queue_modeset_retry_work(connector);
> > +
> > +               return;
> > +       }
> > +
> > +       if (drm_WARN_ON(&i915->drm,
> > +                       !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
> > +               return;
> > +
> > +       intel_dp = enc_to_intel_dp(encoder);
> > +
> > +       for_each_new_intel_connector_in_state(state, connector, iter_conn_state, i) {
> > +               (void)iter_conn_state;
> 
> Checked iter_conn_state->base->crtc documentation:
> 
> @crtc: CRTC to connect connector to, NULL if disabled.
> 
> Do we need to check if connector is "disabled" or is it impossible
> scenario?

Yes, it does show if the connector is disabled and it would make sense
to not notify those. However the check for that would be racy, at least
during a non-blocking commit, but I think also in general where
userspace could be in the middle of enabling this connector.

The point of the notification is that userspace re-checks the mode it
wants on each MST connector to be enabled, so to prevent that it would
miss the re-check on connectors with a pending enabling like above, the
notification is simply sent to all the connectors in the MST topology.

> 
> BR,
> 
> Jouni Högander
> 
> 
> > +
> > +               if (connector->mst_port != intel_dp)
> > +                       continue;
> > +
> > +               intel_dp_queue_modeset_retry_work(connector);
> > +       }
> > +}
> > +
> >  int
> >  intel_dp_compute_config(struct intel_encoder *encoder,
> >                         struct intel_crtc_state *pipe_config,
> > @@ -6436,6 +6480,14 @@ static void
> > intel_dp_modeset_retry_work_fn(struct work_struct *work)
> >         mutex_unlock(&connector->dev->mode_config.mutex);
> >         /* Send Hotplug uevent so userspace can reprobe */
> >         drm_kms_helper_connector_hotplug_event(connector);
> > +
> > +       drm_connector_put(connector);
> > +}
> > +
> > +void intel_dp_init_modeset_retry_work(struct intel_connector
> > *connector)
> > +{
> > +       INIT_WORK(&connector->modeset_retry_work,
> > +                 intel_dp_modeset_retry_work_fn);
> >  }
> >
> >  bool
> > @@ -6452,8 +6504,7 @@ intel_dp_init_connector(struct
> > intel_digital_port *dig_port,
> >         int type;
> >
> >         /* Initialize the work for modeset in case of link train
> > failure */
> > -       INIT_WORK(&intel_connector->modeset_retry_work,
> > -                 intel_dp_modeset_retry_work_fn);
> > +       intel_dp_init_modeset_retry_work(intel_connector);
> >
> >         if (drm_WARN(dev, dig_port->max_lanes < 1,
> >                      "Not enough lanes (%d) for DP on
> > [ENCODER:%d:%s]\n",
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index 530cc97bc42f4..105c2086310db 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -23,6 +23,8 @@ struct intel_digital_port;
> >  struct intel_dp;
> >  struct intel_encoder;
> >
> > +struct work_struct;
> > +
> >  struct link_config_limits {
> >         int min_rate, max_rate;
> >         int min_lane_count, max_lane_count;
> > @@ -43,6 +45,12 @@ void intel_dp_adjust_compliance_config(struct
> > intel_dp *intel_dp,
> >  bool intel_dp_limited_color_range(const struct intel_crtc_state
> > *crtc_state,
> >                                   const struct drm_connector_state
> > *conn_state);
> >  int intel_dp_min_bpp(enum intel_output_format output_format);
> > +void intel_dp_init_modeset_retry_work(struct intel_connector
> > *connector);
> > +void intel_dp_queue_modeset_retry_work(struct intel_connector
> > *connector);
> > +void intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state
> > *state,
> > +                                          struct intel_encoder
> > *encoder,
> > +                                          const struct
> > intel_crtc_state *crtc_state,
> > +                                          const struct
> > drm_connector_state *conn_state);
> >  bool intel_dp_init_connector(struct intel_digital_port *dig_port,
> >                              struct intel_connector
> > *intel_connector);
> >  void intel_dp_set_link_params(struct intel_dp *intel_dp,
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 1abfafbbfa757..7b140cbf8dd31 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -1075,7 +1075,6 @@ static void
> > intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
> >                                                      const struct
> > intel_crtc_state *crtc_state)
> >  {
> >         struct intel_connector *intel_connector = intel_dp-
> > >attached_connector;
> > -       struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >
> >         if (!intel_digital_port_connected(&dp_to_dig_port(intel_dp)-
> > >base)) {
> >                 lt_dbg(intel_dp, DP_PHY_DPRX, "Link Training failed
> > on disconnected sink.\n");
> > @@ -1093,7 +1092,7 @@ static void
> > intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
> >         }
> >
> >         /* Schedule a Hotplug Uevent to userspace to start modeset */
> > -       queue_work(i915->unordered_wq, &intel_connector-
> > >modeset_retry_work);
> > +       intel_dp_queue_modeset_retry_work(intel_connector);
> >  }
> >
> >  /* Perform the link training on all LTTPRs and the DPRX on a link.
> > */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 5fa25a5a36b55..b15e43ebf138b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -1542,6 +1542,8 @@ static struct drm_connector
> > *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >         intel_connector->port = port;
> >         drm_dp_mst_get_port_malloc(port);
> >
> > +       intel_dp_init_modeset_retry_work(intel_connector);
> > +
> >         intel_connector->dp.dsc_decompression_aux =
> > drm_dp_mst_dsc_aux_for_port(port);
> >         intel_dp_mst_read_decompression_port_dsc_caps(intel_dp,
> > intel_connector);
> >         intel_connector->dp.dsc_hblank_expansion_quirk =
> 
