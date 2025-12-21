Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425CCD3942
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 01:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F2210E059;
	Sun, 21 Dec 2025 00:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dg0hJyF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DD110E059
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 00:33:39 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-6467bed0d2fso262799d50.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766277218; x=1766882018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8G9KmswsznvRwWx5QwQoiucqBCNKeB6cJ130wl/F5s=;
 b=Dg0hJyF1d5WOcmNr/YEX0JsLVMno5hXKfP/Fvnp2/ZGMESUnNsFRhimMFE9MDIEEBa
 g2gDNSWiBLrpjxvOh3/a0efhl6+mI4+wVnSAf+dWLfrBTEISPOJ6wY24KXbgm/WaEamY
 uEiRlhcNOob14RXUU6lF9PTt8+YkS6qb8ivf6w+O8eJ16NQ9IFX2eOZ9whyungFAbzqz
 B298H6im3a/JFRRLqmFtRFvhw9AiHjPNCXKaY36PhU1vmZQitGtD1yUSR0AEmD1JLJBY
 cddy+fzDOiJJxyreqhOmCrSHdfSii/LuDE4wqLi0wW8EoPpuhQLI1mkMrh3YZnSay31o
 esbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766277218; x=1766882018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X8G9KmswsznvRwWx5QwQoiucqBCNKeB6cJ130wl/F5s=;
 b=qX1Pm11cqbcy8abpbNuVlA2C/tDxxkqCg/poX2XamJ/gFYQuQEpYrXGJnZSbutMmL1
 nBuDtvsIkzLK0oxw5fjuvjJnGg688K+I0acXKd7OCLHZBrVRe16LHnDfaDEOs+HJ5Nd/
 R3fN6jLkvHSnFwAHaXaPDR8+dpV4fG8NWgEGk0OfoGesIkgr7ehf+HfVtvwDWqW7M91u
 5LKUU32VmlJ/WLkf1TClPYSKADMal2RgUD03v8LktlRPy7CgeiyoLVWuSsqw5gaFTFut
 yAl+xoca0S1sdn+7ZEjWsHY4CwvQnFQFOrhdgo0kpFUtIh/3fAv0Js96RsfqHgg4C1Ri
 2M5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX18l0ekLRB3TbHSCNoW/2D2BhJB3OXV3Tzp8e2eMg1D/zWTj6O+By5nHt4E6L38e+Vl071fQLzH24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5A2xzf1G/QVpukZekqLu0uV2baDUqjRFMpvTlmq857rvFk6ta
 L4A7DwZ/SNQ2d+rkHdwj22hPeQIcxmDHBzUfyQNvF++hK/ypjtDVvYfVul295qrlc/erwoTWviz
 r9P5R9R235Wx9R7nCmXxYvSfoiksB87g=
X-Gm-Gg: AY/fxX5p905L1b4fkv++EGVuH9vyNE8oKLwVSk3Wr1Z3erFX+M2DGcJh8PqHQnoFV5X
 zoTPJPLabsMt0yxOQNZwGcbz/V9HkCj1HXGNg/K3qsE9PKcrY4RHspVBd6Bux5QzQg3EB3FpKCg
 Lp7BS9yGNb72nrhdoCP525mxvS8lpg+HQX6TbgJdLqRC0safu9r9mPHCNh/Y6kyXLT1ICdwZpSA
 QCAMwUv2g+SjVtmmr6vvOJoj6kKKQMlXMGH829M+taB2X2yYb0W3bPCcYdKljsbNid6vJd9zCqN
 niCkN1e2e+z4WusjLNOOde/6mXK6
X-Google-Smtp-Source: AGHT+IF+DcP7RBnj1eO65Ay4KAdaw9prgtbEqd38CqDRILia9eh90RWgdc07UopBt80TakLnfpkNrhhTAdF11Rmi1Ew=
X-Received: by 2002:a53:b08c:0:b0:644:6422:cb2 with SMTP id
 956f58d0204a3-6466a8c09ddmr4928743d50.47.1766277218122; Sat, 20 Dec 2025
 16:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 20 Dec 2025 16:33:26 -0800
X-Gm-Features: AQt7F2pQeCDszCkhBlVBNoYZ8W1xv30ESuUDKy-HkDBic1PvCA7PvceQ4heu6Pg
Message-ID: <CAPaKu7QST65NPQ7rZAGhqLsb4FN21D-rOvUf-UzgsBCrOv1skA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from
 nvmem
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
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

On Sat, Dec 20, 2025 at 10:50=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> only functional shader cores, but also those that are fused off to
> improve yield.
>
> The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> found in an efuse. However, the efuse address is considered
> confidential, and is not public knowledge.
>
> The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> on this SoC, knows and reads the efuse however, and exposes it in the
> shared memory intended to communicate state to the application
> processor. Reading the bitmask from this shared memory area is the
> vendor's intended solution.
>
> This series models this in the binding and implements it in the
> corresponding Linux drivers:
> - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
>   property to declare that shader-present is in a different castle
> - the mt8196-gpufreq binding requires nodes to expose the shader-present
>   cell
> - panthor checks for the presence of the shader-present cell and uses it
>   as the shader-present value if it's found, instead of the Mali GPU
>   register contents
> - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
>   queries for the shader-present cell
>
> While it would be preferable if we could read the efuse directly, it's
> not possible as things stand, and insisting on it will just keep this
> hardware from working in mainline. Running a GPU workload with a
> SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> GPU rendering output.
>
> Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> not lying about the hardware's capabilities, as it truly does provide
> access to the nvmem-cell, even if it acts as a proxy.
>
> From a bindings and panthor perspective, this is also generic enough to
> where hypothetical other vendors doing the same thing (even with direct
> efuse access) can rely on the same cell name and implementation.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Series is Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
> Changes in v2:
> - panthor: move to nvmem_cell_read_variable_le_u64
> - mtk-mfg-pmdomain: put of_node in error path
> - mtk-mfg-pmdomain: remove leftover stray of_node_put on NULL
> - Link to v1: https://lore.kernel.org/r/20251217-mt8196-shader-present-v1=
-0-f6f8f3aa1e93@collabora.com
>
> ---
> Nicolas Frattaroli (4):
>       dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
>       dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
>       drm/panthor: Implement reading shader_present from nvmem
>       pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell
>
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 14 +++++
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 13 +++++
>  drivers/gpu/drm/panthor/panthor_hw.c               | 36 ++++++++++---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 59 ++++++++++++++++=
++++++
>  4 files changed, 116 insertions(+), 6 deletions(-)
> ---
> base-commit: 638148c6ffa31d2e4958d51708ff3675221e2da7
> change-id: 20251217-mt8196-shader-present-e2dc3f97fc74
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
