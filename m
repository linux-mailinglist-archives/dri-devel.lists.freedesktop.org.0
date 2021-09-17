Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03340FF16
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937786EE5A;
	Fri, 17 Sep 2021 18:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105126EE5A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:18:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631902700; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VZdgQHAds4h7BHeFgP/3SfBWak5DxfxeReSCYxWPVIw=;
 b=NbHAccoiUkq6Ei8TcQnEZC9Kn07T11idubstg9oWalgU65YzxbaYBhSZkN4Qcl4PbY1wlED3
 6g9/4zVvDJJmkTArm0SFOIc18wEuaKh+LQW+H7ltjIDDY0rqo16qlIsD/tmLrKD0ZBpAeszq
 hCngFq1uXSG5wO5IDBf9YMxkIM8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6144dbdcd914b051820736aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:18:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0635DC4361B; Fri, 17 Sep 2021 18:18:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC29BC4338F;
 Fri, 17 Sep 2021 18:17:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 17 Sep 2021 11:17:58 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, Pekka Paalanen <pekka.paalanen@collabora.com>,
 kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Chris
 Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v6 14/14] drm/print: Add tracefs support to the drm
 logging helpers
In-Reply-To: <20210721175526.22020-15-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-15-sean@poorly.run>
Message-ID: <4371726240bf52305774aaed4d994533@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds a new module parameter called drm.trace which accepts
> the same mask as drm.debug. When a debug category is enabled, log
> messages will be put in a new tracefs instance called drm for
> consumption.
> 
> Using the new tracefs instance will allow distros to enable drm logging
> in production without impacting performance or spamming the system
> logs.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Reported-by: kernel test robot <lkp@intel.com> # warning reported in v6
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540-1-sean@poorly.run
> #v1
> Link:
> https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html
> #v2
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437-1-sean@poorly.run
> #v3
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200114172155.215463-1-sean@poorly.run
> #v4
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-14-sean@poorly.run
> #v5
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200818210510.49730-15-sean@poorly.run
> #v6
> 
> Changes in v5:
> -Re-write to use trace_array and the tracefs instance support
> Changes in v6:
> -Use the new trace_array_init_printk() to initialize global trace
>  buffers
> Changes in v6.5:
> -Fix kernel test robot warning
> -Add a trace printf in __drm_err
> ---
>  Documentation/gpu/drm-uapi.rst |   6 +
>  drivers/gpu/drm/drm_drv.c      |   3 +
>  drivers/gpu/drm/drm_print.c    | 223 ++++++++++++++++++++++++++++-----
>  include/drm/drm_print.h        |  63 ++++++++--
>  4 files changed, 255 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst 
> b/Documentation/gpu/drm-uapi.rst
> index 7e51dd40bf6e..ce1ea39fb4b9 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -424,6 +424,12 @@ Debugfs Support
>  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
>     :export:
> 
> +DRM Tracing
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_print.c
> +   :doc: DRM Tracing
> +
>  Sysfs Support
>  =============
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8804ec7d3215..71dc0b161b51 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1034,12 +1034,15 @@ static void drm_core_exit(void)
>  	drm_sysfs_destroy();
>  	idr_destroy(&drm_minors_idr);
>  	drm_connector_ida_destroy();
> +	drm_trace_cleanup();
>  }
> 
>  static int __init drm_core_init(void)
>  {
>  	int ret;
> 
> +	drm_trace_init();

Can we move the drm_trace_init() to drm_dev_register()?
The reason is while creating the tracefs node, I think its useful to 
have the drm device id to support
multiple DRM devices. So while creating the tracefs node, we can do 
something like
trace_array_get_by_name("drm_<device_id");

Then usermode will just read all the traces from /instances/drm_***

> +
>  	drm_connector_ida_init();
>  	idr_init(&drm_minors_idr);
>  	drm_memcpy_init_early();
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 4d984a01b3a3..64d9a724c2df 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -31,6 +31,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/trace.h>
> 
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -43,17 +44,34 @@
>  unsigned int __drm_debug_syslog;
>  EXPORT_SYMBOL(__drm_debug_syslog);
> 
> -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables
> a debug category.\n"
> -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller 
> code)\n"
> -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> +/*
> + * __drm_debug_trace: Enable debug output in drm tracing instance.
> + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> + */
> +unsigned int __drm_debug_trace;
> +EXPORT_SYMBOL(__drm_debug_trace);
> +
> +#define DEBUG_PARM_DESC(dst) \
> +"Enable debug output to " dst ", where each bit enables a debug 
> category.\n" \
> +"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n" \
> +"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller 
> code)\n" \
> +"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n" \
> +"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n" \
> +"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n" \
> +"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n" \
> +"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n" \
> +"\t\tBit 8 (0x100) will enable DP messages (displayport code)"

