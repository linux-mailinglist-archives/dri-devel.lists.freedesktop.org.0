Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546E86B310
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82E10E67A;
	Wed, 28 Feb 2024 15:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BvQzL5bC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0900210E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709133895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=t335GacvZZWB9ZO5aGOP1T/vlOmDu6s2tX+hVADPKvE=;
 b=BvQzL5bCCRUgX/5GKRvMZ4ti7zodUpzKUjkib0AutHwwUmQteSeiAZxy1DBg8EO3eT6tPY
 1X/j+Wf4tp5R6Jpb26uKWgWQBJYOb0Cl6fRt4yajMlJZ25wShnipWaFCecNhOfps/3HtOI
 f9pvxdd0LThKq+ULuU0prj+ADZG4PNM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-reKdaKVOPl2vJKy3iYnjHw-1; Wed, 28 Feb 2024 10:24:54 -0500
X-MC-Unique: reKdaKVOPl2vJKy3iYnjHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33d7fcb70c2so457367f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 07:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709133893; x=1709738693;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t335GacvZZWB9ZO5aGOP1T/vlOmDu6s2tX+hVADPKvE=;
 b=n6WncuDoGG909C3oiJoolIYOXuMAz+vGMOhOEHZwdVImg1Y/KPzA9uF0kyyUkFzyIM
 60XwszuT4VstIUYyY5yonLEvY6WTD2ovfRdZ98AQgoDS5kXPojT5lrJFdY9NfknV8nZz
 KMeJ01HLc5SfJlUEd0SZgoqLeH2xTj5gMbP7ehVVtIhzmBBAvfZxkjnikNc7I6vYBsHd
 IIHoe4Rl5y/d9cXCmY5v4IuSLavXgUIg5g7xVIkgszRLHoDhZ1LWf4NoFhog0QZyU73q
 vqpuOHl3tmjJOIqaXav2X5dQaazoAB3ydaSczva079I1J+UpZQu3tuyduuSoMTOHEz3e
 IOQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMIwS3U0offXPKciIRtA/IHTQ+9gA8ahLVV4EWR8dTNNaMifTuru+5sXJCgHK+p0sT1mhoItHDompIOGpfYzyG/Geb+4+O6zw7Tx7fgmlz
X-Gm-Message-State: AOJu0YyJBzDBGDWpssHaFJ7I/eueyfVivMzf34izHgUZeFWrpvHya6R+
 jb867Zvdf4hfM566xkwdz9H+tH5ReV2tLidrZ5oyJPFpoEupFoN3oKXLjigzrjF9gljvjaxRWtV
 rmd4/2U+NXL3CKzl9RzadjJQvB2grR5P6fnMvDSB4Nxje1ExNhmgLDIwZcuycBunPhA==
X-Received: by 2002:a5d:4051:0:b0:33d:754c:8daf with SMTP id
 w17-20020a5d4051000000b0033d754c8dafmr2616986wrp.10.1709133893053; 
 Wed, 28 Feb 2024 07:24:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz4TYBPMDPkjBGoQZEc2FYZsGCfoARLYG/DpULb7Um4sgHyz+8OZKvQUvexwWeQKigI601uw==
X-Received: by 2002:a5d:4051:0:b0:33d:754c:8daf with SMTP id
 w17-20020a5d4051000000b0033d754c8dafmr2616967wrp.10.1709133892665; 
 Wed, 28 Feb 2024 07:24:52 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d4a89000000b0033df1dc39f0sm5116060wrq.4.2024.02.28.07.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 07:24:05 -0800 (PST)
Date: Wed, 28 Feb 2024 16:23:05 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Subject: ECC memory semantics for heaps
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uqpcltwn5uxrumgj"
Content-Disposition: inline
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


--uqpcltwn5uxrumgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm currently working on a platform that seems to have togglable RAM ECC
support. Enabling ECC reduces the memory capacity and memory bandwidth,
so while it's a good idea to protect most of the system, it's not worth
it for things like framebuffers that won't really be affected by a
bitflip.

It's currently setup by enabling ECC on the entire memory, and then
having a region of memory where ECC is disabled and where we're supposed
to allocate from for allocations that don't need it.

My first thought to support this was to create a reserved memory region
for the !ECC memory, and to create a heap to allocate buffers from that
region. That would leave the system protected by ECC, while enabling
userspace to be nicer to the system by allocating buffers from the !ECC
region if it doesn't need it.

However, this creates basically a new combination compared to the one we
already have (ie, physically contiguous vs virtually contiguous), and we
probably would want to throw in cacheable vs non-cacheable too.

If we had to provide new heaps for each variation, we would have 8 heaps
(and 6 new ones), which could be fine I guess but would still increase
quite a lot the number of heaps we have so far.

Is it something that would be a problem? If it is, do you see another
way to support those kind of allocations (like providing hints through
the ioctl maybe?)?

Thanks!
Maxime

--uqpcltwn5uxrumgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9P2AAKCRDj7w1vZxhR
xcseAQDNXhfizqmm5H2uN2EY4Je+TYwTRgFflpibGSH+mgadZQEA/ztn8Tq2H8na
rgGnZua3Ci5jMoTbhctf8Hh0oDZuOw4=
=pw5E
-----END PGP SIGNATURE-----

--uqpcltwn5uxrumgj--

