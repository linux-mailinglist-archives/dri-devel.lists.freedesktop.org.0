Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE22FBE6E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 19:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF749899F0;
	Tue, 19 Jan 2021 18:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3B6899F0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 18:01:13 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id j8so5144131oon.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PnoLUYUr452SA00XwegpMttTU6JAnqwLEkpQzY+iQ4M=;
 b=EH6+xQCMT/keuuoCaUxTOVvaF2GlE+iKrQRwVW9Wa4ZMD7+lnMa6TRBnyLo3XP2a9S
 nya3saf+LtmbttEORKWhEUo2cAI6/fnVK91wGRPwMCU7YRlooPSFcGzSeaal0jn4XUFb
 cCxIVT/ICzrHK/GZMj0edDpbi4eZdXl6zGvgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PnoLUYUr452SA00XwegpMttTU6JAnqwLEkpQzY+iQ4M=;
 b=gpUmjH79K7oHhLRfj6+Xnq5v9izCHHkS1husbMzSJwBXoulvSiwhEbhAzEcgBsImXW
 7hShL09fvHzfstHosJVSa4u6LMq7ndYitiTu8lukJF0YywwgRJQqucLvxi37UtLqdY/h
 fgKgGtz5Vt5FNwJQKDFNI8X5m80Z8+/dHcPH+PA+PONsElK5Zi8WMA7HK/M9qL5KLjJ2
 PIaJ1q5n3TtdLT13KRlzUPXqzL4Q1F34J/bQpeKhZ4gRoiOac4opjldfF27FgtWDLBBO
 /tJfe35PP2oEP0+yuO7f/MQ9blNydH3dRVYOSt9mfFw4Wv2rTgfpkgt+BuMQzGoxvop4
 6zLA==
X-Gm-Message-State: AOAM530Yaw0gEjCwDSVvzfG3HqvhfapunXNeydAJzyzYyt382YLf8/wa
 tZKy6YCAoE/5+9LZkXz8iq3wcedaldsYh19OYpMrqA==
X-Google-Smtp-Source: ABdhPJxPGwDWUaSok8hVtjiKBYa1X4wZDXYG8xZQDhASNu44d5/e3Z3YyqtQ3056r6Oa0bEJT2uCK3l/Qhjoqg73GJ8=
X-Received: by 2002:a4a:11c2:: with SMTP id 185mr3699747ooc.85.1611079272605; 
 Tue, 19 Jan 2021 10:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20210119174455.2423205-1-festevam@gmail.com>
In-Reply-To: <20210119174455.2423205-1-festevam@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 19:01:01 +0100
Message-ID: <CAKMK7uE5vo8G8AYTUAndy7Jj2wqmQGR1kcjjRn-ymGsxw-EvQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Call shutdown conditionally
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, stable <stable@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 6:47 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Calling the drm_atomic_helper_shutdown() on i.MX5 leads to
> the following flow:
>
> [   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
> (commit_tail+0xa4/0x1b0)
> [   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
> (drm_atomic_helper_commit+0x154/0x188)
> [   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
> [<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
> [   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
> [<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
> [   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from
>
> In the i.MX5 case, priv->kms is not populated (as i.MX5 does not use any
> of the Qualcomm display controllers), causing a NULL pointer
> dereference in msm_atomic_commit_tail():
>
> [   24.268964] 8<--- cut here ---
> [   24.274602] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000
> [   24.283434] pgd = (ptrval)
> [   24.286387] [00000000] *pgd=ca212831
> [   24.290788] Internal error: Oops: 17 [#1] SMP ARM
> [   24.295609] Modules linked in:
> [   24.298777] CPU: 0 PID: 197 Comm: init Not tainted 5.11.0-rc2-next-20210111 #333
> [   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
> [   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
> [   24.317743] LR is at commit_tail+0xa4/0x1b0
>
> Fix the problem by calling drm_atomic_helper_shutdown() conditionally.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 108c405e03dd..c082b72b9e3b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1311,7 +1311,8 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>  {
>         struct drm_device *drm = platform_get_drvdata(pdev);
>
> -       drm_atomic_helper_shutdown(drm);
> +       if (get_mdp_ver(pdev))
> +               drm_atomic_helper_shutdown(drm);

Don't we need the same treatment for suspend/resume too? Also if you
feel like follow up patch to push this into the helpers with a
DRIVER_MODESET check like I described would be kinda neat.
-Daniel


>  }
>
>  static const struct of_device_id dt_match[] = {
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
