Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AC5B290E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 00:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F69F10E568;
	Thu,  8 Sep 2022 22:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21A910E568
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 22:10:26 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3450a7358baso153728557b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/WcHqdHM8dnvu0KhL8XnDPtvYcltW68n+l5+9CRl2js=;
 b=SkIfqdYOLK8R9nL8tGEdusHKauZ2yGxXEslcHgQHtVciNUS/jVWDcjmB3+hBBisgPv
 4jvuzOhivKBk3kAn0wjyfdxZSzCHSZeRzRhXhofW31wAiQSccBgCDeVSqueT1dPMcvLm
 /lcAaPhRKLufjVrLKefaGBQgHfVB5wVT4O1F6jDr2iQGdsC/or9SuLb9CRCPEaM0mIc4
 rQTYfUi+Rg84zYOLbnUVLBzrUH9JhzhVCnVbwJVv05IhTOYk3i5o7aEc0HhyIYLQXcMZ
 /RVQzgqwRNHvX13ec/twUcuqr5rlf6g0JwndelKboKm7502axGrsALyVS/71C1ZObF9a
 uBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/WcHqdHM8dnvu0KhL8XnDPtvYcltW68n+l5+9CRl2js=;
 b=QpPd/BbF5SRk365y3v7dLq2ABmTScoO+NGhl8Rz/VmbQUe7A+sjXDUNx9sBCxtrO9R
 AI5lgWAlWsVCiiCxt3vhoVjf+7WhjtlumG58zcNmSa9YZC1YYYFAxnPNTuiol2pyNoeg
 RVwNQDc0rph/b4G44ASP26MlSrNf1jEyQymLMKheN39Zu8UuP7dCr1esh5ZZYNu0eh5N
 fpIiuUzDcW7gYjeY1/v3UpBbNOo7x2pVJChoGfLwZb8hEVvD2KCEnjHm1W+y8yeRoUff
 syTmY6usLm7t2RKb/a7qahGtj81C3isQ80sBHsbB7fTcu6DdS7j68nAPgN0uzcXmSY9p
 E9IQ==
X-Gm-Message-State: ACgBeo2phgWQnGGEsvnBAEskG/dY9NcC/0xSLVMC9qESLPubM0hf7tzh
 wIaXwnn7dYoTIWVWapVrWWiQZaqia281nZnkppS4Wg==
X-Google-Smtp-Source: AA6agR5+rTf9bfwfCt1fLupQFbPAbT6x+K2axID1pNI1aeS85ZPgfrTrkdqMwZuK2rOYbirjnMN4yqPTxMJw3wGhabM=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr9842018ywf.418.1662675025716; Thu, 08
 Sep 2022 15:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <1662671917-17194-1-git-send-email-quic_khsieh@quicinc.com>
 <1662671917-17194-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1662671917-17194-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Sep 2022 01:10:14 +0300
Message-ID: <CAA8EJpoEPD7pvLcCOnH-r-J=zVxm5C=ZOvMYLBqfwv4ufSWmDA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm/dp: retry 3 times if set sink to D0 poweer
 state failed
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Sept 2022 at 00:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
> patch will retry 3 times if written to DP_SET_POWER register failed.
>
> Changes in v4:
> -- split into two patches
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af0..7b5ecf5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -49,23 +49,26 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>                                         struct dp_link_info *link)
>  {
>         u8 value;
> -       int err;
> +       ssize_t len;
> +       int i;
>
>         if (link->revision < 0x11)
>                 return 0;
>
> -       err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> -       if (err < 0)
> -               return err;
> +       len = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> +       if (len < 0)
> +               return len;

This is a separate patch.

>
>         value &= ~DP_SET_POWER_MASK;
>         value |= DP_SET_POWER_D0;
>
> -       err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -       if (err < 0)
> -               return err;
> -
> -       usleep_range(1000, 2000);
> +       /* retry for 1ms to give the sink time to wake up */
> +       for (i = 0; i < 3; i++) {
> +               len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +               usleep_range(1000, 2000);
> +               if (len == 1)
> +                       break;
> +       }
>
>         return 0;
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
