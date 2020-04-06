Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0319FE72
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36816E49B;
	Mon,  6 Apr 2020 19:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506B16E499
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:50:51 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id i3so736930ioo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HN+8QL60vvL9kCpBSbE9fq49Mcbwf74LPWCucZYc7mA=;
 b=B9FOaVqTO+t9lnVPfMPMz/Adln3AhSPXYXjuqMVQ3reEdfCxDmmY6uzxlRmDiPH9pJ
 y/bpog3PifuFFOX1unxdC+wSgxSAxj56kYkUzESy4/YbG15eX8wy0tDhPr8aGNZ267T5
 xLOAP7aJ2agnjB1jHBkT5gtS5jn/nhEoQ4gm4Vlaw+9f90W8wWKSoi4smRo/G2bEi0b0
 Lux6rfQfgad3pDJdYjW2GkRY02XLUJ0C1qjB+XS2zSOILjL5oSDth0o5H/zihn5p4vXv
 jKWUP0X6U1RFeKResnizqbp70IAmVah6nnucDuP0dDgJP6xHiqKZdcFxxhj121UYu7DT
 x26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HN+8QL60vvL9kCpBSbE9fq49Mcbwf74LPWCucZYc7mA=;
 b=hlCkGTeBAVvKMBqLb93nIeKh6qjxBykchV+0qxpCJEd8JVeWQXdMS4Wuj2wdxAscPN
 9gE0U8SGd07I/hXRlCxY2lAmc1BWAtvEygTPSRIcBGe1POxNUPSEmyEVr4uiODbFn1OV
 e6/ukRRb3ZZSRmQyEjHa4FCJ2N0Ehlv7sTuhnrFUCKo9iZ2NoenL/rtZpxfZja44PYZd
 clvRW8lkGS/6/w+Xsqjxsum2F4H4alZrhpc2UlABPi+gJu65bP3LyTYzzEPueiZb/ghC
 m0Wkb/WHahNLPR0fgNYUg5WjHZ2wgkI6z59i0x+9fW+T00fAKoXOPhIMBaWUPennnf4f
 +IQA==
X-Gm-Message-State: AGi0PuaByYusHqepGg6meluCxbEaXpKGY2T/xtQH82Or9b3ExMuwlrHe
 9KQxisuBcuw2qPxJy7oZH1PSYQeX7GE/irblZnKx3A==
X-Google-Smtp-Source: APiQypKcSpO3QRsQOcCPdXSdBaq/JteC6JrsZevb7ueYZYqdRIjuhPUpPJUYg/2yI4JWNu2eYOisAC4GmAbJerXl2qY=
X-Received: by 2002:a02:cce2:: with SMTP id l2mr960339jaq.83.1586202650623;
 Mon, 06 Apr 2020 12:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200403200325.885628-1-lyude@redhat.com>
In-Reply-To: <20200403200325.885628-1-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:50:14 -0400
Message-ID: <CAMavQKKvxrYdi5RfsexT=01KonqEaB-_8VompN4vbexY9gL2mA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Don't drop NAKs for down responses
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 4:03 PM Lyude Paul <lyude@redhat.com> wrote:
>
> It looks like that when we introduced the ability to handle multiple
> down requests at once, we accidentally started dropping NAK replies -
> causing sideband messages which got NAK'd to seemingly timeout and cause
> all sorts of weirdness.
>
> So, fix this by making sure we don't return from
> drm_dp_mst_handle_down_rep() early, but instead treat NAKs like any
> other message.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: fbc821c4a506 ("drm/mst: Support simultaneous down replies")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>

Thank you for fixing this

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 10d0315af513..5449ada3e019 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3813,7 +3813,6 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
>                               txmsg->reply.u.nak.reason,
>                               drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
>                               txmsg->reply.u.nak.nak_data);
> -               goto out_clear_reply;
>         }
>
>         memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
