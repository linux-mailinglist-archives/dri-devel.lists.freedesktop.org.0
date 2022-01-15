Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67148F3FA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 02:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6506310E36E;
	Sat, 15 Jan 2022 01:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE51E10E36E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:13:33 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id e81so14636629oia.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2e5tIIWoJF2Q+eyt2ltN1h2wnkPnspxpy/ND3U7gfvw=;
 b=eXZemXw1GAkki7wQd61a0SI0b/KpRWe4zOKRpXpcxIme4L3z7B868A8iCkyhcvE4Xu
 Vg0vd+09neevGqHg1DoE7Bxc5OWyi+H6DcuRDfGYVnkEEsUTn3uakzmBTGUyraaYtDV+
 cMcNG+bARXr3QNKHR8eWtk6uJ+7B46nxeYfyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2e5tIIWoJF2Q+eyt2ltN1h2wnkPnspxpy/ND3U7gfvw=;
 b=Lb4sTCsC0Y/pawHO7BOFeI/H0PwWd4AmqIay+5E6mTJFAwlKSQ56owiF/MMtKpetVl
 yBzU+492++YX9B+CYzcGdQ/j2MfOcJSrARYwC5gUNrT5Xt4k99I7eAyg7ty1z4negoCc
 RtPd43l3wPGbc11P+9oZzii4a1Cdf2GlCXhRq4KMjSTusnDzWFaOC3UhTqId07nbPwgd
 +5bz1NMh6KvFOTGl95VH/vZYInPfnqA7WnepdxB/aO135RWthUNhd9BRKCKazhg6z71E
 RlqZBdEpoWun5EKmwQc/1fjiAq58UPstvtMEG9d7d3XexzMNTqsCLzh4JGlIe/+ySTFH
 bOow==
X-Gm-Message-State: AOAM531dAYOfQf0/vMaVWCZkayhMiC98jS/FhPFCPX4N4w+joRAZhB6r
 ih7chZzwkU/mm+jjnsywvkgkknJ9eUG7sgtawZBfAg==
X-Google-Smtp-Source: ABdhPJx/wUgNcsQ4Wj0mkNyi+IJLwQfypHQ8gPkC3Gp3HPUmDhGgT8r8xkmgy+tNXZb5f4Ip2JMwSVhN7pDOywNR7iI=
X-Received: by 2002:aca:a953:: with SMTP id s80mr15220958oie.164.1642209212880; 
 Fri, 14 Jan 2022 17:13:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 19:13:32 -0600
MIME-Version: 1.0
In-Reply-To: <1642208315-9136-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642208315-9136-1-git-send-email-quic_khsieh@quicinc.com>
 <1642208315-9136-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 19:13:32 -0600
Message-ID: <CAE-0n52KfpfnxsC5SKvR9zWWONmh2oyD3cS9L-8-J1RHHzKSdQ@mail.gmail.com>
Subject: Re: [PATCH v17 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-14 16:58:32)
> @@ -1363,14 +1368,14 @@ static int dp_pm_suspend(struct device *dev)
>                 if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>                         dp_ctrl_off_link_stream(dp->ctrl);
>
> +               dp_display_host_phy_exit(dp);
> +
> +               /* host_init will be called at pm_resume */
>                 dp_display_host_deinit(dp);
>         }

I thought we determined that core_initialized was always true here, so
the if condition is redundant. Furthermore, removing that check allows
us to entirely remove the core_initialized variable from the code.
