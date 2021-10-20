Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8743554A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 23:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E716E3D2;
	Wed, 20 Oct 2021 21:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D94E6E3D2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634765431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV1rIRTbOsjZSGuHadXECmZG9Ht5wqarQfGNXPGidus=;
 b=VNJJK4cpTtiSzD21m3lLwkcWhcAA3YthOZWWZUIoXOGAmhRhfkiGmYtjMnlMu1LT6qnQfj
 xqHc93LqRV6b44cWpkWnW/zjyMeXW2lRzf4pW5PUYTvw0YTAGlMAuxaYexNGmp/6gogc2g
 pklBaxqWfXW5WDQ8D5ip2eIW8N42amE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-hjqN7GHdMoysuaEbLaszzQ-1; Wed, 20 Oct 2021 17:30:27 -0400
X-MC-Unique: hjqN7GHdMoysuaEbLaszzQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 ey7-20020a0562140b6700b00382cf3eb480so3825501qvb.22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 14:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RV1rIRTbOsjZSGuHadXECmZG9Ht5wqarQfGNXPGidus=;
 b=Nbkef140/jnWX4bwOJhjtQbDecrj2xY+Lq3ORD+GdX1sqJyshGXoj9m9x01+plVw1r
 nZVk2+VOw9AxDtEj+1YIKm+cxG6lO3fnHGRReAzZyZp3AIl6oLr2sQUrJU2GXPM0AITY
 7HGkkHKplacuNKitE3CfRLgbz7jHeoGBD/bSVeXcvueMryGE6yWeuRpwEUkal0KMr761
 uwc4Idu1VCNIWlFWlBgcK5hfLrix/m3mFKUdUTSCeYS2uAXvCEp6iFG59fCFt8eM0+7W
 x2lxV/U0LaQ2yokkudmeXALgdscfhUrs+ohejhP/7s23WdPxGAWoK//KuwwQEWi8xF9g
 hBSA==
X-Gm-Message-State: AOAM532UVakTY3PeyQD5/pphs0+zjhg7uTz4/Q1nqU1k6VV2lVO6WO3/
 lWzKGXv8wxL3SM/rpqDI3Cak7y6zK2dGOqogCO4BfWoezVykoDBlfkTOyJHar8DYDfGDfOw6/xS
 cY6dedWO7SH0lP7dxKdsq4RL+JJQx
X-Received: by 2002:a05:622a:1441:: with SMTP id
 v1mr1867650qtx.45.1634765427221; 
 Wed, 20 Oct 2021 14:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxttYgyOhoBD/hfsiaamAqXyKnPdFWlhkE27NB7JaYHoHjqQJXVxg+Z5QWhx0ZQmTuKEZOxbQ==
X-Received: by 2002:a05:622a:1441:: with SMTP id
 v1mr1867618qtx.45.1634765426912; 
 Wed, 20 Oct 2021 14:30:26 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id g1sm1534825qkd.89.2021.10.20.14.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 14:30:26 -0700 (PDT)
Message-ID: <44f678228c1654af51f2781304b96bb1885b14f2.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/i915: Add support for panels with VESA
 backlights with PWM enable/disable
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, stable@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,  Sean
 Paul <seanpaul@chromium.org>, open list <linux-kernel@vger.kernel.org>
Date: Wed, 20 Oct 2021 17:30:25 -0400
In-Reply-To: <YW8J8Nc7UJnISaVg@intel.com>
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-2-lyude@redhat.com> <YW8J8Nc7UJnISaVg@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-10-19 at 21:09 +0300, Ville Syrjälä wrote:
> On Tue, Oct 05, 2021 at 10:40:14PM -0400, Lyude Paul wrote:
> > This simply adds proper support for panel backlights that can be
> > controlled
> > via VESA's backlight control protocol, but which also require that we
> > enable and disable the backlight via PWM instead of via the DPCD
> > interface.
> > We also enable this by default, in order to fix some people's backlights
> > that were broken by not having this enabled.
> > 
> > For reference, backlights that require this and use VESA's backlight
> > interface tend to be laptops with hybrid GPUs, but this very well may
> > change in the future.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/3680
> > Fixes: fe7d52bccab6 ("drm/i915/dp: Don't use DPCD backlights that need PWM
> > enable/disable")
> > Cc: <stable@vger.kernel.org> # v5.12+
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 24 ++++++++++++++-----
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 569d17b4d00f..594fdc7453ca 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -293,6 +293,10 @@ intel_dp_aux_vesa_enable_backlight(const struct
> > intel_crtc_state *crtc_state,
> >         struct intel_panel *panel = &connector->panel;
> >         struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> >  
> > +       if (!panel->backlight.edp.vesa.info.aux_enable)
> > +               panel->backlight.pwm_funcs->enable(crtc_state, conn_state,
> > +                                                  panel-
> > >backlight.pwm_level_max);
> 
> What't the story here with the non-inverted max vs. pontetially inverted
> 0 in the counterpart?

OH! Nice catch,  I wonder if this explains some of the weirdness with samus-
fi-bdw…

Anyway-unfortunately I don't know the precise answer to if we're supposed to
be inverting the panel backlight level or not, so I'd say we should probably
just go with whatever the Intel HDR AUX interface is currently doing - which
is inverting the panel PWM level when needed. Will fix this in a respin
shortly

> 
> > +
> >         drm_edp_backlight_enable(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info, level);
> >  }
> >  
> > @@ -304,6 +308,10 @@ static void intel_dp_aux_vesa_disable_backlight(const
> > struct drm_connector_state
> >         struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> >  
> >         drm_edp_backlight_disable(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info);
> > +
> > +       if (!panel->backlight.edp.vesa.info.aux_enable)
> > +               panel->backlight.pwm_funcs->disable(old_conn_state,
> > +                                                  
> > intel_backlight_invert_pwm_level(connector, 0));
> >  }
> >  
> >  static int intel_dp_aux_vesa_setup_backlight(struct intel_connector
> > *connector, enum pipe pipe)
> > @@ -321,6 +329,15 @@ static int intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >         if (ret < 0)
> >                 return ret;
> >  
> > +       if (!panel->backlight.edp.vesa.info.aux_enable) {
> > +               ret = panel->backlight.pwm_funcs->setup(connector, pipe);
> > +               if (ret < 0) {
> > +                       drm_err(&i915->drm,
> > +                               "Failed to setup PWM backlight controls
> > for eDP backlight: %d\n",
> > +                               ret);
> > +                       return ret;
> > +               }
> > +       }
> >         panel->backlight.max = panel->backlight.edp.vesa.info.max;
> >         panel->backlight.min = 0;
> >         if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> > @@ -340,12 +357,7 @@ intel_dp_aux_supports_vesa_backlight(struct
> > intel_connector *connector)
> >         struct intel_dp *intel_dp = intel_attached_dp(connector);
> >         struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  
> > -       /* TODO: We currently only support AUX only backlight
> > configurations, not backlights which
> > -        * require a mix of PWM and AUX controls to work. In the mean
> > time, these machines typically
> > -        * work just fine using normal PWM controls anyway.
> > -        */
> > -       if ((intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> > -           drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
> > +       if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
> >                 drm_dbg_kms(&i915->drm, "AUX Backlight Control
> > Supported!\n");
> >                 return true;
> >         }
> > -- 
> > 2.31.1
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

