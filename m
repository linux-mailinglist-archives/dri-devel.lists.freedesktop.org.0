Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519B222588C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3FC6E1CD;
	Mon, 20 Jul 2020 07:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20246E110
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595156901; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qtrq8DWA1MSBvJzHIvwu9TgumC0NB4bv34kVPO/wg5Q=;
 b=Ux/db8/+KGuBoet3V7QqV/HszzxM1csvIdFcoldH2kBNTbKPOBkt2ZNmlKrCX3d/zNSRun
 S8dc3Q67mW7KnnLTqCJso0orUSrmJRq7hc9n6LqM0yQZmOcKY7B5dAyZjH3a4dQs8NtZlI
 DJaAotCQwaKQ65SULB5DFxMom33UlEw=
Date: Sun, 19 Jul 2020 13:08:12 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Silence uninitialized-variable warning
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <OXQPDQ.F020MLMIOEKM@crapouillou.net>
In-Reply-To: <20200719102354.GA20692@ravnborg.org>
References: <20200719093834.14084-1-paul@crapouillou.net>
 <20200719102354.GA20692@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:36 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le dim. 19 juil. 2020 =E0 12:23, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Paul.
> =

> On Sun, Jul 19, 2020 at 11:38:34AM +0200, Paul Cercueil wrote:
>>  Silence compiler warning about used but uninitialized 'ipu_state'
>>  variable. In practice, the variable would never be used when
>>  uninitialized, but the compiler cannot know that 'priv->ipu_plane' =

>> will
>>  always be NULL if CONFIG_INGENIC_IPU is disabled.
>> =

>>  Silence the warning by initializing the value to NULL.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Patch looks good. Had to dig into the code to understand the
> change to the no_vblank flag.
> So:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> I expect you to commit the patch.

Pushed, thanks.

> Looking at the code I noticed that the return value of
> drm_atomic_get_plane_state() is not checked.
> Can you try to look into this.

Right. I'll fix it.

-Paul

> 	Sam
> =

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index b6d946fbeaf5..ada990a7f911 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -198,7 +198,7 @@ static int ingenic_drm_crtc_atomic_check(struct =

>> drm_crtc *crtc,
>>   					 struct drm_crtc_state *state)
>>   {
>>   	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>>  -	struct drm_plane_state *f1_state, *f0_state, *ipu_state;
>>  +	struct drm_plane_state *f1_state, *f0_state, *ipu_state =3D NULL;
>>   	long rate;
>> =

>>   	if (!drm_atomic_crtc_needs_modeset(state))
>>  @@ -229,7 +229,7 @@ static int ingenic_drm_crtc_atomic_check(struct =

>> drm_crtc *crtc,
>> =

>>   		/* If all the planes are disabled, we won't get a VBLANK IRQ */
>>   		priv->no_vblank =3D !f1_state->fb && !f0_state->fb &&
>>  -				  !(priv->ipu_plane && ipu_state->fb);
>>  +				  !(ipu_state && ipu_state->fb);
>>   	}
>> =

>>   	return 0;
>>  --
>>  2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
