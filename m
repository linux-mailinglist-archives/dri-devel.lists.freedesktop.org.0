Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC3576F43
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E240810F173;
	Sat, 16 Jul 2022 14:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFE410E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 21:09:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D068AB82E59;
 Fri, 15 Jul 2022 21:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31454C34115;
 Fri, 15 Jul 2022 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657919357;
 bh=jDRTvdwY8R1xATb4PJAsxJ5AKoErEZjvC/CdZJc17aM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6FBC2PWHOSMyUsQ/hGpp77j0S5w4T0pP5QtN9oUZVbn9j4/yI19fqG7nkdKITybP
 Jk5hEQdBxVlEaYH3JS/hu1cKnkKU4rRpv1JymfhhTIr2N607kIrbFeXH15B348QVFQ
 8qtIi9+7IlO1D/uvlbVRfWut1dN1hV3JFXH3vjkf8Pz/t7ldEgq2Vq0zttBt/7zz/S
 51dvMhlBiZx5B1iuMjLIFFXsFMVAega0s25WGzmYBFDYCZ4KnQRL7y5VrTsdt+1liv
 XIOlSC7QX1VYE0blt+cUqHD0VJ4XI5bqOKCEnpd+RIlBvVidrYNLh4SrCO7OMhLSuH
 i689AruIGEWDg==
Date: Fri, 15 Jul 2022 14:09:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm fixes for 5.19-rc7
Message-ID: <YtHXe4PcWXfihF9Q@dev-arch.thelio-3990X>
References: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 01:36:17PM +1000, Dave Airlie wrote:
> Matthew Auld (1):
>       drm/i915/ttm: fix sg_table construction

This patch breaks i386_defconfig with both GCC and clang:

  ld: drivers/gpu/drm/i915/i915_scatterlist.o: in function `i915_rsgt_from_mm_node':
  i915_scatterlist.c:(.text+0x1a7): undefined reference to `__udivdi3'

  ld.lld: error: undefined symbol: __udivdi3
  >>> referenced by i915_scatterlist.c
  >>>               gpu/drm/i915/i915_scatterlist.o:(i915_rsgt_from_mm_node) in archive drivers/built-in.a

It was reported by Stephen in -next [1] and there is a fix [2] that
works for me but it doesn't appear to be applied yet (at least, it is
not in drm-intel-fixes at the moment). It is a little disappointing to
see new build errors being introduced before -rc7, especially when
visible with a defconfig...

[1]: https://lore.kernel.org/20220713221454.67bb20df@canb.auug.org.au/
[2]: https://lore.kernel.org/20220712174050.592550-1-matthew.auld@intel.com/

Cheers,
Nathan
