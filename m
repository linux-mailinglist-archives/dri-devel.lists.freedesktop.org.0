Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A570D3D5CE1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDA6ED84;
	Mon, 26 Jul 2021 15:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E618C6E980
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:23:20 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id d73so15362502ybc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VYni6LxPY5IYpOTqFxP6J2SxNh56/QyuzJ13NMi4XkY=;
 b=oPGcCMZjLgxVsJEqoec2xz906Y9EeQRM+FpeBbDFS8RJk/erKW7GWK9cp4lQEaMvYz
 5GI6r9j2xBemFHM7YWffSBqOejWjRPmnPCKJu0098Yoi9sPPSU9ZE37fWAbu6+Wk0N57
 Myo0QInItSJqa/GI/iqSt317HacAzmFrk9RoKIHpMKfdtU+WMXL3hP4MhmitpHqXWbVG
 YlY/7HR54vE13IfxvoZ7BEPtOW2bWknpf2XyDDZtclt38hBkGdgK7UNL9MLCsHBsBXAB
 8HNaAdamwrZEPNpouWlNinfJ/JYlJTsf1WeRdnss1uQrr29WxMrz033MCoPE5EGe0vW+
 pFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VYni6LxPY5IYpOTqFxP6J2SxNh56/QyuzJ13NMi4XkY=;
 b=eNP3YMGKwegS6rz4Yr7eFKY8/0JjHbxb5eEbWvoEkOWVPd2p2QigIY72Krl8XcG3k3
 XZJIVU8I+4pfg6WLQlaMO49Wa7tjnIWD5hRn1T0hly7O65wuHgcI3jFtuqOGXgAEWOdz
 T4v8G1EnYPruyN1rQZr+V1xyWr2NMbg9F7Fd/z1ycar69Bes/WWledPkRrAXYIe2wa/P
 Fm0g2N6VIRWTMPNtAWA3GuMmez04Uu3L7fRz5jLRwmy4b45BDhWCV6BZLqckoJN1/ofl
 VW93ERuohUICaRMgEnmss+pYjZ1WUVh/4PFw6YxGy1JDAJdek2MnmnNMEvKlwcQkbRDJ
 w6zg==
X-Gm-Message-State: AOAM532B4nvQHgiez0o20JwTKIHyc4eLSDt7Ot5d0Iq0GQrSNidmntvF
 7qdEUgmhmq9dp9Z8f2xVkOsYRZN8OeNhMzxRFWbgeg==
X-Google-Smtp-Source: ABdhPJyjXUJIEr5ZiJh3TsNDgqayxwC2GYIE0gA4BkBOIjBwUfkE94PCY5Kuu1jjidwn2xFIjIDvU/if+Likv9ug+dw=
X-Received: by 2002:a25:b708:: with SMTP id t8mr3562702ybj.139.1627312999994; 
 Mon, 26 Jul 2021 08:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:23:08 -0500
Message-ID: <CAOFGe97wB=1Jx9CMZt=H8Di7EAv1XmU0=5ohJGCBaN1vcGPv=A@mail.gmail.com>
Subject: Re: [PATCH 01/10] drm/i915: Check for nomodeset in i915_init() first
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 2:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> When modesetting (aka the full pci driver, which has nothing to do
> with disable_display option, which just gives you the full pci driver
> without the display driver) is disabled, we load nothing and do
> nothing.
>
> So move that check first, for a bit of orderliness. With Jason's
> module init/exit table this now becomes trivial.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 48ea23dd3b5b..0deaeeba2347 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1292,9 +1292,9 @@ static const struct {
>     int (*init)(void);
>     void (*exit)(void);
>  } init_funcs[] = {
> +       { i915_check_nomodeset, NULL },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
> -       { i915_check_nomodeset, NULL },
>         { i915_pmu_init, i915_pmu_exit },
>         { i915_register_pci_driver, i915_unregister_pci_driver },
>         { i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> --
> 2.32.0
>
