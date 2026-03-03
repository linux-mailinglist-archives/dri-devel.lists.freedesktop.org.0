Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMekF2repmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:13:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EA1F0021
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C983F10E7F5;
	Tue,  3 Mar 2026 13:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P6dTb0/v";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y/f1GgUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D9C10E7F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772543589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
 b=P6dTb0/vXUUxJjsbKr5sc2VR9ZDTQJ7eNA5gopg8QGaU0I1HZcVAw6U109iIh441phrIjw
 BAIM7UqxC7OKXEFbM56NCPY88NMesamde8/vjWMH2f9CCOQHgfAO89NSMqBVtUHimrx0bJ
 wGkyHoY+3SFLmSA7JPO84HgGTy5z694=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-mHD2-4EfPtKL3NvHYn6L9g-1; Tue, 03 Mar 2026 08:13:06 -0500
X-MC-Unique: mHD2-4EfPtKL3NvHYn6L9g-1
X-Mimecast-MFC-AGG-ID: mHD2-4EfPtKL3NvHYn6L9g_1772543585
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4837b7903f3so67044685e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772543585; x=1773148385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
 b=Y/f1GgUQCOHDcuSXNXG9ajo/ZvIsUFv/lo9c+gDlUE/RG9iF0ImEpuipQ0RCugrLTn
 9HY9iMn44uiMjfABISdWwgPLkdXLVqTQ2Tf3RxjdRlkNHWi0Dea89r9HnRGRfPIVb4H7
 dk3AYLXrs9JEOQIAqx9a618vUckWOzj75I59ACfSPd3R4opuLh6z8NXIj4O1+iT3EGHV
 HWMt82TV7XdhOemJrAmjydjEI+3W3z6EejiHGLXa6ipi/sWRi7eUIlGbs7rVg0splgvy
 Bkrrff1qnxxohdmbElbxpZ98Hgca3/1kuNY5CrLgmTF6Xg7PmVpGOvSeONABCmQ8xbUz
 EgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543585; x=1773148385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
 b=TXhdUC2KU9+xrDdI1T0rOgA/Lk/P+qXSU64fROz2wVuMqx+AJ6xqD2LfC4cggdT0Vy
 9Ju9LC/cocuAuegoa1YG4BkpjMWfhO8z2mESva2Qv4XuR+q8tooPB4BaMIFlNMBjmWGa
 ZpdCMLDjGninDwACFvpX8tTAoqNi0Oo9/PeYf30kJvlYUoDk76wSOBearvVOYwTlzooU
 3ePkMFDhhmw8N/G9VVSCAXrY8aBVToOtTNOlUECY1YiIEIipas9JKNK7YOPWRZsi7kZZ
 0QrHgaCCpxa/kWCz0heaUNBGq70sarOBnTwmYqkTbP/JSbbxmOD7bUBwU3FAA8kdATGS
 ohRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM/xKSa+CehvJmycYWj0xxvNa1AMOwGO33nQQFfz0PfhosrkQmKoi5YELGYJckWVShWeLpQgRriYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypbRZsV2hLdp31bLyVmvWdN+4XhNXOy4WBoh9nF2phfBonqVRE
 nlR1jWMGtE36LysOpcQRlTOXJ+Wb6S2oBc7M3z9Xdibw3tMggXl7Nr/Cl7TLCTI5kOxp3Mo61pZ
 EvJckGN3mCA68/Oy3vHZ+WK/G9tGHkczGjQhSse7kG8oxRsiP1ZgMnnIEC4aVL1/Ktz4sc9gNnK
 wMVQ==
