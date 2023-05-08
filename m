Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A056FA058
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C32810E125;
	Mon,  8 May 2023 06:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F410E125
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 06:57:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QFBtZ5Z9sz9sbv;
 Mon,  8 May 2023 08:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1683529046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XtmaYEfhkK+ur5naimltvQ4iqVq57t4hjPHSqtkEcow=;
 b=xB9Jx8VLgZAlpCoPZLpqC5O2aKUuP18Lhn2kgotfbfZnKanZ9WMuGV4domG/79dUM5gaEF
 ikjBALJB2mlbwY8zHBfMcmtT8gYV6RU+99i9Uqnemngy9soX343R7ds5yPK4WQtF5SMFJP
 KwQGvebLAfy/kB59YW4bJJfUjvNxusGBImCuxBiTwoL1EW+PPg+bDCztc7JgCkJg2di+Oh
 KulvYJpfVXPd++bihCV135c8C6W4kGleJ1gzIMoEaMnKobETJzUqZ3ravBF9uUvhLALMpM
 gXgnQcsf9wKDLmoUf76aDuSqCO4876JtycNJcUlVBM/kj9K0nbvxBNoWCLi2tA==
References: <20230418074008.69752-1-me@crly.cz>
 <87cz3uzpx1.fsf@oltmanns.dev> <87mt2o9njh.fsf@oltmanns.dev>
 <CSCPKPC8OB80.1TTBCM3YDVJQ5@void.crly.cz>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v2 0/7] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
Date: Mon, 08 May 2023 08:54:28 +0200
In-reply-to: <CSCPKPC8OB80.1TTBCM3YDVJQ5@void.crly.cz>
Message-ID: <87o7mvpayj.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Roman,

On 2023-05-03 at 16:22:32 +0200, "Roman Beranek" <me@crly.cz> wrote:
> Hello everyone,
>
> I apologize for my absence from the discussion during past week, I got
> hit with tonsillitis.

I hope you feel better!

> On Mon May 1, 2023 at 3:40 PM CEST, Frank Oltmanns wrote:
>> Looking at ccu_nkm_determine_rate(), we've found our culprit because it
>> does not try parent clock rates other than the current one. The same
>> applies to all other ccu_nkm_* functions.
>
> Yes, that's why I dropped CLK_SET_RATE_PARENT from pll-mipi in v3.
>
>>  b. Add functionality to ccu_nkm_* to also update the parent clock rate.
>>
>> I'm actually interested in tackling b, but I can't make any promises as
>> to if and when I'll be able to solve it. I'm not certain about any side
>> effects this might have.
>
> It sounds like an interesting exercise. But what if HDMI is then added
> to the mix?

Thanks for interest in this discussion! I really appreciate it!

First of all, let me admit that I'm no expert on this. But nobody else
has replied so far, and I want to keep this conversation going, so let
me share my view.

My understanding is that pll-mipi being able to set pll-video0's rate
should not have an impact on HDMI, neither positive nor negative. If I'm
not mistaken those two things are orthogonal.

The relevant part of the clk_summary with your v4 [1] patch on top of
drm-next looks like this:

                                 enable  protect              hardware
   clock                          count    count        rate    enable
----------------------------------------------------------------------
    pll-video0                        1        1   294000000         Y
       hdmi                           0        0   294000000         N
       tcon1                          0        0   294000000         N
       pll-mipi                       1        1   431200000         Y
          tcon0                       2        1   431200000         Y
             tcon-data-clock          1        1   107800000         Y
       pll-video0-2x                  0        0   588000000         Y

Note, that pll-video0 is protected.

I don't own any boards that support HDMI in mainline. For the pinephone
this support is added e.g. in megi's kernel, where connecting an HDMI
output results in pll-video0's rate being set to 297MHz, even though it
is 294MHz after boot.

So, for reference, this is the same part of the clk_summary with megi's
6.3.0 kernel, USB-C dock unplugged:

                                 enable  protect              hardware
   clock                          count    count        rate    enable
----------------------------------------------------------------------
    pll-video0                        3        0   294000000         Y
       hdmi-phy-clk                   1        0    73500000         Y
       hdmi                           1        0   294000000         Y
       tcon1                          0        0   294000000         N
       pll-mipi                       1        0   431200000         Y
          tcon0                       2        0   431200000         Y
             tcon-pixel-clock         1        0   107800000         Y
       pll-video0-2x                  0        0   588000000         Y

pll-video0 is not protected. When plugging in the USB-C dock with an HDMI
monitor connected, the situation looks like this:

                                 enable  protect              hardware
   clock                          count    count        rate    enable
----------------------------------------------------------------------
    pll-video0                        4        1   297000000         Y
       hdmi-phy-clk                   1        0   148500000         Y
       hdmi                           1        0   148500000         Y
       tcon1                          1        1   148500000         Y
       pll-mipi                       1        0   424285714         Y
          tcon0                       2        0   424285714         Y
             tcon-pixel-clock         1        0   106071428         Y
       pll-video0-2x                  0        0   594000000         Y

As you can see, pll-video0 is updated to 297 MHz. My understanding is
(again: not an expert here) this is only possible due to the missing
protection.

What I'm trying to say is that I don't see a connection between HDMI and
having the functionality in ccu_nkm_* to update the parent clock rate.

But I do think it would be preferable to have pll-video0 at 297 MHz
after boot on the pinephone. We could achieve this with my two previous
proposals:

 a) Set pll-video0 to 297 MHz on boot
 b) Add functionality to ccu_nkm_* to also update the parent clock rate.

If solution b is viable, the goal for the pinephone (and any other
boards supporting HDMI) would then be to select a pixel-data-clock so
that the rate for pll-video0 is set to 297 MHz (by selecting an
appropriate clock speed for the internal panel).

Maybe I'm misunderstanding something. If so, I'd appreciate any
corrections.

Thanks,
  Frank

[1]: https://lore.kernel.org/all/20230505052110.67514-1-me@crly.cz/

>
> Best regards
> Roman
