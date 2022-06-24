Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07D559CAC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 16:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8876510E055;
	Fri, 24 Jun 2022 14:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698010E055
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:53:27 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F61640005;
 Fri, 24 Jun 2022 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656082405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pAemQfjjYRBuV4ZECqviQkxC7RDhzNksVvHX3//IOIo=;
 b=byJwxursTDwGnbVb2yaSOn/bl03S717FoHbKPGhnJXe/MD8lrJ7oP2xq2qaFz8KHS//i/V
 kRUXn4D+YLzK7VMR8ipLjDiW9sMaskefcucLgjweyxoxXLbWevj+B8i0KDXo6HhgVVAhKv
 u3ugxsE1BC14e9A7OdMIlrktLs7V2ABC5fzjSYUCZXIL1CfyjMF8aJdysPE4d66yKvJkpw
 vkwUJ4Tet23YXTU3PLOuAf0B9pBk8QmG6I/dXwC58sVGzFvDxSJ1XxTO/YT8BAsNDBAA8Q
 m8fGM8DOurRkA1lLbaSIybBP6mluxhFE2Bs121itZMY0tWLeK6He8N48JTVdrg==
Date: Fri, 24 Jun 2022 16:53:25 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm: Add support for the LogiCVC display controller
Message-ID: <YrXP5Q16k/X0EVEI@aptenodytes>
References: <Yqh6ErANSTEJpfvl@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LYGhbjtQFHG68ekF"
Content-Disposition: inline
In-Reply-To: <Yqh6ErANSTEJpfvl@kili>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LYGhbjtQFHG68ekF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dan,

