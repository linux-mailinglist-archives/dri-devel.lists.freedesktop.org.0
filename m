Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0B18EF89
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 06:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C0289E0C;
	Mon, 23 Mar 2020 05:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A9889E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 05:39:46 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id o3so8000436vsd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Mar 2020 22:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GRo4HHIUTPgNm8ueK5+i+1xIqc1hi+zakHLxHQ8oOuE=;
 b=TOJgTaE/4KSKG6uVoWVoFffozuXRwC5yWE3h5AsumI99BakD8uHX0jIxizzYcDeggF
 Xg0y1DsT430uc3e8eO8HqsFM4+OgfmtViWZuOLpNX0lI0cRZgH02C4ZLttMTJWkXgLdy
 dVI4TtlrflyAFp6wBwZlM9HOUQen5NnbXOS8+Hv7mrAwX2HnuTK5xKJGRFiBUn8xdYyz
 DI1g9fPspxDo7PCMZ2rp3KVSVT6s3+5MhLvNR1hee9HYcp+PnB6ptt0QUizqGjBKeUFa
 y44wBodLRis+jJ96pDbh0p2L25Zjrzo7zh1hoqnOeODiMYxmCvNp40w2E5pdoInQh15r
 VUhw==
X-Gm-Message-State: ANhLgQ0FRn/UvIuzovXHxO7S+MGLTE3v96bsys2OPvvKLLifdGPUP4+N
 8kpGwJoRReb5SOBGm9JP5zQZCljIIB9tUtaaLqs=
X-Google-Smtp-Source: ADFU+vsPgq6MAEm87FaJ3bbKFifpMExMb6rLCTEYWlAf+syRbM2wEPrpIr30CvTwiYu0KfS//D7/iC4B0An+Mym9KzU=
X-Received: by 2002:a67:d613:: with SMTP id n19mr15062568vsj.207.1584941986031; 
 Sun, 22 Mar 2020 22:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <1584447077-22539-1-git-send-email-rohit.visavalia@xilinx.com>
In-Reply-To: <1584447077-22539-1-git-send-email-rohit.visavalia@xilinx.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 23 Mar 2020 01:39:34 -0400
Message-ID: <CAKb7UvgBx6bf6=Y7djDHF9_U_93hVKbqJec_ma_H=-Zc4wWD2A@mail.gmail.com>
Subject: Re: [PATCH libdrm] modetest: set_gamma only if CRTC supports gamma
 property
To: Rohit Visavalia <rohit.visavalia@xilinx.com>
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
Cc: Ranganathan Sk <rsk@xilinx.com>, Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Devarsh Thakkar <DEVARSHT@xilinx.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not an enormous fan of what you had to do in atomic_set_planes, but
OTOH I don't see a much better way to do it either.

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>

On Tue, Mar 17, 2020 at 8:11 AM Rohit Visavalia
<rohit.visavalia@xilinx.com> wrote:
>
> Current implementation shows error as "failed to set gamma: Function
> no implemented" if platform specific drm has no gamma property implemented
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> ---
>  tests/modetest/modetest.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index b907ab3..23ee73d 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -1328,14 +1328,24 @@ static int set_plane(struct device *dev, struct plane_arg *p)
>  static void atomic_set_planes(struct device *dev, struct plane_arg *p,
>                               unsigned int count, bool update)
>  {
> -       unsigned int i, pattern = primary_fill;
> +       unsigned int i, j, pattern = primary_fill;
> +       struct crtc *crtc = NULL;
>
>         /* set up planes */
>         for (i = 0; i < count; i++) {
> -               if (i > 0)
> +               if (i > 0) {
>                         pattern = secondary_fill;
> -               else
> -                       set_gamma(dev, p[i].crtc_id, p[i].fourcc);
> +               } else {
> +                       for (j = 0; j < dev->resources->res->count_crtcs; j++) {
> +                               if (p[i].crtc_id ==
> +                                   dev->resources->res->crtcs[j]) {
> +                                       crtc = &dev->resources->crtcs[j];
> +                                       break;
> +                               }
> +                       }
> +                       if (crtc->crtc->gamma_size)
> +                               set_gamma(dev, p[i].crtc_id, p[i].fourcc);
> +               }
>
>                 if (atomic_set_plane(dev, &p[i], pattern, update))
>                         return;
> @@ -1522,7 +1532,8 @@ static void set_mode(struct device *dev, struct pipe_arg *pipes, unsigned int co
>                         return;
>                 }
>
> -               set_gamma(dev, pipe->crtc->crtc->crtc_id, pipe->fourcc);
> +               if (pipe->crtc->crtc->gamma_size)
> +                       set_gamma(dev, pipe->crtc->crtc->crtc_id, pipe->fourcc);
>         }
>  }
>
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
