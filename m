Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13594656DB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 21:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477B46E8E7;
	Wed,  1 Dec 2021 20:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AB76E05D;
 Wed,  1 Dec 2021 20:04:24 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id o4so50897511oia.10;
 Wed, 01 Dec 2021 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gNibeRohHDnBf3Tf3ZwWeQm6vav5gbJko9AzXB4JdnE=;
 b=W8oD8sK5M3DtjSF5B8h4ww0GCkEP00y6YSU4iTmdYlaS8XiebJfwYsiENMur5nsT8y
 w+3y5IwvLoUsWrXKIVy1NHLkiis+2It4sG09Dbvp8SMIs9E5fmxXeHCL9+60EPNsbYWx
 kE4H3yepWi1spYfXNLId6a8p4CZKrp2D2FjiAhLUHzB354yvoiiGtsPk+qw5vVQjdLUm
 132N8HrrJ+v8ysIU2NKy7o16gtPhYtFDUdMVoAnI/dRpzOVAXllKt8OJUF+idKDkN1YI
 DUX3ExzECkOqlL2mVIWhApRze2se6k7NKEx47GXg4aHoAJEUMbHvtAVy4YhBUNxbg+0z
 rZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNibeRohHDnBf3Tf3ZwWeQm6vav5gbJko9AzXB4JdnE=;
 b=BwDyOB1NiE8ehQtp7muuNPxXcSMX1neNapEGsGA+f2vQX8wQ4AFV8HFL18GggA95fG
 250Rg1uIUT9URJLCCLq8ddiDTvQ4hjcrPAk7nT/+VZrwukx7/VYNPNSKThL/yhvHBOiO
 y23MGTU/Pb/vaTyZSsGY/7aE7zq0zNSxUvOpUKQYsStM3jVkayQmXWbg7kKRuGkCEw4h
 ZkQZ/CKzbjX+OGoNzULUIEITd57lP2F0rO6hLsCqiga1RGvjPX+2+ADyuEzJGzbWrozy
 Y9vaJhYSl0aa1gpw5WAyBXFdJvfa8aH4Mu9umYSq/2bGETWU5qK05QD6L0e6KD/8B3AB
 B2Zg==
X-Gm-Message-State: AOAM530JfSwh68HptPMzZuErTcV8TnN86yRYVCPhPef8fxJfIewOfynB
 6xytoV0hkQZ9vJu/BM5sbvIXZRBk5llTkDLA+AY=
X-Google-Smtp-Source: ABdhPJwDMNr2tA0qqHWz0509+tWjBzPQqB1bqESBTlKPcLPImrrPy7C3+d69EAYHFau7J8vFwDoAsuPOcyzwKDDn7Hg=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr415925oib.120.1638389063521; 
 Wed, 01 Dec 2021 12:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20211130144827.163717-1-zhou1615@umn.edu>
In-Reply-To: <20211130144827.163717-1-zhou1615@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Dec 2021 15:04:12 -0500
Message-ID: <CADnq5_ONy+=6ufko6aBiTDwBsUuRGqqJxcDvNmAEoELUMJMxWw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/radeon_connectors: Fix a NULL pointer
 dereference in radeon_fp_native_mode()
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 9:49 AM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In radeon_fp_native_mode(), the return value of drm_mode_duplicate() is
> assigned to mode and there is a dereference of it in
> radeon_fp_native_mode(), which could lead to a NULL pointer
> dereference on failure of drm_mode_duplicate().
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
> Builds with CONFIG_DRM_RADEON=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: d2efdf6d6f42 ("drm/radeon/kms: add cvt mode if we only have lvds w/h and no edid (v4)")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 607ad5620bd9..49f187614f96 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -473,6 +473,9 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
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
