Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13037CBE291
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 14:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933710E4BC;
	Mon, 15 Dec 2025 13:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PLrKnES5";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="o4UwW5Sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6151010E4F2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765807149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
 b=PLrKnES5VVMlwfJXVGQqt+vJ3Jq5vo3CXkiQIvJnoqHEOLIifjwd8v6cx6/yOmEWHVoRE+
 sBUdFDDW86LbQl6my7mXyEZwDvLK/4mKTFsU67UPlDoNIsZXuMZ9zXWWV3lPwUfZQSOKpY
 KEdoSpJGOthz/4r9ybQfMbeFV7XaYKU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-G8vmGs-aOKKboW-wRLb7uA-1; Mon, 15 Dec 2025 08:59:07 -0500
X-MC-Unique: G8vmGs-aOKKboW-wRLb7uA-1
X-Mimecast-MFC-AGG-ID: G8vmGs-aOKKboW-wRLb7uA_1765807146
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so35652105e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 05:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1765807146; x=1766411946; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
 b=o4UwW5SqnSnoN2WzxrRZAVB7ylcZR1eEjgNOu+6qmVm0Up4N63dYDai3BBwvuAgmz/
 brZDD9AB9tUg6hRTFo2n3sShi/dwvSgkVWCjjRdiDbhx8daXniszPVuKul79bhRceNMJ
 Wjp4MM7hMzkRgyKxkR6G+kTCRiMVDAMqTgE8H5kgH7cDHnBt+aK2iIoqfSniBw1Tpx7w
 rF24UPoh0XXQKri3f49iAt0CZWwG9noedxzfnmQF5rkEDbUSitWE4T74WYIA9byQ6Nlx
 dJD56M+/KzFy/kUlESkzqOcvFEfCjtQABZ+U5pDz+1vVux6URyCQhP9qUPOygrv/zUyT
 wpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765807146; x=1766411946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fxDTKwhMmaT8yFIgWPPRxzSP91DdXIWwn+nIL+l50K8=;
 b=hVxaJwgVwWi/RubxmoeRL0Pmhgh1IIt5rxB9o5+2gzNlnEVkKFk39e1iLZJmkKki0t
 BQka4FNzFums82wGnWGpzDYutF4PJhM+4P0KJ0xGupB9kfMDBU4l6yWenuf84tUAWEJA
 mSAijjYYvmmVMXk8DRufTCe+eaWNoGY/d4CaWq47nsY+yT8yn7Smtv31y3FTzvnmpOnw
 Xs7y85gJGjkCksxwpFtKy2WPCsAKh0LfPEw7BcmmfP88H5TMc3P/rcio6LQ6sFgDWuL4
 39xT4G7LMVeVCFKc+7bLsCiiFFlAZbxYwGedqirEjYRZ1SVmYd8cq4sqnXNvyYZhedJo
 O9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoSTcJvYUqx0/okqG5OvdQGm1akaqnE3ZsAPdJKLazQIUpdOqrHRVkSBI/sGbTYn0g3A2zMDXu5Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Tb+IsV1Wk67yWNLdMjdnxWfjGJ2kD0wtKhFAODlAjJ0nRy6D
 BW2D4qQOTNqhCf2RLs0KGYVY/bBRD/4FrIXOSv6r6x4ltKNCAtGFKwBMnJd3Zdjye7yXFTLAOzB
 H7EqI0At3zFnfu6iqGUVJ6/F0Y7dCt6wLNqxNhPxmGk/REn3oCUtzqshfa+AIsU3clbDWWg==
