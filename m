Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2C1E8A1C
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 23:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C86E97A;
	Fri, 29 May 2020 21:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45756E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 21:36:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21339858-1500050 for multiple; Fri, 29 May 2020 22:36:20 +0100
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3hrOTvTP6fOBLM8RF4fH4XRTPV54enk1Gd4uTSQvW2wQ@mail.gmail.com>
References: <20200529201534.474853-1-arnd@arndb.de>
 <159078398171.4326.11332427648947797488@build.alporthouse.com>
 <CAK8P3a3hrOTvTP6fOBLM8RF4fH4XRTPV54enk1Gd4uTSQvW2wQ@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/selftests/mm: reduce per-function stack usage
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <159078818097.4326.5461114962414146268@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 29 May 2020 22:36:20 +0100
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
Cc: kbuild test robot <lkp@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, Christian König <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-05-29 21:43:47)
> On Fri, May 29, 2020 at 10:26 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Arnd Bergmann (2020-05-29 21:15:26)
> 
> > >
> > > diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> > > index 9aabe82dcd3a..30108c330db8 100644
> > > --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> > > +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> > > @@ -323,9 +323,8 @@ static bool expect_reserve_fail(struct drm_mm *mm, struct drm_mm_node *node)
> > >         return false;
> > >  }
> > >
> > > -static bool check_reserve_boundaries(struct drm_mm *mm,
> > > -                                    unsigned int count,
> > > -                                    u64 size)
> > > +static noinline_for_stack bool
> > > +check_reserve_boundaries(struct drm_mm *mm, unsigned int count, u64 size)
> > >  {
> > >         const struct boundary {
> >
> > It's this const [] right? Hmm, if we felt adventurous that could be a
> > small set of multiplication factors (0, -1, 1, count, count+1, ...) and
> > made static.
> 
> That was my first thought, but I couldn't figure out whether 'count'
> could be replaced by any compile-time constant.

I just realised I sent a sketch of a patch to the wrong place. If we
replace struct boundary with { int start; int size; const char *name; }
that should reduce it from 408 to 272. (Where start, size are the
multiples.)

Probably not worth the hassle, the saving is too small overall leaving
it uncomfortably close to a future warning.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
