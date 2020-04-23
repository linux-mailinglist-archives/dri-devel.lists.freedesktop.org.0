Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102411B5CFE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 15:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4D489EBD;
	Thu, 23 Apr 2020 13:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AFA89EBD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587650236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QW1tSuIfcIKxjYf9LLgrZqmajw3o/j6bsRa8RR84jXc=;
 b=FB1uZb7yG15TpbVEOPmMLOF+hjKs1YED6ow98eO3JDkyfPmMmYFU1aOsphe42db3SepE9E
 i6mibxDno2sT8IuNd3a3thCeRsWXH/CO1IAeHo9iO5evXjxMrt6ESAWzdU6V73G0BUKDtZ
 tfhThINEn41BXoo3GPlfS9jg+/7RjB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-ORW7PZGNMFmlHbLbz3pE-w-1; Thu, 23 Apr 2020 09:57:14 -0400
X-MC-Unique: ORW7PZGNMFmlHbLbz3pE-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DFC180F105;
 Thu, 23 Apr 2020 13:57:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A62E5196AE;
 Thu, 23 Apr 2020 13:57:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6EA341753B; Thu, 23 Apr 2020 15:57:09 +0200 (CEST)
Date: Thu, 23 Apr 2020 15:57:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
Message-ID: <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
MIME-Version: 1.0
In-Reply-To: <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > I don't think it is that simple.
> > 
> > First:  How will that interact with cursor bo allocations?  IIRC the
> > strategy for them is to allocate top-down, for similar reasons (avoid
> > small cursor bo allocs fragment vram memory).
> 
> In ast, 2 cursor BOs are allocated during driver initialization and kept
> permanently at the vram's top end. I don't know about other drivers.

One-time allocation at init time shouldn't be a problem.

> But cursor BOs are small, so they don't make much of a difference. What
> is needed is space for 2 primary framebuffers during pageflips, with one
> of them pinned. The other framebuffer can be located anywhere.

The problem isn't the size.  The problem is dynamically allocated cursor
BOs can also fragment vram, especially if top-bottom allocation is also
used for large framebuffers so cursor BOs can end up somewhere in the
middle of vram.

> > Second:  I think ttm will move bo's from vram to system only on memory
> > pressure.  So you can still end up with fragmented memory.  To make the
> > scheme with one fb @ top and one @ bottom work reliable you have to be
> > more aggressive on pushing out framebuffers.
> 
> I'm the process of converting mgag200 to atomic modesetting. The given
> example is what I observed. I'm not claiming that the placement scheme
> is perfect, but it is required to get mgag200 working with atomic
> modesetting's pageflip logic. So we're solving a real problem here.

I don't doubt this is a real problem.

> The bug comes from Weston's allocation strategy. Looking at the debug
> output:
> 
> >>   0x0000000000000000-0x000000000000057f: 1407: free
> 
> This was fbdev's framebuffer with 1600x900@32bpp
> 
> >>   0x000000000000057f-0x0000000000000b5b: 1500: used
> 
> This is Weston's framebuffer also with 1600x900@32bpp. But Weston
> allocates an additional, unused 60 scanlines. That is to render with
> tiles of 64x64px, I suppose. fbdev doesn't do that, hence Weston's
> second framebuffer doesn't fit into the free location of the fbdev
> framebuffer.

Sure.  Assume there is just enough vram to fit in fbdev and two weston
framebuffers.  fbdev is allocated from bottom, first weston fb from top,
second weston fb from bottom again.  fbdev is not pushed out (no memory
pressure yet) so the second weston fb ends up in the middle of vram
fragmenting things.  And now you are again in the situation where you
might have enough free vram for an allocation but can't use it due to
fragmention (probably harder to trigger in practice though).

That's why I would suggest to explicitly move out unpinned framebuffers
(aka fbdev) before pinning a new one (second weston fb) instead of
depending on ttm moving things out on OOM, to make sure you never
allocate something in the middle of vram.

> > Third:  I'd suggest make topdown allocations depending on current state
> > instead of simply alternating, i.e. if there is a pinned framebuffer @
> > offset 0, then go for top-down.
> 
> That's what the current patch does. If the last pin was at the bottom,
> the next goes to the top. And then the other way around. Without
> alternating between both end of vram, the problem would occur again when
> fragmentation happens near the top end.

I'd feel better when checking the state of my current pins to figure
whenever I should alloc top-bottom or not, for robustness reasons.

> Looking again at the vram helpers, this functionality could be
> implemented in drm_gem_vram_plane_helper_prepare_fb(). Drivers with
> other placement strategies could implement their own helper for prepare_fb.

vram helpers could also simply offer two prepare_fb variants.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
