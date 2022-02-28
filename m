Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDD4C6725
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E80110E38D;
	Mon, 28 Feb 2022 10:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2224210E389;
 Mon, 28 Feb 2022 10:35:49 +0000 (UTC)
Date: Mon, 28 Feb 2022 11:35:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1646044546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+6NK8Yyov/qmYq+Vs/oFt6zp0OEy9z/pJo8O8ATvck=;
 b=IwR4joMcsD06DMlEqIqG3qp0y0u3z6DFQju5U3cmBLeri1bhmN2L3ccALxz7siEyNlV2gG
 wcWd8NfyHT0G8QKHqPZCgGSbEkzdUeUyR/O1uo5GhXSxfnybXVqN7QwgCiN8fQ+1DGGohU
 8e3aQfCtialzRXQWCjK5mWYLWmGODtfpT8VbR1UvYpoESI3L8kbr1ccumID+epnZkt8Pr6
 6tgKkUnJLmYVhczHsyVBZL48q8eje+f744M46MSPoPS73WABxtPGcNzhIWAnV/v0NI1IAm
 cfkDnvuw0aJ2XsrYsFLUT4evT+zQJ4vFeadtb0Q9vwYphaJuNPKq9VWn2oyrHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1646044546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+6NK8Yyov/qmYq+Vs/oFt6zp0OEy9z/pJo8O8ATvck=;
 b=fHcKah4FbA1p3CbdeQvccI9EuNDrb2N+sDmAFVop9Q6uNWiC4v89YD774S4EoP7d9bURjn
 QC1bkncrT2kZKWAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Message-ID: <YhylgaoHtSKi7+el@linutronix.de>
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
 <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-28 10:10:48 [+0000], Tvrtko Ursulin wrote:
> Hi,
Hi,

> Could you paste a link to the queue of i915 patches pending for a quick
> overview of how much work there is and in what areas?

Last post to the list:
  https://https://lkml.kernel.org/r/.kernel.org/all/20211214140301.520464-1-bigeasy@linutronix.de/

or if you look at the DRM section in 
   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/tree/patches/series?h=v5.17-rc6-rt10-patches#n156

you see:
   0003-drm-i915-Use-preempt_disable-enable_rt-where-recomme.patch
   0004-drm-i915-Don-t-disable-interrupts-on-PREEMPT_RT-duri.patch
   0005-drm-i915-Don-t-check-for-atomic-context-on-PREEMPT_R.patch
   0006-drm-i915-Disable-tracing-points-on-PREEMPT_RT.patch
   0007-drm-i915-skip-DRM_I915_LOW_LEVEL_TRACEPOINTS-with-NO.patch
   0008-drm-i915-gt-Queue-and-wait-for-the-irq_work-item.patch
   0009-drm-i915-gt-Use-spin_lock_irq-instead-of-local_irq_d.patch
   0010-drm-i915-Drop-the-irqs_disabled-check.patch
   Revert-drm-i915-Depend-on-PREEMPT_RT.patch

and you could view them from
   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/tree/patches?h=v5.17-rc6-rt10-patches

> Also, I assume due absence of ARCH_SUPPORTS_RT being defined by any arch,
> that something more is not yet ready?

Correct. Looking at what I have queued for the next merge window I have
less than 20 patches (excluding i915 and printk) before ARCH_SUPPORTS_RT
can be enabled for x86-64.
 
> Regards,
> 
> Tvrtko

Sebastian
