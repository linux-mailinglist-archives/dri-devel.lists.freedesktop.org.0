Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D552D742F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28C6E062;
	Fri, 11 Dec 2020 10:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D7B6E062
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:49:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 069D1AE69;
 Fri, 11 Dec 2020 10:49:50 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-3-tzimmermann@suse.de>
 <20201211101833.GQ401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
Message-ID: <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
Date: Fri, 11 Dec 2020 11:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211101833.GQ401619@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0897835229=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0897835229==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8IRVCr5kJ5TznfVlHgNJ7v0sqoDGKYhE4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8IRVCr5kJ5TznfVlHgNJ7v0sqoDGKYhE4
Content-Type: multipart/mixed; boundary="ZExh8ASHFObuNBuWXxPPXY6qXenrk3voX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: christian.koenig@amd.com, airlied@linux.ie, sumit.semwal@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org
Message-ID: <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
Subject: Re: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-3-tzimmermann@suse.de>
 <20201211101833.GQ401619@phenom.ffwll.local>
In-Reply-To: <20201211101833.GQ401619@phenom.ffwll.local>

--ZExh8ASHFObuNBuWXxPPXY6qXenrk3voX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 11.12.20 um 11:18 schrieb Daniel Vetter:
> On Wed, Dec 09, 2020 at 03:25:21PM +0100, Thomas Zimmermann wrote:
>> The HW cursor's BO used to be mapped permanently into the kernel's
>> address space. GEM's vmap operation will be protected by locks, and
>> we don't want to lock the BO's for an indefinate period of time.
>>
>> Change the cursor code to map the HW BOs only during updates. The
>> vmap operation in VRAM helpers is cheap, as a once estabished mapping
>> is being reused until the BO actually moves. As the HW cursor BOs are
>> permanently pinned, they never move at all.
>>
>> v2:
>> 	* fix typos in commit description
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Now there's a pretty big issue here though: We can't take dma_resv_lock=
 in
> commit_tail, because of possible deadlocks on at least gpus that do rea=
l
> async rendering because of the dma_fences. Unfortunately my annotations=

> patches got stuck a bit, I need to refresh them.
>=20
> Rules are you can pin and unpin stuff in prepare/cleanup_plane, and als=
o
> take dma_resv_lock there, but not in commit_tail in-between. So I think=

> our vmap_local needs to loose the unconditional assert_locked and requi=
re
> either that or a pin count.

I guess my commit description is misleading when it speaks of updates.=20
ast_cursor_blit() is actually called from the cursor plane's prepare_fb=20
function. [1] The vmap code in ast_cursor_show() could be moved into=20
blit() as well, I think.

I guess the clean solution is to integrate the cursor code with the=20
modesetting code in ast_mode. From there, locks and mappings can be=20
established in prepare_fb and the HW state can be updated in atomic_commi=
t.

Best regards
Thomas

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/ast/ast_mode.c#n646

> -Daniel
>=20
>> ---
>>   drivers/gpu/drm/ast/ast_cursor.c | 51 ++++++++++++++++++------------=
--
>>   drivers/gpu/drm/ast/ast_drv.h    |  2 --
>>   2 files changed, 28 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/as=
t_cursor.c
>> index 68bf3d33f1ed..fac1ee79c372 100644
>> --- a/drivers/gpu/drm/ast/ast_cursor.c
>> +++ b/drivers/gpu/drm/ast/ast_cursor.c
>> @@ -39,7 +39,6 @@ static void ast_cursor_fini(struct ast_private *ast)=

