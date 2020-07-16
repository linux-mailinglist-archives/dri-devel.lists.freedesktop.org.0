Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31972235AB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E0D6ED0E;
	Fri, 17 Jul 2020 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18E46EC80
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1594909930; bh=V69aiwDzkzUM4CoHOHIEvrPpK78moRqkyd0I/xBuBCE=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=EXRaTdQm+G4iiJOFAeywJsc51E3Y9wDj53QyGao+stlDebBm2u55L64mwCKGaY2UO
 aHJLztq75TuWnIrQLV31nFORZeREq7/eHt5+H2pU/XixNBGBFa6jv/A+FPQWEWJV9y
 K0QRCLzREBA9OLCBeC2y7Mnp3eevJvpp+FpSyylo=
Date: Thu, 16 Jul 2020 16:32:09 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 0/2] Fix st7703 panel initialization failures
Message-ID: <20200716143209.ud6ote4q545bo2c7@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200716123753.3552425-1-megous@megous.com>
 <20200716140843.GA359122@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716140843.GA359122@bogon.m.sigxcpu.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

On Thu, Jul 16, 2020 at 04:08:43PM +0200, Guido G=FCnther wrote:
> Hi Ondrej,
> On Thu, Jul 16, 2020 at 02:37:51PM +0200, Ondrej Jirman wrote:
> > When extending the driver for xbd599 panel support I tried to do minimal
> > changes and keep the existing initialization timing.
> > =

> > It turned out that it's not good enough and the existing init sequence
> > is too aggressive and doesn't follow the specification. On PinePhone
> > panel is being powered down/up during suspend/resume and with current
> > timings this frequently leads to corrupted display.
> =

> Given the amount of ST7703 look alikes i don't think you can go by the
> datasheet and hope not to break other panels. The current sleeps cater
> for the rocktech panel (which suffered from similar issues you describe
> when we took other parameters) so you need to make those panel specific.

It should work on rocktech too. The patch mostly increases/reorders the del=
ays
slightly, to match the controller documentation. I don't see a reason to
complicate the driver with per panel special delays, unless these patches d=
on't
work on your panel.

The init sequence is still suboptimal, and doesn't follow the kernel docs
completely, even after these patches. Controller spec also talks about addi=
ng
some delay before enabling the backlight to avoid visual glitches.

Which is what enable callback is documented to be for. Currently part of the
initialization that belongs to prepare callback is also done in enable call=
back.

I see the glitch (small vertical shift of the image on powerup), but person=
ally
don't care much to introduce even more delays to the driver, just for the
cosmetic issue.

regards,
	o.

> Cheers,
>  -- Guido
> =

> > =

> > This patch series fixes the problems.
> > =

> > The issue was reported by Samuel Holland.
> > =

> > Relevant screenshots from the datasheet:
> > =

> >   Power on timing: https://megous.com/dl/tmp/35b72e674ce0ca27.png
> >   Power off timing: https://megous.com/dl/tmp/dea195517106ff17.png
> >   More optimal reset on poweron: https://megous.com/dl/tmp/a9e5caf14e1b=
0dc6.png
> >   Less optimal reset on poweron: https://megous.com/dl/tmp/246761039283=
c4cf.png
> >   Datasheet: https://megous.com/dl/tmp/ST7703_DS_v01_20160128.pdf
> > =

> > Please take a look.
> > =

> > thank you and regards,
> >   Ondrej Jirman
> > =

> > Ondrej Jirman (2):
> >   drm/panel: st7703: Make the sleep exit timing match the spec
> >   drm/panel: st7703: Fix the power up sequence of the panel
> > =

> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 29 ++++++++++---------
> >  1 file changed, 15 insertions(+), 14 deletions(-)
> > =

> > -- =

> > 2.27.0
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
