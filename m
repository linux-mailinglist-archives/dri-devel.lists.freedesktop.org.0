Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A71A7E6611
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B90610E1FA;
	Thu,  9 Nov 2023 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFCA10E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699520511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQ2E4v8D5jloXo8TkKVS4k3IAs8Hfv52eoOy+5DobTY=;
 b=COxF5++uGboNDGCmHuy0U56D0y3iHRqgk/g6v94p0AXU8OgdqpXmgKdsKEF2y+ZfDoamk5
 gZQ//6/D05y3raWXOAhxG64RY41Jtw34R0qJRKUC1RLE/olxMBnNKu+RfpHZn4t5MulMle
 2l2y9fFc6Q2i5QQ8/gfonREWqbarlt4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-vdZZOeq7O8qnqIbp2wLPNw-1; Thu, 09 Nov 2023 04:01:50 -0500
X-MC-Unique: vdZZOeq7O8qnqIbp2wLPNw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-540f4715d09so63387a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520509; x=1700125309;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3GdRtcKnHBIooBz8CRQ9n177xrjS4UMT2Wxo71oaBJg=;
 b=QyrzvrL5im83XpCNPPPQB2aWkT7/lKBJ94AxE3/8d01e7DAB7z79unX9TKUTJqmYXl
 iRtcnuZlFaoNDGdgVjrwbco9eKl5gtes7xmPskJB5UDm+jfHc86IzBMMwl33iDzJZjj6
 9jwFYmBEjN4cFkBmxRaRSvKmas2l3FJm/Phmcg7wenDEVeeGSHD9Q9leg35SNgYbliwy
 pZX6qbtKyRZbYQ0DGNH3cqOBh3bXgS5uBIg0ghRD18jVyOdcniTjvWxQRgxES1Ry2k0f
 uaRWNspKfeQ1lBctUT6Ms5xnKjPGZL+GQquy3uKpyfGlpPrhXD1No0TyG7M90bXfDkab
 eqMw==
X-Gm-Message-State: AOJu0YzbVlkdoYGG928Vmra6aXovd+03+xyyrO+yOxK1CRyytUr9kbjR
 SzuwSlOM9c+H9wrRRxNAht+iYE0wJWCK6+5BfqbYVemm1PXfaMSXLz9dnHT6jPpPcybYZYcYl9F
 hFsztQsvXbIWrEYQTOqYJKrg/n3CF
X-Received: by 2002:a05:6402:f17:b0:540:a181:f40b with SMTP id
 i23-20020a0564020f1700b00540a181f40bmr4095013eda.4.1699520509314; 
 Thu, 09 Nov 2023 01:01:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs4kFQwDr2GcSp3GTsPB4RRvWzreFUbMHSJElDo2cAX0GNGwqbEAhl7Xc8OlUx2EJqQdsHHw==
X-Received: by 2002:a05:6402:f17:b0:540:a181:f40b with SMTP id
 i23-20020a0564020f1700b00540a181f40bmr4094979eda.4.1699520508954; 
 Thu, 09 Nov 2023 01:01:48 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 y93-20020a50bb66000000b0053e6e40cc1asm8068217ede.86.2023.11.09.01.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:01:47 -0800 (PST)
