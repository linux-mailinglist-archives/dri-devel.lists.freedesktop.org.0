Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4FA9487B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936E710E121;
	Sun, 20 Apr 2025 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="P+COCXsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434910E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 19:10:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so2309758b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745089800; x=1745694600;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
 b=P+COCXsIzAO9wD6KTa5HrQWJGCLtZYOmCXieM2K/E8Qv0wNH3ETjAX9/jPVB8Oj5/W
 MhuDSCaH8K5F56w3XPCibtt7MONXjIVDQqNDKBCTtLxoEIQz5U3iDaO0qLMOf70okyoo
 jv3X7FtQ0rAlaQvdPjK5gtF1WDzDuTWpOIzoe6u2nGkRqKWjbFGC8HyhyUornDwS5age
 zfYOEFbz1lfMuKyHdfYqqwY3Ol1h5VAbAk6sjCIlZgb3f1qjU2gtEoplUN0rjmjZGHs5
 1O8P5v4MOyvPMbzomEKJ5eEm0VqvJ3CDESIgdt0O46Wm96xZ4SPXxDLK7g/FvJa/EfTg
 WuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745089800; x=1745694600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
 b=oHgZbq+FRU6nONaa3JYsJox/XWI8Qswh15AJ4bPuI/0yLcEIJgKDQ/HSeqEXQobPKZ
 GWZvRM5FP5mWLyyqI8FcB2ToL/hY9EdhUSs3lhUMXAfJizzfmxurKntrqwfkvZ9711/p
 i/dL24oapYBaJaOTTV2S+vC6i9msft4ymguzQzCw5LB6pQWk81BO0Ey6hX6Z4n0RMU3+
 e4TC9Jnd0h+hVVI4UzHGCURlb2Fv7OPwDESC59O8KDT3kU1Jk2zQnRQ2wJ/2ZELEXcX4
 Bo96Ql+6b6/77QTN9eNB8UqcC9MbOmNnLFeS1ksbmlW5ZDfgoUhJaItnSdZljXSGBMBA
 pzTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg6Tl7iy1Mn8meQKWDeCl1fM7HCVA03sxUeOFhHm4PRxgUs8TRt0S+3CC/qtisjHWEHzi+PfomtRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDr4tUnuVeRNz5XXTU8lY97mjVUs7VNZ7T0JOHuY7a47MhzgA4
 1jYIeHAu2+4fhNqzR7Hq/f3sLf/TX4mi5GJmD4oMqi7UrFcbn26zl+2cOgGA8/0=
X-Gm-Gg: ASbGncv5kwNGxND0zJt1uLGfy3wuA8gjJxepOA6X20rnH7TX2wYFzjot1ds+Ks9S6O5
 mQGmmDsoNS2yfF/R1Wrup8E8lzoAx43ceOIibu+TCfSAKXOeDnkVxKT2AgtKbQbQPFXYIFAt7Jz
 4sNVq1ymb65i42mMjdwkmbPFke9QL2ND4fFEio6rQURQZZ/eKnHTKpYrTnT5Wv0EEB3pYohZ1VT
 qwhiEGg2AehfrKmmqur2Qo7ctHg4dCUjjDYWOBXbTFcwaV9EJfAsPKQBvKJqWqiwRWUDBvP6li4
 lhQlUfALIUaRFODE/LC5OXkTo1hskiAra1KdwItob9Ef11E=
X-Google-Smtp-Source: AGHT+IEulD0uH2vbpuR4f4ZA7Mcq0ByRrFg1az3eKDUNZKezFcapWJg4o30Tvo+Xd7BMD278/s2TCg==
X-Received: by 2002:a05:6a00:9281:b0:736:9f20:a175 with SMTP id
 d2e1a72fcca58-73dc1442ee6mr9314401b3a.2.1745089799961; 
 Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf90d7easm3611489b3a.84.2025.04.19.12.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Date: Sat, 19 Apr 2025 12:09:57 -0700
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
Message-ID: <aAP1BW3RmMb/Irya@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-21-m.wilczynski@samsung.com>
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> of the power-up sequence.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 474f31576a1b..6b34aab4b455 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>

Are you okay if I omit this hunk? My thead-dt-for-next branch is based
on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
window.

>  
>  / {
>  	compatible = "thead,th1520";
> @@ -497,6 +498,12 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		rst: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset";
> +			reg = <0xff 0xef528000 0x0 0x4f>;
> +			#reset-cells = <1>;
> +		};
> +
>  		clk_vo: clock-controller@ffef528050 {
>  			compatible = "thead,th1520-clk-vo";
>  			reg = <0xff 0xef528050 0x0 0xfb0>;
> -- 
> 2.34.1
> 

With the above caveat:

Reviewed-by: Drew Fustini <drew@pdp7.com>


-Drew
