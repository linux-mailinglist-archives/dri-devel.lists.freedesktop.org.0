Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA1CCF555
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848B10E45E;
	Fri, 19 Dec 2025 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FpNhUZOU";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="t5QPGRMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617B10E45E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766139560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
 b=FpNhUZOUC81ql5ptF8dqy1pu+8kqqMuibACzm9NTcpudYVPO4s3KgGYyhcQIryOTHkUuwb
 7sRaaL5xzQRpSKu+7rbRJmBdRbscO2WzQqSezrRNFKQUrDHHiSOs+vJAqVN/iLciznZK1V
 REQMkToL5Lfc0HELFpkfj3XilWP9lHw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-n-lbXGaYPQCoKQlu3pzbCQ-1; Fri, 19 Dec 2025 05:19:18 -0500
X-MC-Unique: n-lbXGaYPQCoKQlu3pzbCQ-1
X-Mimecast-MFC-AGG-ID: n-lbXGaYPQCoKQlu3pzbCQ_1766139557
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430fdaba167so885733f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1766139557; x=1766744357; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
 b=t5QPGRMqpXi0sTk5tadxvum6VcT9CvqU/cJoAfs33bW0sXr2kRW3tUReXJfSNgHWRB
 XDg1N7DNWKZNW82vvAQwVGpU6xFrhVXt6o+hRqsEK94t1aD41qm4NnrC6cQ2AXq3Bnfn
 7SHOAnjvVCqBjF+V0608S8ySZqOvk+xjbTDFbsI2KgcehMQQ7zxwo9k2ZOjWCPYTA36F
 TuqnB4InOVvV3r3o6dQ5zJGu63IEF57iFZ1TMFgfqdq9nKHwdwrUXchUmDA/t+jXZDb6
 IXSkrFkMmKYvKZo2H5CrOQyNK+jpmIQ5Iubnt1EhRY/jNIeHZCrvvrAfugqZTLnn6ttO
 8Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766139557; x=1766744357;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+Sjh7UuYFLIovf/XxlzAidLiUL3k2dY2RdNBAzDrDc=;
 b=oAqa5lfpbrQatlQeG2Cg6qDge4eU3NhGLW6qv7lIRUM+JPH8HXQ8wMM6nuTHHotst8
 VT5sOlw2M9EU/vR5CAGjZqkWvGbQ9G0e2m1trNCPmXTRXhA6YNsr/wh6fFUl4xdr8X0P
 cLUNS9ezc82sks5PkeHY4Sd5Lzoxcqil7++ZyIdogIDBAWXUXxuYsx2DpoSJrhwwAf3l
 MAfRDJOOfSaMnUjWtvta7BK1XEw0epPwVF3KU/Z9IC8XXjoBnZ17MQPgU62EHJf2sOE6
 jgTdVZe74os4sBHhK3lArsV7oMeTSYxtml/l8PPaMA66F2B62ajFeUohLXgGwl6Azl0A
 QjNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHpWouwyXkM51bZu4z9jbnCpdN5zEkSoPNA0sAGgVHU4bKrfay14C8Ja4CJLSspFgOr6CBpE6ozHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/Zjxel6VumeNdpkByBtbhuubTwvpccvBXnXQtIwlDyCR2a+Kb
 SS4V4dwd1tnOQtWGQLHMhhgm7UBI25YN7qNq5S11CWNl3fuaOn3zoihXdG6GxF0sfzfJ649uvqz
 5WvQ4D9lAMWzm2qqs8jtW4Uz2W5+TjvmsIMH4QEMqo+aK6VWtDtnE//cHmk//O3eG8xPbJA==
X-Gm-Gg: AY/fxX5w1+PRZJ+aKVEPfV55xFlAbFeabEniq8GOTJWDOY9NK4mcfS26AQrM7HEwdbz
 sVlM8CmJN5JyyZL65AMYF25vk1TRDeOCSmsGYR8YD3kyfcLZXMM7JOSMpwdivMUjQeO+lPP2+0z
 WcZQ11E52KR7odAQoFVAmb8JdQHfmUYqLLH+TBITILfWnSY6kesM4n7QmLDC3/EZ4bGL1yrJQAO
 4s8rkrsY6KYEkh+IyO//WPhPO+gV2J5bA+qnslXVA9MqKXTSZXh0ixmjnXv9l+4dAjZl8cNGCJW
 Oc7ECUGXaLSN4M1mJASTPPdioikl7Wc48dZlV/6PplwqwRemskyWXG3OTr1YUg==
X-Received: by 2002:a05:6000:1868:b0:430:fc0f:8fb9 with SMTP id
 ffacd0b85a97d-4324e4f9458mr2556880f8f.36.1766139556960; 
 Fri, 19 Dec 2025 02:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeh4Zbkr/D6P7HWKArF0jdwKfFL+l6ZrJJ1FavgfXi5moav7Q7vb1/nUNiIeSf8i+9DMCNLQ==
