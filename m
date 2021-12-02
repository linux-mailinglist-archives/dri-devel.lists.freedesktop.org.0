Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E29466136
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 11:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123096ED20;
	Thu,  2 Dec 2021 10:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35C16ED20
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 10:09:17 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so4227574pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 02:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUknh67dSM1BU/4u3ziS1dMgG4inj8/UBL++Q0CdK0k=;
 b=JqjTi5ACFyAGtR5GwQ/as9YkGNVJxFp6QpANCaDVUIZItvGC1scRaywJAzEin3vVfF
 zE9YkXFa3cn0Qft1lKu5eIziw6kYiy+guMWK75vCQ4cXbSURffIbHSm/7ZelBNzzlTsV
 wPDRn9adGioMKYtexSqBfZeCQAL5ceOuR04wI4buuCcRWLUa/A5TcZ/MVZU/6CdVrnR/
 y+wv/edG7Gc28gN3beXJYThzmJv50qgn9yYivYms89fuhTWgzJBSAli4iWqYp/djBqUT
 TpPFaGKYmdxYDzrYHg4P6hYsgO+7vPA/D+jXQu51kvmGmMTy/Rk/eRFuGsWir5tjFey7
 46Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUknh67dSM1BU/4u3ziS1dMgG4inj8/UBL++Q0CdK0k=;
 b=OLYgwsyo7jD/BVSlAWlZwlYXf7fRFAahq3eObDMlj3jjju5O+XBfje+VCv71KIpik+
 jW+59kiBYCzKATwPVzxkQzCB6aAWq53TcFB4FnVRJTu/Ep/2M+zEu8JnyVrOKLMghQzW
 DJri5la3IDAQ9BhSHHc9xhcunI0SQoAMP9sGgL3V3dtLHxj2+LCx7ArUCRK4R3jI3Vz6
 kvPplXUfuYyhQFaKM52OD2gJFWn6b5cjyEspfYeNHtoi9hzgqLLolPFd80MOLuVBmWE0
 xOnYwjZyrHyT9z9MPza/yIlsyTW2OT92+RXLdfvTkoBIzLwrdcHJSa3W5x8GZIY1cjlG
 p7cQ==
X-Gm-Message-State: AOAM5318yxDVvqw317OGZKgp5Wl9qxF8mLlx2UX1qw9323AIv7uzfOuk
 0wSNNDNVb8DrMYl5eNBifyirbWmHfER+Tn3NMGU=
X-Google-Smtp-Source: ABdhPJwxjkDP4hocpChUXb5An6oY60u1hySOxTXanF169akmDX2uMycWG8IUjgsATXS7JN/3A6uTpBTeFI2IQceubVQ=
X-Received: by 2002:a17:90a:c78f:: with SMTP id
 gn15mr4873923pjb.54.1638439757336; 
 Thu, 02 Dec 2021 02:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20211130132912.131985-1-zhou1615@umn.edu>
In-Reply-To: <20211130132912.131985-1-zhou1615@umn.edu>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Dec 2021 11:09:06 +0100
Message-ID: <CAMeQTsYZuqqOGjernWKY=GL28DuW=0wXDbGsvaiuv+53CA36vg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/psb_intel_lvds: Fix a wild pointer dereference
 in psb_intel_lvds_get_modes()
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

On Tue, Nov 30, 2021 at 2:30 PM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode and used in drm_mode_probed_add().
> drm_mode_probed_add() passes mode->head to list_add_tail().
> list_add_tail() will further call __list_add() and there is a
> dereference of mode->head in __list_add(), which could lead to a wild
> pointer dereference on failure of drm_mode_duplicate().
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
> Builds with CONFIG_DRM_GMA500=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: 89c78134cc54 ("gma500: Add Poulsbo support")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/gma500/psb_intel_lvds.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index ac97e0d3c7dd..da928189be91 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -505,6 +505,9 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
>         if (mode_dev->panel_fixed_mode != NULL) {
>                 struct drm_display_mode *mode =
>                     drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
> +               if (!mode)
> +                       return -ENOMEM;
> +

Hi, Zhou.

psb_intel_lvds_get_modes() implements .get_modes in struct
drm_connector_helper_funcs. It should return the number of added modes
and not an error code.

-Patrik

>                 drm_mode_probed_add(connector, mode);
>                 return 1;
>         }
> --
> 2.25.1
>
