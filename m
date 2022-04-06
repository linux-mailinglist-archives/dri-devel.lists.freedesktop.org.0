Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2DC4F62AD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECDC10E338;
	Wed,  6 Apr 2022 15:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89310E339
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:10:36 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so1887898otq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
 b=OuP7pmKSNZDGrcIzCwJpg2/t9nw1/WFVenZlPZZPYYqR3ddx27AM1BdClVJBzRLnM/
 XzyRxX5oW18V+chqRFu7GaSf6OPLzLbij/YLJdjj44ZV17xQdIINEj7ednClXRZGPfWk
 yoK5NuZk4gawap5VuGW2wqbV+SL+0xGTL7UXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
 b=Kvtbn581c55ieBNwV+a5GsATaJCyewcD/nHQKbs1wBGF7N21J54ERxYTmi0hX4pQZG
 dwyaQ5SALDeXQh4Ab/f3/wlJn72/vqQ4VLn/Qhq9q+oL+JVZpTdGVWScL+upgXbv+UFq
 Lol1c8Od9uF4COAyPBxeNXsV++KBDl80hfD/z1fU57a1VZgeOmfrRfRvrscdcRQvFSez
 ehboUjZ6IFpxqPyLyk4dqV9VfIy3OBV1goJo+iJ3o07TkslIsyVA+WX8MfXaYitAJuPq
 7V9bvL78lRU24l8NLajTGv2FoN5ygg91QkjMHC2lOtai+aJvwaf+zwX5njzrnQkte417
 qx7w==
X-Gm-Message-State: AOAM532IU2pFqriHxeO6mH5fr50kO9GcissarckRkxrbJJsSqrQ6VFMM
 0MJaTjrIyJQgE5PzKypZVn3QGHSxNSci8d2PiqsF5Q==
X-Google-Smtp-Source: ABdhPJw6NpBjiEJqSqfKLXHGIB0nJEtoJYa4P3HUoNxUv5I2kNi8OGPCno72muKbEi3n2T76pqYyndvLaE5nenHEEhY=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3145467oth.77.1649257835830; Wed, 06 Apr
 2022 08:10:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:10:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
 <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:10:35 -0700
Message-ID: <CAE-0n50FBpNy=Hmfz8+MKziPY=Z9079jFm-ZHrBD-hd_TMv37w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: don't store created planes, connectors
 and encoders
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-06 03:12:47)
> There is no point now in storing arrays of creates planes, connectors
> and encoders. Remove them from struct msm_drm_private.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
