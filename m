Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F031CA3C5C1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7E810E49D;
	Wed, 19 Feb 2025 17:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h8ftXl/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4502710E86A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:11:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543d8badc30so88239e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985075; x=1740589875; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
 b=h8ftXl/fibPLV2/VZqEyIWgbR/olcKYcKSthTxnDSYgTfL08dqNeuCmP3rIrOI5Kif
 957PqLuoIlUWNgngCKjDc66VYoGbXYzdkdzRouodGj0ojkboEmafIdfag6fAHePDPfbV
 hAbBL9ZLRLUrCgomZ2fUrZy0KVZgC6bGI3FEuy61GEHxf9eCymGYMrFvgf/MheIc4ge2
 vINwNoU1DXzHtEXaODiTIekOlhemZJRa1qDxUF5GBE6eQPVvYJnJuGXZ8591lMrePw37
 8cjGhh+4hwVovRkyoc+22FbaqJ8xyVp8b+ahgQEubB6xnpM1aUfnC0mJKMCdg/S5Re0F
 DLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985075; x=1740589875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVBCLwBb20SftVpr6Cb6gqWVa+/TpS0PacR3slD6cr4=;
 b=D5OdfAtdtALI4XuHfov4Ql+0OoSXJ4ONjPmoDA7nlUY6P8nABgLXUf6prKjf0b5rcO
 UX9C/4xrSxPLY5pbzI2kdCmSIyWhSO/SJGNcsLsW4bGeurofxNlKMhwWFYgnP3e46EPv
 X1DiCBxzfQsu72D3sp9b9NcEgw9/DzE6XFo9OlvbajjmkU43+8dqtLYA0yQQxpC1uQii
 +KsQtOyAoqIkqzafbf0xP69K1RsbUigMofDh7pkDvMNV6li/3+ioihRaLi29wBHWV9IZ
 az+dxGVgrykEiyRwxl/ix+4qGGLqzx5LoAqaFzGGQydI7qXsIj7fG1ct/eeVnuDKl9oN
 JG1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/6ZoAFWiJZVSZ7Xf65rcJKKydNTcI2PSM/3u/ppWsP+oTIiYq4dwO0Pnf/kG4ESrKar/EViuVyX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsKpUBZDjQzYk3qTmGFbg4JhBz04BjC7CnIL+8KtucWuaMjByl
 jh5qpI/JuzzTRqArx9i5XRw/4wb7duX8y/8Rw7KNxwI4IrDa0MASdnjCQj8gFUk=
X-Gm-Gg: ASbGncvpn0MEj7oyQ2XHMmGcAjrhdhNy9HYPm9ew/AysMcvyB1fMnjc2C2sgDD3qxOW
 oLbVNy6gtoVpXNXSki377RvkXBk53XhSgu3P/67IrqLgWCI0umNR41AKcTRRUTAg2CDaYnGO4y8
 Td8PolIAG6d08CXb5XXxKxpp9qRPRwCqFWgjkFoBdXbZrMqcXKNvMuOb559vQIT74Tp9PWG0Dvt
 m7enIEGh6Tiz3GfzLGoQ+t1AEnz5oxOWtlX7/HVn8lASqx9MEN1x0RrXUCRy69arRdXIqxqwQb1
 9QNA1HxfAnaIhpiQ80f89z7S9/dRlBvNoG0DiGuKLNoMcrFygre1IOMwJqzwqCTCSn5N2NY=
X-Google-Smtp-Source: AGHT+IH7FL01qZOB3XAPbsmFC6KyEv2EmZ1yIsxjB78l1rwLXp5knouU37jT15QdaWHDAkHvPlzRzg==
X-Received: by 2002:a05:6512:b12:b0:545:e7f:cf3d with SMTP id
 2adb3069b0e04-5452fe2e4aemr7300090e87.5.1739985075494; 
 Wed, 19 Feb 2025 09:11:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452f3d38basm1661990e87.222.2025.02.19.09.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:11:14 -0800 (PST)
Date: Wed, 19 Feb 2025 19:11:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 2/2] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <snvornde63yoviyjn6yitmz2vkw424jkyv4434jre7ts65cqe6@tbqgalok5e5n>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-2-d28973fa513a@linaro.org>
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

On Wed, Feb 19, 2025 at 05:23:33PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. Split part touching pll_7nm_register() to new patch.
> 2. Update commit msg.
> 
> Changes in v4:
> 1. Add mising bitfield.h include
> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
