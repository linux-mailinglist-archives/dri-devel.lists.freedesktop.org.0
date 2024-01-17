Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D95830E33
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 21:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4A910E85A;
	Wed, 17 Jan 2024 20:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B383910E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 20:51:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso1173498276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705524599; x=1706129399; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oOgLjW6oMidNjG/VSGLYhyD5eLZJxjjB9wMU1cNUdUY=;
 b=LBF+oBwOYcClylSO8nZjAVuUUDNWlGB7DYCuGGFxJkKHE3c2jbKgFUsTVRsxncF84G
 +uoBv+jkgHFrvwKQnGZd7ny87TIFcspkFB6MV50ktNWaYJEIg42v11XsdrMAwrwgg/iI
 VkEDAgx3GyE5E7Y/8nr7ZcW82ZsWBh+PJn2SkMcELqW22hGE6g1065k1a7tdtnYh2PHE
 2znkaqVs4ntd/12oHbEBwDe8FfPwIDDez4k3PkwhtapoYGS5W0veWc6O9jSX1uqiIyxG
 MyvgElIKyOwjYO0/NWIPadqYz7ZhI/fV3SHpgeP2KW6bUIY2Ii8P6NwUAnV1qRGVtXMb
 pJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705524599; x=1706129399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOgLjW6oMidNjG/VSGLYhyD5eLZJxjjB9wMU1cNUdUY=;
 b=i6juTeG9oy79CNK3vJ8x6a7WZ8PvNAGxGXuqWGCYBmkTvY4zTpT3CKD8iLkn59h2XR
 /Iun7daZisgIlWM3rqrxabjTW4fgzkp1uoLXuNOXAYlGAoZPBXYx1ri4aTtIwEAfWGaf
 9WL82ms/FDnPg2nHt8uz1Dtn97oCV8raJ3CSVm90XzOiqOvZQQrOTQN8P6Xm8bpR0Fo+
 quX7fcjk/3Q0CwCXZN3CO/K9a5+kwrrqNP7AJjyYOpNNfaNgkXj06k0oNG/IKPMDhACt
 k0z07KjRcaSkXUSP9RtKXGHMPFwpr4akggaGLKtgfwQfarbmHhI7xUKFjt6yfoJGOhf9
 Fnww==
X-Gm-Message-State: AOJu0YzMkWZTUN8dd8Blm7qMam3CFpgLt3DuTP42gIX/wIGYQudK0eiY
 9+7J1egUcLNqhXO95VGLEbH2oqr1ueAJqir6wTeemq4N8L72tQ==
X-Google-Smtp-Source: AGHT+IFihrVH3fldA6xbmvIxlEjNgLwGjLfOCyD7CGXxUzVIOuychoqfZjc2YKXgcnLIYQLLqNOGDmj+MeRrPgGRWw4=
X-Received: by 2002:a25:b187:0:b0:dc2:4cf5:abf7 with SMTP id
 h7-20020a25b187000000b00dc24cf5abf7mr743558ybj.101.1705524599463; Wed, 17 Jan
 2024 12:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20240117194109.21609-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240117194109.21609-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 22:49:48 +0200
Message-ID: <CAA8EJprGU8E=kM3xqta794HjGAPp7ScuLv_us9KpjrELDKwNcA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: check for valid hw_pp in
 dpu_encoder_helper_phys_cleanup
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
 seanpaul@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> The commit 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> in case of YUV output") introduced a smatch warning about another
> conditional block in dpu_encoder_helper_phys_cleanup() which had assumed
> hw_pp will always be valid which may not necessarily be true.
>
> Lets fix the other conditional block by making sure hw_pp is valid
> before dereferencing it.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
