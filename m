Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB59A9CFC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D010E61C;
	Tue, 22 Oct 2024 08:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DEPCOMPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E06710E61C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729586324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=OCXXwPDjBusbhR6au45ZUYnylB504NYSSRvZEaxUgj4=;
 b=DEPCOMPlmCv4vNp/Zk1wHemcjD2K3S2uEcIL2DHqlefIOc8EbdVuiNHU/wslgp3PAwrtcW
 mbvan7Qz5mkv4hc6D9lfCWdGW63oscvoCi/WTQKUWc3nrBmVvq+zZy6g+i/pvmiSI3psjh
 iPMZrUVoLSz5hD9eYw11/pEyJf6oWcE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-L4UO0BCgMoykAUS4botnmw-1; Tue, 22 Oct 2024 04:38:42 -0400
X-MC-Unique: L4UO0BCgMoykAUS4botnmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4316e2dde9eso23726305e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 01:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729586321; x=1730191121;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OCXXwPDjBusbhR6au45ZUYnylB504NYSSRvZEaxUgj4=;
 b=PrQ15jh/XeALvk3Rb9jqCTbjBn/C05jUKO1zDotYrCNlErsl/naMRiSV6ry1S82pR7
 zVsDyyoNakpQ/ZIxyPUohFOSunJLmSegXaJ8PDhJWEKdQBZfU0tXjLzmlB09ww3azV8l
 qXDOV7xy2dRabxkFL/gV/DZbTM7HMYPoNPs7srixBrFACM+MPS2Szt26rpjxoByzVkFe
 iO/HSx337o55gRILfVBnFg1FJqGfoJITzquAypEWdPHBINEnh0Esm5k2FhXl51ZLykAa
 73aRpLIYW3saizCGFropsDQkG5X0CLT8PAawzSqsoSNbJUTlZ5YSKi6BU0HAHG0HyJSs
 Liow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU/1pFCvjX4s+Qz8EQySxrSdgUxngN96A1S9XYnPJyMdpdA++qI7bPVO7boF6/5TM5f4U8GTjTm90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1kGGmmni1pFCTbcG4fIOYQ43kMGna1WZGa2v9WtpDA294YRCm
 wY6QQ9vmpMpg/B0Y4E6gT59VCfOt8+f+pP//Mvna5XdFIS+3HIwytZo3IYZq/VsddjZRlPpJbjx
 3dsLTK62vrkVi8/UcRJ3SAUxL39oZUEeXUJSPAi1osxqnNAXMQKH5ztlVzuDmvhH1Rg==
X-Received: by 2002:a05:600c:4e12:b0:431:4a5a:f08f with SMTP id
 5b1f17b1804b1-4316161ee27mr124495585e9.4.1729586321176; 
 Tue, 22 Oct 2024 01:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbBWOU2Nx4vFSYQiZrLPFEBJcR3dEePc/jhzMJIAF2UjsfwsYkjsK7i1T0LhglK0o3pCuU0w==
X-Received: by 2002:a05:600c:4e12:b0:431:4a5a:f08f with SMTP id
 5b1f17b1804b1-4316161ee27mr124495345e9.4.1729586320618; 
 Tue, 22 Oct 2024 01:38:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f58f0efsm82150545e9.26.2024.10.22.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 01:38:40 -0700 (PDT)
Date: Tue, 22 Oct 2024 10:38:39 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Requirements to merge new heaps in the kernel
Message-ID: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hsjf2vnvcet2h2ku"
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


--hsjf2vnvcet2h2ku
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Requirements to merge new heaps in the kernel
MIME-Version: 1.0

Hi Sumit,

I wanted to follow-up on the discussion we had at Plumbers with John and
T.J. about (among other things) adding new heaps to the kernel.

I'm still interested in merging a carve-out driver[1], since it seems to be
in every vendor BSP and got asked again last week.

I remember from our discussion that for new heap types to be merged, we
needed a kernel use-case. Looking back, I'm not entirely sure how one
can provide that given that heaps are essentially facilities for
user-space.

Am I misremembering or missing something? What are the requirements for
you to consider adding a new heap driver?

Thanks!
Maxime

1: https://lore.kernel.org/dri-devel/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org/

--hsjf2vnvcet2h2ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxdkjwAKCRAnX84Zoj2+
djCtAYC0rCU2tqFwwMRRkdC0+X4UkE+T1TaC7DwuQMpeIzJA4HKzDz2v6n9TItr0
LTH6SysBgI3OFvgyXDR/NxKo6lihPc9mfEb0LLL+suXmLUnK3QO9N/TS9HFxj7JH
hI9UPHPo0A==
=ZRbj
-----END PGP SIGNATURE-----

--hsjf2vnvcet2h2ku--

