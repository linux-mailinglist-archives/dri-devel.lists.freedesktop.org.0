Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017306FA28F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2510E18C;
	Mon,  8 May 2023 08:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284410E18C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:48:14 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QFFLH2cmXz9sZg;
 Mon,  8 May 2023 10:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1683535687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FQoQY5pIK/HZeZmbF38CtnZKLgaiKBQEXeYGzcGHP5g=;
 b=o8EJDXixeVki95ipLVB+bnKZTJ7X7qq8hmz/vg+jbCuZ3O3tHRh33WLul0VLPdzh5rJ4zj
 NUUunOtUN8yNwzNZqq6A296WevvW+TDjOMLyC9rS4FiLHJGDfLZkrHl0ESqB1ui4P2vdlB
 4VT1g4PX3Zu1xW41QNvsF4tWERaxQFihncjmP2GZA6sDVKqbx8Uha1RelcJH9Mqp4c6eo1
 ySXMq7tQPNMZZFrLU9PUCxNc77oZ/5qeH59Hlwdpm8DYgK3qO5Ag5iy5kydVZGpGNr0WDV
 OHfy6RU++9uhMtb8Vm8PCSZPLqP0LLOao5L5yr6r1ghKTtMpWqNmgMWFXGPZkA==
References: <20230505052110.67514-1-me@crly.cz>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 0/4] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
Date: Mon, 08 May 2023 10:47:41 +0200
In-reply-to: <20230505052110.67514-1-me@crly.cz>
Message-ID: <87jzxjp5tp.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4QFFLH2cmXz9sZg
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-clk@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On 2023-05-05 at 07:21:06 +0200, Roman Beranek <me@crly.cz> wrote:
> According to Allwinner's BSP code, in DSI mode, TCON0 clock needs to be
> running at what's effectively the per-lane datarate of the DSI link.
> Given that the TCON DCLK divider is fixed to 4 (SUN6I_DSI_TCON_DIV),
> DCLK can't be set equal to the dotclock. Therefore labeling TCON DCLK
> as sun4i_dotclock or tcon-pixel-clock shall be avoided.
>
> With bpp bits per pixel transmitted over n DSI lanes, the target DCLK
> rate for a given pixel clock is obtained as follows:
>
> DCLK rate = 1/4 * bpp / n * pixel clock
>
> Effect of this change can be observed through the rate of Vblank IRQs
> which should now match refresh rate implied by set display mode. It
> was verified to do so on a A64 board with a 2-lane and a 4-lane panel.
>
> v2:
> 1. prevent reparent of tcon0 to pll-video0-2x
> 2. include pll-video0 in setting TCON0 DCLK rate
> 3. tested the whole thing also on a PinePhone
>
> v3:
> 1. accept that pll-video0 can't be included in setting TCON0 DCLK rate
> 2. reset pll-video0 to its default rate in case u-boot changed it
>
> v4:
> 1. keep pll-video0 as is
> 2. assign parent to TCON0 mux in sun50i_a64_ccu_probe (not in DT)
>
> Roman Beranek (4):
>   clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux
>   ARM: dts: sunxi: rename tcon's clock output
>   drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
>   drm: sun4i: calculate proper DCLK rate for DSI
>
>  arch/arm/boot/dts/sun5i.dtsi                  |  2 +-
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi          |  2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
>  arch/arm/boot/dts/sun8i-v3s.dtsi              |  2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  2 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++-
>  drivers/gpu/drm/sun4i/Makefile                |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 46 +++++++++++--------
>  .../{sun4i_dotclock.c => sun4i_tcon_dclk.c}   |  2 +-
>  .../{sun4i_dotclock.h => sun4i_tcon_dclk.h}   |  0
>  10 files changed, 46 insertions(+), 28 deletions(-)
>  rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c => sun4i_tcon_dclk.c} (99%)
>  rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h => sun4i_tcon_dclk.h} (100%)
>
>
> base-commit: 8a91b29f1f50ce7742cdbe5cf11d17f128511f3f

I tested this on my pinephone on drm-next, using additional patches for
the pinephone's panel. [1] [2] [3]

I played back a 60 fps video (10 seconds) and recorded the panel's
output with a 240 fps camera. I noticed only 2 dropped frames, that I
account to the imperfect data rate of 107.8MHz instead of 108 MHz due to
pll-video0's rate being 294MHz instead of the 297 MHz for reasons I
described in the thread on your v2 of this patch [4]).

Tested-by: Frank Oltmanns <frank@oltmanns.dev>

Thanks,
  Frank

[1]: https://lore.kernel.org/all/20230213123238.76889-2-frank@oltmanns.dev/
[2]: https://lore.kernel.org/all/20230211171748.36692-2-frank@oltmanns.dev/
[3]: https://github.com/megous/linux/commit/e83ffbfe930562257abef1eed4abb8e2251b795a
[4]: https://lore.kernel.org/all/87cz3uzpx1.fsf@oltmanns.dev/
