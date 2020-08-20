Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8624CEAA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321376EAAF;
	Fri, 21 Aug 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 109573 seconds by postgrey-1.36 at gabe;
 Thu, 20 Aug 2020 22:49:18 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C38B6E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 22:49:18 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 8324F60059163;
 Thu, 20 Aug 2020 22:49:00 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Fri, 21 Aug 2020 00:49:07 +0200
Message-ID: <1857880.I5TKlsx52r@jason>
In-Reply-To: <DABBE9E8-E94F-4F13-BB33-5DD67CAD9DFA@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy>
 <CAAEAJfBxJLyS-EaE82c4Oq3-EFongDmAtYnPtfMLKLL3KAiFxA@mail.gmail.com>
 <DABBE9E8-E94F-4F13-BB33-5DD67CAD9DFA@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 20 August 2020 10:19:45 CEST H. Nikolaus Schaller wrote:
> 
> Yes, it works!!!

It still doesn't work for me. I still get "Input not supported" from my 
monitor. It is a DVI monitor connected via a HDMI adapter, but EDID probing 
works and, as I noted previously, the HDMI/LCDC can be made to work (and 
obviously did work in the 3.18 kernel).

I used my usual recipe for kernel compilation:

ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make ci20_defconfig
ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make menuconfig
ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 uImage
ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 modules
ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 dtbs
sudo sh -c 'INSTALL_MOD_PATH=nn ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- \
            make modules_install'
sudo sh -c 'INSTALL_PATH=nn/boot ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- \
            make dtbs_install'
sudo cp arch/mips/boot/uImage nn/boot/

This was with a snapshot archive made from the following changeset:

b911b4883bfe4f7fa753ac2ff42b25fa6b3055e2

I downloaded it from here:

https://gitlab.collabora.com/linux/0day/-/tree/jz4780-drm-hdmi-v5.9-rc1

(I was going to clone the repository late last night, but it was taking a long 
time and I also didn't want to clone everything yet again.)

> There are some unexpected things related to CONFIG settings on my setup
> (maybe missing modules) but for the first time I can see the boot log on the
> panel.
> > This needs some more investigation, but seems at least a good start.
> 
> Yes it is!
> 
> I can now git diff the code and the CONFIG.
> 
> So it seems we have indeed a breakthrough.
> 
> Thanks to all who did contribute (even behind the scenes in the DRM
> subsystem), Nikolaus

Before trying this new branch, I did try and tidy up the branch I had been 
working on. I didn't notice all the changes and the new ingenic-drm-drv.c 
file, having assumed that not much would have changed in the DRM driver.

Nevertheless, my attempts at integrating the different branches can be found 
in the paulb-jz4780-ci20-hdmi-5.9-rc1 branch, mentioned earlier.

It would be nice to reconcile the JZ4780 support with the evolving upstream 
support, accommodating the extended descriptors and the extra register usage.

Paul

P.S. I noticed a few problems with the 5.9-rc1 branches such as powering down 
not actually removing the power and, in my own branch, networking not working 
reliably (or maybe even at all), with the tedious progress indicator never 
terminating in the boot sequence. So, once again, it is another case of half a 
step forwards and about three steps back.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
