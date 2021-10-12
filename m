Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5E42AE1F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 22:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A6B89D73;
	Tue, 12 Oct 2021 20:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E3989D67
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 20:45:19 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id x1so355558iof.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niP7v3xFwLnCjLXmT0nzm06tTYa6qI3k7igZv8TEJsc=;
 b=MrnlfgVEgsrzhHRtZFc5utknl/ytW5WjQcYfTv2HnZ6fS9lKKuW+F42Nrbx+gHripS
 Xc2RIA6gaKDSc/bn3xBmR20a0BtY+7gzFpyZmggMd//w3Ub3xZ+2jCun1uq9tVGlgJIT
 sVMI8bJ+eODJIFrgH34toluuVDOHJLd8ha9UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niP7v3xFwLnCjLXmT0nzm06tTYa6qI3k7igZv8TEJsc=;
 b=wCS9MbOdWifnh/pZyGwoHJUc1JlGQZ0tuiIYZkgJnE/3/yTEFeRWjZ/tKI2+SAuN4d
 34Mh3vEZrDle1qeIKeeOAvlmD6aASFbdVmYPJ/gHjgWzXHg+oawtCqJv/s/jEgX2Fu2w
 LuFPGzfDa2QVg/r9kpD328YLBRI6zTfotwy5R0xwwFnfueKKk3MSSnuS3y2qEiTcAsk2
 hQcyN71hiVWepMOKx3YHxPrNyKI6c0fMjTuMzG67BQPhKyZHL1gkMf5o2e8oIBfB1Z7C
 T7zF5nuQH72yn6lZ42rgETfQu20exYSHZLI+gJvOPBPtfP9WaUTm5qPpld1qHTkaCdQd
 DE2w==
X-Gm-Message-State: AOAM530iyAAkLJApTmK9s1nOywS2SBxjKthmtl6GcN/Wn/+qDwX1hrWh
 fxiRwBlO6yZBgYlmjrdwe6Mo1J3tvbVb2g==
X-Google-Smtp-Source: ABdhPJztTeVJuMD1YzKu6M5B3QxOAF5Ru7tohXlPhAETjkd8wWQYfbYkc3mRhb9DgG9U4YA+y+yKCw==
X-Received: by 2002:a02:2245:: with SMTP id o66mr24871652jao.67.1634071517358; 
 Tue, 12 Oct 2021 13:45:17 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id a5sm6494474ilf.27.2021.10.12.13.45.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id r134so334932iod.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr25937447iog.98.1634071515111; 
 Tue, 12 Oct 2021 13:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-5-lyude@redhat.com>
In-Reply-To: <20211006024018.320394-5-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Oct 2021 13:45:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WV15+qBBA8ZcgxwOQ=i_LHsytdrUWyqZHZZBwuJJ6CFQ@mail.gmail.com>
Message-ID: <CAD=FV=WV15+qBBA8ZcgxwOQ=i_LHsytdrUWyqZHZZBwuJJ6CFQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/dp, drm/i915: Add support for VESA backlights
 using PWM for brightness control
To: Lyude Paul <lyude@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Rajeev Nandan <rajeevny@codeaurora.org>, 
 Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Oct 5, 2021 at 7:41 PM Lyude Paul <lyude@redhat.com> wrote:
>
> @@ -1859,8 +1859,7 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  static inline bool
>  drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
>  {
> -       return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
> -               (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
> +       return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
>  }

nit: I don't believe that the "!!" is needed in the above. C should
automatically handle this since the return type of the function is
"bool".

I've reviewed the generic (non-intel) code and it looks like a
reasonable approach to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