X-Gm-Gg: ATEYQzwUoUV8cNWiKx5mA8KZtoqCqGC6AH38b+N9I2HXAxvAOZ/GsbXQAOdVq+nzlbU
 xP1+zaOUa8E9Ejk3vC/2XGrqz5c0k4dulWGnXSYgt8xOyN638NkUiUO4zbzMdlt0vtsTZhYTovw
 lzqO7kLPapCPPi4NyHaCljumApUUdtAxexlMaRO/pRdDnU/H8KrmJgQ8nrHP2U9hE81idpIuqKt
 yQUTkEdQ+njDQA3CusttDLwyO0JsNzcQuLPeBiMisdzGC0DEKcNpAoX9SteuLGvG1gvtJYS+hWq
 NJDssvriNZc2qg0mIFY9ZqySrP2BQJs6JPlCVYfR3ThGZDIvCwYjH/WO6m56kt0+7H92CsLvJQ=
 =
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-483c9c1f8fcmr272330105e9.26.1772543584795; 
 Tue, 03 Mar 2026 05:13:04 -0800 (PST)
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-483c9c1f8fcmr272329585e9.26.1772543584305; 
 Tue, 03 Mar 2026 05:13:04 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48512692c14sm17392055e9.7.2026.03.03.05.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:13:03 -0800 (PST)
Date: Tue, 3 Mar 2026 14:13:02 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem
 device_init op
Message-ID: <20260303-weightless-crafty-hyrax-bdf1ca@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6eyb3mm7ilqztbmi"
Content-Disposition: inline
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
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
X-Rspamd-Queue-Id: B78EA1F0021
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
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--6eyb3mm7ilqztbmi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem
 device_init op
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 01:33:46PM +0100, Albert Esteve wrote:
> Add a helper function wrapping internal reserved memory
> device_init call and expose it externally.
>=20
> Use the new helper function within of_reserved_mem_device_init_by_idx().
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/of/of_reserved_mem.c    | 27 +++++++++++++++++++++++----
>  include/linux/of_reserved_mem.h |  8 ++++++++
>  2 files changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 1fd28f8056108..3a350bef8f11e 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -605,6 +605,28 @@ struct rmem_assigned_device {
>  static LIST_HEAD(of_rmem_assigned_device_list);
>  static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
> =20
> +/**
> + * of_reserved_mem_device_init_with_mem() - assign reserved memory regio=
n to
> + *					    given device
> + * @dev:	Pointer to the device to configure
> + * @rmem:	Reserved memory region to assign
> + *
> + * This function assigns respective DMA-mapping operations based on the
> + * reserved memory region already provided in @rmem to the @dev device,
> + * without walking DT nodes.
> + *
> + * Returns error code or zero on success.
> + */
> +int of_reserved_mem_device_init_with_mem(struct device *dev,
> +					 struct reserved_mem *rmem)
> +{
> +	if (!dev || !rmem || !rmem->ops || !rmem->ops->device_init)
> +		return -EINVAL;
> +
> +	return rmem->ops->device_init(rmem, dev);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_with_mem);
> +
>  /**
>   * of_reserved_mem_device_init_by_idx() - assign reserved memory region =
to
>   *					  given device
> @@ -643,14 +665,11 @@ int of_reserved_mem_device_init_by_idx(struct devic=
e *dev,
>  	rmem =3D of_reserved_mem_lookup(target);
>  	of_node_put(target);
> =20
> -	if (!rmem || !rmem->ops || !rmem->ops->device_init)
> -		return -EINVAL;
> -
>  	rd =3D kmalloc_obj(struct rmem_assigned_device);
>  	if (!rd)
>  		return -ENOMEM;
> =20
> -	ret =3D rmem->ops->device_init(rmem, dev);
> +	ret =3D of_reserved_mem_device_init_with_mem(dev, rmem);
>  	if (ret =3D=3D 0) {
>  		rd->dev =3D dev;
>  		rd->rmem =3D rmem;

I think you need to take the allocation of rd, and everything below.
Otherwise, your device, despite being attechd, wouldn't be listed
anywhere.

Maxime

--6eyb3mm7ilqztbmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaabeWQAKCRAnX84Zoj2+
dobdAYD53cfYylVyAMmjYQNu5L2HhH4nvwgXPsXDn+F4I5VP5R8b4pw9vf6buYC3
VoNwMQ4BfRUwUB8fZ2DXMX2IzVK3CXj6DaDP6OvnbvuzEI1Mw7ev9Mpzd14engew
qmADP+lGrA==
=WwGV
-----END PGP SIGNATURE-----

--6eyb3mm7ilqztbmi--

