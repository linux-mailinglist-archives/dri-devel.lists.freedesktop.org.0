Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6340641E99B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C06ED8F;
	Fri,  1 Oct 2021 09:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BD86ED84;
 Fri,  1 Oct 2021 09:29:29 +0000 (UTC)
Date: Fri, 1 Oct 2021 11:29:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633080567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZM20RGjxxKC2x+DU2E3e0G3xvaWLHZEivj15oKyBtE=;
 b=nBco8QyDpu1fl43DD4XBt3p5G2fiBc3nuv7pQ2nFhcDBA/9VDWdQ82aPFJsYEftSc0EWLO
 jK7c/6M2nyF84gUAWihjIYKs42dhoz91fJ3JCIJBBrlJ/LcpN1Ciu4fpmrv+82F/YlaNI9
 dkf46o4X0ifSlbEXrLWqgVayJSX4PnSjsQ5Gy927VWp5qv/LJ91J6PIGoVfYC1ZD7w9cNJ
 ieLP7PDuHYQAiQL8Goz2ncoYX9nJn9KdAA7/KHw//Vl0CQYHC2SuFYh2chPjsV4R3Zp8Eb
 3bLCJJZFbGlTi2yBWELsEkMMz4E5T4rSIV0Wbg8czf84VjOnyliUBlJLbm/eHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633080567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZM20RGjxxKC2x+DU2E3e0G3xvaWLHZEivj15oKyBtE=;
 b=q8j+JvREv/X2deG26HyUNHQCdwnPUbREoXJKQMSKR4HWF+ZN96RuUcAkMcT4laNZZUPnq9
 HPxCqNABqSwVEJDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Clark Williams <williams@redhat.com>,
 Anton Lundin <glance@acc.umu.se>
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/i915/gt: Use spin_lock_irq()
 instead of local_irq_disable() + spin_lock()
Message-ID: <20211001092926.fpbbvlki7g5urcox@linutronix.de>
References: <20210908185703.2989414-1-bigeasy@linutronix.de>
 <20210908185703.2989414-3-bigeasy@linutronix.de>
 <48ed82b8-a641-1090-a93f-23476f9c0eb0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48ed82b8-a641-1090-a93f-23476f9c0eb0@linux.intel.com>
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

On 2021-09-16 11:38:55 [+0200], Maarten Lankhorst wrote:
> Patches look good.
Thank you for looking.

> For both patches:
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> I've been looking at running i915 with the -rt patch series, and
> noticed i915_request_submit fails with GEM_BUG_ON(!irqs_disabled());
> presumably same failure exists for i915_request_unsubmit().
> 
> Might be worth removing those checks as well? Seems double with
> lockdep_assert_held on an irq lock anyway.

yes, let me prepare something in a few.

> I've also noticed the local_irq_disable/enable is removed from
> intel_pipe_update_(start/end) in the rt series. It might make sense
> from a -rt point of view, but that code needs to run without
> interruptions, or i915 may show visual glitches or even locks up the
> system.
>
> It should just be a set of registers hammered in, but the code might
> needs to be fixed to take the mmio lock as outer lock, and become a
> strict set of register read/writes only.

Let me see. So Anton Lundin (Cc:) reported glitches due to _this_ patch
on -RT. I have just a Sandybridge around with a i915 and it does not get
near that code here. 

> ~Maarten

Sebastian
