Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232063812BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22C36E4AD;
	Fri, 14 May 2021 21:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567E86E4AD;
 Fri, 14 May 2021 21:16:37 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b25so800871oic.0;
 Fri, 14 May 2021 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lN4vxBb7HsrPSthr80bYcbW3xAFTNXZpcixwXqHVjEQ=;
 b=fqQhqaGmX8IZEF+lPDonIGW7PsGpbN3vWiO/z8ZH8X4Oq7VLVfkIIWYpwFlXGLuE2U
 9NerDawBSs7z6VCbqh3IEBxZQEzPkyNlj7uo/Msj4C4wXSDgb3t+JDj573PBM7aKU+ZL
 srPjq0wRCRfQ+qMtPhu3+sZCd6aazv5l7/WmB4rrPiS0hvTPjZC1gJrIcmLtedbnem8n
 Knc7gn+6kRaQxZFz86c2ISEvk2eVm9orH8jIm0LQ/GDpgm6PBxwrutzOWpvocH+4x73v
 Gj4voH1GwHaB9TNMuD3FkP7v8Kpz/5n0NB9pa77ZUqgH+DHrf2X14CZhBrF0X/hAOd4v
 uV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lN4vxBb7HsrPSthr80bYcbW3xAFTNXZpcixwXqHVjEQ=;
 b=DRQ8Mc/ewuLLGsBE2T/I4J9hdpI4v3T+J3g2wan6NdM1vuaazbcs0xixgIKiiYZh1d
 p2PHC9Fimd0XXJPN8BKeiYgJ/L/sStotOqAMjjOIWHwEm7IWprl2Im8VBw/x34O8rXFo
 5afkufOa/YvOjdHjScn6u6VW9K241FYWKaoC0oqvk8vSBn10V9zI6pwnaYl/x1fI7aHs
 2SA9z4AMTgTMbWuEHVfg58ywkJ430p/iVfPOL8MBnCX1K7Z5Ql+6+BYHhwBop9th3rEo
 YN5VNYqwiDA8JmCbxX/revO1DrdVtP0DGeWkh1w8Yu1jp5DirXCP8VFM9y6W2X9F5QIo
 0YVA==
X-Gm-Message-State: AOAM533GRS3lwsMaCAB6fruR1veOWTJNAasZmpIlLBeOpcSOpSlj3w+Y
 mpq2v3kAIfjDuWQ53CvYTJ0x4KQFWexf/52vMspKb8Jw
X-Google-Smtp-Source: ABdhPJxjk9UmFZHxPYf2hfRYYCQLHaSQdkhdv2C0EsFNcsBZ3KhSg5ek6jTnTbPwv44r0/5VUY2jEFuM55BTOdA6JWU=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr35559127oii.123.1621026996584; 
 Fri, 14 May 2021 14:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210514064039.1300558-1-chenhuacai@loongson.cn>
 <b555643f-8369-2eb5-fbea-89e6e9f01435@amd.com>
In-Reply-To: <b555643f-8369-2eb5-fbea-89e6e9f01435@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 May 2021 17:16:25 -0400
Message-ID: <CADnq5_NEKYc7QGNbXONhgzVDrXO-cHc+qPd+n2cPxY3nCC6ecA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE >
 AMDGPU_PAGE_SIZE
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
Cc: David Airlie <airlied@linux.ie>, Yi Li <liyi@loongson.cn>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex


On Fri, May 14, 2021 at 3:18 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 14.05.21 um 08:40 schrieb Huacai Chen:
> > From: Yi Li <liyi@loongson.cn>
> >
> > When PAGE_SIZE is larger than AMDGPU_PAGE_SIZE, the number of GPU TLB
> > entries which need to update in amdgpu_map_buffer() should be multiplie=
d
> > by AMDGPU_GPU_PAGES_IN_CPU_PAGE (PAGE_SIZE / AMDGPU_PAGE_SIZE).
> >
> > Signed-off-by: Yi Li <liyi@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 3bef0432cac2..a376a993e474 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -225,7 +225,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_=
object *bo,
> >       *addr +=3D mm_cur->start & ~PAGE_MASK;
> >
> >       num_dw =3D ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> > -     num_bytes =3D num_pages * 8;
> > +     num_bytes =3D num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
> >
> >       r =3D amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
> >                                    AMDGPU_IB_POOL_DELAYED, &job);
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
