Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2E1CE8D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 01:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AB76E7F1;
	Mon, 11 May 2020 23:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298F66E7EC;
 Mon, 11 May 2020 23:06:10 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id z1so6709205vsn.11;
 Mon, 11 May 2020 16:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XsOk0fjltEAaptnvoAyKNwWldPrO+GBFD6zagPKDmGg=;
 b=i1YJRV4S86DWpwPvYVT/VVoYL8E5P/S3bt/ZjgntKPbC1w/FBPQH1YdWGKxNW17VBb
 1lFrgb2+vR6y2PiI3i1cKambZ2TJkN18MM5tE6wcPhJ4eRY0hff/pVB2V4LNwQntbdU3
 CWW8VJq4Da7W8u2wb2UP+e1DFz+MERk4yES4VSSvA1u2YbuwTL1dDKsQqxZsConnTheG
 Lc4KV0By8lFs7PW9C/6cRVAvuiR5n76CBk204p1Npm7V5dvg0D8wDqILTDFeYxoQcn9H
 HMoZtd2pJkGnBCbJ55vzZpcrgShd/3Y8VCoHytfm6X9Kz0kXx5WfhZHqw08JX4ZazmCB
 FsfA==
X-Gm-Message-State: AGi0PuYQRZm0OlH3NzLcSs9evEB8p1xkxnKmKzaYiD5O153xyQRaInP9
 HyTAnjXFOFy+v5npuHSWrvbIbGZq1fzNU9Bs17w=
X-Google-Smtp-Source: APiQypKo/KHLOg1rAy+czGJX+lzNM8SR5AyvpY845dOvPV0Ql06/64FQLVBC5d2MCJrmRRgt9Y9fFCvGby21/auV9/g=
X-Received: by 2002:a05:6102:502:: with SMTP id
 l2mr13181954vsa.210.1589238369237; 
 Mon, 11 May 2020 16:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200511224148.598468-1-lyude@redhat.com>
 <20200511224148.598468-4-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-4-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 11 May 2020 19:05:58 -0400
Message-ID: <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support for interlaced
 modes
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 6:42 PM Lyude Paul <lyude@redhat.com> wrote:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 43bcbb6d73c4..6dae00da5d7e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
>                 return get_slave_funcs(encoder)->mode_valid(encoder, mode);
>         case DCB_OUTPUT_DP:
>                 if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
> -                   !nv_encoder->dp.caps.interlace)
> +                   !nv_encoder->caps.dp_interlace)
>                         return MODE_NO_INTERLACE;
>
>                 max_clock  = nv_encoder->dp.link_nr;

You probably meant for this hunk to go into an earlier patch.

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
