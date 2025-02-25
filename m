Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D068A44FA3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0090010E7FA;
	Tue, 25 Feb 2025 22:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC25A10E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:18:49 +0000 (UTC)
Date: Tue, 25 Feb 2025 17:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1740521927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RzgOyhdKuLwcBRSLmcJJ0Jbuz6w06hvV2SnnIVn+zvE=;
 b=HmIbJR+TaH7Wme6F4IPgbYtpzGHncrdCmBgNbeauOOAC7dPDo9n+83JhZyKZNWClyuOlQl
 4Yd6Y5swrftBaTXfLZ9TqMEMumfngYObl51LG3XLlMGkk3nLBjg2wARO3s+7inOWpMfdz+
 9BEjD65HMh9hRlIOn9GZhbw78eZ2p04pZFjupo1J238pOamFvvMrciBkX1/2num0Ki1TYh
 fOcGw6WA01Qm5YZeXvQgPxYJZHCLkyzLYbzl0KwKZ9FdgdsdEC6m+YOm/ePvW01IzWFKsd
 WEy23MZtEcougGgl1L1VyWuZovF6cjpx821nBtTsG/9yhVdMcht6FOW402plDg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Daniel Stone <daniel@fooishbar.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH v2] drm: add modifiers for Apple GPU layouts
Message-ID: <Z75BwWllrew-DIlS@blossom>
References: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
 <CAPj87rO3N2=3mNQg8-CUF=-XTysJHLmgArRKuvDpdk3YZ2xMvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rO3N2=3mNQg8-CUF=-XTysJHLmgArRKuvDpdk3YZ2xMvQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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

> > These layouts are notably not used for interchange across hardware
> > blocks (e.g. with the display controller). There are other layouts for
> > that but we don't support them either in userspace or kernelspace yet
> > (even downstream), so we don't add modifiers here.
> 
> Yeah, when those have users with good definitions matching these, we
> can add them here, even if they are downstream. Anything the GPU would
> share out of context, or the codec, would be good for this.

Sure. The mentioned "other layouts" are for scanout (GPU->display), and
apparently the GPU can render but not sample them... You can imagine
about how well that would go without a vendor extension + compositor
patches......

(Currently we use linear framebuffers for scanout and avoid that rat's
nest.)

> 
> > +/*
> > + * Apple GPU-tiled layout.
> > + *
> > + * GPU-tiled images are divided into tiles. Tiles are always 16KiB, with
> > + * dimensions depending on the base-format. Within a tile, pixels are fully
> > + * interleaved (Morton order). Tiles themselves are raster-order.
> > + *
> > + * Images must be 16-byte aligned.
> > + *
> > + * For more information see
> > + * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
> 
> This writeup is really nice. I would prefer it was inlined here though
> (similar to AFBC), with Mesa then referring to the kernel, but tbf
> Vivante does have a similar external reference.

Thanks :-) I wasn't sure which way would be better. Most of the
complexity in that writeup relates to mipmapping and arrayed images,
which I don't think WSI hits...? Also, the Mesa docs are easier for me
to update, support tables and LaTeX, have other bits of hw writeups on
the same page, etc... so they feel like a better home for the unabridged
version.  And since Vivante did this, I figured it was ok.

If people feel strongly I can of course inline it, it's just not clear
to me that dumping all that info into the header here is actually
desired. (And there's even more info Marge queued ...
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33743/diffs?commit_id=5ddb57ceb46d42096a34cbef1df6b4109ac2b511
)

> The one thing it's missing is an explicit description of how stride is
> computed and used. I can see the 'obvious' way to do it for this and
> compression, but it would be good to make it explicit, given some
> misadventures in the past. CCS is probably the gold standard to refer
> to here.

Ah, right -- thanks for raising that! I'll add this for v3. Indeed, I
picked the "obvious" way, given said misadventures with AFBC ;)

This is the relevant Mesa code:

   /*
    * For WSI purposes, we need to associate a stride with all layouts.
    * In the hardware, only strided linear images have an associated
    * stride, there is no natural stride associated with twiddled
    * images.  However, various clients assert that the stride is valid
    * for the image if it were linear (even if it is in fact not
    * linear). In those cases, by convention we use the minimum valid
    * such stride.
    */
   static inline uint32_t
   ail_get_wsi_stride_B(const struct ail_layout *layout, unsigned level)
   {
      assert(level == 0 && "Mipmaps cannot be shared as WSI");
   
      if (layout->tiling == AIL_TILING_LINEAR)
         return ail_get_linear_stride_B(layout, level);
      else
         return util_format_get_stride(layout->format, layout->width_px);
   }

I can either copy that comment here, or to make that logic more explicit:

    Producers must set the stride to the image width in
    pixels times the bytes per pixel. This is a software convention, the
    hardware does not use this stride.

Thanks,

Alyssa
