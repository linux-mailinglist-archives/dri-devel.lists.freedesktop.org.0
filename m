Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CE9B807A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D70E10E8EF;
	Thu, 31 Oct 2024 16:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QMdQCxcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5E10E8EF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730393130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=182pqmxJKzOagD+mCIwZct3+5F1kCCVclBMGYB3B2rI=;
 b=QMdQCxcCz+li+qDqf2k3Vvp/3LQ96qN4yENUirBhJxWszhRj9S7XJ7HK6y/xqp6zZ1nVV4
 /o3MXHrouNuLBkTO3UkLsvJ7KLcXLjKZ32e9jo9tuTDJ/G2sGTUyr13LEM+fbrBD7KT0CD
 6cZulagzq2Km0kYeiA7hgbMwJnL83tQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-sx-0TFn4O_myBuE8RbnfnQ-1; Thu, 31 Oct 2024 12:45:26 -0400
X-MC-Unique: sx-0TFn4O_myBuE8RbnfnQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539ea3d778dso869519e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393125; x=1730997925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=182pqmxJKzOagD+mCIwZct3+5F1kCCVclBMGYB3B2rI=;
 b=v/q2+P/nAqnN9AIf4wTw4I7+D7ZpoiZKbGaFXFxQ3SDCuc2kkokrQlvZMHblITptiO
 CiGd12cgH0VbhvnDX11mQ1EYuvYzRsieZq3lzwOWg2ypKwiItJXWBakhlV5+0CEYer9L
 SHUeX3SfkaJSFpAkDkZx1Xpo3V/zNC8cymEgOaCcmL4oqslMlo0oc+MOE0SFrpO+Xxql
 Zsow3Z5OCIt3bN4Q6nB71L/zuvyKFfGaKNQKwFAfPoyyrT6szbelaqjXLNcKUk9SDzcc
 8Ffyi/i7vvTgD+WbLlIqs/Cerw2T5i+5loTlcS4OmblExc7gHN6ouJHVSObGAdohRyv8
 tlvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7DUpKTnrhNvFDc90rsrMR462b0eSedeBSbogeEls6qXQyXThC5n1lav3LJp5OtcrLr1dzcU28uk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT7Dqfcxz8Z/m1HYiaBlwNn1UgAhY27hY5/lQadQlybCkRfx0c
 wxA+BCupEvemussZ1T5pQWCQH8N+0jXPKwXp0I8NMMN5igPksBINqt9w5mEUHIm2yYmwNLgn+pu
 eM8gN+ppE42lI9RlZgYdkIdZV2NRGwODvyNnclgHqDdkB23hFsjrU1aYqI+xdke1XIw==
X-Received: by 2002:a05:6512:32c8:b0:535:82eb:21d1 with SMTP id
 2adb3069b0e04-53d65e1781fmr431495e87.57.1730393125214; 
 Thu, 31 Oct 2024 09:45:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHouLo3TF+7LJo+6trZy9gzmL/37JvOLD2BMFURyxuRnX3R17ZHSmy2W/qUwbYYI/LTZymFXg==
X-Received: by 2002:a05:6512:32c8:b0:535:82eb:21d1 with SMTP id
 2adb3069b0e04-53d65e1781fmr431467e87.57.1730393124704; 
 Thu, 31 Oct 2024 09:45:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d4342sm2618972f8f.32.2024.10.31.09.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:45:24 -0700 (PDT)
Date: Thu, 31 Oct 2024 17:45:23 +0100
From: Maxime Ripard <mripard@redhat.com>
To: metux <metux@gmx.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: Requirements to merge new heaps in the kernel
Message-ID: <20241031-bouncy-cute-shrimp-cd2530@houat>
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
 <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="e7ghtd5lwxlkxgfh"
Content-Disposition: inline
In-Reply-To: <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
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


--e7ghtd5lwxlkxgfh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Requirements to merge new heaps in the kernel
MIME-Version: 1.0

On Wed, Oct 30, 2024 at 12:16:22PM +0100, metux wrote:
> On 22.10.24 10:38, Maxime Ripard wrote:
> > I'm still interested in merging a carve-out driver[1], since it seems t=
o be
> > in every vendor BSP and got asked again last week.
> >=20
> > I remember from our discussion that for new heap types to be merged, we
> > needed a kernel use-case. Looking back, I'm not entirely sure how one
> > can provide that given that heaps are essentially facilities for
> > user-space.
>=20
> For those who didn't follow your work, could you please give a short
> intro what's that all about ?
>=20
> If I understand you correctly, you'd like the infrastructure of
> kmalloc() et al for things / memory regions that aren't the usual heap,
> right ?

No, not really. The discussion is about dma-buf heaps. They allow to
allocate buffers suitable for DMA from userspace. It might or might not
=66rom the system memory, at the heap driver discretion.

> What's the practical use case ? GPU memory ? Shared memory between
> nodes in a multi-CPU / cluster machine ?
>=20
> Is it related to NUMA ?

And since it's about DMA, it doesn't have much to do with CPUs either.

Maxime

--e7ghtd5lwxlkxgfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyO0HQAKCRAnX84Zoj2+
dsaIAYDSLs4vqC2W23GWmQw+nLt61ihhhwXON5VrB1bS7hVzaX7P2Gu1Vl0ygras
mpk+w40Bf2OSx3W0bmcLT2VATGEiKE8QZJt+N49J3WfSZwJOPvQjXudAGBe5XxGj
WjSuaDPXug==
=PFmP
-----END PGP SIGNATURE-----

--e7ghtd5lwxlkxgfh--

