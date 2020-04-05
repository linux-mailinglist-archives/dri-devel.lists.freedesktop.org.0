Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E815F19EBEF
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 16:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C865890F4;
	Sun,  5 Apr 2020 14:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D02890F4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 14:27:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D742320160;
 Sun,  5 Apr 2020 16:27:17 +0200 (CEST)
Date: Sun, 5 Apr 2020 16:27:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Joonas =?iso-8859-1?Q?Kylm=E4l=E4?= <joonas.kylmala@iki.fi>
Subject: Re: [PATCH] drm/panel: samsung: s6e8aa0: Add backlight control support
Message-ID: <20200405142715.GA28291@ravnborg.org>
References: <CGME20190921125017epcas3p2f5661cca04f0959f9707f6111102435d@epcas3p2.samsung.com>
 <20190921124843.6967-1-joonas.kylmala@iki.fi>
 <d8a8bf25-0c5e-8d94-9406-b1f74e3edfac@samsung.com>
 <53385e44-1847-ace0-cd87-5571f6acd3f2@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53385e44-1847-ace0-cd87-5571f6acd3f2@iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=8Bv4S_VrHzWzl_PHQgMA:9 a=wPNLvfGTeEIA:10
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul.kocialkowski@bootlin.com,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 GNUtoo@cyberdimension.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joonas.

On Sat, Apr 04, 2020 at 04:27:02PM +0300, Joonas Kylm=E4l=E4 wrote:
> Hi,
> =

> addressing this email to you all since there might be widespread race
> condition issue in the DRM panel drivers that are using MIPI DSI. See
> below for my message.
> =

> Andrzej Hajda:
> >> +static int s6e8aa0_set_brightness(struct backlight_device *bd)
> >> +{
> >> +	struct s6e8aa0 *ctx =3D bl_get_data(bd);
> >> +	const u8 *gamma;
> >> +
> >> +	if (ctx->error)
> >> +		return;
> >> +
> >> +	gamma =3D ctx->variant->gamma_tables[bd->props.brightness];
> >> +
> >> +	if (ctx->version >=3D 142)
> >> +		s6e8aa0_elvss_nvm_set(ctx);
> >> +
> >> +	s6e8aa0_dcs_write(ctx, gamma, GAMMA_TABLE_LEN);
> >> +
> >> +	/* update gamma table. */
> >> +	s6e8aa0_dcs_write_seq_static(ctx, 0xf7, 0x03);
> >> +
> >> +	return s6e8aa0_clear_error(ctx);
> >> +}
> >> +
> >> +static const struct backlight_ops s6e8aa0_backlight_ops =3D {
> >> +	.update_status	=3D s6e8aa0_set_brightness,
> > =

> > =

> > This is racy, update_status can be called in any time between probe and
> > remove, particularly:
> > =

> > a) before panel enable,
> > =

> > b) during panel enable,
> > =

> > c) when panel is enabled,
> > =

> > d) during panel disable,
> > =

> > e) after panel disable,
> > =

> > =

> > b and d are racy for sure - backlight and drm callbacks are async.
> > =

> > IMO the best solution would be to register backlight after attaching
> > panel to drm, but for this drm_panel_funcs should have attach/detach
> > callbacks (like drm_bridge_funcs),
> > =

> > then update_status callback should take some drm_connector lock to
> > synchronize with drm, and write to hw only when pipe is enabled.
> =

> I have done now research and if I understand right one issue here might
> be with setting the backlight brightness if the DSI device is not
> attached before calling update_status() since calling it would call
> subsequently s6e8aa0_set_brightness() -> s6e8aa0_dcs_write() ->
> mipi_dsi_dcs_write_buffer(), which then requires DSI to be attached.

Not directly related to your comments above.
But I have looked at the backlight support for the various
samsung panels.

None of them are good examples to follow.
Please have a look at for example panel-novatek-nt35510.c
which is a good example how to have a local backligth
and tie it into the general way it is used by drm_panel.

I have typed patches to fix all three samsung panels, will
post patches later when I get more time.

If we are concerned with set_brightness() being called
while not ready, this can be checked in the
set_brightness() function and return error if not OK.

As the the race concerns see Daniel's reply.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
