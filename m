Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCA13C342
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8617F6E9E3;
	Wed, 15 Jan 2020 13:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF19A6E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:34:37 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id l197so1215952ybf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 05:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=SjyJ8FUoNBztn/XN7b2tTdGuXGX2i50a5cRCXPq0i6o=;
 b=IKE2KNpKBYm16nQQqmaqR45RV58KhAxWl5t3L7AA9BADAcJ4HfmwfQCV6/DkeAAsFe
 zCYCSYe2L9xwnfwYwPErzshXqfQFwadcF3qs4x0vXzhGjHVHDKnIxlNkT7xA0cbuadGr
 lXEztDTnr+ZrQiTVEAWI0m3bXOqcC7mXSvhR+RQHP/rFWugvogculBHvABz+bTLeROMc
 4y0tKWMJhaUEzipy4Ikso3mLfwUcnJU/DVWpIGz+allMSDi41UGHPK0gtKq3igRIXJQ1
 U265Z1YBryagy86AXB8NZzd5JBs0LKjYmKTdhZiTG2hEigwrAIjYXiRlPCaPCgXxYdy6
 g0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SjyJ8FUoNBztn/XN7b2tTdGuXGX2i50a5cRCXPq0i6o=;
 b=hyG2QWww35sIneRSKENqRMxdIRDJ26typ4v1LDgGoTk5WifiJRgOPW3v1ewdd6CDdA
 lz+rLst6NKzjL4gAbbwFcixoIjQs8aKLKwEYUGZoRVUlmQQT3Kx0SZVUpT3tCKW+hkOL
 R4v9SBZXFC0juI0UEf6T6j+8siSv2czYqJtYkJn5hCLlxP/uqPalXEUDLcfOIINbBwzA
 nijg9xLPFwHeOJPgVdV3LVoa+cvLA7FoCrDEpNhWFbzjeHjJYr9lJwIDjruTKq93Dl+X
 Z+BvxUQBHl7nH6vLAlcZgRc+GPNCb1ZZMDg5iEX90Bi6mPFljU4A6SHq68jXOFuBnYXt
 0evw==
X-Gm-Message-State: APjAAAWdRabhLn5r9SKtR+0FLVmnjsrzLumYMCZWfBvw7lFp790cKsvc
 xiJeWHUigXm4ae9LhsSByOIkXA==
X-Google-Smtp-Source: APXvYqwq54wviz/WXQ4drueIIkBDTtbJfX0CYs/zEdmUcYfgJoJlZ7GkArAK8aGa3PwZdkljnJiowA==
X-Received: by 2002:a25:9ac5:: with SMTP id t5mr21049208ybo.153.1579095276911; 
 Wed, 15 Jan 2020 05:34:36 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id y66sm8093250ywf.79.2020.01.15.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 05:34:36 -0800 (PST)
Date: Wed, 15 Jan 2020 08:34:35 -0500
From: Sean Paul <sean@poorly.run>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115133435.GB25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <87v9pdj9o0.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v9pdj9o0.fsf@intel.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 12:28:31PM +0200, Jani Nikula wrote:
> On Tue, 14 Jan 2020, Sean Paul <sean@poorly.run> wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch uses a ring_buffer to keep a "flight recorder" (name credit =
Weston)
> > of DRM logs for a specified set of debug categories. The user writes a
> > bitmask of debug categories to the "trace_mask" node and can read log
> > messages from the "trace" node.
> >
> > These nodes currently exist in debugfs under the dri directory. I
> > intended on exposing all of this through tracefs originally, but the
> > tracefs entry points are not exposed, so there's no way to create
> > tracefs files from drivers at the moment. I think it would be a
> > worthwhile endeavour, but one requiring more time and conversation to
> > ensure the drm traces fit somewhere sensible.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.1955=
40-1-sean@poorly.run #v1
> > Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/24=
3230.html #v2
> > Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.1424=
37-1-sean@poorly.run #v3
> >
> > Changes in v2:
> > - Went with a completely different approach:
> > https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.h=
tml
> >
> > Changes in v3:
> > - Changed commit message to be a bit less RFC-y
> > - Make class_drm_category_log an actual trace class
> >
> > Changes in v4:
> > - Instead of [ab]using trace events and the system trace buffer, use our
> >   own ringbuffer
> > ---
> > ---
> >  Documentation/gpu/drm-uapi.rst |   9 +
> >  drivers/gpu/drm/Kconfig        |   1 +
> >  drivers/gpu/drm/Makefile       |   2 +-
> >  drivers/gpu/drm/drm_drv.c      |   3 +
> >  drivers/gpu/drm/drm_print.c    |  80 +++++--
> >  drivers/gpu/drm/drm_trace.c    | 376 +++++++++++++++++++++++++++++++++
> >  include/drm/drm_print.h        |  39 ++++
> >  7 files changed, 487 insertions(+), 23 deletions(-)
> >  create mode 100644 drivers/gpu/drm/drm_trace.c
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 56fec6ed1ad8..089eb6fd3e94 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -312,6 +312,15 @@ Debugfs Support
> >  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
> >     :export:
> >  =

