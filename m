Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011289C6539
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 00:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5D10E17D;
	Tue, 12 Nov 2024 23:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="ylgF4mzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE40A10E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 23:35:23 +0000 (UTC)
Date: Wed, 13 Nov 2024 10:33:14 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1731454521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMbHqD+H0zd72SUEwYPmsE9R4wTLK4oFNYpLilDoG38=;
 b=ylgF4mzcsM/CWq/YKvClifTLZH7vCdLAWKIqWnIPHm1D13CdUREyoniFOn+mElVbgLLUyR
 Xz8KqJTTLDqDbgFRzFKuEpaY8K7sgvva0GGzq2I7veWNTf7CsjeyAJzCfwffGZiKK7L2g/
 +xH6RouQQVtZGcTwIJ08yjwnxzDkECI66BD28PLVZFY5QaF5DbO5Tyv7CIgxLhZOSifrJs
 CG3bnLO17WXI3WFwurYU9klwutqfWvMCsmna79NYtHZWSrl7exUSIwfl8cy8H1NZPhf3QS
 SIPSaGNgiza2lEJdNE7UH+rS3FOjXovzHJEGLDL+JnixRk3MFJuyMQBw8SZ01A==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Parthiban <parthiban@linumiz.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <ZzPluoI7xSTwhNcm@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
 <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com>
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

Hi there,

On Tue, Nov 12, 2024 at 10:43:44PM +0530, Parthiban wrote:
> #define TCON_TOP_PORT_DE0_MSK                   GENMASK(1, 0)
> #define TCON_TOP_PORT_DE1_MSK                   GENMASK(5, 4)
> 
> references towards DE0 and DE1 is for DE itself, not the mixers in the
> current implementation.

So the datasheet says it's for DE0/DE1 but the Allwinner driver and mainline
driver assume it's for mixers. There's a conflation between mixer and DE in
this case, especially because everywhere mixer1 is used on the A133 it is
switched to DE1. I'm also unaware of the R40 having two DEs which kind of
confirms this might be a typo. If anyone has actually tested the second output
of this it would help find out if it actually means DE1 or mixer1.

> Handling for mixer0 <-> lcd1 and mixer1 <-> lcd0 also needs to set
> DE2TCON_MUX in de clock, which is missing now.

Hmm. Are you sure? Looking at the Allwinner drivers it has the method
de_top_set_de2tcon_mux in
drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c
which I think means it's for DE3? But I don't see it called anywhere?

This might be worth discussing in the DE3 patchset.

> sun8i_tcon_top_set_hdmi_src for R40 already sets these values via quirks.
> i.e controlling the port muxing. Also D1 quirks is same as R40. So the
> original changes to make the DE1 point to TVx can also done in this quirk
> without hardcoded value?

In this case I'm using an LCD which isn't HDMI, so I'm not too sure how much
this would help. Having it as a quirk also seems a bit overkill if this is a
general preventative fix, especially since Allwinner doesn't seem to test their
functionality. Relying on it seems like a mistake in this case.

My other thought is that when sun8i_tcon_top_de_config is called it could do
something. But I'm not sure what that something would actually be, given it may
be called twice in an (I assume) unknown order.

Say, if mixer1 is set as TV0 and and mixer0 is set as TV1 we would try to set mixer1
first, see that mixer0 is already set to TV0 then ... error? Even though the
final configuration doesn't have any conflicts.

I was thinking something like this for my next patch:

	/*
	 * Make sure that by default DE0 and DE1 are set to different outputs,
	 * otherwise we get a strange tinting or unusable display on the T113.
	*/
	reg = readl(regs + TCON_TOP_PORT_SEL_REG);
	reg &= ~TCON_TOP_PORT_DE0_MSK;
	reg |= FIELD_PREP(TCON_TOP_PORT_DE0_MSK, 0);
	reg &= ~TCON_TOP_PORT_DE1_MSK;
	reg |= FIELD_PREP(TCON_TOP_PORT_DE1_MSK, 1);
	writel(reg, regs + TCON_TOP_PORT_SEL_REG);

Perhaps this could be hidden behind a quirk? I would have to check to see which
chips have this behaviour, I'm not sure if it's a bug specific to the T113 or
D1/T113 or R40 too.

Also noting at the top of the file that DE0 and DE1 mean mixer0 and mixer1
might be good to reduce confusion.

What do you think? :)

> Thanks,
> Parthiban

Thanks for your input!

John Watts
