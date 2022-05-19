Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFB52C89D
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 02:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936CA10EFD2;
	Thu, 19 May 2022 00:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D0A10EFD2;
 Thu, 19 May 2022 00:31:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so1891819wme.3; 
 Wed, 18 May 2022 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=644m3QAZy0BxnZhjJAWJUaDuf7e4YnP3tpJeqi/0B3s=;
 b=I4+dPQhOXhs6SJ7SI/ufzv2ZecyYBH355nWOTQVBZgrFYg5DlOPZJA8ftE0jXGgVKJ
 Vy+hiYD2+ZUIIy4S5YQS5/XG1/NNkjl5T3Jgvf+RJIZ9Hu9cHZ5neC0aLVDGFqZyUfWb
 xE7YB5stgdzXjP9l+Rd5gW+LUEqa1iDSdxvu6Qadxg/HS7o3L4JyfrOPum+osO0CiIvG
 PoYakGfj8lMIJmfkfIOtViNs22z216HulHVpWqT51D2rvhWnO5CiMfLpZHF2vNDm6i92
 uZBICT49fLYbSOkNV/Zp3RvXxL0BwiLJH8g7hGMwA0d4JHcoAGiChIBFZJ4ow7TE3XS2
 5eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=644m3QAZy0BxnZhjJAWJUaDuf7e4YnP3tpJeqi/0B3s=;
 b=Bzj/+/UVBxeIamQJtE+Zyeh/4e+5t0Dsm7WxfMHRBSH4/xtJ8qA5ZXUXoOPQ2XJCCP
 iEZwrOe7+hLrmcX+l1WDjC+u62FCAsDn18hNGi+DnwgRSBVfxTtZNe6Gr2DbfH1Zot8p
 cPn2HUo5t1x9TdZgDxLJ4nmoJiJiG9Kb4mJM3XZfMsGnrLFbTBvSWB4dW2vTJG84OAR0
 UOGI/0RWACCjJpMS4daOUVCswEjjUi0uhzTEPeRC+8cKyqGFeFpQ85qA1m82COvZJTgq
 J4ZGv8J0DvO60Wd3MBZLUf19EJiIuBsAk8wiaUQn0Xy0QUBy5Qbh+5AdZlAzDSVGmX/s
 IFsA==
X-Gm-Message-State: AOAM533FJuXVJ7eTpMRF7+ConuVLWopBWHV0/exE9dK0BHurzoqcXYt8
 lfOhtv647Xqav46mGLDebDK3lYaF7Vg/vQ2R7+M=
X-Google-Smtp-Source: ABdhPJwXlj7aH9IodBxhtdT2Nu/pyRuQngj2a8RiwioXTrmjhfVJyvqibd7G+AHg8nRIeSZtNCRKzUrv9jcZxCkLM1Q=
X-Received: by 2002:a7b:c5d0:0:b0:389:fe85:3d79 with SMTP id
 n16-20020a7bc5d0000000b00389fe853d79mr2039833wmk.77.1652920270241; Wed, 18
 May 2022 17:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220518223407.26147-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20220518223407.26147-1-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 May 2022 17:31:04 -0700
Message-ID: <CAF6AEGtKwsqvpkxghV8phZqmDPEuf3VThXzCy9QMWTPWjXPZpA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: handle pm_runtime_get_sync() errors in
 bind path
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 3:34 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> If there are errors while trying to enable the pm in the
> bind path, it will lead to unclocked access of hw revision
> register thereby crashing the device.
>
> This will not address why the pm_runtime_get_sync() fails
> but at the very least we should be able to prevent the
> crash by handling the error and bailing out earlier.
>
> changes in v2:
>         - use pm_runtime_resume_and_get() instead of
>           pm_runtime_get_sync()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..bce47647d891 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1089,7 +1089,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>
>         dpu_kms_parse_data_bus_icc_path(dpu_kms);
>
> -       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +       rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
> +       if (rc < 0)
> +               goto error;
>
>         dpu_kms->core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
>
> --
> 2.35.1
>
