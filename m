Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F29A4F99
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 18:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A097C10E39F;
	Sat, 19 Oct 2024 16:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOG8ss0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ADF10E39F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 16:13:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so3977516e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729354396; x=1729959196; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eyqsi5/T3uW08fQdohg8/tA9trO3ULnXgBI887qHaFA=;
 b=hOG8ss0JVV7d8d1kjjknAy3eMmWKRBFlXRIoay5ZqqR1Gcd7jGWsvFYZ5/Ylc6LKYF
 PwJ4Rx9qqgxRpknegpVZOC0AAHTdyz/Fk2vq0Lb35wVa6Aoh3nmPh3E+kJJr3YUMDPEk
 m6E8YeeOO42qvHwrattsIoMZUlXvjW1qcfP2XGI5xhV/TdxCVYCo/GMKG1086gYNeqWk
 Oi4wcQ7JJVcepYz2kq3Tcb3qlnfQif/0iWi0YKeNl7TiyJrlAKIO8jdwQ0WJ/1unPJEG
 nJVS320rAiWRpz3qc1okAAUgo6inQiBU05GDJsP/hg8kgn5Wbve4Dc/TrZrzwOx3a9Dj
 nq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729354396; x=1729959196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eyqsi5/T3uW08fQdohg8/tA9trO3ULnXgBI887qHaFA=;
 b=WjHxRnsGLRTOJ6y4ZZpgkEY80uEVII9zqlXeRqF7Kc8AYJQvVEle/GJWCrXxuZ9vZ7
 Ua5hYi70IWZsOOinn5LtvjmunRX+PC9i2I86rzP/r4ZAJbivP9+mL448PSjKEjcsXm8z
 jcFtsOeZU23bffr9MwhBzZhZIXL8cnzNbOQyu0jF4pmgr2mAnKG9GMNlNr0oubmkJgm5
 oXit6438j42az1q/nwo6DMfxLwPnPXt3Sa2JQxyMH4jW50dex4QdE8ZKIqbnEPBy24Dt
 w3NOMBi8NhrA44OMh4ctMDjV82Bee+9QHgSIyDiQWQjgfuu+Z/FazwTeAtPquKM7dsV/
 csCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZlUSwPwpVYT9azW2Og+G1H7+hBYfm353kz9dFnlqhn5ajLcbihZO+xXyQ9IrPwYZnP0eBkNoVbP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFfYbDZZ7h2MkwKDcjub/W8qO2raK2F+RCm4oMKtyhwBNd6vUI
 ZvVWREQBAfsP9V+/+8TtAt6UyZKGof241Mkl2MoGQT8U/LIP8Q5igVMWQUNQnKw=
X-Google-Smtp-Source: AGHT+IFWgrZia2nkdXraoHHT50Jbl2vwki91dY9I8mJ543UJdCNHT1fkfo2f/WFCMjjCtYRhtihkIw==
X-Received: by 2002:a05:6512:b9b:b0:539:f1a6:6ca5 with SMTP id
 2adb3069b0e04-53a1549dbf9mr3051471e87.26.1729354396042; 
 Sat, 19 Oct 2024 09:13:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b92f7sm562207e87.71.2024.10.19.09.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 09:13:14 -0700 (PDT)
Date: Sat, 19 Oct 2024 19:13:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Message-ID: <nka6tuz5ackflwzkvqwkn2sqt4rgmmib3n5sywdawsfay7xyte@nejv7uuldg3z>
References: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
 <85873886-c578-4f42-a46e-728f9a92f837@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85873886-c578-4f42-a46e-728f9a92f837@quicinc.com>
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

On Sat, Oct 19, 2024 at 09:13:23PM +0530, Mahadevan P wrote:
> I apologize for the inconvenience caused by uploading the incorrect patch
> (v4). Kindly disregard it.

One thing makes me wonder. You are using b4 tool. It should handle
versioning, changelogs, etc for you. However despite all of that you
somehow have sent a duplicate version of the patchset. And the changelog
also doesn't follow B4 style (which is useful BTW).

Could you (and possibly some of your colleagues) please stop doing
whatever strange things you are doing and just use the tool properly?
This way, each time you send a series you'll get an automatic version
rollup _and_ a properly formatted changelog with all the links to the
previous iterations, etc.

Please stop making your life harder than it is and just use the tool in
a way it should be used. At the same time it will make our (maintainers
/ reviewers) life much easier.

Thank you.

> 
> On 10/19/2024 8:46 PM, Mahadevan wrote:
> > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> > includes the addition of the hardware catalog, compatible string,
> > relevant device tree changes, and their YAML bindings.
> > 
> > ---
> > In this series
> > - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
> >    binding documetion in this change:
> >    https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> > - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
> >    depends on the clock enablement change:
> >    https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> > 
> > ---
> > [v5]
> > - Update clock-name of display-controller in MDSS documentation to align with
> >    qcom,sm8650-dpu.yaml. [Rob]
> > - Update power-domains of display-controller in DT to do proper voting on MMCX
> >    rail. [Internal Review]
> > 
> > [v4]
> > - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
> >    to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]
> > 
> > [v3]
> > -Edited copyright for catalog changes. [Dmitry]
> > -Fix dt_binding_check tool errors(update reg address as address-cells and
> >   size-cells of root node one and maintain the same for child nodes of mdss,
> >   added additionalProperties in schema).
> >   [Rob, Bjorn, Krzysztof]
> > -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
> >   path in devicetree. [Dmitry]
> > -Update commit subject and message for DT change. [Dmitry]
> > -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
> > 
> > [v2]
> > - Updated cover letter subject and message. [Dmitry]
> > - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> > - Update bindings by fixing dt_binding_check tool errors (update includes in example),
> >    adding proper spacing and indentation in the binding example, droping unused labels,
> >    droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> > - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> > - add reg_bus_bw in msm_mdss_data. [Dmitry]
> > - Fix indentation in the devicetree. [Dmitry]
> > 
> > --
> > 2.34.1
> > 
> > ---
> > Mahadevan (5):
> >        dt-bindings: display/msm: Document MDSS on SA8775P
> >        dt-bindings: display/msm: Document the DPU for SA8775P
> >        drm/msm: mdss: Add SA8775P support
> >        drm/msm/dpu: Add SA8775P support
> >        arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
> > 
> >   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
> >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
> >   arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
> >   8 files changed, 830 insertions(+)
> > ---
> > base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> > change-id: 20240930-patchv3_1-600cbc1549e8
> > 
> > Best regards,

-- 
With best wishes
Dmitry