> > +DRM Tracing
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_trace.c
> > +   :doc: DRM Tracing
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_trace.c
> > +   :internal:
> > +
> >  Sysfs Support
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =

> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index d0aa6cff2e02..9d8077e87afe 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -14,6 +14,7 @@ menuconfig DRM
> >  	select I2C
> >  	select I2C_ALGOBIT
> >  	select DMA_SHARED_BUFFER
> > +	select RING_BUFFER
> >  	select SYNC_FILE
> >  	help
> >  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 6493088a0fdd..88b4674934e6 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -29,7 +29,7 @@ drm-$(CONFIG_DRM_PANEL) +=3D drm_panel.o
> >  drm-$(CONFIG_OF) +=3D drm_of.o
> >  drm-$(CONFIG_AGP) +=3D drm_agpsupport.o
> >  drm-$(CONFIG_PCI) +=3D drm_pci.o
> > -drm-$(CONFIG_DEBUG_FS) +=3D drm_debugfs.o drm_debugfs_crc.o
> > +drm-$(CONFIG_DEBUG_FS) +=3D drm_debugfs.o drm_debugfs_crc.o drm_trace.o
> >  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) +=3D drm_edid_load.o
> >  =

> >  drm_vram_helper-y :=3D drm_gem_vram_helper.o \
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 7c18a980cd4b..98260b9f8004 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -1114,6 +1114,7 @@ static const struct file_operations drm_stub_fops=
 =3D {
> >  static void drm_core_exit(void)
> >  {
> >  	unregister_chrdev(DRM_MAJOR, "drm");
> > +	drm_trace_cleanup();
> >  	debugfs_remove(drm_debugfs_root);
> >  	drm_sysfs_destroy();
> >  	idr_destroy(&drm_minors_idr);
> > @@ -1135,6 +1136,8 @@ static int __init drm_core_init(void)
> >  =

> >  	drm_debugfs_root =3D debugfs_create_dir("dri", NULL);
> >  =

> > +	WARN_ON(drm_trace_init(drm_debugfs_root));
> > +
> >  	ret =3D register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
> >  	if (ret < 0)
> >  		goto error;
> > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > index 111b932cf2a9..0ac1867937bf 100644
> > --- a/drivers/gpu/drm/drm_print.c
> > +++ b/drivers/gpu/drm/drm_print.c
> > @@ -262,21 +262,37 @@ void drm_dev_dbg(const struct device *dev, enum d=
rm_debug_category category,
> >  	struct va_format vaf;
> >  	va_list args;
> >  =

> > -	if (!drm_debug_enabled(category))
> > -		return;
> > -
> > -	va_start(args, format);
> > -	vaf.fmt =3D format;
> > -	vaf.va =3D &args;
> > -
> > -	if (dev)
> > -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> > -			   __builtin_return_address(0), &vaf);
> > -	else
> > -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > -		       __builtin_return_address(0), &vaf);
> > +	if (drm_debug_enabled(category)) {
> > +		va_start(args, format);
> > +		vaf.fmt =3D format;
> > +		vaf.va =3D &args;
> > +
> > +		if (dev)
> > +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> > +				   __builtin_return_address(0), &vaf);
> > +		else
> > +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > +			       __builtin_return_address(0), &vaf);
> > +
> > +		va_end(args);
> > +	}
> >  =

