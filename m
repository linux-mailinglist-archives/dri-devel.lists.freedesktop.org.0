Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A2232DC9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 10:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF036E897;
	Thu, 30 Jul 2020 08:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACAA6E897
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 08:14:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E15E2ACB7;
 Thu, 30 Jul 2020 08:14:59 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm: Add infrastructure for vmap operations of I/O
 memory
To: daniel@ffwll.ch
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-4-tzimmermann@suse.de>
 <20200729135744.GQ6419@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <79a17df5-5654-ccf7-e3aa-5c74894b436f@suse.de>
Date: Thu, 30 Jul 2020 10:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729135744.GQ6419@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, natechancellor@gmail.com, sam@ravnborg.org,
 peda@axentia.se, dan.carpenter@oracle.com
Content-Type: multipart/mixed; boundary="===============1716838898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1716838898==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KfSy4KaWGTqdVrvwzhGfdL6XtcTn1OFhb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KfSy4KaWGTqdVrvwzhGfdL6XtcTn1OFhb
Content-Type: multipart/mixed; boundary="hUjQ4SL7KN0G0IROshE336O3foMpCjhVf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Cc: airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 b.zolnierkie@samsung.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@intel.com, peda@axentia.se,
 dan.carpenter@oracle.com, natechancellor@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <79a17df5-5654-ccf7-e3aa-5c74894b436f@suse.de>
Subject: Re: [PATCH 3/5] drm: Add infrastructure for vmap operations of I/O
 memory
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-4-tzimmermann@suse.de>
 <20200729135744.GQ6419@phenom.ffwll.local>
In-Reply-To: <20200729135744.GQ6419@phenom.ffwll.local>

--hUjQ4SL7KN0G0IROshE336O3foMpCjhVf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.07.20 um 15:57 schrieb daniel@ffwll.ch:
> On Wed, Jul 29, 2020 at 03:41:46PM +0200, Thomas Zimmermann wrote:
>> Most platforms allow for accessing framebuffer I/O memory with regular=

>> load and store operations. Some platforms, such as sparc64, require
>> the use of special instructions instead.
>>
>> This patch adds vmap_iomem to struct drm_gem_object_funcs. The new
>> interface drm_client_buffer_vmap_iomem() gives DRM clients access to t=
he
>> I/O memory buffer. The semantics of struct drm_gem_objcet_funcs.vmap
>> change slightly. It used to return system or I/O memory. Now it is
>> expected to return memory addresses that can be accessed with regular
>> load and store operations. So nothing changes for existing implementat=
ions
>> of GEM objects. If the GEM object also implements vmap_iomem, a call
>> to vmap shall only return system memory, even if I/O memory could be
>> accessed with loads and stores.
>>
>> The existing interface drm_client_buffer_vmap() shall only return memo=
ry
>> as given by drm_gem_vmap ((i.e., that is accessible via regular load a=
nd
>> store). The new interface drm_client_buffer_vmap_iomem() shall only
>> return I/O memory.
>>
>> DRM clients must map buffers by calling drm_client_buffer_vmap_iomem()=

>> and drm_client_buffer_vmap() to get the buffer in I/O or system memory=
=2E
>> Each function returns NULL if the buffer is in the other memory area.
>> Depending on the type of the returned memory, clients must access the
>> framebuffer with the appropriate operations.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Hm I don't think this works, since for more dynamic framebuffers (like
> real big gpu ttm drivers) this is a dynamic thing, which can change eve=
ry
> time we do an mmap. So I think the ttm approach of having an is_iomem f=
lag
> is a lot better.
>=20
> The trouble with that is that you don't have correct checking of sparse=

> mappings, but oh well :-/ The one idea I've had to address that is usin=
g
> something like this
>=20
> typedef dma_buf_addr_t {
> 	bool is_iomem;
> 	union {
> 		void __iomem *vaddr_iomem;
> 		void vaddr;
> 	};
> };
>=20
> And then having a wrapper for memcpy_from_dma_buf_addr and
> memcpy_to_dma_buf_addr, which switches between memcpy and memcpy_from/t=
oio
> depending upon the is_iomem flag.
>=20
> But it's a lot more invasive unfortunately :-/

What do you think about introducing read and write callbacks for GEM
objects? Like this:

  int drm_gem_read(struct drm_gem_object *gbo, size_t off, size_t len,
void *buf);

  int drm_gem_write(struct drm_gem_object *gbo, size_t off, size_t len,
const void *buf);

