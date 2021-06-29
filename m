Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071823B7427
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 16:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19146E883;
	Tue, 29 Jun 2021 14:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7B36E883;
 Tue, 29 Jun 2021 14:17:49 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so908793otp.1; 
 Tue, 29 Jun 2021 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ca9b/RJBp6vFH4Z8SWl5H4/Izby04wi57Lwxa0JLyrs=;
 b=LJcaYPROk5PS/GO/KmuD4NNz/hB69mF5BLuqEZWjNJWkR5tss9yy9ob8LNmQ0LpHx1
 T4l5ruxUNJFzXKNKUranp6fvbr8bOuweBUVqf2n95m5si7ScYTzb9eueYMIxKM5Hr+Lr
 S6aL7we9LHKVCL5ydwi2O/GZMoFkOoil/SS2VmTT+U+fscM2Ha+KkT9h2gUP3MszFcqr
 k4Tk2mF6jo2Z66LFTKa4FaPa2z8hPSrDBkGmea7ufgDwLTt0d0sgAIMIBRKpea0LGo0D
 nS46tCP0MwkKsNKZfuIKLq2YBilWRgI+ywIim2+1pgg981yp4r/twiVowE88w9Nceb4D
 0grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ca9b/RJBp6vFH4Z8SWl5H4/Izby04wi57Lwxa0JLyrs=;
 b=j/1zuczGSoYju5s10P0ZvG/6M7BlaQp9jUPjjvaSA4/9L/9Y2fPeXpI5m/LPIQFEfM
 7W/9cI4xpdLXFusCGAJlLvs6RduHBKmEXCkc/P8Z2abloT03uI2DKlCKtIzSUeAOR8jX
 HtIjBJMMmyUPO5BwAEcR+c1EbzZZ9VmI5S6S8KDQkWdw9CPeBmx1p8nQo+kdiejZSUuO
 INBj9SLAPQT5JfR57hqDvcNleGKh0saLw2i3ltxSG0XeiQpShuRnUtVZaMW9hSN2s86D
 VvQU3tus5oqHJyElo1MSBnNt5thYOMfw2X1KXStLHFCuzMZCQMvEUZblhoq3MmwKuiof
 96iA==
X-Gm-Message-State: AOAM530O7bM5VdG47aKF2LFatbM2+M89sRB6C/V4BKC5dxldVPoTkjpe
 WtyOIYoyq/zVrQJbH4XDxSx7ql58V4f3hcp7nho=
X-Google-Smtp-Source: ABdhPJw2CJEKzgyewXcuEZEPTcfsz3H8f6me+j7nAF4nXArSiuFEdABdhNogjc6cwbt9NfbqjiN/eba0bUuDjcZfZyg=
X-Received: by 2002:a05:6830:33ef:: with SMTP id
 i15mr4672446otu.311.1624976269048; 
 Tue, 29 Jun 2021 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210629114455.12963-1-jingxiangfeng@huawei.com>
 <5ff91e15-6014-bc72-40ca-3fa8b834f692@amd.com>
In-Reply-To: <5ff91e15-6014-bc72-40ca-3fa8b834f692@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Jun 2021 10:17:38 -0400
Message-ID: <CADnq5_P0whWU-j3ZasO2hUYLWQEy7v=2jtc7hOisfgALu84xsw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/radeon: Add the missed drm_gem_object_put() in
 radeon_user_framebuffer_create()
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jun 29, 2021 at 7:42 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 29.06.21 um 13:44 schrieb Jing Xiangfeng:
> > radeon_user_framebuffer_create() misses to call drm_gem_object_put() in
> > an error path. Add the missed function call to fix it.
> >
> > Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>
> I'm pretty sure that I already reviewed the same patch a few weeks ago,
> but it looks like it never went upstream.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Maybe add CC: stable as well?
>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_display.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/=
radeon/radeon_display.c
> > index 652af7a134bd..1d03ec763604 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -1325,6 +1325,7 @@ radeon_user_framebuffer_create(struct drm_device =
*dev,
> >       /* Handle is imported dma-buf, so cannot be migrated to VRAM for =
scanout */
> >       if (obj->import_attach) {
> >               DRM_DEBUG_KMS("Cannot create framebuffer from imported dm=
a_buf\n");
> > +             drm_gem_object_put(obj);
> >               return ERR_PTR(-EINVAL);
> >       }
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
