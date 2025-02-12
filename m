Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A363A31A15
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4BE10E771;
	Wed, 12 Feb 2025 00:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q9710srJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED60510E1FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:00:13 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so66553321fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739318412; x=1739923212; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXlqploCpAbDafi9IQYW0m2Rs5Rua9IHjaJCRpBcJDI=;
 b=Q9710srJyzcKxhC1o81H0BYihpFw1mHNZ49rVrtVGo2W7iy5a6bxOb26nynUi9X12S
 cvzy4IgYkNYcPFG8q5jLTs8Srthry7Yf1qvSV3Bv2N5AV77dm7tJYiVw5c6DQBYnWj6Z
 pEcNrdim80SLAG+YOKgKlyvS0z8AyX+t8Hlsxb65Dq2qZpRLDHdkGsx27VX3Eo5UvsSg
 8CxzQD/wOd9SD0CcqedhMtPFVnMx4RXVuVCrjJpi7B0Pwtoi9Yh9n4gd00PWQfZb+XMU
 1LjdSPRMM2GgQg8yDv8ksnDocakLIY9GR730LZYi80QCv63LmJO5nXcxDEe/VHrvL3Fl
 eMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739318412; x=1739923212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXlqploCpAbDafi9IQYW0m2Rs5Rua9IHjaJCRpBcJDI=;
 b=VyWPnkNsx8SZkQk+T2Z/ZaudiK0wtHfXeMck/trosevpQ8j63sFWwTZGt/qDwNqKeQ
 s97WaGGUOZFjPV1wiwCpPpZHoX3pWF/BuL7dfoHW8ZiPGUega8EViREmmC2L6v4QgD3D
 rQRz7mNn7PYH6pTFuzbnruJf2y2cJ0VAC7yO4YlecmjyrlHKfpN3eUGO4C0Nr8+s1twM
 nqeMXx3qa6I9781uDtC3kywcISaoTJP/EjKoAKjgTLwDCt+egeF/AwtoaKdxIxhqMKBw
 TEcaSWAFy4X5zxScZBILeJpt68alU6vgt6HB37hybr+L6HlUdaB2YUh6VELgf3OB8vOq
 Tcwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoIgAaMC9owzgFKiFalah+tCatOyVGFujIfsVB5iGbFMVohKhf1Uah3n4v5FTjh2Yw9PXpZxBdZ6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA+zWAu/f9LjC9vPbVdcrFFR71gxu4G5FASteyNWFqenZGpHMm
 8ZYtbN+mbDREFUU5jnySPhP5uAkxF1QS+mOReNBpoMxLMA+rKX70644g1arogUM=
X-Gm-Gg: ASbGnct84/btQdr10GjJdEhE4hsFvvSqDXUazUtHx+zR+sGcPlu3kgtxj9lRhCpcypQ
 mqerwMsruuhawwcyKl/5SRoK/tmMP7l0+yKDUuHfPDjwOhSGnTZA5zsRsPZBF2DZ8pQYzpNqi8a
 K9idtaXW+NY3ySLCq0WsQCnIiSqdl35vt4GJtxvom+1ymOXBbSm61NMtH3uloMgvcO6cFRYhNRA
 nsPJxLJbYiXc79b3bzgp36Yw91YOEwaOXLys+28NpVPv770d6RRVvIkYQD6GZd4t/F4owSy2tjb
 hnB1g8H5PjVrfESkh1C5ZAwRRUqU7cbqI9HNeXTmQNKtF4mjR10gLJB+zjQ5ZXzudR7nwFc=
X-Google-Smtp-Source: AGHT+IEtKS1j1XfkAmAx1DUeN3l7Ubdcq3ACfdQx+1tcVmJ21pVK1Fh04wiPd89wQLtVZljJuTb9ew==
X-Received: by 2002:a05:651c:19a3:b0:308:fac7:9cc3 with SMTP id
 38308e7fff4ca-30903651950mr6337401fa.14.1739318412131; 
 Tue, 11 Feb 2025 16:00:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e2748fcdsm11095061fa.15.2025.02.11.16.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:00:10 -0800 (PST)
Date: Wed, 12 Feb 2025 02:00:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
 <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
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

On Tue, Feb 11, 2025 at 06:41:39PM +0530, Akhil P Oommen wrote:
> On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> >> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> >>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>
> >>> Enable GPU for sa8775p-ride platform and provide path for zap
> >>> shader.
> >>>
> >>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> index 0c1b21def4b6..4901163df8f3 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> @@ -407,6 +407,14 @@ queue3 {
> >>>  	};
> >>>  };
> >>>  
> >>> +&gpu {
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&gpu_zap_shader {
> >>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> >>> +};
> >>> +
> >>>  &i2c11 {
> >>>  	clock-frequency = <400000>;
> >>>  	pinctrl-0 = <&qup_i2c11_default>;
> >>>
> >>
> >> Bjorn,
> >>
> >> Please ignore this patch for now. This is probably not the right
> >> platform dtsi file where gpu should be enabled. I am discussing about
> >> this internally. Will send a revision or a new patch based on the
> >> conclusion.
> > 
> > Akhil, any updates on this?
> > 
> 
> I am still waiting for the discussion about QCS9075 board dts files [1]
> to conclude.
> 
> [1]
> https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/

Why? We currently have several boards supported. We can enable GPU on
those as your patches are pretty fine. Then we can land Wasim's patches.
Not to mention that the discussion seems to be dead, last message was
sent almost a month ago.

-- 
With best wishes
Dmitry
