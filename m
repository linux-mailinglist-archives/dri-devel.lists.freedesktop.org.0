Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF85541293
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8E10F74B;
	Tue,  7 Jun 2022 19:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1348910F74B;
 Tue,  7 Jun 2022 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654631535; x=1686167535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D8twWzKwINLezuWapLS+OcYZrR82M5X0UEdBij1n5Vg=;
 b=EZqLZ0AUY/p4phQQ9KFCHrR+wZebRRwDxhF3BFgx9qM4AxYNM7g8Atzw
 EivdaGkTUSV636MP5BpZEVW8QInTSPC+1h5LOVEAkwwNhqoDkPFbGA+zY
 WN6CLN8UYCCknBjwAdrhHEJkXlTyoOCrm4+1/pplWS77ER9okTprQkvuY
 OzAOp29AxWN4R7umECAhEWNJREM4TgstJlmol/kesMpqyOChbRd4hC8yY
 ebSYNnPO4nL88BuLtK/Xm8iPIV/+XW+xEdycG+URSmMYqv1lNs2UP/QTq
 Wn/kdHH8y0o9mbBYNjntC329P8huf6AZYyMBgGdBk/d3GfNjTmM0MoIxU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="259718792"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="259718792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 12:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="609337796"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga008.jf.intel.com with SMTP; 07 Jun 2022 12:43:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Jun 2022 22:43:06 +0300
Date: Tue, 7 Jun 2022 22:43:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 06/13] drm/probe-helper: make .get_modes() optional,
 add default action
Message-ID: <Yp+qSsdUM+OIji97@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a38b2547f43e827a401a4123744edbb402e9f4d7.1653381821.git.jani.nikula@intel.com>
 <Ypjv3k6tbHjOtGOB@intel.com> <87mteopvwx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mteopvwx.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 02:14:54PM +0300, Jani Nikula wrote:
> On Thu, 02 Jun 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, May 24, 2022 at 01:39:28PM +0300, Jani Nikula wrote:
> >> Add default action when .get_modes() not set. This also defines what a
> >> .get_modes() hook should do.
> >> 
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_probe_helper.c       | 14 +++++++++++++-
> >>  include/drm/drm_modeset_helper_vtables.h |  4 ++++
> >>  2 files changed, 17 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> >> index 836bcd5b4cb6..9df17f0ae225 100644
> >> --- a/drivers/gpu/drm/drm_probe_helper.c
> >> +++ b/drivers/gpu/drm/drm_probe_helper.c
> >> @@ -360,7 +360,19 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
> >>  		connector->helper_private;
> >>  	int count;
> >>  
> >> -	count = connector_funcs->get_modes(connector);
> >> +	if (connector_funcs->get_modes) {
> >> +		count = connector_funcs->get_modes(connector);
> >> +	} else {
> >> +		const struct drm_edid *drm_edid;
> >> +
> >> +		/* Note: This requires connector->ddc is set */
> >> +		drm_edid = drm_edid_read(connector);
> >> +
> >> +		/* Update modes etc. from the EDID */
> >> +		count = drm_edid_connector_update(connector, drm_edid);
> >> +
> >> +		drm_edid_free(drm_edid);
> >> +	}
> >
> > Not really a huge fan of this automagic fallback. I think I'd prefer
> > to keep it mandatory and just provide this as a helper for drivers to
> > plug into the right spot. Otherwise I'm sure I'll forget how this works
> > and then I'll be confused when I see a connector withput any apparent
> > .get_modes() implementation.
> 
> Fair enough.
> 
> I'm not sure how useful that is going to be, though, at least not for
> i915. If we add a .get_edid hook, where would you bolt that? It doesn't
> feel right to set a .get_modes hook to a default function that goes on
> to call a .get_edid hook. Or what do you think?

If .get_modes() remains mandatory do we need the .get_edid() hook?
Ie. would it be called from anywhere else than from .get_modes()?

So we'd just end with
foo_get_modes()
{
	edid = foo_get_edid();
	drm_edid_connector_update(edid);
}
in drivers than need a custom edid read function.

-- 
Ville Syrjälä
Intel
