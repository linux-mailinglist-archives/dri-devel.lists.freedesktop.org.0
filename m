Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53663E3D07
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 00:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0089A91;
	Sun,  8 Aug 2021 22:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACBD89A91
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 22:22:48 +0000 (UTC)
Date: Mon, 09 Aug 2021 00:22:38 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/8] drm/ingenic: Simplify code by using hwdescs array
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie
 <paul@boddie.org.uk>, list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <QTKJXQ.E7AFQWHL9BRJ3@crapouillou.net>
In-Reply-To: <d6db6de0-dcc8-b0f0-439d-7a5f69ac4c62@suse.de>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-3-paul@crapouillou.net>
 <d6db6de0-dcc8-b0f0-439d-7a5f69ac4c62@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le dim., ao=FBt 8 2021 at 20:42:53 +0200, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Hi
>=20
> Am 08.08.21 um 15:45 schrieb Paul Cercueil:
>> Instead of having one 'hwdesc' variable for the plane #0 and one for=20
>> the
>> plane #1, use a 'hwdesc[2]' array, where the DMA hardware descriptors
>> are indexed by the plane's number.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 38=20
>> ++++++++++++-----------
>>   1 file changed, 20 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index e42eb43d8020..bc71ba44ccf4 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -49,8 +49,7 @@ struct ingenic_dma_hwdesc {
>>   } __aligned(16);
>>   =7F  struct ingenic_dma_hwdescs {
>> -	struct ingenic_dma_hwdesc hwdesc_f0;
>> -	struct ingenic_dma_hwdesc hwdesc_f1;
>> +	struct ingenic_dma_hwdesc hwdesc[2];
>>   	struct ingenic_dma_hwdesc hwdesc_pal;
>>   	u16 palette[256] __aligned(16);
>>   };
>> @@ -141,6 +140,13 @@ static inline struct ingenic_drm=20
>> *drm_nb_get_priv(struct notifier_block *nb)
>>   	return container_of(nb, struct ingenic_drm, clock_nb);
>>   }
>>   =7F+static inline dma_addr_t dma_hwdesc_addr(const struct=20
>> ingenic_drm *priv, bool use_f1)
>=20
> Using the plane index instead of a boolean would be more aligned to=20
> the way this function is being used.

Alright, I can do that.

>> +{
>> +	u32 offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);
>=20
> use_f1 is a function parameter. Is offsetof guaranteed to be=20
> evaluated at runtime?

The offsetof() macro could be defined like this:
#define offsetof(type, elm) ((size_t) &((type *) 0)->elm)

So I don't see a reason why this couldn't be evaluated at runtime, yes.=20
It's just that the value of "offset" is not known at compilation time=20
(unless the compiler does some constant propagation). In practice=20
though, this code works fine.

>> +
>> +	return priv->dma_hwdescs_phys + offset;
>> +}
>> +
>>   static int ingenic_drm_update_pixclk(struct notifier_block *nb,
>>   				     unsigned long action,
>>   				     void *data)
>> @@ -562,6 +568,7 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   	struct ingenic_dma_hwdesc *hwdesc;
>>   	unsigned int width, height, cpp, offset;
>>   	dma_addr_t addr;
>> +	bool use_f1;
>>   	u32 fourcc;
>>   =7F  	if (newstate && newstate->fb) {
>> @@ -569,16 +576,14 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
>>   =7F  		crtc_state =3D newstate->crtc->state;
>> +		use_f1 =3D priv->soc_info->has_osd && plane !=3D &priv->f0;
>>   =7F  		addr =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>>   		width =3D newstate->src_w >> 16;
>>   		height =3D newstate->src_h >> 16;
>>   		cpp =3D newstate->fb->format->cpp[0];
>>   =7F-		if (!priv->soc_info->has_osd || plane =3D=3D &priv->f0)
>> -			hwdesc =3D &priv->dma_hwdescs->hwdesc_f0;
>> -		else
>> -			hwdesc =3D &priv->dma_hwdescs->hwdesc_f1;
>> +		hwdesc =3D &priv->dma_hwdescs->hwdesc[use_f1];
>=20
> Maybe add a helper that looks up the hwdesc field for a given plane?

Sure.

>>   =7F  		hwdesc->addr =3D addr;
>>   		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
>> @@ -591,9 +596,9 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   			if (fourcc =3D=3D DRM_FORMAT_C8)
>>   				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
>>   			else
>> -				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
>> +				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
>>   =7F-			priv->dma_hwdescs->hwdesc_f0.next =3D priv->dma_hwdescs_phys +=20
>> offset;
>> +			priv->dma_hwdescs->hwdesc[0].next =3D priv->dma_hwdescs_phys +=20
>> offset;
>=20
> Maybe priv->dma_hwdescs_phys + offset could be computed in a more=20
> flexible helper than dma_hwdesc_addr().
>=20
>>   =7F  			crtc_state->color_mgmt_changed =3D fourcc =3D=3D DRM_FORMAT_C8=
;
>>   		}
>> @@ -964,20 +969,17 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>   =7F  =7F  	/* Configure DMA hwdesc for foreground0 plane */
>> -	dma_hwdesc_phys_f0 =3D priv->dma_hwdescs_phys
>> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
>> -	priv->dma_hwdescs->hwdesc_f0.next =3D dma_hwdesc_phys_f0;
>> -	priv->dma_hwdescs->hwdesc_f0.id =3D 0xf0;
>> +	dma_hwdesc_phys_f0 =3D dma_hwdesc_addr(priv, 0);
>> +	priv->dma_hwdescs->hwdesc[0].next =3D dma_hwdesc_phys_f0;
>> +	priv->dma_hwdescs->hwdesc[0].id =3D 0xf0;
>>   =7F  	/* Configure DMA hwdesc for foreground1 plane */
>> -	dma_hwdesc_phys_f1 =3D priv->dma_hwdescs_phys
>> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f1);
>> -	priv->dma_hwdescs->hwdesc_f1.next =3D dma_hwdesc_phys_f1;
>> -	priv->dma_hwdescs->hwdesc_f1.id =3D 0xf1;
>> +	dma_hwdesc_phys_f1 =3D dma_hwdesc_addr(priv, 1);
>> +	priv->dma_hwdescs->hwdesc[1].next =3D dma_hwdesc_phys_f1;
>> +	priv->dma_hwdescs->hwdesc[1].id =3D 0xf1;
>>   =7F  	/* Configure DMA hwdesc for palette */
>> -	priv->dma_hwdescs->hwdesc_pal.next =3D priv->dma_hwdescs_phys
>> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
>> +	priv->dma_hwdescs->hwdesc_pal.next =3D dma_hwdesc_phys_f0;
>>   	priv->dma_hwdescs->hwdesc_pal.id =3D 0xc0;
>>   	priv->dma_hwdescs->hwdesc_pal.addr =3D priv->dma_hwdescs_phys
>>   		+ offsetof(struct ingenic_dma_hwdescs, palette);
>>=20
>=20
> Could the setup in these three blocks be moved into a common helper?

Yes.

Thanks for the review.

Cheers,
-Paul


