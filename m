Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84956806A63
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331610E6C4;
	Wed,  6 Dec 2023 09:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EF010E6C4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:10:44 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db548da6e3bso586393276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853843; x=1702458643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
 b=tfu8hp8ADqh64PizEnbv1u45TO8HoNjH02LaDo/4sIKstvf4/x9c/PW4fe6uN1bc+b
 62YEPaMD+4qby3YzacmeQ02rrWMjyLYTcu4VczSOblagc/5Vt6xyNtAwvW3FVImKG1RO
 cu/WsjHuaVOqwAHPzZTZ+2gOY1hl8RCNuOC0j9a0r3LNclBnVWipemH0isUysds9P+0P
 v9pPu2xbWM9t5LGfc6kjMkMGHMhXzXARsDPA0TV6+xbwMEO++4Dj9+GTh5VBVqvb9Arm
 l7WNw1bn2G8kcT/CFNHJRaBNa3huJe0ELzKD8trTMUyQKGHkqKzKq18LHWQVVi7VsmkZ
 OeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853843; x=1702458643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
 b=ih9Vg43mHxOzNAvlJQNMmO4kVp8et1rcs4KkoDiBb2HqbxFA+y/w5RBHpHHzh9IIgC
 19G/6n8IHJvWjayeYE4VVm9Ov+cB3nwbjM4uZFJC67Ho2oC5xrKEduGJKwDVGhZwnivh
 hwT0L9NnwMxyB1YBU+LjdcCMj/N5NSwnU+mK51Km4WzqVAdVAQ27fVgswJvqmnCuWVJ+
 SRFQhunG+lZwMm45hj6XewhZEs9MW59seBhrH3k420rEN4DHUPdl9Iq/tAk3SQbgUh2l
 EHqeyEPqZRKMlPBpI/V0nXK/k/5n7gHbijUcTXSSl9cl/n76EIeFnsPp7Dgqw3EDv932
 +9Ow==
X-Gm-Message-State: AOJu0YwYGWQtJIPmhYtY85J6UmfF4m81X1HZ8+CZVjUUmrW2WXctA7jp
 FLtkqQffTcK9vDI7o2kcKimncS5s7ucUoIKlXSq26Q==
X-Google-Smtp-Source: AGHT+IEXzruhFFkHB0Fa+/n84Bb6lIWEsIELJtEm0FOsD8vWSyRbbfLPr/HFQvgfnZNoovdex9inHxAp8BUvFfqaPBM=
X-Received: by 2002:a25:cf13:0:b0:db4:d68:d450 with SMTP id
 f19-20020a25cf13000000b00db40d68d450mr2003989ybg.25.1701853843738; Wed, 06
 Dec 2023 01:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:10:32 +0200
Message-ID: <CAA8EJpoguMhnO2LbQvpbSiuq6PAxqc3cT1nLKFmrA43sP9c-3g@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/adreno: Split up giant device table
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:05, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
>  1 file changed, 51 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry
