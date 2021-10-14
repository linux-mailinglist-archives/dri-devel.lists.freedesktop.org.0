Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA342D60D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8666EC48;
	Thu, 14 Oct 2021 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D66EC48;
 Thu, 14 Oct 2021 09:30:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227598122"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="227598122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 02:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="626744374"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 14 Oct 2021 02:29:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 12:29:58 +0300
Date: Thu, 14 Oct 2021 12:29:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Tomi Sarvela <tomi.p.sarvela@intel.com>
Subject: Re: [PATCH 4/4] drm/i915: Fix oops on platforms w/o hpd support
Message-ID: <YWf4ll+Qr4frshuk@intel.com>
References: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
 <20211014090941.12159-5-ville.syrjala@linux.intel.com>
 <87o87svuao.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o87svuao.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 12:18:23PM +0300, Jani Nikula wrote:
> On Thu, 14 Oct 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > We don't have hpd support on i8xx/i915 which means hotplug_funcs==NULL.
> > Let's not oops when loading the driver on one those machines.
> 
> D'oh!
> 
> Lemme guess, CI just casually dropped the machines from the results
> because they didn't boot?

Dunno where the gdg has gone actually. Tomi?

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Fixes: cd030c7c11a4 ("drm/i915: constify hotplug function vtable.")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hotplug.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > index 3c1cec953b42..0e949a258a22 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > @@ -215,7 +215,8 @@ intel_hpd_irq_storm_switch_to_polling(struct drm_i915_private *dev_priv)
> >  
> >  static void intel_hpd_irq_setup(struct drm_i915_private *i915)
> >  {
> > -	if (i915->display_irqs_enabled && i915->hotplug_funcs->hpd_irq_setup)
> > +	if (i915->display_irqs_enabled &&
> > +	    i915->hotplug_funcs && i915->hotplug_funcs->hpd_irq_setup)
> >  		i915->hotplug_funcs->hpd_irq_setup(i915);
> >  }
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
