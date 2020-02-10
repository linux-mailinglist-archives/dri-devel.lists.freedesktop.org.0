Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33915703E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320F6E90F;
	Mon, 10 Feb 2020 08:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11956E90C;
 Mon, 10 Feb 2020 08:10:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20169875-1500050 for multiple; Mon, 10 Feb 2020 08:09:48 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200204150146.2006481-6-daniel.vetter@ffwll.ch>
References: <20200204150146.2006481-1-daniel.vetter@ffwll.ch>
 <20200204150146.2006481-6-daniel.vetter@ffwll.ch>
Message-ID: <158132218598.7138.16056756566358710107@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 5/5] drm: Nerf drm_global_mutex BKL for good drivers
Date: Mon, 10 Feb 2020 08:09:46 +0000
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

Quoting Daniel Vetter (2020-02-04 15:01:46)
> This catches the majority of drivers (unfortunately not if we take
> users into account, because all the big drivers have at least a
> lastclose hook).
> 
> With the prep patches out of the way all drm state is fully protected
> and either prevents or can deal with the races from dropping the BKL
> around open/close. The only thing left to audit are the various driver
> hooks - by keeping the BKL around if any of them are set we have a
> very simple cop-out!
> 
> Note that one of the biggest prep pieces to get here was making
> dev->open_count atomic, which was done in
> 
> commit 7e13ad896484a0165a68197a2e64091ea28c9602
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jan 24 13:01:07 2020 +0000
> 
>     drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count
> 
> v2:
> - Rebase and fix locking in drm_open() (Chris)
> - Indentation fix in drm_release
> - Typo fix in the commit message (Sam)
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
