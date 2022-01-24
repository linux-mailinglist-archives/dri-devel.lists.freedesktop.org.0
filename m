Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81D498C18
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC42D10E770;
	Mon, 24 Jan 2022 19:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1BC10E670;
 Mon, 24 Jan 2022 19:20:09 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id w133so250902oie.7;
 Mon, 24 Jan 2022 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8UlOKPL4x0I+w9FvmczKZQzjM11WitOpHu1NnDd7hI=;
 b=EIvsCF/shkSJKYfdjXZKNXCsVd70UCSlAARnO6sDbsxiWBHwhD/82BOJnQrXDl9IOz
 PFcMdh5ibyXsaAQcTPODkOpuxlRpW6Ykx3+iaL0mfu3o/5TQuzEDx8ce/CsAPrzpsBH0
 Aq1xw2ZjdD9sgudMll8flbupKTmKPw8pARBNeIt/gt3ZmOXc0U4ez/5KDdbtmSmdJ/cY
 A7Z4/te+96euwxEnd8/NJBr/0001w5zlvvzIJi/j/otI7/zc1nWeoYlU4o4Pp+0rrOEb
 sMg62TePWcfT120HGmcpZPJ+W8BC4DVZ60OxaL1hE3s2BVUOxqLUUgtgRqjyoHlrl8LB
 UFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8UlOKPL4x0I+w9FvmczKZQzjM11WitOpHu1NnDd7hI=;
 b=0n1RkfvpbPlS/6gfZ/IigSB2gwPL1hOUFRFw8s1MYjr6peb0nGSRRLmoJtdkvRQqwP
 dVlh8t0R/P8D7TGJKiy2JW7+uO+gFBItNgSYqDVs7XdcFW3NqbOB9fSVfsmgVRY6x6US
 fD499o7CGaWygmTXe/hZeLG6buDJuSstNRdHQb5lTZx8/F6qOojZZqqsXVILnX8RcMfD
 Hh39PfYH4QPItun63sMv0ztrOgdw+SdIVsChHFpFGUvtPLciLHJWMvEc4Pm8Er8Ui6bw
 ZOMziy34WNtpelJNEHhYr7bvbpq3sV5H5605FTCML8hiEIXjA3nWY3vPVbsxtMZI8tmo
 xSZA==
X-Gm-Message-State: AOAM533pwcdPR6NqyBgAvdRfpAZmZZqcGG1nHLYJJRMjRivYaHtq7m2/
 cz6kfO/rVRDKjZIHMewcJ4s6gQuEBZq4Yaye/Ew=
X-Google-Smtp-Source: ABdhPJwS85QtnAAmIxiRJFhdMAqQlvW1zcZquOPGUFZLskhO60Qo5Zms8Ge28nzBDwYGw0SYuP/P8X5DerGCwVBWtfo=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr2766540oib.120.1643052008712; 
 Mon, 24 Jan 2022 11:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20220124165552.56106-1-zhou1615@umn.edu>
In-Reply-To: <20220124165552.56106-1-zhou1615@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 14:19:57 -0500
Message-ID: <CADnq5_MPvHgnW-Rpv-caNrgg+9XkVFZs2Oes1gKPyj=TesBKXw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display/dc/calcs/dce_calcs: Fix a memleak in
 calculate_bandwidth()
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
Cc: Leo Li <sunpeng.li@amd.com>, Kangjie Lu <kjlu@umn.edu>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 12:05 PM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In calculate_bandwidth(), the tag free_sclk and free_yclk are reversed,
> which could lead to a memory leak of yclk.
>
> Fix this bug by changing the location of free_sclk and free_yclk.
>
> This bug was found by a static analyzer.
>
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: 2be8989d0fc2 ("drm/amd/display/dc/calcs/dce_calcs: Move some large variables from the stack to the heap")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent
> security operations (e.g., checks or kfrees) between two code paths
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
>  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> index ff5bb152ef49..e6ef36de0825 100644
> --- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> @@ -2033,10 +2033,10 @@ static void calculate_bandwidth(
>         kfree(surface_type);
>  free_tiling_mode:
>         kfree(tiling_mode);
> -free_yclk:
> -       kfree(yclk);
>  free_sclk:
>         kfree(sclk);
> +free_yclk:
> +       kfree(yclk);
>  }
>
>  /*******************************************************************************
> --
> 2.25.1
>
