Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BCC0EC85
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0582510E4CF;
	Mon, 27 Oct 2025 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LKp5e1B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5777810E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:03:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso16665065e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577426; x=1762182226; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
 b=LKp5e1B4QnE6mOvgbb7iJXZ3QfqIrWGIUIwU7Q+JXx4hXT0lvXnFatGjkFE55bmE03
 +KgxfwPw/49/xJfC+4WnfAutWVo0sI0absF3Y6F9PwaGnmIyWE9WYsUzIiZDdSv/TTkg
 T21FzzqJmD6mNB/TAPwyxa5O/haT/R5Gd/RVh1Q7tMv/5942TIrf9Dhx9TEiJgfMSvx4
 nu7wOScj1Nk4wfUmJZJPqz3WNTgiqXrdqMVl6L7yF3TiI2AJRpJIZQxaLEMiOtj659il
 C2hr//Evxi11szPm6reGuApXOTvU/qw840f3Flfuo8Y6+iY8LPRmmi0ub1IqWhxhXoWu
 ucYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577426; x=1762182226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
 b=WFjhrlMiTCVc686td337DiR1ckWvi8+w/23YF9Xy21GF7U0JaUEjTOAZjeeT/LJqwe
 jk7DfPgTrOrvY01CUWCzDEz1fC1h1lfAjXi7o/XF6EPIH7XZzeeurSiZXm8XeKl6jDZb
 YD+YhVwR00fA2ycnIkHBDvN3i/QhhE+t3pzbDHJhfkLckiDHkJD8pGZ9PxK0+WM3dvQ9
 OKrav90In3DBf7u3JVCyf67rw/b8lRtn+gyJKcf67IbZsoQzgbemL5k2kPXL/qKzcdsm
 dj0PtfoLZjtC8RjcsQfUP79IgpiKqjfQQXH31wSnLMwsbh7ZM5PsIVXRHtTHKUQoTzaB
 nT+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ4M+nNw22g6cDx65CrG/r1xcPCmEvBuvMwqFgCmLMKDUoyV/jGp0pxoVUvmV/9yTQusYOXJRz7n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIlAx/NsS/eeaNOJSj05uceYrYDuWx9WLs6Y20PcWnE9N/LF3Z
 PyhJOu2j8jo832SPkjGzo/NsTqLkE8rOFLNSDU24KL8gSbWEY9AW1whVr7PbXKIRHww=
X-Gm-Gg: ASbGncsh0loDXQ9AKGbnlU9gsNg72fti1Uopf2ZoS++4TPP0Nmkw7wpWsexbcYWKDKZ
 pY9YGyX+VhMKtHZXRtbwz9XkqZ53CXBau31J1CWrC2Ngj5dTx9ayo1wmyOfcWP/62A9dtcrtJpo
 xuFpf7BsTxMiCpE3mhefk6SVvq9YSOZs7jv1mH/J4ywWeXygtL8bBnWb+/RyWsX9N2q1Z/bEEAO
 Pjzm5npQBDx6xwPt5Iqc/F7pfrynuMJCQWr99Eg6ZbxESuEGYNFIAxHaWSIaii/AjSYgup6HZG0
 u8nj9ZqHZKAKI4QEgdbvhb0Rzpr8sKprf/na9GwJyTrjueEpZkTmVcpRDkCz0hHmiOYDr7sGvyh
 t9pJk0oLSoA28MTI8DECwSnDg0aAL7OTukbkDz+Of7034WIsrYhxIZznP1YcpHxAdp3TLVLTb
X-Google-Smtp-Source: AGHT+IGdgZKKc8tkom/y4GwEbztmjQrk8NHF1ywqGi+zVO4NSb3Xu2bsylUy9DS3LDmgv6YYp+masg==
X-Received: by 2002:a05:600c:1da7:b0:46e:4be1:a423 with SMTP id
 5b1f17b1804b1-4711786d630mr260978135e9.1.1761577425808; 
 Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475ddccaaf5sm68399545e9.3.2025.10.27.08.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:03:43 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
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

On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > Describe the Universal Bandwidth Compression (UBWC) configuration
> > for the new Glymur platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> 
> Bjorn, do you indent to pick up this patch on your own or would you ack
> merging it through the drm/msm tree?
> 

Please note that v3 is out:
https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org
