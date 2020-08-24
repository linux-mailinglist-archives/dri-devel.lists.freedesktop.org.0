Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1402B24FC3E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87F6E1E8;
	Mon, 24 Aug 2020 11:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864106E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 11:05:00 +0000 (UTC)
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kAAHW-0000RH-8m; Mon, 24 Aug 2020 13:04:54 +0200
Message-ID: <25afd4892c3d73c247293a99a666192d3d40df10.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix external abort seen on GC600 rev 0x19
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Christian
 Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Aug 2020 13:04:13 +0200
In-Reply-To: <20200823191956.GH1551@shell.armlinux.org.uk>
References: <20200821181731.94852-1-christian.gmeiner@gmail.com>
 <4dbee9c7-8a59-9250-ab13-394cbab689a8@jm0.eu>
 <CAH9NwWdLnwb0BiR6qAHKFexFm2NJkpHv7Z7YAdQ7fJBVxjGH4w@mail.gmail.com>
 <20200823191956.GH1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Russell,

Am Sonntag, den 23.08.2020, 20:19 +0100 schrieb Russell King - ARM Linux admin:
> On Sun, Aug 23, 2020 at 09:10:25PM +0200, Christian Gmeiner wrote:
> > Hi
> > 
> > > I have formally tested the patch with 5.7.10 - and it doesn't resolve
> > > the issue - sadly :(
> > > 
> > > From my testing, the reads on
> > > VIVS_HI_CHIP_PRODUCT_ID
> > > VIVS_HI_CHIP_ECO_ID
> > > need to be conditional - while
> > > VIVS_HI_CHIP_CUSTOMER_ID
> > > seems to be okay.
> > > 
> > 
> > Uhh.. okay.. just send a V2 - thanks for testing :)
> 
> There is also something else going on with the GC600 - 5.4 worked fine,
> 5.8 doesn't - my 2D Xorg driver gets stuck waiting on a BO after just
> a couple of minutes.  Looking in debugfs, there's a whole load of BOs
> that are listed as "active", yet the GPU is idle:
> 
>    00020000: A  0 ( 7) 00000000 00000000 8294400
>    00010000: I  0 ( 1) 00000000 00000000 4096
>    00010000: I  0 ( 1) 00000000 00000000 4096
>    00010000: I  0 ( 1) 00000000 00000000 327680
>    00010000: A  0 ( 7) 00000000 00000000 8388608
>    00010000: I  0 ( 1) 00000000 00000000 8388608
>    00010000: I  0 ( 1) 00000000 00000000 8388608
>    00010000: A  0 ( 7) 00000000 00000000 8388608
>    00010000: A  0 ( 3) 00000000 00000000 8388608
>    00010000: A  0 ( 4) 00000000 00000000 8388608
>    00010000: A  0 ( 3) 00000000 00000000 8388608
>    00010000: A  0 ( 3) 00000000 00000000 8388608
>    00010000: A  0 ( 3) 00000000 00000000 8388608
> ....
>    00010000: A  0 ( 3) 00000000 00000000 8388608
> Total 38 objects, 293842944 bytes
> 
> My guess is there's something up with the way a job completes that's
> causing the BOs not to be marked inactive.  I haven't yet been able
> to debug any further.

The patch I just sent out should fix this issue. The DRM scheduler is
doing some funny business which breaks our job done signalling if the
GPU timeout has been hit, even if our timeout handler is just extending
the timeout as the GPU is still working normally.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
