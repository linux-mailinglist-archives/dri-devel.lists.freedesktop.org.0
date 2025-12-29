Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44BCE69B4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 12:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E47D10E40A;
	Mon, 29 Dec 2025 11:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pUWE05Ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0949210E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 11:52:51 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5959187c5a9so7754922e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767009169; x=1767613969; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
 b=pUWE05UxUfS6W8b0Gj9J4j+mp3d50E3JesPzzuR5znn35Ohi/Ny4wO5q3xW5j6C2Vu
 rsboeJWk9dQQB0F03UOi+l8c9GjI1TnK5X6OacB8JBsb850nkCLPnH7gLwhnKZVeal41
 mo7V56iaZtHi7kqdK6Y8uIdHs6D9zEJ/jTabe5hQWWkY7+eKoyFcZcaL3xJ7UEYndaWL
 /RNE8JRX/Y+fbkMNJtR5Ijk2kqGkpb76tA0B5qmd8ZMldo//N5yiIk/UUv66jwDfIjCh
 sLtSdOO3nzO1a3QPRmht/PiqCA0OQpzu+I9Bye+f4Z8l3Gd2wiqeXNteZc7gkL+mmOSV
 MdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767009169; x=1767613969;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
 b=H1O9VJPpRZXP3gpUNTvNcMeERie+8BC9JBtIAYOc19pG/DaNtM8cJtLjHr6W8X4AFv
 Lfdeu3BGczH0MWgwwQfmlp5Nqy+cMwnxXKTNJeIlBNWdyUnQhIE2zAaC+P9ce0KRSJSu
 Xn9OWJcQvQGcBMgSRvBkouA3x6rC+SKkKNelPf0pn3zK8KdtqCsqNVqtAn5zGAnWmzMY
 edENDiqL/rMx9+tU+vRZiuA1pngI6eY0rVCmeyNeV8/cdKT8obbx5cbP68TTGXg8vmtL
 ETyjCqClt6pBeKlZ+Pd7X95Yz4y6X54IxbHKhrlEFH03OeQJf5e7h04tLRLyuxh+9r4Y
 8twg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Nw3M1ESRb+o090RsSoV39PFCavVp+Bz/ncBXmDPKVZ/J1CDmVCCMqAv3LtXtzY/mrD5TJ2CIhnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj5RAiYJIXhNDHPqxYH/7vNDdilNw88rJ7fhEMyQZRXmfFx9I5
 /B+we6PcuAozqh0Qm0mtLY8S8h2jl8Qnt07K85E3PK2VzR2ZqyWXaLu4H5DOxqJGQamSl0Ay8ze
 BpYmfYkAThTqHrWfpEgWV0zI+rT6LWVerP7ceX8NzFA==
X-Gm-Gg: AY/fxX5Y4PxM28jAvumll5YE9xmrQKPeK/FhjA/owVQL8OUPRekTD/wfhEVxYuJU3EL
 726Tr7O2sybtlun6bq7lgsyHYCttH0RxnG8sT2rJflDoMeIGtc9UNi4VKjLQ9ZzrCBJ4LXTPw2J
 0UMf+dxD5oNIF0MLwP4CdYWePHkqRXPM072ke7yGPjnKbTe6f0gKMIN/LuSP7iKc7cY86WbZnCb
 Ifav+JM5jLzNMUKZF8BXy0/kQMIt6INlIKIvIF0ULhEwfVS+n1cnl2WZb2lS+U3GXpdtVmL
X-Google-Smtp-Source: AGHT+IGXTnQvaqHS0G2iP51aqu1mvuIV4jhgR6at2cQP1b4/0bJHJAEiAFHVEV4s8SZhwvY+c3cbe65DWXNr4JmMalg=
X-Received: by 2002:a05:6512:3686:b0:59b:4213:7587 with SMTP id
 2adb3069b0e04-59b42137644mr469217e87.27.1767009168978; Mon, 29 Dec 2025
 03:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 12:52:13 +0100
X-Gm-Features: AQt7F2qiYKGEucbLF3l0nxkbcDv5up47FHRBhmipPDgxy8BIo3kAL2HBIUAOYlA
Message-ID: <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
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
 Chen-Yu Tsai <wenst@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 20 Dec 2025 at 19:50, Nicolas Frattaroli
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

I have applied the pmdomain changes in patch2 and patch 4 for next, thanks!

I assume the gpu changes will be funneled via another tree, but let me
know if there is a reason to keep these changes together.

Kind regards
Uffe


> ---
> Changes in v2:
> - panthor: move to nvmem_cell_read_variable_le_u64
> - mtk-mfg-pmdomain: put of_node in error path
> - mtk-mfg-pmdomain: remove leftover stray of_node_put on NULL
> - Link to v1: https://lore.kernel.org/r/20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com
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
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 59 ++++++++++++++++++++++
>  4 files changed, 116 insertions(+), 6 deletions(-)
> ---
> base-commit: 638148c6ffa31d2e4958d51708ff3675221e2da7
> change-id: 20251217-mt8196-shader-present-e2dc3f97fc74
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