X-Gm-Gg: AY/fxX6DSGnER+6kj8pm8ySKx4e8kvH7PPZ5xJNsTbH86RBizt4pE8rMknGg92KdJS0
 MTlytsXhsErgzQ4sLaSIAPfrUW0lcjxuzBiB6VKMSsnUT/Tcwecq0m0hxDJuewCqTtHTUyGR3zG
 ieSKkQkcz4aY97JJX3cKelJVBF/+mJh8PR5BKCGZQIs+dROlMHcAFvOy8q17TsNqOhzebkWpQ1E
 BxQyvOsEPXXL/sCYS5fyMYPLkQF9inyNIvMZTspgygg0fP94Ouwo0l4AYhl8OEfBxzXlYPPTTCT
 p4r46yCDioh0pJ1eqS/WYbZUcClFUMFbPmPnDTBmwm/4ZwN+BAsnQzwd7YkfCQfAorfGPxMK3je
 bmRl1
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id
 5b1f17b1804b1-47a900bd6cfmr88610695e9.14.1765807146410; 
 Mon, 15 Dec 2025 05:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqFocdgwq3FCiLwNZCPP3yGh7X+/+A4X5ZrVtcOGVh8JXh/FPlhQAyGrD/wsm7r0PlrPxysw==
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id
 5b1f17b1804b1-47a900bd6cfmr88610465e9.14.1765807145881; 
 Mon, 15 Dec 2025 05:59:05 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4a3e9fsm187336645e9.6.2025.12.15.05.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 05:59:05 -0800 (PST)
Date: Mon, 15 Dec 2025 14:59:04 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
 Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l7ljucmjyhr7i7d4"
Content-Disposition: inline
In-Reply-To: <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
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


--l7ljucmjyhr7i7d4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> On 12/15/25 11:51, Maxime Ripard wrote:
> > Hi TJ,
> >=20
> > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat=
=2Ecom> wrote:
> >>>
> >>> The system dma-buf heap lets userspace allocate buffers from the page
> >>> allocator. However, these allocations are not accounted for in memcg,
> >>> allowing processes to escape limits that may be configured.
> >>>
> >>> Pass the __GFP_ACCOUNT for our allocations to account them into memcg.
> >>
> >> We had a discussion just last night in the MM track at LPC about how
> >> shared memory accounted in memcg is pretty broken. Without a way to
> >> identify (and possibly transfer) ownership of a shared buffer, this
> >> makes the accounting of shared memory, and zombie memcg problems
> >> worse. :\
> >=20
> > Are there notes or a report from that discussion anywhere?
> >=20
> > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > the moment and that's definitely broken. Any application can bypass its
> > cgroups limits trivially, and that's a pretty big hole in the system.
>=20
> Well, that is just the tip of the iceberg.
>=20
> Pretty much all driver interfaces doesn't account to memcg at the
> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> V4L2.

Yes, I know, and step 1 of the plan we discussed earlier this year is to
fix the heaps.

> > The shared ownership is indeed broken, but it's not more or less broken
> > than, say, memfd + udmabuf, and I'm sure plenty of others.
> >=20
> > So we really improve the common case, but only make the "advanced"
> > slightly more broken than it already is.
> >=20
> > Would you disagree?
>=20
> I strongly disagree. As far as I can see there is a huge chance we
> break existing use cases with that.

Which ones? And what about the ones that are already broken?

> There has been some work on TTM by Dave but I still haven't found time
> to wrap my head around all possible side effects such a change can
> have.
>=20
> The fundamental problem is that neither memcg nor the classic resource
> tracking (e.g. the OOM killer) has a good understanding of shared
> resources.

And yet heap allocations don't necessarily have to be shared. But they
all have to be allocated.

> For example you can use memfd to basically kill any process in the
> system because the OOM killer can't identify the process which holds
> the reference to the memory in question. And that is a *MUCH* bigger
> problem than just inaccurate memcg accounting.

When you frame it like that, sure. Also, you can use the system heap to
DoS any process in the system. I'm not saying that what you're concerned
about isn't an issue, but let's not brush off other people legitimate
issues as well.

Maxime

--l7ljucmjyhr7i7d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUAUIwAKCRAnX84Zoj2+
duttAX9Ga4fqCYlX2dwZgwnc6nPNr0N4H4lEcTNLVs1FO6VC/tdfQXgym9Jnci7z
b5tpPZkBf06sCKJuANIMHhKZwJ4dsNb9bC0X9JuS9CoEhy2fKPraCO3Vf1oezx0e
uJhMcKjuFg==
=SrQ0
-----END PGP SIGNATURE-----

--l7ljucmjyhr7i7d4--

