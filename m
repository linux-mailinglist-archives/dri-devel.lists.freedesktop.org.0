Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F4ADDE91
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 00:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B022110E0FE;
	Tue, 17 Jun 2025 22:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="rp5P0ZRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043E310E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 22:14:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313bb9b2f5bso7265438a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 15:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750198451; x=1750803251;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rht1pWqTVlNemlSkA4kJuYwRKU6KD6oE4FAwP7gkVd8=;
 b=rp5P0ZRbC4fAYxPVhNEvdY5LMzBYFdqNI278tGQ+87AeI8JQuJvoNRs42t75jGIyJp
 XLpsgpJ41MmJdKemywYCL/egxlDJ3kDVbw5oBtVRiYI8Amw648kO3CUxh5Ysol+HrPqS
 nzEv3Xjp8WNlAZYRnfmu3N/RWB7EjT5xvQqs470JfBvS2I3UyjvEg1J3I97QfJ5Xqrsk
 925b14dP6RC9PIhtvgLr75qSbocvCcES1YXyxnyRe1LrTG1+DmePTvo9LlE/GjfNiwyO
 UaeuVZ3/c8FbxIfdMBI54ED0MiIm3fcrtADb1vl1fElAGate0Hlw6NhAW3IZaKleRlzl
 wPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750198451; x=1750803251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rht1pWqTVlNemlSkA4kJuYwRKU6KD6oE4FAwP7gkVd8=;
 b=jazxhKs4o+3KVYbWOukzp4+GuoH+EeX3iPRyQkQnzScXE4AQO3GWkTT3iJWUqLTdcz
 k0QG4Hq9e42K0z8baCYDIDLMGbQY06xrjtllP7R50bOKEaa0Oja3OeA0V2VHilJol6KK
 7cJbzfA7ABIgl+9FmwYq8y4Rsy1qmd5XqJsQ5IxkQGC0BArB2VwRxFyH1HuJFOc+Bw8f
 C7YQ0wnEDlhORKjK365MJa9at/p2z7fh5UlllDIv/HFShulHof332b3iH1ZZSCxPtDNN
 1/EVcneAHodjtGmcrBzRRHGyGwdR9t2W+utu+ry8c6/tTOCBAYe2V71f3W8cwi6usqCR
 kutA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVjg3grmKuZudjm4WWQf8SWt3Jlzwq2vH/uDtBJVjf4yG68U+bQjUTVM2FBJwvFYNdTSP+rCsqdVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ2agcZonYQxVksbGSDuFBWYGkrwHrWtPg/LP4b+G/LxSiVhyb
 0AIEJQfD74EF8GCN/aDvw/YBNyS+dIAgnmSn5OsvDK2eKScQGbvjpa/1OwLvCtyXp0g=
X-Gm-Gg: ASbGncuLZ8l1SN3/G7M38pkAZasuT31IhQopmk0+ihslVMq33cfzRxj2YPHHAnLXpwX
 lIelVPIqWNZncgu5/uxdYVdusP/9V6d3YQEMCCUv/l46q9xp4b4AubsVDBE1H1I+TvAXeVSTrq9
 MwrP3esJGz6O/tnVijmBQiQ0BWWTtxQnMBqtgTuiOIOgDDToMLHTltLc2scCU8Yq7jOKfSJo0Fs
 kppeBpRiCrXfZRKVF6Zap+O+sc0fpvnuiz+nBVoWD7MH8bNrj2s72R7o1fSKDvYdusCYRtwz5cT
 e+dpnxDGbru43R05MYxbTA46zImMLHuKYUKyqxUsEhT2L5uC2zvUN2m+BeI2TVTOX0Wju5Y=
X-Google-Smtp-Source: AGHT+IGjtDH8+7Qdmc6DGmjSJpavFXI06zS+xsVxnGKMVqLF3EoMugjqqf5A/sV2C5cZ3H3jbI/Tpg==
X-Received: by 2002:a17:90a:dfc8:b0:311:f05b:86a5 with SMTP id
 98e67ed59e1d1-313f19d2977mr26267870a91.0.1750198450546; 
 Tue, 17 Jun 2025 15:14:10 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb0fabsm85895565ad.181.2025.06.17.15.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 15:14:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:14:08 -0700
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFHosEvn35Fr3LFv@x1>
References: <CGME20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
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

On Sat, Jun 14, 2025 at 08:06:06PM +0200, Michal Wilczynski wrote:
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
> Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
>          GPU's power-on/off sequence.
> Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
>          existing thead,th1520-aon binding.
> Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
>          and spawn the pwrseq-thead-gpu auxiliary driver.
> Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
>          device tree bindings.
> Patch 6: Adds the gpu-clkgen reset property to the aon node in the
>          TH1520 device tree source.
> Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
>          required fixed-clock.
> Patch 8: Enables compilation of the Imagination PowerVR driver on the
>          RISC-V architecture.
> 
> This patchset finishes the work started in bigger series [2] by adding
> all remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.
> 
> This series supersedes the previous genpd based approach. Testing on
> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> correctly.
> 
> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
> defined as a fixed-clock. The specific hardware frequency for this clock
> on the TH1520 could not be determined from available public
> documentation. Consequently, clock-frequency = <0>; has been used as a
> placeholder to enable driver functionality.
> 

I don't have any more information that what is in the public PDFs [1],
so I think it is okay to have a placeholder frequency.

Is it the case that the frequency doesn't really matter from the
perspective of the driver?

Thanks,
Drew

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
