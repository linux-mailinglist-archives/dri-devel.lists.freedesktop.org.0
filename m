Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5448E97E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0E10E144;
	Fri, 14 Jan 2022 11:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jan 2022 11:54:07 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8010E13A;
 Fri, 14 Jan 2022 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1642161248;
 x=1673697248; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AMs+u9nkmpDZ5lxA/fLhYjA5QxFXQFce1TTDfia+q9o=;
 b=BwnurFI7TWdUrKvcHbOtcOxy6j66lWHbOY25eFyI7MGQ16S7Ofa9uyUw
 bBUz9a9+r7UuIExfqKaIaXSVAN5E5tYg7Wku7GC44+9rj0X8QwffSE3B9
 RMpYq2uX5eGW2CHnRm/rqnN/n95eJKaom5cFT3zQQq8RDXA/5bGJHj1t3
 qjoxC56I0hBLhu4lBYEPC1/1baWAOEAuuS9mwYltDRfl2w9OXZx9zeuCL
 P2I58Bswrn8mPnZYSHUNWUVrL3WoFf/4z64G8SycEl5HAio6FUzfQMUaP
 0go8S0UZVavRw0l0w5QAp1ewoU2PjODMGxnEKWolr1h8KIELBITe9I0AW Q==;
Date: Fri, 14 Jan 2022 12:46:54 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v11 03/19] dyndbg: add write-to-tracefs code
Message-ID: <20220114114654.GA23983@axis.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
 <20220107052942.1349447-4-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220107052942.1349447-4-jim.cromie@gmail.com>
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
Cc: "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "will@kernel.org" <will@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jbaron@akamai.com" <jbaron@akamai.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "quic_psodagud@quicinc.com" <quic_psodagud@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 07, 2022 at 06:29:26AM +0100, Jim Cromie wrote:
> adds: dynamic_trace()
>  uses trace_console() temporarily to issue printk:console event
>  uses internal-ish __ftrace_trace_stack code:
>       4-context buffer stack, barriers per Steve
> 
> call it from new funcs:
>   dynamic_printk() - print to both syslog/tracefs
>   dynamic_dev_printk() - dev-print to both syslog/tracefs
> 
> These handle both _DPRINTK_FLAGS_PRINTK and _DPRINTK_FLAGS_TRACE
> cases, allowing to vsnprintf the message once and use it for both,
> skipping past the KERN_DEBUG character for tracing.
> 
> Finally, adjust the callers: __dynamic_{pr_debug,{,net,ib}dev_dbg},
> replacing printk and dev_printk with the new funcs above.
> 
> The _DPRINTK_FLAGS_TRACE flag character s 'T', so the following finds
> all callsites enabled for tracing:
> 
>   grep -P =p?T /proc/dynamic_debug/control
> 
> Enabling debug-to-tracefs is 2 steps:
> 
>   # event enable
>   echo 1 > /sys/kernel/tracing/events/dyndbg/enable
>   # callsite enable
>   echo module foo +T > /proc/dynamic_debug/control
> 
> This patch,~1,~2 are based upon:
>   https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/
> 
> .. with simplification of temporarily reusing trace_console() rather
> than adding a new printk:dyndbg event.  Soon, add 2 new events
> capturing the pr_debug & dev_dbg() args.

The example above does not match the code in this patch since the
dyndbg:* events are only added in a later patch.  Perhaps you could
reorder this patch stack so that you don't use trace_console() in this
patch just to replace it with the new events in the next patch?

> 
> CC: vincent.whitchurch@axis.com
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  .../admin-guide/dynamic-debug-howto.rst       |   1 +
>  lib/dynamic_debug.c                           | 155 +++++++++++++++---
>  2 files changed, 130 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
[...]
> @@ -723,29 +822,33 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  {
>  	struct va_format vaf;
>  	va_list args;
> +	unsigned int flags;
>  
>  	va_start(args, fmt);
>  
>  	vaf.fmt = fmt;
>  	vaf.va = &args;
> +	flags = descriptor->flags;
>  
>  	if (ibdev && ibdev->dev.parent) {
>  		char buf[PREFIX_SIZE] = "";
>  
> -		dev_printk_emit(LOGLEVEL_DEBUG, ibdev->dev.parent,
> -				"%s%s %s %s: %pV",
> -				dynamic_emit_prefix(descriptor, buf),
> -				dev_driver_string(ibdev->dev.parent),
> -				dev_name(ibdev->dev.parent),
> -				dev_name(&ibdev->dev),
> -				&vaf);
> +		dynamic_dev_printk(flags, ibdev->dev.parent,
> +				   "%s%s %s %s: %pV",
> +				   dynamic_emit_prefix(descriptor, buf),
> +				   dev_driver_string(ibdev->dev.parent),
> +				   dev_name(ibdev->dev.parent),
> +				   dev_name(&ibdev->dev),
> +				   &vaf);
>  	} else if (ibdev) {
> -		printk(KERN_DEBUG "%s: %pV", dev_name(&ibdev->dev), &vaf);
> +		dynamic_printk(flags, KERN_DEBUG "%s%s: %pV",
> +			       dev_name(&ibdev->dev), &vaf);
>  	} else {
> -		printk(KERN_DEBUG "(NULL ib_device): %pV", &vaf);
> +		dynamic_printk(flags, KERN_DEBUG "(NULL ip_device): %pV",
> +			       &vaf);
>  	}
>  
> -	va_end(args);
> +va_end(args);

This looks like an unintentional whitespace change?
