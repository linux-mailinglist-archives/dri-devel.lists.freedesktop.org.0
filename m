Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD02C69A46
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B04E10E4B5;
	Tue, 18 Nov 2025 13:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X/QLunBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9897B10E4B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:42:00 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-71d60157747so44733807b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763473319; x=1764078119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbWihSl/seq2iSenPMdAEzOdr4EnCHKVYwFGzvMWGCo=;
 b=X/QLunBDAFb60s2ehZKKfxqcnoydsmgWJPURDSQvqz5QNuBJSZ/n1x07JA+7rUZYkI
 ZZqvV9qeuaGMuzRRxbEDX9Wv/7zCv9c34Xiy8DZIQzyMLUgrbTVd9OxhylR0QK8kWq/e
 TmHNdh5hr44mcauqH/wsmH5y2O2nGvB8ulQkjPE8ZFBlqeZw9Jk6vCPI35ry9JZTTnxj
 3v+L0xNQQzIeWJaFfh5JP1XJ51iD2vlvgHDHCHpj3pltgKOaHGOyTBIaxE38IW2OjNTo
 zq2mFDNVMZN7W1++G35XNRpyf9W5UVE8Z50FEOmdgzcHcrN1wL7+1ZSSRhaflOxhhQZU
 yYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763473319; x=1764078119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HbWihSl/seq2iSenPMdAEzOdr4EnCHKVYwFGzvMWGCo=;
 b=CleJFvXNv733RI1DV5yv/Bz9zojp4ggPr56kaaJ1/zrhCq6UFwTRRSqrdpZPsuoMkq
 Xxw1tTvakflMLv9yo5LE4NpMjIG0XNNI/QVNruDHiBRjrWCZQu9ZUu43TCrO6bPRbAg6
 fLDSmAJJg9fK3smdNt5x2Cnbr1a8kXuCtCrcsf9QvXhhdIwiitg3zKoMgQv9zgAeLtDd
 ckv2y9V3N+A4XQsdEwIYZmATlRJfP/+Dxy8OQxz3cgZdADsjl9FppTkuCiluNBbXV5oP
 UhXPFibA4O8qojERQWg2QvFKq3krzY40Si5cSkISAV4C7IF+oE4fWKDOb8dyTgb39yl6
 HMug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvZnZ1GnT3yMTmVTaOdTSH7URqiB2D7qoX7Lv/vqkYnmkZFL5nwCHO1Tn7YSxkngUmeSzNVZSJRag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmmQvmk6Tny0WQR7BZ4PFiOPQn1bY7t0sYU/hIrhzSNXvLGnAV
 CJGierexAkIbX6oaMRRzRWlxGPTB4vLDBkL711K5qlzhpOYiIgs73ChBohYSVzbpB8q8ThyIeOd
 tQM3CWyjvoUBiQJAycJ8PKZ/5RuJ58oZS25u/rWh6cQ==
X-Gm-Gg: ASbGnctT8Jn3zQ+Omomq8HHhmeTJ7YCLLRTqbfJZnMjEh1nfOU7dCsK9IM6c5HSTQ7w
 uwOquW/p5xVL03IU+o4Yyjoymmq/Mldbhuq44r753WkTgHCgi3AwzacVbCBh1FGlyzSkioa2ekV
 bG0ovqNUFiqc+h0XC15Ax40o5tDPaYXoSruOUpSb7i7mTC/k9CSWxHl58N9QMnA3mC8r0FGsNBK
 HaEZ50CHuO+uaZYdCFGCTEX+BBBtRJ4IPMcPr1cBtvJJaY4FA09aHs0rfJLoxo8LOE4HRk=
X-Google-Smtp-Source: AGHT+IEXY4sz+z82OILtE0SuCw2B6z6fVpEqUThFoyXmCKI5f/Ek1XuIj03U7CX6KW6DzdzwAkaXc3zbi6wKAbSyZd4=
X-Received: by 2002:a05:690c:46c9:b0:784:1f81:8c39 with SMTP id
 00721157ae682-78929f1c647mr152836727b3.59.1763473319392; Tue, 18 Nov 2025
 05:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
 <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
 <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
In-Reply-To: <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 14:41:47 +0100
X-Gm-Features: AWmQ_blqTNxpyn3FrMGcqA-E1FsUbjiavwyStsVAeZ8eQRWboZz0JnfPwtJLGGA
Message-ID: <CACRpkdbtySSfCiV-6Dqy--D+J0vcnyvcFiASLYGauNHSK9TCjw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
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

On Mon, Nov 10, 2025 at 4:16=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> > So what is needed is for .enable on the preceding bridge to have
> > been called first.
>
> Marek sent
>
> https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas=
%40mailbox.org/
>
> Linus, I don't know if we want to go there or not, but could you see if
> that solves the problem on mcde?

It does, after some fiddling and adding a custom helper
for this usecase. I just sent the patch.

> If Marek's patch helps, we could go with it, or we could also try to
> apply it the other way around: revert the order back for, but add a new
> drm_atomic_helper_commit_modeset_enables variant, where the crtc is
> enabled after bridge pre_enables.

Marek's patch helps, if applied and then with my additional
patch on top.

Can you apply them both if this fix is acceptable?

We need to get this regression fixed for v6.18 final I
think.

Yours,
Linus Walleij
