Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD49ADFB09
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 03:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B67910E80F;
	Thu, 19 Jun 2025 01:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="u2iaKzGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD4C10E80F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 01:50:51 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-31332cff2d5so136490a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750297851; x=1750902651;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
 b=u2iaKzGYhcwFhVOOhNRc8iobPdA/QWPRzRcih3op8wwoiG+sF6TZ9Wp5cqIyf/FuIE
 MrrpH/ZFV5ICIK0QVzPiqAfBV49vczV87wXUr71rO1m73utgcuhegiZWbRmAIzcz3wvQ
 gr6wx6Le+R3Cv2ZiM14YJzb8KXpwIDFkZ9nvq96ViaqULFCmlsT7G3QDs5g946nQkAqT
 g5Le9Z0X47he+Vjf9CpERjFVQZm7cZKsUJS1KQCKf/UkZ4qDl7VrwqfM9mweQUJL7FCq
 y1O9tu6wjDOk3o+dEui4AWpPKGXD1+6hqmGsi/hQBKibJVPJpXRpPLFSeqRPYg/kPzLW
 KZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750297851; x=1750902651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
 b=XHv/b6Wf8DQ5wR4ugx8AhgZ2AziBcfwO9lbNDL4FkWUrkXftnd7NsAyeBg4FXs6M/Z
 /rq0dVlh4I6n6WhpgypVTauah7ZrPCvVAXvzdmUU10NlCI3DN1a9gKHrAekp68UFzG6C
 ntdMFgh2h67Gd3i2DBRvdB+1WNO6ZZ+n6PqIqKS5Sr9oTrpfS1FztVpHNSNCTJ2Wqb0p
 HulNs5YU3Qg0XsDZZ/pKGqeqVwKTH8DGpfEd+5pZxRWpSlf28LetBYdvCiO8tUQerPfj
 X3CN2VYv1FL36uX0XYEzttiv+XvbM1R9M1o3jNLNlvQS9TAZlwZKTiEA/WeMbDK+5ppC
 96yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaKoAZvJXsMIYlTfY0vgyX+rvKVozKGs38NkktuRCPcjOL5zts60qZjfQ+7VZIpSOiJ9lMznQc36U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ6PatsiByWUEpwpjuTfM87nQtV9y41D2s4Q6YrdXGykd/DCbe
 7i9loBDCkpqXjWtibBRzqLdI2XiuNF48RWqSVEDpXGN5mBkWItgiegw+VNGPkoknUmw=
X-Gm-Gg: ASbGncuUGcsfuCVCBWoTVA2KPXckdgvVP9mjiZSsw79pIEWEIvdelpFNwvPg0rIDhNG
 QnKFwEgskN6Q2OXtkqr/vhvhoBK3CPWbjc2UeyTYXvk7y0PulfKz/1+p87QIGYQZla8NJ/xLWIS
 kBvgyH5MQscDOop4ijTF0WeeEI5EPf7lXKjhMazufVxTrX221/tjcdamAjMj9cLz+OFOc4ub1LI
 3MypLt8DOuHLfYes9agtpFruaAunK2+Y9Vv4Ff86lqQIfBWAHXP03D38u/ycQfBmjTD/HHuRXci
 iYitKsKjANMopISU8oyTBDU8YX7SyT8apdMwEXJOGYRrYMWJ8joaNwwbf/mDYPTIH5PV4mg=
X-Google-Smtp-Source: AGHT+IEH8ENEIXXiapQFn7dY5pW85bznCSDAM8YeveXgruCVaip94nhm+ZCyfl9XM7JJOLVmNJsDyw==
X-Received: by 2002:a17:90b:586b:b0:312:39c1:c9cf with SMTP id
 98e67ed59e1d1-313f1be1c89mr31855817a91.7.1750297850614; 
 Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a226f7asm811267a91.10.2025.06.18.18.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:50:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
Message-ID: <aFNs+PLgw1jqqiUm@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
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

On Wed, Jun 18, 2025 at 12:22:08PM +0200, Michal Wilczynski wrote:
> Extend the TH1520 AON to describe the GPU clkgen reset line, required
> for proper GPU clock and reset sequencing.
> 
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen reset).
> Only the clkgen reset is exposed at the AON level, to support SoC
> specific initialization handled through a dedicated auxiliary power
> sequencing driver. The GPU core reset remains described in the GPU
> device node, as from the GPU driver's perspective, there is only a
> single reset line [1].
> 
> This follows upstream maintainers' recommendations [2] to abstract SoC
> specific details into the PM domain layer rather than exposing them to
> drivers directly.
> 
> Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/ - [1]
> Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/ - [2]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400de7aadbb21fea21911f6f4227b09..3365124c7fd4736922717bd31caa13272f4a4ea6 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -32,6 +32,13 @@ properties:
>      items:
>        - const: aon
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: gpu-clkgen
> +
>    "#power-domain-cells":
>      const: 1
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I'm wondering what tree this should go through. Ulf took the original
patch that created the binding.

Thanks,
Drew
