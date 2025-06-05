Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6002ACEFB6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE110E278;
	Thu,  5 Jun 2025 12:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="vv1QtY64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43710E278
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:57:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e812c817de0so930752276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 05:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749128235;
 x=1749733035; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
 b=vv1QtY642rZOJSo6W74vbcF/EPQ0AemnRTu8Gp97saSxMiT4975pZbLiVOsHxSnvQS
 kU7aQS2PAobvwBBGvwAn1JgGpLp0cZEUOWmTPLJTO4N9pyWZjabFz16n1qLlwpacvPeV
 cY7mPo34GGGjQZXxpD9wXNbHH1PO8CdPvx6yisDndmFxk3SL2xhZkGUi4mfGK5uGUnBj
 qQ/OX+fjlOXr+VkqSLe+G+iPGamE8tK+ENJ34oNZBOYjyF7x6cBV0fNwQi1NFTOqsxcG
 iXBXTfkJcIWIGLtinTJMH3QLKX/d3UhaKCgjx5LngAhaxxsMrHGX1h2stP9wbP74mlUh
 Zthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128235; x=1749733035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
 b=FAKILicpMkzVdRLpc3TrImyYCtuKi0L/FOFj5JTsoLDQQ4iucbqOPkAztzHB86PieI
 3DFNekr3blycWakJ8rTCOzAWaaSjXs9Eaqapb7u+JBmG/Q0Js3/YPnnxaj+1SYR7KcZK
 rYR6wSJvle3FfpdTaHNTQaqVUBgDFbKn4t0LAkl4OJBOQlchHupaZu1D/RoJmpAKXrhc
 qt2IMc+8Gd86WvezoY8jRN4k34nSsDzNk+/oCTWA68EU9XtFFHMX66oTAeppEWEVGkcX
 objmspReQi0CmDTjvs/8xJvo1lgkVpyx3cIJuRlWo35G3Xw6tTlvIMcwZECpj3wtT7R4
 FsuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrC6Eyxs/H7rG5yqsrqFxP+EnQUiRTbBOKTe6guFfSfFtA9NpCLtklIRtwkfIfKDP/8bNj/rd+RVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR+NYIUcW4Sk1aauAOd7AedYRpxesIlLG94t0+xzBK/pTgIJk7
 GbuMFQyOHpmi2zvFUUuB2HyWQuvZrNa4x4KVBxN7FTvRljA9y8c0Yzzrf3myTzSMtqIOy5QWhkt
 w+mJITWzFRw==
X-Gm-Gg: ASbGncu2XE9JEQWZmG/LWK9EtoiGDSsd0/OwmaW+KjfH7j1QaMASWH0SusGJq0AtuWv
 b5Mo/S5D48U8hNeln2JI1ytWeLw+reUwX2Y+OTsXpAKVYk4eZxyDOvOlbg9lAN6mw1MtSzEs24i
 cj6x8LfKwRExLsmWS2TJAQnnwVCkFx3d0iwaSbhDpo+iG5ugiK/vVS0YgL0Ki7g8GmRWYYjeZ2z
 tpI2p2BjPVZkEVs/NL521RJCEdOkSibjKx5id1VEoMiNZAS0Pyf6pTOkxKyZbpXR9ZOxGMVxe3p
 w+WUWA6VOD1Y8rSB3gY0169GULitOc+I4SQF6sMrQ6gO3N6+yJr1w0T/8cGzbgIr2DIvQwtEBQM
 KWmdxI2yRWjEXpdhbCTiKTzIRG5a0P1k0ZdGIBhh5
X-Google-Smtp-Source: AGHT+IEWoZLq8najf/Pv65KjGrCQ1erWAHKeKk+fXzABBQvA7za+ZtTz3+x7Wdyv/9qV02f4EWdr5A==
X-Received: by 2002:a05:6902:70b:b0:e7d:6a66:d0cd with SMTP id
 3f1490d57ef6-e8179ef2ad1mr9161664276.35.1749128235117; 
 Thu, 05 Jun 2025 05:57:15 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e8128d5a14bsm2622962276.35.2025.06.05.05.57.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e7dc3df7ac3so912521276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYnoUqXFqAxQQyjm8zm2awZ+HwrJCaTDqzUlaODuL6tFIMgzEU8Emb2KFd5KUQQuBBGmRwmnOpisE=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1245:b0:e81:49ba:47ef with SMTP id
 3f1490d57ef6-e8179de2e64mr8284874276.27.1749128233149; Thu, 05 Jun 2025
 05:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
In-Reply-To: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 14:57:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
X-Gm-Features: AX0GCFvkLrhe0xTjkvrmlzVcmcIDMHbj0V1goAH3SY_Lo_zCTT8XJB_kX_AKtNs
Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Daniel Stone <daniel@fooishbar.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, Jun 5, 2025 at 2:29=E2=80=AFPM Daniel Stone <daniel@fooishbar.org> =
wrote:
>
> Hey,
>
> On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > > Indeed if you're using the IOMMU API directly then you need to do you=
r
> > > own address space management either way, so matching bits of process =
VA
> > > space is pretty simple to put on the table.
> >
> > My impression was that the VM_BIND facility is intended for SVM as in
> > OpenCL and maybe Vulkan?
> >
> > Guess my question is, what would such an accelerator driver win by
> > letting userspace manage the address space?
>
> I mean, not a lot gained, but otoh there's also not much to be gained
> by using the kernel's range allocator either, and it saves userspace a
> roundtrip to discover the VA for a BO it just created/mapped?

Oh, I just map on creation and return the VA as an out arg in the
creation ioctl.

So it just seemed the simplest approach, with the least custom code in
the driver.

Cheers,

Tomeu
