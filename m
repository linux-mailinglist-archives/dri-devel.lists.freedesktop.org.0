Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD34AEA16
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 07:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49DD10E29E;
	Wed,  9 Feb 2022 06:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FEE10E29E;
 Wed,  9 Feb 2022 06:15:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6BE161562;
 Wed,  9 Feb 2022 06:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B753DC340E7;
 Wed,  9 Feb 2022 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644387305;
 bh=OUPNHBAJBd42EIpzpVtb9lp5kMJbQTw7jGC1FYPoiXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IGD42/2Jb0d5SZJjI471MYihxC7OM3utb9RbC8h+OjELkaeknbfHc2Ni209paihrU
 kqLccFEAqqlInc/AHGaZB/ji+CAJKW5R1AfYYfulxbhW0EB1UgHvQNyRJvvoSnOMnt
 FF0XeD7dfALhqVs7dxTAdJxRU5kFYzW4egFmXBx2hb2/ic6CPPBXF8l7Ts2LsiJAC8
 tHoWBA2YbqM1HgTkiFhXUbP3apbqStVE8AXtdfqiCcd0nlNwK2qlvLY8d0w5RGcBs3
 i2KavDo3xNE2NIqWrQT4OVzbfw4Oohgri5kHjPuMGfAWYgQtmpTyqDq0kcLRxeWBSA
 EDIhrgIdTK8mw==
Date: Wed, 9 Feb 2022 07:14:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 02/18] iosys-map: Add a few more helpers
Message-ID: <20220209071459.06d4d397@coco.lan>
In-Reply-To: <20220208104524.2516209-3-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
 <20220208104524.2516209-3-lucas.demarchi@intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Tue,  8 Feb 2022 02:45:08 -0800
Lucas De Marchi <lucas.demarchi@intel.com> escreveu:

> First the simplest ones:
>=20
> 	- iosys_map_memset(): when abstracting system and I/O memory,
> 	  just like the memcpy() use case, memset() also has dedicated
> 	  functions to be called for using IO memory.
> 	- iosys_map_memcpy_from(): we may need to copy data from I/O
> 	  memory, not only to.
>=20
> In certain situations it's useful to be able to read or write to an
> offset that is calculated by having the memory layout given by a struct
> declaration. Usually we are going to read/write a u8, u16, u32 or u64.
>=20
> As a pre-requisite for the implementation, add iosys_map_memcpy_from()
> to be the equivalent of iosys_map_memcpy_to(), but in the other
> direction. Then add 2 pairs of macros:
>=20
> 	- iosys_map_rd() / iosys_map_wr()
> 	- iosys_map_rd_field() / iosys_map_wr_field()
>=20
> The first pair takes the C-type and offset to read/write. The second
> pair uses a struct describing the layout of the mapping in order to
> calculate the offset and size being read/written.
>=20
> We could use readb, readw, readl, readq and the write* counterparts,
> however due to alignment issues this may not work on all architectures.
> If alignment needs to be checked to call the right function, it's not
> possible to decide at compile-time which function to call: so just leave
> the decision to the memcpy function that will do exactly that.
>=20
> Finally, in order to use the above macros with a map derived from
> another, add another initializer: IOSYS_MAP_INIT_OFFSET().
>=20
> v2:
>   - Rework IOSYS_MAP_INIT_OFFSET() so it doesn't rely on aliasing rules
>     within the union
>   - Add offset to both iosys_map_rd_field() and iosys_map_wr_field() to
>     allow the struct itself to be at an offset from the mapping
>   - Add documentation to iosys_map_rd_field() with example and expected
>     memory layout
>=20
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro

