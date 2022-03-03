Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524364CC910
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E5810E386;
	Thu,  3 Mar 2022 22:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DEE10E386
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:33:57 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id k2so6190179oia.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
 b=hP54rWK9695Xv6Ax4gxz/Z0LyxkVeLS1cVuj+Db7e++0rVJLFrPRykRPG8sBya9xWB
 QVDQc9kZGQ/hBdMAZZcyqteJ2EWRSG2oiUOkVL0f38FyPYqTqDFbIIgwvcY6TjCpfmyT
 2Y3vLXbzh8+57i5lLQyGXbNpXCHzl1FVrx9oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
 b=yxna8wVvCHRoLla9Gsd8CUSRzddAniEWUDSOW3ZwYR/HVRPJbmzhWYqVPWaWY67gb7
 hjzuroTOAmFEJfaRKN2leXhiJzpq3HBLw6Ulo/nJZigLOd/RxtZHdbkU0GJ/giNmieCh
 27Ev4EhZZqwkHG071fNAkYl2k45x+Oku7Xu69bhMD3Qe11iGzzqsq8eiV6vY7avYhiax
 rwHUTi5zPuzBLWkVPBmTP3eGtGvP8jt5A8knuHk9WahSLOHNgouaXZhjLGkG8ePvmiLb
 vqgB8EErXa82XGIWuzuMXts4yLm1Du0Xnf+4K+1kBHPC+pvGyLB7pWlVOzWPDnea+OD2
 O2og==
X-Gm-Message-State: AOAM533LTsU0tW+lhmaRn/csXz82D+kzBKTD7cY4ynLSjL1pQCKlKvXu
 STfy28+TC+ZSo3T6y7O87yqSh7s75jhTxBlZ5KQEsA==
X-Google-Smtp-Source: ABdhPJzgOEQ4DnlS7qHir2txR1YyHGHvpGpOujLYaX4vwlMWe2204uMruSrw8Lxh9lr5F/i7YbKW6Tr1Gwe+2d24nNM=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6674548oiw.64.1646346836818; Thu, 03
 Mar 2022 14:33:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:33:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:33:56 -0800
Message-ID: <CAE-0n53fxr=-jT2LvbNsyTMqT4B9t9q=OzzmdMSdf7U0QJLNuw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:29)
> In order to simplify DP code, drop hand-coded loops over clock arrays,
> replacing them with clk_bulk_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