X-Received: by 2002:a05:6000:1868:b0:430:fc0f:8fb9 with SMTP id
 ffacd0b85a97d-4324e4f9458mr2556840f8f.36.1766139556391; 
 Fri, 19 Dec 2025 02:19:16 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa0908sm4147867f8f.31.2025.12.19.02.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:19:15 -0800 (PST)
Date: Fri, 19 Dec 2025 11:19:15 +0100
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
Message-ID: <20251219-precise-tody-of-fortitude-5a3839@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4cy66ljvjeto773l"
Content-Disposition: inline
In-Reply-To: <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
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


--4cy66ljvjeto773l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

Hi,

On Tue, Dec 16, 2025 at 11:06:59AM +0900, T.J. Mercier wrote:
> On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.com=
> wrote:
> > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redha=
t.com> wrote:
> > > >
> > > > The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> > > > allocator. However, these allocations are not accounted for in memc=
g,
> > > > allowing processes to escape limits that may be configured.
> > > >
> > > > Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> > >
> > > We had a discussion just last night in the MM track at LPC about how
> > > shared memory accounted in memcg is pretty broken. Without a way to
> > > identify (and possibly transfer) ownership of a shared buffer, this
> > > makes the accounting of shared memory, and zombie memcg problems
> > > worse. :\
> >
> > Are there notes or a report from that discussion anywhere?
>=20
> The LPC vids haven't been clipped yet, and actually I can't even find
> the recorded full live stream from Hall A2 on the first day. So I
> don't think there's anything to look at, but I bet there's probably
> nothing there you don't already know.

Ack, thanks for looking at it still :)

> > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > the moment and that's definitely broken. Any application can bypass its
> > cgroups limits trivially, and that's a pretty big hole in the system.
>=20
> Agree, but if we only charge the first allocator then limits can still
> easily be bypassed assuming an app can cause an allocation outside of
> its cgroup tree.
>=20
> I'm not sure using static memcg limits where a significant portion of
> the memory can be shared is really feasible. Even with just pagecache
> being charged to memcgs, we're having trouble defining a static memcg
> limit that is really useful since it has to be high enough to
> accomodate occasional spikes due to shared memory that might or might
> not be charged (since it can only be charged to one memcg - it may be
> spread around or it may all get charged to one memcg). So excessive
> anonymous use has to get really bad before it gets punished.
>=20
> What I've been hearing lately is that folks are polling memory.stat or
> PSI or other metrics and using that to take actions (memory.reclaim /
> killing / adjust memory.high) at runtime rather than relying on
> memory.high/max behavior with a static limit.

But that's only side effects of a buffer being shared, right? (which,
for a buffer sharing mechanism is still pretty important, but still)

> > The shared ownership is indeed broken, but it's not more or less broken
> > than, say, memfd + udmabuf, and I'm sure plenty of others.
>=20
> One thing that's worse about system heap buffers is that unlike memfd
> the memory isn't reclaimable. So without killing all users there's
> currently no way to deal with the zombie issue. Harry's proposing
> reparenting, but I don't think our current interfaces support that
> because we'd have to mess with the page structs behind system heap
> dmabufs to change the memcg during reparenting.
>=20
> Ah... but udmabuf pins the memfd pages, so you're right that memfd +
> udmabuf isn't worse.
>=20
> > So we really improve the common case, but only make the "advanced"
> > slightly more broken than it already is.
> >
> > Would you disagree?
>=20
> I think memcg limits in this case just wouldn't be usable because of
> what I mentioned above. In our common case the allocator is in a
> different cgroup tree than the real users of the buffer.

So, my issue with this is that we want to fix not only dma-buf itself,
but every device buffer allocation mechanism, so also v4l2, drm, etc.

So we'll need a lot of infrastructure and rework outside of dma-buf to
get there, and figuring out how to solve the shared buffer accounting is
indeed one of them, but was so far considered kind the thing to do last
last time we discussed.

What I get from that discussion is that we now consider it a
prerequisite, and given how that topic has been advancing so far, one
that would take a couple of years at best to materialize into something
useful and upstream.

Thus, it blocks all the work around it for years.

Would you be open to merging patches that work on it but only enabled
through a kernel parameter for example (and possibly taint the kernel?)?
That would allow to work towards that goal while not being blocked by
the shared buffer accounting, and not affecting the general case either.

Maxime

--4cy66ljvjeto773l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUmogAKCRAnX84Zoj2+
docaAX97oRKC47EmRfraR77g2nPKkhNGbslMpV97iGWZDw9W7qVFZSWxAm3ZOecR
fdkqIH0BgJFWYMfMj1oLwlijaHOD41ueRI3Yd6gM9FpeT9i1TBtqRQpdmR+3tIkc
JQn/bUAXkA==
=H3ZY
-----END PGP SIGNATURE-----

--4cy66ljvjeto773l--

