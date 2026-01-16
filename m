Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C3D38955
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 23:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FC410E0FB;
	Fri, 16 Jan 2026 22:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QrS+mOiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DCB10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47a95a96d42so6595e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768603017; cv=none;
 d=google.com; s=arc-20240605;
 b=R9IWp5iomuF5zSMNlorXXRLiK7zsLXdID9INA0N5eyGaP5E1zmD96gBZ431fT0VL+m
 k/lE8WKSR3R9SoNBRxLXp1KkOO9pkXStN2lq+W4P2dBUt2xjwg8G3P524GLDEqUdxujS
 fiRcPIgvnk8+uXdEKdbrQ0iokC+UqHGsS/YntSwUFdAKaJFcV+/Og8MIYQH6YQ0T0lFh
 i11R8yv1Mfdgx1uPvXSSpIBS+GFQrbSeGTZBYmaC/PNpSOiy1E/YV7+JLuIZ3gF4yN+1
 AujtIrUBHS1sYqvAgH4wcmMSCx66STAAyM5mgaKCUVItF580p5pfsfc4aOmhGMTOIcLd
 t1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
 fh=OIv+PxBVQQMv2uYXMF9eK+6JYmXRV9V2GI1ryuuPzXg=;
 b=TvQ3dGQjzenO8jWgXuUzXw6JxyURYhDSNpvijNjFyE2JH0z4VRxCsMsSE1y5YmBuBI
 eAugX7pC5K4Dv4W/KJv+j3EZzgFW1kMLEewk56ay/KCvxpDECGfOjrpPdLRV/FoYzyFf
 XfQ/sNf6Xw1kL15aOm1bz5o3Z8ROzACRSl9DcBLHC5JTkRRdZfQyHILs/1BD8MakP/sS
 yfpY+Jr1N0u1hpjNELbUcFHv8ZlfE5UyQ23w/QHjRIZg8uJiFutMm7mtYPse0pcO8lwM
 mnxUB7mjdRtDPRhQhPIvVYVAAbBTSm5iyJB2BoVldgwZV6zP7e1dk1mSC8OhIwBGrfqS
 2FlA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768603017; x=1769207817;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
 b=QrS+mOiJbebsID6x7vjXRoqAixW8g/utyf9U2+idnOgaaK7fafsHke1G1sE/zS0EbW
 LXbL2+bi9OXvYhxiQYZ5d8t452uLDnKN3Md98fmJsgQ/mjUS0jUsI8qbXGtoUsEr3xJz
 JSx11jYSoBkjjVe0igNzic5ikvpzfBC3vl4bdfd0w94VqhXAh8bNxvADCQSKJ1hdYN/I
 Z8glGsrbRdfsTF6jJPgEhPTFg2dWHh5D4lR/8NGIh0tssyvWhEi3rA0RAaKdcIYtySuK
 YAHvxOMsW65U4KKxQPlBpsBUatt5exrw2Go/wG/8EqHi9k85ak926W7d6h2zcqFheR74
 zCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768603017; x=1769207817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
 b=qsfF8xoM6dK7nWSdfbZHQCqKk8lewIGZIv45VnkvsZumSW1zKVigNokm+URrHFo/MM
 pLJWML9hlgmUShgcG+RLQN1UlBhahoUbkPxGKlEe/yNJEaLjTbhSqpIuFPIr756CU/Ct
 NA2wft6Yg3nuUu6r1kBER8aU0Fg6YL1PbpORIDUqLnjdmWmQ53smDTeXMel7JsBCfVNT
 SvwwpNWNkMjaQ2Q73V7imoxW0t2fD75JRnnocN3mIPffjh3u1Fyxc6sTn2rzCTPv4XYk
 Ou6SxejWUpUAblC0XGh4XGDJHxwT1Nihf4vBoE64L0NuF09ZP5rlhjErXqNm+DZxGIBO
 PAOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFjTBIhU8zjmFW9YuBk4UwFHBIEN5DxiiyitVVsdyYkdJxAZFX6tbgsGS+ryYlTmBzgCVf/NIXQbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD6Me/G0aoBLUU2jmX5hxCgQgXRqk6+FhWzyjpDOG9KvsY6+9Q
 3DDLE+OGwP23OyR5N5U1kX3GCFYltT2UY23L1I3HJRm7y0tBYdWyMkKF4QGxd34p3kP1idQtP24
 ZsIi9i3XpRoR8ngRfxU93hcSqMIwKM1cuhOMCheCt
X-Gm-Gg: AY/fxX7/02AaTtkv/lrJ3K+Dh8xyIy2wZYN0MlTRLzQ03hVx117Y/mlapsNvMbH2NWc
 YrxcRwhAIhqO8mzwDgXdYTkhJEgb4K4gQDsrtOX4vXyEUDoaNaCCb7gVzsf3vzuJ9OWEa0uZH1q
 l567mV/ZSPyTiHYioZRXpdwIavjwxSbQCChDYWM9zPeHyQ8yLFFYVGmIwbh+Lwmfyfm3YmeQBLo
 AX+HTgfDNzyuuSjAlL90QMrWu4JKatcnswFWS5RXbqgCS8qiyWph0LaLGLbUg4J6hJBfEvlEtxG
 vHn5et7UsnzqiarcHM0BZEEIN04zYKLdH2ng
X-Received: by 2002:a05:600d:111:b0:477:563a:135c with SMTP id
 5b1f17b1804b1-4802781fa1dmr195595e9.0.1768603016926; Fri, 16 Jan 2026
 14:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 14:36:44 -0800
X-Gm-Features: AZwV_Qj0Dz4LSBCQIqyfkjH-g5gAHdJ-h5DhHq4dUYsXKP4PwrirabqAetr4Apw
Message-ID: <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat.com=
> wrote:
>
> Add a parameter to enable dma-buf heaps allocation accounting using
> cgroup for heaps that implement it. It is disabled by default as doing
> so incurs caveats based on how memcg currently accounts for shared
> buffers.
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
