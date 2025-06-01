Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A9ACA116
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89E10E0FE;
	Sun,  1 Jun 2025 23:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="vPcUiYHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF910E0FE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:05:32 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-afc857702d1so2990334a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748819132; x=1749423932;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1fvDqBrE4PSD/vq25y+z/0fv2r3rQKmt0xaBYl9gR/Y=;
 b=vPcUiYHJ3BA6QRwGkcT2cL4hJFHnZU3RRWGxMoeQKvLhKXC9GwKYP4HUFOVzogbxOq
 s95tcWmobRZFJ7VvGPucVZCQo7jlGZy2D8aoUEXkwgxnvDXFTBAhXvfZQScb+GrPnrjO
 T4CHSR3Dsye9GlBlfODTRzANkaP6m33G+wr8wCTFOFmHulv8VTss0qLwxPdiu+SphNpn
 VHmiVYUBJu2IrCVCbmBbzdDLguxYMQ/ysXrGpM80A5eHTieqlglZPKdwcEs4k8rQiYJy
 6tX53/48KRQUHp8+YiAvPmL0RpXK+pgukABCMg/a9XHnJxfj7FD+4YthYYIVDO3h1K0e
 Xb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748819132; x=1749423932;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fvDqBrE4PSD/vq25y+z/0fv2r3rQKmt0xaBYl9gR/Y=;
 b=jL9K77warStgPUDPGi91qPq3mHXY6o1fOmuEg4ml2rQEp/sha3Wlf0LLOfE8DhE1iT
 iDfSc0mxDiYHrcBteT9devh9ljzBRyeSBx+IbiQWqHmrlip345/6KK2z8fBw/kg70/5x
 dLjQ8jP1QnbCz1d/gyH0lzIvEt0HboIltFAeWzd18V/NJbDZxfBdLo6xcsnFZGiNzwsm
 X+RwveDM+3TQSsC/uCMiOU5ZiW7X8oLlReqQiIogqvixvnHhut7m42jvgzr07nB/9JUG
 5snXuCHGKCp0kboGUd2vKPInN90GFtGAEfxHjgM0bS8dSG79VKQ7YcLdD5ij9CSApQPH
 2qeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULOEBVajR9IL4UJjg8n3RVKdYTv9akA6Xmsuox3527HzLXl35kSOAaj2P32RtO+g7H+JtWms1J53A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzua93DMAJTc7+ZN+fwJvdln5HzaNJU9yrceWnL2I4lNtV+UdLw
 Jcwd/H+D9br0QO+MRQew8dKAyO75OF+mqUaK0LcGzsSN5Rh+ft5gJ37QVSRY1F3sjeE=
X-Gm-Gg: ASbGnctJLc/qyABY1YtuX73e33po3jPXXCI5XTlj6tT0kCrE43iKrPK2psugaZMmWpS
 Y+shbGMnivPYr+8EzD6NN3qz1YcHlAkq6WDwfHmGeu6VrNJjtv+YlWOC0Wtg8OdwBNY7DJey8ME
 0rW5/vskThQ1A/80I6lXE6RbHWbBaYJ1I/2g/m2cHuvrbjTnFaANn/KB1yFBpij7q8Udbsu7WFh
 wJYx9WeuRSuoxdYZcShy8PH5hYqqoeadDZcDktqG/0TlYaohwzXQgd5H21C1+Uq/g+UjXdViYot
 z1Zt/bnmVMiwhRMDaI7qmi5glt/517g9
X-Google-Smtp-Source: AGHT+IFJ93lsJS+eE0bjnFv6KmogL+dSl97lhohNWrj7NLeLEHx5L8l95tdQ19djgO3Tt4ygx5bUvQ==
X-Received: by 2002:a17:90b:4c09:b0:312:1b53:5ead with SMTP id
 98e67ed59e1d1-31240d1c0d7mr15746377a91.4.1748819132212; 
 Sun, 01 Jun 2025 16:05:32 -0700 (PDT)
