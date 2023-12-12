Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B347F80E4C6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC69910E576;
	Tue, 12 Dec 2023 07:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4D10E571
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:22:30 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so4015476276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 23:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702365749; x=1702970549; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
 b=log+fSlQkQJblHckYWpJIwqAg6yPDRUiXkTF9B+MiQxwjotNW9Clv7JjJ5FA8Xf0yf
 EWSmxQeSjtWTzdvJcMTCg9YNOxS2btSBQltZbqrbZd9krmYBR3gjA03TJdN/GyyC6ALg
 QG0tgMTyf4tklKk4Vvd79W5gHCRWOz4sb5sMHl8sIPDYj/1q/fbevTP5YY3wAE7+cC6F
 u/NYP7UtQJAxf87oPACoKmc8uINaGcbEV9wTQXJH82EsOrUSelBOOyV6UgO43zRZEpd/
 JEJbBPzY/vyCNtUCY6nbhqfuM8nMOdoe0yPg9XR6UHGSoQfftHkPLpn7bAS30Fn4Axp9
 0HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702365749; x=1702970549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
 b=M+Cp+UgwkQ/2KLCnrdbygakZUg9RGypY2z1T75dFMCssjC3/Yd2obuGDqedb0dvqcs
 6yowkNQk1R5X/gf8PpE/PRxHec/r7EH+hH/unxC2tpmg0EqvvQchO2mtCGTCnvg8HC3k
 qUDuyMKJC4XYkCr722J5jAUp8xtelylsTC9aayzPXY2HxynU+pc4AweuC3gHWH/aTmOo
 IZ4MLKj7sgLGP758+y6YpPko/z6ZM0oKGVADP5PXgFqp2HJw0l72mV978PjV0Cg95zXz
 DDnuHCBKHvo+Zaves+S2XG9oDZUghLmActPoEfiO/NJWULx+fPQHEZ3qf3laTPcguZlQ
 gBcQ==
X-Gm-Message-State: AOJu0YwDevlzgDFFOWAc+vehxNpM3G3+Q7RrKjHYxznx4J7y8O59oKb3
 JssoOooKR+9u2C9bzQyDRQS4lmFCtzDBmNCIUuqtSA==
X-Google-Smtp-Source: AGHT+IFPR8fd+a0ocBEqptE2Dwxw2OhgvjQgzcLmo5cYSUTDyVSX6swyFuxqgUbNPyfiI+F4JCcixtPa397/UgVjePs=
X-Received: by 2002:a25:2653:0:b0:db9:8bcd:a071 with SMTP id
 m80-20020a252653000000b00db98bcda071mr2411598ybm.28.1702365749111; Mon, 11
 Dec 2023 23:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:22:18 +0200
Message-ID: <CAA8EJpp72_Qy5Lh+bq4Zi8_DRyhCf48gdGRz2fiZvb4y7qb4SQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] drm/msm/dpu: introduce separate wb2_format
 arrays for rgb and yuv
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
> that it has only RGB formats and can be used on any chipset having a WB
> block.
>
> Introduce a new wb2_formats_rgb_yuv array to the catalog to
> indicate support for YUV formats to writeback in addition to RGB.
>
> Chipsets which have support for CDM block will use the newly added
> wb2_formats_rgb_yuv array.
>
> changes in v3:
>         - change type of wb2_formats_rgb/wb2_formats_rgb_yuv to u32
>           to fix checkpatch warnings
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
>  6 files changed, 46 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
