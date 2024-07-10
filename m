Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3992CDCD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3B10E123;
	Wed, 10 Jul 2024 09:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnIBR2Hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D9B10E123
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:01:41 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2c8517aab46so4474014a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720602101; x=1721206901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vmFXtyVCMNyYbHABAh9iS+RSpjavkSOYAah2Pgbu5sU=;
 b=CnIBR2Hk4HUrZ+837lOdmZwcaVkMcDpvj1sb2fD+91/aTUEIqfxZ7bR3visaLGwZ8S
 iAvtgk4HXX+gGbg1B1/2TcfvAVcHKxRm6kGAKpsAxaM+QUPia6ewhebgeuAWeAb+H83Y
 2VhoNyqX/CRK3+XsqcRGlKc71fjwYhbnZPlTQxTS9EkGvCsUhxzoTQMpwhmEXgTrYVF0
 QuDuFp6RxxQfvIdI2fAUbG/7qSreoanTQGSG+2faPjoumdqtkMR56GH527Q7SoBmdR+9
 AsiS7kfplemnSad2pTSp+k8a4JACfni7F+mXUS4eTMA3Bgd3MRkDNEFkP/vBL8iGGjOZ
 nkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720602101; x=1721206901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmFXtyVCMNyYbHABAh9iS+RSpjavkSOYAah2Pgbu5sU=;
 b=lor82+OYBMhlLOx/1wdx0wBrMbDwOcnmcta+DK4JWPja7iZrYuT65ti/dN9rV1F6iv
 b7rJI593Z5fVsnI0GogCNvpzP3zEsZ2dhTotPmS7ICLw7BT4a/OXgaGIoBS8oxpJ4AV3
 DzbL9VppwbVg8gtk3+M+fuRoonRkmWpp3HT7RBgdzPRPrI9HLiJUh80kD6nGCFDLnhXq
 jIbZTw7YK/7m+lcLGqJ1PWP0521V6CMY2E//A6PCYcVeJxfcJ5yohk9NvyHCJBmEY9sk
 yzKsVWmGAMdt1pxLAx/RCui5Pr0WNahSQ0Ak4fDOu8JWlpoeCI4WmVqVapItdsQq/dC/
 vQDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx+Uz32frFvyhM0c8Jdd2tr9duxgaY4BzllgOWEAKf3x26vYT1nENEOV6EqbzsqSA/hc6/1RJXF8VS1rItu2U+0RxJe6OsFJ2z1TsmxbrD
X-Gm-Message-State: AOJu0YzO6LycJlvP5VGFaAJJiEHJUPCF6HWkTvevTZsZ/JkfbQMGCMxF
 /HoF+uifbeBQKhLMa6iKHHCYiPN5X7Qd2d8p878+sfCO3iiIZ8vmps9JzAJSknJqI+CwC667Bmv
 H/3Hz1WRjUASMsq7qy4VYjZPFBks=
X-Google-Smtp-Source: AGHT+IEzaE9GFxB1MbaoIUhf8vmwgNC6NulwUarj52xV5HAtPJpAIzgEeJpgYD+koAiX9yk1ne21kbfzrbf8TOOCYEA=
X-Received: by 2002:a17:90a:c385:b0:2c9:66d3:4663 with SMTP id
 98e67ed59e1d1-2ca35d58971mr3979784a91.43.1720602071142; Wed, 10 Jul 2024
 02:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
 <e19d875c-70b4-4e0d-a481-ab2a99a8ee42@redhat.com>
In-Reply-To: <e19d875c-70b4-4e0d-a481-ab2a99a8ee42@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jul 2024 11:00:58 +0200
Message-ID: <CANiq72n-OXYPywckp3M5T8vA3AcFt0kSUUVN60FLx+yY3pPpag@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
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

On Tue, Jul 9, 2024 at 5:10=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:
>
> I used to list all QR versions in an enum, but I find it a bit too much
> boilerplate to ensure the version is between 1 and 40.
> By transparent newtypes, you mean adding "#[repr(transparent)]" to a
> struct ?
> I don't plan to add more "version" usage, so probably not worth it.

Yeah, that is what I meant. It may not be worth it in that case -- it
is just something we should generally consider when we see "raw" types
appear in parameters that need extra documentation/preconditions, but
sometimes it simply does not make sense.

Thanks!

Cheers,
Miguel
