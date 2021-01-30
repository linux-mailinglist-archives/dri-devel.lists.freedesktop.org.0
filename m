Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0B309BA9
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330B56E241;
	Sun, 31 Jan 2021 11:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A796E0F1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 16:16:22 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id v126so11881008qkd.11
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 08:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
 b=fmLNhBeiMEpCT64iXb708ra7uyU/Zu3j1K6JAv36RVHp01n5CleHqXKzoT74F9zaKL
 wncl6lJDD/PlSfUmmKmJdnMKUoo797O6FRVEjLRnyufjvFId6qRLeJQlRkiG6ypIC5+B
 fE5+v0pAHXXbvTEC65/I2ZAMahOFJe4XIbIutYTHZs4bANICZZw7g+HNQ5VwlgpOMUtv
 C1+rSGClaWl1qjmgmV0TJB9xn/iFlgNVbxQpxd+1m3AYeijxvhrI0sT6EDqPsgSEcUUO
 72tMlzC4kQ4hJFXavIUisZ1M3dK7Yf0icFZeWv9toAeRTyfhzKK252rM9jUJSt6+cdA7
 a77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
 b=gDDs+qTMrStvAGh1izjCEIeDw8GcFyIwxQ0pBwJZqxbc1XbH/NnXT53X2GJZObH3k1
 t2yHpefg2+XqC86GPTFIAq8+d34UIOAohlJdk2WotFBb4EAuADyJepyaIncu5zolwZ1f
 Lc3jujlM6Nj3Qe9UwuEOuik5TY0W8oDk86cHep2U66tuP2nX4/AgLC8DLFcIOwNg46NS
 Z6ZzQKK9xvYjl9YT69hBNMtJGtIhqLMBlSPHSacSGukIz3KcQLPJMW0SqRUkvYgyfHyI
 xxXMTMQrVpYwTBag0FhKFyMfhAcc0I9Biqx4GvN1+nzl39UEQVcFqzKiV1k+lybyOxBb
 roAg==
X-Gm-Message-State: AOAM533snkLBiV8VbBNTQEOdXvFbseX7Uti1J5Wey3ZhvJuhAadhsUKQ
 oRJQeAweag3VMw+ym2aPRPNPbTN3K+kQyFOy49BLOw==
X-Google-Smtp-Source: ABdhPJxjFzuwpFzrLhh+nGrXrs4raiQtDHat0NUdPD5KVJSQnlTf0MuHS/yGpjPuaALH/of+u93L6laMiPrv5cVnAro=
X-Received: by 2002:a05:620a:ec2:: with SMTP id
 x2mr8981436qkm.138.1612023381824; 
 Sat, 30 Jan 2021 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
 <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
 <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
In-Reply-To: <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Jan 2021 19:16:10 +0300
Message-ID: <CAA8EJprOYwe8pSc+QzptVjxWKiTG-jGxoUh0aa5JTGq-4nnt+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
To: Benjamin Li <benl@squareup.com>
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Anibal Limon <anibal.limon@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Jan 2021 at 05:00, Benjamin Li <benl@squareup.com> wrote:
>
>
> On 10/30/20 6:55 AM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > On 07/10/2020 03:10, benl-kernelpatches@squareup.com wrote:
> >> From: Benjamin Li <benl@squareup.com>
> >>
> >> Take advantage of previously-added support for persisting PLL
> >> registers across DSI PHY disable/enable cycles (see 328e1a6
> >> 'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
> >> support persisting across the very first DSI PHY enable at
> >> boot.
> >
> > Interesting enough, this breaks exactly on 8016. On DB410c with latest bootloader and w/o splash screen this patch causes boot freeze. Without this patch the board would successfully boot with display routed to HDMI.
>
> Hi Dimtry,
>
> Thanks for your fix for the DB410c breakage ("drm/msm/dsi: do not
> try reading 28nm vco rate if it's not enabled") that this patch
> causes.
>
> I re-tested my patch on top of qcom/linux for-next (3e6a8ce094759)
> which now has your fix, on a DB410c with HDMI display and no splash
> (which seems to be the default using the Linaro SD card image's LK),
> and indeed it is fixed.
>
> I assume you already also did the same & are okay with this going in.
> Appreciate the testing!

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested on RB5 and Dragonboard 845c (RB3).




-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
