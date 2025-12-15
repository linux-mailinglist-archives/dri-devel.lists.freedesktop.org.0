Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675E4CBD69B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 11:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF05A10E2A8;
	Mon, 15 Dec 2025 10:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N8GktVvJ";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dElC3in0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FBD10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765795906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
 b=N8GktVvJD0dyutpOHypH/NS0GP+u2GTnGqpRva7vThRdkMczNk6PbAXQ9z5S+ghrgG1Eb+
 Yl5d21i3Q9sZPPmGtZj9ClrYLUw1Jm7BI7y2us+lV19G5YKVm9O8asGxOsngUkNCMZ5riC
 w6V34aVCIUIlA2jqMwbKeIOQbGH+wU4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-aczZJqDSO4eeJ1sINczeCQ-1; Mon, 15 Dec 2025 05:51:43 -0500
X-MC-Unique: aczZJqDSO4eeJ1sINczeCQ-1
X-Mimecast-MFC-AGG-ID: aczZJqDSO4eeJ1sINczeCQ_1765795902
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47799717212so27313915e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1765795902; x=1766400702; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
 b=dElC3in0GoWw+i+OTfC3hOkfZ/Dt7Lv/AXWot+tpVEA3uKQJv+lEuYGf65PzAFUtJ0
 XEPvYl9SdGupnyEjsB9JhpeU3HxmeCYQB0m7nG6mZZ/zFkrj0KeRXuc9zLHhBemSyq4f
 Zl8/Z0LBHgs9BFGSbjgmM5LIeaUFEOzmA24jAkN6vM9xO9IsJ188ksdNU0T7vBxZyylL
 KTGnQx54B5LHJACL+AynUtTZf7l6ul69MRr/8JOyn2z15wClUe+Vk07SRPnO9Y5SG8TN
 GdOFUv0cABBvdrjwN857/yXKMDqzmoiaYJPb3hMWsCPmk/Chx8cThzsS0M6if5Ul0XjW
 7IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765795902; x=1766400702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkCUCfLiLGct9+NKSop/UGDcclTFONtKAWihXF5F0gs=;
 b=EUxwrMDfh4dz0XOjPR3lzyHuq6x65Aqle+zqdE3ikazj3IILkyGScBwQ8LOMq0Y8Oq
 urzXoSCQk0GW4hrloxYfZXIocBmtl2NTHMFmNRz2VOylGj3zIkVUbxPlRFZp4CXf4gGW
 9C+VpcHMQqq4LbMMqHpDnqNSrzVu+PMmhCosPcfFv3xwclVHi7o4GBC3mIBkCO0wxKv+
 NyJ7N4n5p1QqUREjZBawGVjen1jc/ihCi2EZQKg7Owh7tC4vd328CqJibAT/HVIYlwRF
 mA5RhuspCzrx5P3SJyX4EcdCNdrT21d5rap8gvkmEm+I4pRkDiBHrlubQ16ui1cpA97H
 6L1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqiQPog83F7YH/iCX/LCle6Brs/rA6B/6l8FoeStgPZuXi35dQ75qTqxHIFvA7cKJrZjaPhzLiF/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuUxv12u5A38QX4k0UUJmxZ5FOP6KdYoirktQ1s0JZYZIHj7vS
 RHNU8tFFiG4ToGieS5WfDg44W0ecq40D83t/bDx0CkKveRmAg3pkyJVw1UGMGOpPKKdt0v5pWLJ
 4EzUdfETpFF9pBgUAAvo1N5tfOvkXgC9R9qtR5vnAyQwrdc3+0UlkrNqsgGHB1tVnrd14+g==
X-Gm-Gg: AY/fxX69o4MDzQb/G4wccUu+lmCNicT9I/7c1PCmwNHTBIloLhDf9pVUpnGLax3W56p
 plSi3RB3xGHjH3wsG37KGpSro/v1uTxPTl13rIBblRmcxT988XLpbsFx3VhwZBDMHK7Lc/RIaei
 YIqu/nrQZRp58nt57HDvRCxQuHj2h6mfpGKvTEnOJxuha7/U/mKVhQ82QZU6hqQ3G+6tHv/W2T7
 aXeHWbGYkwWIhwl5ic5i3TdpqRC7tBK81xhnyX7zsyKkcWtGkWOtn/z7q37eNtWW33hIw4IvA/b
 4LVQFCYGTxoRL0vBWB3TkMhbmbGO47YfwoFI4AaaIYMCIgzNu+0fdYosav84wsVtuQUPMv9FZv7
 wwTxB
X-Received: by 2002:a05:600c:3151:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-47a8f8c0a52mr119367045e9.10.1765795901751; 
 Mon, 15 Dec 2025 02:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsLOxvt6hxpjORw35OnVP+adHLtMmhH7jm5yhL+wJY2rwByI4ScjvlRVSyfAXmLS6E1u9MfQ==
X-Received: by 2002:a05:600c:3151:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-47a8f8c0a52mr119366655e9.10.1765795901232; 
 Mon, 15 Dec 2025 02:51:41 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6f3e78sm69652615e9.3.2025.12.15.02.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 02:51:40 -0800 (PST)
Date: Mon, 15 Dec 2025 11:51:38 +0100
From: Maxime Ripard <mripard@redhat.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u7gkqqtkk3esv3ha"
Content-Disposition: inline
In-Reply-To: <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
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


--u7gkqqtkk3esv3ha
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

Hi TJ,

On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.co=
m> wrote:
> >
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> >
> > Pass the __GFP_ACCOUNT for our allocations to account them into memcg.
>=20
> We had a discussion just last night in the MM track at LPC about how
> shared memory accounted in memcg is pretty broken. Without a way to
> identify (and possibly transfer) ownership of a shared buffer, this
> makes the accounting of shared memory, and zombie memcg problems
> worse. :\

Are there notes or a report from that discussion anywhere?

The way I see it, the dma-buf heaps *trivial* case is non-existent at
the moment and that's definitely broken. Any application can bypass its
cgroups limits trivially, and that's a pretty big hole in the system.

The shared ownership is indeed broken, but it's not more or less broken
than, say, memfd + udmabuf, and I'm sure plenty of others.

So we really improve the common case, but only make the "advanced"
slightly more broken than it already is.

Would you disagree?

Maxime

--u7gkqqtkk3esv3ha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaT/oOgAKCRAnX84Zoj2+
dkxfAX4ve8AMEp5rGVxqWdx7mP32EEUlTe7oGqgQsZGk3gdf9G5zzO3162M7qdiD
3jlaGbUBfRHozRNiBmCNTKcExXO6w9Ygjiy0DBe+Vt/PkW0DZjejxbuLLNtgH70W
djcO8jaBRA==
=lq40
-----END PGP SIGNATURE-----

--u7gkqqtkk3esv3ha--