> > -	va_end(args);
> > +	if (drm_trace_enabled(category)) {
> > +		va_start(args, format);
> > +		vaf.fmt =3D format;
> > +		vaf.va =3D &args;
> > +
> > +		if (dev)
> > +			drm_dev_trace_printf(dev, "[%ps] %pV",
> > +					     __builtin_return_address(0),
> > +					     &vaf);
> > +		else
> > +			drm_trace_printf("[%ps] %pV",
> > +					 __builtin_return_address(0),
> > +					 &vaf);
> > +
> > +		va_end(args);
> > +	}
> >  }
> >  EXPORT_SYMBOL(drm_dev_dbg);
> >  =

> > @@ -285,17 +301,28 @@ void __drm_dbg(enum drm_debug_category category, =
const char *format, ...)
> >  	struct va_format vaf;
> >  	va_list args;
> >  =

> > -	if (!drm_debug_enabled(category))
> > -		return;
> >  =

> > -	va_start(args, format);
> > -	vaf.fmt =3D format;
> > -	vaf.va =3D &args;
> > +	if (drm_debug_enabled(category)) {
> > +		va_start(args, format);
> > +		vaf.fmt =3D format;
> > +		vaf.va =3D &args;
> >  =

> > -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > -	       __builtin_return_address(0), &vaf);
> > +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> > +		       __builtin_return_address(0), &vaf);
> >  =

> > -	va_end(args);
> > +		va_end(args);
> > +	}
> > +
> > +	if (drm_trace_enabled(category)) {
> > +		va_start(args, format);
> > +		vaf.fmt =3D format;
> > +		vaf.va =3D &args;
> > +
> > +		drm_trace_printf("[%ps] %pV", __builtin_return_address(0),
> > +				 &vaf);
> > +
> > +		va_end(args);
> > +	}
> >  }
> >  EXPORT_SYMBOL(__drm_dbg);
> >  =

> > @@ -312,6 +339,15 @@ void __drm_err(const char *format, ...)
> >  	       __builtin_return_address(0), &vaf);
> >  =

> >  	va_end(args);
> > +
> > +	va_start(args, format);
> > +	vaf.fmt =3D format;
> > +	vaf.va =3D &args;
> > +
> > +	drm_trace_printf("[%ps] *ERROR* %pV", __builtin_return_address(0),
> > +			 &vaf);
> > +
> > +	va_end(args);
> =

> All the new non-debug struct drm_device based logging macros I added are
> just thin wrappers around the dev_<level> ones. The only benefit of
> __drm_err() is adding __builtin_return_address(0), which I think should
> not be relevant in an error level print; it should be non-ambiguous
> without it. IMO the function names are noise in non-debug logging. I'd
> consider removing the __drm_err() function altogether:
> =

