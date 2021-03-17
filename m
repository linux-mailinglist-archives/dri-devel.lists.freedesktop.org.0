Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92933F97F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 20:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08186E842;
	Wed, 17 Mar 2021 19:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CA66E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 19:43:26 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id dc12so1082783qvb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 12:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
 b=RKgCDWdDwNcrvndpEPh2z1A5LONc8q/kcoUvZhZMJbRafeyUDCMPQ9APb5VdSlrvO0
 M/apv7bxCnuXge+S6JbVEtTH/JvPNl2yiQQep2q7mXRp8oEs7rTo4fjJbDAvv3Ior9C9
 MoY4YdsqiJ0l8rOupxYVQbv4QcMBsxNfXvG20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
 b=fDoTOAs6q0O1rz8cGN4ZX6UM3GYEJ/rJ8aJAhdpUDM4E94MHwd0B4ceykrw93ib9EJ
 DIvOV/EC1r/95E0WejsOPVYlh6QCWd7Js+l5l9o6ApJfIPOZdnSrijOY5+jDERJUgbuz
 o1ZaGZc8hsfM4FuW/fgeI2W4jW+ZqEHBYvxII+RkjorVu4bjYklsUoqrBLPkcyZ5DoJI
 iUtfgGQMqRaKrnLVDSzJIzY+QCa4vD5tBYy1Q3s5/9DnRGtAigqVCmxSu+gyaT7oQ0Fi
 qyETSgAFPxvEJmc/HQvt5mt7PQpiYsdEjsErDexWJjV+JGn/mNHxwW4073jmbeNO2Xx8
 hLaQ==
X-Gm-Message-State: AOAM532XAQLzUXVuOU3af6A9f9+e0d3WpbIR9JQ5d2SqzC5tOWd81fRS
 YGyiC8GKEzPJIrzK3pNq9Oj/F3wETqAXQQ==
X-Google-Smtp-Source: ABdhPJzkwkyN2Xjepj3BGVgxUStETNqrgWiW07VvIZMdRlByCPAg2hrgEjCYvyQkiSZ2zMpvwbKifw==
X-Received: by 2002:a05:6214:13b3:: with SMTP id
 h19mr781534qvz.31.1616010205582; 
 Wed, 17 Mar 2021 12:43:25 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id b17sm14950410qtp.73.2021.03.17.12.43.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 133so147002ybd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
X-Received: by 2002:a25:2654:: with SMTP id m81mr6485146ybm.405.1616010202994; 
 Wed, 17 Mar 2021 12:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317164239.1007776-1-robdclark@gmail.com>
In-Reply-To: <20210317164239.1007776-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Mar 2021 12:43:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Ratelimit invalid-fence message
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 17, 2021 at 9:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We have seen a couple cases where low memory situations cause something
> bad to happen, followed by a flood of these messages obscuring the root
> cause.  Lets ratelimit the dmesg spam so that next time it happens we
> don't loose the kernel traces leading up to this.

s/loose/lose


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
