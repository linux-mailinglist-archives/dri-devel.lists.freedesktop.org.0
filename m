Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5CF4656D8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 21:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681566E03A;
	Wed,  1 Dec 2021 20:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFE86E03A;
 Wed,  1 Dec 2021 20:03:43 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t19so50924194oij.1;
 Wed, 01 Dec 2021 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CnRqfpgLADDNTZxnQeaARyw+MQVCOBB9/QLoFKFTaY=;
 b=k8Tpb/goSn4OxnTRzZPdleRpfdsgEkWSn37q6iTGm5UHHRM3JadzgamYa9jcntWMNF
 U85NVBPFdEn8Tg4YD3IPsS1sz0+vguYM96laTil7SLw//CaHG0iy0XqJx+1iuXEnZitW
 0V+qwMTHj7p7aVL9RQJKBw0lVdwvU3OI583jsrwOIASQTLGxiaFPwWVJZ1heXflzvidj
 DitIoVnI43kS0L1FmWU8LDpQn1PiOWYGe8ANsZP4oBYiC6yLVPKuX0/j29wLv4lMFEVw
 PsU6tGIhtpCU7qC1SlI/nyQCDVZLV0qnsq9uybzf8nUY5LMPLQGcJNgfxQhqFvK91qhe
 xiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CnRqfpgLADDNTZxnQeaARyw+MQVCOBB9/QLoFKFTaY=;
 b=y6aepNd4L1fol9ANV/03BKQUSde5zJ7SPi1e73VWoaTuW5k9vVZlWPcqKWTV87TK8A
 S0XboqzxLanAIfjA6hmy7K3Gy9zE9HxxY+sYE514h6QAs50Unq+ZgJSTlSVw29Mj7fGW
 8x3739l2P1fM2VnZ5WqYCszfzV9RVx8pVE+WJGf566qhujrJrn3nmUDTBWUa4SOfx6g/
 eCPr518TLG4nj0hR5MJosP1ZrZT0nK5+pFJXyV4wHlDspWXg5LkTtAGO/HiNsDqlYgOM
 9LQ+ATAJ64wYSIWc3D7eIWjGaRXa4Vcpi3Rg8bkXRFTieKbs9+Xn4tilC2nZ98F07qHv
 EUxA==
X-Gm-Message-State: AOAM533Ulkmnfrvz7mPj4Irpm/AfryP9izTJhF32zhGbLtz9l7s7Ffv0
 1Hq4PQ0sgEk0GZeGqtc+aegAnmRjrd2Tn0J+tI0=
X-Google-Smtp-Source: ABdhPJy6k0qxdww8PmNgmuAWz7XREQWa9kFFYwHBgKQzTv8HOIt56/td3z4oxlejLCTGzNVhqOWT869k8DCUt6suX10=
X-Received: by 2002:a05:6808:68f:: with SMTP id k15mr357371oig.5.1638389022328; 
 Wed, 01 Dec 2021 12:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20211130111832.113821-1-zhou1615@umn.edu>
In-Reply-To: <20211130111832.113821-1-zhou1615@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Dec 2021 15:03:31 -0500
Message-ID: <CADnq5_P8amQK60zD-2tkVWBneZCoLENe5KY_S6eqoAAyOieatg@mail.gmail.com>
Subject: Re: [PATCH] fix a NULL pointer dereference in
 amdgpu_connector_lcd_native_mode()
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jammy Zhou <Jammy.Zhou@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 hongao <hongao@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 6:24 AM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In amdgpu_connector_lcd_native_mode(), the return value of
> drm_mode_duplicate() is assigned to mode, and there is a dereference
> of it in amdgpu_connector_lcd_native_mode(), which will lead to a NULL
> pointer dereference on failure of drm_mode_duplicate().
>
> Fix this bug add a check of mode.
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
> Builds with CONFIG_DRM_AMDGPU=m show no new warnings, and
> our static analyzer no longer warns about this code.
>
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 0de66f59adb8..0170aa84c5e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -387,6 +387,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
>             native_mode->vdisplay != 0 &&
>             native_mode->clock != 0) {
>                 mode = drm_mode_duplicate(dev, native_mode);
> +               if (!mode)
> +                       return NULL;
> +

The else if clause needs a similar check.  Care to fix that up as well?

Alex

>                 mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
>                 drm_mode_set_name(mode);
>
> --
> 2.25.1
>
