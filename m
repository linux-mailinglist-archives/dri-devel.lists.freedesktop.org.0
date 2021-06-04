Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94B39C1C8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 22:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F92A6EDFF;
	Fri,  4 Jun 2021 20:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AF06EB1F;
 Fri,  4 Jun 2021 20:59:22 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x196so10631138oif.10;
 Fri, 04 Jun 2021 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hcL1duf2cmVS2FFozNPUZ6B5aiW4MPId9J+rVmkQUYk=;
 b=Y3QUX1ZAvnl/3ato47zA/tKEluRFWys/uYy3LhRgHryxJy2v3HpkGSBbNRtRMeFYv/
 ygX8EevDFP1KKbg1U2360M0YCC720fLNFdPjNlRkeqlJs1HSqOFPDZRYpiLcy+j2K5+D
 3vcB/6sobewdj640tdMhp4agMFL8k3XJzAE8zJS75Z/gEBQ2vhZeg4dzDb54oBcKxnHt
 OSPTZ0/CaLJlC0rZRtm9tWghIbGTcd8B3KSN+0oTMRrkqzTwqmrIEaOQLT2vgDfkfTeE
 hWPaCj0fH+m2+XE5/THM8CXTNPd73SeWW9RO1wE1eLKtsGrmDRR9bNZ3AV0cZj2ZZ173
 RY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hcL1duf2cmVS2FFozNPUZ6B5aiW4MPId9J+rVmkQUYk=;
 b=A+h+rLspNZxQ3HCxycHKsX5buCu0t6N8jyl8pAH9pdAP9jIVkJ/l2OVjG4BDLbXGzS
 SH5+2WX7czZid/D3PWqls4UIcBoAFZM2fmUaQP0KKUXa3EdpFEOcYqvwTDD14dWfTcJP
 JWUlKKGUZSbyB3PdWXdWS531qdb62lb4seZAaLA6PL2q+rQ3C+XwuAgGHrD1APC77Mws
 lktc/v7ziP+UGEgYsPw17az3H3THb3Ihu2IZuNOuAGfjHGGAL8kHRC9Gw/bVNkSQwH5U
 lObbM31jacoCGtPEJ5O6kFk3AXaDZFjTbnRDOTJVpgWVnlbaUtMcltVbSoaRTJ6oL6e+
 7ZGQ==
X-Gm-Message-State: AOAM532M4yyGlzOLjP+80lfmzudi2Cv0YrD6iP8spb7Z8AgvYYgo4+gV
 bSytNESTLrEa5PZbA/o3Chtz5mYj7mK4/xXJuYc=
X-Google-Smtp-Source: ABdhPJw4eES4VW3g/ubIWR4XRCfecTT650bw+GiTjrYM4m9lJI5z15zWHzNxpYjZfQXlqa9fMW8UX3Esa/xQxythEUs=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr11541621oie.5.1622840361985; 
 Fri, 04 Jun 2021 13:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210603160928.3854180-1-Liam.Howlett@Oracle.com>
 <4d2e62c7-af4c-b977-a05c-97b664b532b3@gmail.com>
In-Reply-To: <4d2e62c7-af4c-b977-a05c-97b664b532b3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Jun 2021 16:59:10 -0400
Message-ID: <CADnq5_Nc_ifTV9mREwnQuNsH8r2LuYELvY3B9SU0Pir+HTQD8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use vma_lookup() in
 amdgpu_ttm_tt_get_user_pages()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Liam Howlett <liam.howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 7:11 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 03.06.21 um 18:09 schrieb Liam Howlett:
> > Use vma_lookup() to find the VMA at a specific address.  As vma_lookup(=
)
> > will return NULL if the address is not within any VMA, the start addres=
s
> > no longer needs to be validated.
> >
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>

I'm fine to have this go through whatever tree makes sense.

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 7cb7ffdd1900..dfb5ca3f8da8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -680,9 +680,9 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *=
bo, struct page **pages)
> >               return -ESRCH;
> >
> >       mmap_read_lock(mm);
> > -     vma =3D find_vma(mm, start);
> > +     vma =3D vma_lookup(mm, start);
> >       mmap_read_unlock(mm);
> > -     if (unlikely(!vma || start < vma->vm_start)) {
> > +     if (unlikely(!vma)) {
> >               r =3D -EFAULT;
> >               goto out_putmm;
> >       }
>
