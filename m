Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5C44C206
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8A56E02B;
	Wed, 10 Nov 2021 13:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97AE6E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:21:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id v127so2127183wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9nSHeg+VR13aOu2Z2zxGZikb83vMLSFkcE3p79Vw4NM=;
 b=Cj8Du9IdyEn04AQkfT9B2aGGW1ckXszoFiPpaRwkZUM74Wnatk1LUBoSWNcHkQbc0o
 a5Szh5GJJCfZD99PEeQcu6ygFoVYpy1wakuwo5WZogubUzcRUbYUnC2e5PkgzY2KxFfb
 6r0CPx4+c7BWPN594V90wjF+d6WPBaLtZBnO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9nSHeg+VR13aOu2Z2zxGZikb83vMLSFkcE3p79Vw4NM=;
 b=mVf33gsQ6U12WNAQ+QA8SAJZkacKqKgp8vNnAxa2KbFuqtxYcvcUvPzGm/nPAdbaHq
 xeO+EesdHsyGxBAAfKn9LxIPsMSVKJK1MBLne6d5QH2zPkEDn0yxQ0paWlyhO6+/8Rw7
 zteaznZ3VMWZcPJ2YnWvYMHUN8flXEhBrY9g71LXmh8+w+M+ZE6tpuk+dUpo0/5wbink
 MWPdGRgVg8a0BBg1z0VpjMIEWkRnvHqfYVA2nxmrBpnRItQjiVf/oTfS4cwvZ1ENwkLX
 rhuUsOm3bU3t9niwtLKm5GsNHBG/IojsT4hjWvXRBEL4YqxTzQyxWpvACSkz/vXJGQbf
 WDbQ==
X-Gm-Message-State: AOAM531rFM87YnBRjzjbJI5B6h6jN8OKjx/BhpTK0QMj4DcxF6JmBysN
 BSku7ODI9DXBk+aY1AKICA3iow==
X-Google-Smtp-Source: ABdhPJzk6gaBdUKVq9eBgi4VIxdWtfAgmKffHb3oaPOsqV9BA2PTcP8EqDE+NI+N0VcNuqObmk/fgg==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr16319206wma.30.1636550494461; 
 Wed, 10 Nov 2021 05:21:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm22401680wrp.61.2021.11.10.05.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:21:33 -0800 (PST)
Date: Wed, 10 Nov 2021 14:21:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYvHW1OpN1L2uInb@phenom.ffwll.local>
Mail-Followup-To: Peter Zijlstra <peterz@infradead.org>,
 Petr Mladek <pmladek@suse.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Anton Vorontsov <anton@enomsg.org>, Ben Segall <bsegall@google.com>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 John Ogness <john.ogness@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tony Luck <tony.luck@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain> <YYuj/rT+EO3K0LsK@alley>
 <YYuq5d7MYL2wxlOd@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYuq5d7MYL2wxlOd@hirez.programming.kicks-ass.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 12:20:05PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 10, 2021 at 11:50:38AM +0100, Petr Mladek wrote:
> > On Tue 2021-11-09 12:06:48, Sultan Alsawaf wrote:
> > > Hi,
> > > 
> > > I encountered a printk deadlock on 5.13 which appears to still affect the latest
> > > kernel. The deadlock occurs due to printk being used while having the current
> > > CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> > > the same runqueue when printk tries to flush the log buffer.
> > > 
> > > I'm not sure what the *correct* solution is here (don't use printk while having
> > > a runqueue locked? don't use schedule_work() from the fbcon path? tell printk
> > > to use one of its lock-less backends?), so I've cc'd all the relevant folks.
> > 
> > At the moment, printk_deferred() could be used here. It defers the
> > console handling via irq_work().
> 
> I think I've rejected that patch at least twice now :-) John's printk
> stuff will really land real soon now, right.

Yeah whacking all affected prinkt callers just because of fbcon does not
sound like a good idea to me either.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
