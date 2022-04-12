Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0505C4FE43F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 16:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F510E563;
	Tue, 12 Apr 2022 14:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483610E563
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 14:58:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so3325143pja.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KYagNUqIHqgU+oqSymMfranRvWhd+BPAcvJm6l98bo=;
 b=awdtt9Hf21fMcRZ78eX5oVsqrqUW1p1VOYv03F6tpNRABDCzSJnErPFiztxbDjHJUM
 Cy4jviQ653fnSpmibuVNXJ2pxrekXka+OXdgEBl+ZgY+r80nbShXvpOHKYn857b90Bdw
 dyGLb34y9P6YDmQ3YYXhuGjyubgtf3HE9mOfNzr9Q2aBkpMLqSaTES1ym3SJvqWEjEqe
 2Klh4lg9uOxqMkEaRJsNQlw4yL1C5GhF0l7X0l1Rd+OUsVCUhJOSejBihBEYjTQU0APV
 MC1SaadM2QTE/rxpChY4ukl5m96OTCaTLUSbzIaTP885lL76cyEHHWcu27BYxRSEnywu
 bSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KYagNUqIHqgU+oqSymMfranRvWhd+BPAcvJm6l98bo=;
 b=7d4QOzSuNP8gsb9ujIZk0TA1RJ28QlZJyfwDxd6peVDi2lqHGMCTOQXBZU//SQgYhY
 0YSkTAIzC7rtvL28pkSfjpehp6qEQJiZ/TXED4FVQXseenx3ktAm4sr68VbtwXasRRyB
 QQh+qd8gfqvDCnF77AVS90MNQbfYFsAdHnMj5wU99Gis9tP89zVNPfUDsA1ZCHgHB9sN
 SJ6/U3JpGFvC62D+KKwEisGJey9mAEsLPW82CtQQxIz/w/CxA+pYXXMf0OVW2yJnIENg
 SSPOWEhdJoBcsVjOWISYhi5GSvvX4PA5Ugwo+43BqX7kHNzmDTfewmHL1r6opJ2bcYE3
 uDuA==
X-Gm-Message-State: AOAM531VBLjIDryUez5rOTzxvi/yWBE1ZYvROqqhhbh5DkYQGp9Vc0gN
 ucHMC7W9dE+AlULRHSfUtiLdzPPizmMcXBSkENewD1IZ0mA=
X-Google-Smtp-Source: ABdhPJwkiC9k1PbeBB367CzB05gEtaV0BIJKzMnZMt+yV+mv8Bhp09l/IBDwVxerNUO1DNXnq+jbISIjT7ihyVabYZ8=
X-Received: by 2002:a17:90a:1c96:b0:1cb:1ae2:85a3 with SMTP id
 t22-20020a17090a1c9600b001cb1ae285a3mr5419500pjt.233.1649775516457; Tue, 12
 Apr 2022 07:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220406113143.10699-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220406113143.10699-1-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Apr 2022 16:58:24 +0200
Message-ID: <CAMeQTsaXM-ddGLukxuEJvm+0UtuJEZGL_5KEY8h9ZPH-ZxmBsQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gma500: fix a potential repeat execution in
 psb_driver_load
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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

On Wed, Apr 6, 2022 at 1:31 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. To
> avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> goto outside the loop when the entry is found.
>
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>
> changes since v1:
>  - goto outside the loop (Xiaomeng Tong)
>
> v1: https://lore.kernel.org/lkml/20220401115811.9656-1-xiam0nd.tong@gmail.com/
>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 2aff54d505e2..929fd47548b4 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -400,9 +400,10 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>                 case INTEL_OUTPUT_LVDS:
>                 case INTEL_OUTPUT_MIPI:
>                         ret = gma_backlight_init(dev);
> -                       break;
> +                       goto out;
>                 }
>         }
> +out:
>         drm_connector_list_iter_end(&conn_iter);

Hi,
This would work but using gotos like this easily turns the code into
spaghetti. See "7. Centralized exiting of functions" in
Documentation/process/coding-style.rst for when to use gotos.

In this particular case I think we are better off using an
if-statement. What about something like this:

if (gma_encoder->type == INTEL_OUTPUT_LVDS ||
    gma_encoder->type == INTEL_OUTPUT_MIPI) {
        ret = gma_backlight_init();
        break;
}

-Patrik

>
>         if (ret)
> --
> 2.17.1
>