> ---
>  include/linux/iosys-map.h | 202 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>=20
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index edd730b1e899..c6b223534b21 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -6,6 +6,7 @@
>  #ifndef __IOSYS_MAP_H__
>  #define __IOSYS_MAP_H__
> =20
> +#include <linux/kernel.h>
>  #include <linux/io.h>
>  #include <linux/string.h>
> =20
> @@ -120,6 +121,45 @@ struct iosys_map {
>  		.is_iomem =3D false,	\
>  	}
> =20
> +/**
> + * IOSYS_MAP_INIT_OFFSET - Initializes struct iosys_map from another ios=
ys_map
> + * @map_:	The dma-buf mapping structure to copy from
> + * @offset_:	Offset to add to the other mapping
> + *
> + * Initializes a new iosys_map struct based on another passed as argumen=
t. It
> + * does a shallow copy of the struct so it's possible to update the back=
 storage
> + * without changing where the original map points to. It is the equivale=
nt of
> + * doing:
> + *
> + * .. code-block:: c
> + *
> + *	iosys_map map =3D other_map;
> + *	iosys_map_incr(&map, &offset);
> + *
> + * Example usage:
> + *
> + * .. code-block:: c
> + *
> + *	void foo(struct device *dev, struct iosys_map *base_map)
> + *	{
> + *		...
> + *		struct iosys_map map =3D IOSYS_MAP_INIT_OFFSET(base_map, FIELD_OFFSE=
T);
> + *		...
> + *	}
> + *
> + * The advantage of using the initializer over just increasing the offse=
t with
> + * iosys_map_incr() like above is that the new map will always point to =
the
> + * right place of the buffer during its scope. It reduces the risk of up=
dating
> + * the wrong part of the buffer and having no compiler warning about tha=
t. If
> + * the assignment to IOSYS_MAP_INIT_OFFSET() is forgotten, the compiler =
can warn
> + * about the use of uninitialized variable.
> + */
> +#define IOSYS_MAP_INIT_OFFSET(map_, offset_) ({				\
> +	struct iosys_map copy =3D *map_;					\
> +	iosys_map_incr(&copy, offset_);					\
> +	copy;								\
> +})
> +
>  /**
>   * iosys_map_set_vaddr - Sets a iosys mapping structure to an address in=
 system memory
>   * @map:	The iosys_map structure
> @@ -239,6 +279,26 @@ static inline void iosys_map_memcpy_to(struct iosys_=
map *dst, size_t dst_offset,
>  		memcpy(dst->vaddr + dst_offset, src, len);
>  }
> =20
> +/**
> + * iosys_map_memcpy_from - Memcpy from iosys_map into system memory
> + * @dst:	Destination in system memory
> + * @src:	The iosys_map structure
> + * @src_offset:	The offset from which to copy
> + * @len:	The number of byte in src
> + *
> + * Copies data from a iosys_map with an offset. The dest buffer is in
> + * system memory. Depending on the mapping location, the helper picks the
> + * correct method of accessing the memory.
> + */
> +static inline void iosys_map_memcpy_from(void *dst, const struct iosys_m=
ap *src,
> +					 size_t src_offset, size_t len)
> +{
> +	if (src->is_iomem)
> +		memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
> +	else
> +		memcpy(dst, src->vaddr + src_offset, len);
> +}
> +
>  /**
>   * iosys_map_incr - Increments the address stored in a iosys mapping
>   * @map:	The iosys_map structure
> @@ -255,4 +315,146 @@ static inline void iosys_map_incr(struct iosys_map =
*map, size_t incr)
>  		map->vaddr +=3D incr;
>  }
> =20
> +/**
> + * iosys_map_memset - Memset iosys_map
> + * @dst:	The iosys_map structure
> + * @offset:	Offset from dst where to start setting value
> + * @value:	The value to set
> + * @len:	The number of bytes to set in dst
> + *
> + * Set value in iosys_map. Depending on the buffer's location, the helper
> + * picks the correct method of accessing the memory.
> + */
> +static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
> +				    int value, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memset_io(dst->vaddr_iomem + offset, value, len);
> +	else
> +		memset(dst->vaddr + offset, value, len);
> +}
> +
> +/**
> + * iosys_map_rd - Read a C-type value from the iosys_map
> + *
> + * @map__:	The iosys_map structure
> + * @offset__:	The offset from which to read
> + * @type__:	Type of the value being read
> + *
> + * Read a C type value from iosys_map, handling possible un-aligned acce=
sses to
> + * the mapping.
> + *
> + * Returns:
> + * The value read from the mapping.
> + */
> +#define iosys_map_rd(map__, offset__, type__) ({			\
> +	type__ val;							\
> +	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
> +	val;								\
> +})
> +
> +/**
> + * iosys_map_wr - Write a C-type value to the iosys_map
> + *
> + * @map__:	The iosys_map structure
> + * @offset__:	The offset from the mapping to write to
> + * @type__:	Type of the value being written
> + * @val__:	Value to write
> + *
> + * Write a C-type value to the iosys_map, handling possible un-aligned a=
ccesses
> + * to the mapping.
> + */
> +#define iosys_map_wr(map__, offset__, type__, val__) ({			\
> +	type__ val =3D (val__);						\
> +	iosys_map_memcpy_to(map__, offset__, &val, sizeof(val));	\
> +})
> +
> +/**
> + * iosys_map_rd_field - Read a member from a struct in the iosys_map
> + *
> + * @map__:		The iosys_map structure
> + * @struct_offset__:	Offset from the beggining of the map, where the str=
uct
> + *			is located
> + * @struct_type__:	The struct describing the layout of the mapping
> + * @field__:		Member of the struct to read
> + *
> + * Read a value from iosys_map considering its layout is described by a =
C struct
> + * starting at @struct_offset__. The field offset and size is calculated=
 and its
> + * value read handling possible un-aligned memory accesses. For example:=
 suppose
> + * there is a @struct foo defined as below and the value ``foo.field2.in=
ner2``
> + * needs to be read from the iosys_map:
> + *
> + * .. code-block:: c
> + *
> + *	struct foo {
> + *		int field1;
> + *		struct {
> + *			int inner1;
> + *			int inner2;
> + *		} field2;
> + *		int field3;
> + *	} __packed;
> + *
> + * This is the expected memory layout of a buffer using iosys_map_rd_fie=
ld():
> + *
> + * +------------------------------+--------------------------+
> + * | Address                      | Content                  |
> + * +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> + * | buffer + 0000                | start of mmapped buffer  |
> + * |                              | pointed by iosys_map     |
> + * +------------------------------+--------------------------+
> + * | ...                          | ...                      |
> + * +------------------------------+--------------------------+
> + * | buffer + ``struct_offset__`` | start of ``struct foo``  |
> + * +------------------------------+--------------------------+
> + * | ...                          | ...                      |
> + * +------------------------------+--------------------------+
> + * | buffer + wwww                | ``foo.field2.inner2``    |
> + * +------------------------------+--------------------------+
> + * | ...                          | ...                      |
> + * +------------------------------+--------------------------+
> + * | buffer + yyyy                | end of ``struct foo``    |
> + * +------------------------------+--------------------------+
> + * | ...                          | ...                      |
> + * +------------------------------+--------------------------+
> + * | buffer + zzzz                | end of mmaped buffer     |
> + * +------------------------------+--------------------------+
> + *
> + * Values automatically calculated by this macro or not needed are denot=
ed by
> + * wwww, yyyy and zzzz. This is the code to read that value:
> + *
> + * .. code-block:: c
> + *
> + *	x =3D iosys_map_rd_field(&map, offset, struct foo, field2.inner2);
> + *
> + * Returns:
> + * The value read from the mapping.
> + */
> +#define iosys_map_rd_field(map__, struct_offset__, struct_type__, field_=
_) ({	\
> +	struct_type__ *s;							\
> +	iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__),=
	\
> +		     typeof(s->field__));					\
> +})
> +
> +/**
> + * iosys_map_wr_field - Write to a member of a struct in the iosys_map
> + *
> + * @map__:		The iosys_map structure
> + * @struct_offset__:	Offset from the beggining of the map, where the str=
uct
> + *			is located
> + * @struct_type__:	The struct describing the layout of the mapping
> + * @field__:		Member of the struct to read
> + * @val__:		Value to write
> + *
> + * Write a value to the iosys_map considering its layout is described by=
 a C struct
> + * starting at @struct_offset__. The field offset and size is calculated=
 and the
> + * @val__ is written handling possible un-aligned memory accesses. Refer=
 to
> + * iosys_map_rd_field() for expected usage and memory layout.
> + */
> +#define iosys_map_wr_field(map__, struct_offset__, struct_type__, field_=
_, val__) ({	\
> +	struct_type__ *s;								\
> +	iosys_map_wr(map__, struct_offset__ + offsetof(struct_type__, field__),=
		\
> +		     typeof(s->field__), val__);					\
> +})
> +
>  #endif /* __IOSYS_MAP_H__ */



Thanks,
Mauro