>  #define DRM_ERROR(fmt, ...)						\
> -	__drm_err(fmt, ##__VA_ARGS__)
> +	_DRM_PRINTK(, ERR, "*ERROR* " fmt, ##__VA_ARGS__)

Hmm, I think we will want to keep errors in the trace since that makes
debugging from the trace a lot easier (trace timestamps might not line up
exactly with dmesg).

> =

> What this means is that you wouldn't get the drm trace on error level
> logging. However, you already weren't getting it on any of the other
> levels either, nor were you getting it for DRM_DEV_ERROR() which uses
> drm_dev_printk().

Ick, this is an oversight on my part, they should be included.

Sean

> =

> =

> BR,
> Jani.
> =

> =

> >  }
> >  EXPORT_SYMBOL(__drm_err);
> >  =

> > diff --git a/drivers/gpu/drm/drm_trace.c b/drivers/gpu/drm/drm_trace.c
> > new file mode 100644
> > index 000000000000..0e7cf342d1d9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_trace.c
> > @@ -0,0 +1,376 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (C) 2020 Google, Inc.
> > + *
> > + * Authors:
> > + * Sean Paul <seanpaul@chromium.org>
> > + */
> > +
> > +#include <linux/cpumask.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/kernel.h>
> > +#include <linux/ring_buffer.h>
> > +#include <linux/slab.h>
> > +#include <linux/stat.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> > +
> > +#define DRM_TRACE_MAX_LEN	256
> > +
> > +/**
> > + * DOC: DRM Tracing
> > + *
> > + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM=
 debug
> > + * logging.
> > + *
> > + * While DRM logging is quite convenient when reproducing a specific i=
ssue, it
> > + * doesn't help when something goes wrong unexpectedly. There are a co=
uple
> > + * reasons why one does not want to enable DRM logging at all times:
> > + *
> > + * 1. We don't want to overwhelm syslog with drm spam, others have to =
use it too
> > + * 2. Console logging is slow
> > + *
> > + * DRM tracing aims to solve both these problems.
> > + *
> > + * To use DRM tracing, write a DRM debug category mask (this is a bitm=
ask of
> > + * &drm_debug_category values) to the trace_mask file:
> > + * ::
> > + *
> > + *    eg: echo 0x106 > /sys/kernel/debug/dri/trace_mask
> > + *
> > + * Once active, all log messages in the specified categories will be w=
ritten to
> > + * the DRM trace. Once at capacity, the trace will overwrite old messa=
ges with
> > + * new ones. At any point, one can read the trace file to extract the =
previous N
> > + * DRM messages:
> > + * ::
> > + *
> > + *    eg: cat /sys/kernel/debug/dri/trace
> > + *
> > + * Considerations
> > + * **************
> > + * The contents of the DRM Trace are **not** considered UABI. **DO NOT=
 depend on
> > + * the values of these traces in your userspace.** These traces are in=
tended for
> > + * entertainment purposes only. The contents of these logs carry no wa=
rranty,
> > + * expressed or implied.
> > + *
> > + * New traces can not be added to the trace buffer while it is being r=
ead. If
> > + * this proves to be a problem, it can be mitigated by making a copy o=
f the
> > + * buffer on start of read. Since DRM trace is not meant to be continu=
ously
> > + * read, this loss is acceptable.
> > + *
> > + * The timestamps on logs are CPU-local. As such, log messages from di=
fferent
> > + * CPUs may have slightly different ideas about time.
> > + *
> > + * Since each CPU has its own buffer, they won't all overflow at the s=
ame rate.
> > + * This means that messages from a particularly active CPU could be dr=
opped
> > + * while an inactive CPU might have much older log messages. So don't =
be fooled
> > + * if you seem to be missing log messages when you see a switch betwee=
n CPUs in
> > + * the logs.
> > + *
> > + * Internals
> > + * *********
> > + * The DRM Tracing functions are intentionally unexported, they are no=
t meant to
> > + * be used by drivers directly. The reasons are twofold:
> > + *
> > + * 1. All messages going to traces should also go to the console logs.=
 This
> > + *    ensures users can choose their logging medium without fear they'=
re losing
> > + *    messages.
> > + * 2. Writing directly to the trace skips category filtering, resultin=
g in trace
> > + *    spam.
> > + */
> > +
> > +struct drm_trace_info {
> > +	struct ring_buffer *buffer;
> > +	struct dentry *debugfs;
> > +	struct dentry *debugfs_mask;
> > +	enum drm_debug_category category_mask;
> > +};
> > +static struct drm_trace_info drm_trace;
> > +
> > +struct drm_trace_seq_iter {
> > +	loff_t pos;
> > +	cpumask_var_t cpu_mask;
> > +	int cpu;
> > +	u64 ts;
> > +};
> > +
> > +static void *drm_trace_seq_start(struct seq_file *seq_file, loff_t *po=
s)
> > +{
> > +	struct drm_trace_info *info =3D seq_file->private;
> > +	struct drm_trace_seq_iter *iter;
> > +	int cpu;
> > +
> > +	iter =3D kzalloc(sizeof(*iter), GFP_KERNEL);
> > +	if (!iter)
> > +		return NULL;
> > +
> > +	if (!zalloc_cpumask_var(&iter->cpu_mask, GFP_KERNEL))
> > +		return NULL;
> > +
> > +	/*
> > +	 * TODO: We could do better than stopping record for the entirety of =
the
> > +	 *	 read session.
> > +	 */
> > +	ring_buffer_record_off(info->buffer);
> > +
> > +	/*
> > +	 * pos is only used as a means of determining whether we're at the st=
art
> > +	 * of the virtual file, or continuing a read. We don't want to skip o=
ver
> > +	 * log lines since that's not a meaningful thing to do.
> > +	 */
> > +	iter->pos =3D *pos;
> > +
> > +	iter->cpu =3D -1;
> > +
> > +	/*
> > +	 * There's no way to extract the ring buffer's cpumask, so we'll try
> > +	 * every possible cpu and skip the invalid entries.
> > +	 */
> > +	for_each_possible_cpu(cpu) {
> > +		if (ring_buffer_entries_cpu(info->buffer, cpu))
> > +			cpumask_set_cpu(cpu, iter->cpu_mask);
> > +	}
> > +
> > +	return iter;
> > +}
> > +
> > +static void *drm_trace_seq_next(struct seq_file *seq_file, void *data,
> > +				loff_t *pos)
> > +{
> > +	struct drm_trace_info *info =3D seq_file->private;
> > +	struct drm_trace_seq_iter *iter =3D data;
> > +	int cpu;
> > +
> > +	*pos =3D ++iter->pos;
> > +	iter->cpu =3D -1;
> > +	iter->ts =3D 0;
> > +
> > +	/* Find the oldest event across our cpu_mask */
> > +	for_each_cpu(cpu, iter->cpu_mask) {
> > +		u64 ts;
> > +
> > +		if (!ring_buffer_peek(info->buffer, cpu, &ts, NULL)) {
> > +			cpumask_clear_cpu(cpu, iter->cpu_mask);
> > +			continue;
> > +		}
> > +		if (iter->cpu =3D=3D -1 || ts < iter->ts) {
> > +			iter->ts =3D ts;
> > +			iter->cpu =3D cpu;
> > +		}
> > +	}
> > +	if (iter->cpu =3D=3D -1)
> > +		return NULL;
> > +
> > +	return iter;
> > +}
> > +
> > +static void drm_trace_seq_stop(struct seq_file *seq_file, void *data)
> > +{
> > +	struct drm_trace_info *info =3D seq_file->private;
> > +	struct drm_trace_seq_iter *iter =3D data;
> > +
> > +	free_cpumask_var(iter->cpu_mask);
> > +	kfree(iter);
> > +
> > +	ring_buffer_record_on(info->buffer);
> > +}
> > +
> > +static int drm_trace_seq_show(struct seq_file *seq_file, void *data)
> > +{
> > +	struct drm_trace_info *info =3D seq_file->private;
> > +	struct drm_trace_seq_iter *iter =3D data;
> > +	struct ring_buffer_event *event;
> > +	u64 ts, usec;
> > +
> > +	if (iter->pos =3D=3D 0) {
> > +		seq_printf(seq_file, "[%3s %12s] %s\n", "cpu", "timestamp",
> > +			   "message");
> > +		return 0;
> > +	} else if (iter->cpu =3D=3D -1) {
> > +		/* This happens when we start a session with position > 0 */
> > +		return SEQ_SKIP;
> > +	}
> > +
> > +	event =3D ring_buffer_consume(info->buffer, iter->cpu, &ts, NULL);
> > +
> > +	ts +=3D 500;
> > +	/* ts converts from ns->us */
> > +	do_div(ts, 1000);
> > +	/* ts converts from us->s */
> > +	usec =3D do_div(ts, USEC_PER_SEC);
> > +
> > +	seq_printf(seq_file, "[%3u %5llu.%06llu] %s", iter->cpu, ts, usec,
> > +		   (const char *)ring_buffer_event_data(event));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct seq_operations drm_trace_sops =3D {
> > +	.start =3D drm_trace_seq_start,
> > +	.next =3D drm_trace_seq_next,
> > +	.stop =3D drm_trace_seq_stop,
> > +	.show  =3D drm_trace_seq_show
> > +};
> > +
> > +static int drm_trace_fop_open(struct inode *inode, struct file *file)
> > +{
> > +	struct seq_file *seq_file;
> > +	int ret;
> > +
> > +	ret =3D seq_open(file, &drm_trace_sops);
> > +	if (ret)
> > +		return ret;
> > +
> > +	seq_file =3D (struct seq_file *)file->private_data;
> > +	seq_file->private =3D inode->i_private; /* this is drm_trace_info */
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct file_operations drm_trace_fops =3D {
> > +	.open =3D drm_trace_fop_open,
> > +	.read =3D seq_read,
> > +	.llseek =3D seq_lseek,
> > +	.release =3D seq_release,
> > +};
> > +
> > +/**
> > + * drm_trace_init - initializes tracing for drm core
> > + * @debugfs_root: the dentry for drm core's debugfs root
> > + *
> > + * This function is called on drm core init. It is responsible for ini=
tializing
> > + * drm tracing. This function must be matched by a call to drm_trace_c=
leanup().
> > + *
> > + * Returns: 0 on success, -errno on failure
> > + */
> > +int drm_trace_init(struct dentry *debugfs_root)
> > +{
> > +	struct drm_trace_info *info =3D &drm_trace;
> > +	int ret;
> > +
> > +	info->buffer =3D ring_buffer_alloc(PAGE_SIZE * 2, RB_FL_OVERWRITE);
> > +	if (!info->buffer)
> > +		return -ENOMEM;
> > +
> > +	info->debugfs_mask =3D debugfs_create_u32("trace_mask",
> > +						S_IFREG | S_IRUGO | S_IWUSR,
> > +						debugfs_root,
> > +						&info->category_mask);
> > +	if (IS_ERR(info->debugfs)) {
> > +		ret =3D PTR_ERR(info->debugfs);
> > +		goto err_debugfs_mask;
> > +	}
> > +
> > +	info->debugfs =3D debugfs_create_file("trace", S_IFREG | S_IRUGO,
> > +					    debugfs_root, info,
> > +					    &drm_trace_fops);
> > +	if (IS_ERR(info->debugfs)) {
> > +		ret =3D PTR_ERR(info->debugfs);
> > +		goto err_debugfs;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_debugfs_mask:
> > +	debugfs_remove(info->debugfs_mask);
> > +err_debugfs:
> > +	ring_buffer_free(info->buffer);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * drm_trace_cleanup - cleans up tracing for drm core
> > + *
> > + * This function is responsible for cleaning up anything that was prev=
iously
> > + * initialized in drm_trace_init()
> > + */
> > +void drm_trace_cleanup()
> > +{
> > +	struct drm_trace_info *info =3D &drm_trace;
> > +
> > +	debugfs_remove(info->debugfs);
> > +	debugfs_remove(info->debugfs_mask);
> > +	ring_buffer_free(info->buffer);
> > +	memset(info, 0, sizeof(*info));
> > +}
> > +
> > +/**
> > + * drm_trace_enabled - check if a debug category has traces enabled
> > + * @category: the debug category to check
> > + *
> > + * Returns true if the given category has drm traces enabled, false ot=
herwise.
> > + */
> > +bool drm_trace_enabled(enum drm_debug_category category)
> > +{
> > +	return READ_ONCE(drm_trace.category_mask) & category;
> > +}
> > +
> > +static int drm_trace_write(const void *data, unsigned int len)
> > +{
> > +	struct drm_trace_info *info =3D &drm_trace;
> > +	struct ring_buffer_event *event;
> > +	void *event_body;
> > +
> > +	event =3D ring_buffer_lock_reserve(info->buffer, len);
> > +	if (!event)
> > +		return -ENOMEM;
> > +
> > +	event_body =3D ring_buffer_event_data(event);
> > +	memcpy(event_body, data, len);
> > +
> > +	return ring_buffer_unlock_commit(info->buffer, event);
> > +}
> > +
> > +/**
> > + * drm_trace_printf - adds an entry to the drm trace
> > + * @format: printf format of the message to add to the trace
> > + *
> > + * This function adds a new entry in the drm trace.
> > + */
> > +void drm_trace_printf(const char *format, ...)
> > +{
> > +	char buf[DRM_TRACE_MAX_LEN];
> > +	va_list args;
> > +	int ret;
> > +
> > +	va_start(args, format);
> > +	ret =3D vsnprintf(buf, sizeof(buf), format, args);
> > +	va_end(args);
> > +
> > +	if (ret < 0)
> > +		return;
> > +	else if (ret >=3D sizeof(buf))
> > +		ret =3D sizeof(buf) - 1;
> > +
> > +	drm_trace_write(buf, ret + 1);
> > +}
> > +
> > +/**
> > + * drm_dev_trace_printf - adds an entry to the drm trace
> > + * @dev: pointer to device so we can print the name
> > + * @format: printf format of the message to add to the trace
> > + *
> > + * This function adds a new entry in the drm trace.
> > + */
> > +void drm_dev_trace_printf(const struct device *dev, const char *format=
, ...)
> > +{
> > +	char buf[DRM_TRACE_MAX_LEN];
> > +	struct va_format vaf;
> > +	va_list args;
> > +	int ret;
> > +
> > +	va_start(args, format);
> > +	vaf.fmt =3D format;
> > +	vaf.va =3D &args;
> > +	ret =3D snprintf(buf, sizeof(buf), "%s %s: %pV", dev_driver_string(de=
v),
> > +		       dev_name(dev), &vaf);
> > +	va_end(args);
> > +
> > +	if (ret < 0)
> > +		return;
> > +	else if (ret >=3D sizeof(buf))
> > +		ret =3D sizeof(buf) - 1;
> > +
> > +	drm_trace_write(buf, ret + 1);
> > +}
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index 8f99d389792d..1f3dae7150f0 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -320,6 +320,45 @@ static inline bool drm_debug_enabled(enum drm_debu=
g_category category)
> >  	return unlikely(__drm_debug & category);
> >  }
> >  =

> > +#ifdef CONFIG_DEBUG_FS
> > +
> > +int drm_trace_init(struct dentry *debugfs_root);
> > +bool drm_trace_enabled(enum drm_debug_category category);
> > +__printf(1, 2)
> > +void drm_trace_printf(const char *format, ...);
> > +__printf(2, 3)
> > +void drm_dev_trace_printf(const struct device *dev, const char *format=
, ...);
> > +void drm_trace_cleanup(void);
> > +
> > +#else
> > +
> > +static inline int drm_trace_init(struct dentry *debugfs_root)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline bool drm_trace_enabled(enum drm_debug_category category)
> > +{
> > +	return false;
> > +}
> > +
> > +__printf(1, 2)
> > +static inline void drm_trace_printf(const char *format, ...)
> > +{
> > +}
> > +
> > +__printf(2, 3)
> > +static inline void drm_dev_trace_printf(const struct device *dev,
> > +					const char *format, ...)
> > +{
> > +}
> > +
> > +static inline void drm_trace_cleanup(void)
> > +{
> > +}
> > +
> > +#endif
> > +
> >  /*
> >   * struct device based logging
> >   *
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center

-- =

Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
