Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C9227A66
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEA889CBC;
	Tue, 21 Jul 2020 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B784E89DBA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595240836; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdCVDWDwHTmXgaZHNnlauYXxDq15QXjXqFezV3DfFus=;
 b=wOml8NgFPf5VVXbhwIDev4VX3akMLY+Vx8b3cKG0dfY6lOHn3gdl/P+mTjRzk62vk/8dXX
 hO0/0FqslVQP/n0lDRkApAsEhuhHF2ZTwgRB/KmEEwSwRA/AXck/ekEre91VzNJLoaHJPW
 TLDx73WwF1DQECikl0JM870X1ho+k48=
Date: Mon, 20 Jul 2020 12:27:08 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [bug report] drm/ingenic: Add support for the IPU
To: dan.carpenter@oracle.com
Message-Id: <8PJRDQ.C0OS615TSW9V1@crapouillou.net>
In-Reply-To: <20200720072237.GA8232@mwanda>
References: <20200720072237.GA8232@mwanda>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Le lun. 20 juil. 2020 =E0 10:22, dan.carpenter@oracle.com a =E9crit :
> Hello Paul Cercueil,
> =

> The patch fc1acf317b01: "drm/ingenic: Add support for the IPU" from
> Jul 16, 2020, leads to the following static checker warning:
> =

> 	drivers/gpu/drm/ingenic/ingenic-drm-drv.c:232 =

> ingenic_drm_crtc_atomic_check()
> 	error: potentially dereferencing uninitialized 'ipu_state'.

I fixed it yesterday, commit 40a55dc13e9d in drm-misc-next.

> drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>    197  static int ingenic_drm_crtc_atomic_check(struct drm_crtc =

> *crtc,
>    198                                           struct =

> drm_crtc_state *state)
>    199  {
>    200          struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>    201          struct drm_plane_state *f1_state, *f0_state, =

> *ipu_state;
>    202          long rate;
>    203
>    204          if (!drm_atomic_crtc_needs_modeset(state))
>    205                  return 0;
>    206
>    207          if (state->mode.hdisplay > priv->soc_info->max_width =

> ||
>    208              state->mode.vdisplay > priv->soc_info->max_height)
>    209                  return -EINVAL;
>    210
>    211          rate =3D clk_round_rate(priv->pix_clk,
>    212                                state->adjusted_mode.clock * =

> 1000);
>    213          if (rate < 0)
>    214                  return rate;
>    215
>    216          if (priv->soc_info->has_osd) {
>    217                  f1_state =3D =

> drm_atomic_get_plane_state(state->state, &priv->f1);
>    218                  f0_state =3D =

> drm_atomic_get_plane_state(state->state, &priv->f0);
>    219
>    220                  if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && =

> priv->ipu_plane) {
> =

> Do we need to check both the CONFIG and the priv->ipu_plane or would =

> it
> be sufficient to just check if (priv->ipu_plane) {?

It would be enough, yes.

Cheers,
-Paul

>    221                          ipu_state =3D =

> drm_atomic_get_plane_state(state->state, priv->ipu_plane);
>    222
>    223                          /* IPU and F1 planes cannot be =

> enabled at the same time. */
>    224                          if (f1_state->fb && ipu_state->fb) {
>    225                                  dev_dbg(priv->dev, "Cannot =

> enable both F1 and IPU\n");
>    226                                  return -EINVAL;
>    227                          }
>    228                  }
>    229
>    230                  /* If all the planes are disabled, we won't =

> get a VBLANK IRQ */
>    231                  priv->no_vblank =3D !f1_state->fb && =

> !f0_state->fb &&
>    232                                    !(priv->ipu_plane && =

> ipu_state->fb);
>                                             ^^^^^^^^^^^^^^^
> Because here we're only checking "priv->ipu_plane".
> =

>    233          }
>    234
>    235          return 0;
>    236  }
> =

> regards,
> dan carpenter


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
