Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F1ACD7EC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 08:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000DD10E07F;
	Wed,  4 Jun 2025 06:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wUljoKC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820D410E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 06:36:33 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54b10594812so7734593e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749018991; x=1749623791;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9K32ZU1XZ7DXPyePnHI+L2d3Xh8pDC7EJ8l3Ins/TM=;
 b=wUljoKC5Ka1dKu836N4bTIiFKrAqKTd7sLqKqEKZ72mkKshEZUjTBQ8L8Utp9cy2q3
 1kwLrQhpgNrV08P6qfzJWxkQw5GtpZ8acNQnn1iAclGxHMfByvRdlCPluoxyiVjwJMBb
 tCpmtfaW01/+3v/3gjvlFmdIXgzgamxjeSlDgayPVHbttf6Zr2iFo2jdet2MonLO53sf
 fUhaP0Obg1ijNG85PKWpCv1E1l6mBC4vjN6UJEz5uR6N2tOgBjvlPcf+DzqDhQti+MKH
 j+8cocOHV/yTYvd1LlY3Z/vgbxiIPUfQelCbKqReDsDArNJMK9wliA36+rwTNqMUVGP6
 XBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749018991; x=1749623791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9K32ZU1XZ7DXPyePnHI+L2d3Xh8pDC7EJ8l3Ins/TM=;
 b=NTlyJbERL0TZC6DvwqwB/vPeNT54XaJjGJVjbNYAzI5XhcHsYnI1/U/w/LVngWSneY
 L0aX1ozOQ+hCyqE8rhiz0k2N7TtCgq3QFDlSMPpmxbj7bxyU5roY/CEPwNZzqV6fd9ZH
 orJ6fsGQi1puiL1IzQZI2q/Livpct1ZrO3R1Yg3AMwkzyHg6D1WcB9/mfmN1TgNytMy/
 1dAxRgSPMltYtqEGPaMfUZ7usR4tcXJtKzxMkmv2+yyW3ZvyN9eSr/34mTRKq5aEPL0V
 +One31BlU3Ar2FnQW0p5x51GBBghTh4XS8cDN4hl3mRbcwzCkU5lcTJPkOu295gNv2HX
 VvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp9SKPNXW2BpnfuelC/9UNZ93zDK0RZ/imY4u9Tep6p02jIQghzkeNHfLwnumLFyxbc1kX/ugNhwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwH0pcbiwAOao/TB4oluoX7ZeuX69FXRVqkImAKjIaVzXRH3id
 Biuy0MnbNI+WV+aCw/QKDzhqgTm2IHJUcgmFasBdjX5RvumBpDGXAYC3U2dglLghtsyN30CX2uE
 8e9awTulXWTp1ga1S6QlKB4S3S27llSpVcqYop96YVg==
X-Gm-Gg: ASbGncu/zHSZnA7lgmQyiILXIiHWYgSsyaeMyf9Vp3GJGz9sC95jMQoNOdiiGLtJ/Aa
 nP0kOgaVtb1lu7/FTtmJCZORkVauXvb4Xk8sZlWB8qNhxK2iTjohE+n8TXDmbWE3h8TGGDH7akD
 UxPcaIIeJJPcCXR82SiuPtxhAYzwh0qIyruJ9dlNvLLqhhpgfoLOZr4sbBTtsx3j3cdC5ryt2Zd
 xM=
X-Google-Smtp-Source: AGHT+IGNn5KBz1XRTjIkzj6b6e6ObvNtG1QhrXiTlXPwZa2NH6Gn7Xw0y4y87hgGMzhfMTB1WYM8NYUps+Cmt6+hJMs=
X-Received: by 2002:a05:6512:1192:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-55356df2fe7mr504394e87.57.1749018991176; Tue, 03 Jun 2025
 23:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
 <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
 <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
In-Reply-To: <05aa1fad-acf6-4cea-9a20-e54a2a4669b7@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 08:36:20 +0200
X-Gm-Features: AX0GCFusZW-oAOcE0lriS1jLbCdqE2F5QAmjvVg87YP8T3XsEwEGxH56sPN1Z7A
Message-ID: <CAMRc=McDb13ZOM5v5gYBAT40Z6eNd8am6gy=FysWU72cG1172w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Tue, Jun 3, 2025 at 8:24=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
> >
> > Agreed. And as far as implementation goes, you can have the same
> > driver be a PM domain AND pwrseq provider. It just has to bind to the
> > device node that represents an actual component, not a made-up
> > "convenience" node.
>
> Sure - this can be done using existing AON node.
>
> To keep the pwrseq code organized in drivers/power/sequencing/, a
> similar approach to our th1520-pd driver interfacing with the AON
> firmware library (drivers/firmware/thead,th1520-aon.c) could work.
>
> The idea would be to treat code like pwrseq-thead-aon.c (changed from a
> current pwrseq-thead-gpu.c) as a library. It would export its necessary
> functions (e.g., for specific sequence init/deinit steps) using
> EXPORT_SYMBOL_GPL. The main AON driver would then call these to provide
> the pwrseq functionality.
>
> This will introduce a compile-time dependency, as expected.
>
> An alternative would be to keep the driver in drivers/power/sequencing/
> as a platform driver and start it up using, for example, an auxiliary
> bus. This is similar to what the JH7110 clock driver
> (drivers/clk/starfive/clk-starfive-jh7110-sys.c) is doing with a reset
> driver. This could offer a cleaner separation of roles if that's
> preferred.
>
> Please let me know which way would be preferred.

I forgot the auxiliary bus is a thing. Yeah, definitely use that, it's
more elegant than a library function IMO.

Bart
