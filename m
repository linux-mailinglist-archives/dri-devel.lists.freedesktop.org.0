Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953DE7DEE39
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 09:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B510E824;
	Thu,  2 Nov 2023 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14610E72E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 15:45:10 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id
 af79cd13be357-7789cb322deso475102985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698853509; x=1699458309;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gIfqH98KQfCzIopKfr9kAVM80xJQ3s0Sgl61/jXKJYs=;
 b=E+qj4MDw4CWG1eSR8/dbf/8MLrhErI/aaQmPYbvp6dfFCiHKhliUD0YOD9nqN7pF3b
 NVC3LqOwaqPKvIEJvIRxXkyRuizlyaEF8GFAk0mawCvAZOfMtha0+TA+sSw/mu6yewRd
 lf+tZ3LGcFNUoQg3WOj8zqgI6e/ftVls2xoyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698853509; x=1699458309;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gIfqH98KQfCzIopKfr9kAVM80xJQ3s0Sgl61/jXKJYs=;
 b=h1bb/8iTQ43c4fh2j2dKRrAYgsfDMfF2QEFTkvDzcpFK+o7ZAKC467TU22Di8iI5tz
 XPz2iQtg9pt4y9WGlqXjvOoApT1ZxmzyAxVyPrajQo8td0mnRfNK2mQPbtUYrvqA7dzS
 hEqeZyLFA2UcgWY/mEQ0XV26O6/ccMfImJ9ZLP3LvKPeyFrgYxyVkFvPWy9DTS8u9t2P
 Ix5ulpNpCxPpg1WrxHcsyWXGhZZpRhVVQlG1tWBIWzEohG1h6ide1xInaHyoLHQdDcHP
 vwRJ+s15C0RrFWenUcdgXYUfz4cRCqPeBcpxuBR/GIEHS0kwPHjZoKeo2U2xy17F8rXz
 UM4A==
X-Gm-Message-State: AOJu0YzSyVDYPDB4lSlMtjNM2V6Rp9lqq/KN3xS7PWSmReSsziLkiuSa
 /PKNWrFH2S4QtqpQY4TiCn+5uA==
X-Google-Smtp-Source: AGHT+IGM+2P898z+SZcGBovYltLuISbCjX5nlXQKdkNDMk9cYXHlOihGD1Vz7JjUGF9bFecCgFXw8Q==
X-Received: by 2002:a05:6214:248f:b0:66d:33c1:3750 with SMTP id
 gi15-20020a056214248f00b0066d33c13750mr17261948qvb.49.1698853509327; 
 Wed, 01 Nov 2023 08:45:09 -0700 (PDT)
Received: from google.com (129.177.85.34.bc.googleusercontent.com.
 [34.85.177.129]) by smtp.gmail.com with ESMTPSA id
 s7-20020ad45007000000b0065afe284b3csm1569209qvo.125.2023.11.01.08.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:45:08 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:45:07 +0000
From: Paz Zcharya <pazz@chromium.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH] drm/i915/display: Only fail fastset on PSR2
Message-ID: <ZUJsUf9f0OA2e6fP@google.com>
References: <20231031232245.1331194-1-pazz@google.com>
 <4cff3a2f0b286fe166a6c1fe0434d34489c34f6a.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cff3a2f0b286fe166a6c1fe0434d34489c34f6a.camel@intel.com>
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:35:03 +0000
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
Cc: "Souza, Jose" <jose.souza@intel.com>, "Coelho,
 Luciano" <luciano.coelho@intel.com>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Lisovskiy,
 Stanislav" <stanislav.lisovskiy@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Banik, Subrata" <subratabanik@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "navaremanasi@chromium.org" <navaremanasi@chromium.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>, "Almahallawy,
 Khaled" <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 06:26:47AM +0000, Hogander, Jouni wrote:
> On Tue, 2023-10-31 at 23:21 +0000, Paz Zcharya wrote:
> > Currently, i915 fails fastset if both the sink and the source support
> > any version of PSR and regardless of the configuration setting of the
> > driver (i.e., i915.enable_psr kernel argument). However, the
> > implementation of PSR1 enable sequence is already seamless
> > and works smoothly with fastset. Accordingly, do not fail fastset
> > if PSR2 is not enabled.
> 
> Thank you for the patch. Check similar patch I sent some time ago to
> trybot:
> 
> https://patchwork.freedesktop.org/series/125392/
> 

I missed this patch. I apologize!
This is great work and exactly what we (Google ChromeOS) need.
I think your patch is better than mine, so let's abort my patch
and continue the discussion at series/125392.

By the way, we have verified your patch on two Meteor Lake devices
running ChromeOS and it works smoothly (no flickering or modesets).
I'll comment on the other patch as well.

> If we want to temporarily do this only for psr1 I think you could check
> what I've done in drivers/gpu/drm/i915/display/intel_display.c in my
> patch and modify your patch accordingly. Otherwise e.g. our IGT
> testcases which are toggling PSR enable/disable/psr1/psr2 are to my
> understanding performing full modeset and possible issues are not
> revealed.
> 
> After modifying drivers/gpu/drm/i915/display/intel_display.c you can
> also verify it is really seamless and smooth by toggling different PSR
> states via /sys/kernel/debug/dri/0/i915_edp_psr_debug. That interface
> is performing atomic commit when PSR mode is changed.
> 
> BR,
> 
> Jouni Högander
> > 
> > Signed-off-by: Paz Zcharya <pazz@google.com>
> > ---
> > 
> >  drivers/gpu/drm/i915/display/intel_dp.c  | 4 ++--
> >  drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
> >  drivers/gpu/drm/i915/display/intel_psr.h | 1 +
> >  3 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index e0e4cb529284..a1af96e31518 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -2584,8 +2584,8 @@ bool intel_dp_initial_fastset_check(struct
> > intel_encoder *encoder,
> >                 fastset = false;
> >         }
> >  
> > -       if (CAN_PSR(intel_dp)) {
> > -               drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] Forcing full
> > modeset to compute PSR state\n",
> > +       if (CAN_PSR(intel_dp) && psr2_global_enabled(intel_dp)) {
> > +               drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] Forcing full
> > modeset due to PSR2\n",
> >                             encoder->base.base.id, encoder-
> > >base.name);
> >                 crtc_state->uapi.mode_changed = true;
> >                 fastset = false;
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > b/drivers/gpu/drm/i915/display/intel_psr.c
> > index 97d5eef10130..388bc3246db9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -187,7 +187,7 @@ static bool psr_global_enabled(struct intel_dp
> > *intel_dp)
> >         }
> >  }
> >  
> > -static bool psr2_global_enabled(struct intel_dp *intel_dp)
> > +bool psr2_global_enabled(struct intel_dp *intel_dp)
> >  {
> >         struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.h
> > b/drivers/gpu/drm/i915/display/intel_psr.h
> > index 0b95e8aa615f..6f3c36389cd3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.h
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.h
> > @@ -21,6 +21,7 @@ struct intel_encoder;
> >  struct intel_plane;
> >  struct intel_plane_state;
> >  
> > +bool psr2_global_enabled(struct intel_dp *intel_dp);
> >  void intel_psr_init_dpcd(struct intel_dp *intel_dp);
> >  void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> >                                 struct intel_crtc *crtc);
> 

.
