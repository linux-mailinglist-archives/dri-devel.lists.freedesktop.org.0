Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7179E841B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 08:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5426110E239;
	Sun,  8 Dec 2024 07:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bG+tNMiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272FE10E239
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 07:19:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso247684e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 23:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733642383; x=1734247183; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BSavt2FoNM1mE39gFwCc/sD5iNrGSzjtWvCi1YPHoOQ=;
 b=bG+tNMiHTaFnI3XFPCri9aeWK2PfV2v68M4jCJHZ0p8xkPDWmpKcWjumBMLE0MwuN6
 4VA0YR6GXOtjSVyyzQYAceL++WDj19V+9P8iGdLHuODkXNeF7cZWRh7adARLe8f9BeQc
 qCtOZDUOj2ThJMJ8O73uE+ln6yKzRyIoJGkwuvS+l1HTBPt3yD8C+Ub5Lv8TM6hQr5Pb
 FoevAZ1cJ1Q10lJELsJv+BaIQL4GfFZlD8tl1RL0KiI8HHAWQRy8jO9uHyHA2neOK0pv
 RGpBIDCI6/iUK+qfsxjHbSO7skmcCaZmLUb2d+xbVYW6KoFJk4NH/sWvya2wJg8FKMFC
 BNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733642383; x=1734247183;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSavt2FoNM1mE39gFwCc/sD5iNrGSzjtWvCi1YPHoOQ=;
 b=gcHya/momQz9YBP8DGWbpGvHse3AMHeyQFelBawEyMp3UiFpn0P28AumJCJPDiKWIF
 05JvGXCzVXvuCDw4xnq/68Xh6j4maGuPrxwJx35/1e/QtOBsATU8xsPak2ThH96tvDHL
 T/ji5ld+14MxhHEOZQ15x+YDWCE3n4IQkJLBY7nl4X5S9hmfdUbp4j1Mh8z6b0VBOJ1p
 QNnj2VHyU03rBphChArlyurnrTXNF20n6/7XMpTAcrDU4kRHDd5388LM9ehID/MLeL4a
 AHe5sos2mvUQwo3GB7PlTKHPlWhi01eferNpooitEKh3bmUxMVUc2sGEgLyKvuPrZ6Ts
 8jLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+HtMYl2xcQJLDlx1spWrTYkS5GkRLZA9XpvXtyPgSVroEbphvWSsFBjqPzsVffZSRxtVZMWAid8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB7yqjHkpBNwxNfZFkZIiQl8+lKGNGou7N5VI57YvEMj05aFSm
 O9z2c8dxnQRVY/2wZrbYV27Y8QXTDR+2RCbPtgzkGJ0zLpPKlfLzcOzxUt6HRF153dhLzqImYzX
 PrpU=
X-Gm-Gg: ASbGncvtsLzcuGV158cekOboEKlUEXXL7lq/xU0qLzVzjT6iZEiEWWiiU8Ja4b7CYWT
 05VuDxLHGN3bFNsBfZn7+3nek8+tccq96iuJh1zBBQHPBO0lwJRxOVcjOklYp+81yGsILb8q29j
 UV011udJ0Pg+HVUud0EsJe/dpN8A4yXPiVPhWunW7Zej+rjPBjcduMSgtZSY7glvOs9EWqvS+mw
 WjNL7qwnNLgvczGkvEHTQaJabPmGK20mh84hIizaH4Hlu4zgVFxfaXiUlNphdrVLAD3VyF3eP/r
 dMkrCDvejIt7/iKQak/L6+I+7GcvQQ==
X-Google-Smtp-Source: AGHT+IGUWPi+aSZobVh5ZE44taMUpkK131X0xxiE4FJZcXmYsAwbDt66FDeOMwsglwz3FhulcHhd0Q==
X-Received: by 2002:a05:6512:2214:b0:53d:e41a:c182 with SMTP id
 2adb3069b0e04-53e2c2c4b80mr2664237e87.31.1733642383294; 
 Sat, 07 Dec 2024 23:19:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba9fcsm1015427e87.113.2024.12.07.23.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 23:19:41 -0800 (PST)
Date: Sun, 8 Dec 2024 09:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
Message-ID: <pb5wve6gfqzvxxn3i4vafsw4dhhu5rq764gxqnrqhabhheotjm@rc2zxyyvlfup>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:02PM -0800, Abhinav Kumar wrote:
> Add a new file dp_mst_drm to manage the DP MST bridge operations
> similar to the dp_drm file which manages the SST bridge operations.
> Each MST encoder creates one bridge and each bridge is bound to its
> own dp_panel abstraction to manage the operations of its pipeline.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile        |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
>  4 files changed, 596 insertions(+), 1 deletion(-)
> 

> +
> +struct msm_dp_mst_bridge {
> +	struct drm_bridge base;
> +	struct drm_private_obj obj;

it occured to me, while reviewing the next patch. Why do you need
another drm_private_obj???

> +	u32 id;
> +
> +	bool in_use;
> +
> +	struct msm_dp *display;
> +	struct drm_encoder *encoder;
> +
> +	struct drm_display_mode drm_mode;
> +	struct msm_dp_display_mode msm_dp_mode;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +
> +	int vcpi;
> +	int pbn;
> +	int num_slots;
> +	int start_slot;
> +};
-- 
With best wishes
Dmitry
