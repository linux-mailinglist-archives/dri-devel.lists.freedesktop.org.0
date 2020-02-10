Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7915703C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8AA6E909;
	Mon, 10 Feb 2020 08:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10286E909;
 Mon, 10 Feb 2020 08:10:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20169869-1500050 for multiple; Mon, 10 Feb 2020 08:09:18 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200204150146.2006481-5-daniel.vetter@ffwll.ch>
References: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
 <20200204150146.2006481-5-daniel.vetter@ffwll.ch>
Message-ID: <158132215597.7138.6950234793925402888@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/5] drm: Push drm_global_mutex locking in drm_open
Date: Mon, 10 Feb 2020 08:09:16 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-02-04 15:01:45)
> We want to only take the BKL on crap drivers, but to know whether
> we have a crap driver we first need to look it up. Split this shuffle
> out from the main BKL-disabling patch, for more clarity. Historical
> aside: When the kernel-wide BKL was removed, it was replaced by
> drm_global_mutex within the scope of the drm subsystem hence why these
> two things are (almost) interchangeable as concepts here.
> 
> Since the minors are refcounted drm_minor_acquire is purely internal
> and this does not have a driver visible effect.
> 
> v2: Push the locking even further into drm_open(), suggested by Chris.
> This gives us more symmetry with drm_release(), and maybe a futuer
> avenue where we make drm_global_mutex locking (partially) opt-in like
> with drm_release_noglobal().
> 
> v3:
> - Actually push this stuff correctly, don't unlock twice (Chris)
> - Fix typo on commit message, plus explain why BKL = drm_global_mutex
>   (Sam)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
