Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA4D1B2D3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E710E541;
	Tue, 13 Jan 2026 20:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JOeSqGUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9658979D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:23:05 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-121bf277922so9375273c88.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768328584; x=1768933384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktFARcL7abjEswMdxHANS1AOCLFu8aD4rHTTseQcdl0=;
 b=JOeSqGUTiGwxgzLDl3piUwyx/v5HgKGf3syFPgyIqM11ZX9VsXIJNrPL8Uivw3NiNl
 iEGRzse9ThFmWoJRkVkAmfXcbuddALs9oIpruIJO/61Jw8nfbZYq+n9EdcCYl6J/TjBq
 voUzMUoGU59H1yidjTBVYIWikJGT18fY3fRjMpuDW09Xes4VABkOD1WtVZ7mitUWwpSh
 dru0M4FWgRItpvb/XOy45TJBYIQChPGDgYS0kQVHEJSZEfiFLuUxHaTpeoKhJmOCpl8Y
 Yk4FVY07c92WVi9nHV/O5HMK8g6rzqYQ/h7LnpQkKHehsX2YKPqUjvT3HehXxYOTebvg
 tzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768328584; x=1768933384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ktFARcL7abjEswMdxHANS1AOCLFu8aD4rHTTseQcdl0=;
 b=wK+QecMc4dgjroJi0QYGIrNwoG4YovvnndcQ9vcc3rmWAhVYey2tWOhCAsXlpfO4+g
 0q2vnH+TILQ+Ya+seXO4MifYeBRPMd1mmWVMETlcwxf/rYQwJ4aZoSgnIA65ku76204U
 zj4MroUju7WpHCmro0+MMHa+dJ1hxgnzykv/vCQ0pQGXxi3BZNtmG6ptgVf2hgizquRH
 KSO1rxZ3ZE7iq4uouSdbYT9fYlS41m7k5vYTGws4c85WZUecxcYEDeMVt48aTEKzDIcJ
 lJbD1sO/zak4C4arwgkPCwtbTsGECiR+GnWZULJtkofxoS0a1iKRoiHGOpKfRsbrl4JY
 O7MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjT1zZP6r7Nz4ufeInNyCzGCrUSQON/UFyWrZV3vZH0Bd2zIqVuWWFQLYWW3JEAIiqlNdS2gmgms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6J7ePIgXi3rbe+6HEa+wP6DWhi/7hDaTSFdiQwLdFj/C+PUHC
 YXvza2QNWaSi3oHKUAmddpos5bzPnODjtwI6UDpctjQTpf2TEp9d5vHwcS4tl9oOLpArgSjER2y
 gHgibXxShXZV0n6niGltS4EPXFbD8Cuo=
X-Gm-Gg: AY/fxX6+zerq7YTlUnGmLGX2jw7nVGBG9FqGGR8CYDuDlVUiCxqSwALqSaDJA/16GN2
 vf9VrDuQ50kycphoW+dktUNsoIRPNqFOuzqkHddgiE3rn3VK8FSVgtexWTDSf3aCz8faBVG5S8p
 y9wvvsRBGCFjRz4xzc/R8xFkMWGB8GWXKG3L+fsv4yLlJBFPqrnRPXYJer31I52pJ2dLP+AvdyC
 +lug+kso57QKC+ROiYsuBCCwRqI0sGWf9cp1pfmS1NmCX8Rm5vIBUp/Fedd9u8KzG+94pSLLnRp
 46V7LORVIhVQW/PGZIoGOdahwy3z+gKETHvZlroGEEXk3aymUCDoULLay7+gm2utpdDqrg0PZp6
 7KhiJXAxCc82y5GI=
X-Google-Smtp-Source: AGHT+IFry5mrp+qhfmaTmFowwpyilhTDV99e4+YsYHR4eczlm0CCEKca1hIFDilnVzeT/ocGVM7wlP2rRttk0FeEdcc=
X-Received: by 2002:a05:7022:613:b0:119:e569:f62e with SMTP id
 a92af1059eb24-121f8b8d73amr21681821c88.39.1768328584025; Tue, 13 Jan 2026
 10:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 13 Jan 2026 12:22:37 -0600
