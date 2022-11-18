Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066D62F972
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EF910E0E6;
	Fri, 18 Nov 2022 15:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DA910E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:38:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso7793883wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 07:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfWcGzupuPCfI0d9QCtthkzC7LWdIhJQjIcNMy6mgbk=;
 b=qfWkkKicKCcJpuZyFOQaZfqYgFTv2ShQUBr/2Xh4Km8qPrN8NjEsxvNcrhBTvoGX4z
 RyRBMeEyHepf3JwZS+6a97Xmlpz7h0ejQ4KiecpqL/7z8z09eshU9JWKlhRcXacp68oQ
 wRo/rzxo04TwG7DdLZrbsSm48+w1W+Qq3qWi0D4Gtagw4sliob8hbNS3vt8h8Bj4Am3K
 /n8ho7zX4fQj8VokjwxFZzXpzqHYcH5MHAKLxqqettqfBw/3fsUqJXaU6xLyrNSLG8WP
 kPpyuraYU7J8ROX+1Nceym15i4/Xyy+uWFdyGt9opIAndfVnNB4aEbsYOcOf3WGju4Gn
 lE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfWcGzupuPCfI0d9QCtthkzC7LWdIhJQjIcNMy6mgbk=;
 b=BdaOg4nK8WiiELQ1XzaHoAr9v2gaPhurIE6MWktaBjGKkLA+w6yUeQgCpq11yLBGnV
 UO/U4Kaxb+cKoSM8ULabg26O0xs8g3xNDAn8FbITP+vEGrcZSM1M1gpJEosR6wsiSyFx
 QiVrWGOqpGEveXmshT//1/7tNHIg4NPEG0x4GZmyOClnfZqSBHjVvNMzjFz+yQq0QT/1
 /oKtN69NjV88eU9TtWiBwp6eKyEZCXQla0fIEOkXDw2zPrw0UBUKuSuECGa0SsO2O1fs
 Kr/iExalRO/EozaqiyqQACIYhjpok4Da4mtw0CH35OsEbFhLVLdGNVKZAN3pZwJC/UrE
 429g==
X-Gm-Message-State: ANoB5pmXnnweoCKswnMJjSjb6s8Dot1iyVOzAC1zNFb6vGlXnVqeb4t2
 GcG1gYxH/4zVCQR17vohUds=
X-Google-Smtp-Source: AA0mqf7BFOcCa81hDIMM+Nv+ugMUGcNH4ANSTYJ4RklrfzwrmLDd3PsJLWiQrMOVDu5tAFFpVTsUBw==
X-Received: by 2002:a05:600c:a4a:b0:3cf:e138:cd80 with SMTP id
 c10-20020a05600c0a4a00b003cfe138cd80mr8970643wmq.78.1668785904307; 
 Fri, 18 Nov 2022 07:38:24 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b0023677081f3asm3811885wru.42.2022.11.18.07.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 07:38:23 -0800 (PST)
Date: Fri, 18 Nov 2022 16:38:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Message-ID: <Y3em7dwyJgQI1vZw@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
 <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rD4xpyu/Zx8vn3+R"
