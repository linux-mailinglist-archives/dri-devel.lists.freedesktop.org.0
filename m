Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237912D4442
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAB96EA65;
	Wed,  9 Dec 2020 14:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C592A6EA65
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 14:27:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D5AEAD29;
 Wed,  9 Dec 2020 14:27:40 +0000 (UTC)
Subject: Re: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local operations
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
 eric@anholt.net, sam@ravnborg.org
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-4-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fab0fe22-45dc-4420-66b4-3a566b816c79@suse.de>
Date: Wed, 9 Dec 2020 15:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209142527.26415-4-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0426253201=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0426253201==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OA6RCknbOgcXsd6XvZQKnTWiNat1O9M3v"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OA6RCknbOgcXsd6XvZQKnTWiNat1O9M3v
Content-Type: multipart/mixed; boundary="aGWGSbVmo8qRQRE6BtFJDPl69hq2YXjmn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
 eric@anholt.net, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org
Message-ID: <fab0fe22-45dc-4420-66b4-3a566b816c79@suse.de>
Subject: Re: [PATCH v3 3/8] dma-buf: Add vmap_local and vnumap_local
 operations
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-4-tzimmermann@suse.de>
In-Reply-To: <20201209142527.26415-4-tzimmermann@suse.de>

--aGWGSbVmo8qRQRE6BtFJDPl69hq2YXjmn
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.12.20 um 15:25 schrieb Thomas Zimmermann:
> The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
> allowed to pin the buffer or acquire the buffer's reservation object
> lock.
>=20
> This is a problem for callers that only require a short-term mapping
> of the buffer without the pinning, or callers that have special locking=

> requirements. These may suffer from unnecessary overhead or interfere
> with regular pin operations.
>=20
> The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
> their rsp callbacks in struct dma_buf_ops provide an alternative withou=
t
> pinning or reservation locking. Callers are responsible for these
> operations.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Before merging, this patch would get a Suggested-by tag to give Daniel=20
credit. I only notices after hitting the send button.

Best regards
Thomas

