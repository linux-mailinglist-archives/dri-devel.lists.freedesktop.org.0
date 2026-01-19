Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02FD3A1BA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7E410E38A;
	Mon, 19 Jan 2026 08:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aA6h5ADS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A65810E3A6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:35:50 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2b6c1ec0dd6so210882eec.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768811750; cv=none;
 d=google.com; s=arc-20240605;
 b=EAhYhFyME4Tl47nR6t0UYTCRxavY4y15gTed8JGkaDlADd4vvLxbAVBSZK9RfMRvfG
 T4MOk85/5aA5LOK8ywyj17oqOakg4ZwdC9OPgh9lRcsFzOfVqgEOSyv4Mn8IAaG2DRCG
 feGtxh60oyh+LXnSBJEBVpnsA0DkOXgSjq4gnNl23iXmStPYbQy0rehvtpOUyKAXhKIH
 2e3iUP5xT8rKPBFl1RBzXo24f/ENqtKb9g+ceP27mTSMM8XIC8YbrEPBWfMIGff1LcNj
 MLBWxjejPcsw+5jsgKL43jAAUvzscbC66SSv4T+mcZU4s4JWc/8EoIlYmNs7TZVowy5e
 Tj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
 fh=iBS//tp29Tzi6LVrDyLDRGKDChShD5Y6+ZK1QG5/dbw=;
 b=SLYM+Rr1FDs1qw9c1ZaeOHiBz7BL9qtXWPrnAqbT9xaTnwy11EXf8mpYQFVoCHLRuk
 PXj+4LPmwViU00fJ4e00UFOiOBFanwhv8wANf2v0LxPCkeCu4ACXzPN3WHruRjSbOVul
 wD2paWycmuLj0siJ37wl3vSywGMOcvLWf7k0iHSmmN/oT1tAIyTpadJPXrK0RufSOm7O
 LJ4CV1Ve1A0HzLNoLywtb+HSgf+AmdbNTGssH8Db+nKW4Sm6JBL983DyD8iECJ3ISHpL
 X44041AFzNiU95/dJWXz3fz6z5uGOJhPvnYLlDv37Tr3c1a6C045A9rNIzatU4ZrXkQG
 i5LA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768811750; x=1769416550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
 b=aA6h5ADSHI1tdRIWIR0LEqpdh8qz9J6RUHWf8g9NYnR4x0/e/UsyHEFF0R1R0/rudr
 3Eqb9SkNd5k1AitIZ5jl1Khp8ELMDiYHOXqDgG8QLUQKavti/Q4hs5tsi5R215Ym5wN7
 a1lKgxIF5bbjw82XvByL380iHqx9MgcrxLerjS5d+DA00qG7BxOK+V3ZBMyVP9XqHM/Z
 CK04FpBITpO28oI+mXDzQsADN9f4M5hKN76ve8bycx9NF4GF/mmQtyacjidp25rL6IJK
 Ss68VTVl6AwKmTyMYxt5FVk3STs5Q7nszCgyunTCujB/47cojr9B13VNnp1peUw/agi6
 Z9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768811750; x=1769416550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
 b=NYzvKGiF1MWOnzu79lpJQt/IGuqFnuIPhNnb67JI08Rr/GqOwggn3DhvmKJdmgYYBG
 MZjtjNRs4XoXQqzyKA4ABmtMm5sE0xTYe57drALkuUrLgEVIkspzV1fC2Q7wi5q7VbK5
 q4L2di2eUxwhJkboQG2AZhFs52SUh49+3H0NQqxGOMGyCdGbZ+GbHSvrBL9juWuRRQzB
 1ZemBigYCRZF3lrfJqhdWv2bHhHf9YbA0YSQ8Lx/hih0b2vHF2IQNy/DwSTJVHALE+Ew
 1RcJ0fuiB9+hmWCMQ5WJD5+k1N7RFMZ4h2yI5EScjzYcNPQ7bOcs5++8qos/LysalsPx
 Q4UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR/LBJRw9FojCD6tRzx1q4vo5/AJP8jL8PCNFTEtkwugJBBJA+WzlZmivtZA4YaKO+s3etydisEXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLmbXf7JMmydMIbGmRgYBLVrGpkGLsB5sQDRsBxiz0Aos6kMe/
 4ovhZ5EdKxBGPqpkkX8k7aTGlbC4AvyACJ6x3z/gCxLPw756raxI0NWDUK2DUmKm++hGjPrHPwp
 yTebf7je9plrVAros5mdrtGGus/1L6aw=
X-Gm-Gg: AY/fxX4hTuPaRctiR+7bar18oMBr/XvrtfYCPtl+D2wnxSfSgwTL1KmmMKEW5eY1cix
 K7vioI5GjDAtVw7kenGkydl0XjpmoM8naRfHze2OYEJXibvwgnVPb/J8KtjrXN3pQ+G/jkDVZdk
 3oXYhyCqwk4x03U6cdY6BTBhMJJv55VbLWH2ok1xsNB1KuuVTVZHPR3/ZpIUtFC6THguEowelFQ
 e0WtuQDo8x+7bw52WdwpIifwqMpqtPiCLWj5kFGpMpa83iCHa1uDLcwjczXhQ5bPk0ovQw3DaZR
 EHMy09DOq/DAfs6nW4sWJMqmSPBdl75vTzNuQAwrUu85mpuZv90DySas6jxdLmA0Xv4fTXO0HoA
 f5FMFMz6nHLfw
X-Received: by 2002:a05:7300:8b9e:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b6b4104734mr3951028eec.8.1768811749597; Mon, 19 Jan 2026
 00:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:35:36 +0100
X-Gm-Features: AZwV_QgyiZUXm_4tJq2y9r1MMxX9bgXqf2tYGxcHOuGPmNx5-V9cx0mbWvbR63k
Message-ID: <CANiq72ncCdr7OL4u77VPM2GH7o9ES9nYmQ=EcMYxeZKn=sBJHA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 aliceryhl@google.com, dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
 boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
 dakr@kernel.org
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

On Mon, Jan 19, 2026 at 8:09=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")

Perhaps not worth backporting, but it could be, so before Greg's bot
replies I will add the tag for consideration here... :)

    Cc: stable@vger.kernel.org

Cheers,
Miguel
