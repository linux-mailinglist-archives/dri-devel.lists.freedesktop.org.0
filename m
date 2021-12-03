Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E348746701E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 03:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F1E6E0EE;
	Fri,  3 Dec 2021 02:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BD36E0C4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 02:41:09 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso2310223otj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 18:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dixTX2RrlnwesW8iIjzk4nhy820PBObo86K/cFmNqMQ=;
 b=iM/D/ZJUqYaSokRA0yjzflf+/4LODWsu5gwGloRuNyTjAQEtTgoPcoOdA2I6kQ5lN2
 K5Ns7XaunKfXiHrNPHm+Dou+ZnKfnG3rzDHEE3TmxPiPcUrYMxYuh5Ad2c2DC4F+yclD
 hMNsUsZDl4ZPf68T1jHhUt9r91mbOjoLEGcTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dixTX2RrlnwesW8iIjzk4nhy820PBObo86K/cFmNqMQ=;
 b=LF/FpEFWUskwc2v9J14MFwoV1V+02kWJRB8nqY6Q/K9p4czgyoVdvV9TBjfSn+zmiX
 V1nQiHlrRCSoog1RgwY3JRGJFnE6DrFYbdWi2J/OJ6o2p7pp9dx5bCp3qXb845qL3JyR
 Scm6knji6RkBsQ4/7Q+m3+WxZyibg1CxlwTMXOd1M1vuOuQmpSj7H3nBg+mK7LM12JgP
 PIXJgtsbOlSai8ZfbN8uE6VnanU0pqAX29jvbccjtF256cEaVbDa/4VvgyuLAY4dgHor
 90ThIBYLQ64/ynB0MA7Pt2ju8i70Ki0iaU+biVRjBoAN2P7XHtK4rccNItPeKkuOJHEo
 Ylog==
X-Gm-Message-State: AOAM5332J5NhQoFjf1dKuk3A9ax1hW/0IY+LsFgiMb8UnzKAo2ToEqXU
 8gBVvmrUT9z/yvWSYnVV61E+tTbKEuDOO2fOMfBDiQ==
X-Google-Smtp-Source: ABdhPJyK/ETlxs8XkQxa+hn+epgPr+mfELlA+cPMYqrCB6QQHK9j+S0/zfXRebJ/od3mAwIQuxUU5KO7z684Wem2OaU=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr14174984ota.126.1638499268424; 
 Thu, 02 Dec 2021 18:41:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 18:41:08 -0800
MIME-Version: 1.0
In-Reply-To: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
References: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 2 Dec 2021 18:41:07 -0800
Message-ID: <CAE-0n51-=qTWfBVPFEmpEb7md6cg5O__bhydXTUb+=8dRqCuqg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-11-09 13:38:13)
> From: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divided the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and suspend.
> Regulators, core clocks and irq are grouped together and enabled at resume
> (or booting up) so that the DP controller is armed and ready to receive HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, code
> clocks and irq are disabled at corresponding suspension.
>
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
>
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>         dp_display_host_init() for eDP
>
> Changes in V4:
> -- rewording commit text to match this commit changes
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Can you please resend this based on the msm-next branch[1]? It doesn't
apply now that other patches have been applied.

[1] https://gitlab.freedesktop.org/drm/msm.git msm-next

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 ++++++++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 83 ++++++++++++++++++++++++++---------
>  3 files changed, 105 insertions(+), 74 deletions(-)
>
