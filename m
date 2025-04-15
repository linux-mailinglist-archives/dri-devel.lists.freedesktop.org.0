Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E59A89980
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5710E6FB;
	Tue, 15 Apr 2025 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="dY8+iYuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9FE10E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:04:32 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b061a06f127so2113302a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 19:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744682672; x=1745287472;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
 b=dY8+iYuwjF/m88oIe4HJabt1dl40C9UBK72WORP4p0bKWJpt4gR3OJuZyNhY1AE46Y
 DBhIzYRNcID2QdtpwrHbw2tgA4Z93nFCZhMM+/1h6MqRfn6etQ2J5GEFaxIk5KbScW0z
 EPVNAP2GNX8CBkrnNW3o7ZtzdV7rJJMez9E8/v8CyTs8cREAQHr4cX+tAVHHs/y2SsYT
 Q2g/BeETBSCI9aHXWPvHXVoOcQHghQ9mzax3QYkwBpa20HsJZFMsmV+6iaqwRS+qUz7m
 gB9vUi26C4bh46AMKITa00aZKZRnjNKpdfSMxjWUgJBNpiMN51ktw+ZFU7zbKzmvJJQP
 +Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744682672; x=1745287472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
 b=P7CsuMf+71e8UEzaVkf4a4BTNriuQWSjf6+BKQWcJwfAEOIjEI0c0Ek2bTfB2gBmux
 chWYNqXBqQnvZoRzeqeIsARhuEDZsVadY7T1Bbd5e2gEyipMdsPYfy2qY3EzP65/gpbU
 unTxZd4WWRTDLk3BocUno/P8BLXfp1Y8eXiGM/Q6jbwE+1jfTzqFmMbcabTc4T792CId
 CfWNK/Wy3ArwpeOC37766ZV+ZQi8ecXE3Xw2wZ/RTu8bjbQovxLxOPe9Wo/kkhCtQZsU
 /3Ny7z+Mm1c2Wu/j/X7W2Fa+aJ/gvX36aVhxRRypbE7Wl3RQtbTkvwY/Ix34ZUuFURju
 nZ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMQ62Y/4+fIx6PCs/Z+SQ6LP4sHd7o7v0STIoD1qorb3waBOFVKA4JBqo7oBlhHzLnGj6ltlhapbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygG60X9H5dUf0d1+Qmwjamg5YCahMJ8hlo6g/Hjc6lyak9Rohr
 X5KA1uoOZ+mQw0Ud5SdYjkbE8YH3SsjCU8MqTgRFsc4t1ZPNOcM8BiF7SX0UnFI=
X-Gm-Gg: ASbGncvM93fr47urmIV8ArzAsNo2DmnaU7ZWEfN/QDJGWxsdBtPW2p4aVrDzwKQAqmu
 VrscLtKfeiD8yfhxyMxCGTcIwuH3U7uU3LhVj2Zhv6ci5A7C8sgsRrA82UQQYCi5dLFGKctCGg1
 lynlkFuuAd2ku5ZWcw+TgvhXu0nTdw/28P0epGu0yNXFxZ83atGkOTdl5gtJgHWOjk8XAn6JYTK
 Xt+ZTRBJbnuOZLsdeOfvme2kV8ESqnuQmlq5et5m2zs4HM1xiNTcS6o5FrPxWuVhm9lDN4dJs5F
 AstS78kaCVKiGuwTxb0g5vkYTAZ6BrVCW9AhAeNZgz1XjZ4=
X-Google-Smtp-Source: AGHT+IEGINtwuIIvAG2vOyy+05/hzxGzcyCN3rLg9V0W9dc2TsjoIN0MbhxjBGLcyWirEoR5Ps2qpQ==
X-Received: by 2002:a17:90a:d64d:b0:2f9:c144:9d13 with SMTP id
 98e67ed59e1d1-308237b9f43mr17682243a91.24.1744682672433; 
 Mon, 14 Apr 2025 19:04:32 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd12b4d5sm13372486a91.25.2025.04.14.19.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 19:04:31 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:04:29 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
 p.zabel@pengutronix.de, m.szyprowski@samsung.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Message-ID: <Z/2+rbhsaBP0DQop@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-20-m.wilczynski@samsung.com>
X-Mailman-Approved-At: Tue, 15 Apr 2025 10:08:37 +0000
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

On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> TH1520 SoC implements power management capabilities through the E902
> core, which can be communicated with through the mailbox, using firmware
> protocol.
> 
> Add AON node, which servers as a power-domain controller.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 197df1f32b25..474f31576a1b 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +#include <dt-bindings/power/thead,th1520-power.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
>  		snps,blen = <0 0 64 32 0 0 0>;
>  	};
>  
> +	aon: aon {
> +		compatible = "thead,th1520-aon";
> +		mboxes = <&mbox_910t 1>;
> +		mbox-names = "aon";
> +		#power-domain-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I tested this on top of 6.15-rc1 and found no issues.

-Drew
