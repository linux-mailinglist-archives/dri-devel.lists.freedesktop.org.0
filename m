Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38D52C3D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 21:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770B10E65B;
	Wed, 18 May 2022 19:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F6110E65B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 19:57:59 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id i66so3958333oia.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 12:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UcTbUgGIvqsT3olvD3JU2VJ3/UUh5htiHSA1O+KkiiE=;
 b=YobbZ2QJc+rrHelFAGviFrdAvTVXo2zCucJrpGg+idHoeBAZ6YRxtZDeL0MP+vxdGE
 /bKWX1zSLEFTdq2KMZxiviOpAnw4gVrn7TkFfm1WaTmyRbQgxbESeDdZaTdXYYPOJ1gR
 DWspatPXKL1M3VuocDgKM8N8ed7ZLQrozT7hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UcTbUgGIvqsT3olvD3JU2VJ3/UUh5htiHSA1O+KkiiE=;
 b=0AkQps5nT6/uKPfZCNkIfkEWoQu3WQOA6xo0y7d0ZMcBrz26t0SGmmvCmm4V/6LOh0
 iWzsZTK0l3FM50+DJge6UwYwF/Np0Rem2poGieDm3939PGWD5Y1rNr34LRPzKb7cGjal
 grUJtll/MkdijBZsEAbx1fgjXQb78A6dtluXSblDV2NKmqGyzjqS7q2hOKlag7uHtZl0
 Khh0ACZvntIg8bdwUDBsZG3rj7eirz14XPIllcp4EVJsLFQrgpXmGbRzpFx5oLDRZemx
 mpobbsrf2c6jfL8QvPcip2A5IaTNqR1KxFR0Hc9qV+9VnjORWv3JfMbBBRuE1eSrqYT5
 pj1g==
X-Gm-Message-State: AOAM532QYwZsya4poieErvEl+hUXaf7f2niaqpN1yQuLkLt95KAhxqrg
 JKoDS4TEZ87xN5DKvq8vVQVjNkijNQ9o/8j51Zl2fA==
X-Google-Smtp-Source: ABdhPJxcBIZ6WAPAF+BE1ubh8zCQ2HtllaswZgL+Lw9xO6F45Cwgz9H+CQ8gV9kxkAh/6j0nnKospRlAC18YtbTnsk8=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr771163oib.63.1652903878386; Wed, 18 May
 2022 12:57:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 12:57:58 -0700
MIME-Version: 1.0
In-Reply-To: <20220518195540.30459-1-quic_abhinavk@quicinc.com>
References: <20220518195540.30459-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 12:57:57 -0700
Message-ID: <CAE-0n538GBcz1TgsamEoJvUZRYEVZ6inTo=9A7YOo8PMreYeLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: handle pm_runtime_get_sync() errors in bind
 path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-18 12:55:40)
> If there are errors while trying to enable the pm in the
> bind path, it will lead to unclocked access of hw revision
> register thereby crashing the device.
>
> This will not address why the pm_runtime_get_sync() fails
> but at the very least we should be able to prevent the
> crash by handling the error and bailing out earlier.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..2fd1f5b70a06 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1089,7 +1089,11 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>
>         dpu_kms_parse_data_bus_icc_path(dpu_kms);
>
> -       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +       rc = pm_runtime_get_sync(&dpu_kms->pdev->dev);

Any reason to not use pm_runtime_resume_and_get()?

> +       if (rc < 0) {
> +               pm_runtime_put_autosuspend(&dpu_kms->pdev->dev);
> +               goto error;

Then this is a single goto error
