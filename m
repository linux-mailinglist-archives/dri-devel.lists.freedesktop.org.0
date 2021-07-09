Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8913C29C1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543F6EA7B;
	Fri,  9 Jul 2021 19:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6426EA7B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:36:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p16so25481314lfc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2U2kQrbeK6yCldnVDRPJ/ZaHJkvPY10dBngYqOaMhEE=;
 b=crTk0AqLwsaVtFV2GfnN+DDPeOmc/ojaEnT4qFFD4AWPb9GmJ9rL5a94Z5h7cRuR+4
 SOYZN8KEQlZaNdmMzsXJFe88cpIJ4Ij+p7/QtQEQs8rjDbkw1PyrhqW2zfl5UQb062SK
 OBSTI8+QENSjwZh0FlW5IY42m4Dr5bVJ+OO9nBFGnOMqyWpSEWB6apudQ2HgS27LmHYG
 EU//f0AZkEpsf/CxQ23BkSRHDrCBrzhVI5c73I097mCwf6hkzU3i4GQ4EWnGf8a9WNPm
 Xbcih562NKcvdmKJ5xd6+c28r0auzLN3zDZu01T1j4UpToVhvW6g1N49nnXLKsZFaXyC
 ZnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2U2kQrbeK6yCldnVDRPJ/ZaHJkvPY10dBngYqOaMhEE=;
 b=QgzBdcsfyZM071iSMOnskvsMC6YuTu9JrCPJhFR0kWwJeyTF9tc5sfbP5N8YaUxOWd
 8xNF+H0iSpYeCejdzNCVB0ShJsYvPgknwvwQIJcI2XM8eePbF1koFlSaDK7oTAQSpHlE
 ydZu+ss/HFKL4ki5cvrtc0DPQJAkYqKd7gpOm33h9Ef5iZyleDfHEFH1l1w3Hvo5xmx5
 hipl5dmLDVzCTyuOv6DTrqKweZC6AeynnsJjud3Y0bMCLTiiWZg1DI1LvMZ2Qh+yyxve
 pgSYb5zYpz5E3Nx7x38C/9mwtDSnI7q3cBw94WOJ++BYkoX+HY0lkM89fFRr9SNzqf7G
 ne2g==
X-Gm-Message-State: AOAM531aKFUYa4+obzNHFLmRWgOQdHMYp3eG2qoKe77r22r7v81Rnu+V
 GL2ZbSIB93isJcMKGvKqhIWT3zrAesKQqtS4Hn0=
X-Google-Smtp-Source: ABdhPJyBCbKwn9zzReCzdj/pgI5h6sZXdNuZEmNZedP1m7wL8YfBQK6HslDo62ouEZbfqBnzImCHVykj6ZEyfIezDk8=
X-Received: by 2002:a19:d609:: with SMTP id n9mr9949297lfg.198.1625859362002; 
 Fri, 09 Jul 2021 12:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210629115956.15160-1-jingxiangfeng@huawei.com>
In-Reply-To: <20210629115956.15160-1-jingxiangfeng@huawei.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 9 Jul 2021 21:35:51 +0200
Message-ID: <CAMeQTsbgrTa09t+qBHzoSRmK=WU5K0uTuQ8xRN7zd6XRMYMQsw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Add the missed drm_gem_object_put() in
 psb_user_framebuffer_create()
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 1:52 PM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> psb_user_framebuffer_create() misses to call drm_gem_object_put() in an
> error path. Add the missed function call to fix it.
>

Sorry for the delay, I'm currently on vacation.
Looks good. Thanks for the patch.

Applied to drm-misc-next

-Patrik

> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/gpu/drm/gma500/framebuffer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index ebe9dccf2d83..0b8648396fb2 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -352,6 +352,7 @@ static struct drm_framebuffer *psb_user_framebuffer_create
>                          const struct drm_mode_fb_cmd2 *cmd)
>  {
>         struct drm_gem_object *obj;
> +       struct drm_framebuffer *fb;
>
>         /*
>          *      Find the GEM object and thus the gtt range object that is
> @@ -362,7 +363,11 @@ static struct drm_framebuffer *psb_user_framebuffer_create
>                 return ERR_PTR(-ENOENT);
>
>         /* Let the core code do all the work */
> -       return psb_framebuffer_create(dev, cmd, obj);
> +       fb = psb_framebuffer_create(dev, cmd, obj);
> +       if (IS_ERR(fb))
> +               drm_gem_object_put(obj);
> +
> +       return fb;
>  }
>
>  static int psbfb_probe(struct drm_fb_helper *fb_helper,
> --
> 2.26.0.106.g9fadedd
>
