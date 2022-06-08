Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0949543E4B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589611A3FB;
	Wed,  8 Jun 2022 21:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314811A3F9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:12:42 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 ay16-20020a056820151000b0041b71517844so2246228oob.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hQ3IV3/ZgkYf70xRZku6s6da0sJmVdJtXd3Stc7Z+94=;
 b=nLwHtBbwYTTVuA6Y2XxUYiXbCQe8igJ+yjqCM/Uy9hflLIY+xeH7VlvUvCMjCG/ljw
 lhGbX/iZPFY4GvB3s85kGp14z97NYCCdJnUtbgkVYToUWmP+uLISbv/WFQH2nm+Qxu8x
 XFMjWLHfSE3xcmFGu9gm439+rIRFZc1uO4Hsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hQ3IV3/ZgkYf70xRZku6s6da0sJmVdJtXd3Stc7Z+94=;
 b=U9cUFnQE9iXdKP+uleAy+hzfd97KrpuH2l3P8rybhocz0k1/VkQnzVHfGhu5MVPkMn
 iwYewqU4xbIRRwqgisGzG7WeAWZtR0fiKX7JX2b9DR/6H9JsEBn4liFPm9TGmSPrAiut
 G+T8yNCJwaAJ3ddjA39CDkXPs5kFJhnYu7v8tFuFjjCGUpzGa4KH7omfxDwkwkZt4Oag
 MoXbJATBwhROe9lsiHPIdPuuJzugPfDRHNP9Beg3CX3HKc4OquFspBRic2oqIdRSkdC0
 IccequhkR04owNZ/BqB8+qvWTVCoiKHsZ21GPZmMid9fpc7269Fd5hacYRXp/0fAPpEn
 JRkg==
X-Gm-Message-State: AOAM5325j6gAHBfpcv541MycDjPxCIpPyR0y7nLjCW40tmipqhkeKnao
 IXSfbPkHiw142bdDZbLXV/yo4wDQgjgKBZ0IkM8+gA==
X-Google-Smtp-Source: ABdhPJwjGeXpq5/LR/zc84DPsGPwvGYWM0t2vZmF7kf3QNbvzQ/3l2tprk8LtLHXYaUVSSSwOaJJi4HX6Hr2p41sFZU=
X-Received: by 2002:a4a:d547:0:b0:41b:3ade:c99f with SMTP id
 q7-20020a4ad547000000b0041b3adec99fmr14181891oos.25.1654722761756; Wed, 08
 Jun 2022 14:12:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:12:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-8-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-8-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:12:41 -0700
Message-ID: <CAE-0n52UBMstzZLeg99TvDUhgVJ+7KLBc2bFYEA1jz4=sYDsLg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] drm/panel: elida-kd35t133: Implement
 .get_orientation callback
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-08 02:48:15)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
