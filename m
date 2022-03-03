Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F413C4CC7E1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4A310EDA6;
	Thu,  3 Mar 2022 21:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25CF10EDA6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:20:59 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 j9-20020a9d7d89000000b005ad5525ba09so5725716otn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
 b=EAD636OXNSgrT0qYQwzcqOKBCCy5FKrDC+5Mqd/5OU2KBWeJSLDS8cpBaQq+Ah6bdP
 AdNMyTuBY30ce0lGFZbNQuEaQkG1qxqmLXUUsz2TWfRbuv7dFi1jsu8zhp/Kx3zAZTjZ
 xwPVNzDymKn5yvoqPzCnyC2DOIZl0LZ/wk3eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
 b=J+oGavCVptVWYD+YIUMFIcrRYzLpcFIXr03hYyjgVQs/dkes+WhpdsK16GBCxaMH3M
 RTHJbsEyz/lo3pgDWHosBju7x/N/ECqF+A3O8Hxzv7Agj7D9oNp0e4CooZnHiQ6la1nB
 Z4rgPtNQdSt/lgowgBzeQ0/Qu+wfgh/3sX4sM5FhmMXrYX2VhJhUvgU5PHgC7IAOuTlr
 6tb747mT6Tw58w8xumgY0jN0SVYxQedTA2cElDTv1Ppd5OYzdncqt1lUcdg0AZLNlIwt
 8e+yrajt9C0HXrBzRi2ogIUvWgPBYC/uzNv+wqersh0G6X5I4eNae4tYV9ZlUWEiedSm
 6BEg==
X-Gm-Message-State: AOAM533EABxxmD6MyfQ8Nm/sB8QTI3CZ0mgu27eY+uiVwqLTmq/Q5/E2
 HZH6em4dVUvIp3Rzi8M4ccsTH+wW1n7WwGRt24eWFg==
X-Google-Smtp-Source: ABdhPJw56B13uigu/hY5MG0oWkkMDqQ9qp7zzpqRCMOe29550tcjSwDProBE8u06q7bGyfbwjnolaU+cUTWXk6a4eOM=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20539994otl.77.1646342458677; Thu, 03
 Mar 2022 13:20:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:20:58 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:20:58 -0800
Message-ID: <CAE-0n53q2BKcZPUwsesPxx6KktTsakpbjnJQzUceE+fFzWfe8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dpu: allow just single IRQ callback
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 20:31:45)
> DPU interrupts code allows multiple callbacks per interrut. In reality
> none of the interrupts is shared between blocks (and will probably never
> be). Drop support for registering multiple callbacks per interrupt to
> simplify interrupt handling code.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
