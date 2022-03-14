Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FB4D8E7D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 21:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9760710E195;
	Mon, 14 Mar 2022 20:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED08710E195
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647291298; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uz2k5nUu1Gg2qptwTocuJgcWPtTBxTEHiT3pqQ3nMhg=;
 b=1VrvD6lxUP9r1QEUUnDIj9wF1x/SY8hEdzy2a5HAbjQAkp4cqYUKTFNd7jMIIEK+YEuz1j
 y4QxQ7SCaCwzBY0qs8boPPrkDGmJfxKSbnf627nIyRLqwpB2835bEEzLN0BAxeZqPOZiWH
 ibkOqHMFy0gytAs+ZpPZPVEaU+L6QNM=
Date: Mon, 14 Mar 2022 20:54:43 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
 add .enable and .disable
To: Christophe Branchereau <cbranchereau@gmail.com>
Message-Id: <736R8R.46MVQ2VHV6IY1@crapouillou.net>
In-Reply-To: <CAFsFa85Wb7HcxCqGCYQoSOHOTLJY9xtUHc85PoxO3XTbr=HN4g@mail.gmail.com>
References: <20220301153122.20660-1-cbranchereau@gmail.com>
 <20220301153122.20660-4-cbranchereau@gmail.com>
 <VM548R.0I9BAN681OS83@crapouillou.net>
 <CAFsFa85Wb7HcxCqGCYQoSOHOTLJY9xtUHc85PoxO3XTbr=HN4g@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Le lun., mars 7 2022 at 19:12:49 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> Hi Paul, it should in theory, but doesn't work in practice, the
> display doesn't like having that bit set outside of the init sequence.
>=20
> Feel free to experiment if you think you can make it work though, you
> should have that panel on 1 or 2 devices I think.

It does actually work in practice; what probably fails for you is the=20
regmap_set_bits(), which causes a spi-read-then-write. Since AFAIK it=20
is not possible to read registers from this panel (only write), then=20
this does not work.

An easy fix would be to just use REGCACHE_FLAT as the cache type in the=20
regmap_config. Then regmap_set_bits() can be used.

Cheers,
-Paul

>=20
> KR
> CB
>=20
> On Wed, Mar 2, 2022 at 12:22 PM Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>=20
>>  Hi Christophe,
>>=20
>>  Le mar., mars 1 2022 at 16:31:22 +0100, Christophe Branchereau
>>  <cbranchereau@gmail.com> a =E9crit :
>>  > Following the introduction of bridge_atomic_enable in the ingenic
>>  > drm driver, the crtc is enabled between .prepare and .enable, if
>>  > it exists.
>>  >
>>  > Add it so the backlight is only enabled after the crtc is, to=20
>> avoid
>>  > graphical issues.
>>  >
>>  > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
>>  > ---
>>  >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 23 ++++++++++++--
>>  >  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31
>>  > ++++++++++++++++---
>>  >  2 files changed, 48 insertions(+), 6 deletions(-)
>>  >
>>  > diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
>>  > b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
>>  > index f043b484055b..b5736344e3ec 100644
>>  > --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
>>  > +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
>>  > @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel
>>  > *panel)
>>  >               goto err_disable_regulator;
>>  >       }
>>  >
>>  > -     msleep(120);
>>  > -
>>  >       return 0;
>>  >
>>  >  err_disable_regulator:
>>  > @@ -202,6 +200,25 @@ static int y030xx067a_unprepare(struct=20
>> drm_panel
>>  > *panel)
>>  >       return 0;
>>  >  }
>>  >
>>  > +static int y030xx067a_enable(struct drm_panel *panel)
>>  > +{
>>  > +     if (panel->backlight) {
>>  > +             /* Wait for the picture to be ready before enabling=20
>> backlight */
>>  > +             msleep(120);
>>  > +     }
>>  > +
>>  > +     return 0;
>>  > +}
>>  > +
>>  > +static int y030xx067a_disable(struct drm_panel *panel)
>>  > +{
>>  > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
>>  > +
>>  > +     regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
>>=20
>>  Shouldn't that be balanced by a regmap_set_bits() in the .enable()
>>  function?
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>  > +
>>  > +     return 0;
>>  > +}
>>  > +
>>  >  static int y030xx067a_get_modes(struct drm_panel *panel,
>>  >                               struct drm_connector *connector)
>>  >  {
>>  > @@ -239,6 +256,8 @@ static int y030xx067a_get_modes(struct=20
>> drm_panel
>>  > *panel,
>>  >  static const struct drm_panel_funcs y030xx067a_funcs =3D {
>>  >       .prepare        =3D y030xx067a_prepare,
>>  >       .unprepare      =3D y030xx067a_unprepare,
>>  > +     .enable         =3D y030xx067a_enable,
>>  > +     .disable        =3D y030xx067a_disable,
>>  >       .get_modes      =3D y030xx067a_get_modes,
>>  >  };
>>  >
>>  > diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
>>  > b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
>>  > index c558de3f99be..6de7370185cd 100644
>>  > --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
>>  > +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
>>  > @@ -80,8 +80,6 @@ static const struct reg_sequence
>>  > ej030na_init_sequence[] =3D {
>>  >       { 0x47, 0x08 },
>>  >       { 0x48, 0x0f },
>>  >       { 0x49, 0x0f },
>>  > -
>>  > -     { 0x2b, 0x01 },
>>  >  };
>>  >
>>  >  static int ej030na_prepare(struct drm_panel *panel)
>>  > @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel
>>  > *panel)
>>  >               goto err_disable_regulator;
>>  >       }
>>  >
>>  > -     msleep(120);
>>  > -
>>  >       return 0;
>>  >
>>  >  err_disable_regulator:
>>  > @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel
>>  > *panel)
>>  >       return 0;
>>  >  }
>>  >
>>  > +static int ej030na_enable(struct drm_panel *panel)
>>  > +{
>>  > +     struct ej030na *priv =3D to_ej030na(panel);
>>  > +
>>  > +     /* standby off */
>>  > +     regmap_write(priv->map, 0x2b, 0x01);
>>  > +
>>  > +     if (panel->backlight) {
>>  > +             /* Wait for the picture to be ready before enabling=20
>> backlight */
>>  > +             msleep(120);
>>  > +     }
>>  > +
>>  > +     return 0;
>>  > +}
>>  > +
>>  > +static int ej030na_disable(struct drm_panel *panel)
>>  > +{
>>  > +     struct ej030na *priv =3D to_ej030na(panel);
>>  > +
>>  > +     /* standby on */
>>  > +     regmap_write(priv->map, 0x2b, 0x00);
>>  > +
>>  > +     return 0;
>>  > +}
>>  > +
>>  >  static int ej030na_get_modes(struct drm_panel *panel,
>>  >                            struct drm_connector *connector)
>>  >  {
>>  > @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel
>>  > *panel,
>>  >  static const struct drm_panel_funcs ej030na_funcs =3D {
>>  >       .prepare        =3D ej030na_prepare,
>>  >       .unprepare      =3D ej030na_unprepare,
>>  > +     .enable         =3D ej030na_enable,
>>  > +     .disable        =3D ej030na_disable,
>>  >       .get_modes      =3D ej030na_get_modes,
>>  >  };
>>  >
>>  > --
>>  > 2.34.1
>>  >
>>=20
>>=20


