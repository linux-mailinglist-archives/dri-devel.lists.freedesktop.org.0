Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FB1EEC16
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 22:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E26E5B2;
	Thu,  4 Jun 2020 20:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369C6E5B2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 20:34:20 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id m23so1703438vko.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
 b=ctMItykuizT2FjCtlj3c7yeA8hejo1Eu0YvNGbgfHWNvUAZmSu1iqvjTuxpl6Rm/XM
 /bOQT4clHDMwkaa7CQpWJ+/aULE1pYzv7SNXe1g+1d4Jvdus2Zf/u2kDn//UPtypAuEw
 ce+XSToUwc8hZkd4Z5GjQqIAIMzFGI0iD70BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
 b=UnpzGn+/kqOoz774/A7+TGEVQYueDXeuMmtpfeOkTwrDcHU2orGhs9TfHZohWoI5qo
 1qGC55VuNzMQzv1ciSSZVBTLxmNbQ/mdKQQnFLF12RbR3eJPzpdG9JF3iFUsEadR9V17
 YuTfmcPg6pr3Y5uvHxaVjg1CWSZoyH5IcYXYoN1mScPgInD1fOurOogz5pgrm1UmaGkX
 dF29uMhGPljfxEYJOr9VA5s2d+ssqB6c7W0tbchvGapTm3K+AyMJAljziYO1boUncDKq
 mlRBIqyHP0cGuxzaT8WJHnu9+LJS3OxyS0hPraN5uOow+cQgKtH1ccJhWOdDsSX2+HJn
 He5A==
X-Gm-Message-State: AOAM530/BXnM2X7QpRsvyWIdDwOKLFd2B48r2DXCYZF6o9JnxaehxorX
 g51FZiI0fsMHbWAE4XtJzcQ0n3sG4Rs=
X-Google-Smtp-Source: ABdhPJz0TbKD2kCumAjW5SqyAd8Dw64XnajFKvtw6qIrRyfK2cT8rYnd0Goc3Bhr4kLKXE+Szummgg==
X-Received: by 2002:a1f:9811:: with SMTP id a17mr4874749vke.20.1591302858817; 
 Thu, 04 Jun 2020 13:34:18 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id c68sm851683vkc.34.2020.06.04.13.34.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id a68so4328795vsd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5087675vsd.198.1591302857244; 
 Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2020 13:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dpu: ensure device suspend happens during PM
 sleep
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 4, 2020 at 6:20 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> -#ifdef CONFIG_PM
> -static int msm_runtime_suspend(struct device *dev)
> +#ifdef CONFIG_PM_SLEEP
> +static int msm_pm_suspend(struct device *dev)
>  {
> -       struct drm_device *ddev = dev_get_drvdata(dev);
> -       struct msm_drm_private *priv = ddev->dev_private;
> -       struct msm_mdss *mdss = priv->mdss;
>

nit: remove blank line at the start of this function

>  static const struct dev_pm_ops msm_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,

Presumably you will get a compile failure if someone compiles without
CONFIG_PM_SLEEP since msm_pm_prepare() and msm_pm_complete() won't be
defined but you refer to them unconditionally.  Probably the best
solution is to just add "__maybe_unused" to your prepare/complete
function and then always define them.


I can't say I've thought through every corner case but at least this
change no longer raises alarm bells in my mind when I look at it.  ;-)
 If it works for you and nobody else has objections then it seems good
enough and we can always make more improvements later.  Feel free to
add my Reviewed-by tag when my nit is fixed and you make sure it
compiles even if CONFIG_PM_SLEEP isn't defined.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
