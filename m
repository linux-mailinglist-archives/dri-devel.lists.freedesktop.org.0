Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JkgEJ54gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:12:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97285CAA54
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E987010E3BE;
	Mon,  2 Feb 2026 10:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c1J3hUex";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c9/87kap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0A710E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770027162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
 b=c1J3hUexP3c8TKmy7G1BL+02diZtlGzmE4nUvaczA9Uo2rvOTNWaWECRY4xk+7SbPxTQ7p
 /RiTOWgnMZIjG4P7pU1kvswtSgIifb8Zr6yKSr9qtW2FTgeJBiOQBXG1vdUNwyNT2+nr4f
 Roo0rG0Sovp6RvhTubx5UCnXTl3dQO0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-pwiT-hSDOX-idphZx77VbQ-1; Mon, 02 Feb 2026 05:12:40 -0500
X-MC-Unique: pwiT-hSDOX-idphZx77VbQ-1
X-Mimecast-MFC-AGG-ID: pwiT-hSDOX-idphZx77VbQ_1770027159
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-482eec44485so13675855e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1770027159; x=1770631959; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
 b=c9/87kapa0abwSj4Yh2lOtIbDnQRQIpoVJwZmaPRsworIyvIVs9isnOnRvkRfCoIHv
 i7PXWmaDQ2Lp5T8DGHE8WcisQ/pmMSQoSKFhQWFByX1nJb1wtc6RW5ZtfZJZKFcuVcCF
 H5v9octY32XjfGKKryxosxDMc2/d78XQ7gXA/L3wFvDMBo2wrzlv0Y4OMp597JeeKGxf
 501UVUfd19X3mYRPs66kF/G9dr1TCn+JqF5KXd/bYXxAbDVw3WHizmhYLskA1Mkri2Hp
 Xg8hSwILA6GHe0y+EOUbDouIRlt0FT5u6RCcM5g1wtAr5PS823WV4c4wsZtVlSfyutjV
 nR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770027159; x=1770631959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
 b=pRvRWMJWakrMgjGezmrfYNnvbB3bgUgKtKSUHevqY2PrzAYgfCEDE7X6rxdQR4SZQj
 y03Ha2MgFTNyrH66wItVKG9jtFSDeVWNkdY9GMbk9xeL1erYk6xUGsplKWGmzJFG5InR
 oPyc3Yx3sYY2IaWv5Zw1W32LzN4Ui2TUZxioLWLro29spEzxjkaEgOlgsWKJiaKhktjp
 BNyUuUIEUGtOcgyZ9L+rR4nbLvgoVe7Zgfnhza0+3fzCwezoFuIC7J/B6OZ7t6wW1pKO
 xBvxnccMGTUHRIiGYiQetBoL80DPpopb8mpIo9ISFVv0y5xf0bn55b6CXfHR7NgN/1ny
 qb4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd9qgH8NludJldQjGgG345T9TsPhFJSGpySVeenE2yifpbnfkrgysIWYqPwTMRkPBCo1wKuhd7Des=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhp6zjgxeRs4gr8GVD0sCavLgct+P68hXeeEmyE047e3JgFVDy
 FEuw0cRMlcNy3Twlbkbyxvx6fmrz7G3BrTEBjnqU06jnWZdD9SZtedXaQMFyNAyPrm9sqcUwUiK
 bMV9e8I1uHKAUB28IuqL512/eLzVJdIWpkuOH71mUXbhp0CDrvuZPGRatlOmDr9KetTcWAQ==
X-Gm-Gg: AZuq6aK4aTmEErEkftXdx+zpC3o1honVpwn43/vDjQjWeLJXzB7K1vDNUOY5ix32jjv
 HQDPEu5TSLTlaeFJmBhiLiLivXnkXJm9EzpNq9AVRUSl7iqzf/wyb9v8xr0P9RWeChmeE4nIBug
 1oNyuw4+PzEBmfoPiKW4sv1GZkUNaM3DnDmwTmD+wsDXM6G2ZFd8Ke7lHmvzd/JmuLYiV+AgHCm
 D/b4PJ8xODtqdAj6w4m8vvF9k/+nj1DR3JtmDGSwq5exSAUtkGvqCtl2MMsXW226OqqYFnRDxQI
 pRx96lB+opsQ9Qt/GZAyj6Rx8lzpag0Y+5t+Gdh4/+06CsiDFMF1J2rdWelqzw==
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-482db45441fmr144478615e9.12.1770027158987; 
 Mon, 02 Feb 2026 02:12:38 -0800 (PST)
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-482db45441fmr144478255e9.12.1770027158488; 
 Mon, 02 Feb 2026 02:12:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm555222985e9.4.2026.02.02.02.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:12:37 -0800 (PST)
Date: Mon, 2 Feb 2026 11:12:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
Message-ID: <20260202-wealthy-quick-cow-8c5421@houat>
References: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ourfsz72devil6zd"
Content-Disposition: inline
In-Reply-To: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 97285CAA54
X-Rspamd-Action: no action


--ourfsz72devil6zd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
MIME-Version: 1.0

Hi,

