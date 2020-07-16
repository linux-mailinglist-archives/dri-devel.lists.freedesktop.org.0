Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3E2235CE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236D6ED41;
	Fri, 17 Jul 2020 07:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961046ECDC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594931164; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SX7hdu69Ya5NdmyT12h41uasgZBzqU3phiTCNybRetM=;
 b=fygTz1AkK3F+KkSqLcdpUfyr3zmBZjEUKSa/Vt00eTSF72jQDKtklUryyIrQc3Oa8rtmYM
 YWSRB4PVWihapc0vvKQgXHwti43BXsbCFSDEk4IVlkAUUAib8gf6krgrd5yvZjzNZB1DvT
 EDDLKtIE3EVZe0Sk+6bYeKsdbWK+UkI=
Date: Thu, 16 Jul 2020 22:25:54 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 01/12] drm/ingenic: Fix incorrect assumption about
 plane->index
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <6RWKDQ.JP0OMXFFTGWS1@crapouillou.net>
In-Reply-To: <20200716174335.GC2235355@ravnborg.org>
References: <20200716163846.174790-1-paul@crapouillou.net>
 <20200716174335.GC2235355@ravnborg.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le jeu. 16 juil. 2020 =E0 19:43, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Paul.
> =

> On Thu, Jul 16, 2020 at 06:38:35PM +0200, Paul Cercueil wrote:
>>  plane->index is NOT the index of the color plane in a YUV frame.
>>  Actually, a YUV frame is represented by a single drm_plane, even =

>> though
>>  it contains three Y, U, V planes.
>> =

>>  v2-v3: No change
>> =

>>  Cc: stable@vger.kernel.org # v5.3
>>  Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx =

>> SoCs")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Acked-by: Sam Ravnborg <sam@ravnborg.org>
> =

> A cover letter would have been useful. Please consider that in the
> future.
> All patches in this set are:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> A few requires some trivial issues fixed. They can be fixed while
> applying.
> =

> I consider the patch-set ready to go in and I expect you to commit =

> them.

Great! Thanks!

-Paul

> 	Sam
> =

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  index deb37b4a8e91..606d8acb0954 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  @@ -386,7 +386,7 @@ static void =

>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   		addr =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>>   		width =3D state->src_w >> 16;
>>   		height =3D state->src_h >> 16;
>>  -		cpp =3D state->fb->format->cpp[plane->index];
>>  +		cpp =3D state->fb->format->cpp[0];
>> =

>>   		priv->dma_hwdesc->addr =3D addr;
>>   		priv->dma_hwdesc->cmd =3D width * height * cpp / 4;
>>  --
>>  2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
