Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2154CCA34
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C092910E3BF;
	Thu,  3 Mar 2022 23:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2E710E300
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 23:44:16 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c7so5222068qka.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
 b=J/hBx5WYUZmVSlCRRaLBicJAHyg8XJ5XIPfWce7YT2VyURvm1AM8cw8nrxtKvSkNpp
 prRmDYzsL6pSd11su+tw62J1FowvLNze/q/+dlFVj5CvIyu6PNf3QF9/KFfi6TAfu6b8
 +4EZuTUknOKMBqW1Qgw7hw3upBT/HnKoCv38fuIXjGGDlqHBzRTt3V/szncIuWVOTmUq
 FA4WmzlC+N9kc8P6jdlDlXSOXV7IW7gecfzNrtC4B0O9Njf/xf7gNJKYEqGnkNOP15VV
 9/pLOqDD3s7HyYyxU+udK+HiSSKbzn2gciIc+oMRSI67oyZNHsF6GPVZbEG3pki58yfB
 UpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
 b=G/60urSBNjv2311fZNRLaWMFUV94ONa6RxQbqc7s/nWapl/lUxJHDBaM0vRrbfPi0K
 +7eBa1wDtRrPN/avnMZRM/o6KRTbExxxzWHn9xZdDtJ5RZLSeuJ5o5Pl8G9OL71VVeRK
 Vn7e/O8I94a7ovjwLaHZ9P25yaN/8BWKHdow7EVOvYvjpuElbbOn8L6OIKb7SBKYmv02
 rNl0Qs4tURrw9Stb06fPLFM7rTTafVvVelG4lKs9d8JYLDIlv2vaZ6LYBuITGKMlI/cD
 6u9Pg46IFnmtId71bEdvtqkHFiQ0JegRgmIIV3sPwYQDpUKYf+9zdYATFRMloCi9kNs+
 dG1w==
X-Gm-Message-State: AOAM531F4JjEhlFt8pEQNgG4uAvrKMnr6zKCU8i/jKjeDejfPwuyK2pA
 ABTn/Ci0e4Oqf+F8vTSsynyj0RnCxbmr5uxGsWEoow==
X-Google-Smtp-Source: ABdhPJxJO+KCmM4Hjc8qhnEGGjI+t24ab51EgjVhBiPnsrIH6bD4ba37GDxRkz/qOxkjwsmpq+tsrxxV7q0PEMYatdA=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1025852qki.59.1646351055546; Thu, 03
 Mar 2022 15:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
In-Reply-To: <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 02:44:04 +0300
Message-ID: <CAA8EJpo6o8TZKqHx+eCKSWAshKV=MjYYVt2dVdCpf=w1gBOHmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: remove extra indirection for msm_mdss
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 01:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-19 14:40:03)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index be06a62d7ccb..f18dfbb614f0 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1211,19 +1212,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >
> >         switch (get_mdp_ver(pdev)) {
> >         case KMS_MDP5:
> > -               ret = msm_mdss_init(pdev, true);
> > +               mdss = msm_mdss_init(pdev, true);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
>
> Drop else
>
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
> >                 break;
> >         case KMS_DPU:
> > -               ret = msm_mdss_init(pdev, false);
> > +               mdss = msm_mdss_init(pdev, false);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
>
> This is the same so why can't it be done below in the deleted if (ret)?

I didn't like the idea of checking the if (IS_ERR(mdss)) outside of
the case blocks, but now I can move it back.

>
> >                 break;
> >         default:
> > -               ret = 0;
> >                 break;
> >         }
> > -       if (ret) {
> > -               platform_set_drvdata(pdev, NULL);
> > -               return ret;
> > -       }
> >
> >         if (get_mdp_ver(pdev)) {
> >                 ret = add_display_components(pdev, &match);
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 2459ba479caf..0c341660941a 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
> >         return num_clocks;
> >  }
> >
> > -int msm_mdss_init(struct platform_device *pdev, bool mdp5)
> > +struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
>
> Ah I see it will quickly become not static. Still should have static
> first and remove it here.



-- 
With best wishes
Dmitry
