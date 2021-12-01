Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C4465235
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A15A6E7D3;
	Wed,  1 Dec 2021 15:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FA06E7D3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:57:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso1987930pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMjb22+5HnYiWezXGd8BpfVqKH0j2HDeYCBfIiIkNVo=;
 b=g0HO6kFkgvnmY+B3hcQqit8BWq8G7VNpEMqDmNa4m2h5ZTq4k3zbAfbyMIb8tNOqfF
 yKRc66qz5WN5vu1fKZLMrCM/6zzq/0CRGHBxmgnDztpzKwMB2stVS8gKw6ZA1ea+/U0c
 am5jLOAk+rgOqRqwVCKNN537M7oISzTotwKE2TiRWlR8wuNQaapsS+tMDe8nxYexKXYg
 kYQh+3G+bmg5sBa/bMrkELsHYUBYEvfWHggjqOPHDuA0VZgq0lMUDQtnDy3VBD7yJNP/
 5XHlk6hrPeim0G8j68rkAwKeTJBHnq/VQ2IY17cDHjAQ7cZ22IwOmpNyfttAvSGOTaVM
 e75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMjb22+5HnYiWezXGd8BpfVqKH0j2HDeYCBfIiIkNVo=;
 b=ak0RCxwW+DiVVmwv34owiHx0aHr3AwOu130fp7L3f/9c+T3zRqvwfY2GSiXrIfy2rt
 BfsbaCvBeXUFghqwiqADL9zYLSkTaJT5+ycVxjOioRzCtXdEBHIZUGtsveceu196fq6/
 Zl8zG0ED/olsFBz0tGcqDYdjTBiC+tcoUt1vPrmxaZb8+rVXZIfwm93Z6/I6WPqzLVsd
 MmF5IRCUlSdY7X1g44Dzl96/LCt43ylMR30IetXa2ZVCp/R5f7Uq3GB/KNloWyo4I1Wy
 irQgiJBjjN99mnUklcTjPvyn4MEsS1NxrAyNhJeBmwKwcZUpU05NEyIFa8yWo8bLG1YS
 OavA==
X-Gm-Message-State: AOAM53313T7jv0aqXb1rb/11NVevB7KlhSN48jBWT3nolS6qBW7gLZxG
 tPynnycW2/7XXl11449AvN4P8gAmqRyhRJ6XYTM=
X-Google-Smtp-Source: ABdhPJxieeuL5+UhxVUkW3jolN2MUEXlreNEd7Kp4GrdkbFgQEVufS8lZ6H+pIBkHjXWdpFD+6FVSbAnMJWinHt2wd8=
X-Received: by 2002:a17:90a:6487:: with SMTP id
 h7mr8554432pjj.40.1638374255666; 
 Wed, 01 Dec 2021 07:57:35 -0800 (PST)
MIME-Version: 1.0
References: <YaZP2HzTQw1QJxOK@intel.com>
 <20211201152904.182293-1-zhou1615@umn.edu>
In-Reply-To: <20211201152904.182293-1-zhou1615@umn.edu>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 1 Dec 2021 16:57:24 +0100
Message-ID: <CAMeQTsY0RHJsJzNW-77gK_=WCetvhrUVbF4KA+Qu3uaV1CCR_w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gma500/cdv: Fix a wild pointer dereference in
 cdv_intel_dp_get_modes()
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
 dri-devel <dri-devel@lists.freedesktop.org>, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 1, 2021 at 4:29 PM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In cdv_intel_dp_get_modes(), the third return value of
> drm_mode_duplicate() is assigned to mode and used in
> drm_mode_probed_add(). drm_mode_probed_add() passes mode->head to
> list_add_tail(). list_add_tail() will further call __list_add() and
> there is a dereference of mode->head in __list_add(), which could lead
> to a wild pointer dereference on failure of drm_mode_duplicate().
>
> Fix this bug by adding a check of mode.
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

Is it really necessary to explain what the static analyzer does and
that it can be faulty in every single patch?
"This bug was found by a static analyzer" is enough for me.

> Builds with CONFIG_DRM_GMA500=m show no new warnings,
> and our static analyzer no longer warns about this code.

I assume all patches to be at least compile tested before submitted,
so if you didn't actually run this code on hardware it's better to
replace the above with:
"Only compile tested".

-Patrik

>
> Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> Changes in V2:
>   -  Instead of returning -ENOMEM, this patch returns 0
>   -  Use DRM_DEBUG_KMS to report the failure of drm_mode_duplicate()
>
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index ba6ad1466374..bf47db488b7b 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1773,6 +1773,11 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
>                 if (intel_dp->panel_fixed_mode != NULL) {
>                         struct drm_display_mode *mode;
>                         mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
> +                       if (!mode) {
> +                               DRM_DEBUG_KMS("Failure in drm_mode_duplicate()\n");
> +                               return 0;
> +                       }
> +
>                         drm_mode_probed_add(connector, mode);
>                         return 1;
>                 }
> --
> 2.25.1
>
