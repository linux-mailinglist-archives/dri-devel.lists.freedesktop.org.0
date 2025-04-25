Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6449A9CBA8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04210E2FB;
	Fri, 25 Apr 2025 14:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XK8cC/1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEF10E2FB;
 Fri, 25 Apr 2025 14:27:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB5075C110C;
 Fri, 25 Apr 2025 14:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F4AC4CEE4;
 Fri, 25 Apr 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745591232;
 bh=+Khgswb4ycfEe63uGiPULJ9rhp6/pWoWuzGOliOHJsw=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=XK8cC/1JQsw+QmMpSYDevbuERmsHOZ432HwIkCgz1LS+dLwja5JMn0cOWKtERKNeZ
 D2BLyuy/6Q1PVl0XrZejWxXiMbD4G9uOhTAw0RE6286dHt2anwfui5qDCX7gNw+7ER
 64U8zQcbSgi6LV5QqUkxXFghZsjYa8nvEbjhIHXWUFTOsDOVDJfWOZEVIjnthPGo3g
 Yr/85zxfM32Y7TwcmGTuiGKWeYsExRxmiBQH+C2o7vet71I4ZgjeZfy8gFI2KRrmpz
 rwQTe/XrfELM9Tl/+Hz6E7OZ6gQBjfBAL8FQ9B6NiOCzG93ODCAzvEMTHP+hjIQt5N
 v9I3IqXvABBBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 57E9FCE0485; Fri, 25 Apr 2025 07:27:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 07:27:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 04/20] drm/i915: Avoid open-coded use of
 ratelimit_state structure's ->missed field
Message-ID: <99be31c6-2a01-44fe-9043-8ec7909cd3e8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-4-paulmck@kernel.org>
 <87selwy6cg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87selwy6cg.fsf@intel.com>
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 25, 2025 at 11:48:31AM +0300, Jani Nikula wrote:
> On Thu, 24 Apr 2025, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > The i915_oa_stream_destroy() function directly accesses the
> > ratelimit_state structure's ->missed field, which work, but which also
> > makes it more difficult to change this field.  Therefore, make use of
> > the ratelimit_state_get_miss() function instead of directly accessing
> > the ->missed field.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thank you, Jani!  I will apply this on my next rebase later today.

> For merging via whichever tree is convenient for you. Please let us know
> if you want us to pick it up via drm-intel.

This one depends on a commit earlier in the series, so I will very
happily take you up on your kind offer of letting me push it.  ;-)

							Thanx, Paul

> > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: <intel-gfx@lists.freedesktop.org>
> > Cc: <dri-devel@lists.freedesktop.org>
> > ---
> >  drivers/gpu/drm/i915/i915_perf.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> > index de0b413600a15..1658f1246c6fa 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -1666,6 +1666,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
> >  	struct i915_perf *perf = stream->perf;
> >  	struct intel_gt *gt = stream->engine->gt;
> >  	struct i915_perf_group *g = stream->engine->oa_group;
> > +	int m;
> >  
> >  	if (WARN_ON(stream != g->exclusive_stream))
> >  		return;
> > @@ -1690,10 +1691,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
> >  	free_oa_configs(stream);
> >  	free_noa_wait(stream);
> >  
> > -	if (perf->spurious_report_rs.missed) {
> > -		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n",
> > -			  perf->spurious_report_rs.missed);
> > -	}
> > +	m = ratelimit_state_get_miss(&perf->spurious_report_rs);
> > +	if (m)
> > +		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n", m);
> >  }
> >  
> >  static void gen7_init_oa_buffer(struct i915_perf_stream *stream)
> 
> -- 
> Jani Nikula, Intel