The common case would by memcpy, but GEM implementations could provide
their own thing. The fbdev blit function would look like

  vaddr =3D drm_gem_vmap(gbo)
  if (IS_ERR(vaddr))
    return

  for (each line) {
    drm_gem_write(gbo, gbo_line_offset, line_size, src)
    gbo_line_offset =3D /* next line */
    src =3D /* next line */
  }

  drm_gem_vunmap(gbo);

The whole mess about I/O access would be self-contained.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/drm_client.c   | 52 ++++++++++++++++++++++++++++++++-=
-
>>  drivers/gpu/drm/drm_gem.c      | 19 +++++++++++++
>>  drivers/gpu/drm/drm_internal.h |  1 +
>>  include/drm/drm_client.h       |  8 +++++-
>>  include/drm/drm_gem.h          | 17 +++++++++--
>>  5 files changed, 91 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
=2Ec
>> index 495f47d23d87..b5bbe089a41e 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -327,6 +327,46 @@ void *drm_client_buffer_vmap(struct drm_client_bu=
ffer *buffer)
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>> =20
>> +/**
>> + * drm_client_buffer_vmap_iomem - Map DRM client buffer into address =
space
>> + * @buffer: DRM client buffer
>> + *
>> + * This function maps a client buffer into kernel address space. If t=
he
>> + * buffer is already mapped, it returns the mapping's address.
>> + *
>> + * Client buffer mappings are not ref'counted. Each call to
>> + * drm_client_buffer_vmap() should be followed by a call to
>> + * drm_client_buffer_vunmap(); or the client buffer should be mapped
>> + * throughout its lifetime.
>> + *
>> + * Returns:
>> + *	The mapped memory's address
>> + */
>> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *=
buffer)
>> +{
>> +	void __iomem *vaddr_iomem;
>> +
>> +	if (buffer->vaddr_iomem)
>> +		return buffer->vaddr_iomem;
>> +
>> +	/*
>> +	 * FIXME: The dependency on GEM here isn't required, we could
>> +	 * convert the driver handle to a dma-buf instead and use the
>> +	 * backend-agnostic dma-buf vmap support instead. This would
>> +	 * require that the handle2fd prime ioctl is reworked to pull the
>> +	 * fd_install step out of the driver backend hooks, to make that
>> +	 * final step optional for internal users.
>> +	 */
>> +	vaddr_iomem =3D drm_gem_vmap_iomem(buffer->gem);
>> +	if (IS_ERR(vaddr_iomem))
>> +		return vaddr_iomem;
>> +
>> +	buffer->vaddr_iomem =3D vaddr_iomem;
>> +
>> +	return vaddr_iomem;
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_vmap_iomem);
>> +
>>  /**
>>   * drm_client_buffer_vunmap - Unmap DRM client buffer
>>   * @buffer: DRM client buffer
>> @@ -337,8 +377,16 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>>   */
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>>  {
>> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> -	buffer->vaddr =3D NULL;
>> +	drm_WARN_ON(buffer->client->dev, buffer->vaddr && buffer->vaddr_iome=
m);
>> +
>> +	if (buffer->vaddr) {
>> +		drm_gem_vunmap(buffer->gem, buffer->vaddr);
>> +		buffer->vaddr =3D NULL;
>> +	}
>> +	if (buffer->vaddr_iomem) {
>> +		drm_gem_vunmap(buffer->gem, (void *)buffer->vaddr_iomem);
>> +		buffer->vaddr_iomem =3D NULL;
>> +	}
>>  }
>>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>> =20
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index a57f5379fc08..a001be8c0965 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1227,6 +1227,25 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
>>  		vaddr =3D obj->funcs->vmap(obj);
>>  	else if (obj->dev->driver->gem_prime_vmap)
>>  		vaddr =3D obj->dev->driver->gem_prime_vmap(obj);
>> +	else if (obj->funcs && obj->funcs->vmap_iomem)
>> +		vaddr =3D NULL; /* requires mapping as I/O memory */
>> +	else
>> +		vaddr =3D ERR_PTR(-EOPNOTSUPP);
>> +
>> +	if (!vaddr)
>> +		vaddr =3D ERR_PTR(-ENOMEM);
>> +
>> +	return vaddr;
>> +}
>> +
>> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj)
>> +{
>> +	void __iomem *vaddr;
>> +
>> +	if (obj->funcs && obj->funcs->vmap_iomem)
>> +		vaddr =3D obj->funcs->vmap_iomem(obj);
>> +	else if (obj->funcs && obj->funcs->vmap)
>> +		vaddr =3D NULL; /* requires mapping as system memory */
>>  	else
>>  		vaddr =3D ERR_PTR(-EOPNOTSUPP);
>> =20
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inte=
rnal.h
>> index 8e01caaf95cc..aa1a3d4f9223 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -187,6 +187,7 @@ void drm_gem_print_info(struct drm_printer *p, uns=
igned int indent,
>>  int drm_gem_pin(struct drm_gem_object *obj);
>>  void drm_gem_unpin(struct drm_gem_object *obj);
>>  void *drm_gem_vmap(struct drm_gem_object *obj);
>> +void __iomem *drm_gem_vmap_iomem(struct drm_gem_object *obj);
>>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
>> =20
>>  /* drm_debugfs.c drm_debugfs_crc.c */
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 7aaea665bfc2..94aa075ee4b6 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -141,10 +141,15 @@ struct drm_client_buffer {
>>  	struct drm_gem_object *gem;
>> =20
>>  	/**
>> -	 * @vaddr: Virtual address for the buffer
>> +	 * @vaddr: Virtual address for the buffer in system memory
>>  	 */
>>  	void *vaddr;
>> =20
>> +	/**
>> +	 * @vaddr: Virtual address for the buffer in I/O memory
>> +	 */
>> +	void *vaddr_iomem;
>> +
>>  	/**
>>  	 * @fb: DRM framebuffer
>>  	 */
>> @@ -156,6 +161,7 @@ drm_client_framebuffer_create(struct drm_client_de=
v *client, u32 width, u32 heig
>>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);=

>>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, st=
ruct drm_rect *rect);
>>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>> +void __iomem *drm_client_buffer_vmap_iomem(struct drm_client_buffer *=
buffer);
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>> =20
>>  int drm_client_modeset_create(struct drm_client_dev *client);
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 337a48321705..bc735ff522a8 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -134,17 +134,28 @@ struct drm_gem_object_funcs {
>>  	 * @vmap:
>>  	 *
>>  	 * Returns a virtual address for the buffer. Used by the
>> -	 * drm_gem_dmabuf_vmap() helper.
>> +	 * drm_gem_dmabuf_vmap() helper. If the buffer is not
>> +	 * located in system memory, the function returns NULL.
>>  	 *
>>  	 * This callback is optional.
>>  	 */
>>  	void *(*vmap)(struct drm_gem_object *obj);
>> =20
>> +	/**
>> +	 * @vmap_iomem:
>> +	 *
>> +	 * Returns a virtual address for the buffer. If the buffer is not
>> +	 * located in I/O memory, the function returns NULL.
>> +	 *
>> +	 * This callback is optional.
>> +	 */
>> +	void __iomem *(*vmap_iomem)(struct drm_gem_object *obj);
>> +
>>  	/**
>>  	 * @vunmap:
>>  	 *
>> -	 * Releases the address previously returned by @vmap. Used by the
>> -	 * drm_gem_dmabuf_vunmap() helper.
>> +	 * Releases the address previously returned by @vmap or @vmap_iomem.=

>> +	 * Used by the drm_gem_dmabuf_vunmap() helper.
>>  	 *
>>  	 * This callback is optional.
>>  	 */
>> --=20
>> 2.27.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hUjQ4SL7KN0G0IROshE336O3foMpCjhVf--

--KfSy4KaWGTqdVrvwzhGfdL6XtcTn1OFhb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8igXYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNttwf/RP7+mk+2QdiBvxTJ9HenCzBNLPMH
n7M0uiHBYj9VhLqk934tEIzjWkqVpUI+rN+6KySlw/Xa76FSCTTBghhFp6JXrNo8
Waj3CEx7zZfIy3D08zyDXx0uLWFRYgFzIFPFDnqx7YUb9xvaIbzSMZMS/raCZpNm
kzJ+lGl+jTKs0yHLTrtgvLM9tcl6RTstLrApCCKeC0l9jHZoun8vRslqqCXvLtJD
+B77JANRqIsGnwoVCqdaXeDDDKcElRyzKN0Jny9n3yJzIVFsOfdm9FLIHr0Zhb2b
3MggFy3O6Ub9HNal10QkySMtvNcxAe7TMhj1ceKuPHw956G7y4mWrz8Wqg==
=wDe1
-----END PGP SIGNATURE-----

--KfSy4KaWGTqdVrvwzhGfdL6XtcTn1OFhb--

--===============1716838898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1716838898==--
