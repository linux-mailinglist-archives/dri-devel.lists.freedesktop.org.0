Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96780A1E2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3850810EA78;
	Fri,  8 Dec 2023 11:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B325310EA65
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:11:56 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso1999415276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702033916; x=1702638716; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d5sTiUJetif/fgYO2zq3XsvRjD/RlEkJTpjxX1dPW9o=;
 b=E/ROTQ7TbqG1A59b60mqJZGuqBNvtTrOTCXPdNxXEkVjbKIJhHfx120mZdvb1jGjZp
 imf9VsA1eo56ol/+z0nUohue0nM+WNJ3+EHZlGo4rp1VW8xyfciP0FNvM8M1NSzDXaNf
 1I1IVoQ+fX+xLMNKThyzUhTpXR4eVfxglUl7V55VehY/RU2elNmL/9IuS68I6j4JoTks
 ImYjncZsTD+h9DJvE7zdNjPMzaLc+oeybyBgrKBgmhwIj+wDZFd8KU5OI7+phE43VT4W
 BKyw7e1ajXHyxSFQXl9kWAFcE3Qn8em2XQ1oL8GfIWMnDx3XZPA3IthI3XUjo28RB5Nb
 PuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702033916; x=1702638716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5sTiUJetif/fgYO2zq3XsvRjD/RlEkJTpjxX1dPW9o=;
 b=jWXHVZkeAeEBtfqkmD2Se2aKccHSrR9WnNWa9dCZIeaLfwfDyXUTBiWI0P7p2/5Aa+
 rHGULw5MxCX5Om55Gk9F2HmCssmmIgN5Yx/Qbbl/xoOPLjGUnQJJTFuLrR/vjArEo/nM
 L5JubeibYHoXai8u0fU/PY3Zt7IeX3GyTwha4CgDU6Xvkxl6GcZRj0M/dQpLmPBGCoRk
 /nufiW+C/XXsEAKGwZzhqrdboULLdp2WPccjNc9QuTcpR8n4Iq1TE4xQfx0DJb4ZYWvN
 qhwmkl5xfEfDAUHXU0L90Inheh2hpAt7cFQA3g9yN0JNkxepF92FnytGIP6s6RzrAmG1
 tZ3Q==
X-Gm-Message-State: AOJu0Yw+nemtH9ARNl+0GP6+YRXTS9fU24d9Raeu678W/GrZMwZBQcVt
 c2pEWhqRYsAED8e7vON9coIA5A2rGu9qKR3lkTtm9A==
X-Google-Smtp-Source: AGHT+IGadWRb7RLKWnHwQIGRXCckpkVS7uf7R7LgUD+cmDd+xOtJ0ovssIG5r2vaLiyKiudQIHYP9pqYEOJNDQwjEx0=
X-Received: by 2002:a81:ae01:0:b0:5d0:aa04:7b71 with SMTP id
 m1-20020a81ae01000000b005d0aa047b71mr3251777ywh.24.1702033915757; Fri, 08 Dec
 2023 03:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:11:44 +0200
Message-ID: <CAA8EJpqaZc7xB8Jb8uweKZHgLRb8SBtEN_rUCxWAK_u7hW8H-A@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] drm/msm/dpu: fix writeback programming for YUV
 cases
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
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For YUV cases, setting the required format bits was missed
> out in the register programming. Lets fix it now in preparation
> of adding YUV formats support for writeback.
>
> changes in v2:
>     - dropped the fixes tag as its not a fix but adding
>       new functionality
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
