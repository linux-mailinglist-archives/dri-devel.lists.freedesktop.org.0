Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1835698391A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 23:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CFC10E030;
	Mon, 23 Sep 2024 21:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNXvwGkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADB910E030
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727127030; x=1758663030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A84xdA9QX58QSy+RwoV1vQ5HOSPIAuuTfBYmt+LPWmI=;
 b=HNXvwGkqQOGOK6DfY2ReqguxTp0Ecacsgzy13kgJk9xPsV3IOfDqjjb5
 Q3R5GXoRR5yygPEcP3PYB+OcwnKEoCx4Hff10LviBMroY5a7UMVn2998H
 pahZduM+K9gjSKkBTz9jgO9bsvqMB5OVar+nmJ+9kWOAUkAg9X4YBiX7x
 fTzF7LXjvZJUjhFOhknS4+o3D4256exlupj7USN857zXA3OyyTtd/4nBt
 +29bmB7w0ONTfNcqF8n0Brx6LV6b0wO//hsqz2u29xo4fky/uqRrA5xq5
 1IT7lnpBTO7m5NxZodIXFYgE2ja1E2Q+JTQlnJTPnJ+M9Lx78VCEFT1zt g==;
X-CSE-ConnectionGUID: npkeKrMWQUatLicpjUrDfQ==
X-CSE-MsgGUID: DU0sKu2dR/CzO5mImxgRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43612530"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43612530"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:30:29 -0700
X-CSE-ConnectionGUID: xpdb+d/SSCqalpCu3qAPIw==
X-CSE-MsgGUID: FT0LYK0fRNG+XqLukVgB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71336622"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 14:30:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 00:30:25 +0300
Date: Tue, 24 Sep 2024 00:30:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
Message-ID: <ZvHd8VV6MO4kfLcL@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de>
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

On Mon, Sep 23, 2024 at 11:04:55PM +0200, Helge Deller wrote:
> On 9/23/24 17:57, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Currently setting cursor_blink attribute to 0 before any fb
> > devices are around does absolutely nothing. When fb devices appear
> > and fbcon becomes active the cursor starts blinking. Fix the problem
> > by recoding the desired state of the attribute even if no fb devices
> > are present at the time.
> >
> > Also adjust the show() method such that it shows the current
> > state of the attribute even when no fb devices are in use.
> >
> > Note that store_cursor_blink() is still a bit dodgy:
> > - seems to be missing some of the other checks that we do
> >    elsewhere when deciding whether the cursor should be
> >    blinking or not
> > - when set to 0 when the cursor is currently invisible due
> >    to blinking, the cursor will remains invisible. We should
> >    either explicitly make it visible here, or wait until the
> >    full blink cycle has finished.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/video/fbdev/core/fbcon.c | 34 +++++++-------------------------
> >   1 file changed, 7 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 2e093535884b..8936fa79b9e0 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -3217,26 +3217,7 @@ static ssize_t show_rotate(struct device *device,
> >   static ssize_t show_cursor_blink(struct device *device,
> >   				 struct device_attribute *attr, char *buf)
> >   {
> > -	struct fb_info *info;
> > -	struct fbcon_ops *ops;
> > -	int idx, blink = -1;
> > -
> > -	console_lock();
> > -	idx = con2fb_map[fg_console];
> > -
> > -	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
> > -		goto err;
> > -
> > -	info = fbcon_registered_fb[idx];
> > -	ops = info->fbcon_par;
> > -
> > -	if (!ops)
> > -		goto err;
> > -
> > -	blink = delayed_work_pending(&ops->cursor_work);
> > -err:
> > -	console_unlock();
> > -	return sysfs_emit(buf, "%d\n", blink);
> > +	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
> 
> I might be wrong and mix up things, but I think the previous code allowed
> to show/set the blink value *per* registered framebuffer console,
> while now you generally enable/disable blinking for all
> framebuffer drivers at once?
> Just thinking of a multiseat setup with different fb drivers
> attached to different monitors with own mouse/keyboards...?!?

There is just a single fbcon device in sysfs, so not really.
It's true that it only ever operated on the fg_console, so
on a first glane it may look like it might be some kind of
per-fb thing. But the state was only recorded in the
fbcon_cursor_noblink singleton, so when another vt becomes
active it'll look at that an not start the blinker.
So I think the per-fb aspect was just an illusion.

The whole interface is a bit of a mess. But I don't
really see why anyone would want to use this on a
per-fb device basis anyway. Either you want blinking
stuff and extra power draw, or you don't.

I think there are ways to turn of blinking via some escape
sequences or something as well, so those could probably
be used on a per-console basis. But I like to use this
sysfs instead because it can't accidentally be re-enabled
when random programs mess around with ttys.

-- 
Ville Syrjälä
Intel
