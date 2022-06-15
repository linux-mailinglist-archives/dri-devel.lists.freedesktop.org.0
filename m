Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE6954C730
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 13:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B94E112315;
	Wed, 15 Jun 2022 11:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584CD112315
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:10:35 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id c83so8437608qke.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9ehyMccErLvnswsUCaTIrl34oqySPKiX0jSZU6Bb2M=;
 b=XhFBEfnUAAAiNoeaPp8jwbXdQl0UO7gQ42vHajwiCKngRuo0+EtuAWphzpblMChMsD
 RkVTK5S2gXSlD7AUPLShgjdcsQpzhv4aGO6gh1nd+2JkywFSNLBEPv16HhRjL8H3Ncxm
 hLIbTd1JEz1g7iebq0wd6y8bcz6Wfj7MI32+7T1UB6Li37w9mX0LC6KfSb3/nsCq/Vv8
 dVTiD15brD1+tiKNQl4ioh/q2esWTbJKztXqhYfD1EIokoBM6/kRzycSaWQeCyCFFT37
 AyjRcvyQYCsh8qWMkluLCajMWb4IyOR/Us9TFaGLP02GGWmj8HYcpqudasPGy/jF88OS
 cKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9ehyMccErLvnswsUCaTIrl34oqySPKiX0jSZU6Bb2M=;
 b=PM2QvM/rQ1nN2l3HdcwxrPFqFA4dwgc67B1zL1p2UiuGmg1hhpQjsHwRSjQWJlin1U
 VZYgBGtCHjx+rBa04xBG01dCU3ScG6nno6BLASkV77T9FY49MIrq+wZfPf2LNwYC6O+r
 xP/r0eQaZFnDtpci2aAKoNR4AyCjLu4RiS56MFg3CI3f2wdGjxOZHoJNy3pUjdPxAgOj
 zcSp2vdCkXgIucNsTjAjnUuZA5w8w2bwu+i4i7/CrTsXOkmCgKED9MBxiFyKSShBMGBq
 von7qHx93S47CsawflWFu7VHmKPdsoljLOSpW6+FhhpyTfY743q4P1GxD8FJUgG91lNv
 QnQA==
X-Gm-Message-State: AOAM5307eBD0eh6eQAv+lo8iQefl6ZNrM/d7I3GPc43YHoilM/620qmq
 wK986atU+o25sFhSgBdbAO3v1Mj0ReGucCsIns8YHw==
X-Google-Smtp-Source: ABdhPJwAFCuKWsMd/fvYsI+fi7dfEHmvREDN3bjZ7ZeI6PNzbJOFtpJB3OdCaG6L5u7bW4MhfRba3zINUWabfKcuTsQ=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr7451127qkp.593.1655291434425; Wed, 15
 Jun 2022 04:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220614215418.910948-1-dianders@chromium.org>
 <20220614145327.v4.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
In-Reply-To: <20220614145327.v4.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jun 2022 14:10:22 +0300
Message-ID: <CAA8EJpqrEb-48ma61D5enaTR5V27q3Uyts4keAnMgCdvAjc7vQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 00:54, Douglas Anderson <dianders@chromium.org> wrote:
>
> Let's add support for being able to read the HPD pin even if it's
> hooked directly to the controller. This will let us take away the
> waiting in the AUX transfer functions of the eDP controller drivers.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> Changes in v4:
> - Reorganized logic as per Dmitry's suggestion.
>
> Changes in v3:
> - Don't check "hpd_asserted" boolean when unset.
> - Handle errors from gpiod_get_value_cansleep() properly.
>
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
>
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 51 ++++++++++++++-----
>  1 file changed, 38 insertions(+), 13 deletions(-)
>

-- 
With best wishes
Dmitry
