Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D36A9AB68
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDA810E7C8;
	Thu, 24 Apr 2025 11:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="u9AdSKBB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tMEeZJol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7110E7C8;
 Thu, 24 Apr 2025 11:07:25 +0000 (UTC)
Date: Thu, 24 Apr 2025 13:07:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1745492841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WRJsuHkDetOeCN8MPWHiqr/L5HQKRxuly+CBMzqRXis=;
 b=u9AdSKBBB5CcKRicReLrZ4FapV3FfC3Qi902J9m+SA6U63wiwB0idV+Ms1RKnwSDsGLWzG
 XUaaySGdSI8E52xU8UfwE1imvcrdGFQLcbp+2XdbjYs0kJX2CESzNoLhFrcDq0ooxC+/Nv
 IN8aEi+AVM7QmzPqzfMAjLJwTAMNioSHQwf211fFRkqYUP+cmTzzfBd2sMTWz0VgJO1sKd
 fjlgzkC0Ri3j+kMtzgU9+LQL1qW1vPanMeR42m2o8FUfkde5ubOhnbb+dxaV4lUnoA5qJ3
 CbErxpKCQb7ki4ohy4gddVl/ENF4Ext9xu7XWAhRMx2W+1bJU8uOvUTj+CtoaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1745492841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WRJsuHkDetOeCN8MPWHiqr/L5HQKRxuly+CBMzqRXis=;
 b=tMEeZJolyjLH6TovceH/DF/Ix/DrWOhmw28qzshSH6VlxUcj1rO7fWTiJ3QfMvfSeVxug6
 0ANGOGJa70Jf2jCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Chang, Junxiao" <junxiao.chang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>
Subject: Re: RE: [PATCH] drm/i915/gsc: mei interrupt top half should be in
 irq disabled context
Message-ID: <20250424110719.A8HbMKQO@linutronix.de>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
 <20250424071553.yT9-dWWM@linutronix.de> <87zfg6yq1k.fsf@intel.com>
 <BN9PR11MB537042DD2F672D85765565FAEC852@BN9PR11MB5370.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN9PR11MB537042DD2F672D85765565FAEC852@BN9PR11MB5370.namprd11.prod.outlook.com>
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

On 2025-04-24 10:53:31 [+0000], Chang, Junxiao wrote:
> >> This should have a Fixes when generic_handle_irq() was introduced.
> 
> If PREEMPT_RT is disabled, original driver works fine. I prefer to not
> add "Fixes:"?

PREEMPT_RT is mainline. It deserves the same fixes as other parts of the
kernel.

Sebastian
