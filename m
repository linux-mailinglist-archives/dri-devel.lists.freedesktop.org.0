Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D328C921
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D24B6E8A6;
	Tue, 13 Oct 2020 07:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1F16E591;
 Mon, 12 Oct 2020 19:14:06 +0000 (UTC)
Date: Mon, 12 Oct 2020 21:13:53 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix bad revert
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <53S3IQ.YMG1AT14NTR93@crapouillou.net>
In-Reply-To: <20201012141041.GU438822@phenom.ffwll.local>
References: <20201012152452.432c4867@canb.auug.org.au>
 <20201012102509.10690-1-paul@crapouillou.net>
 <20201012141041.GU438822@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 12 oct. 2020 =E0 16:10, Daniel Vetter <daniel@ffwll.ch> a =E9crit =

:
> On Mon, Oct 12, 2020 at 12:25:09PM +0200, Paul Cercueil wrote:
>>  Fix a badly reverted commit. The revert commit was cherry-picked =

>> from
>>  drm-misc-next to drm-misc-next-fixes, and in the process some =

>> unrelated
>>  code was added.
>> =

>>  Fixes: a3fb64c00d44 "Revert "gpu/drm: ingenic: Add option to mmap =

>> GEM buffers cached""
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I applied the patch to drm-misc-next-fixes.

Thanks,
-Paul

> And yes if you use git cherry-pick it'll do a 3 way merge, and
> occasionally it's very tricky to resolve that properly. Especially =

> when
> you're not used to it.
> =

> What I tend to do to double check cerry-picks is git show both =

> commits,
> and compare the entire diff line-by-line to make sure I didn't =

> misplace
> anything.
> =

> Another trick is to use the raw patch instead of cherry-pick, since =

> that
> won't do a 3 way merge where you might get confused with other =

> context and
> fun stuff like that.
> =

> Cheers, Daniel
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 ----------------
>>   1 file changed, 16 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 1be1235bd546..a3d1617d7c67 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -440,20 +440,6 @@ void ingenic_drm_plane_config(struct device =

>> *dev,
>>   	}
>>   }
>> =

>>  -static void ingenic_drm_update_palette(struct ingenic_drm *priv,
>>  -				       const struct drm_color_lut *lut)
>>  -{
>>  -	unsigned int i;
>>  -
>>  -	for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>>  -		u16 color =3D drm_color_lut_extract(lut[i].red, 5) << 11
>>  -			| drm_color_lut_extract(lut[i].green, 6) << 5
>>  -			| drm_color_lut_extract(lut[i].blue, 5);
>>  -
>>  -		priv->dma_hwdescs->palette[i] =3D color;
>>  -	}
>>  -}
>>  -
>>   static void ingenic_drm_plane_atomic_update(struct drm_plane =

>> *plane,
>>   					    struct drm_plane_state *oldstate)
>>   {
>>  @@ -464,8 +450,6 @@ static void =

>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   	dma_addr_t addr;
>> =

>>   	if (state && state->fb) {
>>  -		crtc_state =3D state->crtc->state;
>>  -
>>   		addr =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>>   		width =3D state->src_w >> 16;
>>   		height =3D state->src_h >> 16;
>>  --
>>  2.28.0
>> =

> =

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
