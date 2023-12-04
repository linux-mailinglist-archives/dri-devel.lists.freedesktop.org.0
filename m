Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB92803E8C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABA110E01F;
	Mon,  4 Dec 2023 19:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7110E052
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 19:39:07 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dae0ab8ac3eso3239916276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701718746; x=1702323546; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
 b=x3gllkSU+cj8zFYnCab7oQzil+Y34XjZk8FvsNEYpxEqq1VtgLZ0VaHhPns9OBuNhV
 +8235lflkwDPQ+ppzBBaDkriVBjUio5kNkrp/OIY3Jx1v74zXGDii1RwZQHx7PIV9xws
 1Cm+BFwpIG8tysCir7EIIUy4zt10qxnPFqadOkSJ4CvR1Pmqx/olds0IEEBnrOsPiujh
 qecIGo1CHw2W32un56Pjo37uIaxPTOluYF2aZx3tgbSVFmGfSu+bJn6C5oZYHOsv3AWp
 hLAX8i562qnVWlf4EngW/owUkrC+k4LIx6/95aBtSkglPOHz00RRxfds2qW+iIdWmdUm
 +rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701718746; x=1702323546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
 b=tSdc9TFxt75s0nKWhtTB2yX+E/emYkzlF/dAJmVLfqdhOwsWeqAWYqojh02h17zSZv
 8f8ieI9kMaIwC1kgHX0guOYpwtnEC2TvbGJVYSO4O+Id5f2/3E7pa8URucIYEgQKbzdV
 lllG1UYb/6KgpVFhrjy6FnGtu8zGrehdFOhHBwbE2n3nM2uqABVGI7fGkDVlQNmN+KTi
 4DVCsAwL5xUF5fcXPeHIB7xd8ExzmN1BW9nguOdN3GBrvI5VG5fXvhoCysNaU1U+mveQ
 NqyJkgcEenvTkJbiY+Jnny7VsXOLzvDcWbH7+4r9e8UBrPWYvHtAG5Jo4KwkaQev7Acy
 LT7g==
X-Gm-Message-State: AOJu0Yzp/h79ugdkwiSuLsJAF6Ei42ClNpXw8oqg1vqD+MEAQigFeYe5
 qM+e8LHb0AJMSCOzkG2HWeo9aKrIlCnFyo4QvuDslQ==
X-Google-Smtp-Source: AGHT+IHnf+wIvLq0T+FY2Q4ycS6tDbC03pIpYzm4f+CmPYNLG73XmpwNsbHDjLnCXb2W1bDF/n+0HHpOQ1t0sBPlJMI=
X-Received: by 2002:a25:2cd:0:b0:db5:4e94:67cd with SMTP id
 196-20020a2502cd000000b00db54e9467cdmr3836892ybc.58.1701718746667; Mon, 04
 Dec 2023 11:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:38:55 +0200
Message-ID: <CAA8EJpqdJFxM=Ervg6Gx3umV=K7HaprAa2RrtSjxtv_qv1VO7w@mail.gmail.com>
Subject: Re: [PATCH next] drm/msm/dp: add a missing unlock in
 dp_hpd_plug_handle()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, error27@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dan.carpenter@linaro.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 19:13, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When pm_runtime_resume_and_get() fails, unlock before returning.
>
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
