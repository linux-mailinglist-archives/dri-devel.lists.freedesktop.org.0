Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C108BC77776
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 06:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902A10E071;
	Fri, 21 Nov 2025 05:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lbd2pSYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4AA10E071
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 05:52:20 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso240675266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 21:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763704338; x=1764309138; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f3AJGPP8zMc+R4UOzL+aeZF1qHpaPM6Ue1kyKZrrIYA=;
 b=lbd2pSYmm1v7ukOwWITW7hiBRPAoyo3KWL6ew81SglJ2SY0V7gqwIQTQekouinaX8f
 TxkzE5iq8lBaGsow8iKHLAm4OURKeIQ9V7uaaNL/nJ8+ln+WCuaEsPMamY96cBF6xgh6
 YJnkXhL8tohFyz+f7c6GDA71Hu6U8kEU3iTZG3YGQ5n/YPv8Xib5NZWBlbuoS4hil8jM
 SmFyzn2Cdxc1fFPltS/sqO0jaxnfBekjzOt1ke67gUTNewnOnmULc1CLfT0drM78ap/n
 sDqkKApvI4RHZSsbRIH4mTLZaY5NhbIM3tF65UY3zDVnq9ya/qLBsN3RsnAJE0f/gwQd
 6pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763704338; x=1764309138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3AJGPP8zMc+R4UOzL+aeZF1qHpaPM6Ue1kyKZrrIYA=;
 b=HukdBZiGzDJx6fNsgJfXdaaXhHj/vKEpH5mKZa7tl8AIsdFHaUnFioLU0PGT4dktxr
 elsHTkSwENNOUvFVHaBZMnT9g8yT6D8honwop6JOv6sC1X6p3IOHiJdD9G9DyQ+8lj2b
 L/2vz3LAfJAUE4CBLdbmb4W8PNvPUuNl6CHrxxAW0oSgTYLP6K97JZCyFfNC/LTRYx/0
 xRKWmGOeYMJQYrAQmyGnbuGrWrF8K1q7eIis053Gb1o7mKbYwjgOW8ekbc3oGi03+Mae
 hB8aHnoBofrjGoW7W3ucthJIU1FfRq6MhGAbfw+JneeFmVQPvcyVGrMU0xiBqZZOTFMc
 EIiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXORwg7AjliB+RPoE45mkeY6X4qEazdHh8NZJqK7tDQmeGyMtCirrz24FkUuwOxJBycYk3SSo+WxAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze3Wp7fwamIFxB3GM1pmrhZHhmIOimv0f5T0rPyLTYHw8ipppV
 XHVRMdDjUhD4jdengUTAfe95mEUYMCH9cd7MHr7Hnsq0MOrkAaxSATGpwn9YSgPO4iZhRAWptWQ
 6kXc7fiZf66UVTKHdTcur1SzCD7TD+5o75U2YX5rb2Q==
X-Gm-Gg: ASbGnctGBskSBvSxfc3OSRX2aBx3z4/E1l+ZzdiGEBqw+ROklO8NplfFC/LwYB4Qa0w
 u/tSGoB4PcRxek00dSe77E54mGVO8XTC6R5BK1iOORhXC6mcxdeH8+0hELwvneQf1QXTSVLwMwQ
 HA3+8GJt2Wz+nCsG4fdRV3htpXFGUUStJTGi9zAdlZrjvlk9yDB1+n2X9ZNHH9aQkWCdee3OgvG
 9d8tYSjIBNItbFJUVscTgBp8yhaHvb/tFB3TRmOCtHRfK3gVjOIuuefQcVOGRNa/o52JnnnwfxO
 /iIPFw==
X-Google-Smtp-Source: AGHT+IH2Ft4P3PaBHYHUb9eBoowl1r0fF++S8Pm7hX7zw/Psj+ebZMqK+8HVlDkHZMDyBQFS0hAWL9JagTsIi4EtO7k=
X-Received: by 2002:a17:907:9611:b0:b73:8b79:a322 with SMTP id
 a640c23a62f3a-b7671549d5amr89779966b.11.1763704338528; Thu, 20 Nov 2025
 21:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20251021042022.47919-1-21cnbao@gmail.com>
 <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 21 Nov 2025 11:22:07 +0530
X-Gm-Features: AWmQ_bkvqJFF6U-BXLQ5aYDwfQ_Tm4IRMssNoeoYXGILQhoCtvIipXPadVOiAf8
Message-ID: <CAO_48GFhmJoivvaPFFxyuA+UH9woC1JoJE4=HeKa2nmPGA53-g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Brian.Starkey@arm.com, 
 benjamin.gaignard@collabora.com, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, jstultz@google.com, tjmercier@google.com, 
 v-songbaohua@oppo.com, zhengtangquan@oppo.com, marcin.slusarz@arm.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Barry,

On Fri, 21 Nov 2025 at 06:54, Barry Song <21cnbao@gmail.com> wrote:
>
> Hi Sumit,
>
> >
> > Using the micro-benchmark below, we see that mmap becomes
> > 3.5X faster:
>
>
> Marcin pointed out to me off-tree that it is actually 35x faster,
> not 3.5x faster. Sorry for my poor math. I assume you can fix this
> when merging it?

Sure, I corrected this, and is merged to drm-misc-next

Thanks,
Sumit.
>
> >
> > W/ patch:
> >
> > ~ # ./a.out
> > mmap 512MB took 200266.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 198151.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 197069.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 196781.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 198102.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 195552.000 us, verify OK
> >
> > W/o patch:
> >
> > ~ # ./a.out
> > mmap 512MB took 6987470.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6970739.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6984383.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6971311.000 us, verify OK
> > ~ # ./a.out
> > mmap 512MB took 6991680.000 us, verify OK
>
>
> Thanks
> Barry
