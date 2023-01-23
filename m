Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9F678895
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72310E580;
	Mon, 23 Jan 2023 20:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FF210E580
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YRgUZOd5mA4LsWJlKoiq8KE+sOyU2Nkr7GhCPWFBlhA=;
 b=qleLSm/K/50LE/z69SEt95MFA9CPo5qtkPQiRvkho9vZ+FDgG9/T1bljZxRRTTt40kllERf+WbJ/3
 JYKH0Cr017e1rtDBy+EqngCo/LrE1wtDSmIZyFdd8iQDfmX9q67MfSvgn3TO3oeQIN1TTNer42G3id
 6pzqVfe+Agfkdw0iV53Zque5l570naofa1Qv9P5BslGzMpg2Q8a6MJ5VzHy/Ey+jHCKX3DhT0EhbEO
 w+Rp+OiTJXkUQVjNCgjlGieSF/vWUczLXE/ju0+OExzkB8pHgqKTJ0keHEZ/IIeE9uVeIs8WUGszun
 kgP2aAAb0H4M0QaxuD3JZJEIDW/y8PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YRgUZOd5mA4LsWJlKoiq8KE+sOyU2Nkr7GhCPWFBlhA=;
 b=cMd4dvJFRjXtbP1m+Cq0PxgE25fK6tdUadbMXod/ygQmJmc8JO3eJWEjJ++s6X2Ps05GL8A8bwxgx
 mIe6vFjDw==
X-HalOne-ID: 0407d64e-9b5f-11ed-a909-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 0407d64e-9b5f-11ed-a909-11abd97b9443;
 Mon, 23 Jan 2023 20:46:33 +0000 (UTC)
Date: Mon, 23 Jan 2023 21:46:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 85/86] drm: move drm_timeout_abs_to_jiffies to drm_util
Message-ID: <Y87yKPS1UfwL9xp4@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-85-c5cf72d8a5a2@ravnborg.org>
 <43f60723-e1f9-8991-d930-16fec3896219@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43f60723-e1f9-8991-d930-16fec3896219@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jan 23, 2023 at 09:57:13AM +0100, Thomas Zimmermann wrote:
> Hi Sam,
> 
> please see my comment below.
> 
> Am 21.01.23 um 21:09 schrieb Sam Ravnborg via B4 Submission Endpoint:
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > drm_timeout_abs_to_jiffies() was implmented in drm_syncobj where
> > it really did not belong. Create a drm_util file and move the
> > implementation. Likewise move the prototype and update all users.
> > 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > [https://lore.kernel.org/dri-devel/20190527185311.GS21222@phenom.ffwll.local/]
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >   drivers/accel/ivpu/ivpu_gem.c           |  2 +-
> >   drivers/gpu/drm/Makefile                |  1 +
> >   drivers/gpu/drm/drm_syncobj.c           | 34 ----------------------------
> >   drivers/gpu/drm/drm_util.c              | 40 +++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/lima/lima_gem.c         |  2 +-
> >   drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
> >   drivers/gpu/drm/tegra/uapi.c            |  2 +-
> >   include/drm/drm_util.h                  |  1 +
> >   include/drm/drm_utils.h                 |  2 --
> >   9 files changed, 46 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> > index d1f923971b4c..55aa94ba6c10 100644
> > --- a/drivers/accel/ivpu/ivpu_gem.c
> > +++ b/drivers/accel/ivpu/ivpu_gem.c
> > @@ -12,7 +12,7 @@
> >   #include <drm/drm_cache.h>
> >   #include <drm/drm_debugfs.h>
> >   #include <drm/drm_file.h>
> > -#include <drm/drm_utils.h>
> > +#include <drm/drm_util.h>
> >   #include "ivpu_drv.h"
> >   #include "ivpu_gem.h"
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ab4460fcd63f..561b93d19685 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -42,6 +42,7 @@ drm-y := \
> >   	drm_syncobj.o \
> >   	drm_sysfs.o \
> >   	drm_trace_points.o \
> > +	drm_util.o \
> >   	drm_vblank.o \
> >   	drm_vblank_work.o \
> >   	drm_vma_manager.o \
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> > index 0c2be8360525..35f5416c5cfe 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -197,7 +197,6 @@
> >   #include <drm/drm_gem.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_syncobj.h>
> > -#include <drm/drm_utils.h>
> >   #include "drm_internal.h"
> > @@ -1114,39 +1113,6 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
> >   	return timeout;
> >   }
> > -/**
> > - * drm_timeout_abs_to_jiffies - calculate jiffies timeout from absolute value
> > - *
> > - * @timeout_nsec: timeout nsec component in ns, 0 for poll
> > - *
> > - * Calculate the timeout in jiffies from an absolute time in sec/nsec.
> > - */
> > -signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)

Thanks for the critical look at this!

> 
> This function converts an absolute timeout in nsec to a relative timeout in
> jiffies. (?)
> 
> It appears to me as if this helper should not exist. It uses a mixture of
> different time interfaces; combined with hardcoded policy for 0 and
> MAX_SCHEDULE_TIMEOUT.
> 
> There are only 3 callers of this helper. I think we should consider inlining
> it in each.
> 
> As part of this, maybe the use of ktime could go away. Convert nsecs to
> jiffies and do the rest of the computation in jiffies.

I blindly copied the existing function and did not consider the
implementation. Looking for a helper that do what we needs here turned
up empty. I also looked at your suggestion to do:
nsec in absolute => jiffies in absolute => jiffies in relative
But did not find something that is better than what we have.

I will leave it for now, and focus on the other parts of the patchset.
In the vain hope someone else takes a look.

	Sam