This is certainly a great start. Moving forward a bit, is there a 
possibility to subcatergorize
even further? Like plane, crtc, connector etc?

> +
> +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
>  module_param_named(debug, __drm_debug_syslog, int, 0600);
> 
> +MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
> +module_param_named(trace, __drm_debug_trace, int, 0600);
> +
> +#ifdef CONFIG_TRACING
> +struct trace_array *trace_arr;
> +#endif
> +
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
>  	struct drm_print_iterator *iterator = p->arg;
> @@ -166,6 +184,20 @@ void __drm_printfn_debug_syslog(struct
> drm_printer *p, struct va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_debug_syslog);
> 
> +void __drm_printfn_trace(struct drm_printer *p, struct va_format *vaf)
> +{
> +	drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_trace);
> +
> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +					   struct va_format *vaf)
> +{
> +	pr_debug("%s %pV", p->prefix, vaf);
> +	drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_debug_syslog_and_trace);
> +
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
>  	pr_err("*ERROR* %s %pV", p->prefix, vaf);
> @@ -246,6 +278,14 @@ void drm_dev_printk(const struct device *dev,
> const char *level,
>  	struct va_format vaf;
>  	va_list args;
> 
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +			 dev ? dev_name(dev) : "",dev ? " " : "",
> +			 __builtin_return_address(0), &vaf);
> +	va_end(args);
> +
>  	va_start(args, format);
>  	vaf.fmt = format;
>  	vaf.va = &args;
> @@ -267,21 +307,30 @@ void drm_dev_dbg(const struct device *dev, enum
> drm_debug_category category,
>  	struct va_format vaf;
>  	va_list args;
> 
> -	if (!drm_debug_enabled(category))
> -		return;
> +	if (drm_debug_syslog_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> 
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> +		if (dev)
> +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> +				__builtin_return_address(0), &vaf);
> +		else
> +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +			__builtin_return_address(0), &vaf);
> 
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -		       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
> 
> -	va_end(args);
> +	if (drm_debug_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +		drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +				 dev ? dev_name(dev) : "", dev ? " " : "",
> +				 __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(drm_dev_dbg);
> 
> @@ -290,17 +339,25 @@ void __drm_dbg(enum drm_debug_category category,
> const char *format, ...)
>  	struct va_format vaf;
>  	va_list args;
> 
> -	if (!drm_debug_enabled(category))
> -		return;
> +	if (drm_debug_syslog_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> 
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +		__builtin_return_address(0), &vaf);
> 
> -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -	       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
> 
> -	va_end(args);
> +	if (drm_debug_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +		drm_trace_printf("[" DRM_NAME ":%ps] %pV",
> +				 __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(__drm_dbg);
> 
> @@ -317,6 +374,13 @@ void __drm_err(const char *format, ...)
>  	       __builtin_return_address(0), &vaf);
> 
>  	va_end(args);
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	drm_trace_printf("[" DRM_NAME ":%ps] *ERROR* %pV",
> +				__builtin_return_address(0), &vaf);
> +	va_end(args);
>  }
>  EXPORT_SYMBOL(__drm_err);
> 
> @@ -347,3 +411,104 @@ void drm_print_regset32(struct drm_printer *p,
> struct debugfs_regset32 *regset)
>  	}
>  }
>  EXPORT_SYMBOL(drm_print_regset32);
> +
> +
> +/**
> + * DOC: DRM Tracing
> + *
> + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM 
> debug
> + * logging.
> + *
> + * While DRM logging is quite convenient when reproducing a specific 
> issue, it
> + * doesn't help when something goes wrong unexpectedly. There are a 
> couple
> + * reasons why one does not want to enable DRM logging at all times:
> + *
> + * 1. We don't want to overwhelm syslog with drm spam, others have to
> use it too
> + * 2. Console logging is slow
> + *
> + * DRM tracing aims to solve both these problems.
> + *
> + * To use DRM tracing, set the drm.trace module parameter (via
> cmdline or sysfs)
> + * to a DRM debug category mask (this is a bitmask of 
> &drm_debug_category
> + * values):
> + * ::
> + *
> + *    eg: echo 0x106 > /sys/module/drm/parameters/trace
> + *
> + * Once active, all log messages in the specified categories will be 
> written to
> + * the DRM trace. Once at capacity, the trace will overwrite old 
> messages with
> + * new ones. At any point, one can read the trace file to extract the
> previous N
> + * DRM messages:
> + * ::
> + *
> + *    eg: cat /sys/kernel/tracing/instances/drm/trace
> + *
> + * Considerations
> + * **************
> + * The trace is subsystem wide, so if you have multiple devices 
> active, they
> + * will be adding logs to the same trace.
> + *
> + * The contents of the DRM Trace are **not** considered UABI. **DO
> NOT depend on
> + * the values of these traces in your userspace.** These traces are
> intended for
> + * entertainment purposes only. The contents of these logs carry no 
> warranty,
> + * expressed or implied.
> + */
> +
> +
> +#ifdef CONFIG_TRACING
> +
> +/**
> + * drm_trace_init - initializes the drm trace array
> + *
> + * This function fetches (or creates) the drm trace array. This
> should be called
> + * once on drm subsystem creation and matched with 
> drm_trace_cleanup().
> + */
> +void drm_trace_init(void)
> +{
> +	int ret;
> +
> +	trace_arr = trace_array_get_by_name("drm");
> +	if (!trace_arr)
> +		return;
> +
> +	ret = trace_array_init_printk(trace_arr);
> +	if (ret)
> +		drm_trace_cleanup();
> +}
> +EXPORT_SYMBOL(drm_trace_init);
> +
> +/**
> + * drm_trace_printf - adds an entry to the drm tracefs instance
> + * @format: printf format of the message to add to the trace
> + *
> + * This function adds a new entry in the drm tracefs instance
> + */
> +void drm_trace_printf(const char *format, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
> +	va_end(args);
> +}
> +
> +/**
> + * drm_trace_cleanup - destroys the drm trace array
> + *
> + * This function destroys the drm trace array created with 
> drm_trace_init. This
> + * should be called once on drm subsystem close and matched with
> + * drm_trace_init().
> + */
> +void drm_trace_cleanup(void)
> +{
> +	if (trace_arr) {
> +		trace_array_put(trace_arr);
> +		trace_array_destroy(trace_arr);
> +		trace_arr = NULL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_trace_cleanup);
> +#endif
> \ No newline at end of file
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index af31beeb82a1..4609a2f4a425 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -36,12 +36,13 @@
> 
>  /* Do *not* use outside of drm_print.[ch]! */
>  extern unsigned int __drm_debug_syslog;
> +extern unsigned int __drm_debug_trace;
> 
>  /**
>   * DOC: print
>   *
>   * A simple wrapper for dev_printk(), seq_printf(), etc.  Allows same
> - * debug code to be used for both debugfs and printk logging.
> + * debug code to be used for debugfs, printk and tracefs logging.
>   *
>   * For example::
>   *
> @@ -86,6 +87,9 @@ void __drm_printfn_seq_file(struct drm_printer *p,
> struct va_format *vaf);
>  void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_debug_syslog(struct drm_printer *p, struct 
> va_format *vaf);
> +void __drm_printfn_trace(struct drm_printer *p, struct va_format 
> *vaf);
> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +					   struct va_format *vaf);
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf);
> 
> @@ -219,7 +223,8 @@ static inline struct drm_printer
> drm_info_printer(struct device *dev)
>  }
> 
>  /**
> - * drm_debug_printer - construct a &drm_printer that outputs to 
> pr_debug()
> + * drm_debug_printer - construct a &drm_printer that outputs to 
> pr_debug() and
> + * drm tracefs
>   * @prefix: debug output prefix
>   *
>   * RETURNS:
> @@ -228,7 +233,7 @@ static inline struct drm_printer
> drm_info_printer(struct device *dev)
>  static inline struct drm_printer drm_debug_printer(const char *prefix)
>  {
>  	struct drm_printer p = {
> -		.printfn = __drm_printfn_debug_syslog,
> +		.printfn = __drm_printfn_debug_syslog_and_trace,
>  		.prefix = prefix
>  	};
>  	return p;
> @@ -254,14 +259,14 @@ static inline struct drm_printer
> drm_err_printer(const char *prefix)
>   * enum drm_debug_category - The DRM debug categories
>   *
>   * Each of the DRM debug logging macros use a specific category, and
> the logging
> - * is filtered by the drm.debug module parameter. This enum specifies
> the values
> - * for the interface.
> + * is filtered by the drm.debug and drm.trace module parameters. This 
> enum
> + * specifies the values for the interface.
>   *
>   * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, 
> except
>   * DRM_DEBUG() logs to DRM_UT_CORE.
>   *
> - * Enabling verbose debug messages is done through the drm.debug
> parameter, each
> - * category being enabled by a bit:
> + * Enabling verbose debug messages is done through the drm.debug and 
> drm.trace
> + * parameters, each category being enabled by a bit:
>   *
>   *  - drm.debug=0x1 will enable CORE messages
>   *  - drm.debug=0x2 will enable DRIVER messages
> @@ -270,10 +275,14 @@ static inline struct drm_printer
> drm_err_printer(const char *prefix)
>   *  - drm.debug=0x1ff will enable all messages
>   *
>   * An interesting feature is that it's possible to enable verbose 
> logging at
> - * run-time by echoing the debug value in its sysfs node::
> + * run-time by echoing the debug category value in its sysfs node::
>   *
> + *   # For syslog logging:
>   *   # echo 0xf > /sys/module/drm/parameters/debug
>   *
> + *   # For tracefs logging:
> + *   # echo 0xf > /sys/module/drm/parameters/trace
> + *
>   */
>  enum drm_debug_category {
>  	/**
> @@ -325,14 +334,20 @@ static inline bool drm_debug_syslog_enabled(enum
> drm_debug_category category)
>  	return unlikely(__drm_debug_syslog & category);
>  }
> 
> +static inline bool drm_debug_trace_enabled(enum drm_debug_category 
> category)
> +{
> +	return unlikely(__drm_debug_trace & category);
> +}
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
> -	return drm_debug_syslog_enabled(category);
> +	return drm_debug_syslog_enabled(category) ||
> +	       drm_debug_trace_enabled(category);
>  }
> 
>  /**
>   * drm_debug_category_printer - construct a &drm_printer that outputs 
> to
> - * pr_debug() if enabled for the given category.
> + * pr_debug() and/or the drm tracefs instance if enabled for the
> given category.
>   * @category: the DRM_UT_* message category this message belongs to
>   * @prefix: trace output prefix
>   *
> @@ -347,8 +362,13 @@ drm_debug_category_printer(enum
> drm_debug_category category,
>  		.prefix = prefix
>  	};
> 
> -	if (drm_debug_syslog_enabled(category)) {
> +	if (drm_debug_syslog_enabled(category) &&
> +	    drm_debug_trace_enabled(category)) {
> +		p.printfn = __drm_printfn_debug_syslog_and_trace;
> +	} else if (drm_debug_syslog_enabled(category)) {
>  		p.printfn = __drm_printfn_debug_syslog;
> +	} else if (drm_debug_trace_enabled(category)) {
> +		p.printfn = __drm_printfn_trace;
>  	} else {
>  		WARN(1, "Debug category %d is inactive.", category);
>  		p.printfn = __drm_printfn_noop;
> @@ -357,6 +377,27 @@ drm_debug_category_printer(enum
> drm_debug_category category,
>  	return p;
>  }
> 
> +
> +#ifdef CONFIG_TRACING
> +void drm_trace_init(void);
> +__printf(1, 2)
> +void drm_trace_printf(const char *format, ...);
> +void drm_trace_cleanup(void);
> +#else
> +static inline void drm_trace_init(void)
> +{
> +}
> +
> +__printf(1, 2)
> +static inline void drm_trace_printf(const char *format, ...)
> +{
> +}
> +
> +static inline void drm_trace_cleanup(void)
> +{
> +}
> +#endif
> +
>  /*
>   * struct device based logging
>   *
