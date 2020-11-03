Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B222A5A07
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 23:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4E6E906;
	Tue,  3 Nov 2020 22:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C16E906
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 22:21:55 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id x11so7760403vsx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 14:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ystGsVRRSLNIp7DU6AxtzDMYZFgSTFYVKgOF4oPJhUs=;
 b=V53tju+wVrbxsuqZN0WlOuaAYezdmLGoyX4E1akAPD2cZopyMe343gpe2RlVxhhubj
 ferLmFFPolLq5ctx+foYPd3SZIijDNLA76njMPmpUyZvqOlQVeGVVJ32Uf8H6z+DsS5B
 EurAtK/wDuPkCSjJ3Q2ez7s6MjkPmkJYwQuttgskGU+I4C0ueqQvAZ5pFaIGLocKP/9N
 XulbOcRfwZj2Nj0hoUxF1u8nonGuT13zOEKywP2sQw2P6nY1Jwljd1lZ5KqXk/2fiBNr
 beO0C2h4+H3N1Gk5r7YLQSkeuuKOsV39ewnZPdYEY2LF3hyJGA4pgPceFJQ4YlCnAhwj
 Aqtg==
X-Gm-Message-State: AOAM5336QTzACMrle8Rojy1xVcdBFfdLdTHo8Ja3pSD68JfERkbwHH/o
 kfQvqzRuvL8heFyoFIDlUAC4zqJCigOt9WT/SxI=
X-Google-Smtp-Source: ABdhPJx+6wzHKdabHgncagBkljWabHvhFprI3xGnbyk5I/SRAbasPwnXsBl4ELjrlBl2/q+vZ8AkpOF/VPVeRiX/WEE=
X-Received: by 2002:a67:2883:: with SMTP id o125mr20678367vso.46.1604442114870; 
 Tue, 03 Nov 2020 14:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20201103221510.575827-1-lyude@redhat.com>
In-Reply-To: <20201103221510.575827-1-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 3 Nov 2020 17:21:43 -0500
Message-ID: <CAKb7Uvhr8Cvd+kfw0Rcee-Nrtdg9y3JhGPeNsJjVEDcWXnVxxw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: Fix uninitialized variable in drm_cvt_modes()
To: Lyude Paul <lyude@redhat.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chao Yu <chao@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "# 3.9+" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 5:15 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Noticed this when trying to compile with -Wall on a kernel fork. We potentially
> don't set width here, which causes the compiler to complain about width
> potentially being uninitialized in drm_cvt_modes(). So, let's fix that.
>
> Changes since v1:
> * Don't emit an error as this code isn't reachable, just mark it as such
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Cc: <stable@vger.kernel.org> # v5.9+
> Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..0643b98c6383 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3094,6 +3094,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
>
>         for (i = 0; i < 4; i++) {
>                 int width, height;
> +               u8 cvt_aspect_ratio;
>
>                 cvt = &(timing->data.other_data.data.cvt[i]);
>
> @@ -3101,7 +3102,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
>                         continue;
>
>                 height = (cvt->code[0] + ((cvt->code[1] & 0xf0) << 4) + 1) * 2;
> -               switch (cvt->code[1] & 0x0c) {
> +               cvt_aspect_ratio = cvt->code[1] & 0x0c;

The temp var doesn't do anything now right? Previously you were using
it in the print, but now you can drop these two hunks, I think?

  -ilia

> +               switch (cvt_aspect_ratio) {
>                 case 0x00:
>                         width = height * 4 / 3;
>                         break;
> @@ -3114,6 +3116,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
>                 case 0x0c:
>                         width = height * 15 / 9;
>                         break;
> +               default:
> +                       unreachable();
>                 }
>
>                 for (j = 1; j < 5; j++) {
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
