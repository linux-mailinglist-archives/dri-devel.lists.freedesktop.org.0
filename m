Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C8974F10
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 11:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6397910E990;
	Wed, 11 Sep 2024 09:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vgcwAQGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269B10E0A6;
 Wed, 11 Sep 2024 09:51:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at
 [213.229.8.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7448D5B3;
 Wed, 11 Sep 2024 11:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1726048230;
 bh=E5X0N4knkqpIVRCMt7kxebRIQnXbxg+DEiCRGEwvRDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vgcwAQGOKF8g6aC4YH5Z/YW+QqJDzkNWKxzkA4N9Yvy44FowsyepwIRbzc0TRoZ3u
 aIg6hZJ/evWK0sautqefLLCAE9+FkUkkdJ0u1c+9CE/fgcxwO6DFsuKjc+KPYEBxr9
 K9Cxgiwz7hm8px4beniPYY85iim5fGQBXmYP19Mo=
Date: Wed, 11 Sep 2024 12:51:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read() with
 __maybe_unused
Message-ID: <20240911095113.GB4470@pendragon.ideasonboard.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
 <87jzfjk4vy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzfjk4vy.fsf@intel.com>
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

On Tue, Sep 10, 2024 at 04:36:01PM +0300, Jani Nikula wrote:
> On Tue, 10 Sep 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Hi Jani,
> >
> > On Tue, Sep 10, 2024 at 12:06 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >> Building with clang and and W=1 leads to warning about unused
> >> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
> >>
> >> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >> inline functions for W=1 build").
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> >> @@ -32,7 +32,7 @@ struct rcar_cmm {
> >>         } lut;
> >>  };
> >>
> >> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> >> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> >>  {
> >>         return ioread32(rcmm->base + reg);
> >>  }
> >
> > This function was never used. Why not remove it instead?
> 
> Can do if that's what the maintainers desire. It's just that sometimes
> it's better to have the implementation reviewed and ready waiting for
> the users than requiring the first user to add the implementation. I
> opted for __maybe_unused across the series.

Jiapeng Chong has sent a patch to drop the function, and I've reviewed
it. See https://lore.kernel.org/r/20240619075436.86407-1-jiapeng.chong@linux.alibaba.com

I've sent a pull request for v6.12 but it hasn't been processed in time
:-( See https://lore.kernel.org/r/20240822234445.GA23541@pendragon.ideasonboard.com

-- 
Regards,

Laurent Pinchart
