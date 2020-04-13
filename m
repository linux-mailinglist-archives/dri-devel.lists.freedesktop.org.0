Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B41A7421
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B1C6E45D;
	Tue, 14 Apr 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs10.siol.net [185.57.226.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2815A89F6B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 16:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id BA13F5230DC;
 Mon, 13 Apr 2020 18:09:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 6FMkXzO6_pPd; Mon, 13 Apr 2020 18:09:10 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 681F15230DF;
 Mon, 13 Apr 2020 18:09:10 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 2757B5230DC;
 Mon, 13 Apr 2020 18:09:09 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
Date: Mon, 13 Apr 2020 18:09:08 +0200
Message-ID: <1742537.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <CAGb2v66LxhqTBeA_Br=kUrTq83hocEcAzYYC6nXpASvkkjn+1g@mail.gmail.com>
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
 <CAGb2v66LxhqTBeA_Br=kUrTq83hocEcAzYYC6nXpASvkkjn+1g@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 13. april 2020 ob 16:12:39 CEST je Chen-Yu Tsai napisal(a):
> On Mon, Apr 13, 2020 at 6:11 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > On Mon, Apr 13, 2020 at 5:55 PM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > > m divider in DDC clock register is 4 bits wide. Fix that.
> > > 
> > > Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > 
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> Cc stable?

I don't think it's necessary:
1. It doesn't change much (anything?) for me when reading EDID. I don't think 
it's super important to have precise DDC clock in order to properly read EDID.
2. No matter if it has "Cc stable" tag or not, it will be eventually picked 
for stable due to fixes tag.

This was only small observation when I was researching EDID readout issue on 
A20 board, but sadly, I wasn't able to figure out why reading it sometimes 
fails. I noticed similar issue on SoCs with DE2 (most prominently on OrangePi 
PC2 - H5), but there was easy workaround - I just disabled video driver in U-
Boot. However, if A20 display driver gets disabled in U-Boot, it totally 
breaks video output on my TV when Linux boots (no output). I guess there is 
more fundamental problem with clocks than just field size. I think we should 
add more constraints in clock driver, like preset some clock parents and not 
allow to change parents when setting rate, but carefully, so simplefb doesn't 
break. Such constraints should also solve problems with dual head setups.

Best regards,
Jernej



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
