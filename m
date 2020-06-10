Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EA1F5737
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 17:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894286E5C1;
	Wed, 10 Jun 2020 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1986E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:01:43 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C25EE2072F;
 Wed, 10 Jun 2020 15:01:41 +0000 (UTC)
Date: Wed, 10 Jun 2020 11:01:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 13/13] drm/print: Add tracefs support to the drm
 logging helpers
Message-ID: <20200610110140.3c0da742@oasis.local.home>
In-Reply-To: <20200609154932.696-1-sean@poorly.run>
References: <202006090859.AP8QhpSU%lkp@intel.com>
 <20200609154932.696-1-sean@poorly.run>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 chris@chris-wilson.co.uk, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  9 Jun 2020 11:49:19 -0400
Sean Paul <sean@poorly.run> wrote:

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

The only issue I have with this patch is the above. I really dislike
the use of trace_array_print(), as that is made to be for debugging and
not something that should be in a production kernel.

Ideally, every instance should just pass the data it wants to record,
and you add it to a trace event. There's already a drm trace subsystem,
how would this be different. Perhaps create a drm_log subsystem, and
you only need to have your instance enable it?

I guess I'm still confused to why this is needed over just having trace
events? What's special about this case?

-- Steve

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
