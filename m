Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AEF3D0AF4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F16E8F2;
	Wed, 21 Jul 2021 09:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA846E861
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:06:24 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so1446045otl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vbpSdcWmIY+7r9fq9wV0Y0tg1sXtpdB2EkkXyx4/kCY=;
 b=cg7Inx34ukIGeHvO4NDJ000KDZTFqYb3n9e/bS//3XfGNhypQgwqzlne/6EEwMNAsD
 XSDqI82eSOsiLJksHJ0mMzKaNRgKWY0kXOrmu2e+gmSkDlak1jv2tugs1wI1nrDcxyfa
 E4jxGaGaxx1B+iJpoyEqP5uMVAmatvi6C13OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vbpSdcWmIY+7r9fq9wV0Y0tg1sXtpdB2EkkXyx4/kCY=;
 b=kZskkk2632W7wKAfJO2yIXXwsZLoES4rIGE72NJhyHfeNqAHABEEUZ9fv/lIoKVyYo
 DNqr8E4otvyPhLsTGJ6id88lFu189kf3EdR3jHP/z1qus8cU5FnzjTspGLQTOejxW3mY
 H1bqxXBuPBUuiR6IvZmN9StZoYabpuDzbmKJAgQTEASqJecdluZ7PNUXeDW7vjfBaMyG
 oUKOo8oCPAoHDCuZUrlVTsYO6LUAsTmKe+KM9UxHlR6Ietou/XBHjIvaVQ/y6P89eiej
 7dm0zxAX7dBAIlaJG+i78/ua9fvM/7rOiC7HHKKoX5sk21BVR/14/tyYIJ2SzfON573Q
 tg/A==
X-Gm-Message-State: AOAM532s4M50ke4q8CO68+6yomvoNVU2+6Tlwg/diZg1JXd5uiXPSapO
 h/0G/sqHaTgZ368bwmrmvzP7ao1zeV5Ap+yTuaGufA==
X-Google-Smtp-Source: ABdhPJyFr2+NmX8zM8mNYprI/bXbf5nV9Pn3jlKU0aAdhbsK6eiFr6kIyN1LFI3V2PANdj0e0pTwEtGPxTtvHTcMWns=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr24210677otu.303.1626858383358; 
 Wed, 21 Jul 2021 02:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-5-jason@jlekstrand.net>
 <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
In-Reply-To: <8c6a14f1-5b42-bca2-ee59-7274667e794c@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 11:06:12 +0200
Message-ID: <CAKMK7uGjaHes1U+h7-8GTx1rPVBGBJz5dJw7=Nhh5WEUJG1Yqw@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 8:36 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 20.07.21 um 20:13 schrieb Jason Ekstrand:
> > If we have a failure, decrement the reference count so that the next
> > call to ttm_global_init() will actually do something instead of assume
> > everything is all set up.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> I've just pushed this to drm-misc-fixes.

Did you see patch 5/6 here which is also touching ttm?
-Daniel

>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/ttm/ttm_device.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> > index 5f31acec3ad76..519deea8e39b7 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -100,6 +100,8 @@ static int ttm_global_init(void)
> >       debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
> >                               &glob->bo_count);
> >   out:
> > +     if (ret)
> > +             --ttm_glob_use_count;
> >       mutex_unlock(&ttm_global_mutex);
> >       return ret;
> >   }
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