X-Gm-Features: AZwV_QgGjFNmrIcWdIpWbLrkpdUzkEwOLFO_r4C0G38vOy1_mGAz7cr1Zzr72TQ
Message-ID: <CAOCHtYgW4Gzyed3oTofjZYzZ+Umr1Q2fxNm7uGDEUmnG-kXyOg@mail.gmail.com>
Subject: Re: [PATCH 2/5] accel/thames: Add driver for the C7x DSPs in TI SoCs
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Randolph Sapp <rs@ti.com>, 
 Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 13 Jan 2026 20:19:08 +0000
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

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
>
> Some SoCs from Texas Instruments contain DSPs that can be used for
> general compute tasks.
>
> This driver provides a drm/accel UABI to userspace for submitting jobs
> to the DSP cores and managing the input, output and intermediate memory.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  Documentation/accel/thames/index.rst |  28 +++++
>  MAINTAINERS                          |   9 ++
>  drivers/accel/Kconfig                |   1 +
>  drivers/accel/Makefile               |   3 +-
>  drivers/accel/thames/Kconfig         |  26 +++++
>  drivers/accel/thames/Makefile        |   9 ++
>  drivers/accel/thames/thames_core.c   | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_core.h   |  53 +++++++++
>  drivers/accel/thames/thames_device.c |  93 ++++++++++++++++
>  drivers/accel/thames/thames_device.h |  46 ++++++++
>  drivers/accel/thames/thames_drv.c    | 156 +++++++++++++++++++++++++++
>  drivers/accel/thames/thames_drv.h    |  21 ++++
>  drivers/accel/thames/thames_ipc.h    | 204 +++++++++++++++++++++++++++++=
++++++
>  drivers/accel/thames/thames_rpmsg.c  | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_rpmsg.h  |  27 +++++
>  15 files changed, 985 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/t=
hames/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca8391031f226f7ef1dc210a3=
56c86acbe126c6f
> --- /dev/null
> +++ b/Documentation/accel/thames/index.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + accel/thames Driver for the C7x DSPs from Texas Instruments
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The accel/thames driver supports the C7x DSPs inside some Texas Instrume=
nts SoCs
> +such as the J722S. These can be used as accelerators for various workloa=
ds,
> +including machine learning inference.
> +
> +This driver controls the power state of the hardware via :doc:`remotepro=
c </staging/remoteproc>`
> +and communicates with the firmware running on the DSP via :doc:`rpmsg_vi=
rtio </staging/rpmsg_virtio>`.
> +The kernel driver itself allocates buffers, manages contexts, and submit=
s jobs
> +to the DSP firmware. Buffers are mapped by the DSP itself using its MMU,
> +providing memory isolation among different clients.
> +
> +The source code for the firmware running on the DSP is available at:
> +https://gitlab.freedesktop.org/tomeu/thames_firmware/.
> +
> +Everything else is done in userspace, as a Gallium driver (also called t=
hames)
> +that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
> +
> +If there is more than one core that advertises the same rpmsg_virtio ser=
vice
> +name, the driver will load balance jobs between them with drm-gpu-schedu=
ler.
> +
> +Hardware currently supported:
> +
> +* J722S
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8feeff25613c59fe9c929927dadaa7e..a3fc809c797269d0792dfe520=
2cc1b49f6ff57e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7731,6 +7731,15 @@ F:       Documentation/devicetree/bindings/npu/roc=
kchip,rk3588-rknn-core.yaml
>  F:     drivers/accel/rocket/
>  F:     include/uapi/drm/rocket_accel.h
>
> +DRM ACCEL DRIVER FOR TI C7x DSPS
> +M:     Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Supported
> +T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:     Documentation/accel/thames/
> +F:     drivers/accel/thames/
> +F:     include/uapi/drm/thames_accel.h

Oh where is this "thames_accel.h" ? ;)


2026-01-13T18:16:11.881084Z 01E
drivers/accel/thames/thames_drv.c:8:10: fatal error:
drm/thames_accel.h: No such file or directory
2026-01-13T18:16:11.881086Z 01E     8 | #include <drm/thames_accel.h>
2026-01-13T18:16:11.881087Z 01E       |          ^~~~~~~~~~~~~~~~~~~~
2026-01-13T18:16:11.881115Z 01E compilation terminated.
2026-01-13T18:16:11.884552Z 01E make[8]: ***
[scripts/Makefile.build:287: drivers/accel/thames/thames_drv.o] Error
1
2026-01-13T18:16:11.884694Z 01E make[7]: ***
[scripts/Makefile.build:544: drivers/accel/thames] Error 2
2026-01-13T18:16:11.884926Z 01E make[6]: ***
[scripts/Makefile.build:544: drivers/accel] Error 2
2026-01-13T18:16:11.884976Z 01E make[6]: *** Waiting for unfinished jobs...=
.

$ find . | grep thames_accel.h
$ grep -R "thames_accel.h" ./*
./drivers/accel/thames/Kconfig:      include/uapi/drm/thames_accel.h
and is used by the Thames userspace
./drivers/accel/thames/thames_job.c:#include <drm/thames_accel.h>
./drivers/accel/thames/thames_drv.c:#include <drm/thames_accel.h>
./drivers/accel/thames/thames_gem.c:#include <drm/thames_accel.h>
./MAINTAINERS:F:    include/uapi/drm/thames_accel.h

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
