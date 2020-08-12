Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FDB242AB6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 15:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971096E11C;
	Wed, 12 Aug 2020 13:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033326E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 13:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id DEF02FB04;
 Wed, 12 Aug 2020 15:56:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1YLBnojmT0o; Wed, 12 Aug 2020 15:56:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8DD1A45770; Wed, 12 Aug 2020 15:56:37 +0200 (CEST)
Date: Wed, 12 Aug 2020 15:56:37 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge
 and J721E wrapper.
Message-ID: <20200812135637.GA107602@bogon.m.sigxcpu.org>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <20200812083937.GA8816@bogon.m.sigxcpu.org>
 <3bcbbb0b-ee04-0f1e-6c54-97b01c552d82@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bcbbb0b-ee04-0f1e-6c54-97b01c552d82@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 sandor.yu@nxp.com, jonas@kwiboo.se, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Swapnil Jakhade <sjakhade@cadence.com>, jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Aug 12, 2020 at 01:47:42PM +0300, Tomi Valkeinen wrote:
> Hi Guido,
> =

> On 12/08/2020 11:39, Guido G=FCnther wrote:
> > Hi,
> > On Thu, Aug 06, 2020 at 01:34:29PM +0200, Swapnil Jakhade wrote:
> >> This patch series adds new DRM bridge driver for Cadence MHDP DPI/DP
> >> bridge. The Cadence Display Port IP is also referred as MHDP (Mobile H=
igh
> >> Definition Link, High-Definition Multimedia Interface, Display Port).
> >> Cadence Display Port complies with VESA DisplayPort (DP) and embedded
> >> Display Port (eDP) standards.
> > =

> > Is there any relation to the cadence mhdp ip core used inthe imx8mq:
> > =

> >     https://lore.kernel.org/dri-devel/cover.1590982881.git.Sandor.yu@nx=
p.com/
> > =

> > It looks very similar in several places so should that use the same dri=
ver?
> > Cheers,
> >  -- Guido
> =

> Interesting.
> =

> So the original Cadence DP patches for TI SoCs did create a common driver=
 with Rockchip's older mhdp
> driver. And looks like the IMX series points to an early version of that =
patch ("drm/rockchip:
> prepare common code for cdns and rk dpi/dp driver").
> =

> We gave up on that as the IPs did have differences and the firmwares used=
 were apparently quite
> different. The end result was very difficult to maintain, especially as (=
afaik) none of the people
> involved had relevant Rockchip HW.

Is the `struct mhdp_platform_ops` a leftover from that? Can that be dropped?

> The idea was to get a stable DP driver for TI SoCs ready and upstream, an=
d then carefully try to
> create common parts with Rockchip's driver in small pieces.

I wonder how imx8 would best blend into this? First thing will likely be
to upstream the phy code in driveres/phy/ so a modified version of this bri=
dge
driver could call into that, then go and look for common patterns.

> If the Rockchip and IMX mhdp have the same IP and same firmware, then the=
y obviously should share
> code as done in the series you point to.

I'm pretty sure they use different firmware though - the imx8mq
additionally supports HDMI with a different firmware on the same IP core
(13.4 and 13.5 in the imx8mq ref manual).

> Perhaps Cadence can clarify the differences between IMX, TI and
> Rockchip IPs and FWs?

That would be great!
 -- Guido


> I'm worried that if there are IP differences, even if not great ones, and=
 if the FWs are different
> and developed separately, it'll be a constant "fix X for SoC A, and accid=
entally break Y for SoC B
> and C", especially if too much code is shared.
> =

> In the long run I'm all for a single driver (or large shared parts), but =
I'm not sure if we should
> start with that approach.




> =

>  Tomi
> =

> -- =

> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
