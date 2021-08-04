Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A43E05DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 18:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D256EAD7;
	Wed,  4 Aug 2021 16:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084516EAD7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 16:24:56 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n16so3506345oij.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
 b=anVyLESysacJzwQ9+bl8peh0mfxOGxp8tzDGJwCIQfTVHYAWhZdOshbtCAe0T7L8cj
 +oZAG/8jqr97zNrCaKibn6s6BLuZxkc8vrDXOqiGfdMTXV/xIgWGMQOtmx/HSnrUNbPp
 iC17s7ipmRXIEigvVtb0StgZ3jwxYNUY6V80M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
 b=azkrw5Xv1/CQPMc4dDrs75ZnICogpsJA2YebBaXutHjnh233LECBeX7cxX4cIc4oHv
 Nk80r3s2BHwzihtrEEI3rQR7ff8baxPO9Q8B9w50RxjAHNSodxGEneQd0knDSPCT0fZa
 0R9K1a8/6LkdQ2gP8a75M5zvjYs7vD/HtC1Us6dLG0Dz6ad4WxRSYPqdqw8/5pW1G2zF
 CtP9JTXKAOq/M72mkAV2Rl6trn2TQLinnWQqQdr/2dYrHwCoJtVR9d+fc/t0QXB5IPjD
 isEwaRQglGu4tMMx/S1aBxBNePmVpeUKSCerRIm9pm7hy52tDJlxmeZcHdK4+nVCyZJY
 yL9w==
X-Gm-Message-State: AOAM532silSHdcooWtqG3X8+ijWIFnqNSLvzYbLTOlOW1vI25RTJgk9G
 H1+EnpqR8AaPK136lw8ef7kz/CtNUKj61U7o6dH/kQ==
X-Google-Smtp-Source: ABdhPJxlsg2rjRmyZhJBp9eeXaZq9jGdzuh3fTxcauW/EXtGxVWy7yicyaA3pE5e2q1lh0t+yzqD8/qJzhMNPveVnf8=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr3529630oih.166.1628094295336; 
 Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:24:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
References: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 4 Aug 2021 09:24:54 -0700
Message-ID: <CAE-0n52e3FuhhiNqRTbDmaTM5TuLTgOsSYJab7uA1=N00uf16w@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-08-04 08:51:01)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Changes in v3:
> -- delete status local variable from dp_pm_resume()
>
> Changes in v4:
> -- delete un necessary comment at dp_pm_resume()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
