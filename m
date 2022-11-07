Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B365861F245
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBD510E2EC;
	Mon,  7 Nov 2022 11:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2310E2EC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667822299; x=1699358299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Kudtt7GElj/JrcQLHug3awsAMVEXLtrGs6IVb3SORo0=;
 b=NlnhmpdQ/nLxjBHf3xFy7ngsjYSl21HKQKSaXiXb0pqsAxptPEEeBX0e
 PGFgQpaPZ8FO5tz+5JYxcmeF/lxTCw0H1NRNx0IyyQD3BFSg/5ij6Z76b
 SlzFwrA7ck37hohhYGuaK8zE0jKf/yuspwI+zIabVWQJXiqF8DloLEQUW
 AjkI0wgJYBon5N1WAk/kfOz6nA3IRj+pmHbHthHJxNorQNIcSsa3fd1x5
 LsKU9pSmvyjD6a6uBtTLSclErd47u21w1whlDi7jxvq/KY3xYKKwRwuEf
 z+1QK11qFMRcOJE5krDeTUbWgUR5uLxfxuHePwZi7+PMnEnSiww8w7gS9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="311526880"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="311526880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 03:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="881045025"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="881045025"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga006.fm.intel.com with SMTP; 07 Nov 2022 03:58:16 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 13:58:15 +0200
Date: Mon, 7 Nov 2022 13:58:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: hdmi: Fix pointer dereference before check
Message-ID: <Y2jy1y3hTXsXmgjS@intel.com>
References: <20221029093413.546103-1-jose.exposito89@gmail.com>
 <20221102090153.tujblkvd3jlhdtxr@houat>
 <20221102111003.GA3233@elementary>
 <20221107082630.tjebvwt4hevhdsos@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107082630.tjebvwt4hevhdsos@houat>
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
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 emma@anholt.net, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 09:26:30AM +0100, Maxime Ripard wrote:
> On Wed, Nov 02, 2022 at 12:10:03PM +0100, José Expósito wrote:
> > Hi Maxime,
> > 
> > Thanks a lot for looking into the patch.
> > 
> > On Wed, Nov 02, 2022 at 10:01:53AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Sat, Oct 29, 2022 at 11:34:13AM +0200, José Expósito wrote:
> > > > Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduced
> > > > the vc4_hdmi_reset_link() function. This function dereferences the
> > > > "connector" pointer before checking whether it is NULL or not.
> > > > 
> > > > Rework variable assignment to avoid this issue.
> > > > 
> > > > Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
> > > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > index 4a73fafca51b..07d058b6afb7 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > @@ -319,9 +319,9 @@ static int reset_pipe(struct drm_crtc *crtc,
> > > >  static int vc4_hdmi_reset_link(struct drm_connector *connector,
> > > >  			       struct drm_modeset_acquire_ctx *ctx)
> > > >  {
> > > > -	struct drm_device *drm = connector->dev;
> > > > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > > > -	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
> > > > +	struct drm_device *drm;
> > > > +	struct vc4_hdmi *vc4_hdmi;
> > > > +	struct drm_encoder *encoder;
> > > >  	struct drm_connector_state *conn_state;
> > > >  	struct drm_crtc_state *crtc_state;
> > > >  	struct drm_crtc *crtc;
> > > > @@ -332,6 +332,10 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
> > > >  	if (!connector)
> > > >  		return 0;
> > > >  
> > > > +	drm = connector->dev;
> > > > +	vc4_hdmi = connector_to_vc4_hdmi(connector);
> > > > +	encoder = &vc4_hdmi->encoder.base;
> > > > +
> > > 
> > > I don't think that's right. Connector shouldn't be NULL to begin with,
> > > how did you notice this?
> > > 
> > > Maxime
> > 
> > This issue was reported by Coverity. At the moment this function is not
> > invoked with a NULL connector by any code path. However, since the NULL
> > check is present, in my opinion, it makes sense to either remove it or
> > make it usefull just in case the preconditions change in the future.
> 
> Yeah, it makes sense
> 
> I'd ask for a small cosmetic change then, could you add the assignments
> where they are actually needed instead of at the top of the function?
> 
> Something like
> 
>  if (!connector)
>  	return 0;

Dunno why you want to keep around dead code like that.
I'd just nuke the bogus null check.

> 
> +drm = connector->dev;
>  ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
> 
> ...
> 
> +vc4_hdmi = connector_to_vc4_hdmi(connector);
>  if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
> 
> ...
> 
> Changing the prototype of vc4_hdmi_supports_scrambling to take a struct
> vc4_hdmi pointer would also help, it's much more convenient.
> 
> Maxime

-- 
Ville Syrjälä
Intel
