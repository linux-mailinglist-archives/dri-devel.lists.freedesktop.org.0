Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314D46613D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 11:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53276EDC0;
	Thu,  2 Dec 2021 10:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB846EDC0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 10:11:14 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id m24so19872494pls.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 02:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0DvcWJ6BwS4XZAHB+T7IVAgQuaYuZYZpCtQocd1jt8=;
 b=OUNYwyFYjPAZMeMoxdblOxV2NxXq1sfGa2cNnE+bikkMPwgQ0QwelII6Iq9iMeSMZn
 4FxAEAYzK379X96A17FBZXHASpSTr2xSRHwz4fcwhQxi18yx6wGl+PVJGsUSD24ODWc+
 zzGw2AGpJLTiBtltNY0CQy1rBdrgeKG0nw9UAcjiKcQmMkqU6onpvclXWYgbpdpvmQUi
 m23pCEDaxNC+0v1yUyinztlHVgTDABAvKYU8ymg23R0srhSQDeB2YUMIh8ZWEWRo2Eex
 VsOjHIMoOAuGD7CZAARYo/F2zrxJb7FdCFdqoNz7XZRrpBnuAwW3MB8MTbLqSZBOmOQC
 ZAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0DvcWJ6BwS4XZAHB+T7IVAgQuaYuZYZpCtQocd1jt8=;
 b=deZE0UMDr5mbpSIPMCuwGZCpGo4I7LLrz50OvJLuCuXE7cGtUFq+iuT1DaS+dFaNaz
 vZ0H+k7FU3X17LmBQnYftUJD6wO2KBZsZyOVFwQyM/ZtwIyTrl4DCvWo5cidO12cX9I2
 O3N8LCw64C5SRNKKrn1nIvd8c9O9/aA+ICBWYREBVMzGT7X9jGvTmuye/f/nMzUGE8Qz
 jukWKiC3sXDq/E4B0YO0gZKo+FecAWBmSJoKuGU1yz4JZ2/wlvAQBK6IdN4TK7NLKd5p
 cXtcXGPMFFYlXu4XscEngxFf63GzT9XtbzhicWdH8GD3QOqprdppgPxhfMahRMsGlEqK
 fqPQ==
X-Gm-Message-State: AOAM5309lXRJtWs28Ddh5FfH3KMOB2yNuGPqdHfbovV1xuG50FuxauYe
 FzsM7rKvlfQhQZTqbugYDRlKM+x2bnZN3H9NyX4gQ7FgTzQ=
X-Google-Smtp-Source: ABdhPJyvDJ1NkE4fzQhTVbaMeaTJJ71H/QPrGgNzZ8y16kOvPjgAH+0OCEeAM2I31hS6Lvqf/0RCfOK0WAuB6QLG8Fg=
X-Received: by 2002:a17:90a:6487:: with SMTP id
 h7mr4915163pjj.40.1638439873589; 
 Thu, 02 Dec 2021 02:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20211130132629.130713-1-zhou1615@umn.edu>
In-Reply-To: <20211130132629.130713-1-zhou1615@umn.edu>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Dec 2021 11:11:02 +0100
Message-ID: <CAMeQTsazxeXgOJcuGZhEH5BX5ZzmOgM-NAjLjj9iypNgTqu-dg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/cdv_intel_lvds: Fix a wild pointer dereference
 in cdv_intel_lvds_get_modes()
To: Zhou Qingyang <zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 2:26 PM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode and used in drm_mode_probed_add().
> drm_mode_probed_add() passes mode->head to list_add_tail().
> list_add_tail() will further call __list_add() and there is a
> dereference of mode->head in __list_add(), which could lead to a wild
> pointer dereference on failure of drm_mode_duplicate().
>
> Fix this bug by adding a checking of mode
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_GMA500=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> index 9e1cdb11023c..56aec41ebb1a 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -310,6 +310,9 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
>         if (mode_dev->panel_fixed_mode != NULL) {
>                 struct drm_display_mode *mode =
>                     drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
> +               if (!mode)
> +                       return -ENOMEM;
> +

Same problem here as in the other patches.

>                 drm_mode_probed_add(connector, mode);
>                 return 1;
>         }
> --
> 2.25.1
>
