Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E5BB56A2
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 23:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AB10E13A;
	Thu,  2 Oct 2025 21:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aXis3P7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B210E13A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 21:04:50 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-26987b80720so1999075ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759439090; x=1760043890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37tMfYTMjn8K8wVcdlTFYM9SBeVI90QuK8Rc3p4Xplc=;
 b=aXis3P7YcY7kGFEpO04UcCpfUm5wzVNPyj+hUfSz7k6o19aXWQ7M/YsnCgWzc7FP3l
 JG2UJnU1Fck1faXXJ0c9t3rLEcji7ZbNPugPnAtnV6D3cY+eGqu8yQKPegIH9DvisXfT
 3h4kKm0AXN2ghFND/cdP4dVCvYlS18Au9s7SwlhiGtGxXzb4OnAfPRKKIlhq4aHT3+42
 JhCsRtZKp9z7Th0Hpsp5YIC5H0hriqaBM8rNIGP5xQu8iMwJSyIW+Lrh7feW2LOWEKl6
 xHLArlRMgn390gfIN5kzNd7iCPGCEfQHCLlVM5E7z/c6MytxMGvrELBl77d+8ujXTGvW
 seSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759439090; x=1760043890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37tMfYTMjn8K8wVcdlTFYM9SBeVI90QuK8Rc3p4Xplc=;
 b=GIMP4lYXiQ64tBlANH9/WHVbOdYd/zyduAJi8PFFLqwznakm3Gr/XuVHAFIQElLRIh
 bVWRbtNVBeF2Y0xQnGA1gi0pojirShGQ36hNA1SpD72xHxlekJo/+P9SDsbK5wUwtvWH
 /9wA+kqAaLoNkemuIu/22EfcQOCV2rqcmdMYsMY+HH7ttZG/pw2UZavygS9ZgdyGiyiP
 +XGP/E3E9OUKsNnrFAuRKJXAn4XWP5vvX0EmcvedFhVEhKmFmGEi4BCNxejT7+GhQoac
 KaYOInBAdTZOYDCHBaeoPm/bvX0GCl+LCyJMSeoToI/Gi6fmJXvog6fe/Od8BS0BOe9t
 fabQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7bhOY3jna6dgZnE3SbEGb1qxAaJR3v1WIeu3GNURKY0CZ6JXTI+624WkKspqf+PKXBJTT2LhoaBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhwCU20xIaPQD+1ozdHuByV6aBFihmdDO4YXhFep8cibgcpB/j
 w7xU4NBfATURYD0jX39lKjJLfuzwmGfPCMHyN5YHpj0bYc/cp+mPcAPgfAMqU8qX5H1oiH2gird
 ATkpm3vNI1g8V1pbVpZNRf3ZRR8QZvHo=
X-Gm-Gg: ASbGncvVA6wowNwcQnGk3FIGlKI9Ik15GJ6cR0k7j6hazS/z2uId7EVFfNBWfZMnpWf
 mbprWFeq/iX/mBEmFfJooW5Laf6jA8EMIfZ0lvEyXJ0ZZRGeSOaTciVtn5nnlr8hB2vc++JncGP
 Oo2neZ5L7mvZX08Irezau2uu8UmpfSLv3FfTRn87pE8EogYvvBwOaWruNyCMNjhA++KT2bVHayK
 G9x93ciTt9qrgGbTvNyAZLrFG84No7DeMyhogWxLC4C2aVt38vJaqELutNWIQ6dao+OTUPXSD82
 LanJwPB18oVZ1Unn4CWQQYcqzsSNaY7OY+hyI3oybBGiDwyLYOXGfr/cPJlG
X-Google-Smtp-Source: AGHT+IGYNWpZSxtUPX4WQVIPhxuGtEH9m6x04uGV7OnoXrmZNKp9X2f5+QQswOXAY1ab1m/7oMOWgsgYf99ozY8oqto=
X-Received: by 2002:a17:902:ea06:b0:277:c230:bfc7 with SMTP id
 d9443c01a7336-28e9a70847amr4125295ad.11.1759439089693; Thu, 02 Oct 2025
 14:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
In-Reply-To: <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 23:04:34 +0200
X-Gm-Features: AS18NWCocUx_ld7JV3nL_JdXM0io3tRWkZqj7qj38BDJS7FONdnCPeROETACJqU
Message-ID: <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
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

On Thu, Oct 2, 2025 at 9:54=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Miguel, I know you asked me to run rustfmtcheck, but that thing is
> just WRONG. It may be right "in the moment", but it is
>
>  (a) really annoying when merging and not knowing what the heck the rules=
 are
>
>  (b) it's bad long term when you don't have clean lists of "add one
> line for a new use"
>
> Is there some *sane* solution to this? Because I left my resolution
> alone and ignored the horrible rustfmtcheck results.

We have discussed `use` statements formatting somewhat recently
because of that (and rebasing patches etc.). `rustfmt` allows to be
configured -- it has a few knobs for this that we are considering:

    https://rust-lang.github.io/rustfmt/

e.g. the `imports_layout`, `imports_granularity`, `group_imports` --
some people like the braces, others the one per line, etc.

Sadly, those related options are unstable (and nightly-only), but I
can talk to upstream to see what can be done (so your opinions on this
matter would help).

In any case, for you, my intention wasn't that you had to fight the
formatting, but rather that after solving the conflict (without
thinking about formatting) you would run `make ... rustfmt`, i.e.
instead of the other one, `rustfmtcheck` (which is intended for e.g.
CIs).

Leaving non-formatted files does hurt us, though... e.g. CIs check it,
and I think people are generally happy about the simplicity of
formatting on the Rust side.

So if the conflicts are already too frequent and/or painful to deal
with, then I would say we should already start writing the imports in
a way that reduces the conflict potential, yet making it pass
`rustfmt`. It may be uglier than what some may like (depending on who
one asks), but it keeps the `rustfmt`-clean property and eventually we
may be able to get `rustfmt` to give us the formatting we want and
migrate to that.

Cheers,
Miguel
