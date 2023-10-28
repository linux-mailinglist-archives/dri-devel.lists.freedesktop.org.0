Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37BB7DA48D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 03:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C3610EA92;
	Sat, 28 Oct 2023 01:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EC310EA9F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 01:13:41 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5a87ac9d245so20879307b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 18:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698455620; x=1699060420; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
 b=xnQxJtPVQ6EV2L2Ly1WuuN3ymZT3YPR7SNgxRQsKsWOuTHkz99FOEAbOYrSXWw8ZA/
 oLXrCcimvpmQbjOLk233RXV/r5Ne3qNgviuw4Q4bpzGV027qWWT8FKle0raLpzvsDJli
 enkQdzl9hCer5WqUjPwMuy/4cJ6S4k0QyjycilsPl0jvcUvWx/uEVeHbA0Y12enF4ejq
 x7yFIGL9sCucfbQLOgXCmCl5HmA1GpUzBV5AapHkMmpdXZ0+GOMm6ExHePZvm0QlxKLY
 ZDgo1eIs2WB98F1CHfiazY0p98VtzwP5fcCN6j3f51SlAqKgsQtUkAF36VV0iffxu8UV
 eoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698455620; x=1699060420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
 b=OxPVNIEE9C5BTxK+pSNFdXPn+0l1qu9PTy3UDhI2p08tGEd56DKXwekMHXOIektCXy
 Htwr0ft5BBlJJ4XFUIWwPcFsF+k0m3pQ28a+ExaxflLI2QSR6kqQwYSJsGnN4OB6R4rV
 Yn0lQKRYw2yE/kbVczDlWq2szNHXRjKvz+/MnaW/He/Qb6ttIXsjUgyqr0E3An6T+ojz
 yQDAjBfuTZfwjrbbn5cMHsKf4skROejUlMx8fUJqOhNy4NBm0j5B42sS2rj6z7thRqp/
 8iBDdNrFqOtX6UcPcju44W93ORM7rknQhfxlZZZhNEZjdY5RaebwVAQ+boJvu3TRkwKH
 Lknw==
X-Gm-Message-State: AOJu0YzaXNrNPhJXncdNyvqavT+ZLZ/bsMJB2T+mY7oKVBKZkQ0UBUQC
 i6eAWlM1GfrrHVflQjvSjY+f4rDtCbAuh0634+f3TQ==
X-Google-Smtp-Source: AGHT+IEy0Nnb+1iIU4oI3Q8xCZLvRP2lIn7t5+74WBEv7quxXECJcmd8oYpwPOO1jVQx7DtAIz3Thav+x0gjcAzTf2g=
X-Received: by 2002:a05:690c:fc2:b0:5a7:ab2f:ec43 with SMTP id
 dg2-20020a05690c0fc200b005a7ab2fec43mr4524761ywb.25.1698455620529; Fri, 27
 Oct 2023 18:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-4-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 04:13:29 +0300
Message-ID: <CAA8EJpoNZ93LJUZ=4FSD7YGR801-M++YLjNo9_opSW=VddJ9LQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/gem: Don't queue job to sched in error cases
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We shouldn't be running the job in error cases.  This also avoids having
> to think too hard about where the objs get unpinned (and if necessary,
> the resv takes over tracking that the obj is busy).. ie. error cases it
> always happens synchronously, and normal cases it happens from scheduler
> job_run() callback.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 +++
>  1 file changed, 3 insertions(+)

-- 
With best wishes
Dmitry
