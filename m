Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E944F764
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 11:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C74189D1D;
	Sun, 14 Nov 2021 10:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Fri, 12 Nov 2021 11:57:09 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDF26ED9F;
 Fri, 12 Nov 2021 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1636718229;
 x=1668254229; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pKNzvHA+abG5/SB0rgSIMnr0AelDwIA74K7UU91Gfho=;
 b=krDLYRCh9mmz1cbv5/Y+yut07sDSuXqpKS5KIxJE6CGhU53rGnB2wSUS
 S/HZxvMX232pvyeFYMcihhMfY54fSu5iAsy4lhkQPtB4IFs+6Uv1Iyibi
 yF6AQ3iF5UemhTCc7G9ccwlDig/T8rKjscuzPhTN6UeOqkkwnyOpzB86d
 MrClvjWTuvRARyhaDbLov8IFJ3DvKrWXJJ7igqnGAGtTRLVABqM7bv5yT
 litYiMmweysBpuXw/RJcV9w4HDwoMjJ/nyzVRjQHjxzJ78MuLSWl3Q5oA
 3faKB9aTcZX+3d38xyAS/yTI1bZv0ZfNf2OfmNP27sn3KVIfuD+spD8zX Q==;
Date: Fri, 12 Nov 2021 12:49:54 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
Message-ID: <20211112114953.GA1381@axis.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211111220206.121610-9-jim.cromie@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 14 Nov 2021 10:05:32 +0000
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
Cc: quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, will@kernel.org, maz@kernel.org,
 amd-gfx@lists.freedesktop.org, mingo@redhat.com, daniel.vetter@ffwll.ch,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rostedt@goodmis.org, jbaron@akamai.com, seanpaul@chromium.org,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 sean@poorly.run, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 quic_psodagud@quicinc.com, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:
> Sean Paul proposed, in:
> https://patchwork.freedesktop.org/series/78133/
> drm/trace: Mirror DRM debug logs to tracefs
> 
> His patchset's objective is to be able to independently steer some of
> the drm.debug stream to an alternate tracing destination, by splitting
> drm_debug_enabled() into syslog & trace flavors, and enabling them
> separately.  2 advantages were identified:
> 
> 1- syslog is heavyweight, tracefs is much lighter
> 2- separate selection of enabled categories means less traffic
> 
> Dynamic-Debug can do 2nd exceedingly well:
> 
> A- all work is behind jump-label's NOOP, zero off cost.
> B- exact site selectivity, precisely the useful traffic.
>    can tailor enabled set interactively, at shell.
> 
> Since the tracefs interface is effective for drm (the threads suggest
> so), adding that interface to dynamic-debug has real potential for
> everyone including drm.
> 
> if CONFIG_TRACING:
> 
> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> available by default to all pr_debugs.  This will likely need some
> further per-module treatment; perhaps something reflecting hierarchy
> of module,file,function,line, maybe with a tuned flattening.
> 
> endif CONFIG_TRACING
> 
> Add a new +T flag to enable tracing, independent of +p, and add and
> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
> the flag checks.  Existing code treats T like other flags.

I posted a patchset a while ago to do something very similar, but that
got stalled for some reason and I unfortunately didn't follow it up:

 https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/

A key difference between that patchset and this patch (besides that
small fact that I used +x instead of +T) was that my patchset allowed
the dyndbg trace to be emitted to the main buffer and did not force them
to be in an instance-specific buffer.

That feature is quite important at least for my use case since I often
use dyndbg combined with function tracing, and the latter doesn't work
on non-main instances according to Documentation/trace/ftrace.rst.

For example, here's a random example of a bootargs from one of my recent
debugging sessions:

 trace_event=printk:* ftrace_filter=_mmc*,mmc*,sd*,dw_mci*,mci*
 ftrace=function trace_buf_size=20M dyndbg="file drivers/mmc/* +x"