On Tue 14 Jun 22, 15:07, Dan Carpenter wrote:
> Hello Paul Kocialkowski,
>=20
> The patch efeeaefe9be5: "drm: Add support for the LogiCVC display
> controller" from May 20, 2022, leads to the following Smatch static
> checker warning:
>=20
> 	drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_se=
tup()
> 	warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) =3D> (0-=
u16max > u16max)'
>=20
> drivers/gpu/drm/logicvc/logicvc_layer.c
>     258 int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
>     259                                     struct logicvc_layer *layer,
>     260                                     struct drm_plane_state *state,
>     261                                     struct logicvc_layer_buffer_s=
etup *setup)
>     262 {
>     263         struct drm_device *drm_dev =3D &logicvc->drm_dev;
>     264         struct drm_framebuffer *fb =3D state->fb;
>     265         /* All the supported formats have a single data plane. */
>     266         u32 layer_bytespp =3D fb->format->cpp[0];
>     267         u32 layer_stride =3D layer_bytespp * logicvc->config.row_=
stride;
>     268         u32 base_offset =3D layer->config.base_offset * layer_str=
ide;
>     269         u32 buffer_offset =3D layer->config.buffer_offset * layer=
_stride;
>     270         u8 buffer_sel =3D 0;
>     271         u16 voffset =3D 0;
>     272         u16 hoffset =3D 0;
>     273         phys_addr_t fb_addr;
>     274         u32 fb_offset;
>     275         u32 gap;
>     276=20
>     277         if (!logicvc->reserved_mem_base) {
>     278                 drm_err(drm_dev, "No reserved memory base was reg=
istered!\n");
>     279                 return -ENOMEM;
>     280         }
>     281=20
>     282         fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
>     283         if (fb_addr < logicvc->reserved_mem_base) {
>     284                 drm_err(drm_dev,
>     285                         "Framebuffer memory below reserved memory=
 base!\n");
>     286                 return -EINVAL;
>     287         }
>     288=20
>     289         fb_offset =3D (u32) (fb_addr - logicvc->reserved_mem_base=
);
>     290=20
>     291         if (fb_offset < base_offset) {
>     292                 drm_err(drm_dev,
>     293                         "Framebuffer offset below layer base offs=
et!\n");
>     294                 return -EINVAL;
>     295         }
>     296=20
>     297         gap =3D fb_offset - base_offset;
>     298=20
>     299         /* Use the possible video buffers selection. */
>     300         if (gap && buffer_offset) {
>     301                 buffer_sel =3D gap / buffer_offset;
>     302                 if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
>     303                         buffer_sel =3D LOGICVC_BUFFER_SEL_MAX;
>     304=20
>     305                 gap -=3D buffer_sel * buffer_offset;
>     306         }
>     307=20
>     308         /* Use the vertical offset. */
>     309         if (gap && layer_stride && logicvc->config.layers_configu=
rable) {
>     310                 voffset =3D gap / layer_stride;
>     311                 if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
>     312                         voffset =3D LOGICVC_LAYER_VOFFSET_MAX;
>     313=20
>     314                 gap -=3D voffset * layer_stride;
>     315         }
>     316=20
>     317         /* Use the horizontal offset. */
>     318         if (gap && layer_bytespp && logicvc->config.layers_config=
urable) {
>     319                 hoffset =3D gap / layer_bytespp;
>=20
> Can "gap / layer_bytespp" ever be more than USHRT_MAX?  Because if so
> that won't fit into "hoffset"

Well there is nothing that really restricts the size of the gap, so yes this
could happen. At this stage the gap should have been reduced already but we
never really know.

Would it make sense to add a check that gap / layer_bytespp <=3D USHRT_MAX
in that if statement?

Thanks for the catch.

Paul

> --> 320                 if (hoffset > LOGICVC_DIMENSIONS_MAX)
>     321                         hoffset =3D LOGICVC_DIMENSIONS_MAX;
>     322=20
>     323                 gap -=3D hoffset * layer_bytespp;
>     324         }
>     325=20
>     326         if (gap) {
>     327                 drm_err(drm_dev,
>     328                         "Unable to find layer %d buffer setup for=
 0x%x byte gap\n",
>     329                         layer->index, fb_offset - base_offset);
>     330                 return -EINVAL;
>     331         }
>     332=20
>     333         drm_dbg_kms(drm_dev, "Found layer %d buffer setup for 0x%=
x byte gap:\n",
>     334                     layer->index, fb_offset - base_offset);
>     335=20
>     336         drm_dbg_kms(drm_dev, "- buffer_sel =3D 0x%x chunks of 0x%=
x bytes\n",
>     337                     buffer_sel, buffer_offset);
>     338         drm_dbg_kms(drm_dev, "- voffset =3D 0x%x chunks of 0x%x b=
ytes\n", voffset,
>     339                     layer_stride);
>     340         drm_dbg_kms(drm_dev, "- hoffset =3D 0x%x chunks of 0x%x b=
ytes\n", hoffset,
>     341                     layer_bytespp);
>     342=20
>     343         if (setup) {
>     344                 setup->buffer_sel =3D buffer_sel;
>     345                 setup->voffset =3D voffset;
>     346                 setup->hoffset =3D hoffset;
>     347         }
>     348=20
>     349         return 0;
>     350 }
>=20
> regards,
> dan carpenter

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--LYGhbjtQFHG68ekF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1z+UACgkQ3cLmz3+f
v9EBtwf/Yd2zxaRR05zhNJJfhKNlHA2DTCgTf5Pjv+1eGiUYIMzMaNYCKVGN6ArQ
l94ubI0GWTVhB+hXT4FHrR+MxTLJb3Ho3e01zVoOQihS/xTQ5tEhtVIrAqQ2xidT
mKNQ54FyJ+C4uE0XdIT2f5NA42MZGukaDNX7DODzs9i7DIsElrjqoOS8nNzQCY5l
71mxM8XWLHDutncOtmK3/0GOdhdU6Uuw+ADhVmcuap10tdnwwju2oauJ+ojfcVAf
zojaIcnxILulXZA55EacQMylGqXgqzMNrkESpE11mQnBRdY4bz7yYLSW4+5aP6Rm
3yPniSj46q/bIeoPI2d2LycMTzDRkA==
=Vaat
-----END PGP SIGNATURE-----

--LYGhbjtQFHG68ekF--
