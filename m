Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355559151AF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5286410E49C;
	Mon, 24 Jun 2024 15:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b4My7k7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E7310E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:13:07 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52cc671f170so4708806e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719241985; x=1719846785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aa9CGWtyPEMf2n0NlgpWFkZxatDWsnV3NetNY1UfLKU=;
 b=b4My7k7l8+hlvRXCQ878UB1QncsINR4wNqceryCbiDjqBkUFU+z6iRP7xug7tnwD1m
 54z99GEHLtlvtL13XcUsedk/mpiDHs5RqlndutYfVnsOjh31pmXNqpA7wxoBGL5smva5
 /MTQ8AP0yP0T+T+lUOY917sJXaWpg/YP+66Qm7qPiwKp7mzgyy+R9/foAbEuw7Coffzt
 7NWcGsz3uOda48Gu6wEh0KgrmfCVIR388dUu48hdEEJ95NdfzT2pWjVqFlzcsW1kAQVE
 a9ofwRqolyVJ4/1XvqgXLvkAr/CeFweoDKsbFYHSRl4lSI0hNMj96zIIFO9WOybFAxF3
 g1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719241985; x=1719846785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aa9CGWtyPEMf2n0NlgpWFkZxatDWsnV3NetNY1UfLKU=;
 b=oZB+7MkEFYKXTxKCxXaADeZya2Dm9jaabKSlJwVV4lTWgHqhIavxut321yDxVQKUM2
 ka0IR57SiVcP0WmbnMG6BynutExFDudVjSZlZVVA760wojQZ5KfzH6t6qnnjdLtuYO+h
 DNok+iKBdIAHFebW9F52pbvdy8feX0Iz7RhKv8c1PusjDYFlagDK+Cb5Jh2yUMEii3HP
 iBlKgljSFZGOKFvjAXga4iPb3KggqQ2f3oXhROyoLbB1VaLXeAZ+JRWd3ZsWegRbVM0e
 EJXFjO1CAeA/VH3AqV5TK32+cFcCFUi3qZagSrrr25jUI6Kx3x6VgCuJTULXnIqfRXKo
 FqjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfBJpxoefzDzJffrKsOQbQPNNM6m7hC8D73dZ9kaD6lCA8ePMrborSM+iOp8g6nq29/dTHLO6QU/hAE63DIbuw1iJGepeagM/DNl+z7vgt
X-Gm-Message-State: AOJu0YzdGX0gZ1+WlDzJAunCf8ibjdy2c1MUNnrjQW4Z+znBX5DHvJNe
 piabTyRSkILj1MX8LoqG58iGHe8nUlroose7nxHSB9BO2cAL0DGLsqzBdDMpMD0=
X-Google-Smtp-Source: AGHT+IFXLHxMYS+Mr7XUWKADI3In6X2GFA0kd96lhxIykKJO6jjnjmk+JT50Zk3RpsKGmfqjOZXfWQ==
X-Received: by 2002:a05:6512:358a:b0:52b:9223:be33 with SMTP id
 2adb3069b0e04-52cdf00d27bmr1693816e87.16.1719241985247; 
 Mon, 24 Jun 2024 08:13:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd76516f3sm963863e87.151.2024.06.24.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:13:03 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:13:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/adreno: allow headless setup on SM8150 MTP
Message-ID: <vlgeachxzzmxttqqhbbs5kk4g2mtgp237jccbceo242fvhxucx@hliztpfh7c5j>
References: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
 <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
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

On Mon, Jun 24, 2024 at 04:06:24PM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/23/24 21:34, Krzysztof Kozlowski wrote:
> > Commit f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes") re-used
> > amd,imageon compatible for the SM8150 just to enable headless mode due
> > to missing display controller nodes.  This work-around was later
> > narrowed to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts:
> > qcom: sm8150: Don't start Adreno in headless mode").
> > 
> > This was not a correct solution, because the Qualcomm SM8150 SoC does
> > not have an AMD GPU and the SM8150 MTP board does not have magically
> > different GPU than SM8150 SoC.
> > 
> > Rely on board compatible to achieve the same in a Devicetree-correct
> > way.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> 
> Let's just forget this exists, this was a hack from the start and not
> a very necessary one given display bringup followed soon..
> 
> This should be handled by a module parameter if anything

We discussed having a modparam for separate KMS and GPU msm drivers, but
I've never implemented it.

-- 
With best wishes
Dmitry
