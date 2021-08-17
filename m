Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20EB3EF2E0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 21:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300FA6E23D;
	Tue, 17 Aug 2021 19:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E06F6E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 19:51:02 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id u25so823567oiv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 12:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aH8kiZHQo4ykBGSH0OeOVEbkxy6LmH/cnZcASLEdFHk=;
 b=bDneQIbhjh+E0GFiFBJZTMgeYiiJrqRiEDB5la2AsSY/SWC2RG+3epNj7N9K6hO1ET
 P4qdcs74FGh/4zQvK3pcTUUhmOyYOp78FRRijjBBSNCcqBsbkiqYkVreWPYNvxJNfn8H
 jXJC+Vc0dcW/JDzttxmE6/oxG9OyWg2YZD3UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aH8kiZHQo4ykBGSH0OeOVEbkxy6LmH/cnZcASLEdFHk=;
 b=OCWDyiamQ90fsvqOGPXM0IcdAZfAZ8dL3c3AZ07Jwvq8r6qE4aOEExe3eMi+06tzdT
 33LMhJcj7aow3NO4+hSp70I3X23eWMzQIHti+CrDcv22JPJnOdUaOfihRZdfMsdtFJNj
 DgbwIccM4Ef34tKiOWo0q2gQjAp0rNCnk2Tx/eLhRDuHn3pDFSxB5asnSxrf+2sSDd8H
 soDmPNxgxLkldJQZd4uTmXDD4/k+7svzklvCs49zmwdsbKNVWUykikmW0CGUVjjQGc1Y
 a8HfzHMchaJ2B6OgEH0t+jht5xF2EA/VPxEv10fct2uAcYuZidpWszoB3qIJ/cKpW+hi
 NQTg==
X-Gm-Message-State: AOAM532uoGip84sMbjA62S2fgB1R4BIez0pv1hwLCBo64P+GZSXGdJCY
 vrmZWFVU35OQysBYEl6L9EjjxwgxdhFg1pzejI0LbA==
X-Google-Smtp-Source: ABdhPJwQzUgtNIDIcTfQPnvqetDnsUEXnR/n1FTP9SD6/moBtL285+VlF09of0/9u25AOD8kkBRoYw8ae96xrtvQT5A=
X-Received: by 2002:a05:6808:2116:: with SMTP id
 r22mr3931588oiw.128.1629229861589; 
 Tue, 17 Aug 2021 12:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210817181626.30230-1-tzimmermann@suse.de>
In-Reply-To: <20210817181626.30230-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Aug 2021 21:50:47 +0200
Message-ID: <CAKMK7uGikc9pPQDUcimEwN1+cYo+j9pRt11ctGoUL-vz-GN6+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Initialize delta variable in PLL compute
 function
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 kernel test robot <lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 8:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Initialize delta variable in PLL compute function for G200SE, rev 00 to
> the maximum value. Fixes uninitialized usage.
>
>   smatch warnings:
>   drivers/gpu/drm/mgag200/mgag200_pll.c:142 mgag200_pixpll_compute_g200se_00() \
>   error: uninitialized symbol 'delta'.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct mgag200_pll")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I checked a bit your integer types, and there's a fair bit of
inconsistency for what you're using for clock. unsigned int, long, int
can all be found somewhere. But that's  different story.
-Daniel

> ---
>  drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/mgag200/mgag200_pll.c
> index 7c903cf19c0d..e9ae22b4f813 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_pll.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
> @@ -124,6 +124,7 @@ static int mgag200_pixpll_compute_g200se_00(struct mgag200_pll *pixpll, long clo
>         unsigned int computed;
>
>         m = n = p = s = 0;
> +       delta = 0xffffffff;
>         permitteddelta = clock * 5 / 1000;
>
>         for (testp = 8; testp > 0; testp /= 2) {
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
