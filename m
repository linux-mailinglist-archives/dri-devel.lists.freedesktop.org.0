Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4CD521C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 21:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437256E0AA;
	Sat, 12 Oct 2019 19:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66836E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 19:24:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,289,1566856800"; d="scan'208";a="322500714"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Oct 2019 21:24:19 +0200
Date: Sat, 12 Oct 2019 21:24:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH 1/2] drm/imx: Fix error handling for a kmemdup() call in
 imx_pd_bind()
In-Reply-To: <CAEkB2ERCGJ6abNXfPNX7nbwkwD7qYTPYjYsNGzZwynn5CbPCzg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1910122122370.3049@hadrien>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
 <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
 <3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de>
 <CAEkB2ERCGJ6abNXfPNX7nbwkwD7qYTPYjYsNGzZwynn5CbPCzg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2018450889-1570908260=:3049"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel-janitors@vger.kernel.org,
 Peter Senna Tschudin <peter.senna@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Navid Emamdoost <emamd001@umn.edu>, Markus Elfring <Markus.Elfring@web.de>,
 NXP Linux Team <linux-imx@nxp.com>, Stephen McCamant <smccaman@umn.edu>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2018450889-1570908260=:3049
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 12 Oct 2019, Navid Emamdoost wrote:

> On Sat, Oct 12, 2019 at 4:07 AM Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 12 Oct 2019 10:30:21 +0200
> >
> > The return value from a call of the function “kmemdup” was not checked
> > in this function implementation. Thus add the corresponding error handling.
> >
> > Fixes: 19022aaae677dfa171a719e9d1ff04823ce65a65 ("staging: drm/imx: Add parallel display support")
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/gpu/drm/imx/parallel-display.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> > index 35518e5de356..39c4798f56b6 100644
> > --- a/drivers/gpu/drm/imx/parallel-display.c
> > +++ b/drivers/gpu/drm/imx/parallel-display.c
> > @@ -210,8 +210,13 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
> >                 return -ENOMEM;
> >
> >         edidp = of_get_property(np, "edid", &imxpd->edid_len);
> > -       if (edidp)
> > +       if (edidp) {
> >                 imxpd->edid = kmemdup(edidp, imxpd->edid_len, GFP_KERNEL);
> > +               if (!imxpd->edid) {
> > +                       devm_kfree(dev, imxpd);
>
> You should not try to free imxpd here as it is a resource-managed
> allocation via devm_kzalloc(). It means memory allocated with this
> function is
>  automatically freed on driver detach. So, this patch introduces a double-free.

No, it's not double freed since the proposed code frees it with a devm
function, removing it from the list of things to free later.  One can
wonder why the free has to be made apparent, though.

julia

>
> > +                       return -ENOMEM;
> > +               }
> > +       }
> >
> >         ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
> >         if (!ret) {
> > --
> > 2.23.0
> >
>
>
> --
> Navid.
>
--8323329-2018450889-1570908260=:3049
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--8323329-2018450889-1570908260=:3049--
