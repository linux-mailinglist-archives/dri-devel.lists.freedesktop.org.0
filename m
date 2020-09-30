Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A427E106
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 08:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E326E151;
	Wed, 30 Sep 2020 06:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C4B6E151
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 06:26:24 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id dd13so1110832ejb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpYJkmfQmq/eqrWZe3wPVyI3wCv6JXGXRP94UlVnqA8=;
 b=EaobwM2Nnq7Z/o5nQQMax8szygcpm1tYiLc9BKHWxdESlB5rY3s3A020Uv7zfMACup
 Jciiz03OYDTADdcDkVoo9LUjhjy9JIHZ45vdgfMsFOwzGQTiNXIbbNFhJn66oLySVCl2
 y6q4T/oeuZjCLIjVQuL/BWkrDGpr8R4a3wK8u8vG/Q5VRmnrq+ljIRgPpm5ySemUUJJW
 coKMnop7kcULnPjZcvrTEViKM0zulJlCpUGdRlHymYxNe6Xzluy/fF1838iyixggcwF2
 Bhbk+USTD2SdzWSadVuMnWWXps4L2x+jSC++FyQFJW/F6tjnTIeEsl4qtYdf7/1sv0gY
 BvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpYJkmfQmq/eqrWZe3wPVyI3wCv6JXGXRP94UlVnqA8=;
 b=gHMEZaY9x56UWPbA5GN1MgiYj+eqomqexMOwyd3J7JMQXk7HFPVIwmTo0ayVfERe1a
 wsMB1LySxjGG2Mod8uDF9GdhhtepXCqCeKdHQhqveGB3FWgW/LnUgYVGYK2cMDLfs/c8
 NYP0FPdzA0r/VMiz6gXJ9ohI05mpZtEoo/d60ML1UJ427aDZRk54QvtKjAmUoqirMZoz
 engTOPgQzRqu5JR+eiK2zWSURokBRzHvPfp52PaTScBxud/9inVBpVzaJVdpYGVaCViC
 5wIyP40nX3Z/2csvad5SJvjsbyECRa23sLT+0QSMPdsRCqwZcqqjnfkAgjMSs622KNDS
 RISA==
X-Gm-Message-State: AOAM533dopPUbgW6TP9g5KO1WLFwTwSsZ2RyWvXlOKzSX7luBAcznBvx
 V494tU+9OcS/nwo9NT+xVCD733fQbtBxmQn+TGZqa1zW
X-Google-Smtp-Source: ABdhPJzw0kkz8bl+YQzuTdcMDOcYefP9CxZWndqfxNx0delmwAW/6fLesolcKxHcYEEdZiRSzQFZm2HX3J0elGZQfBs=
X-Received: by 2002:a17:906:3aca:: with SMTP id
 z10mr1235571ejd.419.1601447182795; 
 Tue, 29 Sep 2020 23:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200930055459.31310-1-airlied@gmail.com>
In-Reply-To: <20200930055459.31310-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Sep 2020 16:26:11 +1000
Message-ID: <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix regression in ttm moves
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uggh this is part of the mess with the revert, I'm not sure how best
to dig out of this one yet.

Dave.

On Wed, 30 Sep 2020 at 15:55, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This fixes a bug introduced in be1213a341a289afc51f89181c310e368fba0b66
> drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2
>
> On vmwgfx this causes a Command buffer error WARN to trigger.
>
> This is because the old code used to check if bo->ttm was true,
> and the new code doesn't, fix it code to add back the check resolves
> the issue.
>
> Fixes: be1213a341a2 ("drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 70b3bee27850..e8aa2fe8e9d1 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -251,9 +251,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>                 /* Zero init the new TTM structure if the old location should
>                  * have used one as well.
>                  */
> -               ret = ttm_tt_create(bo, old_man->use_tt);
> -               if (ret)
> -                       goto out_err;
> +               if (!bo->ttm) {
> +                       ret = ttm_tt_create(bo, old_man->use_tt);
> +                       if (ret)
> +                               goto out_err;
> +               }
>
>                 ret = ttm_tt_set_placement_caching(bo->ttm, mem->placement);
>                 if (ret)
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
