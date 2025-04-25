Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835DA9D14C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8210E99C;
	Fri, 25 Apr 2025 19:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="ECBUhLdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216110E999
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:16:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-224100e9a5cso33072095ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745608609; x=1746213409;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
 b=ECBUhLdkSIx6uX6KfLmT/UWjZBnuwyxje2Ea0vK/aCw7IZ1/zPHhFPmCRt9K6JDwfd
 4hPct6EIEs2QEElCI8MYf612cVGLM2UWfPJSamO/+yiDiNiEFAaO+EtBdc1eiujnaI1o
 flQ1OwNr7PTQPGPk23Xaiu+Knr6efkGTJ2rt94yGyIciLOu22H+JyhGB4cVWeL29aHcB
 CuoYzF+JwwFirPVK4DQnP5XzGe1OoNZ91e8EObsBBksofYrZXxvYZDM4yggw3eRbX8Ce
 hGzgKzEqq/Re9yIwj9BIT89nvspPsAxUSmomErgGtzYBpqI7A0Cr+8801xPHJO+mIz3W
 c0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745608609; x=1746213409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
 b=MCOM+yM5vC/dodnFL2hiJZ+93tnigYgYADy/XmeqcgZk/xIfSxdG6T9gd/x+nOtlvl
 kxUNRhCrPP5TUOgKJCbuU/0cEjPaeBsBi+NNQXlLl9Xn3KI53i37+P2Ed9PNNFPLIRtJ
 hWUbO7bqPR8Pu0shVzKQUM+xh5fbR2V5vqePm6PsOwcoEUIreNcpfm2dthM4nJn4czDq
 KLY0P3FOAGmT4rWkCmSvUpugnmHQI0cnCWH4pjzk5I+vWxIvWK5SSI7rnYbeTRdqCge9
 MYNL8JZptI9pLj40shjZs+VYPnfFqtRaAZMdyefDzMJ4avST60bzmYtnxdWUkdtWbAx3
 fqJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb6I55eMphN2+fEvlf4rujVbQ0XNwQpEF5FuO5b7T1GOg6BDaXZZATO5SBbL2JSL6u2cCtCIS7wLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9FDKMd8L7bX1R6It3ouZ9XwCYUGJzxbIAOSMPel0kKtrIXppX
 6COpEA0QX1yYbo7NcrBe5iqpaKgGku2Wa8Vnfdm6jKcU42ouK0eTeB7I/4seWYk1z83+utevPxH
 VhHw=
X-Gm-Gg: ASbGncuJSEhoHEZQYfCUwMWOJdIBR2vMyTe2US1GcW4i/HCdvvq2+sR3p1ySW877LFT
 TumNtZVHpm7zysoIXNVHMeNfWPh39xR+hCBhT3pIhuCfjAO1WiyYdO/HnhAmP2OYlGjeJ8YUekz
 nV7G/08/iindOaJXXJSqevQrnnt1w/uG7f5t9A6MVbCVtEKwg/2z1f3uj6lfO3TGw8BDgbL6bGx
 tPuJqjW4iPs/8B9RacTl7zgb5Cy4U76xg4WgPSVc3s5lPylkk4BZx7NSz5qLO9bNtGrNy5lJUB/
 /amEXX9YgznCN1kn0LpFlB6gjqjaeGF57eSBh9QMAmb7jYs=
X-Google-Smtp-Source: AGHT+IFhMLeZWxbEN2BcydszBZXCVk7gJnHRAGc8GbZQro6UfqEPZMk7uHs43lBLaNwzfikdBQk+ag==
X-Received: by 2002:a17:903:1cf:b0:224:721:ed9 with SMTP id
 d9443c01a7336-22dbf73e8bfmr61560135ad.44.1745608609541; 
 Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db510304csm36179535ad.204.2025.04.25.12.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:16:47 -0700
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
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
Message-ID: <aAvfn2mq0Ksi8DF2@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
 <aAP1BW3RmMb/Irya@x1>
 <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
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

On Tue, Apr 22, 2025 at 09:47:34AM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/19/25 21:09, Drew Fustini wrote:
> > On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> >> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> >> of the power-up sequence.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 474f31576a1b..6b34aab4b455 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -7,6 +7,7 @@
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> >>  #include <dt-bindings/power/thead,th1520-power.h>
> >> +#include <dt-bindings/reset/thead,th1520-reset.h>
> > 
> > Are you okay if I omit this hunk? My thead-dt-for-next branch is based
> > on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
> > window.
> 
> Yeah, I'm not exactly sure how to coordinate such stuff, obviosuly it
> would be best if this chunk would make it to the 6.16, but if you think
> it would be problematic then omit it, no problem.
> 
> I will then update this patch series v3 [1] to gracefully handle lack of
> reset, as the 6.16 will not contain the required reset line for sure.
> 
> [1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

I've applied this patch to my thead-dt-for-next tree:
https://github.com/pdp7/linux/commit/1b136de08b5feca37ebdb6d28db3c9c6285aba5a

We should be able to test with the driver in next once a new next is
published (which I assume will be on Monday in Austrlia).

Thanks,
Drew
