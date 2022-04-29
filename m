Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5151402F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 03:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FCC10EC44;
	Fri, 29 Apr 2022 01:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F34D10F609
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:20:11 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e9027efe6aso6830814fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R5FcMtHB95cGY7bqn/aaSoN9px3b2CiohH6o45BGCPc=;
 b=lZBTXOPrH/HQgFZDRSQ+AY62amn6CUuRdEyr0/a9qQawZ8dn6Y8nRvZzaR1iK2ozO7
 6mw9RcrYRHZ9w2BVpwK9G+Sj5UUYxHSHVOXXHhOKX8o+doQRJh5wqTflrmbRz4qbM6hE
 38duCGZLzGB7Qd7BtMXXTK5L2cdjP9J3cD6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R5FcMtHB95cGY7bqn/aaSoN9px3b2CiohH6o45BGCPc=;
 b=o6KEhZ76QsUn3dwMzhO23eWy73JAE1GUW0aYotHd7idblfkHPVlelaw0jb/j1gISZC
 JgFM8db8ZuBIdg9zdxBXeSgP0T4u9JVb50PPPnCKs8JZ6LfHrqOingGxaz+fxeASihv9
 S5ZKMaxfxeTl3kFVes6F30mvgT3acabem0VXK6eFsEvXgCfCF66SLvAxJrtCRCvaCBJN
 Xs84NCzMaTicwq0mZXNDRyNEluXorh67Bo5erKmf9k34e6ZRPVYyrJZSWIOQk38wZOF3
 ylzpLV9J1mZ/e5MrYvXuqQefr/gDpx20q5UU4WTKJEdvQs9wvCBkQF4aCtUx98UtfAmn
 O5fg==
X-Gm-Message-State: AOAM532TJL2zCDXChh8ifCvBP00GTbLxBvmYXQAqhXvgX5xkdc6Gj/Qb
 E5HPUWlIC9DcEJtdx6KWLKzeUvG/JtZhSMf7y9pu0w==
X-Google-Smtp-Source: ABdhPJyct3+Dz7vTxA3RPk3QX+auuKudDLIw7X3JH0Xeh4QWS37W/QrLu0SWV9IQXMUw1wOemKuBCG9GS9ciqmqkCmc=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr371956oad.193.1651195210193; Thu, 28
 Apr 2022 18:20:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Apr 2022 18:20:09 -0700
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Apr 2022 18:20:09 -0700
Message-ID: <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> The only clock for which we set the rate is the "stream_pixel". Rather
> than storing the rate and then setting it by looping over all the
> clocks, set the clock rate directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
