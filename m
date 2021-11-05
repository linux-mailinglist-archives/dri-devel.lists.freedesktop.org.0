Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1944699F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503686E4EA;
	Fri,  5 Nov 2021 20:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E3F6E4CD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:25:21 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id e144so12093543iof.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LrK07k0Lpn9CHC7K58jZi/mGEAzkF+QHwrwjm8onEpQ=;
 b=J5P2n9oSkKMVEby8FUnF9XKM7m7v29C9QXYnLi8ad3Gc0hFBr8XXUfoBnhnXCvQbCT
 jjaOYs//TeGM0x1WTuneAjydHwuzeXNZNwzHdKUuZS2sIpjpZ2EB5MdBULXyZcxFH2im
 KFtNl/2wO/3NMsNLqEPqj3//SqItdZo7l97A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrK07k0Lpn9CHC7K58jZi/mGEAzkF+QHwrwjm8onEpQ=;
 b=fds95wkRPdAT1ch0rdwU0NPhvmmkUBGA2dQZ0+1VL5t3yD91oJErU0ml5+QMF7E2mj
 yF7tYw9E2FdhWLj2OOG+FGmJ9fo8PJhmAN9B7B8EaUM7kGIIXyxI+gGwiINofgixnsxv
 rDMitbcErWG5Yg3Jjj21hS1lsbHRyVm84uvnS7liibdNt2/xFjuQoY8ref4qqNFbzcSU
 K8QfBDTrPBsuCy3OmhMMuVpBVtoBIIhcGrInMl7Goc7C6K0GI3u0PlFgl0uxbc3GqMou
 UbZCrzWQbw+EZejrkCr+qYvkoA+9fT6e0spviEJcyKwsoRxCei0E9JMJ9MndgfIuZvpe
 SQ2g==
X-Gm-Message-State: AOAM531GZQcHIgoLb9XNpmId8MAj7YMnQkopkhApzlWbWr19+t7+MyXw
 5XKqjdnZzg4wqvSojTmTwwSFUhBLl5WOjQ==
X-Google-Smtp-Source: ABdhPJz3EDOwtDRX2iWzwPSJwxVyCVll/yaMP2osMc1K7Iua80dh5vnCHw8TnPrCKDx92k/HBI4NFQ==
X-Received: by 2002:a05:6638:140f:: with SMTP id
 k15mr11105676jad.105.1636143920366; 
 Fri, 05 Nov 2021 13:25:20 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id k11sm5469381ilv.66.2021.11.05.13.25.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id i9so10633105ilu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a67:: with SMTP id
 w7mr35042875ilv.165.1636143919429; 
 Fri, 05 Nov 2021 13:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211105183342.130810-1-lyude@redhat.com>
 <20211105183342.130810-4-lyude@redhat.com>
In-Reply-To: <20211105183342.130810-4-lyude@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 13:25:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VA53LyEA+jDfU6mQ0USwfSBiLK8KfWfc91U9X9f=oN9g@mail.gmail.com>
Message-ID: <CAD=FV=VA53LyEA+jDfU6mQ0USwfSBiLK8KfWfc91U9X9f=oN9g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/dp: Don't read back backlight mode in
 drm_edp_backlight_enable()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 5, 2021 at 11:34 AM Lyude Paul <lyude@redhat.com> wrote:
>
> As it turns out, apparently some machines will actually leave additional
> backlight functionality like dynamic backlight control on before the OS
> loads. Currently we don't take care to disable unsupported features when
> writing back the backlight mode, which can lead to some rather strange
> looking behavior when adjusting the backlight.
>
> So, let's fix this by just not reading back the current backlight mode on
> initial enable. I don't think there should really be any downsides to this,
> and this will ensure we don't leave any unsupported functionality enabled.
>
> This should fix at least one (but not all) of the issues seen with DPCD
> backlight support on fi-bdw-samus
>
> v5:
> * Just avoid reading back DPCD register - Doug Anderson
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 40 ++++++++++-----------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)

You forgot to CC me on this one! ;-)

This looks good to me now, so FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
