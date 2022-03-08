Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F34D228A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513CD10E59D;
	Tue,  8 Mar 2022 20:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564D110E59D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:26:29 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id ay7so477884oib.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
 b=koKeM8A9VVDPFv1jvcqwyWztjsWRaPM9RHLQWPbtyPj2BvTe7AJnmIlwxvcZ0OY/Hj
 yY7V7M4fq6YS/XvNRBGaJeKEohKUlddhSPQYaJ5+CEvtxiGZ9LNaDSO1/eApKyGMOKmk
 Xg2bU2rviiONnXHI+phTVUVWUXL7J6EZGY+WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
 b=0ja+05DMkQM1R1WFnES8h+Y2fPE5/T1VdoreVecXANYi3c9QgGVXWJwgUac6s0i8k3
 NPlnFzyxfUk3imoA2wGJL8HLhxPLl9SN0YWLc5sw0Sl4fW6govzXNt2iRMp0iD+9rivd
 CIOag5aiowWatWhMxUALSZjSb8iGGR3CgucjqfirwxwMZ3Ht+MUDRXTY523FmjjgAYQU
 WioS6BmKxYn+M6DO2Wm/6htl0Y+WpaKqtFKjwYC+0xhy/8JlBDAUd5Ki1yIDz1QqTgDg
 Y5Ut4vrhKJxnJZOqS9wGn/stiAr6nJAmTL6tS3EgjrNyXjHP31JVgu0rtlAvh/KJq/jZ
 Ahhw==
X-Gm-Message-State: AOAM533sj6zrylknmsSZwlgLOXmr3Bew7AvPlmigiHSeNhOuBd3Y1+Uy
 rNBwHfQ0AFRSFndngBNj4eoH7LbtBHAdXriM1tk/BQ==
X-Google-Smtp-Source: ABdhPJxLhnbKfyfH6BsLllQaul5SJ9MYV0lbMZKb+ak0yvA5zeaYuVULnVx7opW3jo+sQRk8z4+n9XteWweQvTP69oo=
X-Received: by 2002:a05:6808:1391:b0:2d9:a01a:4b9a with SMTP id
 c17-20020a056808139100b002d9a01a4b9amr3785266oiw.193.1646771188650; Tue, 08
 Mar 2022 12:26:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:26:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:26:28 -0800
Message-ID: <CAE-0n53X2QzWw5mDqsw-Z79WuK75874B9pZtw2vQoC5hJMXj_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/msm: remove extra indirection for msm_mdss
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

Quoting Dmitry Baryshkov (2022-03-03 19:21:03)
> Since now there is just one mdss subdriver, drop all the indirection,
> make msm_mdss struct completely opaque (and defined inside msm_mdss.c)
> and call mdss functions directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
