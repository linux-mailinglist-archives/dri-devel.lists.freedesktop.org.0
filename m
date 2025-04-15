Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51EBA8B185
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5055E10E84D;
	Wed, 16 Apr 2025 07:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="Ayn6tDl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F110E123
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 18:48:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so4747388b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744742892; x=1745347692;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
 b=Ayn6tDl9WrfXFzvREHMr+QYhRcslOUImmlsN79ByKSxemCWZsds/W2DcS4xT3csefO
 LYVLrNdcvrDm7/69+F/KlpkuH6Gsi+hZw7FICZpV05QbV9bEP1AJWef466N6KQXogQ2D
 EF4UNyp9xcY5ElPgrQ+xPa6kCn3i6b9sVR8fGJ1oP3okTJnWO4rd9zN90dfIdJVEOUbt
 Wy73MvDbSkrhKh9qmPn9r1vKFxP7mICyvpPAK0z9wItGQMeXD/LpHSoAgBvos4VnVbfI
 B8eqUGqVfO4uOXiVjs0kIZg7YPJb0mdEn+z5KipaM0nN0YoLVLpAleSoCjATf7xsFNGM
 ppWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744742892; x=1745347692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glUhvdbg6jDxSzyhesIM3rd1JyjGcrsNSGuSqUFVHug=;
 b=Lml7DrolnyQPGuMW4CTDYoMCUrjsrF4QQAYeS+wFJKj1JuiQnvHbrdsfst5VDxXQ8W
 fMt4hMOUs9xZoSYKAHgzGUvr/fAbJeXOIigb/Uftu8KIAtiB6l88Ll3+P7KCpuUA2SUE
 eqcS/jlLrHX+QxQaHKPiv5wygqVdjMIEmC/JPXt3380JrEiVgUEtN851AeqmVgRJBHns
 L7PzlOTyW6+cN4noy2OfOXmIUvHu/9jEBB8OVjx8ZUEUniyPDcq7u9lpheQEIVns123w
 VlwqQeRHmiYRBdp5bYwGgZCIKOMNws7WrnZkI8DS9MyTbGYBM6hw2OcqGp9oiGTM/b7r
 JOiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXewtdgSQfG2s8801Smjg2iHt0Q2IyBIXqDB3+KS6efASuYqhGDvXywB/ZJnIzLMGMzw/x96ySIr0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiIWHoEHuZdVSExPdMAU2lEBXwpfnKWpFSAXFv+pkgFo3ASwmX
 YL62YX4h3Cy9hoyxsK6YXB7C/eMEfDbtNR1C87lnDNODn8qKgFvjJPP+Ipr4tqI=
X-Gm-Gg: ASbGncvWrEJTPcCq3oNgVRX7FSTyPJnQm5JJsph/crcdotxFjyIv4nQzTemcU5hu0mo
 dF5YvEXuLA8Boj8TZ5lHOv097blw2TbgTow4pTEef9XjzhFVvGA9g9d1VsxWZZwWYWoixtKN2rU
 NQcD/s8AejM5Q+7dgMi3yryhG8MYdQextmRKlSPuA/b2+4QnMKqnaXhjOmIEeUwxtBoVQf1AHRk
 iIPO8ONWxIG8Ve4hL6NwnuYQlPbrWU3KVH1EuJOFDKy32tXAQOAoebzVuRvS50Q6mYrmTlhwGpK
 ZnT5g6lTYLLMri/J9DcrFZBEd6xRl1kpeVGKlO8ROEGcvMs=
X-Google-Smtp-Source: AGHT+IFU1A6IgDtbE+ayph1nkrk/Xkmje9tzi2mXCLVIUeRmrboHqr3jd6su6fZeet5H41nBKRVWlQ==
X-Received: by 2002:a05:6a00:a26:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-73c1f8f742emr628913b3a.9.1744742891991; 
 Tue, 15 Apr 2025 11:48:11 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a2d3a4ddsm9578290a12.49.2025.04.15.11.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 11:48:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:48:08 -0700
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
Message-ID: <Z/6p6MQDS8ZlQv5r@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
 <Z/2+rbhsaBP0DQop@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/2+rbhsaBP0DQop@x1>
X-Mailman-Approved-At: Wed, 16 Apr 2025 07:03:26 +0000
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

On Mon, Apr 14, 2025 at 07:04:29PM -0700, Drew Fustini wrote:
> On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> > The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> > TH1520 SoC implements power management capabilities through the E902
> > core, which can be communicated with through the mailbox, using firmware
> > protocol.
> > 
> > Add AON node, which servers as a power-domain controller.
> > 
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index 197df1f32b25..474f31576a1b 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -6,6 +6,7 @@
> >  
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> > +#include <dt-bindings/power/thead,th1520-power.h>
> >  
> >  / {
> >  	compatible = "thead,th1520";
> > @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
> >  		snps,blen = <0 0 64 32 0 0 0>;
> >  	};
> >  
> > +	aon: aon {
> > +		compatible = "thead,th1520-aon";
> > +		mboxes = <&mbox_910t 1>;
> > +		mbox-names = "aon";
> > +		#power-domain-cells = <1>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > -- 
> > 2.34.1
> > 
> 
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> 
> I tested this on top of 6.15-rc1 and found no issues.
> 
> -Drew

I've applied to thead-dt-for-next:
https://github.com/pdp7/linux/commit/2bae46e3de2a64fe3a619d61b16da0c01b8df2a1

Michal - are there any other dts patches that I should consider for 6.16
PR?  I would probably send to Arnd around 6.15-rc3 or 6.15-rc4.

Thanks,
Drew
