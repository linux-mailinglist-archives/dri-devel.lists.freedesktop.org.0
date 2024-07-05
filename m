Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3475928EC8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 23:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35110E033;
	Fri,  5 Jul 2024 21:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2024 21:23:23 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21910E050
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 21:23:23 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id BF5BD2800B750;
 Fri,  5 Jul 2024 23:14:14 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 99DB832455; Fri,  5 Jul 2024 23:14:14 +0200 (CEST)
Date: Fri, 5 Jul 2024 23:14:14 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
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
Message-ID: <ZohiJgyaDwAoGtAx@wunner.de>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
 <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
 <ZoezRpXBgB1B5WjB@wunner.de>
 <4502d826-d80c-4a98-a889-da7badfa698e@gmx.net>
 <ZogLXYopViQO11ta@wunner.de>
 <43fa421c-5e5b-40a6-a546-d80e753586e3@gmx.net>
 <38e46b44-6248-45e8-bdf9-66008a2fe290@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38e46b44-6248-45e8-bdf9-66008a2fe290@arm.com>
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

On Fri, Jul 05, 2024 at 12:16:14PM -0500, Jeremy Linton wrote:
> > Am 05.07.24 um 17:03 schrieb Lukas Wunner:
> > > Careful there, the patch vaguely says...
> > > 
> > >     With that added and identified as "BCM2848",
> > >     an id in use by other OSs for this device, the dw2
> > >     controller on the BCM2711 will work.
> > > 
> > > ...which sounds like they copy-pasted the BCM2848 id from somewhere else.
> > > I would assume that BCM2848 is really a different SoC and not just
> > > a different name for the BCM2835, but hopefully BroadCom folks will
> > > be able to confirm or deny this (and thus the necessity of the quirk
> > > on BCM2848 and not just on BCM2835).
> 
> This id comes from the edk2-platforms ACPI tables and is currently used by
> both the rpi3 and rpi4, and AFAIK nothing else as the rpi5-dev work is
> currently only exposing XHCI.
> 
> The ID is strictly the USB controller not the SoC. Its a bit confusingly
> named, but something we inherited from the much older windows/edk2 port,
> where it appears that the peripheral HID's were just picked in numerical
> order.
> 
> [0] https://github.com/tianocore/edk2-platforms/blob/12f68d29abdc9d703f67bd743fdec23ebb1e966e/Platform/RaspberryPi/AcpiTables/GpuDevs.asl#L15

So BCM2848, BCM2849, BCM2850 and so on are just made-up IDs
for a Windows/EDK2 port that got cargo-culted into the kernel?
Yikes!

Has anyone checked whether they collide with actual Broadcom products?
