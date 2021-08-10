Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7193E855C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7961289C56;
	Tue, 10 Aug 2021 21:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D4489C56
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:33:47 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so86052ooi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
 b=iBzrlbp6mNut88ED6fWJqIB9hl9saDzoC0ziK0cNST5Dd4rpzrrfFer7Ih/9Wm+rQQ
 3c0d9XcwLXshbkR3X5DbIRHOytVjh2ZYKOq+DRRa1euJMdl5rNdXD2Y4zPcXTn587tsM
 yQtL1P8eTdlE5WsraMeaSEvpIQigKz8gi2cW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=K89ryxZKdGzSi1l6ZgbY5SW5/B4L1gkXo7ILZAccfU4=;
 b=OPuMVBxlYjpGJACPCiJXW2BsyHXuJedYKl+hKZmvpq0tB10F2Skb0v/oLQOOJ6NC4m
 utj+izffdLuKGvE4Mb66Ua1wI2omkuKOugQZmGZjd7EsDmftPJdbG0CQ+YjN3h+AM6+P
 fnYsCS1naRu1hjjpYkhxy/LpC/TPB4WSjCnmUqArAjAxyBYVmt2J9dd13ONyUVlIdgpI
 PBHZCAeOnfdkrPpXoDhvu+/TOe/xAZ1DqiXmvtaeOIwQKjC/nRtF25wpiSYfH73pEntM
 LOa6xoTStP71lmEMHf/1j6tGAqhNo05q1hGx7cHeEJxsvQiufWbZTBp12+D+HDdokxRA
 HV4A==
X-Gm-Message-State: AOAM531azmufyiiI5v7hnZwr7WLao3q6Sjgr1d74dzmS7GKrgBUHyNlw
 swBM1TzhD8SR+yUS4xNG0QRru4bU4YArWKMoI8vD4Q==
X-Google-Smtp-Source: ABdhPJzMSqm7mlJWw7m6cKtMxq0odiWwUHDwLozyyqB71lusEKk+/E8sZ86F1JfKGqRqGY8ymvo2r2rYgeFoZrYEHrc=
X-Received: by 2002:a4a:c60e:: with SMTP id l14mr18621189ooq.80.1628631226738; 
 Tue, 10 Aug 2021 14:33:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:33:46 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:33:46 -0700
Message-ID: <CAE-0n535+OOwQ=td-ow71MPZNq4=DFjP+hLEvrE1ZaMo+0j1rw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dp: replug event is converted into an
 unplug followed by an plug events
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2021-08-05 13:44:53)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Changes in V2:
> -- add fixes statement
>
> Changes in V3:
> -- delete EV_HPD_REPLUG_INT
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
