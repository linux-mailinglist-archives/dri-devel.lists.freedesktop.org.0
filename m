Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D125423871
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0436F627;
	Wed,  6 Oct 2021 06:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411246ECEF;
 Wed,  6 Oct 2021 06:59:02 +0000 (UTC)
Date: Wed, 6 Oct 2021 08:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633503539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba2hRwTEZXOF3lXWJl+7TEsx8ujSR2pepYAfUtQNjTk=;
 b=kQCWAxQJ8vHl8Qi3bTBc2Tc4jMd/BSjnzfiI9trNsCd/ei3WdVdP+8fRHyOvoXgj1JgXJ9
 xPzyockVvZHhZSNZBCoPfEcJAoXKvSGuH8wBXuxot1Uit9AfqVGEcADYHW6IXZ5U+O0ERq
 UI7ImkXz8A/az8QmqC4mTHlPYcHrpMVMBicR13zoYe3jL4udrnbe00oxb5xXnKTOU9puDk
 FbWc0QBAS2FM6kxGaNxgWozF0U9m7REtHzQhUt/75eXrVt0dtXWTfJDzv7W9qrq6u5BXcc
 zEn1KtbWN0PCe7vwzf7i/K52rwMx02ymhXED5aukazyIHxXelntOE8QT/oHPDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633503539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba2hRwTEZXOF3lXWJl+7TEsx8ujSR2pepYAfUtQNjTk=;
 b=fttLzOA+fG8yU71L6C5gI9sAhisfbW4zUOeTl16tREKylLLkr9lUnzt9/uMJ073wKPNkH3
 L81CmD6mW01uYyBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 8/8] drm/i915: Don't disable interrupts and pretend a
 lock as been acquired in __timeline_mark_lock().
Message-ID: <20211006065857.6hpopr4agp4cjlor@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-9-bigeasy@linutronix.de>
 <20211005191617.GA174703@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005191617.GA174703@worktop.programming.kicks-ass.net>
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

On 2021-10-05 21:16:17 [+0200], Peter Zijlstra wrote:
> > -static inline void intel_context_mark_active(struct intel_context *ce)
> > +static inline void intel_context_mark_active(struct intel_context *ce,
> > +					     bool timeline_mutex_needed)
> >  {
> > -	lockdep_assert_held(&ce->timeline->mutex);
> > +	if (timeline_mutex_needed)
> > +		lockdep_assert_held(&ce->timeline->mutex);
> >  	++ce->active_count;
> >  }
> 
> Chris, might it be possible to write that something like:
> 
> 	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
> 		       engine_is_parked(ce));
> 
> instead?

This looks indeed way better given Torvald's yelling in similar cases.

> Otherwise,
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Sebastian
