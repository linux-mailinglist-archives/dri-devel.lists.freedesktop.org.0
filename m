Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D616ACBA5F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 19:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913110E571;
	Mon,  2 Jun 2025 17:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="bqQFNWXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E08110E571
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 17:33:10 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b26df8f44e6so5020470a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748885590; x=1749490390;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p9nDTLkcGAIkg7CRE/p7klOUylClrsHD4YAyslCH86o=;
 b=bqQFNWXc34nJVzWDUnb7sLOK+S29HcKOLbQlq6eGSBXwoV2njVy4m4s+RILRYLAQnO
 LVyheZ4Leerc/Z2Gc/UDgfhZAyRIYU22okPkS5j+BV1U01Gzp+pY/K90lalLzqNrqFfO
 XJWMzu60k2iMMM6uABUfw4J01vTRKkH6gh3ZOqAW8gApHGAK/1Ue6P7H822Y8s57/x2m
 pMKvbUKmi+KLN8/iZnyvfw/URgfZ8Ynrm16/RnFloSh2oT9kqbv4JFpXZAGLMB+2BAG8
 /gzPFcbHof92jBZAC+MxxlQnE1P4gIxma5YEQLUpjQhVW1GTTL2mO88rHiJ7ZWUXS0Hk
 Z/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748885590; x=1749490390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9nDTLkcGAIkg7CRE/p7klOUylClrsHD4YAyslCH86o=;
 b=T4QZCMRuNMFSWw8DTEgVugeuzndfhnZdUc6f6Dyr/gAV7WmKSjyE4wEWHvpQ8xNG+8
 PcCbUnavCsCWvueDdq2HGPaXizttXKX+4ZXfAfondd7FOkpoe7TwbD9/Xyushh69IIEA
 Ns5YCGN7nx9nWn3nmJgKGxn6G/5fLy6e10FiznN8X8o4MIQtlNYihuQclcjwFVdh2hzP
 Z9RvZ0dJ4xRkMfdWAbEzChYjxD0lP8mtXep76OVTEGSJdBVevSrxmenthQrPmzzGbwst
 M2BuAL1WLwTySDpXLMRJCNjHNX9QQriK1qNVVibo3bauKUaGXw0fOv+BWuWdBwfNHqTX
 R/8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGDUqIgkqYHnTs1lq3bZUMiUfpUKzvmNjuHXlMNVjBocYIRNc0DDfDJC0BN0xqeb8uUHnjsCB0gBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8t/VzQPD3tFR590cLkdACIHsqtx4wF8p20unZGWx6qV+isfot
 L+qtFfUdyBfB2aE0AJ3/13Djex3uhxrBY/zuB4OQuwQGZa75clPDmhal+qIF4eiUPS4=
X-Gm-Gg: ASbGncuV4UXNsPAjR4exuMXcK91ae6d8scMJgrlUAyqfGWBPsw9FdG7/Y/UXStgdEqz
 TGRmLbvX/Pv1fxnUKjngpPZ2dBmOiYAD4pB0OO8cD5+J1K2HEnrTTgNXaENnM/IGrENfRBKISUq
 yh0Pqt+od7nKFwLT7JJuAEV2qSIltAz1BEoUZZKAFuDV3+mG3yfEm0zQsyo1qoq8mW2SZ91z52T
 o0Hu1MzdGadVlt/tkqGrnlsDFrENKMMkE5uF9ZNBtIMO+I9Qx1wkNueKBS13p91LhqWVTcV0wy0
 MBODH2spTjb1FOTTU51p596NMywGYOfFiFeZqACEvRU=
X-Google-Smtp-Source: AGHT+IEhf+hbSJIgKQ6xbE3OCLEJw/a8F3k729/3ouoi/zbM4ai6IF1UOWTbMpWnLmrJDoMHmmmdxA==
X-Received: by 2002:a05:6a21:328e:b0:201:85f4:ade6 with SMTP id
 adf61e73a8af0-21bad15741fmr14269458637.27.1748885589946; 
 Mon, 02 Jun 2025 10:33:09 -0700 (PDT)
