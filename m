Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA4ADFB27
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 04:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CA410E686;
	Thu, 19 Jun 2025 02:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="VlevUCi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76F10E686
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 02:20:38 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-748d982e92cso153324b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750299638; x=1750904438;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
 b=VlevUCi96CdBeDe4lQc4OuB+GNO4EhrxxNlLYh+01rkqHnQV81akNVV4l3HKQWpbW9
 0WuG/8UqI7g3GB1ipUaRFntcCOfCm/fblJY0rkfd/gc+8U/12Q9IZZpmdK2aRhvR2j0s
 WU8GaWsRW0X61/+ga6RrH5BrBt1L3EhPnXR5u8Ua6tvVVGGJX/D89bHzHDYQn0/x2Q9d
 STO20xPCmv6w2xzAzQFyqUx6peHbLQBynCDzAuHBhTBOlbgC4sK6iVHCXRD97+NsJOY8
 MmWxDdQERZqbArPzZOYFUjMEGFLtXnX27yorTdYIcOz4LpDtszZl6lMUtN03QsCYW8ws
 EEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750299638; x=1750904438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aB+z+oapAeIvD/LMQC0pA+9Dvh98i3pYzrLPX5UVNgs=;
 b=GM2Zk/ujn/+7RSi+JX7Uy7j4uoYWRGDCiFny+BrH5VwwommrNk7xWfHuUoHAw3x987
 NQYaotMN535JJb3w/JU2LG80mrlygt9eTbIRb8hWdxWUsJnRTJ0FqfitHG92oVWrzqLI
 gmppwOamMLOmRCkrto/yo0Dciy2fj0grCunzgpge9R+I2hmuSqqLE5k8NnH3aXaSDZNC
 spk4RuBoTW6Ji1TZyndNfssL4id7Yf1TMyHKYQnisQMwKE0ksnfCpmTS/vXWHf6Ot4RB
 y4tf9XwrlGdazZ029k6HdQWoYejOF0VVoOlxJBU8hYpD2YYxGg5viYQs4w7tcBuhSe56
 kMqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+HhCidjdB8/Fn1oEO4Iql/KApnM5WtS3pAOrd18smnq99h+eywRkkAHtJM3s8ane6Gx6IwK2WfEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHelBoOODBZAD5waxcxpRHrL1uGTQB4G5fOx0fk5GB4+8BPO9S
 jjj6u4yn+WTuEUIo9jZf87yIsDo7B77dklTmVFvvUHa5VQ5zfamiprOcyy/PI5g8NiY=
X-Gm-Gg: ASbGncuj97kGObYRERf81KoSzMTlvq2IASz6RtOrD1rf0N3BzsCrhmNrSbJDt4GLO8k
 diInT2jKPhj5lXOA7d1Um1KktXQT1+hKk7IKAiNMA6wKaLop2+BtUXK1eXf8CXOxnkHabMSRq5F
 4p8nezNmNG5AzDz3dVGQdlgLIPxZiLx+cgt9Gi9M1nuAODLtNYKMVHUqfP3cuUXiy5yIxQboJo6
 0AqBbnyJiZUxsgpq3mgmHcOATXAWrxvZzWupfiltYgl4hH2ZwreCwREJKFaQTV5NKDA6W5zJGmq
 d7reaXw+762sV9YI/FvO/gKWGMNm0kUEL5nIgXJI5UJuX5CAh8dE5KeT3bgfnK0DsdQu2ek=
X-Google-Smtp-Source: AGHT+IGjSSZuolaUpbJOSDgxdNJ2rz6g6jIUWqfE+ln3NvBoOq+EqOxlPwszxtc7pzssoDHlu8HO3g==
X-Received: by 2002:a05:6a21:62c9:b0:1f5:7366:2a01 with SMTP id
 adf61e73a8af0-21fbd6925a5mr30398731637.37.1750299638092; 
 Wed, 18 Jun 2025 19:20:38 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31c84be11fsm2584945a12.78.2025.06.18.19.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 19:20:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:20:35 -0700
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
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset
 to AON node
Message-ID: <aFNz8/m7q4T2qSHd@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
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

On Wed, Jun 18, 2025 at 12:22:12PM +0200, Michal Wilczynski wrote:
> Add the "gpu-clkgen" reset property to the AON device tree node. This
> allows the AON power domain driver to detect the capability to power
> sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
> driver for managing the GPU's complex power sequence.
> 
> This commit also adds the prerequisite
> dt-bindings/reset/thead,th1520-reset.h include to make the
> TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
> dropped during a conflict resolution [1].
> 
> Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d63072a1573431e51893 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -234,6 +235,8 @@ aon: aon {
>  		compatible = "thead,th1520-aon";
>  		mboxes = <&mbox_910t 1>;
>  		mbox-names = "aon";
> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		reset-names = "gpu-clkgen";
>  		#power-domain-cells = <1>;
>  	};
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>
