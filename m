Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC533BB7DD7
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC02B10E95D;
	Fri,  3 Oct 2025 18:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LIkjj3fI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B943710E95D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:16:03 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-72ce9790ab3so30160617b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759515362; x=1760120162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
 b=LIkjj3fIBwRf0bT8hVTDXyzb6QcYGs7i40M6HzWCmhGPjlAp15yJBVYKCIbm6U6rJh
 30kUVXtZMJtWzuo3Q9K0FupiLq32ioZjyhlnXXaaxC6wfzSTBCAW+cTOiOP/gcnsOVj3
 eRWBJCAgByTKa+z7W9paxCKJ3g21lmES3hIH0MqRq2e+ld4Tsz9DShjYxMfowoB1Xj2E
 75q8N9tlzI+OF3HvO+RqtP52DSWxLLZAQzgZdloF6efJddGlz8qnxzhOsG+AQtCNOZDv
 tYYhaNcJRWeJSqsSULdInQD23xDSTPMTgsP8XpATjZNgU0Tc5AxH+k861f+PhCbQTBsC
 darQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759515362; x=1760120162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
 b=dY9LPdHNrK/JTJ/h1ViixtJjsqRC7U1oz5scbnXOHNkOMI+wCrUJ0nVdNZzGxAgA5N
 JtszePuSaDjgEPe+K5odqcluH2PCyzoh3nThOYLdqAQ0ifVkftPgtPnin6ELpzcf/J+U
 KVb7gj6IEK1jzbsS05AvwFWn2bRS0DHOzExeUBzU2Z3lE6+WZpAgpWUk8RBbMjYPre80
 acPxBhJl6OMzLwKJ01GfjsfM94oBbsV5SjN+Tm9zKUHIwjFWo6l3kPdNjNA6Sn7rAFhI
 6T53PUagb+crZOehdOfw1ft8cPkL+atGFosYwNpebprVXPrFYQjeAgIvfGdjcEEDU4yp
 sIPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOhFBQeXwRobCBPUkwo9169mzYDO46P94Lylk7qcp1BddVkmq/ReWIIU+n5zHauGdrteqJlTTgvaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhM8IBsVcEbBEpFZnbUyPW3It19a3cjgx/bC69zu+j0nbYaQ0B
 jELIyzxx98Wzlox9snggqHKT4GMPMz3CXhHIdMzj2cVsBTpEYY9LkybkSRF9X8yP9PVp0Fsj/pF
 6X/bpo9/sx92dPAeaIv481gxtl02+7XE=
X-Gm-Gg: ASbGncuP7iAGMQ4zw2Bh/GbdV+B0NOQKRQ3V+/u9ziz6cQr8guYocJhh3D3YXS6DNPs
 0wQUBehBXKy8Cl9iqnI3ZhsWYUqdWarkmiVklbVPPiPBde5XVm8YyZNqoM52JAm68sl//Wg3tDJ
 4f8NefHKKUGInlwD1vyBLKfQRIPwMkdbFq2e/h6FbYbLFyJTu0rNS4XdqlqeRrJxTGIWnZYxXD+
 T7M1UVv1OSjJJJNrscqqnRDnHYakl8nA5smT4ENCsjvx97/GV8NEtxQR9T7IFk5eZWGHcqcPocP
 LJ+XFmPAF8jVeYC5hqI19PtxAg+7C7r1
X-Google-Smtp-Source: AGHT+IHcaFQJqVTztaB0e9RyZeNiAagOyj3g8KNYxpfdC0wTuijqki+QAQ/mSLPGzCBtgMgInYIWdXqQgPlyAlcpaNk=
X-Received: by 2002:a05:690e:28d:b0:604:3849:89a8 with SMTP id
 956f58d0204a3-63b9a076118mr3027885d50.16.1759515362277; Fri, 03 Oct 2025
 11:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com>
 <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 11:15:51 -0700
X-Gm-Features: AS18NWBanN0MXtcDFrnukKn4J7dSEQIT7fLhFbzGJzYOporRHK4S0vyKzeHBSFc
Message-ID: <CAPaKu7Tz9tw=fbz17kpPn1Pj_YsGRJZR9o28zkfiBgvxL3rdxg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
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

On Mon, Sep 29, 2025 at 12:47=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MT8196 SoC uses an embedded MCU to control frequencies and power of
> the GPU. This controller is referred to as "GPUEB".
>
> It communicates to the application processor, among other ways, through
> a mailbox.
>
> The mailbox exposes one interrupt, which appears to only be fired when a
> response is received, rather than a transaction is completed. For us,
> this means we unfortunately need to poll for txdone.
>
> The mailbox also requires the EB clock to be on when touching any of the
> mailbox registers.
>
> Add a simple driver for it based on the common mailbox framework.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/mailbox/Kconfig             |  10 ++
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/mtk-gpueb-mailbox.c | 318 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 330 insertions(+)
[...]
> +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D data;
> +       u8 buf[GPUEB_MBOX_MAX_RX_SIZE] =3D {};
nit: move to inside the if-block below.
> +       int status;
> +
> +       status =3D atomic_cmpxchg(&ch->rx_status, GPUEB_MBOX_FULL | GPUEB=
_MBOX_BLOCKED,
> +                               GPUEB_MBOX_FULL);
> +       if (status =3D=3D (GPUEB_MBOX_FULL | GPUEB_MBOX_BLOCKED)) {
> +               mtk_gpueb_mbox_read_rx(buf, ch);
> +               writel(BIT(ch->num), ch->ebm->mbox_ctl + GPUEB_MBOX_CTL_I=
RQ_CLR);
> +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num], bu=
f);
> +               atomic_set(&ch->rx_status, 0);
> +               return IRQ_HANDLED;
> +       }
> +
> +       return IRQ_NONE;
> +}
