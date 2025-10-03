Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E6BB7944
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D991910E94B;
	Fri,  3 Oct 2025 16:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TNSYP1xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820110E94B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 16:39:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1EA91C007AB;
 Fri,  3 Oct 2025 16:38:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBD5F60683;
 Fri,  3 Oct 2025 16:39:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D51D102F17C4; 
 Fri,  3 Oct 2025 18:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759509552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1F9JLF84oqNjZaJLCmTP67ExLJITt2P8O0NR+62/ztU=;
 b=TNSYP1xM90AAba6RGlmBaA4a/flXLVC+rAElTVHL+LLaqMp9pBoRSjpak5bd2YjgvbSpfi
 M9PIJzp5HGeCrV0qNLNqCG5SNOBLevtvr5RGFGTbu1YJSSrU5x4OloH48JG97qLJ79FhAV
 O6QycYHCUXsrug7u2cR3wD9hceGqtqofBiJfdu7zz6IUQoG8vZZ3ovnoXXvHJpvvgHOLAD
 LpYAUO5WWjfNGAZccgxD4WEnxbgbefIKXn/RiJ78a7X6e1CFT4+beqLTLFHBGPFApJy66U
 b8SRwG+dsKtARauP3cPF2jRzctO/PaImFtl742GTLOQO8LCn8GAcw2ubRx4lkw==
Date: Fri, 3 Oct 2025 18:39:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
Message-ID: <20251003183904.15c800ac@booty>
In-Reply-To: <20251003-dexterous-loose-guppy-45e1b3@houat>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
 <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-4-78bf61580a06@bootlin.com>
 <20251003-dexterous-loose-guppy-45e1b3@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Maxime,

On Fri, 3 Oct 2025 16:04:50 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Oct 03, 2025 at 12:39:26PM +0200, Luca Ceresoli wrote:
> > drm_for_each_bridge_in_chain_scoped() and
> > drm_for_each_bridge_in_chain_from() currently get/put the bridge at each
> > iteration. But they don't protect the encoder chain, so it could change
> > (bridges added/removed) while some code is iterating over the list
> > itself. To make iterations safe, change the logic of these for_each macros
> > to lock the encoder chain mutex at the beginning and unlock it at the end
> > of the loop (be it at the end of the list, or earlier due to a 'break' or
> > 'return' statement).
> > 
> > Also remove the get/put on the current bridge because it is not needed
> > anymore. In fact all bridges in the encoder chain are refcounted already
> > thanks to the drm_bridge_get() in drm_bridge_attach() and the
> > drm_bridge_put() in drm_bridge_detach(). So while iterating with the mutex
> > held the list cannot change _and_ the refcount of all bridges in the list
> > cannot drop to zero.  
> 
> This second paragraph *really* needs to be its own patch. And I'm not
> really sure playing games when it comes to refcounting is a good idea.
> 
> A strict, simple, rule is way easier to follow than trying to figure out
> two years from now why this loop skips the refcounting.
> 
> Unless you have a performance issue that is, in which case you should
> add a comment (and we will need a meaningful benchmark to back that
> claim).

Just to give some background, I have realized we need to lock the
encoder chain after drm_for_each_bridge_in_chain_scoped() was added.
Should I had realized it before, I would have sent it in the form you
can see in this patch, without the get/put because it is not necessary.
Not sure whether that would have changed the reception.

But I'm not aware of any performance issue, and the impact of
refcounting should not be small, soI'll try re-adding an explicit
get/put on top of the current version. It will likely make the macro
more complicated but should be reasonably doable. So, expect a v3 with
that change to we can all see how it looks.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