Message-ID: <429f6303c9c61d50ba6c5fdddec30c22dc0b2c09.camel@redhat.com>
Subject: Re: [RFC PATCH v3 07/12] page-pool: device memory support
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 10:01:45 +0100
In-Reply-To: <20231106024413.2801438-8-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-8-almasrymina@google.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> Overload the LSB of struct page* to indicate that it's a page_pool_iov.
>=20
> Refactor mm calls on struct page* into helpers, and add page_pool_iov
> handling on those helpers. Modify callers of these mm APIs with calls to
> these helpers instead.
>=20
> In areas where struct page* is dereferenced, add a check for special
> handling of page_pool_iov.
>=20
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>=20
> ---
>  include/net/page_pool/helpers.h | 74 ++++++++++++++++++++++++++++++++-
>  net/core/page_pool.c            | 63 ++++++++++++++++++++--------
>  2 files changed, 118 insertions(+), 19 deletions(-)
>=20
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/help=
ers.h
> index b93243c2a640..08f1a2cc70d2 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -151,6 +151,64 @@ static inline struct page_pool_iov *page_to_page_poo=
l_iov(struct page *page)
>  =09return NULL;
>  }
> =20
> +static inline int page_pool_page_ref_count(struct page *page)
> +{
> +=09if (page_is_page_pool_iov(page))
> +=09=09return page_pool_iov_refcount(page_to_page_pool_iov(page));
> +
> +=09return page_ref_count(page);
> +}
> +
> +static inline void page_pool_page_get_many(struct page *page,
> +=09=09=09=09=09   unsigned int count)
> +{
> +=09if (page_is_page_pool_iov(page))
> +=09=09return page_pool_iov_get_many(page_to_page_pool_iov(page),
> +=09=09=09=09=09      count);
> +
> +=09return page_ref_add(page, count);
> +}
> +
> +static inline void page_pool_page_put_many(struct page *page,
> +=09=09=09=09=09   unsigned int count)
> +{
> +=09if (page_is_page_pool_iov(page))
> +=09=09return page_pool_iov_put_many(page_to_page_pool_iov(page),
> +=09=09=09=09=09      count);
> +
> +=09if (count > 1)
> +=09=09page_ref_sub(page, count - 1);
> +
> +=09put_page(page);
> +}
> +
> +static inline bool page_pool_page_is_pfmemalloc(struct page *page)
> +{
> +=09if (page_is_page_pool_iov(page))
> +=09=09return false;
> +
> +=09return page_is_pfmemalloc(page);
> +}
> +
> +static inline bool page_pool_page_is_pref_nid(struct page *page, int pre=
f_nid)
> +{
> +=09/* Assume page_pool_iov are on the preferred node without actually
> +=09 * checking...
> +=09 *
> +=09 * This check is only used to check for recycling memory in the page
> +=09 * pool's fast paths. Currently the only implementation of page_pool_=
iov
> +=09 * is dmabuf device memory. It's a deliberate decision by the user to
> +=09 * bind a certain dmabuf to a certain netdev, and the netdev rx queue
> +=09 * would not be able to reallocate memory from another dmabuf that
> +=09 * exists on the preferred node, so, this check doesn't make much sen=
se
> +=09 * in this case. Assume all page_pool_iovs can be recycled for now.
> +=09 */
> +=09if (page_is_page_pool_iov(page))
> +=09=09return true;
> +
> +=09return page_to_nid(page) =3D=3D pref_nid;
> +}
> +
>  /**
>   * page_pool_dev_alloc_pages() - allocate a page.
>   * @pool:=09pool from which to allocate
> @@ -301,6 +359,9 @@ static inline long page_pool_defrag_page(struct page =
*page, long nr)
>  {
>  =09long ret;
> =20
> +=09if (page_is_page_pool_iov(page))
> +=09=09return -EINVAL;
> +
>  =09/* If nr =3D=3D pp_frag_count then we have cleared all remaining
>  =09 * references to the page:
>  =09 * 1. 'n =3D=3D 1': no need to actually overwrite it.
> @@ -431,7 +492,12 @@ static inline void page_pool_free_va(struct page_poo=
l *pool, void *va,
>   */
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -=09dma_addr_t ret =3D page->dma_addr;
> +=09dma_addr_t ret;
> +
> +=09if (page_is_page_pool_iov(page))
> +=09=09return page_pool_iov_dma_addr(page_to_page_pool_iov(page));

Should the above conditional be guarded by the page_pool_mem_providers
static key? this looks like fast-path. Same question for the refcount
helper above.

Minor nit: possibly cache 'page_is_page_pool_iov(page)' to make the
code more readable.

> +
> +=09ret =3D page->dma_addr;
> =20
>  =09if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
>  =09=09ret <<=3D PAGE_SHIFT;
> @@ -441,6 +507,12 @@ static inline dma_addr_t page_pool_get_dma_addr(stru=
ct page *page)
> =20
>  static inline bool page_pool_set_dma_addr(struct page *page, dma_addr_t =
addr)
>  {
> +=09/* page_pool_iovs are mapped and their dma-addr can't be modified. */
> +=09if (page_is_page_pool_iov(page)) {
> +=09=09DEBUG_NET_WARN_ON_ONCE(true);
> +=09=09return false;
> +=09}

Quickly skimming over the page_pool_code it looks like
page_pool_set_dma_addr() usage is guarded by the PP_FLAG_DMA_MAP page
pool flag. Could the device mem provider enforce such flag being
cleared on the page pool?

> +
>  =09if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
>  =09=09page->dma_addr =3D addr >> PAGE_SHIFT;
> =20
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 138ddea0b28f..d211996d423b 100644
> --- a/net/core/page_pool.cnn
> +++ b/net/core/page_pool.c
> @@ -317,7 +317,7 @@ static struct page *page_pool_refill_alloc_cache(stru=
ct page_pool *pool)
>  =09=09if (unlikely(!page))
>  =09=09=09break;
> =20
> -=09=09if (likely(page_to_nid(page) =3D=3D pref_nid)) {
> +=09=09if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
>  =09=09=09pool->alloc.cache[pool->alloc.count++] =3D page;
>  =09=09} else {
>  =09=09=09/* NUMA mismatch;
> @@ -362,7 +362,15 @@ static void page_pool_dma_sync_for_device(struct pag=
e_pool *pool,
>  =09=09=09=09=09  struct page *page,
>  =09=09=09=09=09  unsigned int dma_sync_size)
>  {
> -=09dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
> +=09dma_addr_t dma_addr;
> +
> +=09/* page_pool_iov memory provider do not support PP_FLAG_DMA_SYNC_DEV =
*/
> +=09if (page_is_page_pool_iov(page)) {
> +=09=09DEBUG_NET_WARN_ON_ONCE(true);
> +=09=09return;
> +=09}

Similar to the above point, mutatis mutandis.

> +
> +=09dma_addr =3D page_pool_get_dma_addr(page);
> =20
>  =09dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
>  =09dma_sync_single_range_for_device(pool->p.dev, dma_addr,
> @@ -374,6 +382,12 @@ static bool page_pool_dma_map(struct page_pool *pool=
, struct page *page)
>  {
>  =09dma_addr_t dma;
> =20
> +=09if (page_is_page_pool_iov(page)) {
> +=09=09/* page_pool_iovs are already mapped */
> +=09=09DEBUG_NET_WARN_ON_ONCE(true);
> +=09=09return true;
> +=09}

Ditto.

Cheers,

Paolo

