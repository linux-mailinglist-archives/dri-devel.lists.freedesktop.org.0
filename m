Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B08C7AD2
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D6610E1AC;
	Thu, 16 May 2024 17:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XLp0jOfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502E010E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:09:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41ff3a5af40so3525e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715879365; x=1716484165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQzIVlQ1gpgjynAxQQJO0srkRwgd45+RmoC324lNlhs=;
 b=XLp0jOfjLvuGp84Qjir0HJiaFwWupc1zxJ4uIkGxgMXMV4Mq78FOkGPO26DFJJZA4+
 9zF/BnZCpkOSFerZ82PD/uyjBebOpLiWeDO7owx6HnOsYXAm8PSWwinQAoTcPaGYM9XH
 asdmASXrKQ7gfCoGmyCa6PCSiyN24jbco8tPxN0up1Ycw0NLAPu6hpY2dlBeqIhW9AIl
 PTdSr8N0z47bAaspu6mwa8O0Zg59emLlCDak24IAEibDXYMFsMvo84mzdpH3gM7CNxlY
 1OzEWn1yldOxFtI5nvzRBMR786SUwGxp+c3oEodfOyYMUK4N1DOQ+7EsipOMGlMRYEgU
 crcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715879365; x=1716484165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQzIVlQ1gpgjynAxQQJO0srkRwgd45+RmoC324lNlhs=;
 b=fpjPx2Qd2XK/S9xfYx9wexBNK3xPx4SKz1CGzr8kNRTa3ImKC36xSqmpFqZ3AGd0eG
 tl1IVgAf5KTMRm5g66PmsfiZCvpSRWhjpkpLO/8Fuz0yDtync8JNvmu4u/gEX/7AqHz8
 RDT2t1OjV3IKYr6I5RmXwoqQ+oNdheWH+PyHg5PjbUpLTT5Vb+dhbRk6xpyctlit8xtG
 Ss4OF7ecU9qhhysSLtIl6Ekkh1QF1I+yuLoLkXmOXxOFyoy+PQ8d3WoREio1Wl8PxJnc
 3Ydc6vg3zZ6hmt/w67gecopE25j7gRCC1+ls1ul2CtwlQIz2rcJciWgMJ8msJT8MkVzu
 rMlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5e0h4QE7usw2mQYZMDbkCDey1bLbW1IMJJL20W3GvvOHNk/rFtx9sOeFeoLsKlQp5OwUwTQp5JceTTs7TvSj4JHcQOS/mnxIEm9Ph8x0p
X-Gm-Message-State: AOJu0YzeCFzPZbPKC0PcdVDAu9d+rFK8GeC7heMh+Qn7QdUdXKRQQYo0
 CUUU4EcA93AJXfxPY0YeLzPAU68RAXL1ovKlALWlnZYhJdEfOOio8NZ/aZxe5QNshualzezfVWU
 /YVINWflbrtU0bDOUKvxeIRLWQ7qOssB1rF4=
X-Google-Smtp-Source: AGHT+IEbIHaPpQUwsM2bGOORaLwAAJk/9w7y7+ELgEsY9rlNpgazkzZDH+eXj4VRQX5ZsmyvpnueMFsMKYjhmj/eslA=
X-Received: by 2002:a05:600c:5024:b0:41b:4c6a:de7a with SMTP id
 5b1f17b1804b1-4200f8bbe7bmr11807905e9.3.1715879365312; Thu, 16 May 2024
 10:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <20240516-truthful-fair-kudu-adb6df@penduick>
In-Reply-To: <20240516-truthful-fair-kudu-adb6df@penduick>
From: John Stultz <jstultz@google.com>
Date: Thu, 16 May 2024 10:09:13 -0700
Message-ID: <CANDhNCqyh2ZKsOyb9rLBpUZZ+VTU8M70XBQC3aC2=G_v8LqciA@mail.gmail.com>
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
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

On Thu, May 16, 2024 at 5:22=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > I apologize as my worry is mostly born out of seeing vendors really
> > push opaque feature flags in their old ion heaps, so in providing a
> > flags argument, it was mostly intended as an escape hatch for
> > obviously common attributes. So having the first be something that
> > seems reasonable, but isn't actually that common makes me fret some.
> >
> > So again, not an objection, just something for folks to stew on to
> > make sure this is really the right approach.
>
> I understand your hesitation and concern :) Is there anything we could
> provide that would help moving the discussion forward?
>

Mostly I just want to make sure it's discussed, which is why I raise
it as a concern.

Getting APIs right is hard, and I know I've made my share of mistakes
(for instance, a situation that very much echoes this current
question: the *_ALARM clockids probably should have used a flag). So
I've found highlighting the trade-offs and getting other folk's
perspectives useful to avoid such issues.  But I also don't intend to
needlessly delay things.

> > Another thing to discuss, that I didn't see in your mail: Do we have
> > an open-source user of this new flag?
>
> Not at the moment. I guess it would be one of the things that would
> reduce your concerns, but is it a requirement?

So I'd defer to Sima on this. There have been a number of heap
releated changes that have had to be held out of tree on this
requirement, but I'm hoping recent efforts on upstream device support
will eventually unblock those.

thanks
-john
