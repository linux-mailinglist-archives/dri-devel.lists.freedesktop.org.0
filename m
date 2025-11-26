Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3532C8BF18
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0610E691;
	Wed, 26 Nov 2025 20:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h8ETi3ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500D510E691
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 20:58:06 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5969c5af23bso217586e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764190684; x=1764795484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp+AeCgB9K3mP47leB73mFZ3KDshygl/ANaoJfeBOXk=;
 b=h8ETi3ck/lb6f6FaHB7k6TLn+5/fIoPqSiN8NN9NHUrKjqareNfyx1Mbj0F4h1H3Cn
 vuqegWvaMKbA5HVp2Y3PHZT8kUslcNBBHSYbGBF6mre+jtUicNOLlyxWLs6iPQU55dbg
 8J+Dbte4qhi9+RnlB/TEmzn6QJGcTOTpa5mttA0/aTQdAaakC31kf8cxYhpOSkXosmOq
 YUpPoZ/Qi+hDS8kHfYIS+t3dNY8SDUTjVGHgbWyguF5ZcYK/qotTK4HFYneCWv/lHgxo
 K02BtPHfJEFeElRbRC2lAksIctpO20qM4cF0CKFHUmmmB4kCH/GzieKLXIRe7rSFi57x
 71Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764190684; x=1764795484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bp+AeCgB9K3mP47leB73mFZ3KDshygl/ANaoJfeBOXk=;
 b=T54xG1ccuOS7eqoBOjE+nWMoieDZZdHLuXrWrNT7fT7m3Aasn8TvyYPsKLW1Nv22+n
 uQtIa4iIlmd9oTDsTt+KayBnc91+Xxtdh5O6/rX9BDpKmYm7hN0ojTSj2kZtUkctFFJN
 bhYGhjGjk655S5hjnhBGIeDfug9KdIh2uzxVJo3VKOVv3+xkvy2V23M+toYjpEm0IbBf
 MBuu0SMUirdet8Uztjm81z1EhBUDFcyagtpPyfgBAHqu26nrz6KUiC8pASA/EiHy1mhh
 SrLiqLHkB0+cNcfM0UnzrYvWbB3z2gNWCr7zJWP4OiwB39+5moDVCQE/R7OEN3ySh7g1
 2FQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIJaEHgYSI2IZI31uIRtiVuMv3NXjM5MuuL7T92kMM9AOzvN/DHW0qfbmjaP3j5fhKxJ0vXpSRblw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmGaMZpR/FcTASrPxSGhHMq/7ojd2TF3RZ6FZ7ju41BBw2uIma
 NSHKPYyzbDdVNtf4iHBwL2vecYLMCE1Zst3XEjc51LUtLXYh0+k9rsNQeRZkGYXSHvPMidt8VVI
 6lD9O8BajM1vvVquraddXwOSdzLnbuKnai0+DkhDh1A==
X-Gm-Gg: ASbGnctkDsEJ6/FzS9R0HTnIUysSNzeVWiLYJlXkvI4WR1WHy7wnEW576G5bSQy7zWR
 0pXrN2KLFQGiIUIjiIa8Jrb+OHtckrvzOIrkK7ruYzCNvNDnWrvB2gyZp0SxFy9xu9PFm4s9F0o
 lAkuj7lO4fDGdYGg9DSkTb7QKnmf/j/0iurPePVp3Gf1bjQyYhzh9H0lbjGkUNMAf0G59kM9yEC
 x1orYGcSc+qzhM/0FjBDw53txFMdwnNFwIwu0/p5y/gretjP1Ez2vcBa37OC8x5hVzD65o=
X-Google-Smtp-Source: AGHT+IGANFGykQra3mrG/jIG++VEU1OKyTNwQKchnOrcz9qhr4m3VxShVINsfb6z2II+SA5qvLPDZJREDU7hJSYP5r0=
X-Received: by 2002:ac2:4f03:0:b0:595:9152:b920 with SMTP id
 2adb3069b0e04-596a3ee0480mr5703006e87.39.1764190684280; Wed, 26 Nov 2025
 12:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com>
 <198ea639-1129-4ba4-9a1f-129c8ac076e3@ideasonboard.com>
In-Reply-To: <198ea639-1129-4ba4-9a1f-129c8ac076e3@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Nov 2025 21:57:52 +0100
X-Gm-Features: AWmQ_bm_9BpZCLQHMvXs0bAxo5aZEoA6CYEVsk8_K5fIwaR_V99BRvA8sCtfK3Y
Message-ID: <CACRpkdaisC0=0_wEe2Trhi6EHw_=xcw=RUTBS=YN=Bp-0na5Eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, Nov 26, 2025 at 12:08=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> > I am happy to develop a fifth version using the approach outlined by
> > Tomi (special codepaths in the helpers) if there is some consensus
> > that this is better in the long run.
>
> I'm ok with this, it looks quite clean solution to a messy problem. My
> only comment was about the missing kernel docs.

It will become a rather big linecount set for a regression fix, but
OK!

Yours,
Linus Walleij
