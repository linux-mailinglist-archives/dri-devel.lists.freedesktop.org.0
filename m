Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A090C3503E5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 17:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EB96E194;
	Wed, 31 Mar 2021 15:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0806E194
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 15:55:59 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id y12so7662008qtx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
 b=NQWUaXXWMySIF2EP+8LpYt2VqT0hEYBBQPiLFjsHR6kSUpulZam5AaYGVvXpIOfMLf
 OsgyFb42lxRPZDjBSuOxeV2GqM+6W2QryNNKQ8ks3PqlyEZcN5M27OVl8w3pIYj2aS/k
 J1RzZvE1dtaWstaKZ7sZiDlHlAOiriZmnGnng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
 b=Uc2eTzFRYmW75SAYmZqEfaDhSgZk5vJwhgebhOyF+YuYVDv/Yhy9qDr3cRanM+X53c
 EJiZeeSGfodn9lSeCO3nGjzef3Bud9eOYWCF4C0oLF+6VVxqqFpfUJ0CcYUspTxEbHZo
 QAp5QYlKg2TCkZ9ac0F6Ps+NHrKu1xWPQHFFaL0zAS1/mDdL+kB/Je553bbEDLxZzRjT
 x5APelHNT5Dg/ToyQqYk1gb4WB2bUdI5ELup8hvD/OaU78hpVZODShZc7nby+D3cEgPV
 WmAH0SBu8y3mN+61NFp0+ifvsWYmYeouquEL+WmU1PvcqD2kMvN8edeyh8VCQYhpIvpO
 UgkQ==
X-Gm-Message-State: AOAM531BcNao0h+v5HX9Wv5sXznGsFVqkvJMWm0A4jxRZGu4VZwsD0mK
 l9G2E+4axPkJmuY1c/mJa4SfwGI9n/UFOg==
X-Google-Smtp-Source: ABdhPJy9X/h1IgCBzzCJf5GdTM3f7xJfIPCLjrJ4Y0EHQwp4vvZ9GMBxRZ5yR6dMGOl/IaS46Gk1rQ==
X-Received: by 2002:ac8:4752:: with SMTP id k18mr3085211qtp.158.1617206158480; 
 Wed, 31 Mar 2021 08:55:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id u12sm1667076qkk.129.2021.03.31.08.55.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id m132so21693104ybf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr5658516ybp.476.1617206157416; 
 Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 08:55:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Hung-yu Wu <hywu@google.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@google.com>, Michelle Dean <midean@google.com>,
 Steev Klimaszewski <steev@kali.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 4:27 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>         struct icc_path *path1;
>         struct drm_device *dev = dpu_kms->dev;
>
> +       if (!dpu_supports_bw_scaling(dev))
> +               return 0;
> +
>         path0 = of_icc_get(dev->dev, "mdp0-mem");
>         path1 = of_icc_get(dev->dev, "mdp1-mem");
>

Instead of hard coding a check for specific SoC compatible strings,
why not just check to see if path0 and/or path1 are ERR_PTR(-ENODEV)?
Then change dpu_supports_bw_scaling() to just return:

!IS_ERR(dpu_kms->path[0])

It also seems like it would be nice if you did something if you got an
error other than -ENODEV. Right now this function returns it but the
caller ignores it? At least spit an error message out?


> @@ -154,6 +154,15 @@ struct vsync_info {
>
>  #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>
> +/**
> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> + * @dev: Pointer to drm_device structure
> + */
> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> +{
> +       return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");

See above, but I think this would be better as:

  return !IS_ERR(dpu_kms->path[0]);

Specifically, I don't think of_device_is_compatible() is really
designed as something to call a lot. It's doing a whole bunch of data
structure parsing / string comparisons. It's OK-ish during probe
(though better to use the of_match_table), but you don't want to call
it on every runtime suspend / runtime resume.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