> ---
>   drivers/dma-buf/dma-buf.c | 80 ++++++++++++++++++++++++++++++++++++++=
+
>   include/linux/dma-buf.h   | 34 +++++++++++++++++
>   2 files changed, 114 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e63684d4cd90..be9f80190a66 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1265,6 +1265,86 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, stru=
ct dma_buf_map *map)
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>  =20
> +/**
> + * dma_buf_vmap_local - Create virtual mapping for the buffer object i=
nto kernel
> + * address space.
> + * @dmabuf:	[in]	buffer to vmap
> + * @map:	[out]	returns the vmap pointer
> + *
> + * This call may fail due to lack of virtual mapping address space.
> + * These calls are optional in drivers. The intended use for them
> + * is for mapping objects linear in kernel space for high use objects.=

> + * Please attempt to use kmap/kunmap before thinking about these inter=
faces.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map=
)
> +{
> +	struct dma_buf_map ptr;
> +	int ret =3D 0;
> +
> +	dma_buf_map_clear(map);
> +
> +	if (WARN_ON(!dmabuf))
> +		return -EINVAL;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	if (!dmabuf->ops->vmap_local)
> +		return -EINVAL;
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (dmabuf->vmapping_counter) {
> +		dmabuf->vmapping_counter++;
> +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +		*map =3D dmabuf->vmap_ptr;
> +		goto out_unlock;
> +	}
> +
> +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
> +
> +	ret =3D dmabuf->ops->vmap_local(dmabuf, &ptr);
> +	if (WARN_ON_ONCE(ret))
> +		goto out_unlock;
> +
> +	dmabuf->vmap_ptr =3D ptr;
> +	dmabuf->vmapping_counter =3D 1;
> +
> +	*map =3D dmabuf->vmap_ptr;
> +
> +out_unlock:
> +	mutex_unlock(&dmabuf->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
> +
> +/**
> + * dma_buf_vunmap_local - Unmap a vmap obtained by dma_buf_vmap_local.=

> + * @dmabuf:	[in]	buffer to vunmap
> + * @map:	[in]	vmap pointer to vunmap
> + */
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *=
map)
> +{
> +	if (WARN_ON(!dmabuf))
> +		return;
> +
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
> +	BUG_ON(dmabuf->vmapping_counter =3D=3D 0);
> +	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
> +
> +	mutex_lock(&dmabuf->lock);
> +	if (--dmabuf->vmapping_counter =3D=3D 0) {
> +		if (dmabuf->ops->vunmap_local)
> +			dmabuf->ops->vunmap_local(dmabuf, map);
> +		dma_buf_map_clear(&dmabuf->vmap_ptr);
> +	}
> +	mutex_unlock(&dmabuf->lock);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..f66580d23a9b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -269,6 +269,38 @@ struct dma_buf_ops {
>  =20
>   	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>   	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vmap_local:
> +	 *
> +	 * Creates a virtual mapping for the buffer into kernel address space=
=2E
> +	 *
> +	 * This callback establishes short-term mappings for situations where=

> +	 * callers only use the buffer for a bounded amount of time; such as
> +	 * updates to the framebuffer or reading back contained information.
> +	 * In contrast to the regular @vmap callback, vmap_local does never p=
in
> +	 * the buffer to a specific domain or acquire the buffer's reservatio=
n
> +	 * lock.
> +	 *
> +	 * This is called with the dmabuf->resv object locked. Callers must h=
old
> +	 * the lock until after removing the mapping with @vunmap_local.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vunmap_local:
> +	 *
> +	 * Removes a virtual mapping that wa sestablished by @vmap_local.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map *map)=
;
>   };
>  =20
>   /**
> @@ -506,4 +538,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_s=
truct *,
>   		 unsigned long);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>   void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);=

> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map *map=
);
> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct dma_buf_map *=
map);
>   #endif /* __DMA_BUF_H__ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aGWGSbVmo8qRQRE6BtFJDPl69hq2YXjmn--

--OA6RCknbOgcXsd6XvZQKnTWiNat1O9M3v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/Q3toFAwAAAAAACgkQlh/E3EQov+DI
uxAAhx4iJU/FHPsmAupxKsb/vMp8tSvFIXnVLMYth6sFzmQQDwdaJEHeF0meLcdyZmJyxPUCoIhy
ZddFxjFfThu5tY3JssNtxDd2vkOy7CDpLnsyho/LZwXJ0MgKhl19DlDSvywtJz4gHq56d3S7J3U2
Wtud6Ie54Q7xapck9gp45g67g4/9nVbsRCeMkCLlnslG6VfzQ7MoPVk223NIL5wUDKL7kdIFuOLX
ubpj9LWlciUyhmEjqS0lznSgxyrhpBV7uCk2Jb9NGGM9BmdWLwwr+OSjBQhrLFEc1/uygvZVWEGn
gjpA6u76uQaC2WIXuf1nuvg6kjN6h4c6irq5NtFxQ6uUmUFRNz47UlRQCqYFUuo5xEf4rfws7x2K
0xduAmzjZ6nRoHO1mxjAOKrHhHuE0OpGru03zTSeV0As9dPmC/vDhyEnwGCelWgXLwIsfslcLIDf
tG4ZUVLS3YXlROsRAKh84k4Bvm+0nv6qjk03AJJcCt3lSscWUTYYLAo14/Y/I4DbujSjdzjqjSD2
GHYk9pnHjD7bZvb0ui6K0PME/6RSzoAmTl+Haec/e+6e8qgactS2vSQ69Aq9y1qryoctQpAhqYWu
OGU/GoFn6X45SG5VmQjqR6YCvUfWLm6dgnaFr/00aiLRU+V6ov0wJU9TasQsWktM91ToVSFqba4d
X+U=
=G2uP
-----END PGP SIGNATURE-----

--OA6RCknbOgcXsd6XvZQKnTWiNat1O9M3v--

--===============0426253201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0426253201==--
