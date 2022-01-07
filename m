Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE58487D59
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 20:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B8510E6D8;
	Fri,  7 Jan 2022 19:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943ED10E6D8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 19:53:51 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so7694209otu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 11:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCWW9l5TYpSQZW7IxxLh+Bgf0Q6VOgQSqAtLWyGSPG8=;
 b=TSvb+oZLVoX48cum8Tneyp4hOVRDoWpx43qobWvAqcV210AucgvxhLWdQdLxxtWQQB
 jAtLe7wcu5JD1u9jwbPfnqPiDwIUNhW5t3rT2A6TenGk26VT7u7QFw1xIsNysbO1GoJK
 EOw2wRBVkRwMtvgoIBXfJ0aE4Gvcaop5VWoojwhdL2CvNnrlZDEiju2vwIRk87XegqRe
 w8KSPFDuZtQl8jR5NqlutMQ5Q/eKDXZl7CZ8yIMBt0Xm1zgEAR/yBwAZmswQS7kBJ+4Z
 IyxFY5DVfV3Dcd5VIryoTDS40YVJsRt7rLGB8B12lwpjQtYDz+nHesX/aIA2Q10S07nv
 lDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCWW9l5TYpSQZW7IxxLh+Bgf0Q6VOgQSqAtLWyGSPG8=;
 b=cAFDeWtJvHe36V26Z6YuT5rmfownoIwDtqW3rjDPPQcDMFVxkOZEyBpKyEpAfGVCZN
 25+jVI0BSC441eMtH7k10ITBnUBjGgCXH6CTaaWwTur6P8LkiUPHMXvrG7r9NJTISWPJ
 nvAfXomlfYsogEzQZ/RiYMw6hjegSZ+Or77qwX4PNlEM7tjOw9wtxIoZX6nsmI6/MAiX
 31GIosBBccIQDfKC69Hqsm/9ahivQoQWMZ9MRgmfJyEdflS5FDJOFyZRNBS5k3meCSj+
 kXnlJEDkAgaU6d6q564kPraCqfEijA050X2XGn5MABt4L8gCRywxOCMqJmM/b+xt6lww
 hUtg==
X-Gm-Message-State: AOAM531/Jk9T2P+HxFijCwXlKf+fnXyNbKn2g6Zu8vC2PcL60BC9FaCd
 dsbI5Xh+bacecXtwY6sk+wi6nK7YCAywX0EDonM=
X-Google-Smtp-Source: ABdhPJyXnHKGLUUrWi9ONP1JYi50W6b4XY0LDv8Cc+uSqLxZ1hoRdPKME4Nr7/LktZjOyhNhOIlrzo3B7/+IwHBnZcI=
X-Received: by 2002:a9d:6390:: with SMTP id w16mr48527995otk.200.1641585230853; 
 Fri, 07 Jan 2022 11:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20211230040626.646807-1-victor.liu@nxp.com>
In-Reply-To: <20211230040626.646807-1-victor.liu@nxp.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jan 2022 14:53:39 -0500
Message-ID: <CADnq5_PsxrYeZ+p5NbXRks3EaJrYNMN+vbUJkiKHZ4cf=x=dsg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Check new_crtc_state->active to determine if
 CRTC needs disable in self refresh mode
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 29, 2021 at 11:07 PM Liu Ying <victor.liu@nxp.com> wrote:
>
> Actual hardware state of CRTC is controlled by the member 'active' in
> struct drm_crtc_state instead of the member 'enable', according to the
> kernel doc of the member 'enable'.  In fact, the drm client modeset
> and atomic helpers are using the member 'active' to do the control.
>
> Referencing the member 'enable' of new_crtc_state, the function
> crtc_needs_disable() may fail to reflect if CRTC needs disable in
> self refresh mode, e.g., when the framebuffer emulation will be blanked
> through the client modeset helper with the next commit, the member
> 'enable' of new_crtc_state is still true while the member 'active' is
> false, hence the relevant potential encoder and bridges won't be disabled.
>
> So, let's check new_crtc_state->active to determine if CRTC needs disable
> in self refresh mode instead of new_crtc_state->enable.
>
> Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Do you need someone to push this for you?

Alex

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index a7a05e1e26bb..9603193d2fa1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1016,7 +1016,7 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>          * it's in self refresh mode and needs to be fully disabled.
>          */
>         return old_state->active ||
> -              (old_state->self_refresh_active && !new_state->enable) ||
> +              (old_state->self_refresh_active && !new_state->active) ||
>                new_state->self_refresh_active;
>  }
>
> --
> 2.25.1
>