Received: from x1 ([97.120.245.255]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d14ca5sm59442445ad.242.2025.06.01.16.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 16:05:31 -0700 (PDT)
Date: Sun, 1 Jun 2025 16:05:30 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aDzcul5vBeQvP634@x1>
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
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

On Fri, May 30, 2025 at 12:23:47AM +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
> 
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.
> 
> The series is structured as follows:
> 
> Patch 1: Adds device tree bindings for the new T-HEAD TH1520 GPU
>          power sequencer provider.
> Patch 2: Introduces the pwrseq-thead-gpu driver to manage the GPU's
>          power-on/off sequence.
> Patch 3: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 4: Adds the TH1520 GPU compatible string to the Imagination
>          GPU DT bindings.
> Patch 5: Adds the missing reset controller header include in the
>          TH1520 DTS include file.
> Patch 6: Adds the device tree node for the GPU power sequencer to
>          the TH1520 DTS include file.
> Patch 7: Adds the GPU device tree node for the IMG BXM-4-64 GPU to
>          the TH1520 DTS include file.
> Patch 8: Enables compilation of the drm/imagination on the RISC-V
>          architecture
> 
> This patchset finishes the work started in bigger series [2] by adding
> all the remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.
> 
> This series supersedes the previous genpd based approach. Testing on
> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> correctly.
> 
> This time it's based on linux-next, as there are dependent patches not
> yet merged, but present in linux-next like clock and reset patches.
> 
> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
> defined as a fixed-clock. The specific hardware frequency for this clock
> on the TH1520 could not be determined from available public
> documentation. Consequently, clock-frequency = <0>; has been used as a
> placeholder to enable driver functionality.
> 
> Link to v2 of this series - [3].
> 
> v3:
> 
>  - re-worked cover letter completely
>  - complete architectural rework from using extended genpd callbacks to a
>    dedicated pwrseq provider driver
>  - introduced pwrseq-thead-gpu.c and associated DT bindings
>    (thead,th1520-gpu-pwrseq)
>  - the Imagination driver now calls devm_pwrseq_get() and uses
>    pwrseq_power_on() / pwrseq_power_off() for the TH1520 GPU
>  - removed the platform_resources_managed flag from dev_pm_info and
>    associated logic
>  - the new pwrseq driver's match() function now acquires consumer-specific
>    resources (GPU clocks, GPU core reset) directly from the consumer device
> 
> v2:
> 
> Extended the series by adding two new commits:
>  - introduced a new platform_resources_managed flag in dev_pm_info along
>    with helper functions, allowing drivers to detect when clocks and resets
>    are managed by the platform
>  - updated the DRM Imagination driver to skip claiming clocks when
>    platform_resources_managed is set
> 
> Split the original bindings update:
>  - the AON firmware bindings now only add the GPU clkgen reset (the GPU
>    core reset remains handled by the GPU node)
> 
> Reworked the TH1520 PM domain driver to:
>  - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
>    callbacks
>  - handle clkgen reset internally, while GPU core reset is obtained from
>    the consumer device node
>  - added a check to enforce that only a single device can be attached to
>    the GPU PM domain
> 
> [1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
> [2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> [3] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com/
> 
> ---
> Michal Wilczynski (8):
>       dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
>       power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
>       drm/imagination: Use pwrseq for TH1520 GPU power management
>       dt-bindings: gpu: Add TH1520 GPU compatible to Imagination bindings
>       riscv: dts: thead: th1520: Add missing reset controller header include
>       riscv: dts: thead: Add GPU power sequencer node
>       riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
>       drm/imagination: Enable PowerVR driver for RISC-V
> 
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
>  .../bindings/power/thead,th1520-pwrseq.yaml        |  42 +++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  29 ++++
>  drivers/gpu/drm/imagination/Kconfig                |   3 +-
>  drivers/gpu/drm/imagination/pvr_device.c           |  33 +++-
>  drivers/gpu/drm/imagination/pvr_device.h           |   6 +
>  drivers/gpu/drm/imagination/pvr_power.c            |  82 +++++----
>  drivers/power/sequencing/Kconfig                   |   8 +
>  drivers/power/sequencing/Makefile                  |   1 +
>  drivers/power/sequencing/pwrseq-thead-gpu.c        | 183 +++++++++++++++++++++
>  11 files changed, 363 insertions(+), 35 deletions(-)
> ---
> base-commit: 49473fe7fdb5fbbe5bbfa51083792c17df63d317
> change-id: 20250414-apr_14_for_sending-5b3917817acc
> 
> Best regards,
> -- 
> Michal Wilczynski <m.wilczynski@samsung.com>
> 

Thank you for continuing to work on this series.

I applied it to next-20250530 and the boot hangs:

<snip>
[    0.895622] mmc0: new HS400 MMC card at address 0001
[    0.902638] mmcblk0: mmc0:0001 8GTF4R 7.28 GiB
[    0.915454]  mmcblk0: p1 p2 p3
[    0.916613] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.920107] mmcblk0boot0: mmc0:0001 8GTF4R 4.00 MiB
[    0.936592] mmcblk0boot1: mmc0:0001 8GTF4R 4.00 MiB
[    0.944986] mmcblk0rpmb: mmc0:0001 8GTF4R 512 KiB, chardev (243:0)
[    0.947700] mmc1: new UHS-I speed DDR50 SDHC card at address aaaa
[    0.961368] mmcblk1: mmc1:aaaa SU16G 14.8 GiB
[    0.969639]  mmcblk1: p1 p2 p3
[    0.986688] printk: legacy console [ttyS0] disabled
[    0.992468] ffe7014000.serial: ttyS0 at MMIO 0xffe7014000 (irq = 23, base_baud = 6250000) is a 16550A
[    1.002085] printk: legacy console [ttyS0] enabled
[    1.002085] printk: legacy console [ttyS0] enabled
[    1.011784] printk: legacy bootconsole [uart0] disabled
[    1.011784] printk: legacy bootconsole [uart0] disabled
[    1.024633] stackdepot: allocating hash table of 524288 entries via kvcalloc
<no more output>

I pasted the full boot log [1]. I have clk_ignore_unused in the kernel
cmdline so I don't think it is related to disabling clocks. Boot does
complete okay if I set the gpu node status to disabled.

Any ideas of what might fix the boot hang?

Thanks,
Drew

[1] https://gist.github.com/pdp7/44bd6de63fb9274a66a705ad807690b6
