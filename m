Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939E417D59
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 23:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B66E247;
	Fri, 24 Sep 2021 21:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEC26E247
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:58:46 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id m11so14505288ioo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69bjUxd0RSwLVJJ5pHki/PEG52ZQR8S8G5aZawWTWAE=;
 b=bFTIzSROv4wRwSesV3HIvC7HamOkX4V5NdJsUi2LYgB3tqhHnYTNuLSwzqehf28pBG
 4CFNjtHN6Bt3oQqEbMJ4Ssse6VAs3HqPy20pn4mbkZ3Hjbk0miqpu98swKR2aj4TFS6F
 Eh70EFpyzmPdzWotzeFw3MbhtzUa4rtKHTi2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69bjUxd0RSwLVJJ5pHki/PEG52ZQR8S8G5aZawWTWAE=;
 b=xfE6b0imtdSMrW9ilVZB6HA8zI1xhwh0QUfv19qMlOVK6PdCKwc4Df5M5n31A2Da5q
 1vTMtR8bdpHbMpeF7rGto/wlKq8WZXHdRmYeX9EkrkfYUMRBwzDP2RcvONNPZf6zN0PI
 4WsTshmr285+WOYdh3QDV1m2d7NMK+A9TWoNH2MoWjYxTNgesjyFfA2/moj1UeuqyXI2
 BUFC1eFbNMXz0g0m37UXl2aNUjAm+m3usHQrJYHDPjOhagczPgkK0ppAy1oXktZr0wgm
 VjzrOgk/LjiWrIeK4AsxVDjIVAvLEzWAQrbcWKeLQK26ICRQ/GC3D2uDFJ9c7THYnoUy
 5hYQ==
X-Gm-Message-State: AOAM532vbmUCvvXYjMZMqu/cjcJenuCG+1FCQIo7R2Oq4Gc5qsSSZGZo
 zGSspzH25wEh6gVpuKmTxlg7ugX9nkTXBA==
X-Google-Smtp-Source: ABdhPJzBjKU85k+G6QRQ06X0TLjHtw6xidpZlqjHE2THbY01768z5suCClxij+2DTb396tqWM5ThkA==
X-Received: by 2002:a5d:8b59:: with SMTP id c25mr10764609iot.190.1632520725812; 
 Fri, 24 Sep 2021 14:58:45 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id k14sm4657998ili.35.2021.09.24.14.58.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:58:45 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id q205so14499823iod.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:58:45 -0700 (PDT)
X-Received: by 2002:a5d:8b4b:: with SMTP id c11mr11114257iot.98.1632520724643; 
 Fri, 24 Sep 2021 14:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid>
In-Reply-To: <20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Sep 2021 14:58:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMMYjmzxSTE3EgjhdcNX9zpuMzqOHZYAnFXspz+HTJ6w@mail.gmail.com>
Message-ID: <CAD=FV=XMMYjmzxSTE3EgjhdcNX9zpuMzqOHZYAnFXspz+HTJ6w@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix EDID quirk compile error on older compilers
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Srikanth Myakam <smyakam@microsoft.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, LinusW <linus.walleij@linaro.org>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Fri, Sep 24, 2021 at 7:53 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Apparently some compilers [1] cannot handle doing math on dereferenced
> string constants at compile time. This has led to reports [2] of
> compile errors like:
>
>   In file included from drivers/gpu/drm/drm_edid.c:42:0:
>   ./include/drm/drm_edid.h:525:2: error: initializer element is not constant
>     ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
>
> Go back to the syntax I used in v4 of the patch series [3] that added
> this code instead of what landed (v5). This syntax is slightly uglier
> but should be much more compatible with varied compilers.
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18
> [2] https://lore.kernel.org/r/874kaabdt5.fsf@intel.com/
> [3] https://lore.kernel.org/r/20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid/
>
> Fixes: d9f91a10c3e8 ("drm/edid: Allow querying/working with the panel ID from the EDID")
> Reported-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Reported-by: Srikanth Myakam <smyakam@microsoft.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_edid.c        | 121 +++++++++++++++---------------
>  drivers/gpu/drm/panel/panel-edp.c |  23 +++---
>  include/drm/drm_edid.h            |  14 ++--
>  3 files changed, 81 insertions(+), 77 deletions(-)

Landed in drm-misc-next:

7d1be0a09fa6 drm/edid: Fix EDID quirk compile error on older compilers
