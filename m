Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725A4579A4
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 00:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F316E409;
	Fri, 19 Nov 2021 23:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EFC6E409
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 23:38:27 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z26so14840094iod.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 15:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
 b=JoaU0znIPwQg4L/KYolJbJCVzydlY40vwNvIaoWmJqcQcJ8eG1h8jr3q4as59wc+1i
 sKIlfZ78zXnJFtr3OoqfN1viwrus/BmPq/Y6dYdUzqH6wclOo+fktpZoRnWrKKMylQ97
 8D4ReJ3enlh7d4svPfS8hp3F0IZsEnpSYjVFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
 b=0oN2XEBv1w1fXhEWoo2hP6ut8IZyYEuWJCb4Tt3VnuUtm86YH8ExMCQxNGA7cirxvw
 egwwKsy+hPObEABYvXivIEuqp3NaxA89ahARZl/vu1euadKXK2XZCfAzL+2pppaTv2Ig
 0ID+yjtYIiHectP1DEkLrjEZW5me/E3Frncrmi9fpkTn6MUnZ+tN73zCtenevyFhRRIW
 MNVx8y7vWpafpMQs1ZBNjzQd7/+JsXUfi6zjQFQr1xmJhFVEpx8CZXNADC7wyn8McWyE
 ZcDYdsSWdP0+pXOLzHjbZ4pTcsGOz/nqh28FoOS68vugxjoPJDsUedYU5FdeVecF/mEL
 voXg==
X-Gm-Message-State: AOAM532aDrZBYZ8nlcaW75za2Iv89GRZmZQAbQEEvHzIx0r1qUERfN4v
 OWcFRHTXdsJwJvVicmo2E8Ecc0Nm/D1F5w==
X-Google-Smtp-Source: ABdhPJx3YT6ogXg02k65xTPy113Q6aC8kGaVCVF8KqD6H14GgheSMiyLTKMZg9uhPOeIYIILnggfmg==
X-Received: by 2002:a05:6638:2178:: with SMTP id
 p24mr31111339jak.142.1637365106830; 
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id o14sm607225ioo.36.2021.11.19.15.38.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id 14so14798755ioe.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 15:38:26 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id
 p15mr31409196jal.82.1637365106040; 
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Nov 2021 15:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was supposed to be a relative timer, not absolute.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
