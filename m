Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BDBC2805
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 21:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BA810E2E2;
	Tue,  7 Oct 2025 19:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tbv/NqEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C1B10E27A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 19:25:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-781257bd4e2so715145b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759865099; x=1760469899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+iej964gqYmw3EStGTseOsB/VJ0n3f1dmiT9VwkheM=;
 b=Tbv/NqEwbX69R4LdWWFgBfOH2njNPwOFNtrydKLnI8jxco/ZoFf2ZMbwRB8CFwcSFD
 gptBWV/EcJMWRAzu795PDhSdjXyCL/6s6S965KQpOyHF2vLroM/yvICbmMLzMB7W03Vd
 Br70Bhnci8btsi5Z0ZCnwtZczs6LNNXIR6Hvr1widpuieX7v3v8L6KLHUhlEHa44ygIc
 kniGe7at8CGlOk/10M57Jml9eb7vDUUqO4pPRV2+ZzCv+nHBPS0PbkpCgBznKEVxcpfB
 ToZjU2R11vsQ0WnzFGn9yxGQYXh12Irf5b6MhuTr1AH6p3Pi0qYFUGSbSp2TBFUfpi4G
 EaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759865099; x=1760469899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+iej964gqYmw3EStGTseOsB/VJ0n3f1dmiT9VwkheM=;
 b=Kv/cUiDmVjlOcZGG5tPEy0Eg6iRLh7Bwza6O0139ZhsI5uHLMD2IGxWaC2Qd6zM7j/
 I+JdAMVj+12ZsvILLl0XuvNUfhLoqBghk1LpY90JsY8xeQAzWLYJjdqgo1zo+bvmMh+X
 KVNZEqII83omu/Hhp4vOaoRT6E5iACKwKa8s9yusIstk+E+NoOpKZxX+LmDhiUw0M06e
 zqNtRjM7xRADEIEbNr5Ycqf1ayYeMXHpko8R7s44Fy+SsGDQCvHaT3hKDzYT5RIy3QZL
 w3FqwVDFxIbkF6pwEEvtbZ0kyng0C2bRoHXxy5KvGSp4HzzbaYC7Y2ClVT9ziu5quGTJ
 UejQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tW4zQyy8jDYNExAY/pB/gbYVZCNB9oeraAdtg530rcVTx376nXqlqF1DjljsLZq6GpgsjArt86k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoBL4ZhsotHkH1aAJQJFq/plP9wF+O/3OxBtJXk94XF6tnHGhu
 5aH3ihOEwwARl98S8wsgzdm6b59Sr72aVJbHCAsVu8JsL7+4l5yS9K+MY2nW8VxHT98xwvPGoPl
 77hF8IJ9qJsoDcHhxpWlwm2OqKrB5lDg=
X-Gm-Gg: ASbGncvMaJAaIDzhe/ko93mcfakYLmmmi93kjlL1/3uf+ijm0nreQgg9V6ULPJDnR0J
 Eai5iQBtGWJ8hhZZNCAk9eJx6znMaZqsmE5x1e18WhlLNkzsE6OOrJEuJyv+6JKwFuzQkkoKW24
 r71CELkB6G/tcUykw04MluJCdr0gVQF+dLrc+HeDcog65ht7hRG42hdJltGRGm0OeoPaWsZOUJi
 NARE8S12CWd5NnSRF169gs+ZXduWqG5xLtymhEx8TkjhOsdCEkx9TBbMH1F3+3HxmT2X7AvGIwD
 h+V6HCubmvuO5d0X5Xxu34TqJEQ7zCuGhuKOmBj3/UXpQg1wQQ==
X-Google-Smtp-Source: AGHT+IHRFimerlEMqF3boAdKkBiNG8MkW5f1eh9EAmm670Jbl+52qtss8zZiJX+57J7MzfxLc/d3NZ0jQ1LQJ9RjfUM=
X-Received: by 2002:a17:902:ea07:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-2902743e550mr5868445ad.6.1759865099543; Tue, 07 Oct 2025
 12:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
 <3771775.lGaqSPkdTl@hyperion>
 <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
 <CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com>
 <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
In-Reply-To: <CAHk-=whe8NLsT-TnBxzzW8sCL_X3BN7zv5ELVufy6=sZ_k=uGw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 21:24:47 +0200
X-Gm-Features: AS18NWCFJirSOJNc7E5--qS2zoXHw3wCzCsVJLxEt1b3tIkqnjp9hJnURlrXm5E
Message-ID: <CANiq72nwosJkFp8PyqY=XLt6ZMS2rnsTHaN-arzQUemR5cuqRg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
 John Hubbard <jhubbard@nvidia.com>, 
 Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, Oct 7, 2025 at 8:35=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Although that example actually made me go "WTF?" regardless of the
> changes involved.
>
> I clearly do not understand the sorting rules either. Why are the
> "device::" entries not sorted?

Essentially, `self` (a special case) is placed first, then it puts
things like modules (i.e. `lower_case`), then things like types (i.e.
`CamelCase`), and then things like constants (i.e. `UPPERCASE`):

    use crate::{
        self, myitem1,
        myitem1::{myitem2, MyItem2, MYITEM2},
        myitem3, MyItem1,
        MyItem1::{myitem2, MyItem2, MYITEM2},
        MyItem3, MYITEM1,
        MYITEM1::{myitem2, MyItem2, MYITEM2},
        MYITEM3,
    };

This got substantially changed for the next edition (2024), though --
they decided to just do version sorting (I added a 256 to show that
too):

    use crate::{
        self, MYITEM1,
        MYITEM1::{MYITEM2, MyItem2, myitem2},
        MYITEM3, MyItem1,
        MyItem1::{MYITEM2, MyItem2, myitem2},
        MyItem3, myitem1,
        myitem1::{MYITEM2, MyItem2, myitem2},
        myitem3, myitem256,
    };

https://github.com/rust-lang/rust/issues/123800

You can play with the new one in Compiler Explorer (right-click ->
Format Document).

Cheers,
Miguel