Content-Disposition: inline
In-Reply-To: <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de>
User-Agent: Mutt/2.2.8 (2022-11-05)
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rD4xpyu/Zx8vn3+R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 03:21:14PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Simple framebuffers can be set up in system memory, which cannot be
> > requested and/or I/O remapped using the I/O resource helpers. Add a
> > separate code path that obtains system memory framebuffers from the
> > reserved memory region referenced in the memory-region property.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v3:
> > - simplify memory code and move back to simpledrm_device_create()
> > - extract screen_base iosys_map fix into separate patch
> >=20
> > Changes in v2:
> > - make screen base a struct iosys_map to avoid sparse warnings
> >=20
> >   drivers/gpu/drm/tiny/simpledrm.c | 99 ++++++++++++++++++++++++--------
> >   1 file changed, 75 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index 3673a42e4bf4..7f39bc58da52 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -3,6 +3,7 @@
> >   #include <linux/clk.h>
> >   #include <linux/of_clk.h>
> >   #include <linux/minmax.h>
> > +#include <linux/of_address.h>
> >   #include <linux/platform_data/simplefb.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/regulator/consumer.h>
> > @@ -184,6 +185,31 @@ simplefb_get_format_of(struct drm_device *dev, str=
uct device_node *of_node)
> >   	return simplefb_get_validated_format(dev, format);
> >   }
> > +static struct resource *
> > +simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_=
node)
> > +{
> > +	struct device_node *np;
> > +	struct resource *res;
> > +	int err;
> > +
> > +	np =3D of_parse_phandle(of_node, "memory-region", 0);
> > +	if (!np)
> > +		return NULL;
> > +
> > +	res =3D devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
> > +	if (!res)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	err =3D of_address_to_resource(np, 0, res);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	if (of_get_property(of_node, "reg", NULL))
> > +		drm_warn(dev, "preferring \"memory-region\" over \"reg\" property\n"=
);
>=20
> The reg property is converted to a device resource when we create the dev=
ice
> at [1].
>=20
> I have another question, which I was discussing with Javier recently. Is =
it
> possible to handle memory-region there automatically? If, for exmaple, it
> would create a resource with IORESOURCE_CACHEABLE, simpledrm would handle=
 it
> as memory region. Without the CACHEABLE flag, it would be a regular resou=
rce
> as before.

memory-region properties are not typically converted into a standard
resource automatically. One reason may be that they can have additional
properties associated with them and so something like a CACHEABLE type
may not apply.

It's also standard to convert "reg" properties into struct resource and
that's what many drivers will expect. I don't know if all drivers will
gracefully handle being passed a struct resource that was created in
this way from a memory-region property. If at all I think this would
need to be special-cased for simple-framebuffer, in which case I'm not
convinced that putting the special case into the core OF code is any
better than putting it into the simpledrm driver.

Also, even if we did so, what would it really change? We may be able to
avoid the explicit DT lookup, but the bulk of the memory-region code is
actually mapping it, etc. That part we won't be able to automatically
handle, I think.

Ultimately this is up to Rob, not sure if he'll want to extend the
simple-framebuffer node creation code any further.

Thierry

>=20
> Best regards
> Thomas
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.0.9/source/drivers/of/platform.c#L586
>=20
> > +
> > +	return res;
> > +}
> > +
> >   /*
> >    * Simple Framebuffer device
> >    */
> > @@ -623,8 +649,7 @@ static struct simpledrm_device *simpledrm_device_cr=
eate(struct drm_driver *drv,
> >   	struct drm_device *dev;
> >   	int width, height, stride;
> >   	const struct drm_format_info *format;
> > -	struct resource *res, *mem;
> > -	void __iomem *screen_base;
> > +	struct resource *res, *mem =3D NULL;
> >   	struct drm_plane *primary_plane;
> >   	struct drm_crtc *crtc;
> >   	struct drm_encoder *encoder;
> > @@ -676,6 +701,9 @@ static struct simpledrm_device *simpledrm_device_cr=
eate(struct drm_driver *drv,
> >   		format =3D simplefb_get_format_of(dev, of_node);
> >   		if (IS_ERR(format))
> >   			return ERR_CAST(format);
> > +		mem =3D simplefb_get_memory_of(dev, of_node);
> > +		if (IS_ERR(mem))
> > +			return ERR_CAST(mem);
> >   	} else {
> >   		drm_err(dev, "no simplefb configuration found\n");
> >   		return ERR_PTR(-ENODEV);
> > @@ -698,32 +726,55 @@ static struct simpledrm_device *simpledrm_device_=
create(struct drm_driver *drv,
> >   	 * Memory management
> >   	 */
> > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res)
> > -		return ERR_PTR(-EINVAL);
> > +	if (mem) {
> > +		void *screen_base;
> > -	ret =3D devm_aperture_acquire_from_firmware(dev, res->start, resource=
_size(res));
> > -	if (ret) {
> > -		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, =
ret);
> > -		return ERR_PTR(ret);
> > -	}
> > +		ret =3D devm_aperture_acquire_from_firmware(dev, mem->start, resourc=
e_size(mem));
> > +		if (ret) {
> > +			drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
> > +			return ERR_PTR(ret);
> > +		}
> > -	mem =3D devm_request_mem_region(&pdev->dev, res->start, resource_size=
(res), drv->name);
> > -	if (!mem) {
> > -		/*
> > -		 * We cannot make this fatal. Sometimes this comes from magic
> > -		 * spaces our resource handlers simply don't know about. Use
> > -		 * the I/O-memory resource as-is and try to map that instead.
> > -		 */
> > -		drm_warn(dev, "could not acquire memory region %pr\n", res);
> > -		mem =3D res;
> > -	}
> > +		drm_info(dev, "using system memory framebuffer at %pr\n", mem);
> > -	screen_base =3D devm_ioremap_wc(&pdev->dev, mem->start, resource_size=
(mem));
> > -	if (!screen_base)
> > -		return ERR_PTR(-ENOMEM);
> > +		screen_base =3D devm_memremap(dev->dev, mem->start, resource_size(me=
m), MEMREMAP_WB);
> > +		if (!screen_base)
> > +			return ERR_PTR(-ENOMEM);
> > +
> > +		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
> > +	} else {
> > +		void __iomem *screen_base;
> > +
> > +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +		if (!res)
> > +			return ERR_PTR(-EINVAL);
> > -	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
> > +		ret =3D devm_aperture_acquire_from_firmware(dev, res->start, resourc=
e_size(res));
> > +		if (ret) {
> > +			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
> > +			return ERR_PTR(ret);
> > +		}
> > +
> > +		drm_info(dev, "using I/O memory framebuffer at %pr\n", res);
> > +
> > +		mem =3D devm_request_mem_region(&pdev->dev, res->start, resource_siz=
e(res),
> > +					      drv->name);
> > +		if (!mem) {
> > +			/*
> > +			 * We cannot make this fatal. Sometimes this comes from magic
> > +			 * spaces our resource handlers simply don't know about. Use
> > +			 * the I/O-memory resource as-is and try to map that instead.
> > +			 */
> > +			drm_warn(dev, "could not acquire memory region %pr\n", res);
> > +			mem =3D res;
> > +		}
> > +
> > +		screen_base =3D devm_ioremap_wc(&pdev->dev, mem->start, resource_siz=
e(mem));
> > +		if (!screen_base)
> > +			return ERR_PTR(-ENOMEM);
> > +
> > +		iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
> > +	}
> >   	/*
> >   	 * Modesetting
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev




--rD4xpyu/Zx8vn3+R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3puoACgkQ3SOs138+
s6G8fQ/8CgzZ0V42DX96UOjOAFLzd2OgVmN8a3FwEYd3v6YRink/LSZBeV+Hpyg2
4X7fAqpIkHO4yEAlhCfrZZr5TuIUlVA6HQRBXm2TYYe2WmldKGjU1gKX04jPQGts
/DI2oI+J8fq44NX2f2aOR3nawYy51lmLGL7m9rZcY2ifskRwnJFQrQZWL50h7qt0
ji9CWhElxqFMV6fJyHy/14bfyv8u3NsjpT76JabbqnrWEX00S67THux+FPXmIeuc
N874WtgdqC6HkZtYgJGlxz0yxf0dDO3w1bIyA7rv+4JyRj98fsKQHK6iDZMEoFBh
vhhy524nv2zK49l+bQKjmWZ/bUazhm9OA6Bu0uVqgiSFwzgOC1oxb9xcs9SNLc+4
0MEyb+orjb2+U+SBVJxafWJKdBp8jR4hiqgRyb7XGfNiG185XDDKMtnz6vrszIPh
GByYGuuqyZmlV5VivhyPZP/EBGK+XFbk82Cy69lKSr/Y6M/ntzWt/VlHUm4me3Pl
xveQdHqGYMgnMmhoGY2NiDxCQYb+o5Sh2rNhwqcXnOoKSuL2qKwZOw2lni0fj8sS
0zauRTMkME82OENZovQb9h4i2ShtaIPFrPSJ8oqm5RbIbhrkoRoc+KdkBR8cjoTg
6jRFQYH2cFfu8dXyohrT0QpUlIUD4Btg58jFTjyDmLYondSC9wg=
=+bd7
-----END PGP SIGNATURE-----

--rD4xpyu/Zx8vn3+R--
