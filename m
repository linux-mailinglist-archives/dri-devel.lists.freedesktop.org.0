Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE125B1156
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 02:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E114C10E86B;
	Thu,  8 Sep 2022 00:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689DF10E4D2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 00:33:41 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1278624b7c4so22021657fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 17:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=SFGgCNsVzP2hA8dRTmquL78fgGPuknySv3KSwNZNScI=;
 b=Q81Rgt/ogZrNSDyvddYfuQRSJ8jdaEmayIg48nQ+NGWpxOPy5bVQ9ah81XgTqkGOVt
 vvtqTSu1hPnXtNsXtdz4D9ZsmnuP7BNRLuvt4tPVIVe0t6uTOCq7mOFEC1plsBc4cXlz
 75x15C7WUmzCKp7LopN4O6EJ3tLRy6ex56pxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SFGgCNsVzP2hA8dRTmquL78fgGPuknySv3KSwNZNScI=;
 b=EePzEqRI59JavGpbXJxYP8Tcrwg3x4ZbvqAjGdURJdvnDPFLwzVaF2X/SZ8wkMjSML
 uqV5lWP3Qg0xAy6Jd4/CBC/RAy6PqvlsKLoyk4/NNwNOBaYEvs13GPX6pgc73M4CMM6y
 XEhw57qcoOxx/x6aTq5SyU+ilh+YrZGZr/UFqEV4BMgKHypDi/KQrXPMj5BfNXrRhyJK
 X8j4XKiMvlIBQI2NWfUrgm/dqZRqrzGepnVXSPjf0Xh3nKiJuLLrqLJ5/0s+Y1es8pwE
 WId9aC1uZb8dF2Qah+g+rM0G8Gi/CMLVMhwOpg6LNRVBJKi0qjh5EGDeaGpp3eKN6+zr
 CYgg==
X-Gm-Message-State: ACgBeo0lP01sAk7gOZJi8UPEG47NWgYbCffpUGa0p4jFt0CY7kiBBpdp
 KsAKgQTNdNxGpCfmzWlBPFjRmxh7GwA3B8QjqTQrvA==
X-Google-Smtp-Source: AA6agR7dUC9ALQ+u12QBqrhvXOl+Y8+jQSSUkiS/zvQgXKCMc/haJFKwxJsnCL7AvxTgEh5+PbXshQcguphmlfr92QM=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr424759oik.0.1662597220632; Wed, 07 Sep
 2022 17:33:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:33:40 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 19:33:40 -0500
Message-ID: <CAE-0n52jqAR7cQmYygx5h=bO7kNt33F3BR2nyKWO5mTBtHH=iw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/msm/dp: fold disable_irq into devm_request_irq
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-09-01 02:15:25)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aeff3f0d..3173e6962a78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1251,13 +1251,12 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>
>         rc = devm_request_irq(&dp->pdev->dev, dp->irq,
>                         dp_display_irq_handler,
> -                       IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
> +                       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, "dp_display_isr", dp);
>         if (rc < 0) {
>                 DRM_ERROR("failed to request IRQ%u: %d\n",
>                                 dp->irq, rc);
>                 return rc;
>         }
> -       disable_irq(dp->irq);

It would be better to not disable the irq at all and mask the irq in the
hardware before requesting the irq. Can you add at least add a TODO for
that?
