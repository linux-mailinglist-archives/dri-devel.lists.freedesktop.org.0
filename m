Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F0ADEE0F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B9D10E830;
	Wed, 18 Jun 2025 13:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="imkjfj4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582510E830
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:40:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so7126028e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254016; x=1750858816;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crYKm76o7xrNY+G6KV9/tF3PVZHJnWgwFllJxx/P2sc=;
 b=imkjfj4FPebGtJJTJan1D7vra0yfL4xU67HZs5jlkbBGvTISgBgm7Szar2Y9nvTzip
 ANH0fc2HRg4h7O5eoA6thY1d4EvMfPSttfD16w+Z0NzEA+tP8q2eBK6qliwrPPEpfCIm
 HbKrOd/12zmvip/S9PQRvR4KcG9G9lupkQkgDf4ThOKR3sPm2+eNnFYfNZ1lTZ34ODN/
 q/IExr0RxN1IKFLmOzz1WVF97G6UNeTh9kPd4uvas+xuP/J5fchbhla0UkMjwJMdc6UG
 VG8gHf4AtS5Q5yBQWjBQa8dRTQJq+arGGdYdSVnKi6e6XqbK5CdbVJmZZUGUsJXkzaOA
 viog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254016; x=1750858816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crYKm76o7xrNY+G6KV9/tF3PVZHJnWgwFllJxx/P2sc=;
 b=Cr2K9akU/lXsWLaht/nFpvjn5IQQDk2/AJ2X3CsW56Se3q3gHvp9cTg1Uw8c9sc5na
 15yZ5XP0r3QqYUHWA0GFvFaGVmArxh2nl4tI2qdbSuUcrcmLbhIaFviWzyABMtuLwOMO
 sQT3KVxnzK/z4LwMn/yRbDLh+/ljQ3vYst3QfEiO6EOymA9XGw7dGTXaMIJaHkY1OCV4
 aDDnbE98jMjDzOc3FhXoIYNr+mmqt6+ZkAEfndYqVH0whLdHqw5FHSI4fmxcqIXm1l7h
 wA8w1PJ7EABKwFbIRR2aZnoqj0Cyhrl3+d1rqJKLFquLGPIIX0fsywOGX/r7iySK713n
 35eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Q85L5Hcse4qNfkjBTpNb5P95FJKuxjUsYgdvGRkFDD8jbfxYLL8ckoDTnbvT5dH06yZL8ydtO7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwItv76w8lW1KdXfcAQ1oHJC+hmmo0Bkb7hd61SCJ4K8l7nDAAV
 DKFDkotjfTZa/4iJO16hOy8HIhkC2lOz5PjvK2habQip6D8PcvfZdnLHzF6DkQRQlFXehOcxuyP
 Qy6ABgRqdSPXZrK3buNDnw8DZWqA5FZg9sVF65J1n4A==
X-Gm-Gg: ASbGncsoN+y+CL20oLJX1mA0CLtJ2bGFUC7C20lHmVTeMpSVZKmznqsRkpLj+UjU+2l
 oXAIkVWqJmynDiw+4TO68SuWfTjdrHv2L/rurIfp0PTNoeERDdQYUE8oxLENUxosHAtVNpwZVyq
 8rg9w/shSmUVqdqV/s5HgWpF60WiakYICO0sY42pL9+CrjEBetsDzf9CQySucU4H3pmU8QSch6d
 w==
X-Google-Smtp-Source: AGHT+IFad5ToM6J1+d0O4ioF2H0SvuVc8QUlMms8kkOXzKAtFkNQ7udNNIL4/h4trNzifK85LwmlcE1SddV80i2GLLM=
X-Received: by 2002:a05:6512:23a7:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-553b6e74f1bmr5037069e87.16.1750254015903; Wed, 18 Jun 2025
 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102226eucas1p112dacf9670f68b4a8581aa1a8b5ced9d@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:40:04 +0200
X-Gm-Features: AX0GCFtjm4Gei3EGyvZSnf2L-ltMUqIESaL5jfPbh7xGonqWZX6d4yY2Lh7mu5E
Message-ID: <CAMRc=MfQFc=MvGHpu1M4HO1-2RJh34UAXXCvVBZ2jU0rFDANJQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
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
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
> controls an auxiliary device instantiated by the AON power domain.
>
> The TH1520 GPU requires a specific sequence to correctly initialize and
> power down its resources:
>  - Enable GPU clocks (core and sys).
>  - De-assert the GPU clock generator reset (clkgen_reset).
>  - Introduce a short hardware-required delay.
>  - De-assert the GPU core reset. The power-down sequence performs these
>    steps in reverse.
>
> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
> callbacks.
>
> Crucially, the driver's match function is called when a consumer (the
> Imagination GPU driver) requests the "gpu-power" target. During this
> match, the sequencer uses clk_bulk_get() and
> reset_control_get_exclusive() on the consumer's device to obtain handles
> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
> along with clkgen_reset obtained from parent aon node, allow it to
> perform the complete sequence.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Thanks, this looks much better now.

[snip]

> +
> +static int pwrseq_thead_gpu_disable(struct pwrseq_device *pwrseq)
> +{
> +       struct pwrseq_thead_gpu_ctx *ctx =3D pwrseq_device_get_drvdata(pw=
rseq);
> +
> +       if (!ctx->clks || !ctx->gpu_reset)
> +               return -ENODEV;
> +
> +       reset_control_assert(ctx->gpu_reset);
> +       reset_control_assert(ctx->clkgen_reset);

These can still fail, I suggest checking and propagating the return values.

> +       clk_bulk_disable_unprepare(ctx->num_clks, ctx->clks);
> +
> +       return 0;
> +}
> +

[snip]

> +
> +static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
> +                                 struct device *dev)
> +{
> +       struct pwrseq_thead_gpu_ctx *ctx =3D pwrseq_device_get_drvdata(pw=
rseq);
> +       static const char *const clk_names[] =3D { "core", "sys" };
> +       struct of_phandle_args pwr_spec;
> +       int i, ret;
> +
> +       /* We only match the specific T-HEAD TH1520 GPU compatible */
> +       if (!of_device_is_compatible(dev->of_node, "thead,th1520-gpu"))
> +               return 0;
> +
> +       ret =3D of_parse_phandle_with_args(dev->of_node, "power-domains",
> +                                        "#power-domain-cells", 0, &pwr_s=
pec);
> +       if (ret)
> +               return 0;
> +
> +       /* Additionally verify consumer device has AON as power-domain */
> +       if (pwr_spec.np !=3D ctx->aon_node || pwr_spec.args[0] !=3D TH152=
0_GPU_PD) {
> +               of_node_put(pwr_spec.np);
> +               return 0;
> +       }
> +
> +       of_node_put(pwr_spec.np);
> +
> +       if (ctx->gpu_reset || ctx->clks)
> +               return 1;
> +

One thing that bothers me is that this is still a fragile construct. I
know this cannot happen in this particular design but in theory, this
would not work if there were multiple simultaneous consumers of the
AON power domain. Maybe just to be sure: store the address of the
of_node of the consumer (preferably bumping its reference count) and
check it to make sure that once a consumer associated with this node
is connected, we no longer allow any other nodes? This way you could
also just drop this if replacing it with checking the existence of the
of_node.

[snip]

Bartosz