>>  =20
>>   	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>>   		gbo =3D ast->cursor.gbo[i];
>> -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
>>   		drm_gem_vram_unpin(gbo);
>>   		drm_gem_vram_put(gbo);
>>   	}
>> @@ -53,14 +52,13 @@ static void ast_cursor_release(struct drm_device *=
dev, void *ptr)
>>   }
>>  =20
>>   /*
>> - * Allocate cursor BOs and pins them at the end of VRAM.
>> + * Allocate cursor BOs and pin them at the end of VRAM.
>>    */
>>   int ast_cursor_init(struct ast_private *ast)
>>   {
>>   	struct drm_device *dev =3D &ast->base;
>>   	size_t size, i;
>>   	struct drm_gem_vram_object *gbo;
>> -	struct dma_buf_map map;
>>   	int ret;
>>  =20
>>   	size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);=

>> @@ -77,15 +75,7 @@ int ast_cursor_init(struct ast_private *ast)
>>   			drm_gem_vram_put(gbo);
>>   			goto err_drm_gem_vram_put;
>>   		}
>> -		ret =3D drm_gem_vram_vmap(gbo, &map);
>> -		if (ret) {
>> -			drm_gem_vram_unpin(gbo);
>> -			drm_gem_vram_put(gbo);
>> -			goto err_drm_gem_vram_put;
>> -		}
>> -
>>   		ast->cursor.gbo[i] =3D gbo;
>> -		ast->cursor.map[i] =3D map;
>>   	}
>>  =20
>>   	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
>> @@ -94,7 +84,6 @@ int ast_cursor_init(struct ast_private *ast)
>>   	while (i) {
>>   		--i;
>>   		gbo =3D ast->cursor.gbo[i];
>> -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
>>   		drm_gem_vram_unpin(gbo);
>>   		drm_gem_vram_put(gbo);
>>   	}
>> @@ -168,31 +157,38 @@ static void update_cursor_image(u8 __iomem *dst,=
 const u8 *src, int width, int h
>>   int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer =
*fb)
>>   {
>>   	struct drm_device *dev =3D &ast->base;
>> -	struct drm_gem_vram_object *gbo;
>> -	struct dma_buf_map map;
>> -	int ret;
>> -	void *src;
>> +	struct drm_gem_vram_object *dst_gbo =3D ast->cursor.gbo[ast->cursor.=
next_index];
>> +	struct drm_gem_vram_object *src_gbo =3D drm_gem_vram_of_gem(fb->obj[=
0]);
>> +	struct dma_buf_map src_map, dst_map;
>>   	void __iomem *dst;
>> +	void *src;
>> +	int ret;
>>  =20
>>   	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
>>   	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
>>   		return -EINVAL;
>>  =20
>> -	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>> -
>> -	ret =3D drm_gem_vram_vmap(gbo, &map);
>> +	ret =3D drm_gem_vram_vmap(src_gbo, &src_map);
>>   	if (ret)
>>   		return ret;
>> -	src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>> +	src =3D src_map.vaddr; /* TODO: Use mapping abstraction properly */
>>  =20
>> -	dst =3D ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
>> +	ret =3D drm_gem_vram_vmap(dst_gbo, &dst_map);
>> +	if (ret)
>> +		goto err_drm_gem_vram_vunmap;
>> +	dst =3D dst_map.vaddr_iomem; /* TODO: Use mapping abstraction proper=
ly */
>>  =20
>>   	/* do data transfer to cursor BO */
>>   	update_cursor_image(dst, src, fb->width, fb->height);
>>  =20
>> -	drm_gem_vram_vunmap(gbo, &map);
>> +	drm_gem_vram_vunmap(dst_gbo, &dst_map);
>> +	drm_gem_vram_vunmap(src_gbo, &src_map);
>>  =20
>>   	return 0;
>> +
>> +err_drm_gem_vram_vunmap:
>> +	drm_gem_vram_vunmap(src_gbo, &src_map);
>> +	return ret;
>>   }
>>  =20
>>   static void ast_cursor_set_base(struct ast_private *ast, u64 address=
)
>> @@ -243,17 +239,26 @@ static void ast_cursor_set_location(struct ast_p=
rivate *ast, u16 x, u16 y,
>>   void ast_cursor_show(struct ast_private *ast, int x, int y,
>>   		     unsigned int offset_x, unsigned int offset_y)
>>   {
>> +	struct drm_device *dev =3D &ast->base;
>> +	struct drm_gem_vram_object *gbo =3D ast->cursor.gbo[ast->cursor.next=
_index];
>> +	struct dma_buf_map map;
>>   	u8 x_offset, y_offset;
>>   	u8 __iomem *dst;
>>   	u8 __iomem *sig;
>>   	u8 jreg;
>> +	int ret;
>>  =20
>> -	dst =3D ast->cursor.map[ast->cursor.next_index].vaddr;
>> +	ret =3D drm_gem_vram_vmap(gbo, &map);
>> +	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=3D%d\n"=
, ret))
>> +		return;
>> +	dst =3D map.vaddr_iomem; /* TODO: Use mapping abstraction properly *=
/
>>  =20
>>   	sig =3D dst + AST_HWC_SIZE;
>>   	writel(x, sig + AST_HWC_SIGNATURE_X);
>>   	writel(y, sig + AST_HWC_SIGNATURE_Y);
>>  =20
>> +	drm_gem_vram_vunmap(gbo, &map);
>> +
>>   	if (x < 0) {
>>   		x_offset =3D (-x) + offset_x;
>>   		x =3D 0;
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
>> index ccaff81924ee..f871fc36c2f7 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -28,7 +28,6 @@
>>   #ifndef __AST_DRV_H__
>>   #define __AST_DRV_H__
>>  =20
>> -#include <linux/dma-buf-map.h>
>>   #include <linux/i2c.h>
>>   #include <linux/i2c-algo-bit.h>
>>   #include <linux/io.h>
>> @@ -133,7 +132,6 @@ struct ast_private {
>>  =20
>>   	struct {
>>   		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
>> -		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
>>   		unsigned int next_index;
>>   	} cursor;
>>  =20
>> --=20
>> 2.29.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZExh8ASHFObuNBuWXxPPXY6qXenrk3voX--

--8IRVCr5kJ5TznfVlHgNJ7v0sqoDGKYhE4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/TTswFAwAAAAAACgkQlh/E3EQov+DE
4w//RbTGpz6tZT4mUPX1G3VCfynou3sWGKEPrMmG32Nze/nbLBg1/LZW9sAkt3lqE1BBVIZDmzOU
uVTBtT2zWZs8gI0jAWNJX5gzp/P2d6ONIDYUMJS/Ck66mSsbHKyBv3nwkdSBovbDesYSI7SUKR63
nT87yVGujezRed9UrTxrqjHjOXS76NbBaq3cEJPXO8VuaEnb/dokAwmiXlKbYuZ6qW/WaXbWaei0
nrW3aY2QAmR9igAtDetouvp1fo4MbMibN4h621SdDY4STaXOJuDHxTv7YJ+fJsxqoOBfZLoUpWdC
NFqW9+xVSJsxpUyHgtrb06JD50eyyzUaeIomrv51rbYDlHPW6BkZphtaVSml1niMvf/46mFswWQc
KIshiqvh6BZrfOk5NF7zboSnU2t4g13ERpj2o0CCpy2PiCJdKKAJeH3KfgcbpCcuviHozQRcd/wy
vEvwc5q0hNBVH+r56V+4UE3aet0anolilxTvoAod//YiIwcE7m2jzXPaOzeNwXHlpir+AHJXQm3N
gMySWa1xmhVRjzQmEjdVTgDGArtroHuNPxf/e+shBPBjHDjy9Ssf/xF7DnU8wpVkvA5rVMpaDYsi
F4aeevWBupGr4MSiM2pOu+j6QC2Ctrkf+8QnGXClkcv116/D+chTuRBCr96m8eY5LAPIWR7uw8SH
sMc=
=BEFW
-----END PGP SIGNATURE-----

--8IRVCr5kJ5TznfVlHgNJ7v0sqoDGKYhE4--

--===============0897835229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0897835229==--
