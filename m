Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A674CC90A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7357B10E362;
	Thu,  3 Mar 2022 22:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD67810E367
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:32:44 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 k22-20020a9d4b96000000b005ad5211bd5aso5878037otf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
 b=GbaSq7Sco4VRA/oh0xEl8QWO6Ytp28GTZ8m3hxiEvIN/2JlsRqI6+keQBbF8189DgD
 xGy+QATLDYi4YFxo42Kpb4SUZ3GN0gX3bVhC1qbvLNF+RBC26Y/Ffs6iDBAOc3Qg8D8i
 wWz2xqZCr+o2pu0pAOA8yepl8YzncN0/PrADs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
 b=4Q7yqf90TGEk94fWeFC1EzyGFh0dT8k5RVCay5a9s7FbC76yTRpfrlXk2iVya/iQ3l
 cUYxWGL7otGfKJZescpabU10QpbH7uxylxmpYSheYPfjpKrSmX64wrm2MpLw/Lrtjstk
 Wg0YBvhXqssGLjYpAi7regjnTpTL8JZDZfSu0/PtkmQDPANVsTnwK2adEzc973afFIMI
 D5EVfu4YOVAj8NIwGHyC5EopODYysqepMg9XjOS5ta5CqDPz0+anr9CU+lE6pjqawQCv
 9BzLGKk5S0lJ33vEoYMESFEia41cZ9dJoZRCKxluCH5HLpteMEdSEBjS8ojFJcIpQ26V
 7j5Q==
X-Gm-Message-State: AOAM530NzHaRwUZqAo1VQ5vLSbOQwmJzlE3BWks+7g6a0z0MjV7yCJMW
 oviB+/uP7g+zWUI2+HSZrVENzu/twdqkEtZj+TjNFg==
X-Google-Smtp-Source: ABdhPJzCsxybXW8deEcr9YdSM+FzB0T9BmHhm0B2lqcjqF/EbQQDy/dHZ8QPTz2FpMjry8F/Y2/GdGbvlKYpn+FbRik=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20728475otl.77.1646346764025; Thu, 03
 Mar 2022 14:32:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:32:43 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:32:43 -0800
Message-ID: <CAE-0n50bntVXJ_Z7hNbuCUchP68eLa1X0tMxkVtwpKVsTnQyvw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drm/msm/dp: inline dp_power_clk_set_rate()
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:28)
> Inline the dp_power_clk_set_rate() function, replacing it with the call
> to msm_dss_enable_clk().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
