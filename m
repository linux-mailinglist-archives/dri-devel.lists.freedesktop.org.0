Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D760E3D0AFF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACBA6E851;
	Wed, 21 Jul 2021 09:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A3F6E851
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:12:31 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t6so2250348oic.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yk0pURgu+qIZuk7Nbm3QZWwdVQxw26haEZdX4DxRtQo=;
 b=KshUNjkVZkOw/Hb1O9itdD1JHY0uOQQhG/8EPRsl597CR91dAvieYPXjTjnlzX1DPi
 V2MMs8InEPukBGQmtW+Ri38bq7HGDyoTTL3HCRwS5ulFxx4H0vEaTA/J4qTNHCODViAd
 txZNqfywHTNYytUDwYb/vmrJqqLGAsoKHsBa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yk0pURgu+qIZuk7Nbm3QZWwdVQxw26haEZdX4DxRtQo=;
 b=MhP775l60XEEIRYztqiq4r7pDpaLqru7aoY/DF4DPPYk8p0R51B9BhkeH+2LbAtHJd
 Cyre/a4rrsRsb0SoED14/qXBByTdi+UJ5MC0nWtyUZNu+pEZv8QqkERRyzmnKbjPxnmr
 7welPZsPaDl3MrnKp2jFl0taGhYGPbrCy/BvlARBjpinGOO/xXrGvfZBHSKQYy0A9GjN
 ifrJGya6g9YkFX3D/QO0nW2QShVcSYEDWvQutQRvcmSEV6ZL6A+v670T1xSFt1CBxTpT
 L1El8XIj/fmPtlEJ8PmmFWrOqskXKSRb9CMf4Xrr2asrnIVDCfIgedhpuRdY3r+BS/1i
 LZFA==
X-Gm-Message-State: AOAM530S6Dl0ourYQJsxJQi8EzzwhCivafRAM+ZZkHmg2hOnGAIVO9Lr
 QzOBj5ud+KO8JaCbAxQ59Q6lFEwKLYhMdIsarkCB9Ra50Z7zpw==
X-Google-Smtp-Source: ABdhPJxyC2cVRm/X6VHhXUIc3dYl04Y6cXhr68BzX7L1h9a4CNz6rxR+pQuNsty36yHvKNZ6KwiWFmOrMnolRR48Qc4=
X-Received: by 2002:aca:b902:: with SMTP id j2mr24571899oif.128.1626858750655; 
 Wed, 21 Jul 2021 02:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-5-jason@jlekstrand.net>
 <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
 <CAKMK7uGjaHes1U+h7-8GTx1rPVBGBJz5dJw7=Nhh5WEUJG1Yqw@mail.gmail.com>
 <acfefe81-1eae-af52-c045-1d2c1dcb162a@amd.com>
In-Reply-To: <acfefe81-1eae-af52-c045-1d2c1dcb162a@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 11:12:19 +0200
Message-ID: <CAKMK7uE1c=nhY9JNpLhky=ty4OXYfM3wcLi6EMhhVSH=otKagg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: Force re-init if
 ttm_global_init() fails
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 11:08 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 21.07.21 um 11:06 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 8:36 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 20.07.21 um 20:13 schrieb Jason Ekstrand:
> >>> If we have a failure, decrement the reference count so that the next
> >>> call to ttm_global_init() will actually do something instead of assum=
e
> >>> everything is all set up.
> >>>
> >>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>> Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> I've just pushed this to drm-misc-fixes.
> > Did you see patch 5/6 here which is also touching ttm?
>
> Nope, neither with my AMD nor with my GMail account.
>
> Looks like something is wrong with the distribution of mails over the
> mailing list for a few days now.

Ping admins on #freedesktop on oftc, they can usually chase where
mails are stuck. It works all fine for me, but I've seen you complain
that you didn't get all the msm patches too, so figured better I
highlight in case it's lost.

> Going to double check patchwork.

https://lore.kernel.org/dri-devel/20210720181357.2760720-6-jason@jlekstrand=
.net/

Cheers, Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Thanks,
> >> Christian.
> >>
> >>> ---
> >>>    drivers/gpu/drm/ttm/ttm_device.c | 2 ++
> >>>    1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/t=
tm_device.c
> >>> index 5f31acec3ad76..519deea8e39b7 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >>> @@ -100,6 +100,8 @@ static int ttm_global_init(void)
> >>>        debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_ro=
ot,
> >>>                                &glob->bo_count);
> >>>    out:
> >>> +     if (ret)
> >>> +             --ttm_glob_use_count;
> >>>        mutex_unlock(&ttm_global_mutex);
> >>>        return ret;
> >>>    }
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Fintel-gfx&amp;data=3D04%7C01%7Cc=
hristian.koenig%40amd.com%7C05ff233273a54b987b6b08d94c26d0ac%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637624551867495341%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D70RYQ49Q58VED5jMpJ%2FW9Vy5imUndghFS0tQWIeD7dk%3D&amp;reserved=3D0
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
