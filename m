Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0023F303808
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F026E424;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF5E6E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611601218;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ApNZTMIInEBgGEPOK7UkgKyGz/LWwCn7DJKKj6UZaSw=;
 b=MpF2jGVnFNy5tcHyC0Uy4lButdlCnYOqg+18L4FDi8zQD2HfDSSBd9ltbwG4quLh70
 +GK0YG4UH47F5pq8Wj/yWbk1DOjScWSp6SyCkrKNB13luNZEQZSWV/JsZCEh5PopsCVi
 FrSp3hj+rIZZe6Q5K1gvIhFmUFwRy6pQ9BJV2gWSutINwUNt5h2R6lCkcteGfOVU4Djf
 rVtKCX4hnUjY3W0rrpN5q2e8kLfMcV5SRvfthg5fdYf80Tx6QSD2Ee51jREZ1hID5uVq
 GO7cuVyVUsFJCUpFs0DuBIVAsK2VjsQahRJNB3zg8haSgfO1napMje6cWrvy5AemJ3Ny
 ITAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaVXA4LwHo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.15.1 DYNA|AUTH)
 with ESMTPSA id Y03f19x0PIul1CV
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 25 Jan 2021 19:56:47 +0100 (CET)
Subject: Re: [PATCH v3 4/4] drm/ingenic: Fix non-OSD mode
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2F0C9F5C-7849-458B-B18E-433BA7CFBD92@goldelico.com>
Date: Mon, 25 Jan 2021 19:56:46 +0100
Message-Id: <F2A3A43E-C9F6-4A64-A167-AD4A20B30BD3@goldelico.com>
References: <20210124085552.29146-1-paul@crapouillou.net>
 <20210124085552.29146-5-paul@crapouillou.net>
 <30F302B6-04A1-472B-B026-009F7665E39C@goldelico.com>
 <VZMFNQ.C1KORF6E5NCJ1@crapouillou.net>
 <2F0C9F5C-7849-458B-B18E-433BA7CFBD92@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, od@zcrc.me,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, stable@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 24.01.2021 um 10:47 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> =

> Hi Paul,
> =

>> Am 24.01.2021 um 10:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>> =

>> Hi Nikolaus,
>> =

>> Le dim. 24 janv. 2021 =E0 10:30, H. Nikolaus Schaller <hns@goldelico.com=
> a =E9crit :
>>> Hi Paul,
>>> we observed the same issue on the jz4730 (which is almost identical
>>> to the jz4740 wrt. LCDC) and our solution [1] was simpler.
>>> It leaves the hwdesc f0 and f1 as they are and just takes f1 for really
>>> programming the first DMA descriptor if there is no OSD.
>> =

>> Disagreed. With your solution, it ends up using priv->f1 plane with hwde=
sc_f0. That's very confusing.
> =

> It is a tradeoff between code simplicity and confusion. Indeed difficult =
to decide. Fortunately I don't have to :)
> =

>> =

>>> We have tested on jz4730 and jz4780.
>> =

>> Could I get a tested-by then? :)
> =

> I'll test with our tree and test both SoC in the next days and give feedb=
ack.

Ok, works on both devices:

a) Skytone Alpha 400 compatible Letux 400 with not-yet-upstream jz4730 and =
internal panel
b) CI20 with external HDMI (tablet) and our not-yet-upstream HDMI code

So the hwdesc handling is as ok as it was with our patch. I'll keep a copy =
of yours in our
tree until it arrives upstream.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus


> =

> BR and thanks,
> Nikolaus
> =

>> =

>> Cheers,
>> -Paul
>> =

>>> Maybe you want to consider that. Then I can officially post it.
>>> [1] https://github.com/goldelico/letux-kernel/commit/3be1de5fdabf2cc1c1=
7f198ded3328cc6e4b9844
>>>> Am 24.01.2021 um 09:55 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>> Even though the JZ4740 did not have the OSD mode, it had (according to
>>>> the documentation) two DMA channels, but there is absolutely no
>>>> information about how to select the second DMA channel.
>>>> Make the ingenic-drm driver work in non-OSD mode by using the
>>>> foreground0 plane (which is bound to the DMA0 channel) as the primary
>>>> plane, instead of the foreground1 plane, which is the primary plane
>>>> when in OSD mode.
>>>> Fixes: 3c9bea4ef32b ("drm/ingenic: Add support for OSD mode")
>>>> Cc: <stable@vger.kernel.org> # v5.8+
>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> ---
>>>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 +++++++----
>>>> 1 file changed, 7 insertions(+), 4 deletions(-)
>>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/d=
rm/ingenic/ingenic-drm-drv.c
>>>> index b23011c1c5d9..59ce43862e16 100644
>>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> @@ -554,7 +554,7 @@ static void ingenic_drm_plane_atomic_update(struct=
 drm_plane *plane,
>>>> 		height =3D state->src_h >> 16;
>>>> 		cpp =3D state->fb->format->cpp[0];
>>>> -		if (priv->soc_info->has_osd && plane->type =3D=3D DRM_PLANE_TYPE_OV=
ERLAY)
>>>> +		if (!priv->soc_info->has_osd || plane->type =3D=3D DRM_PLANE_TYPE_O=
VERLAY)
>>>> 			hwdesc =3D &priv->dma_hwdescs->hwdesc_f0;
>>>> 		else
>>>> 			hwdesc =3D &priv->dma_hwdescs->hwdesc_f1;
>>> we just replace this with
>>>               if (priv->soc_info->has_osd && plane->type !=3D DRM_PLANE=
_TYPE_OVERLAY)
>>>                       hwdesc =3D &priv->dma_hwdescs->hwdesc_f1;
>>>               else
>>>                       hwdesc =3D &priv->dma_hwdescs->hwdesc_f0;
>>> and the remainder can stay as is.
>>>> @@ -826,6 +826,7 @@ static int ingenic_drm_bind(struct device *dev, bo=
ol has_components)
>>>> 	const struct jz_soc_info *soc_info;
>>>> 	struct ingenic_drm *priv;
>>>> 	struct clk *parent_clk;
>>>> +	struct drm_plane *primary;
>>>> 	struct drm_bridge *bridge;
>>>> 	struct drm_panel *panel;
>>>> 	struct drm_encoder *encoder;
>>>> @@ -940,9 +941,11 @@ static int ingenic_drm_bind(struct device *dev, b=
ool has_components)
>>>> 	if (soc_info->has_osd)
>>>> 		priv->ipu_plane =3D drm_plane_from_index(drm, 0);
>>>> -	drm_plane_helper_add(&priv->f1, &ingenic_drm_plane_helper_funcs);
>>>> +	primary =3D priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
>>>> -	ret =3D drm_universal_plane_init(drm, &priv->f1, 1,
>>>> +	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
>>>> +
>>>> +	ret =3D drm_universal_plane_init(drm, primary, 1,
>>>> 				       &ingenic_drm_primary_plane_funcs,
>>>> 				       priv->soc_info->formats_f1,
>>>> 				       priv->soc_info->num_formats_f1,
>>>> @@ -954,7 +957,7 @@ static int ingenic_drm_bind(struct device *dev, bo=
ol has_components)
>>>> 	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>>>> -	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
>>>> +	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, primary,
>>>> 					NULL, &ingenic_drm_crtc_funcs, NULL);
>>>> 	if (ret) {
>>>> 		dev_err(dev, "Failed to init CRTC: %i\n", ret);
>>>> --
>>>> 2.29.2
>>> BR and thanks,
>>> Nikolaus
>> =

>> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
