Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F4ACA002
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 19:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BBB10E06B;
	Sun,  1 Jun 2025 17:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="XEp9O1Um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CD10E06B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 17:40:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-742c2ed0fe1so3480311b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748799641; x=1749404441;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FGcwYr4Y+MLOa5A3Y1t4BMM/OO3+HUq+DjYuxkG81Yg=;
 b=XEp9O1Um9s0S1CerhLC/bRFYA+m9jR8zW9nww2/fr6pSWiXifqyR9NIQ9r6OAkPtTE
 I2Cyh7ELE7JanPABrjyZUyKERDxrXqsQdR1F6dl98tQT1JyWimycEDl9/cCM5Cd/MkTO
 E3U/VaY7dzYtHJVL1xb0QhPPfqu83s8HhNdXfR3bntSIs4Dp/UhX28/hyBbfhQFAukyK
 U65ezgzw7lSbbv5gKQO+msi1/c6uKovv12Ct2MJSd1G5S7xDgZLZX1w6a5T3wIhK/GOX
 VFooUY82Nw6ESatgg65lE/d3oIzbD/ag6R4w8S5XDe0mF+CCHMbLxF2BkSkdG/TFP7vf
 ypKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748799641; x=1749404441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGcwYr4Y+MLOa5A3Y1t4BMM/OO3+HUq+DjYuxkG81Yg=;
 b=SkSFDyAilL+z0201wpVRY1A60E60YYbd0ff+8KurzRcj5GwfrVbOlbifwscdbJw7lU
 2JV4haqaxhcSgyinAb//aEmXFxm6VU4CFuglcKM9vMrEQgunQ9N4tETVee+om3423LR3
 QW0NyRXgh3xokHslg1RZK6+EA0/YZXyqNS1809aB7S0NZv22dThgC1ZQWiJLRtoTR65a
 fqiul8tGCKFPG/bYrG111UWbcNc7nX5whBEvvApmNWW0vAW7LqW7WTttNrP1NhQPwb12
 Pv9xdpF50GctbB0VPLWdja2zP+AIFIHj5GR/zDFXshFLnCsj0omszM9toxtb02ghSGMH
 zrwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbKQeV4AilksvtzG3jGGuzRcpEpCdcWn73gVrh57QM3QWJGrH4V23Tn61dHxBYgqpYpNhY6rqB3PA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9vnFmJoUZXtOfZPJwPcL+SL0vaWmq+dNlyhuAJMN3o/hvjRhq
 R20AruN9twkBp2I+uvuKBwv9xaTbi6DoKllPCnkwSU7GzTIb7u0NU3Mo+EeBzcv7QD4=
X-Gm-Gg: ASbGncu8TbqtUAcZtxt8EmyebD4x7L9YcavJX94REv/DyhyiFKEom5Ag50FYVQJY4Z+
 Ld/rSSN8la0aCheGcXWtLI7P7Ma3wVbF/aECF9eFBfFRazyW498EI0BWhKT/FJ+YQd9Hsi9saiL
 Z5+uvHMg2+JMdztQA4qp6flsgvq2ZXHz0z3v22r+MQ1MxW0nlZy0RFKAeDliSOXc6ZpJOl1QeYO
 bpx0va6qg1r96VUW1MQQ2GeZ8nx/uhayXDvkgZa2lM4+nKx3JyE+du68BQJ2uol2apIjR18HCGF
 uTXY/0mnwRpVRogrK0bz68eE3QD/lhjA
X-Google-Smtp-Source: AGHT+IF2ujxBrmibEGhRD1r5ubHgFgoV1MofVKpoxo8rCC1rOV+5p1PoXq7rqs5EnyuTlJRwnhzInQ==
X-Received: by 2002:a05:6a21:600e:b0:1f5:8622:5ed5 with SMTP id
 adf61e73a8af0-21ad94e20c0mr17874238637.3.1748799641313; 
 Sun, 01 Jun 2025 10:40:41 -0700 (PDT)
Received: from x1 ([97.120.245.255]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab6b2sm6352890b3a.57.2025.06.01.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 10:40:40 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:40:38 -0700
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
Subject: Re: [PATCH v3 5/8] riscv: dts: thead: th1520: Add missing reset
 controller header include
Message-ID: <aDyQlqXhdgBAoR8D@x1>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
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

On Fri, May 30, 2025 at 12:23:52AM +0200, Michal Wilczynski wrote:
> TH1520_RESET_ID_GPU_CLKGEN and TH1520_RESET_ID_GPU are required for GPU
> power sequencing to work.  To make these symbols available, add the
> necessary include for the T-HEAD TH1520 reset controller bindings.
> 
> This change was dropped during conflict resolution [1].
> 
> [1] - https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..bdbb1b985b0b76cf669a9bf40c6ec37258329056 100644
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
> 
> -- 
> 2.34.1
> 

Thanks for adding the header back now that there is no longer a
conflict. I'll look at the rest of this series and the rust pwm series
soon, but I just want to send a quick Rb on this patch right now.

Reviewed-by: Drew Fustini <drew@pdp7.com>
