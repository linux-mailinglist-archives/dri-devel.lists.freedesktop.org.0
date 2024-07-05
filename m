Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DA928B4E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DA510E09F;
	Fri,  5 Jul 2024 15:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2024 15:09:17 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C80F10E092
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 15:09:17 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id D577F100B0385;
 Fri,  5 Jul 2024 17:03:57 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 7B58F4BC74; Fri,  5 Jul 2024 17:03:57 +0200 (CEST)
Date: Fri, 5 Jul 2024 17:03:57 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
Subject: Re: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
Message-ID: <ZogLXYopViQO11ta@wunner.de>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
 <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
 <ZoezRpXBgB1B5WjB@wunner.de>
 <4502d826-d80c-4a98-a889-da7badfa698e@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4502d826-d80c-4a98-a889-da7badfa698e@gmx.net>
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

On Fri, Jul 05, 2024 at 12:22:33PM +0200, Stefan Wahren wrote:
> Am 05.07.24 um 10:48 schrieb Lukas Wunner:
> > A similar issue was reported for Agilex platforms back in 2021:
> > 
> > https://lore.kernel.org/all/5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com/
> > 
> > It was fixed by commit 3d8d3504d233 ("usb: dwc2: Add platform specific
> > data for Intel's Agilex"), which sets the no_clock_gating flag on that
> > platform.
> 
> From my understanding Samsung noticed this issue at first and
> introduced the no_clock_gating flag [1] and they referenced 0112b7ce68ea
> ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.") as I did in
> this patch. Later some platforms like Rockchip and Agilex followed.
> 
> Should i better refer to the Samsung bugfix instead of the Agilex bugfix?

I'd say mention both.  The Samsung one because it was the first
occurrence and the Agilex one because it specifically mentions
the interrupt storm which you've also witnessed on the Raspberry Pi.
Samsung's report mentions other symptoms than an interrupt storm.


> > The real question is whether BCM2848 platforms likewise cannot disable
> > the clock of the dwc2 controller or whether this is specific to the
> > BCM2835.  Right now dwc2_set_bcm_params() is applied to both the
> > BCM2848 and BCM2835.  If the BCM2848 behaves differently in this
> > regard, we'd have to duplicate dwc2_set_bcm_params() for the BCM2835.
> 
> From my understand BCM2848 refers to the same SoC, but the ACPI
> implementation uses a different ID [2]. So I think this is safe.
> [2] -
> https://patches.linaro.org/project/linux-usb/patch/20210413215834.3126447-2-jeremy.linton@arm.com/

Careful there, the patch vaguely says...

    With that added and identified as "BCM2848",
    an id in use by other OSs for this device, the dw2
    controller on the BCM2711 will work.

...which sounds like they copy-pasted the BCM2848 id from somewhere else.
I would assume that BCM2848 is really a different SoC and not just
a different name for the BCM2835, but hopefully BroadCom folks will
be able to confirm or deny this (and thus the necessity of the quirk
on BCM2848 and not just on BCM2835).

Thanks,

Lukas