On Fri, Jan 30, 2026 at 05:55:30PM -0500, Eric Chanudet wrote:
> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> without enforcing limits. Register a dmem region per cma heap and charge
> against it when allocating a buffer in a cma heap.
>=20
> For the default cma region, two heaps may be created for the same cma
> range:
> commit 854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name")
>   Introduced /dev/dma_heap/default_cma_region
> commit 4f5f8baf7341 ("dma-buf: heaps: cma: Create CMA heap for each CMA
>                       reserved region")
>   Created a CMA heap for each CMA region, which might create a duplicate
>   heap to the default one, e.g:
>     /dev/dma_heap/default_cma_region
>     /dev/dma_heap/reserved
>=20
> Removing the legacy heap would break user API. So handle the special
> case by using one dmem between the two heaps to account charges
> correctly.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> In continuation with introducing cgroup for the system heap[1], this
> behavior is enabled based on dma_heap.mem_accounting, disabled by
> default.
>=20
> dmem is chosen for CMA heaps as it allows limits to be set for each
> region backing each heap. There is one caveat for the default cma range
> that may accessible through two different cma heaps, which is treated as
> a special case.
>=20
> [1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 51 ++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..608af8ad6bce7fe0321da6d8f=
1b65a69f5d8d950 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -27,6 +27,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/cgroup_dmem.h>
> =20
>  #define DEFAULT_CMA_NAME "default_cma_region"
> =20
> @@ -46,7 +47,9 @@ int __init dma_heap_cma_register_heap(struct cma *cma)
>  struct cma_heap {
>  	struct dma_heap *heap;
>  	struct cma *cma;
> +	struct dmem_cgroup_region *cg;
>  };
> +static struct dmem_cgroup_region *default_cma_cg;
> =20
>  struct cma_heap_buffer {
>  	struct cma_heap *heap;
> @@ -58,6 +61,7 @@ struct cma_heap_buffer {
>  	pgoff_t pagecount;
>  	int vmap_cnt;
>  	void *vaddr;
> +	struct dmem_cgroup_pool_state *pool;
>  };
> =20
>  struct dma_heap_attachment {
> @@ -276,6 +280,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *=
dmabuf)
>  	kfree(buffer->pages);
>  	/* release memory */
>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
>  	kfree(buffer);
>  }
> =20
> @@ -319,9 +324,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_=
heap *heap,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align =3D CONFIG_CMA_ALIGNMENT;
> =20
> +	if (mem_accounting) {
> +		ret =3D dmem_cgroup_try_charge(cma_heap->cg, size,
> +					     &buffer->pool, NULL);
> +		if (ret)
> +			goto free_buffer;
> +	}
>
>  	cma_pages =3D cma_alloc(cma_heap->cma, pagecount, align, false);
>  	if (!cma_pages)
> -		goto free_buffer;
> +		goto uncharge_cgroup;
> =20
>  	/* Clear the cma pages */
>  	if (PageHighMem(cma_pages)) {
> @@ -376,6 +388,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,
>  	kfree(buffer->pages);
>  free_cma:
>  	cma_release(cma_heap->cma, cma_pages, pagecount);
> +uncharge_cgroup:
> +	dmem_cgroup_uncharge(buffer->pool, size);

Should we make that conditional on mem_accounting =3D=3D true ?

>  free_buffer:
>  	kfree(buffer);
> =20
> @@ -390,25 +404,52 @@ static int __init __add_cma_heap(struct cma *cma, c=
onst char *name)
>  {
>  	struct dma_heap_export_info exp_info;
>  	struct cma_heap *cma_heap;
> +	struct dmem_cgroup_region *region;
> +	int ret;
> =20
>  	cma_heap =3D kzalloc(sizeof(*cma_heap), GFP_KERNEL);
>  	if (!cma_heap)
>  		return -ENOMEM;
>  	cma_heap->cma =3D cma;
> =20
> +	/*
> +	 * If two heaps are created for the default cma region, use the same
> +	 * dmem for them. They both use the same memory pool.
> +	 */
> +	if (dev_get_cma_area(NULL) =3D=3D cma && default_cma_cg)
> +		region =3D default_cma_cg;
> +	else {
> +		region =3D dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", na=
me);
> +		if (IS_ERR(region)) {
> +			ret =3D PTR_ERR(region);
> +			goto free_cma_heap;
> +		}
> +	}
> +	cma_heap->cg =3D region;
> +

I'm not sure it's the best way to go with this. We want to track all
relevant CMA allocations going forward, in the heaps and elsewhere.

If we were to do what you suggest, an allocation in, say, DRM or v4l2
wouldn't be tracked in the same region than one in the heaps, while we
want to have it cumulated.

I think we'd be better off if we created a dmem region for each CMA
region in the system, but we would charge from the heap so we don't
account for every allocation.

I don't think we can register the dmem region when the CMA area is
initialized though, since it will probably be too early in the kernel
boot and SLAB isn't around yet.

But since we would need an accessor to get a dmem region from a cma
region, we could do something like check if a dmem eregion already
exists for that cma region, and allocate one otherwise. Or have a
secondary initcall to allocate all dmem regions.

Maxime

--ourfsz72devil6zd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYB4kAAKCRAnX84Zoj2+
dqPBAX9oydlm9YZRNx1uUYcnGj8czxCI9/nwwv3lTG3vB/96CaCaciG72JRvyD2+
YtcMBPEBf2UZP8KVV1tDJ+oujyCdJZXIsjWxMc55iL7AcfydJqlROACsQSaGrLgZ
L+gEjF3czQ==
=dD0c
-----END PGP SIGNATURE-----

--ourfsz72devil6zd--

