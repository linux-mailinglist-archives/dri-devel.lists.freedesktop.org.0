Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5198927B2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 00:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFABB10E40C;
	Fri, 29 Mar 2024 23:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S2oiRJkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5E10E034
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 23:08:39 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a4715d4c2cbso322556766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711753653; x=1712358453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
 b=S2oiRJkHZZgXpltUIyjeEoeLbeyzEFFimc4j1gz8N8adqr7ZMqHg+ImIOxI2b6xj0l
 7vQD8RV9Ui1rk62V41EsHcwiIZNRD028mdeURk+dd6rMPQodOr2aVLME0qVVLfbzJEAx
 9nuhg1pRdWpNBjUTNvGzUotbf2Gkhnbph581I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711753653; x=1712358453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
 b=GnCDV93ubJ3OweAf60BAJ0KXA89HN9QUCX3JX3FHEgG31dONVAcIK2ndWMUMDiHooc
 utizg3Gtr0w9PGYh+LOaUSxqu85tSyb/pHYMmH+joAOVKW6ii4M22WvDWDwMJBdmSfvf
 bijLZXnrO5uA42WoL9zN7dEDzBRNNGT2b1qmJJoVaYXxYm5VvdY9O5KWkQKxCiCDNI1L
 MqsCStNb671+gAIwe1L4yI1CinI03cQlgeZdqSUzmrugTFG1m5NYD3pbJ8P29bXCzTo7
 TWafO1XYDFj+2pmbSnBJg/JXJ7vEuvwC7axC90bD5pWSQii3mw4v7+mvsaXI5fkoOrIc
 OobQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5GiCfp82TEBJashtD6au4VFNRZ9o6ys77ueglU0iyuNQQHI3wm7z1p94RhUWQY4wrhNPiPEM48mKIqByijF51ITBj6wkB5HD3tl9livtX
X-Gm-Message-State: AOJu0YxzDByHLxYCDxMiXZLymb+FymWtdCHfg/6FdWxpTlG0mi8/nNcq
 ptWDzzPFcEPpvNlmQ0jtGimoBFgFhShMrVOAEMPiSsI85HUqgPjkalSNXW8ZTUwQj+EKLyQSgDe
 IUg==
X-Google-Smtp-Source: AGHT+IFlwfqj4sjyiv9p2oC8kyH+ljA+j6Yai+NZMQz98BvT44wUbk4HInuKjDqz8cVA2eqOdEcb0w==
X-Received: by 2002:a17:906:c249:b0:a4d:f2d9:cf1a with SMTP id
 bl9-20020a170906c24900b00a4df2d9cf1amr2181351ejb.63.1711753653434; 
 Fri, 29 Mar 2024 16:07:33 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 r16-20020a1709067fd000b00a4720ce2e75sm2410317ejs.129.2024.03.29.16.07.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 16:07:32 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56c2cfdd728so15116a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxRdPnPQH7zd6XEcLHpebhQX3XimQx6+UHAQobnoKgUcYvj20FoU6ZayAiFSMPKut1jKmnPDjQA6tg+39cBMq+6PjszVgwer8SDTupuprZ
X-Received: by 2002:a05:6402:389:b0:56d:c058:79d with SMTP id
 o9-20020a056402038900b0056dc058079dmr2456edv.5.1711753651272; Fri, 29 Mar
 2024 16:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
In-Reply-To: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Mar 2024 16:07:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Sat, Feb 3, 2024 at 5:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
> pre-emphasis to 2, while the real maximum value for the sum of the
> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
> limitation.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
>  3 files changed, 15 insertions(+), 27 deletions(-)

What ever happened with this patch? It seemed important so I've been
trying to check back on it, but it seems to still be in limbo. I was
assuming that (maybe?) Abhinav would check things against the hardware
documentation and give it a Reviewed-by and then it would land...

-Doug