Received: from x1 ([97.120.245.255]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe96474sm7931449b3a.22.2025.06.02.10.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:33:09 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:33:07 -0700
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
Message-ID: <aD3gU6lS1eMtkOTU@x1>
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <aDzcul5vBeQvP634@x1>
 <d949f2b5-1351-4778-9716-eaec1e2b1ba7@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d949f2b5-1351-4778-9716-eaec1e2b1ba7@samsung.com>
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

On Mon, Jun 02, 2025 at 10:03:09AM +0200, Michal Wilczynski wrote:
> 
> 
> On 6/2/25 01:05, Drew Fustini wrote:
> > On Fri, May 30, 2025 at 12:23:47AM +0200, Michal Wilczynski wrote:
> >> This patch series introduces support for the Imagination IMG BXM-4-64
> >> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> >> managing the GPU's complex power-up and power-down sequence, which
> >> involves multiple clocks and resets.
> >>
> >> The TH1520 GPU requires a specific sequence to be followed for its
> >> clocks and resets to ensure correct operation. Initial discussions and
> >> an earlier version of this series explored managing this via the generic
> >> power domain (genpd) framework. However, following further discussions
> >> with kernel maintainers [1], the approach has been reworked to utilize
> >> the dedicated power sequencing (pwrseq) framework.
> >>
> >> This revised series now employs a new pwrseq provider driver
> >> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> >> encapsulates the SoC specific power sequence details. The Imagination
> >> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> >> sequencer, requesting the "gpu-power" target. The sequencer driver,
> >> during its match phase with the GPU device, acquires the necessary clock
> >> and reset handles from the GPU device node to perform the full sequence.
> >>
> >> This approach aligns with the goal of abstracting SoC specific power
> >> management details away from generic device drivers and leverages the
> >> pwrseq framework as recommended.
> >>
> >> The series is structured as follows:
> >>
> >> Patch 1: Adds device tree bindings for the new T-HEAD TH1520 GPU
> >>          power sequencer provider.
> >> Patch 2: Introduces the pwrseq-thead-gpu driver to manage the GPU's
> >>          power-on/off sequence.
> >> Patch 3: Updates the Imagination DRM driver to utilize the pwrseq
> >>          framework for TH1520 GPU power management.
> >> Patch 4: Adds the TH1520 GPU compatible string to the Imagination
> >>          GPU DT bindings.
> >> Patch 5: Adds the missing reset controller header include in the
> >>          TH1520 DTS include file.
> >> Patch 6: Adds the device tree node for the GPU power sequencer to
> >>          the TH1520 DTS include file.
> >> Patch 7: Adds the GPU device tree node for the IMG BXM-4-64 GPU to
> >>          the TH1520 DTS include file.
> >> Patch 8: Enables compilation of the drm/imagination on the RISC-V
> >>          architecture
> >>
> >> This patchset finishes the work started in bigger series [2] by adding
> >> all the remaining GPU power sequencing piece. After this patchset the GPU
> >> probes correctly.
> >>
> >> This series supersedes the previous genpd based approach. Testing on
> >> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> >> correctly.
> >>
> >> This time it's based on linux-next, as there are dependent patches not
> >> yet merged, but present in linux-next like clock and reset patches.
> >>
> >> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
> >> defined as a fixed-clock. The specific hardware frequency for this clock
> >> on the TH1520 could not be determined from available public
> >> documentation. Consequently, clock-frequency = <0>; has been used as a
> >> placeholder to enable driver functionality.
> >>
> >> Link to v2 of this series - [3].
> >>
> >> v3:
> >>
> >>  - re-worked cover letter completely
> >>  - complete architectural rework from using extended genpd callbacks to a
> >>    dedicated pwrseq provider driver
> >>  - introduced pwrseq-thead-gpu.c and associated DT bindings
> >>    (thead,th1520-gpu-pwrseq)
> >>  - the Imagination driver now calls devm_pwrseq_get() and uses
> >>    pwrseq_power_on() / pwrseq_power_off() for the TH1520 GPU
> >>  - removed the platform_resources_managed flag from dev_pm_info and
> >>    associated logic
> >>  - the new pwrseq driver's match() function now acquires consumer-specific
> >>    resources (GPU clocks, GPU core reset) directly from the consumer device
> >>
> >> v2:
> >>
> >> Extended the series by adding two new commits:
> >>  - introduced a new platform_resources_managed flag in dev_pm_info along
> >>    with helper functions, allowing drivers to detect when clocks and resets
> >>    are managed by the platform
> >>  - updated the DRM Imagination driver to skip claiming clocks when
> >>    platform_resources_managed is set
> >>
> >> Split the original bindings update:
> >>  - the AON firmware bindings now only add the GPU clkgen reset (the GPU
> >>    core reset remains handled by the GPU node)
> >>
> >> Reworked the TH1520 PM domain driver to:
> >>  - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
> >>    callbacks
> >>  - handle clkgen reset internally, while GPU core reset is obtained from
> >>    the consumer device node
> >>  - added a check to enforce that only a single device can be attached to
> >>    the GPU PM domain
> >>
> >> [1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
> >> [2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> >> [3] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com/
> >>
> >> ---
> >> Michal Wilczynski (8):
> >>       dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
> >>       power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
> >>       drm/imagination: Use pwrseq for TH1520 GPU power management
> >>       dt-bindings: gpu: Add TH1520 GPU compatible to Imagination bindings
> >>       riscv: dts: thead: th1520: Add missing reset controller header include
> >>       riscv: dts: thead: Add GPU power sequencer node
> >>       riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
> >>       drm/imagination: Enable PowerVR driver for RISC-V
> >>
> >>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
> >>  .../bindings/power/thead,th1520-pwrseq.yaml        |  42 +++++
> >>  MAINTAINERS                                        |   2 +
> >>  arch/riscv/boot/dts/thead/th1520.dtsi              |  29 ++++
> >>  drivers/gpu/drm/imagination/Kconfig                |   3 +-
> >>  drivers/gpu/drm/imagination/pvr_device.c           |  33 +++-
> >>  drivers/gpu/drm/imagination/pvr_device.h           |   6 +
> >>  drivers/gpu/drm/imagination/pvr_power.c            |  82 +++++----
> >>  drivers/power/sequencing/Kconfig                   |   8 +
> >>  drivers/power/sequencing/Makefile                  |   1 +
> >>  drivers/power/sequencing/pwrseq-thead-gpu.c        | 183 +++++++++++++++++++++
> >>  11 files changed, 363 insertions(+), 35 deletions(-)
> >> ---
> >> base-commit: 49473fe7fdb5fbbe5bbfa51083792c17df63d317
> >> change-id: 20250414-apr_14_for_sending-5b3917817acc
> >>
> >> Best regards,
> >> -- 
> >> Michal Wilczynski <m.wilczynski@samsung.com>
> >>
> > 
> > Thank you for continuing to work on this series.
> > 
> > I applied it to next-20250530 and the boot hangs:
> > 
> > <snip>
> > [    0.895622] mmc0: new HS400 MMC card at address 0001
> > [    0.902638] mmcblk0: mmc0:0001 8GTF4R 7.28 GiB
> > [    0.915454]  mmcblk0: p1 p2 p3
> > [    0.916613] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> > [    0.920107] mmcblk0boot0: mmc0:0001 8GTF4R 4.00 MiB
> > [    0.936592] mmcblk0boot1: mmc0:0001 8GTF4R 4.00 MiB
> > [    0.944986] mmcblk0rpmb: mmc0:0001 8GTF4R 512 KiB, chardev (243:0)
> > [    0.947700] mmc1: new UHS-I speed DDR50 SDHC card at address aaaa
> > [    0.961368] mmcblk1: mmc1:aaaa SU16G 14.8 GiB
> > [    0.969639]  mmcblk1: p1 p2 p3
> > [    0.986688] printk: legacy console [ttyS0] disabled
> > [    0.992468] ffe7014000.serial: ttyS0 at MMIO 0xffe7014000 (irq = 23, base_baud = 6250000) is a 16550A
> > [    1.002085] printk: legacy console [ttyS0] enabled
> > [    1.002085] printk: legacy console [ttyS0] enabled
> > [    1.011784] printk: legacy bootconsole [uart0] disabled
> > [    1.011784] printk: legacy bootconsole [uart0] disabled
> > [    1.024633] stackdepot: allocating hash table of 524288 entries via kvcalloc
> > <no more output>
> > 
> > I pasted the full boot log [1]. I have clk_ignore_unused in the kernel
> > cmdline so I don't think it is related to disabling clocks. Boot does
> > complete okay if I set the gpu node status to disabled.
> > 
> > Any ideas of what might fix the boot hang?
> > 
> > Thanks,
> > Drew
> 
> Hi,
> Thanks a lot for testing and promptly providing debug data. I think the
> problem is with the fallback logic implemented in the pvr_device.c:
> 	/*
> 	 * Try to get a power sequencer. If successful, it will handle clocks
> 	 * and resets. Otherwise, we fall back to managing them ourselves.
> 	 */
> 	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
> 	if (IS_ERR(pvr_dev->pwrseq)) {
> 		int pwrseq_err = PTR_ERR(pvr_dev->pwrseq);
> 
> 		/*
> 		 * If the error is -EPROBE_DEFER, it's because the
> 		 * optional sequencer provider is not present
> 		 * and it's safe to fall back on manual power-up.
> 		 */
> 		if (pwrseq_err == -EPROBE_DEFER)
> 			pvr_dev->pwrseq = NULL;
> 		else
> 			return dev_err_probe(dev, pwrseq_err,
> 					     "Failed to get power sequencer\n");
> 	}
> 
> 
> Since you have:
> # CONFIG_POWER_SEQUENCING_THEAD_GPU is not set
> The fallback logic assumes that there is no pwrseq provider for
> 'gpu-power' and falls back on generic driver to do the initial power
> sequence. Obviously for TH1520 the generic driver fails to do that
> correctly, and the register access hangs.

Ah! Yeah, I missed setting CONFIG_POWER_SEQUENCING_THEAD_GPU. The boot
completes okay now that is enabled.

> 
> So the code seems to behave as designed.
> 
> By the way, there are quite a lot of Kconfig options added recently to
> TH1520 SoC that haven't made it's way to defconfig for risc-v. Do you
> think it's a good idea to add them there ?

Yeah, I think we should have all the recent Kconfing options enabled by
default. I'm not sure if it should be in the riscv defconfig and as new
selects under ARCH_THEAD in Kconfig.socs. I just asked conor and palmer
on irc to see what would work best.

Thanks,
Drew
