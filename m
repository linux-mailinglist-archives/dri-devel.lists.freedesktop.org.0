Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041003830DD
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FB26E98F;
	Mon, 17 May 2021 14:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B11D6E98F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:30:59 +0000 (UTC)
Date: Mon, 17 May 2021 15:30:45 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <9N99TQ.6E5XN4XTCLTT1@crapouillou.net>
In-Reply-To: <YKJsj+dDUshm/ZiT@phenom.ffwll.local>
References: <20210323144008.166248-1-paul@crapouillou.net>
 <6DP1TQ.W6B9JRRW1OY5@crapouillou.net> <YKJsj+dDUshm/ZiT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le lun., mai 17 2021 at 15:15:59 +0200, Daniel Vetter <daniel@ffwll.ch>=20
a =E9crit :
> On Thu, May 13, 2021 at 01:29:30PM +0100, Paul Cercueil wrote:
>>  Hi,
>>=20
>>  Almost two months later,
>=20
> Since you're committer it's expected that you go actively out to look=20
> for
> review or trade with someone else who has some patches that need a=20
> quick
> look. It will not happen automatically, this is on you.

I maintain all drivers, platform code and DTS for Ingenic SoCs so I do=20
my part, just not in this subsystem.

> Also generally after 2 weeks the patch is lost and you need to ping=20
> it.

OK. Then I guess I'll just include this one in a future patchset.

> -Daniel

Cheers,
-Paul

>>=20
>>=20
>>  Le mar., mars 23 2021 at 14:40:08 +0000, Paul Cercueil
>>  <paul@crapouillou.net> a =E9crit :
>>  > When using a 24-bit panel on a 8-bit serial bus, the pixel clock
>>  > requested by the panel has to be multiplied by 3, since the=20
>> subpixels
>>  > are shifted sequentially.
>>  >
>>  > The code (in ingenic_drm_encoder_atomic_check) already computed
>>  > crtc_state->adjusted_mode->crtc_clock accordingly, but=20
>> clk_set_rate()
>>  > used crtc_state->adjusted_mode->clock instead.
>>  >
>>  > Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when=20
>> using a
>>  > 3x8-bit panel")
>>  > Cc: stable@vger.kernel.org # v5.10
>>  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>=20
>>  Can I get an ACK for my patch?
>>=20
>>  Thanks!
>>  -Paul
>>=20
>>  > ---
>>  >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>>  >
>>  > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > index d60e1eefc9d1..cba68bf52ec5 100644
>>  > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > @@ -342,7 +342,7 @@ static void=20
>> ingenic_drm_crtc_atomic_flush(struct
>>  > drm_crtc *crtc,
>>  >  	if (priv->update_clk_rate) {
>>  >  		mutex_lock(&priv->clk_mutex);
>>  >  		clk_set_rate(priv->pix_clk,
>>  > -			     crtc_state->adjusted_mode.clock * 1000);
>>  > +			     crtc_state->adjusted_mode.crtc_clock * 1000);
>>  >  		priv->update_clk_rate =3D false;
>>  >  		mutex_unlock(&priv->clk_mutex);
>>  >  	}
>>  > --
>>  > 2.30.2
>>  >
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


