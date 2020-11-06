Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8692A8B15
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 01:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091BB6E877;
	Fri,  6 Nov 2020 00:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3216E877
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 00:03:15 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id w25so1775762vsk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 16:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/n5bGNWUgGwgtLJXyhksEsov5olwu/i3xw5cfFWm5Bw=;
 b=HZqBcaYhzH+n5tEfRP9h+EHu8qAfL614sS1XSs/cVFPhutuuMhjvBmvHYjHXHbVQIg
 FIzwCBHTBv0rSOrJMlxXtcbVevPvQOgp/1z+qujz637JpZgS5bSVGbPTLoj07CCJY6f3
 WE77aXxOVCeq9vkGAAp7s/eT/kbqVmM6SDlK7/udaUMyxOI/CtwlV2kmPJiXZ4VvlDiH
 N6Usw2SjhDaHTsfzrMfiwOHRl+60FJLbiXytz78cKC2Dc0Htt7H5QJBlMHRYGpDXDq+l
 ZlFg9wflqAHKHKaMVRM9ScIS2U0Z/ZpHrrdUFEO6YmT2Qw00mCgF1lIXClTBKj5XtJv7
 IhRA==
X-Gm-Message-State: AOAM532o7nKn44MxelDKAZchin5kghQiK9MJhIG3ufMQJJFKANEW7E1C
 dDXZT90IPQVCZ7FWNfOGDw80+4I94i3/8htmfmQ=
X-Google-Smtp-Source: ABdhPJxeu1wo+9SUw0cGWms8KkbE4h/4REgitgjq3ayBlwXKEc28MRmRP4pkpI7tt60lqqTAS22g3EG4J7GdRBbsjlI=
X-Received: by 2002:a67:f699:: with SMTP id n25mr3266271vso.52.1604620994955; 
 Thu, 05 Nov 2020 16:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20201105235703.1328115-1-lyude@redhat.com>
In-Reply-To: <20201105235703.1328115-1-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 5 Nov 2020 19:03:03 -0500
Message-ID: <CAKb7Uvi3xr9GbuNbyQLtow5THAh25jw0CGUVLmJUtdEnfYUgYg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/edid: Fix uninitialized variable in drm_cvt_modes()
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

On Thu, Nov 5, 2020 at 6:57 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Noticed this when trying to compile with -Wall on a kernel fork. We potentially
> don't set width here, which causes the compiler to complain about width
> potentially being uninitialized in drm_cvt_modes(). So, let's fix that.
>
> Changes since v1:
> * Don't emit an error as this code isn't reachable, just mark it as such
> Changes since v2:
> * Remove now unused variable
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Cc: <stable@vger.kernel.org> # v5.9+
> Fixes: 3f649ab728cd ("treewide: Remove uninitialized_var() usage")
> Signed-off-by: Lyude Paul <lyude@redhat.com>

For the very little it's worth,

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>

> ---
>  drivers/gpu/drm/drm_edid.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..b84efd538a70 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3114,6 +3114,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
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
