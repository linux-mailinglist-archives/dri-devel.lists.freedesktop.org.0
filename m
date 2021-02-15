Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8C31C081
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 18:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A97189C86;
	Mon, 15 Feb 2021 17:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B76189C86
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:27:02 +0000 (UTC)
IronPort-SDR: idtNs/QsPAQ5bvQQqRQFb9CjyvRI65KbNSfsPaOCZfa6uypXCBUPTG62mShsKI6k60rg5N7Ggq
 QSwJn6TvcP1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="169861786"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="169861786"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:27:01 -0800
IronPort-SDR: KdQlONftpO4RJ2iHd76wR0aG16wYNCqK3rhzi/QeiX6kO7qI4q0Tn3/VucBRbZC0m/R1Am21TF
 sjdA81WNN2ag==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="363866876"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:26:57 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 2CC5220518;
 Mon, 15 Feb 2021 19:26:55 +0200 (EET)
Date: Mon, 15 Feb 2021 19:26:55 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <20210215172655.GL3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 03:41:14PM +0200, Andy Shevchenko wrote:
...
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index ca41e8c00ad7..a5c9fe2e56b3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -771,21 +771,21 @@ static void intel_plane_uapi_info(struct seq_file *m, struct intel_plane *plane)
> >  	const struct intel_plane_state *plane_state =
> >  		to_intel_plane_state(plane->base.state);
> >  	const struct drm_framebuffer *fb = plane_state->uapi.fb;
> > -	struct drm_format_name_buf format_name;
> >  	struct drm_rect src, dst;
> >  	char rot_str[48];
> >  
> >  	src = drm_plane_state_src(&plane_state->uapi);
> >  	dst = drm_plane_state_dest(&plane_state->uapi);
> >  
> > -	if (fb)
> > -		drm_get_format_name(fb->format->format, &format_name);
> > -
> >  	plane_rotation(rot_str, sizeof(rot_str),
> >  		       plane_state->uapi.rotation);
> >  
> > -	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> > -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> > +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> > +	if (fb)
> > +		seq_printf(m, "%p4cc", &fb->format->format);
> > +	else
> > +		seq_puts(m, "n/a");
> 
> > +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> 
> Why not to keep two seq_printf() calls?
> 
> if (fb) {
> 	seq_printf();
> } else {
> 	seq_printf();
> }
> 
> ?

I could, but it'd repeat a lot of the same format string that is very
complicated right now. Therefore I thought it's better to split.

Or do you mean seq_printf() vs. seq_puts()? checkpatch.pl (rightly) warns
about it.

> 
> >  		   fb ? fb->modifier : 0,
> >  		   fb ? fb->width : 0, fb ? fb->height : 0,
> >  		   plane_visibility(plane_state),

-- 
Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
