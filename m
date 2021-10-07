Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D162425B1C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 20:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B9A6E578;
	Thu,  7 Oct 2021 18:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9426E580
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 18:45:57 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id o83so2854157oif.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
 b=dGQk+EoGS93Xn4qHMUWC9fqgM3FVdBsK9PkC29RD2iUQAxVVP7KAoVKjv54fxqJkzN
 KJ6XZoKXFqaMjVMMXW/jvz+J9W1IqQ5VApJlrWQkwHn6KQ7MsGCQAvRSpkg4qcWbAKMa
 rUz68kF/gjv8BKru2E0qaN98F2fgjgIEGBS7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
 b=fWltn8x7YCgNJJJ+xrzio4vYCeQ5NBWZuv6u59ArZntI4CXxfto5tIfwh9W1GKhsiK
 lpp64NWj7aRl22VEnQ6eOIOt9z/m4BivjQTHu1eJzB6e1nIYzpku98/QnDW3i9R/3xYc
 pXUuXfcWF8D6ucxX3S5j3IZzRq6yjShm/tECOK6rOTwm6H1QJHqVv23Yt54WcCsxBBZJ
 kp/C4KilIA941YF3z5SZSDSdgyDR4TGn7jOtrkneL0iKouypgzOddazAh9Lfs1iRiyIv
 rwq08T4Uc8IKLxVj5MSrIml40pHWtTeERZqnxzvF0dT4STzEiWfG7B7MWwFnHRBFn70b
 dtkw==
X-Gm-Message-State: AOAM5325mZWTCbwGX6GCKpLDTrM30GeMCsN03X4L0CRxmQVFGHcLUiHg
 Vpc3zXd0QsjFqT7BEZMoXco/6WFhTWemRCVpKiCOwQ==
X-Google-Smtp-Source: ABdhPJxBJsyd0RzB+el+45iuDcFtlkQElBx3yXG2b/lZ0Xu1oExh/Yl03jChEI82FDGbQZVvKT7JtH8AKdJBrny2ByM=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr12980586oiw.164.1633632357140; 
 Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:45:56 -0400
MIME-Version: 1.0
In-Reply-To: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
References: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:45:56 -0400
Message-ID: <CAE-0n53LwqpTyxrRwwEiJQVpKgS4QVNuQFz8WD1VfR=s4eHWoA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Simplify the dp_debug debugfs show function
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-07 11:33:41)
> The "dp_debug" show function allocates a buffer and piecemeal appends
> line by line, checking for buffer overflows etc.
>
> Migrate the function to seq_file, to remove all the extra book keeping
> and simplify the function.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_debug.c | 161 +++++-------------------------
>  1 file changed, 24 insertions(+), 137 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..566037942343 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> -static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
> -               size_t count, loff_t *ppos)
> -{
> -       struct dp_debug_private *debug = file->private_data;
> -       char *buf;
> -       u32 len = 0, rc = 0;
> +       struct dp_debug_private *debug = seq->private;

const?

>         u64 lclk = 0;
